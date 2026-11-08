package app.template.patches.opera.gx

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.opera.OPERA_GX_COMPATIBILITY

/**
 * Opera GX (the WebView-based 3.x app, package com.opera.gx) pre-seeds its start
 * page from the JSON files in `assets/preloadedTopSites`. Half of the default tiles are
 * sponsored: affiliate entries routed through Opera's `operagx.gg` shortener
 * (Eneba, Instant Gaming), entries with an explicit `realUrl` partner field, and
 * Amazon storefronts tagged `?tag=operagx-mob-sp-sd-*` in the per-country
 * variants. The loader (`qp4` in 3.3.18) reads the same directory and expects a
 * flat JSON array of {title, url[, realUrl]} objects.
 *
 * This resource patch rewrites every `topSites*.json` in that directory, dropping
 * sponsored entries while keeping organic ones (YouTube, Twitch, ...). Files
 * without sponsored entries are left untouched.
 *
 * GX's ad-blocker configuration itself is downloaded at runtime
 * (`download.opera.com/download/get/?resource=adblocker_v2`, 52 lists including
 * uBO/AdGuard/Fanboy lists that can be enabled under Settings → Ad blocking →
 * Manage lists); it cannot be edited by a static APK patch — see the README.
 */
@Suppress("unused")
val gxRemoveSponsoredTilesPatch = resourcePatch(
    name = "Remove sponsored Speed Dial",
    description = "Removes sponsored tiles (Eneba, Instant Gaming, Amazon and other " +
        "affiliate links routed through operagx.gg) from Opera GX's preloaded start " +
        "page, keeping the organic default tiles.",
    default = true,
) {
    compatibleWith(OPERA_GX_COMPATIBILITY)

    execute {
        val topSitesDirectory = get("assets/preloadedTopSites")
        if (!topSitesDirectory.isDirectory) {
            throw PatchException(
                "Decoded APK does not contain assets/preloadedTopSites/. " +
                    "Is this an unsupported Opera GX version?",
            )
        }

        val jsonFiles = topSitesDirectory.listFiles().orEmpty()
            .filter { it.isFile && it.name.endsWith(".json") }
            .sortedBy { it.name }
        if (jsonFiles.isEmpty()) {
            throw PatchException("assets/preloadedTopSites/ contains no JSON files.")
        }

        var removed = 0
        val touched = mutableListOf<String>()

        for (json in jsonFiles) {
            val result = stripSponsoredEntries(json.readText(Charsets.UTF_8)) ?: continue
            json.writeText(result.first, Charsets.UTF_8)
            removed += result.second
            touched += "${json.name} (-${result.second})"
        }

        if (removed == 0) {
            throw PatchException(
                "No sponsored entries found in assets/preloadedTopSites/. " +
                    "Either they were already removed, or this Opera GX version " +
                    "uses a different layout.",
            )
        }

        println("Opera GX sponsored tiles: removed $removed entr(y/ies) — ${touched.joinToString(", ")}")
    }
}

/**
 * Splits the top-level JSON array into its member objects (brace-depth scan that
 * is tolerant of strings containing braces) and drops sponsored objects.
 *
 * Sponsored markers:
 *  - `"realUrl"` key present (partner tiles disclose their destination);
 *  - `url` points at the `operagx.gg` redirector (Opera's sponsored-link domain);
 *  - `url` contains an `operagx` affiliate tag (`?tag=operagx...`, Amazon et al.).
 *
 * @return null when nothing needed to change, otherwise the rewritten JSON and
 *         the number of removed entries.
 */
private fun stripSponsoredEntries(content: String): Pair<String, Int>? {
    val arrayStart = content.indexOf('[')
    val arrayEnd = content.lastIndexOf(']')
    if (arrayStart < 0 || arrayEnd <= arrayStart) return null

    val body = content.substring(arrayStart + 1, arrayEnd)
    val entries = mutableListOf<String>()
    var depth = 0
    var inString = false
    var escaped = false
    var objectStart = -1

    for (index in body.indices) {
        val char = body[index]
        when {
            escaped -> escaped = false
            inString && char == '\\' -> escaped = true
            char == '"' -> inString = !inString
            !inString && char == '{' -> {
                if (depth == 0) objectStart = index
                depth++
            }
            !inString && char == '}' -> {
                depth--
                if (depth == 0 && objectStart >= 0) {
                    entries += body.substring(objectStart, index + 1)
                    objectStart = -1
                }
            }
        }
    }

    val sponsoredUrl = Regex("\"url\"\\s*:\\s*\"https://operagx\\.gg/")
    val affiliateTag = Regex("[?&]tag=operagx")

    val kept = entries.filterNot { entry ->
        "\"realUrl\"" in entry ||
            sponsoredUrl.containsMatchIn(entry) ||
            affiliateTag.containsMatchIn(entry)
    }

    if (kept.size == entries.size) return null

    val rebuilt = if (kept.isEmpty()) "[]" else kept.joinToString(",", prefix = "[", postfix = "]")
    return rebuilt to (entries.size - kept.size)
}
