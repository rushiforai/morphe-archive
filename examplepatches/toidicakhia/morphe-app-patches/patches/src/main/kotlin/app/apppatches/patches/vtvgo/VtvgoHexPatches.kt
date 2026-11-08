package app.apppatches.patches.vtvgo

import app.morphe.patches.all.misc.hex.hexPatch

/**
 * Native Dart AOT snapshots do not contain a checksum over string literals.
 * Both replacements keep the original byte length, so object-pool offsets and
 * the snapshot layout remain unchanged.
 */
private val ABI_PATHS = listOf(
    "lib/arm64-v8a/libapp.so",
    "lib/armeabi-v7a/libapp.so",
    "lib/x86/libapp.so",
    "lib/x86_64/libapp.so"
)

// Plain text: "/advertiser/v21.0/ads" and "/advertiser/v21.0/zzz".
private const val PRODUCT_AD_ENDPOINT = "2f616476657274697365722f7632312e302f616473"
private const val BLOCKED_PRODUCT_AD_ENDPOINT = "2f616476657274697365722f7632312e302f7a7a7a"

// Plain text: "sentry.vtvdigital.org" and "invalid.invalid.local".
private const val SENTRY_HOST = "73656e7472792e7674766469676974616c2e6f7267"
private const val INVALID_SENTRY_HOST = "696e76616c69642e696e76616c69642e6c6f63616c"

/**
 * The product-ad repository requests /advertiser/v21.0/ads. Pointing it at a
 * non-existent path makes the request fail and the UI skips the ad slots.
 * This is best effort: promotional content embedded in other API responses
 * cannot be removed without patching the Dart snapshot.
 */
internal val vtvgoBlockProductAdsHexPatch = hexPatch(
    ignoreMissingTargetFiles = true,
    block = {
        ABI_PATHS.forEach { path ->
            PRODUCT_AD_ENDPOINT.asPatternTo(BLOCKED_PRODUCT_AD_ENDPOINT).inFile(path)
        }
    }
)

/**
 * Sentry's DSN is a single string literal in the Dart snapshot. Replacing the
 * host with an unresolvable one stops both Dart and native Sentry transports
 * from uploading events while keeping the DSN syntactically valid.
 */
internal val vtvgoSentryDsnHexPatch = hexPatch(
    ignoreMissingTargetFiles = true,
    block = {
        ABI_PATHS.forEach { path ->
            SENTRY_HOST.asPatternTo(INVALID_SENTRY_HOST).inFile(path)
        }
    }
)
