/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.sync

import app.anondev.patches.zotero.shared.Constants.COMPATIBILITY_ZOTERO
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Path of the manifest's `android:networkSecurityConfig` resource inside the APK. */
private const val NETWORK_SECURITY_CONFIG = "res/xml/network_security_config.xml"

/**
 * (b) THE CLEARTEXT POLICY POINT.
 *
 * When the live-update URL is cleartext (`ws://` or `http://`), this patch adds its host to
 * the app's existing cleartext allow-list so OkHttp will accept the connection. With the
 * default derived URL (`wss://…`) it does nothing.
 *
 * The target's `res/xml/network_security_config.xml` already has a
 * `<domain-config cleartextTrafficPermitted="true">` element allow-listing
 * `arxiv.org`, `home.arpa`, `local` and `www.zotero.org`; the new host is inserted as a
 * sibling `<domain includeSubdomains="true">` inside that same element.
 *
 * This patch exists as a separate entry so the bundle exposes it as its own unit and the
 * cleartext decision stays isolated from the bytecode rewrite.
 */
@Suppress("unused")
val allowCleartextStreamingPatch = resourcePatch(
    name = "Custom sync server: allow cleartext streaming",
    description = "Adds the chosen streaming host to the app's cleartext allow-list when " +
        "the stream URL is ws:// or http://.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZOTERO)
    category("Sync")

    // Same Option instances as the bytecode patch: the operator enters the values once.
    val server by serverOption()
    val streaming by streamingOption()

    execute {
        val origin = normaliseOrigin(server)
        val streamingUrl = resolveStreamingUrl(origin, streaming)

        // TLS stream → nothing to allow-list.
        val host = cleartextStreamingHost(streamingUrl) ?: return@execute

        document(NETWORK_SECURITY_CONFIG).use { document ->
            val domainConfig = document.getElementsByTagName("domain-config").item(0) as? Element
                ?: throw PatchException(
                    "Custom sync server: '$NETWORK_SECURITY_CONFIG' has no <domain-config> " +
                        "element to add the cleartext host to.",
                )

            // Do not duplicate a host that is already allow-listed.
            val existing = domainConfig.getElementsByTagName("domain")
            for (i in 0 until existing.length) {
                val node = existing.item(i) as? Element ?: continue
                if (node.textContent.trim() == host) return@use
            }

            val domain = document.createElement("domain")
            domain.setAttribute("includeSubdomains", "true")
            domain.textContent = host
            domainConfig.appendChild(domain)
        }
    }
}
