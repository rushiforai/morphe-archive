package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.PatchException

// Replaces RequestAndroidPermissions() with `mov w0,#1; ret` so the runtime
// permission dialog never fires and tears down the live XR stream.
// Internal sub-patch; not exposed top-level. Fixed offsets are selected by a verified layout.
private val SEARCH = byteArrayOf(
    // AArch64: sub sp,sp,#0x60 (SUB SP frame allocation) + stp x29,x30,[sp,#0x10] (callee-save prologue)
    0xff.toByte(), 0x83.toByte(), 0x01.toByte(), 0xd1.toByte(),  // sub sp, sp, #0x60
    0xfd.toByte(), 0x7b.toByte(), 0x01.toByte(), 0xa9.toByte(),  // stp x29, x30, [sp, #0x10]
)
private val REPLACE = byteArrayOf(
    // AArch64: mov w0, #1 (return true) + ret (BX LR equivalent)
    0x20.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),  // movz w0, #0x1
    0xc0.toByte(), 0x03.toByte(), 0x5f.toByte(), 0xd6.toByte(),  // ret
)

private data class PermissionPromptLayout(
    val versionCode: Int,
    val fileSize: Int,
    val requestAndroidPermissionsOffset: Int,
)

private val PERMISSION_PROMPT_LAYOUTS = listOf(
    PermissionPromptLayout(5001740, 2_220_528, 0x142a9c),
    PermissionPromptLayout(5002244, 2_251_920, 0x1422c4),
    PermissionPromptLayout(5002313, 2_276_872, 0x1472a8),
    PermissionPromptLayout(5002318, 2_277_488, 0x147418),
    PermissionPromptLayout(5002322, 2_283_400, 0x148aac),
)

internal fun patchPermissionPrompt(bytes: ByteArray): ByteArray {
    val layout = PERMISSION_PROMPT_LAYOUTS.singleOrNull { it.fileSize == bytes.size }
        ?: return bytes.copyOf()
    // Native-XR builds ship a working Android XR permission path. Suppressing it can launch VR
    // without HAND_TRACKING when a custom launcher grant is missing or denied, so preserve it.
    if (layout.versionCode == 5002318 || layout.versionCode == 5002322) return bytes.copyOf()

    val offset = layout.requestAndroidPermissionsOffset
    if (offset < 0 || offset + SEARCH.size > bytes.size) {
        throw PatchException(
            "RequestAndroidPermissions offset is outside versionCode ${layout.versionCode}",
        )
    }

    val current = bytes.copyOfRange(offset, offset + SEARCH.size)
    return when {
        current.contentEquals(REPLACE) -> bytes.copyOf()
        current.contentEquals(SEARCH) -> bytes.copyOf().apply { REPLACE.copyInto(this, offset) }
        else -> throw PatchException(
            "Unexpected RequestAndroidPermissions bytes for versionCode ${layout.versionCode} " +
                "at 0x${offset.toString(16)}",
        )
    }
}

internal val disablePermissionPromptNativePatch = rawResourcePatch {
    execute {
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchPermissionPrompt(bytes)
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}

