package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.intSliderOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.nio.ByteBuffer
import java.nio.ByteOrder

internal const val CONTROLLER_THROW_ANGLE_DEFAULT = 13
internal const val CONTROLLER_THROW_ANGLE_MAX = 50

internal fun isControllerThrowAngleBuild(pkg: String, version: String, code: String): Boolean =
    pkg == "com.valvesoftware.steamlinkvr" && isControllerVelocityFrameNativeBuild(version, code)

/** Only the additional linear local-X angle changes; the angular frame is preserved. */
internal fun ByteArray.withControllerThrowAngle(degrees: Int): ByteArray {
    if (degrees !in 0..CONTROLLER_THROW_ANGLE_MAX) throw PatchException("Throw angle must be 0 to 50 degrees")
    val offset = angularVelocityConfigOffset(CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC)
    val config = ByteBuffer.wrap(this).order(ByteOrder.LITTLE_ENDIAN)
    if (config.getInt(offset + 28) != 0x31524854 || config.getInt(offset + 24) !in 0..50 ||
        config.getInt(offset + 20) !in 0..1) {
        throw PatchException("Unsupported controller velocity frame throw-angle config")
    }
    return copyOf().also {
        ByteBuffer.wrap(it).order(ByteOrder.LITTLE_ENDIAN).putInt(offset + 24, degrees)
    }
}

@Suppress("unused")
val controllerThrowAnglePatch = rawResourcePatch(
    name = "Controller throw angle (experimental)",
    description = "Adjusts thrown-object direction with an additional controller-local angle. " +
        buildLabel(COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL) +
        " Needs: Controller velocity frame; not with the HAL pose patch. " + STEAM_LINK_CONTROLLER_CREDIT,
    default = false,
) {
    category(PatchCategories.CONTROLLER)
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_NATIVE_XR_EXPERIMENTAL.toTypedArray())
    dependsOn(controllerVelocityFramePatch)
    val degrees = intSliderOption(
        key = "throwAngleDegrees", min = 0, max = CONTROLLER_THROW_ANGLE_MAX,
        default = CONTROLLER_THROW_ANGLE_DEFAULT, step = 1,
        title = "Additional throw angle (degrees)",
        description = "Extra rotation of linear velocity around the controller's local X axis. " +
            "Default: 13 degrees. Range: 0 to 50. Zero keeps the existing correction. " +
            "Applies throughout motion, not only on release; leaves angular velocity and timing unchanged.",
        required = true,
    )
    // Finalize after all execute blocks, so dependency installation cannot erase the option.
    finalize {
        if (!isControllerThrowAngleBuild(packageMetadata.packageName, packageMetadata.versionName,
                packageMetadata.versionCode)) return@finalize
        if (get("lib/arm64-v8a/libgxr_controller_hal_pose.so").exists() ||
            get("assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_hal_pose.json").exists()) {
            throw PatchException("Controller throw angle cannot be combined with the HAL pose patch")
        }
        val library = get("lib/arm64-v8a/$CONTROLLER_VELOCITY_FRAME_LIBRARY")
        library.writeBytes(library.readBytes().withControllerThrowAngle(degrees.value!!))
    }
}
