package app.template.patches.universal.pinning

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

/*
 * Adapted from kveld's universal patch set (morphe community patches, GPLv3) —
 * `universal/UniversalOverrideCertificatePinningPatch.kt`, itself written for the
 * ReVanced/Morphe universal-patch idiom. Re-implemented against this repo's resource
 * helpers; behaviour and intent kept.
 */

private const val MANIFEST = "AndroidManifest.xml"
private val XML_REF = Regex("""^@?\+?(?:[a-zA-Z0-9_.]+:)?xml/([a-zA-Z0-9_]+)$""")

/**
 * Trusts user-installed certificate authorities even when the app ships a
 * `network-security-config`, so HTTPS traffic can be intercepted with a proxy.
 *
 * Two independent things have to be handled:
 *
 *  1. **Anchors** — an app that declares `android:networkSecurityConfig` opts out of the
 *     platform defaults, so `user` CAs are not trusted. Each `<base-config>` /
 *     `<domain-config>` gets a `<trust-anchors>` that includes the user store.
 *  2. **`overridePins`** — a `pin-set` in the config pins the real chain and *rejects* a
 *     proxy certificate regardless of the anchors. Setting `overridePins="true"` on every
 *     `pin-set` makes the anchors authoritative again (this is the documented escape hatch,
 *     the same one used for debuggable builds).
 *
 * Scope: this only covers **declarative** pinning through the NSC. Pin code that compares
 * certificates itself (OkHttp `CertificatePinner`, `RNSslPinningModule`, …) is unaffected —
 * that needs a bytecode patch (see the per-app SSL patches and the universal network-stack
 * patches). When the app declares no NSC there is nothing to override, and the patch says so
 * instead of pretending it did something.
 */
@Suppress("unused")
val universalOverrideCertificatePinningPatch = resourcePatch(
    name = "Override certificate pinning",
    description = "Trusts user-installed certificate authorities and disables declarative " +
        "pin-set enforcement, so a debugging proxy can intercept HTTPS traffic. Covers " +
        "network-security-config pinning only; in-code pinning (e.g. OkHttp CertificatePinner) " +
        "needs its own patch. Normal TLS validation is otherwise unchanged.",
    default = false,
) {
    execute {
        val nscRef = readNetworkSecurityConfigRef()
        if (nscRef == null) {
            println(
                "Override certificate pinning: skipped — the app declares no " +
                    "android:networkSecurityConfig, so it already trusts the platform defaults.",
            )
            return@execute
        }

        val resourceName = XML_REF.matchEntire(nscRef)?.groupValues?.get(1)
        if (resourceName == null) {
            println("Override certificate pinning: skipped — unrecognised NSC reference '$nscRef'.")
            return@execute
        }

        decode("res/xml*")
        val candidates = listOf(
            "res/xml/$resourceName.xml",
            "res/xml-v31/$resourceName.xml",
        ).filter { get(it, true).exists() }

        if (candidates.isEmpty()) {
            println("Override certificate pinning: skipped — '@xml/$resourceName' not found under res/xml*.")
            return@execute
        }

        var sections = 0
        var enabled = 0
        var added = 0
        candidates.forEach { path ->
            document(path).use { doc ->
                val r = applyUserCaTrust(doc)
                sections += r.sections
                enabled += r.enabled
                added += r.added
            }
        }

        // An app that declares an NSC always ends up with a trust anchor one way or another.
        // Note which of the three cases applied — "already trusted" is a success, not a
        // failure; a guard that treats an already-satisfied precondition as an error would
        // fail the build for a correctly-pinned-and-already-patched app.
        println(
            "Override certificate pinning: '@xml/$resourceName' — " +
                "$sections config section(s) found; user-CA trust enabled in $enabled, " +
                "already present in ${sections - enabled}, base-config added to $added file(s).",
        )
    }
}

private fun app.morphe.patcher.patch.ResourcePatchContext.readNetworkSecurityConfigRef(): String? {
    var ref: String? = null
    document(MANIFEST).use { doc ->
        val app = doc.getElementsByTagName("application").item(0) as? Element ?: return@use
        val value = app.getAttribute("android:networkSecurityConfig")
        if (value.isNotEmpty() && value != "@null") ref = value
    }
    return ref
}

private data class TrustResult(val sections: Int, val enabled: Int, val added: Int)

/**
 * Adds the user store to every config section and neutralises pin-sets.
 *
 * If the config declares **no** `base-config`/`domain-config` at all (some apps only carry
 * `debug-overrides`), a `base-config` is appended — otherwise there would be nothing for the
 * user anchors to apply to and the patch would be a no-op.
 */
private fun applyUserCaTrust(doc: Document): TrustResult {
    // 1) pin-set overridePins="true" — makes the anchors authoritative over a pinned chain.
    val pinSets = doc.getElementsByTagName("pin-set")
    for (i in 0 until pinSets.length) {
        (pinSets.item(i) as? Element)?.setAttribute("overridePins", "true")
    }

    // 2) user CA trust anchors on every config section
    var sections = 0
    var enabled = 0
    for (tag in listOf("base-config", "domain-config")) {
        val nodes = doc.getElementsByTagName(tag)
        for (i in 0 until nodes.length) {
            val section = nodes.item(i) as? Element ?: continue
            sections++
            if (section.hasUserAnchor()) continue
            appendUserAnchor(doc, section)
            enabled++
        }
    }

    // 3) no config section at all → create one so the anchors have somewhere to live.
    var added = 0
    if (sections == 0) {
        val root = doc.documentElement
        val base = doc.createElement("base-config")
        appendUserAnchor(doc, base)
        root.appendChild(base)
        added++
        sections++
        enabled++
    }

    return TrustResult(sections, enabled, added)
}

private fun Element.hasUserAnchor(): Boolean {
    val anchors = getElementsByTagName("trust-anchors")
    for (i in 0 until anchors.length) {
        val certs = (anchors.item(i) as? Element)?.getElementsByTagName("certificates")
            ?: continue
        for (j in 0 until certs.length) {
            val src = (certs.item(j) as? Element)?.getAttribute("src")
            if (src == "user") return true
        }
    }
    return false
}

private fun appendUserAnchor(doc: Document, section: Element) {
    val anchors: Element = section.getElementsByTagName("trust-anchors").item(0) as? Element
        ?: doc.createElement("trust-anchors").also { section.appendChild(it) }

    anchors.appendChild(doc.createElement("certificates").apply { setAttribute("src", "user") })
}
