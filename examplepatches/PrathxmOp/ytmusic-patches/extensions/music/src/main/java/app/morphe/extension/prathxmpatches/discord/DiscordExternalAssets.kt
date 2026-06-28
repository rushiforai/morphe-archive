package app.morphe.extension.prathxmpatches.discord

import timber.log.Timber
import java.util.concurrent.ConcurrentHashMap
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import okhttp3.MediaType.Companion.toMediaType
import java.util.concurrent.TimeUnit
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import org.json.JSONArray
import org.json.JSONObject

object DiscordExternalAssets {

    private const val TAG = "DiscordSvc"
    private const val EXTERNAL_ASSETS_API =
        "https://discord.com/api/v9/applications/%s/external-assets"

    private val cache = ConcurrentHashMap<String, String>()
    private const val CACHE_MAX_SIZE = 128

    private val client: OkHttpClient by lazy {
        OkHttpClient.Builder()
            .connectTimeout(5, TimeUnit.SECONDS)
            .readTimeout(10, TimeUnit.SECONDS)
            .writeTimeout(10, TimeUnit.SECONDS)
            .build()
    }

    suspend fun resolve(
        imageUrl: String,
        appId: String,
        token: String,
    ): String? = withContext(Dispatchers.IO) {
        if (imageUrl.isBlank()) return@withContext null
        if (imageUrl.startsWith("mp:")) return@withContext imageUrl

        cache[imageUrl]?.let {
            android.util.Log.e("DiscordSvc", "resolve: cache hit for ${imageUrl.take(60)} -> $it")
            return@withContext it
        }
        android.util.Log.e("DiscordSvc", "resolve: cache miss for $imageUrl, calling API")

        return@withContext try {
            val mediaType = "application/json; charset=utf-8".toMediaType()
            
            // Construct request JSON using org.json.JSONObject
            val requestJson = JSONObject().apply {
                put("urls", JSONArray(listOf(imageUrl)))
            }
            val requestBody = requestJson.toString().toRequestBody(mediaType)

            val request = Request.Builder()
                .url(EXTERNAL_ASSETS_API.format(appId))
                .header("Authorization", token)
                .header("User-Agent", DiscordSuperProperties.USER_AGENT)
                .header("X-Super-Properties", DiscordSuperProperties.base64)
                .post(requestBody)
                .build()

            val response = client.newCall(request).execute()
            response.use { resp ->
                val statusCode = resp.code
                val body = resp.body?.string().orEmpty()

                android.util.Log.e("DiscordSvc", "external-assets: HTTP $statusCode for $imageUrl, body=$body")

                if (resp.isSuccessful && body.isNotBlank()) {
                    val array = JSONArray(body)
                    val firstObj = if (array.length() > 0) array.getJSONObject(0) else null
                    val assetPath = firstObj?.optString("external_asset_path")
                    if (assetPath != null) {
                        val result = "mp:$assetPath"
                        cache[imageUrl] = result
                        trimCache()
                        android.util.Log.e("DiscordSvc", "external-assets: resolved $imageUrl -> $result")
                        result
                    } else {
                        android.util.Log.w("DiscordSvc", "external-assets: no path in response for $imageUrl: $body")
                        null
                    }
                } else {
                    android.util.Log.w("DiscordSvc", "external-assets: HTTP $statusCode for $imageUrl: $body")
                    null
                }
            }
        } catch (e: Exception) {
            android.util.Log.e("DiscordSvc", "external-assets: failed for $imageUrl", e)
            null
        }
    }

    private fun trimCache() {
        if (cache.size > CACHE_MAX_SIZE) {
            val toRemove = cache.size - CACHE_MAX_SIZE
            cache.keys.take(toRemove).forEach { cache.remove(it) }
        }
    }

    fun clearCache() {
        Timber.tag(TAG).d("clearCache: clearing %d entries", cache.size)
        cache.clear()
    }

    fun close() {
        // OkHttpClient does not need explicit close
    }
}
