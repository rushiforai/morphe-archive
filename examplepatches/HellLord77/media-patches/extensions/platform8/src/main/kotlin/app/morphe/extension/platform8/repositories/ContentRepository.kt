package app.morphe.extension.platform8.repositories

import android.net.Uri
import com.android.volley.Network
import com.android.volley.NetworkResponse
import com.android.volley.toolbox.StringRequest
import org.json.JSONArray
import org.json.JSONObject
import java.net.HttpURLConnection

internal class ContentRepository(
    private val network: Network,
    private val code: String,
    private val catalogue: String?,
    private val authorization: String?,
) {
    internal val assetData: JSONObject by lazy {
        getVod(code)
    }

    internal val cloudFront: JSONObject by lazy {
        runCatching { assetData["cloud_front"] as JSONObject }
            .getOrNull()
            ?.let {
                if (it.length() != 0) return@lazy it
            }

        getVod(CODE)["cloud_front"] as JSONObject
    }

    internal val seasonData: JSONObject? by lazy {
        runCatching {
            val recentlyWatched = assetData["recently_watched"] as JSONObject
            val seasonsOrder =
                getSeasonsOrder(
                    recentlyWatched["season_id"] as String,
                    (recentlyWatched["no"] as String).toInt() + 1,
                )
            seasonsOrder[0] as JSONObject
        }.getOrNull()
    }

    private val showDetails: JSONObject? by lazy {
        runCatching {
            val recentlyWatched = assetData["recently_watched"] as JSONObject
            return@runCatching JSONObject()
                .put("episode_title", recentlyWatched["name"])
                .put("season_number", seasonData?.get("season_number"))
                .put("episode_number", recentlyWatched["no"])
        }.getOrNull()
    }

    private val nextEpisode: JSONObject? by lazy {
        seasonData
            ?.run {
                runCatching {
                    (getJSONArray("assets")[0] as JSONObject)
                }
            }?.getOrNull()
    }

    private fun getVod(code: String): JSONObject {
        val request =
            ContentRequest(
                Uri
                    .parse("https://apps.digivive.com/platform8_dynamic/assetdetail")
                    .buildUpon()
                    .appendQueryParameter("code", code)
                    .appendQueryParameter("catlogue", catalogue ?: CATALOGUE)
                    .appendQueryParameter("type", "vod")
                    .build(),
            )

        network.performRequest(request).run {
            require(statusCode == HttpURLConnection.HTTP_OK)
            JSONObject(data.decodeToString()).apply {
                require(getString("error_code").toInt() == HttpURLConnection.HTTP_OK)
                return getJSONObject("result")
            }
        }
    }

    private fun getSeasonsOrder(
        seasonId: String,
        page: Int? = null,
    ): JSONArray {
        val request =
            ContentRequest(
                Uri
                    .parse("https://apps.digivive.com/platform8_dynamic/assetdetail")
                    .buildUpon()
                    .appendQueryParameter("season_id", seasonId)
                    .appendQueryParameter("catlogue", catalogue ?: CATALOGUE)
                    .appendQueryParameter("type", "seasons_order")
                    .appendQueryParameter("page", page?.toString())
                    .appendQueryParameter("limit", "1")
                    .build(),
            )

        network.performRequest(request).run {
            require(statusCode == HttpURLConnection.HTTP_OK)
            JSONObject(data.decodeToString()).apply {
                require(getString("error_code").toInt() == HttpURLConnection.HTTP_OK)
                return getJSONArray("result")
            }
        }
    }

    internal fun getResponse(): NetworkResponse {
        cloudFront.put("cloud_url", (assetData["watchable_content"] as JSONArray)[0])
        showDetails?.also { assetData.put("show_details", it) }

        return NetworkResponse(
            JSONObject()
                .put("error_code", HttpURLConnection.HTTP_OK)
                .put("assetData", assetData)
                .put("cloud_front", cloudFront)
                .put("next_episode", nextEpisode)
                .toString()
                .toByteArray(),
        )
    }

    private inner class ContentRequest(
        uri: Uri,
    ) : StringRequest(uri.toString(), null, null) {
        override fun getHeaders(): Map<String, String> = mapOf("Authorization" to (authorization ?: AUTHORIZATION))
    }

    private companion object {
        private const val CODE = "VOD28519049368"
        private const val CATALOGUE = "60508372dabf5464540a2460"
        private const val AUTHORIZATION = "60194480f127015d9011475a"
    }
}
