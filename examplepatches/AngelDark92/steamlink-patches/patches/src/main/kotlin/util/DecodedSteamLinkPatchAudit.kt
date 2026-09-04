package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_BUILD_ID
import app.template.patches.steamlink.androidxr.ANDROID_SURFACE_TRIGGER_MANIFEST
import app.template.patches.steamlink.androidxr.androidSurfaceTriggerResourceLibraryForBuild
import app.template.patches.steamlink.androidxr.adaptLegacyHmdConfigForBuild
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
import app.template.patches.steamlink.binary.androidXrNativePermissionNamesPatch
import app.template.patches.steamlink.binary.forceHmdInitializationGatesPatch
import app.template.patches.steamlink.binary.forceLobbyPermissionStateGatePatch
import app.template.patches.steamlink.binary.forceStreamXrGatesPatch
import app.template.patches.steamlink.binary.hmdOnlyPatch
import app.template.patches.steamlink.binary.microphoneInputPresetPatch
import app.template.patches.steamlink.binary.oledCalibrationPatch
import app.template.patches.steamlink.galaxyXrLegacyFoundationPatch
import app.template.patches.steamlink.galaxyXrRecommended5001712Patch
import app.template.patches.steamlink.galaxyXrRecommended5002318Patch
import app.template.patches.steamlink.galaxyXrRecommended5002322Patch
import app.template.patches.steamlink.identity.changePackageNamePatch
import app.template.patches.steamlink.identity.deviceIdentityPatch
import app.template.patches.steamlink.identity.patchNativeGalaxyIdentity
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
    HighResolutionFixture("2.0.22", "5002296", 0x14478c, true),
    HighResolutionFixture("2.0.22", "5002313", 0x1472a8, true),
    HighResolutionFixture("2.0.22", "5002318", 0x147418, false),
    HighResolutionFixture("2.0.22", "5002322", 0x148aac, false),
)

private data class RecommendedBundleFixture(
    val base: HighResolutionFixture,
    val patch: Patch<*>,
)

private val visualDelayFixtures = highResolutionFixtures.filter { it.versionCode != "5002296" }

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
        highResolutionFixtures.single { it.versionCode == "5002318" },
        galaxyXrRecommended5002318Patch,
    ),
    RecommendedBundleFixture(
        highResolutionFixtures.single { it.versionCode == "5002322" },
        galaxyXrRecommended5002322Patch,
    ),
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
    xrManifestCapabilityPackPatch,
)

/**
 * Offline integration audit for apktool-rebuilt decoded Steam Link bases.
 *
 * This deliberately does not sign, install, deploy, or contact a device. It executes every
 * compatible public patch independently on 2.0.20/5001712, produces 6 unsigned high-resolution
 * APKs, checks Visual Delay on 5 native layouts, and applies the 4 recommendation bundles to the
 * 4 decoded bases that are available. It does not turn decoded-fixture success into runtime proof.
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
    publicPatchesFor5001712.indices.forEach { index ->
        runAuditChild(fixtureDirectory, outputDirectory, "public", index)
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
        "public" -> {
            val patch = publicPatchesFor5001712[index]
            val patchName = requireNotNull(patch.name)
            val fixture = fixtureFile(fixtureDirectory, highResolutionFixtures.first())
            require(fixture.isFile) { "Missing decoded APK fixture: $fixture" }
            val patchDirectory = File(outputDirectory, "5001712-public-${patchName.safeName()}")
            val output = File(patchDirectory, "steamlink-5001712-${patchName.safeName()}-unsigned.apk")
            configurePublicAuditOptions(patch)
            executePatch(fixture, patch, File(patchDirectory, "temporary"), output)
            verifyPublicPatchOutput(output, patch)
            println("PASS 2.0.20/5001712 public patch output: $patchName: $output")
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
            println("PASS ${fixture.versionName}/${fixture.versionCode} high-resolution output: $output")
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

private fun verifyPublicPatchOutput(outputApk: File, patch: Patch<*>) {
    check(outputApk.isFile && outputApk.length() > 0) { "Public patch did not emit an APK: ${patch.name}" }
    ZipFile(outputApk).use { apk ->
        val scene by lazy { apk.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so") }
        val manifest by lazy { apk.requireEntryBytes("AndroidManifest.xml") }
        val nop = "1f2003d5".hexBytes()

        when (patch) {
            androidXrNativePermissionNamesPatch -> {
                scene.requireBytesAt(0x99924, "android.permission.HAND_TRACKING".paddedAscii(36))
                scene.requireBytesAt(0xA1A7F, "android.permission.EYE_TRACKING_FINE".paddedAscii(36))
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
                scene.requireBytesAt(0xF6468, "62008052".hexBytes())
                apk.requireEntryBytes(
                    "assets/openxr/1/api_layers/implicit.d/" +
                        "XR_APILAYER_local_GalaxyXR_controller_velocity.json",
                ).requireEncodedString("XR_APILAYER_local_GalaxyXR_controller_velocity")
            }

            deviceIdentityPatch -> {
                val hmdConfig = apk.requireEntryBytes("assets/config/hmd_config.json")
                hmdConfig.requireEncodedString("\"sModelNumber\": \"Oculus Quest Pro\"")
                hmdConfig.require5001712RequestedExtensionsObject()
            }

            forceHmdInitializationGatesPatch -> {
                scene.requireBytesAt(0xFFE20, nop)
                scene.requireBytesAt(0xFFE28, nop)
            }

            forceLobbyPermissionStateGatePatch -> scene.requireBytesAt(0x10DB10, nop)

            forceStreamXrGatesPatch -> {
                scene.requireBytesAt(0x116564, nop)
                scene.requireBytesAt(0x11656C, nop)
                scene.requireBytesAt(0x116620, nop)
            }

            gxrFacebridgePatch -> {
                apk.requireElf("lib/arm64-v8a/libgxr_face_bridge.so")
                manifest.requireEncodedString("android.permission.FACE_TRACKING")
            }

            xrGalaxyXrHighResolutionPatch -> verifyHighResolutionZip(apk, highResolutionFixtures.first())

            microphoneInputPresetPatch -> scene.requireBytesAt(0xF4584, "c1008052".hexBytes())

            oledCalibrationPatch -> scene.requireEncodedString("const float DITHER_ENABLE=0.;")

            unrestrictedBatteryUsagePatch -> {
                manifest.requireEncodedString("android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS")
                apk.requireDexString("GalaxyXRPermissionActivity")
            }

            hmdOnlyPatch -> {
                check(!scene.copyOfRange(0x1014E8, 0x1014EC).contentEquals("e20740f9".hexBytes())) {
                    "Visual Delay Fix left the 5001712 HMD hook unchanged"
                }
                scene.requireBytesAt(
                    0x20F2D0,
                    "700000f011f640f910a2079120021fd6700000f011fa40f910c2079120021fd6".hexBytes(),
                )
                scene.requireBytesAt(0x21DB98, "e20740f9".hexBytes())
                scene.requireBytesAt(64 + 8 * 56, "0100000005000000".hexBytes())
            }

            xrCoreRuntimePatch -> {
                apk.requireElf("lib/arm64-v8a/libgxr_xr_bridge.so")
                apk.requireDexString("GxrSdlBridge")
            }

            xrDeviceConfigBaselinePatch -> {
                val hmdConfig = apk.requireEntryBytes("assets/config/hmd_config.json")
                hmdConfig.requireEncodedString("\"sModelNumber\": \"Galaxy XR\"")
                hmdConfig.require5001712RequestedExtensionsObject()
                apk.requireEntryBytes("assets/config/default_config.json")
                    .requireEncodedString("\"ignore_microphone_muted\": false")
            }

            xrInputRoutingConfigPatch -> apk.requireEntryBytes("assets/config/ui_config.json")
                .requireEncodedString("XR_EXT_hand_interaction")

            xrLauncherBootstrapPatch -> {
                manifest.requireEncodedString("GalaxyXRPermissionActivity")
                manifest.requireEncodedString("org.khronos.openxr.intent.category.IMMERSIVE_HMD")
            }

            xrManifestCapabilityPackPatch -> {
                manifest.requireEncodedString("org.khronos.openxr.permission.OPENXR")
                manifest.requireEncodedString("android.permission.HAND_TRACKING")
            }

            else -> error("No public output invariant for ${patch.name}")
        }
    }
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

private fun verifyHighResolutionOutput(outputApk: File, fixture: HighResolutionFixture) {
    ZipFile(outputApk).use { apk ->
        verifyHighResolutionZip(apk, fixture)
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
        apk.requireElf("lib/arm64-v8a/libgxr_face_bridge.so")
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
        if (fixture.versionCode == "5002322") scene.requireBytesAt(0xF37E0, "c1008052".hexBytes())
        if (fixture.versionCode !in setOf("5002318", "5002322")) {
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
            scene.requireEncodedString("android.permission.EYE_TRACKING_FINE")
            val gateOffsets = when (fixture.versionCode) {
                "5001712" -> listOf(0xFFE20, 0xFFE28, 0x10DB10, 0x116564, 0x11656C, 0x116620)
                "5002244" -> listOf(0xFD040, 0xFD048, 0x10B658, 0x1140AC, 0x1140B4, 0x114168)
                else -> error("Missing legacy gate audit for ${fixture.versionCode}")
            }
            gateOffsets.forEach { scene.requireBytesAt(it, "1f2003d5".hexBytes()) }
        } else {
            // Automatic legacy identity must not change either native recommendation.
            val original = ZipFile(inputApk).use { it.requireEntryBytes("assets/config/hmd_config.json") }
            val expected = if (fixture.versionCode == "5002318") {
                patchNativeGalaxyIdentity(original.decodeToString()).encodeToByteArray()
            } else {
                original // 5002322 has no Device identity dependency at all.
            }
            check(apk.requireEntryBytes("assets/config/hmd_config.json").contentEquals(expected)) {
                "${fixture.versionCode}: native HMD identity changed from its existing recommendation"
            }
        }
    }
    verifyHighResolutionOutput(outputApk, fixture)
}

private fun verifyHighResolutionZip(apk: ZipFile, fixture: HighResolutionFixture) {
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
    val expectedBuildId = if (fixture.versionName == "2.0.20" && fixture.versionCode == "5001712") {
        ANDROID_SURFACE_TRIGGER_5001712_BUILD_ID
    } else {
        ANDROID_SURFACE_TRIGGER_BUILD_ID
    }
    installedHelper.requireEncodedString(expectedBuildId)
    apk.requireEntryBytes(
        "assets/openxr/1/api_layers/implicit.d/" + ANDROID_SURFACE_TRIGGER_MANIFEST,
    ).requireEncodedString("XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1")
    apk.requireDexString("GxrResolutionProbe")

    val bytes = apk.requireEntryBytes("lib/arm64-v8a/libvrlink_scene.so")
    val actual = bytes.copyOfRange(
        fixture.permissionOffset,
        fixture.permissionOffset + permissionOriginal.size,
    )
    val expected = if (fixture.permissionMustBePatched) permissionReplacement else permissionOriginal
    check(actual.contentEquals(expected)) {
        "${fixture.versionCode}: permission routine at 0x" +
            fixture.permissionOffset.toString(16) + " was ${actual.toHex()}, expected ${expected.toHex()}"
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
