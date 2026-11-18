package app.venus.i18n

import android.content.Context
import com.facebook.react.bridge.Promise
import java.io.ByteArrayOutputStream
import java.io.InputStream

/**
 * Venus settings languages. Each one is a JSON file in the patched APK, assets/venus/i18n/<code>.json,
 * read only when that language is picked (or Discord is set to it), so none of them slows down Discord's start.
 * Reached through FileModule.readAsset's Promise with a private prefix; ordinary readAsset calls fall through.
 * Only Java/Android APIs: the host's Kotlin helpers are obfuscated.
 */
object Languages {
    private const val PREFIX = "venus-i18n-v1:"
    private const val MAX_BYTES = 1024 * 1024

    /** A language code and nothing else ("ru", "pt-BR"): never a path. */
    private fun validCode(code: String): Boolean {
        if (code.length == 0 || code.length > 10) return false
        var i = 0
        while (i < code.length) {
            val c = code[i].code
            if (!(c >= 97 && c <= 122 || c >= 65 && c <= 90 || c == 45)) return false
            i++
        }
        return true
    }

    @JvmStatic
    fun dispatch(request: String, promise: Promise, context: Context?): Boolean {
        // Like SystemFont: substring and != compile to java.lang.String; startsWith would pull in kotlin.text.
        if (request.length < PREFIX.length || request.substring(0, PREFIX.length) != PREFIX) return false
        val code = request.substring(PREFIX.length)
        if (!validCode(code)) { promise.reject("VENUS_I18N", "Unknown language"); return true }
        if (context == null) { promise.reject("VENUS_I18N", "Discord's files are unavailable"); return true }
        var input: InputStream? = null
        try {
            input = context.assets.open(java.lang.StringBuilder("venus/i18n/").append(code).append(".json").toString())
            val out = ByteArrayOutputStream()
            val buffer = ByteArray(16384)
            while (true) {
                val read = input.read(buffer)
                if (read < 0) break
                out.write(buffer, 0, read)
                if (out.size() > MAX_BYTES) { promise.reject("VENUS_I18N", "Language file too big"); return true }
            }
            promise.resolve(out.toString("UTF-8"))
        } catch (error: Throwable) {
            promise.reject("VENUS_I18N", "Language unavailable")
        } finally {
            try { input?.close() } catch (_: Throwable) { }
        }
        return true
    }
}
