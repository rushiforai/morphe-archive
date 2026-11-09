package app.mitrosoft.patches.bloomberg

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BLOOMBERG
import java.security.MessageDigest

private const val BUNDLE_PATH = "assets/index.android.bundle"
private const val SHA1_FOOTER_BYTES = 20

private val STUB_TRUE = byteArrayOf(0x78, 0x00, 0x5C, 0x00)                    // LoadConstTrue r0; Ret r0
private val STUB_NULL = byteArrayOf(0x77, 0x00, 0x5C, 0x00)                    // LoadConstNull r0; Ret r0
private val STUB_EMPTY_ARRAY = byteArrayOf(0x07, 0x00, 0x00, 0x00, 0x5C, 0x00) // NewArray r0, 0; Ret r0

private class BundleStub(val label: String, val offset: Int, val original: ByteArray, val replacement: ByteArray)

// Function offsets and original bytes for the Bloomberg 6.66.0 bundle (HBC version 96).
// A different build fails the byte check instead of being patched blindly.
private val bundleStubs = listOf(
    BundleStub("hasActiveDeviceSubscriptions", 0x4E26FB, byteArrayOf(0x29, 0x00, 0x00, 0x2E), STUB_TRUE),
    BundleStub("getAdsForSection", 0x5651C2, byteArrayOf(0x6C, 0x08, 0x01, 0x6C, 0x0A, 0x02), STUB_EMPTY_ARRAY),
    BundleStub("getAdPositions", 0x79C6A3, byteArrayOf(0x7C, 0x03, 0x37, 0x02, 0x03, 0x01), STUB_EMPTY_ARRAY),
    BundleStub("AdComponent", 0x8AE6C2, byteArrayOf(0x32, 0x01, 0x6C, 0x00), STUB_NULL),
    BundleStub("AdListItem", 0x50777C, byteArrayOf(0x6C, 0x00, 0x01, 0x37), STUB_NULL),
    BundleStub("AdListItem", 0x5DDBB3, byteArrayOf(0x6C, 0x00, 0x01, 0x37), STUB_NULL),
    BundleStub("AdListItem", 0x7DFE1D, byteArrayOf(0x6C, 0x00, 0x01, 0x37), STUB_NULL),
    BundleStub("BannerAdWrapperComponent.render", 0x56197E, byteArrayOf(0x7C, 0x0C, 0x36, 0x00), STUB_NULL),
)

@Suppress("unused")
val disableAdsForceSubscriptionPatch = resourcePatch(
    name = "Force subscription and disable ads",
    description = "Hides ad components, ad slots, and banner ads, and makes the app report an active device subscription.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BLOOMBERG)

    execute {
        val bundlePath = decode(BUNDLE_PATH).singleOrNull() ?: error("$BUNDLE_PATH not found in the APK")
        val bundle = get(bundlePath)
        val data = bundle.readBytes()

        for (stub in bundleStubs) {
            val current = data.copyOfRange(stub.offset, stub.offset + stub.replacement.size)
            check(current.contentEquals(stub.original)) {
                "${stub.label} at 0x${stub.offset.toString(16)} does not match Bloomberg 6.66.0"
            }
            stub.replacement.copyInto(data, stub.offset)
        }

        val footerStart = data.size - SHA1_FOOTER_BYTES
        MessageDigest.getInstance("SHA-1").digest(data.copyOfRange(0, footerStart)).copyInto(data, footerStart)

        bundle.writeBytes(data)
    }
}
