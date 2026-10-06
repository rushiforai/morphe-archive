package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import java.nio.ByteBuffer
import java.nio.ByteOrder

// The controller HAL pose layer and the controller velocity frame layer report the angular
// velocity in the frame the base's VRLink reads it in. VRLink 2.0.23 (5002363) reads it local to
// the streamed pose. VRLink 2.0.20 hands it to SteamVR as a base-space vector, as OpenXR defines
// it: reported local there, SteamVR's angular velocity was 48-62 degrees off the controller's
// rotation and the linear velocity of the offset grip point was skewed, so thrown objects left
// low (measured 2026-10-06 on 2.0.20/5001712 against SteamVR). The frame is a field of a config
// block in each library, written when the patch is applied:
//   +0  magic        16 ASCII bytes
//   +16 version      uint32, 1
//   +20 angularWorld uint32, 0 = local to the pose, 1 = base space
internal const val CONTROLLER_HAL_POSE_CONFIG_MAGIC = "GXRHALCFG0000001"
internal const val CONTROLLER_VELOCITY_FRAME_CONFIG_MAGIC = "GXRVFRCFG0000001"
private const val ANGULAR_VELOCITY_CONFIG_VERSION = 1
private const val ANGULAR_VELOCITY_CONFIG_SIZE = 32

private fun ByteArray.angularVelocityConfigOffset(magic: String): Int {
    val marker = magic.encodeToByteArray()
    val matches = indices.filter { start ->
        start + marker.size <= size && marker.indices.all { this[start + it] == marker[it] }
    }
    if (matches.size != 1) throw PatchException("$magic config marker count=${matches.size}, expected 1")
    val offset = matches.single()
    if (offset + ANGULAR_VELOCITY_CONFIG_SIZE > size) throw PatchException("$magic config block is truncated")
    val version = ByteBuffer.wrap(this, offset + 16, 4).order(ByteOrder.LITTLE_ENDIAN).int
    if (version != ANGULAR_VELOCITY_CONFIG_VERSION) throw PatchException("Unsupported $magic config version=$version")
    return offset
}

internal fun ByteArray.angularVelocityWorld(magic: String): Boolean {
    val offset = angularVelocityConfigOffset(magic)
    return ByteBuffer.wrap(this, offset + 20, 4).order(ByteOrder.LITTLE_ENDIAN).int != 0
}

/** A copy of this library with the angular velocity frame set. */
internal fun ByteArray.withAngularVelocityFrame(magic: String, world: Boolean): ByteArray {
    val bytes = copyOf()
    val offset = bytes.angularVelocityConfigOffset(magic)
    ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN).putInt(offset + 20, if (world) 1 else 0)
    return bytes
}
