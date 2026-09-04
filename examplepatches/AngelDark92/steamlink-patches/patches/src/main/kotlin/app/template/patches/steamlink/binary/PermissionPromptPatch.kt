package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild

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
    val versionName: String,
    val versionCode: Int,
    val fileSize: Int,
    val stockSha256: String,
    val requestAndroidPermissionsOffset: Int,
)

private val PERMISSION_PROMPT_LAYOUTS = listOf(
    PermissionPromptLayout(
        "2.0.20", 5001712, 2_221_072,
        "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", 0x142c0c,
    ),
    PermissionPromptLayout(
        "2.0.20", 5001740, 2_220_528,
        "5fbb76c06c9fc0e3e5c5825752aa17e040462c8551b69d3492265f620244f443", 0x142a9c,
    ),
    PermissionPromptLayout(
        "2.0.22", 5002244, 2_251_920,
        "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12", 0x1422c4,
    ),
    PermissionPromptLayout(
        "2.0.22", 5002296, 2_265_656,
        "879694c57f0ca7e74017c174c24da619b1d1e909f4491edd9b2423513f0f87a6", 0x14478c,
    ),
    PermissionPromptLayout(
        "2.0.22", 5002313, 2_276_872,
        "e4d3575a130dc013e4c8fe4fb965217028229f89b13ba821c01b492e457398bb", 0x1472a8,
    ),
)

internal fun patchPermissionPrompt(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    if (isNativeXrSteamLinkBuild(versionName, versionCode)) return bytes.copyOf()

    val layout = PERMISSION_PROMPT_LAYOUTS.singleOrNull {
        it.versionName == versionName && it.versionCode.toString() == versionCode
    }
        ?: return bytes.copyOf()
    if (bytes.size != layout.fileSize) {
        throw PatchException(
            "Unexpected libvrlink_scene.so size=${bytes.size} for Steam Link " +
                "$versionName/$versionCode; expected ${layout.fileSize}, " +
                "stockSha256=${layout.stockSha256}",
        )
    }

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
        // Native-XR builds ship a working Android XR permission path. Suppressing it can launch VR
        // without HAND_TRACKING when a custom launcher grant is missing or denied, so preserve it.
        // Dependencies run recursively without a compatibility re-check, so return before reading.
        if (isNativeXrSteamLinkBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@execute
        }
        if (!isLegacyXrFoundationSteamLinkBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )
        ) {
            return@execute
        }
        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchPermissionPrompt(
            bytes,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}

