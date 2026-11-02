package app.morphe.extension.bongo.repositories

import app.morphe.extension.shared.Utils
import app.morphe.extension.shared.extension.java.util.matches
import com.goebl.david.Webb
import com.google.gson.Gson
import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject
import retrofit2.Response

internal class ContentRepository(
    private val systemId: String,
    private val authorization: String?,
    private val acceptLanguage: String,
) {
    internal val contentTrailer: JSONObject by lazy {
        WEBB["https://api.bongo-solutions.com/ironman/api/v1/content/content-trailer/$systemId"]
            .header(Webb.HDR_AUTHORIZATION, authorization ?: accessToken)
            .header("Accept-Language", acceptLanguage)
            .header("Country-Code", "QkQ=")
            .ensureSuccess()
            .asJsonObject()
            .body
    }

    internal val content: JSONObject by lazy {
        val contentId = (contentTrailer["content"] as JSONObject)["id"]
        WEBB["https://api.bongo-solutions.com/ironman/api/v1/contents/$contentId"]
            .ensureSuccess()
            .asJsonObject()
            .body
    }

    internal fun <T> getResponse(classOfT: Class<T>): Response<T> {
        val translatedContent = translateJSON(content, acceptLanguage) as JSONObject
        val contentTrailerContent = contentTrailer["content"] as JSONObject
        translatedContent.put("cast_and_crew", contentTrailerContent["castAndCrew"])
        translatedContent.put("genre", contentTrailerContent["genre"])

        listOf("shorts", "teaser", "vod").forEach { key ->
            try {
                val urls =
                    ((translatedContent[key] as JSONObject)["active_encode"] as JSONObject)["urls"] as JSONObject
                urls.keys().forEach { urlKey ->
                    val url = urls[urlKey] as JSONObject
                    url.put(
                        "url",
                        "https://vod.bongobd.com/vod/vod${url["url"]}",
                    )
                }
            } catch (_: JSONException) {
            }
        }

        val contentDetails = inflectJSON(translatedContent) as JSONObject
        try {
            val protectionScheme =
                ((contentDetails["vod"] as JSONObject)["activeEncode"] as JSONObject)["protectionScheme"] as JSONObject
            protectionScheme.put("drm_id", protectionScheme["drmId"])
        } catch (_: JSONException) {
        }

        val body = GSON.fromJson(contentDetails.toString(), classOfT)
        return Response.success(body)
    }

    private companion object {
        private val LANGS = setOf("en", "bn", "hi")
        private val GSON = Gson()
        private val WEBB = Webb.create()

        private val accessToken: String by lazy {
            val request =
                WEBB
                    .post("https://accounts.bongobd.com/realms/bongo/protocol/openid-connect/token")
                    .param("grant_type", "client_credentials")
                    .param("client_id", "anonymous")
                    .param("client_secret", "G1TBNg5HQ2gfd2Qucqss6KQgE1kkxJhc")
                    .ensureSuccess()

            request.asJsonObject().run {
                (body["access_token"] as String).also { Utils.showToastShort("accessToken: $it") }
            }
        }

        @Throws(JSONException::class)
        private fun translateJSON(
            node: Any,
            lang: String,
        ): Any =
            when (node) {
                is JSONObject if node.keys().matches(LANGS) -> {
                    node[lang]
                }

                is JSONObject -> {
                    JSONObject().apply {
                        node.keys().forEach { key ->
                            put(key, translateJSON(node[key], lang))
                        }
                    }
                }

                is JSONArray -> {
                    JSONArray().apply {
                        for (idx in 0 until node.length()) {
                            put(translateJSON(node[idx], lang))
                        }
                    }
                }

                else -> {
                    node
                }
            }

        @Throws(JSONException::class)
        fun inflectJSON(node: Any): Any =
            when (node) {
                is JSONObject -> {
                    JSONObject().apply {
                        node.keys().forEach { key ->
                            put(snakeToCamel(key), inflectJSON(node[key]))
                        }
                    }
                }

                is JSONArray -> {
                    JSONArray().apply {
                        for (idx in 0 until node.length()) {
                            put(inflectJSON(node[idx]))
                        }
                    }
                }

                else -> {
                    node
                }
            }

        private fun snakeToCamel(string: String) =
            string
                .split("_")
                .mapIndexed { index, word ->
                    if (index == 0) word.lowercase() else word.replaceFirstChar { it.uppercase() }
                }.joinToString("")
    }
}
