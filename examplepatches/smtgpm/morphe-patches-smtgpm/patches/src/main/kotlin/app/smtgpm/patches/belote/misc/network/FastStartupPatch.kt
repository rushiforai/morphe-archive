/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.misc.network

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.resignFixPatch

private const val ADDRESSABLES_SETTINGS = "assets/aa/settings.json"

/** Seconds before a stalled content catalog request fails and Addressables retries it. */
private const val CATALOG_TIMEOUT_SECONDS = 10

/** Parallel CDN downloads. The game ships 500. */
private const val MAX_CONCURRENT_REQUESTS = 8

/**
 * Startup waits for the album content catalogs on the CDN. Addressables ships with no catalog
 * timeout and up to 500 parallel requests, which can stall for minutes behind a VPN.
 */
@Suppress("unused")
val fastStartupPatch = rawResourcePatch(
    name = "Fast startup on VPN",
    description = "Stops the loading screen from hanging when a download stalls, e.g. behind a VPN.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch)

    execute {
        val file = get(ADDRESSABLES_SETTINGS)
        if (!file.isFile) throw PatchException("$ADDRESSABLES_SETTINGS not found")

        var text = file.readText()
        mapOf(
            "\"m_CatalogRequestsTimeout\":0" to "\"m_CatalogRequestsTimeout\":$CATALOG_TIMEOUT_SECONDS",
            "\"m_maxConcurrentWebRequests\":500" to "\"m_maxConcurrentWebRequests\":$MAX_CONCURRENT_REQUESTS",
        ).forEach { (original, patched) ->
            if (original !in text) throw PatchException("Unexpected Addressables settings: $original not found")
            text = text.replace(original, patched)
        }
        file.writeText(text)
    }
}
