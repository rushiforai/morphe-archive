package app.template.patches.opera.adblock

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import java.io.ByteArrayInputStream
import java.util.zip.GZIPInputStream
import java.util.zip.GZIPOutputStream

/**
 * Opera's built-in ad blocker ships additional filter lists whose only purpose is
 * to WHITELIST (allow through) ads and trackers of paying partners. In Opera
 * 103/104 (stable and beta) these are gzip-compressed compiled lists inside
 * `assets/abp_files/op/`, identified by content:
 *
 *  - `97bda3c5f03d52761408ab55856bcfabb59a65c56c3410f6ac31e84f2818c4b5`
 *    DOCUMENT exceptions + direct allows for Google/Yandex measurement:
 *    google-analytics.com, googletagmanager.com, fls.doubleclick.net,
 *    stats.g.doubleclick.net, googleadservices.com, all mc.yandex.* Metrica hosts.
 *
 *  - `f66a1f2c11bd7830e617485b99028f65a194f3e0cec253907b1e72177f6ab3b4`
 *    DOCUMENT exceptions for Taboola, 30+ gambling operators (1xbet, Betway,
 *    Bet9ja, Betika, Hollywoodbets, Supabets, Melbet, ...), Amazon/Jumia/Lazada/
 *    Flipkart affiliate storefronts, Opera's own properties, plus direct allows
 *    for attribution SDKs (appsflyer.com, adjust.com, control.kochava.com) and
 *    Commission Junction affiliate tracking domains (qksrv.net, tkqlhce.com,
 *    dpbolvw.net, anrdoezrs.net, emjcd.com, kqzyfj.com, ...).
 *
 * Bundled assets are loaded by filename and are not content-verified at load
 * time (only lists downloaded into the app's files directory are digested), so a
 * pure-whitelist asset can be replaced with an empty compiled list under the
 * same filename. The patch therefore detects *any* bundled list that consists
 * exclusively of allow directives (has `DOCUMENT =` / `WHITE.PLAIN` / `WHITE.GLOB`
 * but no `BLACK` section) and replaces it with an empty list — this covers the
 * two current whitelists and any future pure-whitelist list Opera may add.
 *
 * The empty replacement is byte-identical to the empty compiled list Opera itself
 * ships (`e87a67d8...`), so the format is guaranteed to parse.
 */
@Suppress("unused")
val operaDisableAcceptableAdsPatch = resourcePatch(
    name = "Disable Acceptable Ads whitelist",
    description = "Replaces Opera's hidden partner whitelists (Google/Yandex " +
        "measurement, Taboola, gambling and shopping affiliates, AppsFlyer/Adjust/" +
        "Kochava/CJ tracking domains) with empty filter lists, so the built-in ad " +
        "blocker actually blocks them.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY)

    execute {
        val abpDirectory = get("assets/abp_files/op")
        if (!abpDirectory.isDirectory) {
            throw PatchException(
                "Decoded APK does not contain assets/abp_files/op/. " +
                    "Is this an unsupported Opera version?",
            )
        }

        var neutralized = 0
        val neutralizedNames = mutableListOf<String>()

        for (file in abpDirectory.listFiles().orEmpty().filter { it.isFile }.sortedBy { it.name }) {
            val raw = file.readBytes()
            val text = decompress(raw) ?: continue

            val hasAllowDirectives =
                text.contains("DOCUMENT =") ||
                    text.contains("WHITE.PLAIN") ||
                    text.contains("WHITE.GLOB")
            // Any list with blocking rules carries a BLACK section; a list made
            // only of allow directives does not.
            val hasNoBlockingRules = !text.contains("BLACK")

            if (!hasAllowDirectives || !hasNoBlockingRules) continue

            file.outputStream().use { output ->
                GZIPOutputStream(output).use { gzip ->
                    gzip.write(EMPTY_COMPILED_LIST.toByteArray(Charsets.UTF_8))
                }
            }
            neutralized++
            neutralizedNames += file.name.take(12) + "…"
        }

        if (neutralized == 0) {
            throw PatchException(
                "No pure-whitelist filter lists found in assets/abp_files/op/. " +
                    "Either the whitelists were already removed, or this Opera " +
                    "version uses a different layout.",
            )
        }

        println(
            "Opera Acceptable Ads: neutralized $neutralized whitelist list(s): " +
                neutralizedNames.joinToString(", "),
        )
    }
}

/**
 * Decompresses a gzipped compiled filter list, or returns the raw text if the
 * payload is not gzip-compressed. Returns null if the bytes are not valid text.
 */
private fun decompress(raw: ByteArray): String? {
    val isGzip = raw.size > 2 && raw[0] == 0x1f.toByte() && raw[1] == 0x8b.toByte()
    return try {
        val bytes = if (isGzip) {
            GZIPInputStream(ByteArrayInputStream(raw)).use { it.readBytes() }
        } else {
            raw
        }
        String(bytes, Charsets.UTF_8)
    } catch (_: Exception) {
        null
    }
}

/**
 * Byte-identical to Opera's own empty compiled list (asset
 * `e87a67d80d78d6ad9992c9c4ea0b6aba4e3b66f4c8d3268efa2bc01be7997d65`).
 */
private val EMPTY_COMPILED_LIST =
    """
    [default]
    BLACK = ([])
    DOMAINLESS = (["NO_ELEMENT":([]),])
    EXTENDED_BLACK = ([])
    EXTENDED_WHITE = ([])
    OFA.VERSION = 2
    WHITE = ([])
    """.trimIndent() + "\n"
