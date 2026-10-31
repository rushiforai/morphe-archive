package app.badfella.patches.nikkei

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import java.nio.charset.StandardCharsets
import java.security.MessageDigest

private const val MODERN = "assets/public/assets/index-9f8177ed.js"
private const val LEGACY = "assets/public/assets/index-legacy-a206fc4c.js"

private const val MODERN_STOCK = "d168012c51dcc4c4577fc51b30c2ef603851fba290ac549f17f3d294b650e092"
private const val LEGACY_STOCK = "9bfa49f529150862c11fef5fabcf3ba6f25b0cc6eec324fbbcf8bab4cf009d05"

private const val LOCKED = "{access:!1}"
private const val UNLOCKED = "{access:!0}"

private const val PAYWALL_GUARD_MODERN_STOCK = "_.useEffect(d,f),n)return null"
private const val PAYWALL_GUARD_MODERN_PATCHED = "_.useEffect(d,f),!0)return null"
private const val PAYWALL_GUARD_LEGACY_STOCK = "wv.useEffect(t,n),a)return null"
private const val PAYWALL_GUARD_LEGACY_PATCHED = "wv.useEffect(t,n),!0)return null"

// The app runs its own web-bundle updater (independent of the plugin's autoUpdate:false):
// on start, on every foreground and on a five-minute interval it queries GetUpdates, downloads
// the server's downloadUrl bundle and activates it on the next foreground, replacing the
// APK's assets. Disabling the provider keeps the patched bundle in control.
private const val UPDATE_PROVIDER_STOCK = ":{updateProviderEnabled:!0,platform:"
private const val UPDATE_PROVIDER_PATCHED = ":{updateProviderEnabled:!1,platform:"

private const val ACCOUNT_HEADER = "{children:\"Account\"}"
private const val ACCOUNT_BRANDED = "{children:\"Account Premium Unlocked by BadFella\"}"

private const val SUBSCRIBE_ROW_STOCK = "children:\"Subscribe\""
private const val SUBSCRIBE_ROW_PATCHED = "children:\"Patched by BadFella\""

private val stockHashes = mapOf(MODERN to MODERN_STOCK, LEGACY to LEGACY_STOCK)

private val bundleEdits = mapOf(
    MODERN to listOf(
        LOCKED to UNLOCKED,
        PAYWALL_GUARD_MODERN_STOCK to PAYWALL_GUARD_MODERN_PATCHED,
        UPDATE_PROVIDER_STOCK to UPDATE_PROVIDER_PATCHED,
        ACCOUNT_HEADER to ACCOUNT_BRANDED,
        SUBSCRIBE_ROW_STOCK to SUBSCRIBE_ROW_PATCHED,
    ),
    LEGACY to listOf(
        LOCKED to UNLOCKED,
        PAYWALL_GUARD_LEGACY_STOCK to PAYWALL_GUARD_LEGACY_PATCHED,
        UPDATE_PROVIDER_STOCK to UPDATE_PROVIDER_PATCHED,
        SUBSCRIBE_ROW_STOCK to SUBSCRIBE_ROW_PATCHED,
    ),
)

private fun sha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

private fun ByteArray.asText(): String = toString(StandardCharsets.UTF_8)

private fun countOccurrences(haystack: String, needle: String): Int {
    var count = 0
    var index = haystack.indexOf(needle)
    while (index >= 0) {
        count++
        index = haystack.indexOf(needle, index + needle.length)
    }
    return count
}

/**
 * Grants article access in the Nikkei Asia web bundle.
 *
 * The app is Capacitor-based: `useRegisterArticleView` decides whether to render an article
 * body or mount the paywall. Its single `{access:false}` exit is the paywall branch, so
 * flipping that literal makes the article always render. The paywall overlay component is
 * additionally made to return null unconditionally, so no paywall surface can mount even if
 * another code path reports the article as locked. The app also ships its own web-bundle
 * updater (a controller that downloads the server's bundle and activates it, bypassing the
 * APK's assets entirely); that updater is disabled so the patched bundle stays in control.
 * The Account screen's Subscribe row is relabelled "Patched by BadFella" (its navigation and
 * the subscription page itself stay stock), and the Account header is branded.
 *
 * Both the modern and the legacy bundle are patched, because the app selects one at runtime
 * and stock ships the gate, the paywall and the updater wiring in both.
 */
@Suppress("unused")
val nikkeiArticleAccessPatch = resourcePatch(
    name = "Nikkei Asia premium reading",
    description = "Grants article access in the Nikkei Asia reader by making its local article-access " +
        "check always succeed, removes the paywall overlay, stops the app's self-updating web " +
        "bundle from replacing the patched assets, labels the Account screen \"Premium Unlocked " +
        "by BadFella\" and its Subscribe row \"Patched by BadFella\". Keeps account sign-in and " +
        "store billing; does not change server-side entitlements.",
) {
    compatibleWith(Compatibility(
        name = "Nikkei Asia", packageName = "com.nikkei.asia", apkFileType = ApkFileType.XAPK,
        targets = listOf(
            AppTarget(version = "8a14774d3a9cb8f25eaae58f4c4e4f3e", versionCode = 1737598861, isExperimental = true),
        ),
    ))
    execute {
        bundleEdits.forEach { (path, edits) ->
            val file = get(path)
            val bytes = file.readBytes()
            check(sha256(bytes) == stockHashes.getValue(path)) {
                "Unreviewed Nikkei Asia bundle: $path. Use 8a14774d3a9cb8f25eaae58f4c4e4f3e build 1737598861."
            }
            var patched = bytes.asText()
            edits.forEach { (stock, replacement) ->
                val count = countOccurrences(patched, stock)
                check(count == 1) {
                    "Nikkei anchor count $count for \"${stock.take(48)}\" in $path, expected 1"
                }
                patched = patched.replaceFirst(stock, replacement)
            }
            check(countOccurrences(patched, LOCKED) == 0 && countOccurrences(patched, UNLOCKED) == 5) {
                "Nikkei article gate was not fully applied in $path"
            }
            check(countOccurrences(patched, ",!0)return null") == 1) {
                "Nikkei paywall overlay was not disabled in $path"
            }
            check(countOccurrences(patched, ":{updateProviderEnabled:!1,platform:") == 1 &&
                countOccurrences(patched, ":{updateProviderEnabled:!0,platform:") == 0) {
                "Nikkei web-bundle updater was not disabled in $path"
            }
            check(countOccurrences(patched, SUBSCRIBE_ROW_PATCHED) == 1 &&
                countOccurrences(patched, SUBSCRIBE_ROW_STOCK) == 0) {
                "Nikkei subscribe row label missing in $path"
            }
            if (path == MODERN) {
                check(countOccurrences(patched, ACCOUNT_BRANDED) == 1) {
                    "Nikkei account label missing in $path"
                }
            }
            file.writeBytes(patched.toByteArray(StandardCharsets.UTF_8))
        }
    }
}
