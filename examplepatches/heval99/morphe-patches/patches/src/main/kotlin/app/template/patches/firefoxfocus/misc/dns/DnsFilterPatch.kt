package app.template.patches.firefoxfocus.misc.dns

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.misc.dns.DNS_FILTER_DESCRIPTION
import app.template.patches.shared.misc.dns.DNS_FILTER_PATCH_NAME
import app.template.patches.shared.misc.dns.dnsFilterOptions
import app.template.patches.shared.misc.dns.forceGeckoViewDns

@Suppress("unused")
val dnsFilterPatch = bytecodePatch(
    name = DNS_FILTER_PATCH_NAME,
    description = DNS_FILTER_DESCRIPTION,
    default = false,
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    val options = dnsFilterOptions()

    // Focus has no Secure DNS setting of its own, so pinning GeckoView is the whole patch.
    execute { forceGeckoViewDns(options.url, options.strict) }
}
