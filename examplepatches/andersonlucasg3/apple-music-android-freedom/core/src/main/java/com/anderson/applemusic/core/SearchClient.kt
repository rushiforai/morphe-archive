package com.anderson.applemusic.core

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.provider.MediaStore
import android.util.Base64
import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.io.InputStream
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import java.security.KeyStore
import java.util.Locale
import javax.crypto.Cipher
import javax.crypto.SecretKey
import javax.crypto.spec.GCMParameterSpec

/**
 * Catalogue search through Apple Music's own amp-api, using the developer token the
 * engine already stores.
 *
 * The companion shares `android:sharedUserId="com.apple.android"` with the engine (same
 * UID, Morphe certificate), so it can read the engine's DataStore and open the AES key
 * in the AndroidKeyStore: see `analysis/search-feasibility.md`. The token is kept in
 * memory only — never written back to disk — and re-read from the engine file whenever
 * the API answers 401.
 */
class SearchClient(context: Context) {

    private val appContext = context.applicationContext
    @Volatile
    private var cachedToken: String? = null

    suspend fun search(query: String, limit: Int = 8): SearchOutcome = withContext(Dispatchers.IO) {
        val term = query.trim()
        if (term.isEmpty()) return@withContext SearchOutcome.Results(emptyList())

        var token = developerToken()
        if (token == null) {
            Log.w(TAG, "developer token unavailable")
            return@withContext SearchOutcome.TokenUnavailable
        }
        var response = request(term, limit, token)
        if (response is HttpResult.Unauthorized) {
            // The developer token is a JWT and expires; the engine refreshes it in the
            // file, so drop the cached copy and read it again before giving up.
            cachedToken = null
            token = developerToken()
            if (token == null) return@withContext SearchOutcome.TokenUnavailable
            response = request(term, limit, token)
        }
        when (response) {
            is HttpResult.Ok -> parse(response.body)
            is HttpResult.Unauthorized -> SearchOutcome.Failure(
                "Token do Apple Music expirado. Abra o app original e entre na conta.",
            )
            is HttpResult.Error -> SearchOutcome.Failure(response.message)
        }
    }

    // --- amp-api ---------------------------------------------------------------

    private fun request(term: String, limit: Int, token: String): HttpResult {
        val url = "$ENDPOINT/${storefront()}/search?term=${encode(term)}" +
            "&types=${SearchKind.entries.joinToString(",") { it.apiName }}&limit=$limit&l=${language()}"
        var connection: HttpURLConnection? = null
        return try {
            connection = (URL(url).openConnection() as HttpURLConnection).apply {
                connectTimeout = 15000
                readTimeout = 20000
                // Catalogue search needs only the developer token; the user token is
                // for library/personalisation (see analysis/search-feasibility.md).
                setRequestProperty("Authorization", "Bearer $token")
                setRequestProperty("Origin", "https://music.apple.com")
                setRequestProperty("User-Agent", USER_AGENT)
            }
            val code = connection.responseCode
            val body = (if (code >= 400) connection.errorStream else connection.inputStream)
                ?.let { text(it) }.orEmpty()
            Log.i(TAG, "search HTTP $code bytes=${body.length} term=\"$term\"")
            when {
                code == HttpURLConnection.HTTP_OK -> HttpResult.Ok(body)
                code == HttpURLConnection.HTTP_UNAUTHORIZED ||
                    code == HttpURLConnection.HTTP_FORBIDDEN -> HttpResult.Unauthorized
                else -> HttpResult.Error("Busca falhou (HTTP $code)")
            }
        } catch (t: Throwable) {
            Log.e(TAG, "search request failed", t)
            HttpResult.Error("Sem conexão com o Apple Music")
        } finally {
            connection?.disconnect()
        }
    }

    private fun parse(body: String): SearchOutcome = try {
        val results = JSONObject(body).getJSONObject("results")
        val found = ArrayList<SearchResult>()
        for (kind in SearchKind.entries) {
            val data = results.optJSONObject(kind.apiName)?.optJSONArray("data") ?: continue
            for (index in 0 until data.length()) {
                val item = data.optJSONObject(index) ?: continue
                val id = item.optString("id")
                if (id.isEmpty()) continue
                val attributes = item.optJSONObject("attributes") ?: JSONObject()
                val title = attributes.optString("name")
                if (title.isEmpty()) continue
                found += SearchResult(
                    id = id,
                    kind = kind,
                    title = title,
                    artist = attributes.optString(
                        when (kind) {
                            SearchKind.SONG -> "artistName"
                            SearchKind.ALBUM -> "artistName"
                            SearchKind.ARTIST -> "genreNames"
                            SearchKind.PLAYLIST -> "curatorName"
                        },
                    ).ifEmpty {
                        // Artists carry no artistName and genreNames is an array.
                        attributes.optJSONArray("genreNames")?.optString(0).orEmpty()
                    },
                    artworkUrl = artwork(attributes),
                )
            }
        }
        SearchOutcome.Results(found)
    } catch (t: Throwable) {
        Log.e(TAG, "cannot parse search response", t)
        SearchOutcome.Failure("Resposta inesperada do Apple Music")
    }

    private fun artwork(attributes: JSONObject): String? {
        val artwork = attributes.optJSONObject("artwork") ?: return null
        val url = artwork.optString("url")
        if (url.isEmpty()) return null
        // The API returns a template such as …/{w}x{h}bb.jpg.
        return url.replace("{w}", "300").replace("{h}", "300")
    }

    // --- engine token ----------------------------------------------------------

    /** Decrypted developer token, cached for the lifetime of the process. */
    private fun developerToken(): String? {
        cachedToken?.let { return it }
        val token = try {
            val pb = bytes(tokenFile())
            val cipher = prefValue(pb, DEVELOPER_TOKEN_KEY + "__cipher") ?: return null
            val iv = prefValue(pb, DEVELOPER_TOKEN_KEY + "__iv") ?: return null
            val keyStore = KeyStore.getInstance("AndroidKeyStore").apply { load(null) }
            val entry = keyStore.getEntry(KEYSTORE_ALIAS, null) as? KeyStore.SecretKeyEntry
                ?: return null
            val key: SecretKey = entry.secretKey
            val decipher = Cipher.getInstance("AES/GCM/NoPadding")
            decipher.init(
                Cipher.DECRYPT_MODE,
                key,
                GCMParameterSpec(128, Base64.decode(iv, Base64.DEFAULT)),
            )
            String(decipher.doFinal(Base64.decode(cipher, Base64.DEFAULT)), Charsets.UTF_8)
        } catch (t: Throwable) {
            Log.w(TAG, "cannot read the engine developer token: $t")
            null
        }
        if (token.isNullOrEmpty()) return null
        cachedToken = token
        return token
    }

    /**
     * The token file lives in the engine's data dir. The companion shares the engine's
     * UID, so the file is readable even though it belongs to the other package.
     */
    private fun tokenFile(): File {
        val info = appContext.packageManager.getApplicationInfo(MediaBrowserClient.PACKAGE, 0)
        return File(info.dataDir, TOKEN_PATH)
    }

    /**
     * The engine's DataStore protobuf is androidx.datastore Preferences:
     * `entry = { 1: key, 2: { 5: value } }`, so right after the key bytes come
     * `[0x12][varint len][0x2A][varint len][len bytes of value]`. Only the current
     * layout is supported; anything else fails and the UI falls back to the engine.
     */
    private fun prefValue(pb: ByteArray, key: String): String? {
        val needle = key.toByteArray(Charsets.UTF_8)
        val at = indexOf(pb, needle)
        if (at < 0) return null
        var position = at + needle.size
        if (position + 1 >= pb.size || pb[position].toInt() and 0xFF != 0x12) return null
        position = readVarint(pb, position + 1)?.second ?: return null
        if (position >= pb.size || pb[position].toInt() and 0xFF != 0x2A) return null
        val length = readVarint(pb, position + 1) ?: return null
        val start = length.second
        val size = length.first.toInt()
        if (start + size > pb.size) return null
        return String(pb, start, size, Charsets.UTF_8)
    }

    private fun indexOf(haystack: ByteArray, needle: ByteArray): Int {
        outer@ for (i in 0..haystack.size - needle.size) {
            for (j in needle.indices) if (haystack[i + j] != needle[j]) continue@outer
            return i
        }
        return -1
    }

    /** @return {value, nextOffset} */
    private fun readVarint(bytes: ByteArray, start: Int): Pair<Long, Int>? {
        var value = 0L
        var shift = 0
        var position = start
        while (position < bytes.size && shift < 64) {
            val byte = bytes[position++].toInt() and 0xFF
            value = value or ((byte and 0x7F).toLong() shl shift)
            if (byte and 0x80 == 0) return value to position
            shift += 7
        }
        return null
    }

    private fun bytes(file: File): ByteArray = FileInputStream(file).use { input ->
        val out = ByteArrayOutputStream()
        val buffer = ByteArray(8192)
        while (true) {
            val read = input.read(buffer)
            if (read <= 0) break
            out.write(buffer, 0, read)
        }
        out.toByteArray()
    }

    private fun text(input: InputStream): String = input.use {
        val out = ByteArrayOutputStream()
        val buffer = ByteArray(8192)
        while (true) {
            val read = it.read(buffer)
            if (read <= 0) break
            out.write(buffer, 0, read)
        }
        out.toString("UTF-8")
    }

    // --- device ----------------------------------------------------------------

    private fun storefront(): String {
        val country = Locale.getDefault().country
        return if (country.length == 2) country.lowercase(Locale.ROOT) else FALLBACK_STOREFRONT
    }

    private fun language(): String {
        val locale = Locale.getDefault()
        return if (locale.language.length == 2 && locale.country.length == 2) {
            "${locale.language.lowercase(Locale.ROOT)}-${locale.country.uppercase(Locale.ROOT)}"
        } else {
            FALLBACK_LANGUAGE
        }
    }

    private fun encode(value: String): String = try {
        URLEncoder.encode(value, "UTF-8")
    } catch (t: Throwable) {
        value
    }

    private sealed interface HttpResult {
        data class Ok(val body: String) : HttpResult
        data object Unauthorized : HttpResult
        data class Error(val message: String) : HttpResult
    }

    companion object {
        private const val TAG = "AppleMusicSearch"
        private const val ENDPOINT = "https://amp-api.music.apple.com/v1/catalog"
        private const val FALLBACK_STOREFRONT = "us"
        private const val FALLBACK_LANGUAGE = "en-US"
        private const val USER_AGENT =
            "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) " +
                "Chrome/120 Mobile Safari/537.36"

        private const val TOKEN_PATH = "files/datastore/encrypted_tokens.preferences_pb"
        private const val DEVELOPER_TOKEN_KEY = "key_api_token_musicAndroid"
        private const val KEYSTORE_ALIAS = "music_token_store_key"

        private const val ENGINE_ACTIVITY = "com.apple.android.music.common.MainActivity"
        private const val ENGINE_SEARCH_URL = "https://music.apple.com/search"

        /**
         * Opens the engine's own search screen. Fallback when the token cannot be read:
         * the field opens empty (see analysis/search-feasibility.md).
         */
        fun openEngineSearch(context: Context) {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(ENGINE_SEARCH_URL)).apply {
                setClassName(MediaBrowserClient.PACKAGE, ENGINE_ACTIVITY)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            startEngine(context, intent, "search screen")
        }

        /**
         * Asks the engine to search [query] and play the top hit
         * (`MainActivity.k1` → VoiceSearchHelper): the readable fallback when
         * `playFromMediaId` does not load a catalogue id.
         */
        fun playInEngine(context: Context, query: String) {
            val intent = Intent(MediaStore.INTENT_ACTION_MEDIA_SEARCH).apply {
                setClassName(MediaBrowserClient.PACKAGE, ENGINE_ACTIVITY)
                putExtra("query", query)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            }
            startEngine(context, intent, "MEDIA_SEARCH")
        }

        private fun startEngine(context: Context, intent: Intent, what: String) {
            if (!MediaBrowserClient.isAppleMusicInstalled(context)) {
                Log.w(TAG, "engine not installed, cannot open $what")
                return
            }
            try {
                context.startActivity(intent)
            } catch (t: Throwable) {
                Log.e(TAG, "cannot open $what", t)
            }
        }
    }
}
