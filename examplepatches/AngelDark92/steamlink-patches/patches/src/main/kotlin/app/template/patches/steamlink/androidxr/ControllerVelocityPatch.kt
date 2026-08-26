package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.floatSliderOption
import app.morphe.patcher.patch.intSliderOption
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

// 16-byte ASCII identifier embedded in libgxr_controller_velocity.so; uniquely locates the config block
private val CONFIG_MAGIC = "GXRVELCFG0000001".encodeToByteArray()
// Total config block size: 16B magic + 4B version + 12B padding + 8B maxDeltaNs + 4B maxLinear + 4B maxAngular + 4B smoothing = 56
private const val CONFIG_SIZE = 56

internal const val CONTROLLER_VELOCITY_IDS_XML_FALLBACK =
    """<?xml version="1.0" encoding="utf-8"?><resources/>"""

internal fun isControllerVelocityPatchNoOpBuild(versionCode: String): Boolean =
    isNativeXrSteamLinkBuild(versionCode)

private fun velocityResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/steamlink/androidxr/$name")
        ?: throw PatchException("Missing bundled resource: steamlink/androidxr/$name"))
        .use { it.readBytes() }

private fun ByteArray.findUniqueConfig(): Int {
    val matches = indices.filter { start ->
        start + CONFIG_MAGIC.size <= size &&
            CONFIG_MAGIC.indices.all { this[start + it] == CONFIG_MAGIC[it] }
    }
    if (matches.size != 1) {
        throw PatchException("Controller velocity config marker count=${matches.size}, expected 1")
    }
    val offset = matches.single()
    if (offset + CONFIG_SIZE > size) {
        throw PatchException("Controller velocity config block is truncated")
    }
    val version = ByteBuffer.wrap(this, offset + 16, 4).order(ByteOrder.LITTLE_ENDIAN).int
    if (version != 1) throw PatchException("Unsupported controller velocity config version=$version")
    return offset
}

private fun configuredVelocityLibrary(
    maxDeltaMs: Long,
    smoothing: Float,
    maxLinearSpeed: Float,
    maxAngularSpeed: Float,
): ByteArray {
    val bytes = velocityResource("libgxr_controller_velocity.so").copyOf()
    val offset = bytes.findUniqueConfig()
    ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).apply {
        // +32: maxDeltaNs int64 (ms×1_000_000; fallback threshold for pose sample gap)
        putLong(offset + 32, maxDeltaMs * 1_000_000L)
        // +40: maxLinearSpeed float32 (m/s; clamp to runtime velocity above this derived speed)
        putFloat(offset + 40, maxLinearSpeed)
        // +44: maxAngularSpeed float32 (rad/s; clamp to runtime velocity above this derived speed)
        putFloat(offset + 44, maxAngularSpeed)
        // +48: smoothing float32 (EMA weight for previous-frame output; 0 = no smoothing)
        putFloat(offset + 48, smoothing)
    }
    return bytes
}

@Suppress("unused")
val controllerVelocityPatch = rawResourcePatch(
    name = "Controller velocity fix",
    description = "Derives current controller linear and angular velocity from grip/aim pose history and can reduce VRLink's stock four controller pose sends per display frame.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(xrCoreRuntimePatch)

    val maxDeltaMs = intSliderOption(
        key = "maxDeltaMs",
        min = 5,
        max = 100,
        default = 50,
        step = 1,
        title = "Maximum sample gap (ms)",
        description = "libgxr_controller_velocity.so config+32 (int64 ns = value×1e6). Falls back to runtime velocity when pose samples are farther apart. Allowed range: 5 to 100 ms.",
        required = true,
    )
    val poseSendCadence by stringOption(
        key = "poseSendCadence",
        default = "stock-4x",
        values = mapOf(
            "Stock (4x display rate)" to "stock-4x",
            "Half (2x display rate)" to "half-2x",
            "Display rate (1x)" to "display-1x",
        ),
        title = "Controller pose-send cadence",
        description = "libvrlink_scene.so QSVLClient::OnTopOfFrame: selects four, two, or one evenly phased controller pose sends per display frame. Actual send Hz equals display Hz multiplied by 4, 2, or 1. Stock preserves Valve behavior.",
        required = true,
    )
    val smoothing = floatSliderOption(
        key = "smoothing",
        min = 0f,
        max = 0.9f,
        default = 0f,
        step = 0.05f,
        title = "Derived velocity smoothing",
        description = "libgxr_controller_velocity.so config+48 (float32 EMA weight). 0 = no smoothing, minimum lag; higher values reduce jitter. Allowed range: 0.0 to 0.9.",
        required = true,
    )
    val maxLinearSpeed = floatSliderOption(
        key = "maxLinearSpeed",
        min = 1f,
        max = 50f,
        default = 20f,
        step = 1f,
        title = "Maximum linear speed (m/s)",
        description = "libgxr_controller_velocity.so config+40 (float32 m/s). Falls back to runtime velocity above this derived linear speed. Allowed range: 1 to 50 m/s.",
        required = true,
    )
    val maxAngularSpeed = floatSliderOption(
        key = "maxAngularSpeed",
        min = 1f,
        max = 100f,
        default = 50f,
        step = 1f,
        title = "Maximum angular speed (rad/s)",
        description = "libgxr_controller_velocity.so config+44 (float32 rad/s). Falls back to runtime velocity above this derived angular speed. Allowed range: 1 to 100 rad/s.",
        required = true,
    )

    execute {
        if (isControllerVelocityPatchNoOpBuild(packageMetadata.versionCode)) return@execute

        val sceneFile = get("lib/arm64-v8a/libvrlink_scene.so")
        val sceneBytes = sceneFile.readBytes()
        val cadenceBytes = patchControllerPoseCadence(sceneBytes, poseSendCadence!!)
        if (!sceneBytes.contentEquals(cadenceBytes)) sceneFile.writeBytes(cadenceBytes)

        val libDir = sceneFile.parentFile!!
        File(libDir, "libgxr_controller_velocity.so").writeBytes(
            configuredVelocityLibrary(
                maxDeltaMs.value!!.toLong(),
                smoothing.value!!,
                maxLinearSpeed.value!!,
                maxAngularSpeed.value!!,
            )
        )

        val manifest = get(
            "assets/openxr/1/api_layers/implicit.d/" +
                "XR_APILAYER_local_GalaxyXR_controller_velocity.json"
        )
        manifest.parentFile!!.mkdirs()
        manifest.writeBytes(
            velocityResource("XR_APILAYER_local_GalaxyXR_controller_velocity.json")
        )

        val idsFile = get("res/values/ids.xml")
        if (!idsFile.exists()) {
            idsFile.parentFile!!.mkdirs()
            idsFile.writeText(CONTROLLER_VELOCITY_IDS_XML_FALLBACK)
        }
    }
}
