package io.github.emotionbug.patches.adot

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.apksig.ApkVerifier
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.google.gson.JsonParser
import com.reandroid.apk.ApkModule
import io.github.emotionbug.patches.adot.ads.BannerAdsPatch
import io.github.emotionbug.patches.adot.compatibility.ManufacturerCompatibilityPatch
import io.github.emotionbug.patches.adot.dex.DexInstructions
import io.github.emotionbug.patches.adot.dex.MethodPatch
import io.github.emotionbug.patches.adot.dex.OriginalDexBinding
import io.github.emotionbug.patches.adot.privacy.AnalyticsSuppressionPatch
import io.github.emotionbug.patches.adot.privacy.GalaxyDeviceProfilePatch
import io.github.emotionbug.patches.adot.recording.ConnectionEligibilityPatch
import io.github.emotionbug.patches.adot.recording.EmbeddedRecorderPatch
import io.github.emotionbug.patches.adot.recording.RecorderStartupPatch
import io.github.emotionbug.patches.adot.recording.SettingsEligibilityPatch
import io.github.emotionbug.patches.adot.recording.SettingsEntryPatch
import io.github.emotionbug.patches.adot.security.*
import io.github.emotionbug.patches.adot.summary.LocalGemmaSummaryPatch
import io.github.emotionbug.patches.adot.summary.NativeSummaryPersistencePatch
import io.github.emotionbug.patches.adot.summary.NativeSummaryNotificationPatch
import io.github.emotionbug.patches.adot.summary.CloudMonoUploadPatch
import org.w3c.dom.Element
import java.io.File
import java.nio.file.Files
import java.security.MessageDigest
import java.util.zip.ZipFile

private const val PACKAGE = "com.skt.prod.dialer"
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private val target = Compatibility(PACKAGE, "ACall", targets = listOf(AppTarget("14.4.0", 14409)))
private val dexEntry = Regex("classes[0-9]*\\.dex")
private val originalApk = filePathOption(
    key = "originalApk", title = "Original APK or APKM", required = true,
    allowedExtensions = listOf("apk", "apkm"),
    description = "Exact original, signed ACall 14.4.0 (14409) APK or APKM. Select a local filesystem path, not a rebuilt APK."
)

private fun validateTarget(metadata: PackageMetadata) {
    check(metadata.packageName == PACKAGE && metadata.versionName == "14.4.0" && metadata.versionCode == "14409") {
        "These patches require original $PACKAGE 14.4.0 (14409); selected ${metadata.packageName} ${metadata.versionName} (${metadata.versionCode})"
    }
}

private fun state(workspace: File) = workspace.resolve("adot-session")
private fun snapshot(workspace: File): File? = state(workspace).resolve("original-path").let {
    if (it.isFile) File(it.readText()) else null
}
private fun payload(name: String) = EmbeddedRecorderPatch::class.java.getResourceAsStream("/payload/$name")
    ?: error("Missing embedded payload: $name")

/** Every Adot entry depends on this: validate the immutable original before any edits/extensions. */
private val originalResources = rawResourcePatch {
    execute {
        validateTarget(packageMetadata)
        val state = state(fileWorkspace)
        state.mkdirs()
        // Only this patch-owned state is reset; the shared workspace is never deleted.
        Files.deleteIfExists(state.resolve("original-path").toPath())
        Files.deleteIfExists(state.resolve("embedded").toPath())
        val selected = try { originalApk.value } catch (_: OptionException.ValueRequiredException) { null }
        if (selected != null) {
            val original = OriginalApkSnapshot.create(selected, fileWorkspace.toPath()).toFile()
            check(ApkVerifier.Builder(original).build().verify().isVerified) {
                "Original APK signature is invalid or missing. Select the untouched signed vendor base APK/APKM."
            }
            ApkModule.loadApkFile(original).use { module ->
                val manifest = module.androidManifest
                check(manifest.packageName == PACKAGE && manifest.versionName == "14.4.0" && manifest.versionCode.toString() == "14409") {
                    "Original APK does not match ACall 14.4.0 (14409)"
                }
            }
            ZipFile(original).use { zip ->
                val nativeEntries = zip.entries().asSequence().filter { !it.isDirectory && it.name.startsWith("lib/") }.toList()
                val current = listApkEntries("lib/").toSet()
                check(nativeEntries.isNotEmpty()) { "Original base has no native payload; binding split-only native payload is unsupported" }
                for (entry in nativeEntries) {
                    check(entry.name in current) { "Original native payload is missing from selected APK: ${entry.name}. Preserve both supported ABIs." }
                    check(entry.size in 1..(64L * 1024 * 1024)) { "Unsupported native payload size: ${entry.name}" }
                    val expected = zip.getInputStream(entry).use { stream -> digest(stream, entry.size) }
                    val actual = get(entry.name)
                    check(actual.length() == entry.size && actual.inputStream().use { digest(it, entry.size) }.contentEquals(expected)) {
                        "Original native payload differs from selected APK: ${entry.name}"
                    }
                }
            }
            state.resolve("original-path").writeText(original.absolutePath)
        }
    }
}

private fun digest(stream: java.io.InputStream, size: Long): ByteArray {
    val digest = MessageDigest.getInstance("SHA-256")
    val buffer = ByteArray(65536)
    var total = 0L
    while (true) {
        val count = stream.read(buffer)
        if (count < 0) break
        PatchFiles.checkInterrupted()
        total += count
        check(total <= size) { "Original native payload exceeds declared size" }
        digest.update(buffer, 0, count)
    }
    check(total == size) { "Truncated native payload" }
    return digest.digest()
}

private val originalBinding = bytecodePatch {
    dependsOn(originalResources)
    execute {
        validateTarget(packageMetadata)
        check(classDefByOrNull("Lio/github/emotionbug/patches/runtime/RecorderService;") == null) {
            "Embedded recorder is already present; select an original unpatched APK"
        }
        snapshot(fileWorkspace)?.let { original ->
            val seen = HashSet<String>()
            ZipFile(original).use { zip ->
                for (entry in zip.entries().asSequence().filter { it.name.matches(dexEntry) }) {
                    check(entry.size in 1..(256L * 1024 * 1024)) { "Unsupported original DEX size: ${entry.name}" }
                    val bytes = zip.getInputStream(entry).use { PatchFiles.read(it, entry.size.toInt()) }
                    check(bytes.size.toLong() == entry.size) { "Truncated original DEX: ${entry.name}" }
                    for (owner in DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes)).classes) {
                        PatchFiles.checkInterrupted()
                        check(seen.add(owner.type)) { "Duplicate original class: ${owner.type}" }
                        val current = classDefByOrNull(owner.type)
                        check(current != null && OriginalDexBinding.matches(owner, current)) {
                            "Original base DEX does not match selected APK: ${owner.type}. Rebuilt, optimized, already-patched, or different original inputs cannot be bound."
                        }
                    }
                }
            }
            check(seen.isNotEmpty()) { "Original base contains no DEX classes" }
        }
    }
}

/** Exact descriptors only; every recipe guard passes before any method in this batch changes. */
internal fun BytecodePatchContext.applyRecipes(recipes: List<MethodPatch>) {
    val replacements = LinkedHashMap<Method, MutableMethod>()
    val descriptors = HashSet<String>()
    for (recipe in recipes) for (descriptor in recipe.methods()) {
        check(descriptors.add(descriptor)) { "Conflicting recipe: $descriptor" }
        val owner = classDefBy(descriptor.substringBefore("->"))
        val method = owner.methods.singleOrNull { DexInstructions.id(it) == descriptor }
            ?: error("Missing or duplicate exact method: $descriptor")
        check(method.implementation != null) { "Missing method body: $descriptor" }
        val body = recipe.implementation(method)
        replacements[method] = MutableMethod(ImmutableMethod(method.definingClass, method.name, method.parameters,
            method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions, body))
    }
    for ((method, replacement) in replacements) {
        val methods = mutableClassDefBy(method.definingClass).methods
        check(methods.removeIf { DexInstructions.id(it) == DexInstructions.id(method) }) { "Method disappeared: $method" }
        methods.add(replacement)
    }
}

private fun ResourcePatchContext.readLibrary(entry: String, size: Int): ByteArray {
    check(entry in listApkEntries("lib/")) { "Missing native library: $entry" }
    val file = get(entry)
    check(file.length() == size.toLong()) { "Unsupported native library size: $entry" }
    return file.inputStream().use { PatchFiles.read(it, size) }
}
private fun ResourcePatchContext.stage(replacements: Map<String, ByteArray>) {
    // No output mutation until both ABI size/header/hash/range guards have passed.
    replacements.forEach { (entry, bytes) -> get(entry, false).writeBytes(bytes) }
}

val manufacturerCompatibilityPatch = bytecodePatch(
    name = "ACall manufacturer compatibility", description = "Retain capability, account and permission checks while removing the manufacturer restriction.", default = true
) {
    compatibleWith(target)
    category("ACall · Compatibility")
    dependsOn(originalBinding)
    // Finalize chooses the embedded permission variant after all selected entries have executed.
    finalize {
        applyRecipes(listOf(ManufacturerCompatibilityPatch(state(fileWorkspace).resolve("embedded").isFile)))
    }
}

val removeBannerAdsPatch = bytecodePatch(
    name = "ACall remove banner ads",
    description = "Remove commercial Google and Kakao banner requests and their reserved space; retain caller information and safety notices.",
    default = false
) {
    compatibleWith(target)
    category("ACall · Ads")
    dependsOn(originalBinding)
    execute { applyRecipes(listOf(BannerAdsPatch())) }
}

private val analyticsResources = resourcePatch {
    dependsOn(originalBinding)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val app = manifest.getElementsByTagName("application").item(0) as? Element
                ?: error("Original manifest has no application")
            val key = "firebase_analytics_collection_deactivated"
            val existing = (0 until app.childNodes.length)
                .mapNotNull { app.childNodes.item(it) as? Element }
                .filter { it.tagName == "meta-data" && it.getAttributeNS(ANDROID, "name") == key }
            check(existing.size <= 1) { "Duplicate Firebase analytics deactivation metadata" }
            val metadata = existing.singleOrNull()
                ?: manifest.createElement("meta-data").also { app.appendChild(it) }
            metadata.setAttributeNS(ANDROID, "android:name", key)
            metadata.removeAttributeNS(ANDROID, "resource")
            metadata.setAttributeNS(ANDROID, "android:value", "true")
        }
    }
}

val analyticsSuppressionPatch = bytecodePatch(
    name = "ACall suppress nonessential analytics",
    description = "Deactivate Firebase Analytics and keep AppsFlyer stopped-tracking paths active; preserve Messaging, Crashlytics, authentication and phone services.",
    default = false
) {
    compatibleWith(target)
    category("ACall · Privacy")
    dependsOn(originalBinding, analyticsResources)
    execute { applyRecipes(listOf(AnalyticsSuppressionPatch())) }
}

private val recorderResources = resourcePatch {
    dependsOn(originalBinding)
    execute {
        validateTarget(packageMetadata)
        document("AndroidManifest.xml").use { destination ->
            payload("manifest.xml").use { input -> document(input).use { source ->
                check(source.documentElement.getAttribute("package") == PACKAGE)
                val app = destination.getElementsByTagName("application").item(0) as? Element
                    ?: error("Original manifest has no application")
                val additions = source.getElementsByTagName("application").item(0) as Element
                val components = (0 until additions.childNodes.length).mapNotNull { additions.childNodes.item(it) as? Element }
                    .filterNot { it.tagName == "uses-native-library" ||
                        it.getAttributeNS(ANDROID, "name").startsWith("io.github.emotionbug.patches.runtime.Summary") }
                // Reject collisions, including an existing provider using the same authority.
                for (node in components) for (i in 0 until app.childNodes.length) {
                    val existing = app.childNodes.item(i) as? Element ?: continue
                    check(existing.getAttributeNS(ANDROID, "name") != node.getAttributeNS(ANDROID, "name") &&
                        (node.tagName != "provider" || existing.getAttributeNS(ANDROID, "authorities") != node.getAttributeNS(ANDROID, "authorities"))) {
                        "Embedded component already exists or conflicts: ${node.getAttributeNS(ANDROID, "name")}"
                    }
                }
                val permissions = source.getElementsByTagName("uses-permission")
                for (i in 0 until permissions.length) {
                    val permission = permissions.item(i) as Element
                    val existing = destination.getElementsByTagName("uses-permission")
                    val present = (0 until existing.length).any {
                        (existing.item(it) as Element).getAttributeNS(ANDROID, "name") == permission.getAttributeNS(ANDROID, "name")
                    }
                    if (!present) destination.documentElement.insertBefore(destination.importNode(permission, true), app)
                }
                components.forEach { app.appendChild(destination.importNode(it, true)) }
            } }
        }
        get("assets/ebpatcher/THIRD-PARTY-NOTICES.txt", false).apply { parentFile.mkdirs() }.outputStream().use { out ->
            payload("THIRD-PARTY-NOTICES.txt").use { it.copyTo(out) }
        }
    }
}

val embeddedRecorderPatch = bytecodePatch(
    name = "ACall embedded Shizuku recording", description = "Use the original recording controls with an authorized Shizuku recorder; retain failure callbacks and show failure reasons.", default = true
) {
    compatibleWith(target)
    category("ACall · Recording")
    dependsOn(manufacturerCompatibilityPatch, recorderResources)
    extendWith { payload("recorder.dex") }
    execute {
        val context = classDefBy("Lts1;").methods.singleOrNull { DexInstructions.id(it) == "Lts1;->j()Lq2j;" }
        check(context != null && context.accessFlags and 8 != 0) { "Missing original application-context accessor ts1.j()" }
        CloudMonoUploadPatch.validate { classDefBy(it) }
        applyRecipes(listOf(EmbeddedRecorderPatch(), ConnectionEligibilityPatch(true), SettingsEligibilityPatch(true), RecorderStartupPatch(), SettingsEntryPatch()) + CloudMonoUploadPatch.create())
        state(fileWorkspace).resolve("embedded").writeText("true")
    }
}

/** The SDK stays isolated in assets; neither it nor the model weights enter the host DEX. */
private val summaryPayload = rawResourcePatch {
    dependsOn(originalBinding)
    execute {
        val index = payload("summary/payload-files.json").bufferedReader().use { it.readText() }
        val files = JsonParser.parseString(index).asJsonArray.map {
            check(it.isJsonPrimitive && it.asJsonPrimitive.isString) { "Invalid summary payload entry" }
            it.asString
        }
        check(files.isNotEmpty() && files.size == files.toSet().size) { "Empty or duplicate summary payload inventory" }
        check(files.containsAll(listOf("engine.zip", "engine-files.json", "model.json", "THIRD-PARTY-NOTICES.txt"))) {
            "Incomplete summary engine payload"
        }
        files.forEach { name ->
            check(name.isNotEmpty() && !name.startsWith("/") && '\\' !in name &&
                name.split('/').none { it.isEmpty() || it == "." || it == ".." } &&
                name != "payload-files.json" && !name.endsWith(".litertlm", true)) {
                "Unsafe or bundled model summary payload entry: $name"
            }
            payload("summary/$name").close()
        }
        val root = get("assets/ebpatcher/summary/payload-files.json", false).apply { parentFile.mkdirs() }.parentFile
        files.forEach { name ->
            root.resolve(name).apply { parentFile.mkdirs() }.outputStream().use { output ->
                payload("summary/$name").use { it.copyTo(output) }
            }
        }
        root.resolve("payload-files.json").writeText(index)
    }
}

private val summaryResources = resourcePatch {
    dependsOn(recorderResources, summaryPayload)
    execute {
        document("AndroidManifest.xml").use { destination ->
            payload("manifest.xml").use { input -> document(input).use { source ->
                val app = destination.getElementsByTagName("application").item(0) as Element
                val additions = source.getElementsByTagName("application").item(0) as Element
                val components = (0 until additions.childNodes.length).mapNotNull { additions.childNodes.item(it) as? Element }
                    .filter { it.getAttributeNS(ANDROID, "name").startsWith("io.github.emotionbug.patches.runtime.Summary") }
                check(components.map { it.getAttributeNS(ANDROID, "name") }.toSet() == setOf(
                    "io.github.emotionbug.patches.runtime.SummarySettingsActivity",
                    "io.github.emotionbug.patches.runtime.SummaryDownloadService",
                    "io.github.emotionbug.patches.runtime.SummaryJobService",
                    "io.github.emotionbug.patches.runtime.SummaryPhoneReceiver"
                )) { "Incomplete summary component payload" }
                components.forEach { node ->
                    check((0 until app.childNodes.length).none {
                        (app.childNodes.item(it) as? Element)?.getAttributeNS(ANDROID, "name") == node.getAttributeNS(ANDROID, "name")
                    }) { "Summary component already exists: ${node.getAttributeNS(ANDROID, "name")}" }
                    app.appendChild(destination.importNode(node, true))
                }
                val libraries = (0 until additions.childNodes.length)
                    .mapNotNull { additions.childNodes.item(it) as? Element }
                    .filter { it.tagName == "uses-native-library" }
                check(libraries.map { it.getAttributeNS(ANDROID, "name") }.toSet() ==
                    setOf("libOpenCL.so", "libvndksupport.so") &&
                    libraries.all { it.getAttributeNS(ANDROID, "required") == "false" }) {
                    "GPU libraries must remain optional for CPU-only devices"
                }
                libraries.forEach { node ->
                    val exists = (0 until app.childNodes.length).any {
                        val child = app.childNodes.item(it) as? Element
                        child?.tagName == "uses-native-library" &&
                            child.getAttributeNS(ANDROID, "name") == node.getAttributeNS(ANDROID, "name")
                    }
                    if (!exists) app.appendChild(destination.importNode(node, true))
                }
            } }
        }
    }
}

val localGemmaSummaryPatch = bytecodePatch(
    name = "ACall local Gemma summaries",
    description = "Use Korean Whisper turbo and Gemma after exact TICKET_ALL_USED or in Always mode. Persist the selected API/local result in the original call-history database, with silent processing notifications and five local histories. Download or update models in settings; preserve the API original.",
    default = false
) {
    compatibleWith(target)
    category("ACall · Summary")
    dependsOn(embeddedRecorderPatch, summaryResources)
    execute {
        LocalGemmaSummaryPatch.validate { classDefBy(it) }
        NativeSummaryPersistencePatch.validate { classDefBy(it) }
        NativeSummaryNotificationPatch.validate { classDefBy(it) }
        applyRecipes(listOf(LocalGemmaSummaryPatch(), NativeSummaryPersistencePatch(), NativeSummaryNotificationPatch()))
    }
}

private val detectorResources = rawResourcePatch {
    dependsOn(originalBinding)
    execute { stage(NativeDetectorPatch().replacements { entry, size -> readLibrary(entry, size) }) }
}
val debuggerDetectionPatch = bytecodePatch(
    name = "ACall disable debugger detection", description = "Disable only the guarded Java and native debugger detectors; retain authentication and certificate verification.", default = false
) {
    compatibleWith(target)
    category("ACall · Security")
    dependsOn(originalBinding, detectorResources)
    execute { applyRecipes(DebuggerDetectionPatch.create()) }
}
val usbDebuggingDetectionPatch = bytecodePatch(
    name = "ACall disable USB debugging detection", description = "Disable local USB debugging detection without changing device settings.", default = false
) {
    compatibleWith(target)
    category("ACall · Security")
    dependsOn(originalBinding)
    execute { applyRecipes(UsbDebuggingDetectionPatch.create()) }
}
private val originalHashResources = rawResourcePatch {
    dependsOn(originalBinding)
    execute {
        val original = snapshot(fileWorkspace) ?: error("Set Original APK or APKM to the exact untouched original local file")
        stage(AppProtectNativeHashPatch(original.toPath()).replacements { entry, size -> readLibrary(entry, size) })
    }
}
val appProtectOriginalHashPatch = bytecodePatch(
    name = "ACall original AppProtect hashes", description = "Bind an explicit original APK/APKM to this input and preserve original APK and central-directory hashes without bypassing verification.", default = false
) {
    compatibleWith(target)
    category("ACall · Security")
    originalApk()
    dependsOn(originalBinding, originalHashResources)
    execute {
        val original = snapshot(fileWorkspace) ?: error("Set Original APK or APKM to the exact untouched original local file")
        applyRecipes(listOf(AppProtectPatch(original.toPath())))
    }
}
val galaxyDeviceProfilePatch = bytecodePatch(
    name = "ACall Galaxy device profile", description = "Report the scoped Galaxy metadata profile without changing OS, IDs, fingerprint, hardware, product or device.", default = false
) {
    compatibleWith(target)
    category("ACall · Device profile")
    dependsOn(originalBinding)
    execute { applyRecipes(GalaxyDeviceProfilePatch.create()) }
}
