package app.focusguard.patches.firefox.dns

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchBuilder
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.stringOption

private const val MAX_DOH_URL_LENGTH = 512

internal fun isValidDohUrl(url: String?): Boolean {
  if (url.isNullOrEmpty() || url.length > MAX_DOH_URL_LENGTH) return false
  if (url.any { it.code !in 0x21..0x7e || it in "\"\\{}#" }) return false

  val uri = runCatching { java.net.URI(url) }.getOrNull() ?: return false

  return uri.isAbsolute &&
      uri.scheme.equals("https", ignoreCase = true) &&
      !uri.host.isNullOrEmpty() &&
      uri.rawUserInfo == null &&
      uri.rawFragment == null
}

internal class DnsFilterOptions(
    private val customUrlOption: Option<String>,
) {
  val url: String
    get() {
      val url = customUrlOption.value?.trim()

      return url?.takeIf(::isValidDohUrl)
          ?: throw PatchException("A valid custom DNS-over-HTTPS URL is required.")
    }
}

internal fun PatchBuilder<*>.dnsFilterOptions() =
    DnsFilterOptions(
        customUrlOption =
            stringOption(
                key = "customDohUrl",
                default = null,
                title = "Custom DNS-over-HTTPS resolver",
                description =
                    "Required HTTPS DNS resolver URL, e.g. https://dns.nextdns.io/your-id",
                required = true,
            ) {
              !it.isNullOrBlank() && isValidDohUrl(it.trim())
            },
    )
