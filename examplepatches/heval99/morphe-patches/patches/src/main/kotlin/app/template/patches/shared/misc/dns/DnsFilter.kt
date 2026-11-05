package app.template.patches.shared.misc.dns

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchBuilder
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption

// "DNS filter" (GitHub #121, owner-approved 2026-11-03) for Brave, Firefox and Firefox Focus: the
// browser resolves every name through one DNS-over-HTTPS resolver chosen at patch time (by default
// a family filter) and the user cannot switch Secure DNS off or to another resolver in the app.

internal const val DNS_FILTER_PATCH_NAME = "DNS filter"
internal const val DNS_FILTER_DESCRIPTION =
    "Forces a family-safe DNS filter and locks the browser's Secure DNS setting."

internal const val DOH_MODE_STRICT = "strict"
internal const val DOH_MODE_FALLBACK = "fallback"

private const val DEFAULT_DOH_URL = "https://doh.cleanbrowsing.org/doh/family-filter/"
private const val MAX_DOH_URL_LENGTH = 512

// Every preset answered an RFC 8484 query over GET and POST with 200 application/dns-message
// (curl, 2026-11-03).
private val DOH_PRESETS = mapOf(
    "CleanBrowsing Family" to DEFAULT_DOH_URL,
    "CleanBrowsing Adult" to "https://doh.cleanbrowsing.org/doh/adult-filter/",
    "Cloudflare for Families" to "https://family.cloudflare-dns.com/dns-query",
    "AdGuard Family" to "https://family.adguard-dns.com/dns-query",
)

/**
 * True for an absolute https URL with a host and nothing that would need escaping in smali or
 * break a browser's template parsing: printable ASCII only (no whitespace), no quote, backslash,
 * braces (a Chromium `{?dns}` template) or `#`, no user info or fragment, at most 512 characters.
 */
internal fun isValidDohUrl(url: String?): Boolean {
    if (url.isNullOrEmpty() || url.length > MAX_DOH_URL_LENGTH) return false
    if (url.any { it.code !in 0x21..0x7e || it in "\"\\{}#" }) return false
    val uri = runCatching { java.net.URI(url) }.getOrNull() ?: return false
    return uri.isAbsolute && uri.scheme.equals("https", ignoreCase = true) && !uri.host.isNullOrEmpty() &&
        uri.rawUserInfo == null && uri.rawFragment == null
}

/** The two options every "DNS filter" patch registers, read once its execute block runs. */
internal class DnsFilterOptions(
    private val urlOption: Option<String>,
    private val modeOption: Option<String>,
) {
    /** The resolver URL, validated again so a bad value can never reach a const-string. */
    val url: String
        get() = urlOption.value?.takeIf(::isValidDohUrl)
            ?: throw PatchException("DNS-over-HTTPS resolver URL is not a valid https URL: ${urlOption.value}")

    /** True when browsing must stop if the resolver is unreachable, false to fall back to the system DNS. */
    val strict: Boolean
        get() = when (modeOption.value) {
            DOH_MODE_STRICT -> true
            DOH_MODE_FALLBACK -> false
            else -> throw PatchException("DNS filter mode must be $DOH_MODE_STRICT or $DOH_MODE_FALLBACK: ${modeOption.value}")
        }
}

/** Registers the resolver URL and mode options on this patch. */
internal fun PatchBuilder<*>.dnsFilterOptions() = DnsFilterOptions(
    urlOption = stringOption(
        key = "dohUrl",
        default = DEFAULT_DOH_URL,
        values = DOH_PRESETS,
        title = "DNS-over-HTTPS resolver",
        description = "The https address of the DNS-over-HTTPS resolver the browser must use.",
        required = true,
    ) { isValidDohUrl(it) },
    modeOption = stringOption(
        key = "dohMode",
        default = DOH_MODE_STRICT,
        values = mapOf(
            "Strict (no browsing when the resolver is down)" to DOH_MODE_STRICT,
            "Fallback (use the normal DNS when the resolver is down)" to DOH_MODE_FALLBACK,
        ),
        title = "Mode",
        description = "Strict never uses the normal DNS, so nothing loads while the resolver is unreachable. " +
            "Fallback is easier to get around.",
        required = true,
    ) { it == DOH_MODE_STRICT || it == DOH_MODE_FALLBACK },
)
