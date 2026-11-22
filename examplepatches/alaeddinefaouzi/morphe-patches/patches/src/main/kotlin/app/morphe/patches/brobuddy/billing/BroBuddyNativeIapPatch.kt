package app.morphe.patches.brobuddy.billing

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.shared.Constants
import java.io.File
import java.io.RandomAccessFile

private const val LIB_PATH = "lib/arm64-v8a/libil2cpp.so"

private data class NativePatch(val name: String, val offset: Long, val original: ByteArray, val replacement: ByteArray)

private val NATIVE_PATCHES = listOf(
    // 1. ValidatePurchaseIfPossible (0x4483994) -> mov w0, #1; ret
    NativePatch(
        "ValidatePurchaseIfPossible",
        0x4483994L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 2. CanCrossPlatformValidate (0x448b0c4) -> mov w0, #0; ret
    NativePatch(
        "CanCrossPlatformValidate",
        0x448b0c4L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0x00, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 3. OnConfirmationFailed (0x4483bdc) -> b 0x4487f64
    NativePatch(
        "OnConfirmationFailed",
        0x4483bdcL,
        byteArrayOf(0xFF.toByte(), 0x83.toByte(), 0x01, 0xD1.toByte()),
        byteArrayOf(0xE2.toByte(), 0x00, 0x00, 0x14)
    ),
    // 4. IsHaveNoAds (0x3f20210) -> mov w0, #1; ret
    NativePatch(
        "IsHaveNoAds",
        0x3f20210L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1D, 0xF8.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte()),
        byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 5. HaveVipPack (0x3f20a08) -> mov w0, #1; ret
    NativePatch(
        "HaveVipPack",
        0x3f20a08L,
        byteArrayOf(0xFE.toByte(), 0x5F, 0xBD.toByte(), 0xA9.toByte(), 0xF6.toByte(), 0x57, 0x01, 0xA9.toByte()),
        byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 6. IsHaveSkipAds (0x3f2031c) -> mov w0, #1; ret
    NativePatch(
        "IsHaveSkipAds",
        0x3f2031cL,
        byteArrayOf(0xE0.toByte(), 0x03, 0x1F, 0xAA.toByte(), 0x2C, 0x34, 0x03, 0x14),
        byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 7. IsBannerEnabled (0x458f824) -> mov w0, #0; ret
    NativePatch(
        "IsBannerEnabled",
        0x458f824L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0x00, 0x00, 0x80.toByte(), 0x52, 0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte())
    ),
    // 8. CreateBannerAd (0x458f460) -> ret
    NativePatch(
        "CreateBannerAd",
        0x458f460L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte())
    ),
    // 9. ShowBanner_4904 (0x458f580) -> ret
    NativePatch(
        "ShowBanner_4904",
        0x458f580L,
        byteArrayOf(0xFE.toByte(), 0x57, 0xBE.toByte(), 0xA9.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte())
    ),
    // 10. ShowBanner_878 (0x3e46de8) -> ret
    NativePatch(
        "ShowBanner_878",
        0x3e46de8L,
        byteArrayOf(0xFE.toByte(), 0x0F, 0x1E, 0xF8.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte()),
        byteArrayOf(0xC0.toByte(), 0x03, 0x5F, 0xD6.toByte(), 0xF4.toByte(), 0x4F, 0x01, 0xA9.toByte())
    )
)

@Suppress("unused")
val broBuddyNativeIapPatch = rawResourcePatch(
    name = "BroBuddy Native IAP Verification Bypass",
    description = "Bypasses client-side receipt and signature verification in the game's native engine, allowing free store purchases to be validated and credited instantly.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_BROBUDDY)

    execute {
        val libFile = get(LIB_PATH)
        if (!libFile.isFile) {
            error("[BroBuddy Native Bypass] libil2cpp.so not found at $LIB_PATH")
        }

        RandomAccessFile(libFile, "rw").use { raf ->
            for (patch in NATIVE_PATCHES) {
                raf.seek(patch.offset)
                raf.write(patch.replacement)
                println("[BroBuddy Native Bypass] Patched ${patch.name} at 0x${patch.offset.toString(16)}")
            }
        }
    }
}
