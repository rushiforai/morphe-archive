/*
 * Integration test (build stage B) for the patch bundle.
 *
 * Loads the built .mpp bundle, runs it against the original base APK and
 * verifies the result:
 *
 * - every patched DEX method starts with the expected instruction,
 * - the Material Capsule manifest carries the analytics switches and no
 *   longer declares the advertising-ID permission,
 * - the Unity scene patch of Memorize Pi Digits only touches its targets.
 *
 * The input APK is selected with -Dmorphe.patch.apkFile (see the Gradle tasks
 * runBundleTest, runBundleTestMaterialCapsule and patchMergedApp).
 *
 * Run with:  gradlew :patches:runBundleTest   (workingDir = patches project dir)
 */

package app.memorizepi.patches.pi.testutil

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.memorizepi.patches.pi.scenes.SceneTargetKind
import app.memorizepi.patches.pi.scenes.UnityBundlePatcher
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking

fun main() = runBlocking {
    // Optional overrides (Java system properties) so the same runner can
    // patch other APKs, e.g. the merged standalone APK built from the XAPK
    // splits: -Dmorphe.patch.apkFile=... -Dmorphe.patch.outputDir=...
    val apkFile = File(
        System.getProperty("morphe.patch.apkFile")
            ?: "../../input/xapk-extract/com.unknownprojectx.pi.apk"
    )
    val outputDir = File(
        System.getProperty("morphe.patch.outputDir")
            ?: "build/test-output"
    )
    val bundleFile = File("build/libs")
        .listFiles { f ->
            f.isFile && f.name.endsWith(".mpp") &&
                !f.name.contains("sources") && !f.name.contains("javadoc")
        }
        ?.maxByOrNull { it.lastModified() }
        ?: error("No .mpp bundle found in build/libs")
    outputDir.mkdirs()
    val outputApk = File(outputDir, "patched.apk")
    val temporaryFilesPath = File(outputDir, "temporary-files")

    require(apkFile.exists()) { "Input APK not found: ${apkFile.absolutePath}" }
    require(bundleFile.exists()) { "Bundle not found: ${bundleFile.absolutePath}" }

    val patches = loadPatchesFromJar(setOf(bundleFile))
    // Optional filter, e.g. -Dmorphe.patch.only="Remove cross-promotion ..."
    val only = System.getProperty("morphe.patch.only")
        ?.split(',')
        ?.map { it.trim() }
        ?.filter { it.isNotEmpty() }
        ?.toSet()
    val selected = if (only.isNullOrEmpty()) patches else patches.filterTo(linkedSetOf()) { it.name in only }
    check(selected.isNotEmpty()) { "No patch matched morphe.patch.only=$only" }
    println("Loaded patches: ${selected.map { it.name }}")

    val config = PatcherConfig(
        apkFile = apkFile,
        temporaryFilesPath = temporaryFilesPath,
        validate = true,
    )

    var selectedNames: Set<String> = emptySet()

    Patcher(config).use { patcher ->
        // Compatibility is metadata for the manager; the patcher itself runs
        // every patch it is given. Filter here so a run against one app does
        // not apply the other app's patches.
        val packageName = patcher.context.packageMetadata.packageName
        val applicable = selected.filter { it.isCompatibleWith(packageName) }
        check(applicable.isNotEmpty()) {
            "No patch is compatible with $packageName (compatibility metadata of the bundle)"
        }
        println("Target package: $packageName")
        println("Applicable patches: ${applicable.map { it.name }}")

        selectedNames = applicable.mapNotNull { it.name }.toSet()

        patcher += applicable.toSet()

        val results = patcher.invoke().toList()

        results.forEach { result ->
            val exception = result.exception
            if (exception == null) {
                println("OK  : ${result.patch.name}")
            } else {
                System.err.println("FAIL: ${result.patch.name}")
                System.err.println(exception.stackTraceToString())
                error("Patch '${result.patch.name}' failed")
            }
        }

        patcher.writeApk(outputApk)
    }

    println("Patched APK written: ${outputApk.absolutePath}")

    // Verify the changes in the patched DEX. The modified classes are written
    // to new DEX files (mode STRIP_FAST), so check every classes*.dex entry.
    val usesAdsPatch = selectedNames.any { it.contains("home screen ads") }
    val usesPairIpPatch = selectedNames.any { it.contains("PairIP") }
    val usesScenePatch = selectedNames.any { it.contains("cross-promotion") }
    val usesAnalyticsPatch = selectedNames.any { it.contains("Firebase Analytics") }
    val usesProPatch = selectedNames.any { it.contains("Unlock Pro") }

    val expectedMethods = buildList {
        if (usesAdsPatch) {
            add("Lcom/homelib/android/device/DeviceManager;" to "ShowBannerAd")
            add("Lcom/homelib/android/ad/AdManager;" to "ShowBannerAd")
            add("Lcom/homelib/android/ad/AdmobAdapter;" to "showBannerAd")
            add("Lcom/homelib/android/ad/AdmobAdapter;" to "show")
        }
        if (usesPairIpPatch) {
            add("Lcom/pairip/licensecheck/LicenseClient;" to "checkLicense")
        }
    }
    val verified = mutableSetOf<String>()

    ZipFile(outputApk).use { apk ->
        apk.entries().asSequence()
            .filter { it.name.matches(Regex("classes\\d*\\.dex")) }
            .forEach { entry ->
                val dex = DexBackedDexFile.fromInputStream(null, apk.getInputStream(entry).buffered())
                dex.classes.forEach { type ->
                    val methodNames = expectedMethods.filter { it.first == type.type }.map { it.second }
                    methodNames.forEach { methodName ->
                        val method = type.methods.firstOrNull { it.name == methodName } ?: return@forEach
                        val firstInstruction = method.implementation!!.instructions.first()
                        check(firstInstruction.opcode == Opcode.RETURN_VOID) {
                            "${type.type}#$methodName does not start with return-void, " +
                                "but with ${firstInstruction.opcode}"
                        }
                        val id = "${type.type}#$methodName"
                        if (verified.add(id)) {
                            println("Verified in ${entry.name}: $id starts with return-void " +
                                "(${method.implementation!!.instructions.count()} instructions)")
                        }
                    }
                }
            }
    }
    val missing = expectedMethods
        .map { "${it.first}#${it.second}" }
        .filterNot { it in verified }
    check(missing.isEmpty()) { "Patched methods missing from DEX: $missing" }
    if (expectedMethods.isNotEmpty()) {
        println("Bundle test PASSED (${verified.size} methods verified)")
    }

    if (usesAnalyticsPatch) {
        verifyAnalyticsManifest(outputApk)
        println("Manifest test PASSED")
    }

    if (usesProPatch) {
        verifyProUnlock(outputApk)
        println("Pro test PASSED")
    }

    if (usesScenePatch) {
        verifyUnityScenes(apkFile, outputApk)
        println("Scene test PASSED")
    }
}

/**
 * Verifies the Unity scene patch:
 *
 * - `assets/bin/Data/data.unity3d` is STORED in the output APK (Unity cannot
 *   read it otherwise, and the original is STORED as well),
 * - every cross-promotion GameObject is inactive and every related Transform
 *   has zero scale,
 * - only those target objects differ from the original bundle,
 * - optionally, the target bytes match a reference bundle
 *   (`-Dmorphe.scene.reference=...` or `MORPHE_SCENE_REFERENCE`).
 */
private fun verifyUnityScenes(originalApk: File, patchedApk: File) {
    val entryName = UnityBundlePatcher.BUNDLE_ENTRY
    val originalBytes = ZipFile(originalApk).use { it.readEntry(entryName) }
    val patchedEntry = ZipFile(patchedApk).use { it.entry(entryName) }
    check(patchedEntry.method == ZipEntry.STORED) {
        "$entryName is compressed in the patched APK (method ${patchedEntry.method}); " +
            "Unity requires it to be STORED"
    }
    val patchedBytes = ZipFile(patchedApk).use { it.readEntry(entryName) }

    val targets = UnityBundlePatcher.inspect(patchedBytes)
    check(targets.isNotEmpty()) { "No cross-promotion targets found in the patched bundle" }

    val promote = targets.filter { it.kind == SceneTargetKind.PROMOTE_ICON }
    val prime = targets.filter { it.kind == SceneTargetKind.PRIME_BUTTON }
    check(promote.isNotEmpty()) { "No PromoteIcon targets found" }
    check(prime.isNotEmpty()) { "No Prime Button targets found" }

    for (target in targets) {
        when {
            target.classId == 1 -> check(target.inactive == true) {
                "GameObject ${target.scene}:${target.pathId} (${target.kind}) is still active"
            }
            target.classId == 4 -> check(target.scaledToZero == true) {
                "Transform ${target.scene}:${target.pathId} (${target.kind}) is not scaled to zero"
            }
            else -> error("Unexpected target class ${target.classId}")
        }
    }
    println(
        "Scene targets: ${targets.size} objects " +
            "(${promote.count { it.classId == 1 }} PromoteIcon GameObjects, " +
            "${prime.count { it.classId == 1 }} Prime Button GameObjects)",
    )

    // The patch must not change anything outside the target objects.
    val originalData = UnityBundlePatcher.unpack(originalBytes)
    val patchedData = UnityBundlePatcher.unpack(patchedBytes)
    check(originalData.size == patchedData.size) {
        "Uncompressed bundle size changed: ${originalData.size} -> ${patchedData.size}"
    }
    val ranges = UnityBundlePatcher.targetRanges(originalBytes)
    var outside = 0
    var changed = 0
    for (index in originalData.indices) {
        if (originalData[index] == patchedData[index]) continue
        changed++
        if (ranges.none { index in it }) outside++
    }
    check(outside == 0) { "$outside changed bytes lie outside the cross-promotion objects" }
    check(changed > 0) { "The scene patch did not change any bytes" }
    println("Scene diff: $changed bytes inside ${ranges.size} target objects, none elsewhere")

    // Optional: compare target object bytes against a known-good reference.
    val referencePath = System.getProperty("morphe.scene.reference")
        ?: System.getenv("MORPHE_SCENE_REFERENCE")
    if (referencePath != null) {
        val referenceFile = File(referencePath)
        check(referenceFile.exists()) { "Scene reference not found: ${referenceFile.absolutePath}" }
        val expected = UnityBundlePatcher.targetObjects(referenceFile.readBytes())
        val actual = UnityBundlePatcher.targetObjects(patchedBytes)
        check(expected.keys == actual.keys) {
            "Scene reference has different target objects: ${expected.keys} vs ${actual.keys}"
        }
        for (key in expected.keys) {
            check(expected.getValue(key).contentEquals(actual.getValue(key))) {
                "Target object $key differs from the scene reference"
            }
        }
        println("Scene reference match: ${expected.size} objects identical to $referencePath")
    }
}

private fun ZipFile.entry(name: String): ZipEntry =
    getEntry(name) ?: error("Entry $name not found in the APK")

private fun ZipFile.readEntry(name: String): ByteArray =
    getInputStream(entry(name)).use { it.readBytes() }

/**
 * A patch without compatibility declarations applies to every app; otherwise
 * at least one declaration must name the target package.
 */
private fun Patch.isCompatibleWith(packageName: String): Boolean {
    val declared = compatibility ?: return true
    return declared.isEmpty() || declared.any { it.packageName == packageName }
}

/**
 * Verifies the manifest edits of the Firebase Analytics patch.
 *
 * The binary XML string pool stores ASCII strings either as UTF-8 or as
 * UTF-16LE, so both encodings are searched. The advertising-ID permission must
 * be gone from the manifest after the `<uses-permission>` node was removed.
 */
private fun verifyAnalyticsManifest(patchedApk: File) {
    val manifest = ZipFile(patchedApk).use { it.readEntry("AndroidManifest.xml") }

    check(manifest.containsString("firebase_analytics_collection_deactivated")) {
        "AndroidManifest.xml does not contain the analytics deactivation switch"
    }
    check(manifest.containsString("google_analytics_adid_collection_enabled")) {
        "AndroidManifest.xml does not contain the advertising-ID collection switch"
    }
    check(!manifest.containsString("com.google.android.gms.permission.AD_ID")) {
        "AndroidManifest.xml still declares com.google.android.gms.permission.AD_ID"
    }
    check(!manifest.containsString("android.permission.ACCESS_ADSERVICES_AD_ID")) {
        "AndroidManifest.xml still declares android.permission.ACCESS_ADSERVICES_AD_ID"
    }
}

/**
 * Verifies the Pro unlock patch in the patched DEX:
 *
 * - the flow transform (class implementing `Laz2`, method
 *   `(Object, Continuation)Object` with the `"yes"` literal) now passes
 *   `Boolean.TRUE` to the downstream collector in both branches,
 * - the suspend one-shot read returns `Boolean.TRUE` immediately.
 *
 * The classes are obfuscated, so they are located by the same structural
 * anchors the patch uses.
 */
private fun verifyProUnlock(patchedApk: File) {
    var flowChecked = false
    var suspendReadChecked = false
    var gestureSetterChecked = false

    ZipFile(patchedApk).use { apk ->
        apk.entries().asSequence()
            .filter { it.name.matches(Regex("classes\\d*\\.dex")) }
            .forEach { entry ->
                val dex = DexBackedDexFile.fromInputStream(null, apk.getInputStream(entry).buffered())
                dex.classes.forEach { type ->
                    val interfaces = type.interfaces.map(CharSequence::toString)

                    // 1) Flow transform.
                    if ("Laz2;" in interfaces) {
                        type.methods.forEach { method ->
                            val parameters = method.parameterTypes.map(CharSequence::toString)
                            if (parameters != listOf("Ljava/lang/Object;", "Lij1;") ||
                                method.returnType != "Ljava/lang/Object;"
                            ) {
                                return@forEach
                            }
                            val instructions = method.implementation?.instructions?.toList()
                                ?: return@forEach
                            val hasYes = instructions.any { instruction ->
                                (instruction as? ReferenceInstruction)?.reference
                                    .let { it is StringReference && it.string == "yes" }
                            }
                            if (!hasYes) return@forEach

                            val emits = instructions.withIndex().filter { (_, instruction) ->
                                val reference = (instruction as? ReferenceInstruction)?.reference
                                    as? MethodReference ?: return@filter false
                                instruction.opcode == Opcode.INVOKE_INTERFACE &&
                                    reference.returnType == "Ljava/lang/Object;" &&
                                    reference.parameterTypes.map(CharSequence::toString) ==
                                    listOf("Ljava/lang/Object;", "Lij1;")
                            }
                            check(emits.size >= 2) {
                                "Expected two collector emits in the Pro flow transform, " +
                                    "found ${emits.size}"
                            }
                            emits.forEach { (index, instruction) ->
                                val valueRegister = when (instruction) {
                                    is FiveRegisterInstruction -> instruction.registerD
                                    is RegisterRangeInstruction -> instruction.startRegister + 1
                                    else -> error("Unexpected emit instruction: $instruction")
                                }
                                val previous = instructions.getOrNull(index - 1)
                                check(previous != null &&
                                    previous.opcode == Opcode.SGET_OBJECT &&
                                    (previous as ReferenceInstruction).reference.toString() ==
                                    "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
                                ) {
                                    "Collector emit at index $index in the Pro flow transform " +
                                        "does not pass Boolean.TRUE (previous: ${previous?.opcode})"
                                }
                                println(
                                    "Verified in ${entry.name}: Pro flow transform emits " +
                                        "Boolean.TRUE to v$valueRegister",
                                )
                            }
                            flowChecked = true
                        }
                    }

                    // 2) Gesture item's `isEnabled` setter forces `true`, so the
                    //    app can never disable every gesture behind the user's back.
                    if (type.fields.any { it.name == "gestureActionId_" }) {
                        type.methods.forEach { method ->
                            val parameters = method.parameterTypes.map(CharSequence::toString)
                            if (parameters.size != 2 ||
                                parameters[0] != type.type ||
                                parameters[1] != "Z" ||
                                method.returnType != "V"
                            ) {
                                return@forEach
                            }
                            val instructions = method.implementation?.instructions?.toList()
                                ?: return@forEach
                            val first = instructions.getOrNull(0) ?: return@forEach
                            val second = instructions.getOrNull(1) ?: return@forEach
                            if (first.opcode != Opcode.CONST_4 || second.opcode != Opcode.IPUT_BOOLEAN) {
                                return@forEach
                            }
                            val register = (first as? OneRegisterInstruction)?.registerA
                            val literal = (first as? NarrowLiteralInstruction)?.narrowLiteral
                            val field = (second as? ReferenceInstruction)?.reference as? FieldReference
                            if (register != 1 || literal != 1 || field?.name != "isEnabled_") {
                                return@forEach
                            }
                            println(
                                "Verified in ${entry.name}: gesture enabled setter " +
                                    "(${type.type}#${method.name}) always stores true",
                            )
                            gestureSetterChecked = true
                        }
                    }

                    // 3) Suspend one-shot read (same class as the AES helpers).
                    val hasDecryptHelper = type.methods.any { candidate ->
                        candidate.returnType == "Ljava/lang/String;" &&
                            candidate.parameterTypes.map(CharSequence::toString) ==
                            listOf("Ljava/lang/String;", "Ljavax/crypto/SecretKey;")
                    }
                    if (!hasDecryptHelper) return@forEach

                    type.methods.forEach { method ->
                        if (method.parameterTypes.map(CharSequence::toString) != listOf("Lkj1;") ||
                            method.returnType != "Ljava/lang/Object;"
                        ) {
                            return@forEach
                        }
                        val instructions = method.implementation?.instructions?.toList()
                            ?: return@forEach
                        val first = instructions.getOrNull(0) ?: return@forEach
                        val second = instructions.getOrNull(1) ?: return@forEach
                        if (first.opcode != Opcode.SGET_OBJECT || second.opcode != Opcode.RETURN_OBJECT) {
                            return@forEach
                        }
                        val value = (first as ReferenceInstruction).reference.toString()
                        if (value != "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;") return@forEach
                        println(
                            "Verified in ${entry.name}: Pro one-shot read " +
                                "(${type.type}#${method.name}) returns Boolean.TRUE",
                        )
                        suspendReadChecked = true
                    }
                }
            }
    }

    check(flowChecked) { "The Pro flow transform was not patched" }
    check(suspendReadChecked) { "The Pro one-shot read was not patched" }
    check(gestureSetterChecked) { "The gesture enabled setter was not patched" }
}

private fun ByteArray.containsString(value: String): Boolean =
    indexOfBytes(value.toByteArray(Charsets.UTF_8)) >= 0 ||
        indexOfBytes(value.toByteArray(Charsets.UTF_16LE)) >= 0

private fun ByteArray.indexOfBytes(needle: ByteArray): Int {
    if (needle.isEmpty() || needle.size > size) return -1
    outer@ for (start in 0..(size - needle.size)) {
        for (offset in needle.indices) {
            if (this[start + offset] != needle[offset]) continue@outer
        }
        return start
    }
    return -1
}
