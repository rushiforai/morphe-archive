package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel

internal const val CONTROLLER_HAL_POSE_LIBRARY = "libgxr_controller_hal_pose.so"
internal const val CONTROLLER_HAL_POSE_MANIFEST = "XR_APILAYER_local_GalaxyXR_controller_hal_pose.json"
internal const val CONTROLLER_HAL_POSE_EXTENSION = "extensions/controller-hal-pose.mpe"

// The layer wraps xrLocateSpace for VRLink's controller pose action, which every supported base
// creates under the same name, so it is not tied to one native layout. One patch covers both
// supported bases; the angular-velocity frame written into the bundled layer differs per build
// (2.0.23: grip-pose frame; 2.0.20/5001712: base-space frame).
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
    "Reads controller poses from the headset HAL, removing about 35 ms of lag. This needs Shizuku; without it tracking stays stock."

@Suppress("unused")
val controllerHalPosePatch = rawResourcePatch(
    name = "Controller tracking from the controller HAL through Shizuku",
    description = "$CONTROLLER_HAL_POSE_DESCRIPTION " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL + COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL) +
        " Angular velocity is local to the grip pose on 2.0.23/5002363 and in the base space on older builds. " +
        STEAM_LINK_CONTROLLER_CREDIT,
    default = false,
) {
    category(PatchCategories.CONTROLLERS_SHIZUKU)
    compatibleWith(*(COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL + COMPATIBILITIES_STEAM_LINK_LEGACY_EXPERIMENTAL).toTypedArray())
    dependsOn(
        shizukuBridgeExtensionPatch,
        shizukuBridgeManifestPatch,
        controllerHalPoseExtensionPatch,
    )

    execute {
        // Morphe dependencies do not re-check compatibility before execution.
        if (packageMetadata.packageName != CONTROLLER_STEAM_LINK_PACKAGE ||
            !isControllerHalPoseBuild(packageMetadata.versionName, packageMetadata.versionCode)
        ) {
            return@execute
        }

        val angularWorld = isLegacyXrFoundationSteamLinkBuild(
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )

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
