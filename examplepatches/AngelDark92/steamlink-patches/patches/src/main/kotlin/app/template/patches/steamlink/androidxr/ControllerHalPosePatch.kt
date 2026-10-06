package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import app.template.patches.shared.PatchCategories

internal const val CONTROLLER_HAL_POSE_LIBRARY = "libgxr_controller_hal_pose.so"
internal const val CONTROLLER_HAL_POSE_MANIFEST = "XR_APILAYER_local_GalaxyXR_controller_hal_pose.json"
internal const val CONTROLLER_HAL_POSE_EXTENSION = "extensions/controller-hal-pose.mpe"

// The layer wraps xrLocateSpace for VRLink's controller pose action, which every supported base
// creates under the same name, so it is not tied to one native layout. Run on 5002363 and on
// 5001712; the bases differ only in the frame VRLink reads the angular velocity in, so each has
// its own patch that writes that frame into the library.
internal fun isControllerHalPoseBuild(version: String, versionCode: String): Boolean =
    isShizukuBridgeBuild(version, versionCode)

internal fun controllerHalPoseResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/$name")
        ?: throw PatchException("Missing bundled resource: $name"))
        .use { it.readBytes() }

internal fun controllerHalPoseLibrary(angularWorld: Boolean): ByteArray =
    controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_LIBRARY")
        .withAngularVelocityFrame(CONTROLLER_HAL_POSE_CONFIG_MAGIC, angularWorld)

// gxr.pose.*; no fragment of an existing Steam Link class.
private val controllerHalPoseExtensionPatch = bytecodePatch {
    extendWith(CONTROLLER_HAL_POSE_EXTENSION)
}

private const val CONTROLLER_HAL_POSE_DESCRIPTION =
    "Takes controller poses straight from the Galaxy XR controller HAL instead of the OpenXR runtime. The runtime hands an application one controller pose per display frame, about 35 ms behind the HAL; the HAL fuses the controller's IMU about 1000 times per second and predicts a pose for the requested time. The layer reads its pose and velocities 360 times per second, as often as Steam Link sends them, and filters jitter out of both. The HAL is reachable only with shell rights, so this needs Shizuku running and its permission granted to Steam Link. Without Shizuku tracking stays as it is."

private fun controllerHalPosePatchFor(
    name: String,
    baseNote: String,
    compatibilities: List<Compatibility>,
    angularWorld: Boolean,
    isBuild: (String, String) -> Boolean,
) = rawResourcePatch(
    name = name,
    description = "$CONTROLLER_HAL_POSE_DESCRIPTION $baseNote",
    default = false,
) {
    category(PatchCategories.EXPERIMENTS)
    compatibleWith(*compatibilities.toTypedArray())
    dependsOn(
        shizukuBridgeExtensionPatch,
        shizukuBridgeManifestPatch,
        controllerHalPoseExtensionPatch,
    )

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (!isBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }

        val library = get("lib/arm64-v8a/$CONTROLLER_HAL_POSE_LIBRARY")
        library.parentFile!!.mkdirs()
        library.writeBytes(controllerHalPoseLibrary(angularWorld))

        val manifest = get("assets/openxr/1/api_layers/implicit.d/$CONTROLLER_HAL_POSE_MANIFEST")
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(
            controllerHalPoseResource("steamlink/androidxr/$CONTROLLER_HAL_POSE_MANIFEST"),
        )
    }
}

@Suppress("unused")
val controllerHalPosePatch = controllerHalPosePatchFor(
    name = "Controller tracking from the controller HAL through Shizuku (experimental)",
    baseNote = "Steam Link 2.0.23: the angular velocity is reported local to the grip pose, as its VRLink reads it.",
    compatibilities = COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL,
    angularWorld = false,
    isBuild = { version, versionCode -> isNativeXrSteamLinkBuild(version, versionCode) },
)

@Suppress("unused")
val controllerHalPoseLegacyPatch = controllerHalPosePatchFor(
    name = "Controller tracking from the controller HAL through Shizuku, 2.0.20 - 2.0.22 (experimental)",
    baseNote = "Steam Link 2.0.20 - 2.0.22: the angular velocity is reported in the base space, as their VRLink reads it.",
    compatibilities = COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL,
    angularWorld = true,
    isBuild = { version, versionCode -> isLegacyXrFoundationSteamLinkBuild(version, versionCode) },
)
