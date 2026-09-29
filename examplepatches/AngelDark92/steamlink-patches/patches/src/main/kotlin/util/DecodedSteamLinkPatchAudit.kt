package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_BUILD_ID
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_MANIFEST
import app.template.patches.steamlink.androidxr.MODERN_TONGUE_REPLACEMENT
import app.template.patches.steamlink.androidxr.MODERN_TONGUE_VADDR_5002363
import app.template.patches.steamlink.androidxr.gxrModernTongueBridgePatch
import app.template.patches.steamlink.androidxr.patchModernTongueTransport
import app.template.patches.shared.Constants.isModernTongueBridgeSteamLinkBuild
import app.template.patches.steamlink.androidxr.androidSurfaceTriggerResourceLibraryForBuild
import app.template.patches.steamlink.androidxr.adaptLegacyHmdConfigForBuild
import app.template.patches.steamlink.androidxr.ensureIdsXml
import app.template.patches.steamlink.androidxr.appearOnTopPatch
import app.template.patches.steamlink.androidxr.controllerVelocityPatch
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.unrestrictedBatteryUsagePatch
import app.template.patches.steamlink.androidxr.xrCoreRuntimePatch
import app.template.patches.steamlink.androidxr.xrDeviceConfigBaselinePatch
import app.template.patches.steamlink.androidxr.xrGalaxyXrHighResolutionPatch
import app.template.patches.steamlink.androidxr.xrInputRoutingConfigPatch
import app.template.patches.steamlink.androidxr.xrLauncherBootstrapPatch
import app.template.patches.steamlink.androidxr.xrManifestCapabilityPackPatch
import app.template.patches.steamlink.androidxr.xrStartupPermissionsPatch
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.template.patches.steamlink.binary.androidXrNativePermissionNamesPatch
import app.template.patches.steamlink.binary.forceHmdInitializationGatesPatch
import app.template.patches.steamlink.binary.forceLobbyPermissionStateGatePatch
import app.template.patches.steamlink.binary.forceStreamXrGatesPatch
import app.template.patches.steamlink.binary.hmdOnlyPatch
import app.template.patches.steamlink.binary.microphoneInputPresetPatch
import app.template.patches.steamlink.binary.oledCalibrationPatch
import app.template.patches.steamlink.binary.patchNativeMicrophonePreset
import app.template.patches.steamlink.binary.patchVisualDelay
import app.template.patches.steamlink.galaxyXrLegacyFoundationPatch
import app.template.patches.shared.Constants.isTwoProjectionSteamLinkBuild
import app.template.patches.steamlink.galaxyXrRecommended5001812Patch
import app.template.patches.steamlink.galaxyXrRecommended5001968Patch
import app.template.patches.steamlink.galaxyXrRecommended5001712Patch
import app.template.patches.steamlink.galaxyXrRecommended5002363Patch
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import app.template.patches.steamlink.identity.patchNativeGalaxyIdentity
import app.template.patches.steamlink.identity.patchHmdModelIdentity
import app.template.patches.steamlink.util.BinaryPatchHelper.vaddrToFileOffset
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import java.util.zip.ZipFile

private data class HighResolutionFixture(
    val versionName: String,
    val versionCode: String,
    val permissionOffset: Int,
    val permissionMustBePatched: Boolean,
)

private val permissionOriginal = "ff8301d1fd7b01a9".hexBytes()
private val permissionReplacement = "20008052c0035fd6".hexBytes()

private val highResolutionFixtures = listOf(
    HighResolutionFixture("2.0.20", "5001712", 0x142c0c, true),
    HighResolutionFixture("2.0.22", "5002244", 0x1422c4, true),
    HighResolutionFixture("2.0.23", "5002363", 0x149874, false),
    HighResolutionFixture("2.0.20", "5001812", 0x142c84, true),
    HighResolutionFixture("2.0.21", "5001968", 0x13ec7c, true),
)

private data class RecommendedBundleFixture(
    val base: HighResolutionFixture,
    val patch: Patch<*>,
)

private val visualDelayFixtures = highResolutionFixtures

private val legacyPublicFixtures = highResolutionFixtures.filter { it.versionCode in setOf("5001712", "5001812", "5001968") }

// Independent expected offsets from symbol/disassembly receipts, not production tables.
private data class LegacyNativeSites(val face: Int, val eye: Int, val cadence: Int, val mic: Int, val hook: Int, val gates: List<Int>)
private val legacySites = mapOf(
    "5001712" to LegacyNativeSites(0x99924, 0xa1a7f, 0xf6468, 0xf4584, 0x1014e8, listOf(0xffe20, 0xffe28, 0x10db10, 0x116564, 0x11656c, 0x116620)),
    "5001812" to LegacyNativeSites(0x99862, 0xa1985, 0xf6324, 0xf4484, 0x101648, listOf(0xffc5c, 0xffc64, 0x10dc70, 0x1166c4, 0x1166cc, 0x116780)),
    "5001968" to LegacyNativeSites(0x9334f, 0x9b7ab, 0xf2180, 0xefdb4, 0xfd5f0, listOf(0xfbc04, 0xfbc0c, 0x109bf0, 0x112644, 0x11264c, 0x112700)),
)

private val recommendedBundleFixtures = listOf(
    RecommendedBundleFixture(
        highResolutionFixtures.single { it.versionCode == "5001712" },
        galaxyXrRecommended5001712Patch,
    ),
    RecommendedBundleFixture(
        highResolutionFixtures.single { it.versionCode == "5002244" },
        galaxyXrLegacyFoundationPatch,
    ),
    RecommendedBundleFixture(
        highResolutionFixtures.single { it.versionCode == "5002363" },
        galaxyXrRecommended5002363Patch,
    ),
    RecommendedBundleFixture(highResolutionFixtures.single { it.versionCode == "5001812" }, galaxyXrRecommended5001812Patch),
    RecommendedBundleFixture(highResolutionFixtures.single { it.versionCode == "5001968" }, galaxyXrRecommended5001968Patch),
)

private val publicPatchesFor5002363: List<Patch<*>> = listOf(
    deviceIdentityPatch, gxrModernTongueBridgePatch, xrGalaxyXrHighResolutionPatch,
    microphoneInputPresetPatch, oledCalibrationPatch, unrestrictedBatteryUsagePatch, hmdOnlyPatch,
)

private val publicPatchesFor5001712: List<Patch<*>> = listOf(
    androidXrNativePermissionNamesPatch,
    appearOnTopPatch,
    changePackageNamePatch,
    controllerVelocityPatch,
    deviceIdentityPatch,
    forceHmdInitializationGatesPatch,
    forceLobbyPermissionStateGatePatch,
    forceStreamXrGatesPatch,
    gxrFacebridgePatch,
    xrGalaxyXrHighResolutionPatch,
    microphoneInputPresetPatch,
    oledCalibrationPatch,
    unrestrictedBatteryUsagePatch,
    hmdOnlyPatch,
    xrCoreRuntimePatch,
    xrDeviceConfigBaselinePatch,
    xrInputRoutingConfigPatch,
    xrLauncherBootstrapPatch,
    xrStartupPermissionsPatch,
    xrManifestCapabilityPackPatch,
)

/**
 * Offline integration audit for apktool-rebuilt decoded Steam Link bases.
 *
 * This deliberately does not sign, install, deploy, or contact a device. It executes every
 * compatible public patch independently on 2.0.20/5001712, produces 3 unsigned high-resolution
 * APKs, checks Visual Delay on the 3 exact bases, and applies the 3 recommendation bundles to
 * the decoded bases that are available. It does not turn decoded-fixture success into runtime proof.
 */
object DecodedSteamLinkPatchAudit {
    @JvmStatic
    fun main(args: Array<String>) {
        if (args.size == 2) {
            runIsolatedAudits(args[0], args[1])
            return
        }
        require(args.size == 4) {
            "Usage: DecodedSteamLinkPatchAudit <decoded-fixture-apk-directory> <audit-output-directory>"
        }
        runBlocking { runSingleAudit(args) }
    }
}

private fun runIsolatedAudits(fixtureDirectory: String, outputDirectory: String) {
    (0 until publicPatchesFor5001712.size * legacyPublicFixtures.size).forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "public", index)
    }
    publicPatchesFor5002363.indices.forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "public-modern", index)
    }
    highResolutionFixtures.indices.forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "high-resolution", index)
    }
    visualDelayFixtures.indices.forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "visual-delay", index)
    }
    recommendedBundleFixtures.indices.forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "recommended", index)
    }
}

private fun runAuditChild(fixtureDirectory: String, outputDirectory: String, kind: String, index: Int) {
    val javaHome = File(System.getProperty("java.home"), "bin")
    val java = File(javaHome, "java.exe").takeIf(File::isFile) ?: File(javaHome, "java")
    val command = listOf(
        java.absolutePath,
        "-cp",
        System.getProperty("java.class.path"),
        DecodedSteamLinkPatchAudit::class.java.name,
        fixtureDirectory,
        outputDirectory,
        kind,
        index.toString(),
    )
    val exitCode = ProcessBuilder(command).inheritIO().start().waitFor()
    check(exitCode == 0) { "$kind audit child $index exited with $exitCode" }
}

private suspend fun runSingleAudit(args: Array<String>) {
    val fixtureDirectory = File(args[0]).canonicalFile
    val outputDirectory = File(args[1]).canonicalFile.apply { mkdirs() }
    val index = args[3].toInt()

    when (args[2]) {
        "public-modern" -> {
            val patch = publicPatchesFor5002363[index]
            val fixture = highResolutionFixtures.single { it.versionCode == "5002363" }
            val input = fixtureFile(fixtureDirectory, fixture)
            val caseDirectory = File(outputDirectory, "5002363-public-${requireNotNull(patch.name).safeName()}")
            val output = File(caseDirectory, "steamlink-5002363-unsigned.apk")
            configurePublicAuditOptions(patch)
            executePatch(input, patch, File(caseDirectory, "temporary"), output)
            verifyModernPublicOutput(input, output, patch, fixture)
            println("PASS 2.0.23/5002363 public patch: ${patch.name}: $output")
        }

        "public" -> {
            val patch = publicPatchesFor5001712[index % publicPatchesFor5001712.size]
            val base = legacyPublicFixtures[index / publicPatchesFor5001712.size]
            val patchName = requireNotNull(patch.name)
            val fixture = fixtureFile(fixtureDirectory, base)
            require(fixture.isFile) { "Missing decoded APK fixture: $fixture" }
            val patchDirectory = File(outputDirectory, "${base.versionCode}-public-${patchName.safeName()}")
            val output = File(patchDirectory, "steamlink-${base.versionCode}-${patchName.safeName()}-unsigned.apk")
            configurePublicAuditOptions(patch)
            executePatch(fixture, patch, File(patchDirectory, "temporary"), output)
            verifyPublicPatchOutput(output, patch, base)
            if (patch == xrGalaxyXrHighResolutionPatch) {
                verifyStandaloneHighResolutionBoundary(fixture, output, base)
            }
            println("PASS ${base.versionName}/${base.versionCode} public patch output: $patchName: $output")
        }

        "high-resolution" -> {
            val fixture = highResolutionFixtures[index]
            val input = fixtureFile(fixtureDirectory, fixture)
            require(input.isFile) { "Missing decoded APK fixture: $input" }
            val caseDirectory = File(outputDirectory, "high-resolution-${fixture.versionCode}")
            val output = File(caseDirectory, "steamlink-${fixture.versionCode}-high-resolution-unsigned.apk")
            output.parentFile.mkdirs()
            executePatch(input, xrGalaxyXrHighResolutionPatch, File(caseDirectory, "temporary"), output)
            verifyHighResolutionOutput(output, fixture)
            verifyStandaloneHighResolutionBoundary(input, output, fixture)
            println("PASS ${fixture.versionName}/${fixture.versionCode} high-resolution output: $output")
        }

        "startup-excluded" -> {
            val fixture = highResolutionFixtures.single { it.versionCode == "5002363" }
            val input = fixtureFile(fixtureDirectory, fixture)
            val caseDirectory = File(outputDirectory, "startup-excluded-${fixture.versionCode}")
            val output = File(caseDirectory, "steamlink-${fixture.versionCode}-excluded-startup-unsigned.apk")
            val forcedDependencies = rawResourcePatch(name = "Excluded startup guard audit", default = false) {
                dependsOn(xrLauncherBootstrapPatch, xrStartupPermissionsPatch)
                // Resource compiler fixture workaround; excluded patch bodies stay unchanged.
                execute { ensureIdsXml(get("res/values/ids.xml")) }
            }
            executePatch(input, forcedDependencies, File(caseDirectory, "temporary"), output)
            ZipFile(input).use { original -> ZipFile(output).use { patched ->
                // Morphe may renumber untouched original DEX files after inserting helpers.
                val outputDex = patched.dexEntries().map { patched.requireEntryBytes(it) }
                original.dexEntries().forEach { path ->
                    check(outputDex.any { it.contentEquals(original.requireEntryBytes(path)) }) {
                        "Excluded startup dependencies changed original DEX content: $path"
                    }
                }
                val scene = "lib/arm64-v8a/libvrlink_scene.so"
                check(original.requireEntryBytes(scene).contentEquals(patched.requireEntryBytes(scene)))
                val manifest = patched.requireEntryBytes("AndroidManifest.xml")
                check(!manifest.containsEncodedString("GalaxyXRPermissionActivity"))
                check(!manifest.containsEncodedString("android.window.PROPERTY_XR_ACTIVITY_START_MODE"))
                patched.requireStartupFlags(splash = false, permissions = false)
            } }
            println("PASS ${fixture.versionCode} excluded startup dependencies remain inert: $output")
        }

        "visual-delay" -> {
            val fixture = visualDelayFixtures[index]
            val input = fixtureFile(fixtureDirectory, fixture)
            require(input.isFile) { "Missing decoded APK fixture: $input" }
            val caseDirectory = File(outputDirectory, "visual-delay-${fixture.versionCode}")
            val output = File(caseDirectory, "steamlink-${fixture.versionCode}-visual-delay-unsigned.apk")
            output.parentFile.mkdirs()
            executePatch(input, hmdOnlyPatch, File(caseDirectory, "temporary"), output)
            verifyVisualDelayOutput(input, output, fixture)
            println("PASS ${fixture.versionName}/${fixture.versionCode} Visual Delay output: $output")
        }

        "recommended" -> {
            val selection = recommendedBundleFixtures[index]
            val fixture = selection.base
            val input = fixtureFile(fixtureDirectory, fixture)
            require(input.isFile) { "Missing decoded APK fixture: $input" }
            val caseDirectory = File(outputDirectory, "recommended-${fixture.versionCode}")
            val output = File(caseDirectory, "steamlink-${fixture.versionCode}-recommended-unsigned.apk")
            output.parentFile.mkdirs()
            executePatch(input, selection.patch, File(caseDirectory, "temporary"), output)
            verifyRecommendedBundleOutput(input, output, fixture)
            verifyVisualDelayOutput(input, output, fixture)
            println("PASS ${fixture.versionName}/${fixture.versionCode} recommended bundle output: $output")
        }

        else -> error("Unknown audit kind: ${args[2]}")
    }
}

private fun configurePublicAuditOptions(patch: Patch<*>) {
    when (patch) {
        controllerVelocityPatch -> patch.options["poseSendCadence"] = "half-2x"
        deviceIdentityPatch -> patch.options["profile"] = "meta-quest-pro"
        else -> Unit
    }
}

private fun verifyPublicPatchOutput(outputApk: File, patch: Patch<*>, fixture: HighResolutionFixture) {
    val sites = legacySites.getValue(fixture.versionCode)
    check(outputApk.isFile && outputApk.length() > 0) { "Public patch did not emit an APK: ${patch.name}" }
    ZipFile(outputApk).use { apk ->
        val scene by lazy { apk.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so") }
        val manifest by lazy { apk.requireEntryBytes("AndroidManifest.xml") }
        val nop = "1f2003d5".hexBytes()

        when (patch) {
            androidXrNativePermissionNamesPatch -> {
                scene.requireBytesAt(sites.face, "android.permission.HAND_TRACKING".paddedAscii(36))
                scene.requireBytesAt(sites.eye, "android.permission.EYE_TRACKING_FINE".paddedAscii(36))
            }

            appearOnTopPatch -> {
                manifest.requireEncodedString("android.permission.SYSTEM_ALERT_WINDOW")
                apk.requireDexString("GxrOverlayBridge")
            }

            changePackageNamePatch -> {
                manifest.requireEncodedString("com.valvesoftware.steamlinkvr.gxr")
                apk.requireDexString("com.valvesoftware.steamlinkvr.gxr")
            }

            controllerVelocityPatch -> {
                apk.requireElf("lib/arm64-v8a/libgxr_controller_velocity.so")
                scene.requireBytesAt(sites.cadence, "62008052".hexBytes())
                apk.requireEntryBytes(
                    "assets/openxr/1/api_layers/implicit.d/" +
                        "XR_APILAYER_local_GalaxyXR_controller_velocity.json",
                ).requireEncodedString("XR_APILAYER_local_GalaxyXR_controller_velocity")
            }

            deviceIdentityPatch -> {
                val hmdConfig = apk.requireEntryBytes("assets/config/hmd_config.json")
                hmdConfig.requireEncodedString("\"sModelNumber\": \"Oculus Quest Pro\"")
                if (fixture.versionCode == "5001712") hmdConfig.require5001712RequestedExtensionsObject()
                else check(com.google.gson.JsonParser.parseString(hmdConfig.decodeToString()).asJsonObject["requestedExtensions"].isJsonArray)
            }

            forceHmdInitializationGatesPatch -> {
                scene.requireBytesAt(sites.gates[0], nop)
                scene.requireBytesAt(sites.gates[1], nop)
            }

            forceLobbyPermissionStateGatePatch -> scene.requireBytesAt(sites.gates[2], nop)

            forceStreamXrGatesPatch -> {
                scene.requireBytesAt(sites.gates[3], nop)
                scene.requireBytesAt(sites.gates[4], nop)
                scene.requireBytesAt(sites.gates[5], nop)
            }

            gxrFacebridgePatch -> {
                apk.requireElf("lib/arm64-v8a/libgxr_face_bridge.so")
                manifest.requireEncodedString("android.permission.FACE_TRACKING")
            }

            xrGalaxyXrHighResolutionPatch -> verifyHighResolutionZip(apk, fixture)

            microphoneInputPresetPatch -> scene.requireBytesAt(sites.mic, "c1008052".hexBytes())

            oledCalibrationPatch -> scene.requireEncodedString("const float DITHER_ENABLE=0.;")

            unrestrictedBatteryUsagePatch -> {
                manifest.requireEncodedString("android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
                apk.requireDexString("GalaxyXRPermissionActivity")
            }

            hmdOnlyPatch -> {
                check(!scene.copyOfRange(sites.hook, sites.hook + 4).contentEquals("e20740f9".hexBytes())) {
                    "Visual Delay Fix left the 5001712 HMD hook unchanged"
                }
                // Full cave/mapping/exact-diff validation lives in the native audit.
                scene.requireBytesAt(64 + 8 * 56, "0100000005000000".hexBytes())
            }

            xrCoreRuntimePatch -> {
                apk.requireElf("lib/arm64-v8a/libgxr_xr_bridge.so")
                apk.requireDexString("GxrSdlBridge")
            }

            xrDeviceConfigBaselinePatch -> {
                val hmdConfig = apk.requireEntryBytes("assets/config/hmd_config.json")
                hmdConfig.requireEncodedString("\"sModelNumber\": \"Galaxy XR\"")
                if (fixture.versionCode == "5001712") hmdConfig.require5001712RequestedExtensionsObject()
                else check(com.google.gson.JsonParser.parseString(hmdConfig.decodeToString()).asJsonObject["requestedExtensions"].isJsonArray)
                apk.requireEntryBytes("assets/config/default_config.json")
                    .requireEncodedString("\"ignore_microphone_muted\": false")
            }

            xrInputRoutingConfigPatch -> apk.requireEntryBytes("assets/config/ui_config.json")
                .requireEncodedString("XR_EXT_hand_interaction")

            xrLauncherBootstrapPatch -> {
                manifest.requireEncodedString("GalaxyXRPermissionActivity")
                manifest.requireEncodedString("org.khronos.openxr.intent.category.IMMERSIVE_HMD")
                apk.requireStartupFlags(splash = true, permissions = false)
            }

            xrStartupPermissionsPatch -> {
                manifest.requireEncodedString("GalaxyXRPermissionActivity")
                apk.requireStartupFlags(splash = false, permissions = true)
            }

            xrManifestCapabilityPackPatch -> {
                manifest.requireEncodedString("org.khronos.openxr.permission.OPENXR")
                manifest.requireEncodedString("android.permission.HAND_TRACKING")
            }

            else -> error("No public output invariant for ${patch.name}")
        }
    }
}

private fun verifyModernPublicOutput(
    input: File,
    output: File,
    patch: Patch<*>,
    fixture: HighResolutionFixture,
) {
    ZipFile(input).use { original -> ZipFile(output).use { result ->
        val scenePath = "lib/arm64-v8a/libvrlink_scene.so"
        val stock = original.requireEntryBytes(scenePath)
        val scene = result.requireEntryBytes(scenePath)
        val expectedScene = when (patch) {
            gxrModernTongueBridgePatch -> patchModernTongueTransport(stock, fixture.versionName, fixture.versionCode)
            microphoneInputPresetPatch -> patchNativeMicrophonePreset(stock, "voice-recognition", fixture.versionName, fixture.versionCode)
            hmdOnlyPatch -> patchVisualDelay(stock, 60, fixture.versionName, fixture.versionCode)
            oledCalibrationPatch -> null // Full matrix/exact diff is checked by OledDecodedCompatibilityAudit.
            else -> stock
        }
        expectedScene?.let { check(scene.contentEquals(it)) { "${patch.name}: unexpected scene bytes" } }
        if (patch == oledCalibrationPatch) {
            scene.requireEncodedString("const float DITHER_ENABLE=0.;")
            scene.requireEncodedString("vec3(1.20)")
            scene.requireEncodedString("c,1.45)")
            val shader = app.template.patches.steamlink.binary.findVideoShader(stock)
            check(stock.indices.all { stock[it] == scene[it] || it in shader until shader + 1087 })
        }
        for (name in listOf("hmd_config.json", "controller_config.json", "default.vrsettings", "ui_config.json")) {
            val path = "assets/config/$name"
            if (original.getEntry(path) == null) continue
            val bytes = original.requireEntryBytes(path)
            val expected = if (patch == deviceIdentityPatch && name == "hmd_config.json") {
                patchHmdModelIdentity(bytes.decodeToString(), "meta-quest-pro", exactProductLookup = true).encodeToByteArray()
            } else bytes
            check(result.requireEntryBytes(path).contentEquals(expected)) { "${patch.name}: changed $path unexpectedly" }
        }
        scene.requireBytesAt(fixture.permissionOffset, permissionOriginal)
        val manifest = result.requireEntryBytes("AndroidManifest.xml")
        check(!manifest.containsEncodedString("GalaxyXRPermissionActivity"))
        check(!manifest.containsEncodedString("android.permission.SYSTEM_ALERT_WINDOW"))
        check(!manifest.containsEncodedString("android.window.PROPERTY_XR_ACTIVITY_START_MODE"))
        if (patch == unrestrictedBatteryUsagePatch) {
            verifyNativeStartupBoundary(original, result)
            manifest.requireEncodedString("android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
        } else {
            val outputDex = result.dexEntries().map { result.requireEntryBytes(it) }
            original.dexEntries().forEach { path ->
                check(outputDex.any { it.contentEquals(original.requireEntryBytes(path)) }) {
                    "${patch.name}: modified stock DEX $path"
                }
            }
        }
    } }
    if (patch == xrGalaxyXrHighResolutionPatch) {
        verifyHighResolutionOutput(output, fixture)
        verifyStandaloneHighResolutionBoundary(input, output, fixture)
    }
    if (patch == hmdOnlyPatch) verifyVisualDelayOutput(input, output, fixture)
}

private suspend fun executePatch(
    inputApk: File,
    patch: Patch<*>,
    temporaryDirectory: File,
    outputApk: File?,
) {
    val isolatedInput = File(temporaryDirectory.parentFile, "isolated-input.apk")
    isolatedInput.parentFile.mkdirs()
    inputApk.copyTo(isolatedInput, overwrite = true)
    outputApk?.let { inputApk.copyTo(it, overwrite = true) }

    Patcher(PatcherConfig(isolatedInput, temporaryDirectory)).use { patcher ->
        patcher += setOf(patch)
        val failures = patcher().toList().filter { it.exception != null }
        check(failures.isEmpty()) {
            failures.joinToString("\n") { result ->
                "${result.patch.name}: ${result.exception?.stackTraceToString()}"
            }
        }
        val result = patcher.get()
        if (outputApk == null) {
            result.dexFiles.forEach { it.stream.close() }
        } else {
            result.applyTo(outputApk)
        }
    }
}

private fun verifyHighResolutionOutput(
    outputApk: File,
    fixture: HighResolutionFixture,
    recommended: Boolean = false,
) {
    ZipFile(outputApk).use { apk ->
        verifyHighResolutionZip(apk, fixture, recommended)
    }
}

private fun verifyVisualDelayOutput(
    inputApk: File,
    outputApk: File,
    fixture: HighResolutionFixture,
) {
    val original = ZipFile(inputApk).use { it.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so") }
    val patched = ZipFile(outputApk).use { it.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so") }
    check(!patched.contentEquals(original)) { "${fixture.versionCode}: Visual Delay left native library unchanged" }
    check(patched.size == original.size) { "${fixture.versionCode}: Visual Delay changed native library size" }

    val tailOffset = original.firstExecutableLoadEnd() - 32
    check(tailOffset >= 0) { "${fixture.versionCode}: invalid executable segment tail" }
    check(
        patched.copyOfRange(tailOffset, tailOffset + 32)
            .contentEquals(original.copyOfRange(tailOffset, tailOffset + 32)),
    ) { "${fixture.versionCode}: Visual Delay changed live executable-segment tail/PLT entries" }

    val originalTypes = original.programHeaderTypes()
    val patchedTypes = patched.programHeaderTypes()
    check(patchedTypes.count { it == 1 } == originalTypes.count { it == 1 } + 1) {
        "${fixture.versionCode}: Visual Delay did not add exactly one PT_LOAD mapping"
    }
    check(patchedTypes.count { it == 4 } == originalTypes.count { it == 4 } - 1) {
        "${fixture.versionCode}: Visual Delay did not consume exactly one PT_NOTE mapping"
    }
    val injectedIndex = originalTypes.indices.single { originalTypes[it] == 4 && patchedTypes[it] == 1 }
    val injectedHeader = patched.programHeaderOffsets()[injectedIndex]
    val injectedOffset = patched.readU64LE(injectedHeader + 8)
    val injectedVaddr = patched.readU64LE(injectedHeader + 16)
    val injectedAlignment = patched.readU64LE(injectedHeader + 48)
    val expectedAlignment = original.programHeaderOffsets()
        .filter { original.readU32LE(it) == 1 }
        .maxOf { original.readU64LE(it + 48) }
    check(injectedAlignment == expectedAlignment) {
        "${fixture.versionCode}: injected alignment 0x${injectedAlignment.toString(16)} " +
            "did not inherit 0x${expectedAlignment.toString(16)}"
    }
    check(injectedOffset % injectedAlignment == injectedVaddr % injectedAlignment) {
        "${fixture.versionCode}: injected PT_LOAD offset/vaddr are not alignment-congruent"
    }
}

private fun verifyRecommendedBundleOutput(inputApk: File, outputApk: File, fixture: HighResolutionFixture) {
    ZipFile(outputApk).use { apk ->
        val manifest = apk.requireEntryBytes("AndroidManifest.xml")
        val scene = apk.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so")
        manifest.requireEncodedString("org.khronos.openxr.permission.OPENXR")
        manifest.requireEncodedString("android.permission.HAND_TRACKING")
        manifest.requireEncodedString("android.permission.FACE_TRACKING")
        manifest.requireEncodedString("android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
        if (isModernTongueBridgeSteamLinkBuild(fixture.versionName, fixture.versionCode)) {
            check(apk.getEntry("lib/arm64-v8a/libgxr_face_bridge.so") == null) {
                "5002363: modern tongue recommendation installed the legacy full face bridge"
            }
            scene.requireBytesAt(
                vaddrToFileOffset(scene, MODERN_TONGUE_VADDR_5002363, MODERN_TONGUE_REPLACEMENT.size),
                MODERN_TONGUE_REPLACEMENT,
            )
        } else {
            apk.requireElf("lib/arm64-v8a/libgxr_face_bridge.so")
        }
        check(!manifest.containsEncodedString("android.permission.SYSTEM_ALERT_WINDOW")) {
            "${fixture.versionCode}: recommended bundle requested SYSTEM_ALERT_WINDOW"
        }
        // Check emitted shader/preset bytes, not just the bundle membership. OLED must not
        // re-enable dithering after removal of the public Video dither patch.
        scene.requireEncodedString("const float DITHER_ENABLE=0.;")
        scene.requireEncodedString("vec3(1.20)")
        scene.requireEncodedString("c,1.45)")
        check(scene.containsSubsequence("e00b40f9c1008052".hexBytes())) {
            "${fixture.versionCode}: Voice Recognition AAudio preset not found"
        }
        // Original pose load followed by MOVZ/MOVK X16 for exactly 60,000,000 ns, ADD X2.
        check(scene.containsSubsequence("e20740f910e090d27072a0f24200108b".hexBytes())) {
            "${fixture.versionCode}: 60 ms Visual Delay trampoline not found"
        }
        if (fixture.versionCode == "5002363") scene.requireBytesAt(0xF44C0, "c1008052".hexBytes())
        if (isModernTongueBridgeSteamLinkBuild(fixture.versionName, fixture.versionCode)) {
            manifest.requireEncodedString("com.valvesoftware.steamlink.SteamLink")
            manifest.requireEncodedString("android.intent.category.LAUNCHER")
            manifest.requireEncodedString("com.oculus.intent.category.2D")
            check(!manifest.containsEncodedString("GalaxyXRPermissionActivity")) {
                "5002363: recommended bundle installed a replacement launcher activity"
            }
            check(!manifest.containsEncodedString("android.window.PROPERTY_XR_ACTIVITY_START_MODE")) {
                "5002363: recommended bundle changed the stock XR activity start mode"
            }
            ZipFile(inputApk).use { original -> verifyNativeStartupBoundary(original, apk) }
        } else {
            manifest.requireEncodedString("GalaxyXRPermissionActivity")
            manifest.requireEncodedString("XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED")
            apk.requireStartupFlags(splash = true, permissions = true)
        }
        if (fixture.versionCode != "5002363") {
            apk.requireEntryBytes("lib/arm64-v8a/libgxr_xr_bridge.so")
            apk.requireEntryBytes("assets/config/ui_config.json")
            val hmdConfig = apk.requireEntryBytes("assets/config/hmd_config.json")
            val questPayload = requireNotNull(DecodedSteamLinkPatchAudit::class.java.getResourceAsStream(
                "/steamlink/identity/hmd_config_meta_quest_pro.json",
            )).use { it.readBytes() }
            val expectedHmdConfig = adaptLegacyHmdConfigForBuild(
                questPayload, fixture.versionName, fixture.versionCode,
            )
            check(hmdConfig.contentEquals(expectedHmdConfig)) {
                "${fixture.versionCode}: legacy bundle did not retain the complete Quest Pro identity payload"
            }
            check(Regex("\"sModelNumber\": \"Oculus Quest Pro\"").findAll(hmdConfig.decodeToString()).count() == 3) {
                "${fixture.versionCode}: expected Quest Pro spoof on all 3 runtime-selected HMD entries"
            }
            if (fixture.versionCode == "5001712") hmdConfig.require5001712RequestedExtensionsObject()
                else check(com.google.gson.JsonParser.parseString(hmdConfig.decodeToString()).asJsonObject["requestedExtensions"].isJsonArray)
            scene.requireEncodedString("android.permission.EYE_TRACKING_FINE")
            val gateOffsets = when (fixture.versionCode) {
                "5001712" -> listOf(0xFFE20, 0xFFE28, 0x10DB10, 0x116564, 0x11656C, 0x116620)
                "5001812", "5001968" -> legacySites.getValue(fixture.versionCode).gates
                "5002244" -> listOf(0xFD040, 0xFD048, 0x10B658, 0x1140AC, 0x1140B4, 0x114168)
                else -> error("Missing legacy gate audit for ${fixture.versionCode}")
            }
            gateOffsets.forEach { scene.requireBytesAt(it, "1f2003d5".hexBytes()) }
            verifyLegacyPointerRouting(apk, fixture)
        } else {
            // Automatic legacy identity must not change the native recommendation.
            val original = ZipFile(inputApk).use { it.requireEntryBytes("assets/config/hmd_config.json") }
            val expected = original
            check(apk.requireEntryBytes("assets/config/hmd_config.json").contentEquals(expected)) {
                "${fixture.versionCode}: native HMD identity changed from its existing recommendation"
            }
        }
    }
    verifyHighResolutionOutput(outputApk, fixture, recommended = true)
}

private fun verifyLegacyPointerRouting(apk: ZipFile, fixture: HighResolutionFixture) {
    if (!isTwoProjectionSteamLinkBuild(fixture.versionName, fixture.versionCode)) return
    val routes = listOf(
        Triple("Lorg/libsdl/app/SDLSurface;", "onTouch", "routeXrPointerAsMouse5001712"),
        Triple("Lorg/libsdl/app/SDLGenericMotionListener_API14;", "onGenericMotion", "routeXrPointerAsMouseGeneric5001712"),
    )
    val bridge = apk.requireDexClass("Lorg/libsdl/app/GxrSdlBridge;")
    for ((type, methodName, route) in routes) {
        val method = apk.requireDexClass(type).methods.single { it.name == methodName }
        val calls = method.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
        check(calls.any { it.definingClass == bridge.type && it.name == route }) {
            "${fixture.versionCode}: missing mouse-only route in $type->$methodName"
        }
        check(bridge.methods.any { it.name == route && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/view/MotionEvent;") && it.returnType == "V" })
    }
}

private fun verifyHighResolutionZip(
    apk: ZipFile,
    fixture: HighResolutionFixture,
    recommended: Boolean = false,
) {
    check(apk.getEntry("lib/arm64-v8a/libgxr_ast_underside.so") == null)
    check(apk.getEntry("assets/openxr/1/api_layers/implicit.d/" +
        "XR_APILAYER_local_GalaxyXR_android_surface_underside_projection_v1.json") == null)
    val installedHelper = apk.requireEntryBytes("lib/arm64-v8a/libgxr_ast.so")
    installedHelper.requireBytesAt(0, byteArrayOf(0x7f, 0x45, 0x4c, 0x46))
    val expectedResourceName = androidSurfaceTriggerResourceLibraryForBuild(
        fixture.versionName,
        fixture.versionCode,
    )
    val expectedHelper = requireNotNull(DecodedSteamLinkPatchAudit::class.java.getResourceAsStream(
        "/steamlink/androidxr/$expectedResourceName",
    )) { "Missing bundled high-resolution helper: $expectedResourceName" }.use { it.readBytes() }
    check(installedHelper.contentEquals(expectedHelper)) {
        "${fixture.versionName}/${fixture.versionCode}: installed helper does not match " +
            expectedResourceName
    }
    val expectedBuildId = if (isTwoProjectionSteamLinkBuild(fixture.versionName, fixture.versionCode)) {
        ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID
    } else {
        ANDROID_SURFACE_TRIGGER_BUILD_ID
    }
    installedHelper.requireEncodedString(expectedBuildId)
    apk.requireEntryBytes(
        "assets/openxr/1/api_layers/implicit.d/" + ANDROID_SURFACE_TRIGGER_MANIFEST,
    ).requireEncodedString("XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1")

    val bytes = apk.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so")
    val actual = bytes.copyOfRange(
        fixture.permissionOffset,
        fixture.permissionOffset + permissionOriginal.size,
    )
    val expected = if (recommended && fixture.permissionMustBePatched) permissionReplacement else permissionOriginal
    check(actual.contentEquals(expected)) {
        "${fixture.versionCode}: permission routine at 0x" +
            fixture.permissionOffset.toString(16) + " was ${actual.toHex()}, expected ${expected.toHex()}"
    }
}

private fun verifyStandaloneHighResolutionBoundary(
    inputApk: File,
    outputApk: File,
    fixture: HighResolutionFixture,
) {
    ZipFile(inputApk).use { original ->
        ZipFile(outputApk).use { patched ->
            val originalDex = original.dexEntries()
            check(originalDex == patched.dexEntries()) {
                "${fixture.versionCode}: standalone high resolution added or removed DEX files"
            }
            (originalDex + "lib/arm64-v8a/libvrlink_scene.so").forEach { path ->
                check(original.requireEntryBytes(path).contentEquals(patched.requireEntryBytes(path))) {
                    "${fixture.versionCode}: standalone high resolution changed $path"
                }
            }
            val manifest = patched.requireEntryBytes("AndroidManifest.xml")
            listOf("GalaxyXRPermissionActivity", "XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED",
                "XR_ACTIVITY_START_MODE_FULL_SPACE_MANAGED").forEach { value ->
                check(manifest.containsEncodedString(value) ==
                    original.requireEntryBytes("AndroidManifest.xml").containsEncodedString(value)) {
                    "${fixture.versionCode}: standalone high resolution changed startup marker $value"
                }
            }
        }
    }
}

private fun ZipFile.dexEntries(): List<String> = entries().asSequence()
    .map { it.name }.filter { it.matches(Regex("classes\\d*\\.dex")) }.sorted().toList()

private fun ZipFile.requireDexClass(descriptor: String): ClassDef = dexEntries().asSequence()
    .flatMap { path ->
        DexBackedDexFile.fromInputStream(
            Opcodes.getDefault(), requireEntryBytes(path).inputStream(),
        ).classes.asSequence()
    }.single { it.type == descriptor }

private fun ZipFile.requireStartupFlags(splash: Boolean, permissions: Boolean) {
    val activity = requireDexClass("Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;")
    mapOf("shouldShowSplash" to splash, "shouldRequestRuntimePermissions" to permissions)
        .forEach { (name, enabled) ->
            val instructions = requireNotNull(activity.methods.single { it.name == name }.implementation)
                .instructions.toList()
            check(instructions.size == 2 && instructions.last().opcode == Opcode.RETURN &&
                (instructions.first() as? NarrowLiteralInstruction)?.narrowLiteral == if (enabled) 1 else 0) {
                "Startup flag $name did not match the explicit patch selection ($enabled)"
            }
        }
}

private fun Method.auditSignature(): String =
    name + parameterTypes.joinToString(prefix = "(", postfix = ")", separator = "") + returnType

private fun Method.calledMethods(): List<MethodReference> = implementation?.instructions?.toList().orEmpty()
    .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }

private fun verifyNativeStartupBoundary(original: ZipFile, patched: ZipFile) {
    val descriptor = "Lcom/valvesoftware/steamlink/SteamLink;"
    val before = original.requireDexClass(descriptor).methods.associateBy { it.auditSignature() }
    val after = patched.requireDexClass(descriptor).methods.associateBy { it.auditSignature() }
    check(before.keys == after.keys) { "stock SteamLink method set changed" }
    val batteryDescriptor = "Lcom/valvesoftware/steamlink/GxrBatterySettings;"
    before.forEach { (signature, source) ->
        val output = after.getValue(signature)
        val calls = output.calledMethods()
        val batteryCalls = calls.filter { it.definingClass == batteryDescriptor }
        val isCreate = signature == "onCreate(Landroid/os/Bundle;)V"
        check(batteryCalls.size == if (isCreate) 1 else 0) {
            "unexpected battery hook count in SteamLink.$signature"
        }
        if (isCreate) check(batteryCalls.single().name == "request")
        check(calls.filterNot { it.definingClass == batteryDescriptor } == source.calledMethods()) {
            "non-battery method calls changed in SteamLink.$signature"
        }
        check(output.implementation?.instructions?.toList().orEmpty().count() ==
            source.implementation?.instructions?.toList().orEmpty().count() + if (isCreate) 1 else 0) {
            "unexpected instruction count change in SteamLink.$signature"
        }
        val nonBatteryInstructions = output.implementation?.instructions?.toList().orEmpty().filterNot {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == batteryDescriptor
        }
        check(nonBatteryInstructions.map { it.opcode } ==
            source.implementation?.instructions?.toList().orEmpty().map { it.opcode }) {
            "stock opcode sequence changed in SteamLink.$signature"
        }
    }
}

private fun ZipFile.requireEntryBytes(path: String): ByteArray {
    val entry = getEntry(path) ?: error("Missing APK entry: $path")
    return getInputStream(entry).use { it.readBytes() }
}

private fun ZipFile.requireElf(path: String) {
    requireEntryBytes(path).requireBytesAt(0, byteArrayOf(0x7f, 0x45, 0x4c, 0x46))
}

private fun ZipFile.requireDexString(value: String) {
    val found = entries().asSequence()
        .filter { it.name.matches(Regex("classes\\d*\\.dex")) }
        .any { entry -> getInputStream(entry).use { it.readBytes() }.containsSubsequence(value.encodeToByteArray()) }
    check(found) { "DEX string is absent: $value" }
}

private fun ByteArray.requireBytesAt(offset: Int, expected: ByteArray) {
    check(offset >= 0 && offset + expected.size <= size) { "Byte range 0x${offset.toString(16)} is outside entry" }
    val actual = copyOfRange(offset, offset + expected.size)
    check(actual.contentEquals(expected)) {
        "Bytes at 0x${offset.toString(16)} were ${actual.toHex()}, expected ${expected.toHex()}"
    }
}

private fun ByteArray.firstExecutableLoadEnd(): Int {
    val phoff = readU64LE(32).toInt()
    val phesz = readU16LE(54)
    val phnum = readU16LE(56)
    val header = (0 until phnum).map { phoff + it * phesz }.single { offset ->
        readU32LE(offset) == 1 && (readU32LE(offset + 4) and 1) != 0 && readU64LE(offset + 8) == 0L
    }
    return (readU64LE(header + 8) + readU64LE(header + 32)).toInt()
}

private fun ByteArray.programHeaderTypes(): List<Int> {
    return programHeaderOffsets().map(::readU32LE)
}

private fun ByteArray.programHeaderOffsets(): List<Int> {
    val phoff = readU64LE(32).toInt()
    val phesz = readU16LE(54)
    return (0 until readU16LE(56)).map { phoff + it * phesz }
}

private fun ByteArray.readU16LE(offset: Int): Int =
    (this[offset].toInt() and 0xFF) or ((this[offset + 1].toInt() and 0xFF) shl 8)

private fun ByteArray.readU32LE(offset: Int): Int =
    readU16LE(offset) or (readU16LE(offset + 2) shl 16)

private fun ByteArray.readU64LE(offset: Int): Long =
    (readU32LE(offset).toLong() and 0xFFFFFFFFL) or
        ((readU32LE(offset + 4).toLong() and 0xFFFFFFFFL) shl 32)

private fun ByteArray.requireEncodedString(value: String) {
    val utf8 = value.encodeToByteArray()
    val utf16Le = value.toByteArray(Charsets.UTF_16LE)
    check(containsSubsequence(utf8) || containsSubsequence(utf16Le)) {
        "Encoded string is absent: $value"
    }
}

private fun ByteArray.containsEncodedString(value: String): Boolean =
    containsSubsequence(value.encodeToByteArray()) ||
        containsSubsequence(value.toByteArray(Charsets.UTF_16LE))

private fun ByteArray.require5001712RequestedExtensionsObject() {
    check(Regex("\"requestedExtensions\"\\s*:\\s*\\{").containsMatchIn(decodeToString())) {
        "2.0.20/5001712 HMD config must use the headset-keyed requestedExtensions object"
    }
    listOf("xrvst2", "xrvst2ue", "unknown").forEach { key -> requireEncodedString("\"$key\"") }
}

private fun ByteArray.containsSubsequence(needle: ByteArray): Boolean {
    if (needle.isEmpty()) return true
    if (needle.size > size) return false
    outer@ for (offset in 0..size - needle.size) {
        for (index in needle.indices) if (this[offset + index] != needle[index]) continue@outer
        return true
    }
    return false
}

private fun String.paddedAscii(size: Int): ByteArray = encodeToByteArray().copyOf(size)

private fun fixtureFile(directory: File, fixture: HighResolutionFixture) = File(
    directory,
    "decoded-apk-android-steamlinkvr-release-base-${fixture.versionName}-${fixture.versionCode}.apk",
)

private fun String.safeName(): String = lowercase()
    .replace(Regex("[^a-z0-9]+"), "-")
    .trim('-')

private fun String.hexBytes(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()

private fun ByteArray.toHex(): String = joinToString("") { "%02x".format(it) }
