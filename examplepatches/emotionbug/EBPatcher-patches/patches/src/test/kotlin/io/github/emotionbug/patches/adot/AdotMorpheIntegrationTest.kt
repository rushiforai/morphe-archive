package io.github.emotionbug.patches.adot

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.google.gson.JsonParser
import io.github.emotionbug.patcher.VerifyBehavior
import io.github.emotionbug.patches.adot.ads.BannerAdsPatch
import io.github.emotionbug.patches.adot.privacy.AnalyticsSuppressionPatch
import io.github.emotionbug.patches.adot.compatibility.ManufacturerCompatibilityPatch
import io.github.emotionbug.patches.adot.dex.DexInstructions.id
import io.github.emotionbug.patches.adot.dex.MethodPatch
import io.github.emotionbug.patches.adot.dex.OriginalDexBinding
import io.github.emotionbug.patches.adot.privacy.GalaxyDeviceProfilePatch
import io.github.emotionbug.patches.adot.recording.ConnectionEligibilityPatch
import io.github.emotionbug.patches.adot.recording.EmbeddedRecorderPatch
import io.github.emotionbug.patches.adot.recording.RecorderStartupPatch
import io.github.emotionbug.patches.adot.recording.SettingsEntryPatch
import io.github.emotionbug.patches.adot.security.*
import io.github.emotionbug.patches.adot.recording.SettingsEligibilityPatch
import io.github.emotionbug.patches.adot.summary.LocalGemmaSummaryPatch
import io.github.emotionbug.patches.adot.summary.LocalGemmaSummaryPatchTest
import io.github.emotionbug.patches.adot.summary.NativeSummaryPersistencePatch
import io.github.emotionbug.patches.adot.summary.NativeSummaryPersistencePatchTest
import io.github.emotionbug.patches.adot.summary.NativeSummaryNotificationPatch
import io.github.emotionbug.patches.adot.summary.NativeSummaryNotificationPatchTest
import io.github.emotionbug.patches.adot.summary.CloudMonoUploadPatch
import io.github.emotionbug.patches.adot.summary.CloudMonoUploadPatchTest
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import org.junit.*
import org.junit.Assert.*
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Element
import java.io.File
import java.util.Base64
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

/** Private fixture only. Exercises the public Morphe consumer API, never installs or runs Android code. */
class AdotMorpheIntegrationTest {
    @get:Rule val temporary = TemporaryFolder()
    private lateinit var input: File
    @Before fun fixture() {
        val path = System.getenv("EBPATCHER_TEST_APK")
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null)
        input = File(path!!)
        appProtectOriginalHashPatch.options["originalApk"]!!.reset()
    }
    @After fun resetOptions() { appProtectOriginalHashPatch.options["originalApk"]!!.reset() }

    private fun run(input: File, selected: Set<Patch<*>>, check: (() -> Unit)? = null): File {
        val directory = temporary.newFolder()
        val output = directory.resolve("patched.apk")
        input.copyTo(output)
        Patcher(PatcherConfig(input, directory.resolve("work"), fileWorkspacePath = directory.resolve("workspace"),
            targetPatcherVersion = "2.0.0")).use { patcher ->
            patcher += selected
            val results = runBlocking { patcher().toList() }
            assertTrue(results.joinToString("\n") { "${it.patch}: ${it.exception?.stackTraceToString()}" }, results.all { it.exception == null })
            check?.invoke()
            patcher.get().applyTo(output)
        }
        return output
    }
    private fun classes(apk: File): Map<String, ClassDef> {
        val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
        return container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    }
    private fun unchangedExcept(original: Map<String, ClassDef>, result: Map<String, ClassDef>, changed: Set<String>) {
        // Morphe's mutable builder anchors debug lines to instruction starts. Compare
        // executable code and catch coverage, not incidental interior debug addresses.
        fun stripped(owner: ClassDef) = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces,
            owner.sourceFile, owner.annotations, owner.fields, owner.methods.filter { id(it) !in changed }.map { method ->
                ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions, method.implementation?.let {
                        ImmutableMethodImplementation(it.registerCount, it.instructions, it.tryBlocks, null)
                    })
            })
        val changedOwners = changed.mapTo(HashSet()) { it.substringBefore("->") }
        original.forEach { (type, before) ->
            val after = result[type] ?: error("Lost original class: $type")
            val same = if (type in changedOwners) OriginalDexBinding.matches(stripped(before), stripped(after))
                else OriginalDexBinding.matches(before, after)
            assertTrue("Unplanned edit in $type", same)
        }
    }
    private fun manifestObserver(name: String, dependencies: Array<out Patch<*>>, observe: (Map<String, String>, Set<String>, Element) -> Unit) = resourcePatch(name) {
        dependsOn(*dependencies)
        execute {
            document("AndroidManifest.xml").use { manifest ->
                val app = manifest.getElementsByTagName("application").item(0) as Element
                val attributes = (0 until app.attributes.length).associate { app.attributes.item(it).let { it.nodeName to it.nodeValue } }
                val children = (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
                    .map { "${it.tagName}:${it.getAttributeNS("http://schemas.android.com/apk/res/android", "name")}" }.toSet()
                observe(attributes, children, app)
            }
        }
    }
    @Test fun selectedPatchesUseNativeMorphePipelineAndPreserveOriginalApplication() {
        appProtectOriginalHashPatch.options["originalApk"] = input.absolutePath
        var attributes = emptyMap<String, String>()
        var children = emptySet<String>()
        val baseline = manifestObserver("00 baseline", emptyArray()) { a, c, _ -> attributes = a; children = c }
        // Profile edits Lu98.c before the detector guard reads the untouched Lu98.j.
        val all = setOf(galaxyDeviceProfilePatch, usbDebuggingDetectionPatch, debuggerDetectionPatch,
            embeddedRecorderPatch, appProtectOriginalHashPatch, manufacturerCompatibilityPatch, localGemmaSummaryPatch, removeBannerAdsPatch, analyticsSuppressionPatch)
        val after = manifestObserver("zz inspect", all.toTypedArray()) { a, c, app ->
            assertEquals(attributes, a)
            assertTrue(c.containsAll(children))
            assertAnalyticsDisabled(app)
            val namespace = "http://schemas.android.com/apk/res/android"
            val components = (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
            for (library in listOf("libOpenCL.so", "libvndksupport.so")) {
                val declaration = components.single {
                    it.tagName == "uses-native-library" && it.getAttributeNS(namespace, "name") == library
                }
                assertEquals("GPU acceleration must not prevent installation without vendor GPU libraries",
                    "false", declaration.getAttributeNS(namespace, "required"))
            }
            val settings = components.single {
                it.tagName == "activity" && it.getAttributeNS(namespace, "name") ==
                    "io.github.emotionbug.patches.runtime.ExtensionSettingsActivity"
            }
            assertEquals("Settings must not be externally launchable", "false", settings.getAttributeNS(namespace, "exported"))
            assertEquals("Settings must not create another launcher or deep link", 0, settings.getElementsByTagName("intent-filter").length)
            val preferences = components.single {
                it.tagName == "provider" && it.getAttributeNS(namespace, "name") ==
                    "io.github.emotionbug.patches.runtime.ExtensionSettingsProvider"
            }
            assertEquals("Preferences must remain private to the dialer UID", "false", preferences.getAttributeNS(namespace, "exported"))
            val summary = components.filter { it.getAttributeNS(namespace, "name").startsWith("io.github.emotionbug.patches.runtime.Summary") }
            assertEquals(4, summary.size)
            val job = summary.single { it.getAttributeNS(namespace, "name").endsWith(".SummaryJobService") }
            assertEquals(":ebpatcher_summary", job.getAttributeNS(namespace, "process"))
            assertEquals("true", job.getAttributeNS(namespace, "exported"))
            assertEquals("android.permission.BIND_JOB_SERVICE", job.getAttributeNS(namespace, "permission"))
            val download = summary.single { it.getAttributeNS(namespace, "name").endsWith(".SummaryDownloadService") }
            assertEquals("false", download.getAttributeNS(namespace, "exported"))
            assertEquals(":ebpatcher_models", download.getAttributeNS(namespace, "process"))
            assertEquals("dataSync", download.getAttributeNS(namespace, "foregroundServiceType"))
            val summarySettings = summary.single { it.tagName == "activity" }
            assertEquals("false", summarySettings.getAttributeNS(namespace, "exported"))
            assertEquals(0, summarySettings.getElementsByTagName("intent-filter").length)
            val phone = summary.single { it.tagName == "receiver" }
            assertEquals(":ebpatcher_summary", phone.getAttributeNS(namespace, "process"))
            assertEquals("true", phone.getAttributeNS(namespace, "exported"))
            val actions = phone.getElementsByTagName("action")
            assertEquals(1, actions.length)
            assertEquals("android.intent.action.PHONE_STATE", (actions.item(0) as Element).getAttributeNS(namespace, "name"))
        }
        val output = run(input, all + baseline + after)
        val beforeClasses = classes(input)
        val patchedClasses = classes(output)
        val recipes: List<MethodPatch> = listOf(ManufacturerCompatibilityPatch(true), EmbeddedRecorderPatch(), ConnectionEligibilityPatch(true),
            SettingsEligibilityPatch(true), SettingsEntryPatch(), RecorderStartupPatch(), AppProtectPatch(input.toPath()), LocalGemmaSummaryPatch(), NativeSummaryPersistencePatch(), NativeSummaryNotificationPatch(), BannerAdsPatch(), AnalyticsSuppressionPatch()) + CloudMonoUploadPatch.create() + DebuggerDetectionPatch.create() + UsbDebuggingDetectionPatch.create() + GalaxyDeviceProfilePatch.create()
        unchangedExcept(beforeClasses, patchedClasses, recipes.flatMap { it.methods() }.toSet())
        LocalGemmaSummaryPatch().methods().forEach { descriptor ->
            val owner = descriptor.substringBefore("->")
            val original = beforeClasses.getValue(owner).methods.single { id(it) == descriptor }
            val patched = patchedClasses.getValue(owner).methods.single { id(it) == descriptor }
            LocalGemmaSummaryPatchTest.assertAdditive(original, patched.implementation)
        }
        NativeSummaryPersistencePatch().methods().forEach { descriptor ->
            val owner = descriptor.substringBefore("->")
            val original = beforeClasses.getValue(owner).methods.single { id(it) == descriptor }
            val patched = patchedClasses.getValue(owner).methods.single { id(it) == descriptor }
            NativeSummaryPersistencePatchTest.assertBoundary(original, patched.implementation)
        }
        NativeSummaryNotificationPatch().methods().forEach { descriptor ->
            val owner = descriptor.substringBefore("->")
            val original = beforeClasses.getValue(owner).methods.single { id(it) == descriptor }
            val patched = patchedClasses.getValue(owner).methods.single { id(it) == descriptor }
            NativeSummaryNotificationPatchTest.assertBoundary(original, patched.implementation)
        }
        CloudMonoUploadPatch.create().flatMap { it.methods() }.forEach { descriptor ->
            val owner = descriptor.substringBefore("->")
            val original = beforeClasses.getValue(owner).methods.single { id(it) == descriptor }
            val patched = patchedClasses.getValue(owner).methods.single { id(it) == descriptor }
            CloudMonoUploadPatchTest.assertBoundary(original, patched.implementation)
        }
        val dexDirectory = temporary.newFolder()
        ZipFile(output).use { zip ->
            assertNotNull(zip.getEntry("assets/ebpatcher/THIRD-PARTY-NOTICES.txt"))
            val prefix = "assets/ebpatcher/summary/"
            val files = zip.entries().asSequence()
                .filter { !it.isDirectory && it.name.startsWith(prefix) }.map { it.name }.toList()
            assertFalse("Model weights must be downloaded, not bundled", files.any { name ->
                listOf(".litertlm", ".gguf", ".ggml", ".bin").any { name.endsWith(it, true) }
            })
            zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.forEach { entry ->
                zip.getInputStream(entry).use { stream -> dexDirectory.resolve(entry.name).outputStream().use { stream.copyTo(it) } }
            }
        }
        VerifyBehavior.main(arrayOf(dexDirectory.absolutePath, "com.skt.prod.dialer", Base64.getEncoder().encodeToString(ByteArray(32) { it.toByte() })))
        System.getenv("EBPATCHER_TEST_EXPORT")?.let { directory ->
            File(directory).mkdirs()
            output.copyTo(File(directory, "morphe-integration-unsigned.apk"), overwrite = true)
        }
    }
    @Test fun bannerAdsOnlyPreservesNonAdvertisingCodeAndDoesNotEmbedServices() {
        val output = run(input, setOf(removeBannerAdsPatch))
        val original = classes(input)
        val patched = classes(output)
        assertEquals(original.keys, patched.keys)
        unchangedExcept(original, patched, BannerAdsPatch().methods())
        ZipFile(input).use { source -> ZipFile(output).use { result ->
            assertArrayEquals(source.getInputStream(source.getEntry("AndroidManifest.xml")).use { it.readBytes() },
                result.getInputStream(result.getEntry("AndroidManifest.xml")).use { it.readBytes() })
            assertFalse(result.entries().asSequence().any { it.name.startsWith("assets/ebpatcher/") })
        } }
    }
    private fun assertAnalyticsDisabled(app: Element) {
        val namespace = "http://schemas.android.com/apk/res/android"
        val metadata = (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
            .single { it.tagName == "meta-data" && it.getAttributeNS(namespace, "name") == "firebase_analytics_collection_deactivated" }
        assertEquals("true", metadata.getAttributeNS(namespace, "value"))
        assertFalse(metadata.hasAttributeNS(namespace, "resource"))
    }
    @Test fun analyticsOnlyPreservesMessagingPhoneAndNonAnalyticsComponents() {
        var attributes = emptyMap<String, String>()
        var children = emptySet<String>()
        val baseline = manifestObserver("00 baseline", emptyArray()) { a, c, _ -> attributes = a; children = c }
        val after = manifestObserver("zz inspect", arrayOf(analyticsSuppressionPatch)) { a, c, app ->
            assertEquals(attributes, a)
            assertEquals(children + "meta-data:firebase_analytics_collection_deactivated", c)
            assertAnalyticsDisabled(app)
        }
        val output = run(input, setOf(analyticsSuppressionPatch, baseline, after))
        val original = classes(input)
        val patched = classes(output)
        assertEquals(original.keys, patched.keys)
        unchangedExcept(original, patched, AnalyticsSuppressionPatch().methods())
        ZipFile(output).use { result ->
            assertFalse(result.entries().asSequence().any { it.name.startsWith("assets/ebpatcher/") })
        }
    }
    @Test fun recorderWithoutSummaryDoesNotInstallEngineOrSummaryComponents() {
        val observer = manifestObserver("recorder only", arrayOf(embeddedRecorderPatch)) { _, children, _ ->
            assertFalse(children.any { it.contains("io.github.emotionbug.patches.runtime.Summary") })
        }
        val output = run(input, setOf(embeddedRecorderPatch, observer))
        val recipes = listOf(ManufacturerCompatibilityPatch(true), EmbeddedRecorderPatch(), ConnectionEligibilityPatch(true),
            SettingsEligibilityPatch(true), SettingsEntryPatch(), RecorderStartupPatch()) + CloudMonoUploadPatch.create()
        unchangedExcept(classes(input), classes(output), recipes.flatMap { it.methods() }.toSet())
        ZipFile(output).use { zip ->
            assertFalse(zip.entries().asSequence().any { it.name.startsWith("assets/ebpatcher/summary/") })
        }
    }
    @Test fun manufacturerOnlyDoesNotEmbedRecorderOrChangeOtherClasses() {
        val output = run(input, setOf(manufacturerCompatibilityPatch))
        val before = classes(input)
        val after = classes(output)
        assertEquals(before.keys, after.keys)
        unchangedExcept(before, after, ManufacturerCompatibilityPatch(false).methods())
        ZipFile(input).use { source -> ZipFile(output).use { result ->
            assertArrayEquals(source.getInputStream(source.getEntry("AndroidManifest.xml")).use { it.readBytes() },
                result.getInputStream(result.getEntry("AndroidManifest.xml")).use { it.readBytes() })
            assertNull(result.getEntry("assets/ebpatcher/THIRD-PARTY-NOTICES.txt"))
        } }
        assertBindingFailure(output, input, "Original base DEX does not match")
        appProtectOriginalHashPatch.options["originalApk"]!!.reset()
        val directory = temporary.newFolder()
        Patcher(PatcherConfig(output, directory.resolve("work"), targetPatcherVersion = "2.0.0")).use { patcher ->
            patcher += setOf(manufacturerCompatibilityPatch)
            assertTrue("Already-patched input must fail closed", runBlocking { patcher().toList() }.any { it.exception != null })
        }
    }
    @Test fun apkmHashesBaseAndAlreadyPatchedInputFailsBeforeAnyNewEdits() {
        val archive = temporary.newFile("original.apkm")
        ZipOutputStream(archive.outputStream()).use { zip ->
            zip.putNextEntry(ZipEntry("base.apk")); input.inputStream().use { it.copyTo(zip) }; zip.closeEntry()
        }
        appProtectOriginalHashPatch.options["originalApk"] = archive.absolutePath
        val output = run(input, setOf(appProtectOriginalHashPatch))
        val helper = classes(output).getValue("Lnet/nshc/ap/AppProtect;").methods.single { id(it) == AppProtectPatch(input.toPath()).methods().single() }
        val strings = helper.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().mapNotNull { (it.reference as? StringReference)?.string }
        assertTrue(strings.contains(AppProtectPatch(input.toPath()).originalSha256))
        assertFalse(strings.contains(AppProtectPatch(archive.toPath()).originalSha256))
        assertBindingFailure(output, archive, "Original native payload differs")
    }
    private fun assertBindingFailure(current: File, original: File, reason: String) {
        appProtectOriginalHashPatch.options["originalApk"] = original.absolutePath
        val directory = temporary.newFolder()
        var mutated = false
        val mutationProbe = bytecodePatch("would mutate") {
            dependsOn(manufacturerCompatibilityPatch, appProtectOriginalHashPatch)
            execute { mutated = true }
        }
        Patcher(PatcherConfig(current, directory.resolve("work"), fileWorkspacePath = directory.resolve("workspace"), targetPatcherVersion = "2.0.0")).use { patcher ->
            patcher += setOf(mutationProbe)
            val results = runBlocking { patcher().toList() }
            assertTrue(results.any { it.exception?.stackTraceToString()?.contains(reason) == true })
            assertFalse(mutated)
        }
    }
    @Test fun wrongOriginalFileAndContentUriFailBeforeMutation() {
        val invalid = temporary.newFile("wrong.apk").apply { writeText("not an APK") }
        assertBindingFailure(input, invalid, "Zip")
        val option = appProtectOriginalHashPatch.options["originalApk"]!!
        @Suppress("UNCHECKED_CAST")
        (option as Option<String>).value = "content://downloads/unknown"
        val directory = temporary.newFolder()
        Patcher(PatcherConfig(input, directory.resolve("work"), targetPatcherVersion = "2.0.0")).use { patcher ->
            patcher += setOf(appProtectOriginalHashPatch)
            assertTrue(runBlocking { patcher().toList() }.any { it.exception?.stackTraceToString()?.contains("local filesystem path") == true })
        }
    }
}
