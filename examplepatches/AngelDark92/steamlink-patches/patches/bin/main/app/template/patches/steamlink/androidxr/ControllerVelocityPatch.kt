package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.floatOption
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK
import app.template.patches.shared.Constants.COMPATIBILITY_STEAM_LINK_EXPERIMENTAL
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder

private val CONFIG_MAGIC = "GXRVELCFG0000001".encodeToByteArray()
private const val CONFIG_SIZE = 56

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
    maxDeltaMs: Int,
    smoothing: Float,
    maxLinearSpeed: Float,
    maxAngularSpeed: Float,
): ByteArray {
    val bytes = velocityResource("libgxr_controller_velocity.so").copyOf()
    val offset = bytes.findUniqueConfig()
    ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).apply {
        putLong(offset + 32, maxDeltaMs.toLong() * 1_000_000L)
        putFloat(offset + 40, maxLinearSpeed)
        putFloat(offset + 44, maxAngularSpeed)
        putFloat(offset + 48, smoothing)
    }
    return bytes
}

@Suppress("unused")
val controllerVelocityPatch = rawResourcePatch(
    name = "Controller velocity fix",
    description = "Experimental: derives current controller linear and angular velocity from grip/aim pose history, avoiding delayed runtime velocity during throws.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STEAM_LINK, COMPATIBILITY_STEAM_LINK_EXPERIMENTAL)
    dependsOn(xrCoreRuntimePatch)

    val maxDeltaMs by intOption(
        key = "maxDeltaMs",
        default = 50,
        title = "Maximum sample gap (ms)",
        description = "Falls back to runtime velocity when pose samples are farther apart. Allowed range: 5 to 100 ms.",
        required = true,
        validator = { value -> value != null && value in 5..100 },
    )
    val smoothing by floatOption(
        key = "smoothing",
        default = 0.0f,
        title = "Derived velocity smoothing",
        description = "Previous-output weight. 0 gives minimum lag; higher values reduce jitter. Allowed range: 0.0 to 0.9.",
        required = true,
        validator = { value -> value != null && value in 0.0f..0.9f },
    )
    val maxLinearSpeed by floatOption(
        key = "maxLinearSpeed",
        default = 20.0f,
        title = "Maximum linear speed (m/s)",
        description = "Falls back to runtime velocity above this derived speed. Allowed range: 1 to 50 m/s.",
        required = true,
        validator = { value -> value != null && value in 1.0f..50.0f },
    )
    val maxAngularSpeed by floatOption(
        key = "maxAngularSpeed",
        default = 50.0f,
        title = "Maximum angular speed (rad/s)",
        description = "Falls back to runtime velocity above this derived speed. Allowed range: 1 to 100 rad/s.",
        required = true,
        validator = { value -> value != null && value in 1.0f..100.0f },
    )

    execute {
        val libDir = get("lib/arm64-v8a/libvrlink_scene.so").parentFile!!
        File(libDir, "libgxr_controller_velocity.so").writeBytes(
            configuredVelocityLibrary(
                maxDeltaMs!!,
                smoothing!!,
                maxLinearSpeed!!,
                maxAngularSpeed!!,
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
            idsFile.writeText("""<?xml version="1.0" encoding="utf-8"?><resources/>""")
        }
    }
}