package app.pigfoot.patches.shared.maps

import java.nio.charset.Charset
import java.security.MessageDigest

internal fun isMapsKey(value: String?) = value.isNullOrBlank() || Regex("AIza[A-Za-z0-9_-]{35}").matches(value.trim())
internal fun mapsSha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

/** Equal-length string-pool payload edit, not a general AXML parser.
 * App-owned FULL manifest pins qualify the XML structure and unique Maps field;
 * the literal-value pin qualifies its payload. Every other byte is preserved.
 * Only the fixed ASCII39 key format in UTF8 or Android UTF16LE is supported. */
internal fun replaceMapsKeyBytes(bytes: ByteArray, manifestPins: Set<String>, originalKeySha256: String, candidate: String?): ByteArray {
    require(isMapsKey(candidate)) { "Invalid Google Maps API key format" }
    if(candidate.isNullOrBlank()) return bytes
    require(manifestPins.isNotEmpty() && manifestPins.all { it.matches(Regex("[0-9a-f]{64}")) } && mapsSha256(bytes) in manifestPins) {
        "Unsupported original Google Maps metadata"
    }
    require(originalKeySha256.matches(Regex("[0-9a-f]{64}"))) { "Invalid original Maps value pin" }
    data class Site(val offset: Int,val length: Int,val encoding: Charset)
    val sites=mutableListOf<Site>()
    for(encoding in listOf(Charsets.UTF_8,Charsets.UTF_16LE)) {
        val prefix="AIza".toByteArray(encoding);val width=if(encoding==Charsets.UTF_8)1 else 2;val length=39*width
        for(offset in 0..(bytes.size-length-width).coerceAtLeast(-1)) {
            if(!prefix.indices.all { bytes[offset+it]==prefix[it] })continue
            if((0 until width).any { bytes[offset+length+it]!=0.toByte() })continue
            val value=bytes.copyOfRange(offset,offset+length).toString(encoding)
            if(value.length==39 && isMapsKey(value) && mapsSha256(value.toByteArray())==originalKeySha256) sites.add(Site(offset,length,encoding))
        }
    }
    require(sites.size==1) { "Missing or ambiguous original Maps literal" }
    val site=sites.single();val replacement=candidate.trim().toByteArray(site.encoding)
    require(replacement.size==site.length) { "Unsupported Maps literal size" }
    return bytes.copyOf().also { replacement.copyInto(it,site.offset) }
}
