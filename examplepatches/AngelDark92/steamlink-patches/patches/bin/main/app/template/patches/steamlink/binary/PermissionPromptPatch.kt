package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.PatchException

// Replaces RequestAndroidPermissions() with `mov w0,#1; ret` so the runtime
// permission dialog never fires and tears down the live XR stream.
private val SEARCH = byteArrayOf(
    0xff.toByte(), 0x83.toByte(), 0x01.toByte(), 0xd1.toByte(),
    0xfd.toByte(), 0x7b.toByte(), 0x01.toByte(), 0xa9.toByte(),
)
private val REPLACE = byteArrayOf(
    0x20.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
    0xc0.toByte(), 0x03.toByte(), 0x5f.toByte(), 0xd6.toByte(),
)

private const val REQUEST_ANDROID_PERMISSIONS_OFFSET_5002244 = 0x1422c4
private const val LIBVRLINK_SCENE_SIZE_5002244 = 2_251_920

internal val disablePermissionPromptNativePatch = rawResourcePatch {
    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val offset = REQUEST_ANDROID_PERMISSIONS_OFFSET_5002244

        if (offset + SEARCH.size > bytes.size) {
            return@execute
        }

        val current = bytes.copyOfRange(offset, offset + SEARCH.size)
        when {
            current.contentEquals(REPLACE) -> Unit
            current.contentEquals(SEARCH) -> {
                REPLACE.copyInto(bytes, offset)
                file.writeBytes(bytes)
            }
            bytes.size == LIBVRLINK_SCENE_SIZE_5002244 -> throw PatchException(
                "Unexpected RequestAndroidPermissions bytes at 0x" +
                    offset.toString(16),
            )
            else -> {
                // Unknown binary layout (for example 5002172/5002206): skip instead of
                // crashing the entire Android XR compatibility chain.
            }
        }
    }
}

