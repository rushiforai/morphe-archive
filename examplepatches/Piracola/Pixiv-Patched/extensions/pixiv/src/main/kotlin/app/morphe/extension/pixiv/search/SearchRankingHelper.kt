package app.morphe.extension.pixiv.search

import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONArray
import org.json.JSONObject

/**
 * Fills the Popular search tab on accounts Pixiv will not rank for.
 *
 * Pixiv ignores `sort=popular_desc` for a non-premium account and answers with the date order, so
 * the tab is indistinguishable from "Newest". This interceptor takes over that one request and
 * either serves the free preview endpoint (Pixiv's own popularity ranking, one page of about thirty
 * works) or re-sorts the returned page by `total_bookmarks`.
 *
 * Everything else - image loading, every other API call - passes straight through untouched.
 */
object SearchRankingHelper {

    private const val SEARCH_PATH = "/v1/search/illust"
    private const val PREVIEW_PATH = "/v1/search/popular-preview/illust"
    private const val POPULAR_SORT = "popular_desc"

    /** The preview endpoint accepts only these query parameters. */
    private val PREVIEW_PARAMS = listOf(
        "word",
        "search_target",
        "search_ai_type",
        "start_date",
        "end_date",
        "filter",
        "include_translated_tag_results",
        "merge_plain_keyword_results"
    )

    /**
     * Called from the patched `OkHttpClient.Builder.build()`. The builder is shared by the whole app,
     * so the interceptor is installed once and every instance carries it.
     *
     * The interceptor is installed regardless of the current mode: it decides per request, so
     * switching the mode in the Pixiv-Patched page takes effect without restarting the app.
     */
    @JvmStatic
    fun install(builder: OkHttpClient.Builder) {
        try {
            // `interceptors` is internal in okhttp's Kotlin API but published as a plain method.
            val alreadyInstalled = runCatching {
                val method = OkHttpClient.Builder::class.java.getMethod("interceptors")
                (method.invoke(builder) as? List<*>)?.any { it is SearchRankingInterceptor } == true
            }.getOrDefault(false)
            if (alreadyInstalled) return
            builder.addInterceptor(SearchRankingInterceptor())
        } catch (_: Throwable) {
        }
    }

    private class SearchRankingInterceptor : Interceptor {

        override fun intercept(chain: Interceptor.Chain): Response {
            val request = chain.request()
            SearchRankingConfig.ensureLoaded()
            return when (SearchRankingConfig.current) {
                SearchRankingConfig.MODE_PREVIEW -> preview(chain, request)
                SearchRankingConfig.MODE_RERANK -> rerank(chain, request)
                else -> chain.proceed(request)
            }
        }

        /** Serves Pixiv's free popularity ranking instead of the date-ordered search page. */
        private fun preview(chain: Interceptor.Chain, request: Request): Response {
            val url = request.url
            if (url.encodedPath != SEARCH_PATH || url.queryParameter("sort") != POPULAR_SORT) {
                return chain.proceed(request)
            }

            val previewUrl = url.newBuilder()
                .encodedPath(PREVIEW_PATH)
                .query(null)
                .apply {
                    PREVIEW_PARAMS.forEach { name ->
                        url.queryParameter(name)?.let { value -> addQueryParameter(name, value) }
                    }
                }
                .build()

            val response = chain.proceed(request.newBuilder().url(previewUrl).build())
            return response.rewrite { root, container, illusts ->
                container.put("illusts", illusts)
                container.put("next_url", JSONObject.NULL)
                root
            }
        }

        /** Keeps the real search page but orders it by bookmark count. */
        private fun rerank(chain: Interceptor.Chain, request: Request): Response {
            val url = request.url
            if (url.encodedPath != SEARCH_PATH || url.queryParameter("sort") != POPULAR_SORT) {
                return chain.proceed(request)
            }

            val response = chain.proceed(request)
            return response.rewrite { root, container, illusts ->
                val scored = ArrayList<Pair<Int, JSONObject>>(illusts.length())
                var ranked = false
                for (index in 0 until illusts.length()) {
                    val item = illusts.optJSONObject(index) ?: return@rewrite root
                    val score = item.optInt("total_bookmarks", 0)
                    if (score > 0) ranked = true
                    scored.add(score to item)
                }

                // Pixiv only attaches bookmark counts to some payloads; leaving the order alone is
                // better than reshuffling a page where every score is zero.
                if (!ranked) return@rewrite root

                scored.sortByDescending { it.first }
                val sorted = JSONArray()
                scored.forEach { (_, item) -> sorted.put(item) }
                container.put("illusts", sorted)
                root
            }
        }

        /**
         * Reads the JSON body, lets [transform] swap the `illusts` array, and rebuilds the response.
         * The body is always rebuilt because reading it consumes the stream; a read failure is left
         * to propagate so the call fails the way any other broken response would.
         */
        private fun Response.rewrite(
            transform: (root: JSONObject, container: JSONObject, illusts: JSONArray) -> JSONObject
        ): Response {
            val contentType = body?.contentType()
            val text = body?.string() ?: return this

            val rewritten = try {
                val root = JSONObject(text)
                val container = root.optJSONObject("body") ?: root
                val illusts = container.optJSONArray("illusts") ?: return withBody(text, contentType)
                transform(root, container, illusts).toString()
            } catch (_: Throwable) {
                text
            }

            return withBody(rewritten, contentType)
        }

        private fun Response.withBody(text: String, contentType: okhttp3.MediaType?): Response =
            newBuilder()
                .removeHeader("Content-Length")
                .removeHeader("Content-Encoding")
                .body(text.toResponseBody(contentType))
                .build()
    }
}
