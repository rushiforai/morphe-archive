package app.template.patches.steamlink

import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5001712
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5002318
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_5002322
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_RECOMMENDED
import app.template.patches.steamlink.androidxr.gxrFacebridgePatch
import app.template.patches.steamlink.androidxr.gxrModernTongueBridgePatch
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
import app.template.patches.steamlink.identity.deviceIdentityPatch

// Patch.default belongs to the patch object rather than to an AppTarget. These exact-build
// bundles keep every individual patch available in Expert mode while giving Simple mode a
// deterministic recommendation set for the selected Steam Link version and build code.

// Both legacy bundles intentionally select the same 16 public patches. Device identity applies
// the recommended Quest Pro spoof after XR Device Config Baseline. Individual native
// edits still obey their exact-build guards; selecting a bundle does not verify a new layout.
private val legacyRecommendedPatches = arrayOf(
    androidXrNativePermissionNamesPatch,
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
    deviceIdentityPatch,
)

@Suppress("unused")
val galaxyXrRecommended5001712Patch = rawResourcePatch(
    name = "Galaxy XR recommended set (2.0.20/5001712)",
    description = "Applies the 16-patch Galaxy XR legacy set for exact Steam Link 2.0.20 build 5001712, including Meta Quest Pro identity, permission-free high resolution, and the Final balanced tested OLED profile.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5001712.toTypedArray())
    dependsOn(*legacyRecommendedPatches)
}

@Suppress("unused")
val galaxyXrRecommended5002322Patch = rawResourcePatch(
    name = "Galaxy XR recommended set (2.0.22/5002322)",
    description = "Applies the validated permission-free Galaxy XR patch set for exact Steam Link 2.0.22 build 5002322, including the Final balanced tested OLED profile.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5002322.toTypedArray())
    dependsOn(
        xrGalaxyXrHighResolutionPatch,
        gxrModernTongueBridgePatch,
        microphoneInputPresetPatch,
        unrestrictedBatteryUsagePatch,
        hmdOnlyPatch,
        oledCalibrationPatch,
    )
}

@Suppress("unused")
val galaxyXrRecommended5002318Patch = rawResourcePatch(
    name = "Galaxy XR recommended set (2.0.22/5002318)",
    description = "Applies the existing native-Android-XR-safe Galaxy XR patch set for exact Steam Link 2.0.22 build 5002318.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_5002318.toTypedArray())
    dependsOn(
        xrGalaxyXrHighResolutionPatch,
        gxrFacebridgePatch,
        microphoneInputPresetPatch,
        unrestrictedBatteryUsagePatch,
        hmdOnlyPatch,
        oledCalibrationPatch,
        deviceIdentityPatch,
    )
}

@Suppress("unused")
val galaxyXrLegacyFoundationPatch = rawResourcePatch(
    name = "Galaxy XR legacy foundation (through 2.0.22/5002244)",
    description = "Selects the 16-patch Galaxy XR legacy set, including Meta Quest Pro identity, native gates, face bridge, OLED calibration, microphone, battery, Visual Delay, and XR foundation. High-resolution output is guarded to verified layouts; unavailable on 5001740, 5002172, and 5002206.",
    default = true,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY_RECOMMENDED.toTypedArray())
    dependsOn(*legacyRecommendedPatches)
}
