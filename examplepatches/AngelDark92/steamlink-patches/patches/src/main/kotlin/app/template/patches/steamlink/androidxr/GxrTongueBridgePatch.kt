package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_MODERN_TONGUE_BRIDGE
import app.template.patches.shared.Constants.isModernTongueBridgeSteamLinkBuild
import app.template.patches.steamlink.util.BinaryPatchHelper.vaddrToFileOffset
import java.security.MessageDigest

internal const val MODERN_TONGUE_LIBRARY_SIZE_5002322 = 2_283_400
internal const val MODERN_TONGUE_VADDR_5002322 = 0x140ea4L
internal const val MODERN_TONGUE_STOCK_SHA256_5002322 =
    "e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f"
internal const val MODERN_TONGUE_LIBRARY_SIZE_5002363 = 2_292_008
internal const val MODERN_TONGUE_VADDR_5002363 = 0x141c6cL
internal const val MODERN_TONGUE_STOCK_SHA256_5002363 =
    "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0"

// Valve's native Android-XR mapper already translates face expressions 0..62 and preserves
// standard FB2 TongueOut at slot 68. This final block currently zeros FB2 slots 63..67.
internal val MODERN_TONGUE_ORIGINAL_5002322 = byteArrayOf(
    0xe0.toByte(), 0x3f, 0x41, 0xbd.toByte(), // ldr s0, [sp, #0x13c] (Android TongueOut)
    0x1f, 0xcd.toByte(), 0x0f, 0xf8.toByte(), // str xzr, [x8, #0xfc]!
    0x1f, 0x19, 0x00, 0xb9.toByte(),          // str wzr, [x8, #0x18]
    0x1f, 0x05, 0x00, 0xf9.toByte(),          // str xzr, [x8, #0x8]
    0x00, 0x15, 0x00, 0xbd.toByte(),          // str s0, [x8, #0x14]
    0x1f, 0x11, 0x00, 0xb9.toByte(),          // str wzr, [x8, #0x10]
)

// Transport slots consumed by the Galaxy XR LinkFT module:
// 63=out, 64=left, 65=right, 66=up, 67=down. Slot 68 remains standard FB2 TongueOut,
// and slot 69 (TongueRetreat) remains zero.
internal val MODERN_TONGUE_REPLACEMENT_5002322 = byteArrayOf(
    0xa1.toByte(), 0x42, 0xc0.toByte(), 0x3d, // ldr q1, [x21, #0x100] (Android 64..67)
    0xa0.toByte(), 0xfe.toByte(), 0x40, 0xbd.toByte(), // ldr s0, [x21, #0xfc] (Android 63)
    0x00, 0xfd.toByte(), 0x00, 0xbd.toByte(), // str s0, [x8, #0xfc] (transport 63)
    0x01, 0x41, 0x80.toByte(), 0x3d,          // str q1, [x8, #0x100] (transport 64..67)
    0x00, 0x11, 0x01, 0xbd.toByte(),          // str s0, [x8, #0x110] (standard slot 68)
    0x1f, 0x15, 0x01, 0xb9.toByte(),          // str wzr, [x8, #0x114] (slot 69)
)

// The 5002363 XRQGetFaceTracking symbol starts at 0x14151c. Its Android branch
// still receives the expression array at SP+0x40 (X21), and X8 still points to
// the FB2 output array at this final block. Both the 24 stock bytes and register
// contract were checked on this exact ELF; only its independently derived address moves.
internal val MODERN_TONGUE_ORIGINAL_5002363 = MODERN_TONGUE_ORIGINAL_5002322.copyOf()
internal val MODERN_TONGUE_REPLACEMENT_5002363 = MODERN_TONGUE_REPLACEMENT_5002322.copyOf()

private data class ModernTongueLayout(
    val versionName: String,
    val versionCode: String,
    val librarySize: Int,
    val vaddr: Long,
    val stockSha256: String,
    val original: ByteArray,
    val replacement: ByteArray,
)

private val MODERN_TONGUE_LAYOUTS = listOf(
    ModernTongueLayout(
        "2.0.22", "5002322", MODERN_TONGUE_LIBRARY_SIZE_5002322,
        MODERN_TONGUE_VADDR_5002322, MODERN_TONGUE_STOCK_SHA256_5002322,
        MODERN_TONGUE_ORIGINAL_5002322, MODERN_TONGUE_REPLACEMENT_5002322,
    ),
    ModernTongueLayout(
        "2.0.23", "5002363", MODERN_TONGUE_LIBRARY_SIZE_5002363,
        MODERN_TONGUE_VADDR_5002363, MODERN_TONGUE_STOCK_SHA256_5002363,
        MODERN_TONGUE_ORIGINAL_5002363, MODERN_TONGUE_REPLACEMENT_5002363,
    ),
)

private fun ByteArray.sha256(): String =
    MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }

internal fun patchModernTongueTransport(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    if (!isModernTongueBridgeSteamLinkBuild(versionName, versionCode)) return bytes.copyOf()
    val layout = MODERN_TONGUE_LAYOUTS.singleOrNull {
        it.versionName == versionName && it.versionCode == versionCode
    } ?: return bytes.copyOf()
    if (bytes.size != layout.librarySize) {
        throw PatchException(
            "Unexpected libvrlink_scene.so size=${bytes.size}, sha256=${bytes.sha256()} for " +
                "Steam Link $versionName/$versionCode; expected size=${layout.librarySize}, " +
                "stockSha256=${layout.stockSha256}",
        )
    }

    val offset = vaddrToFileOffset(
        bytes,
        layout.vaddr,
        layout.original.size,
    )
    val current = bytes.copyOfRange(offset, offset + layout.original.size)
    return when {
        current.contentEquals(layout.replacement) -> bytes.copyOf()
        current.contentEquals(layout.original) ->
            bytes.copyOf().apply { layout.replacement.copyInto(this, offset) }
        else -> throw PatchException(
            "Unexpected native face-mapping bytes for Steam Link $versionName/$versionCode " +
                "at vaddr 0x${layout.vaddr.toString(16)}; " +
                "librarySha256=${bytes.sha256()}",
        )
    }
}

@Suppress("unused")
val gxrModernTongueBridgePatch = rawResourcePatch(
    name = "GXR tongue bridge (version 5002322 and above)",
    description = "For exact Steam Link 2.0.22/5002322 and 2.0.23/5002363 with Valve's native Android XR face mapping. Each base uses its independently verified native layout. Preserves Valve's face expressions and standard TongueOut while exposing Galaxy XR tongue out/left/right/up/down to the matching Galaxy XR VRCFT module.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_MODERN_TONGUE_BRIDGE.toTypedArray())
    dependsOn(
        gxrFaceTrackingManifestPatch,
    )

    execute {
        if (!isModernTongueBridgeSteamLinkBuild(
                packageMetadata.versionName,
                packageMetadata.versionCode,
            )
        ) return@execute

        val file = get("lib/arm64-v8a/libvrlink_scene.so")
        val bytes = file.readBytes()
        val patched = patchModernTongueTransport(
            bytes,
            packageMetadata.versionName,
            packageMetadata.versionCode,
        )
        if (!patched.contentEquals(bytes)) file.writeBytes(patched)
    }
}
