import app.template.patches.shared.misc.dns.isValidDohUrl
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Test

/** The DNS filter's URL check is the only guard on a value written into a const-string. */
class DnsFilterUrlTest {
    @Test
    fun `accepts plain https resolver URLs`() {
        listOf(
            "https://doh.cleanbrowsing.org/doh/family-filter/",
            "https://family.cloudflare-dns.com/dns-query",
            "https://family.adguard-dns.com/dns-query",
            "HTTPS://dns.example.com:8443/q",
        ).forEach { assertTrue(isValidDohUrl(it), it) }
    }

    @Test
    fun `rejects anything that could break out or is not a plain https URL`() {
        listOf(
            null, "", "http://a/dns-query", "https://", "https:///x", "https://u@a/",
            "https://a/\"", "https://a/\\u", "https://a/{?dns}", "https://a/#x", "https://a/ b",
            "https://a/\n", "https://a/é", "ftp://a/", "https://" + "a".repeat(600),
        ).forEach { assertFalse(isValidDohUrl(it), it.toString()) }
    }
}
