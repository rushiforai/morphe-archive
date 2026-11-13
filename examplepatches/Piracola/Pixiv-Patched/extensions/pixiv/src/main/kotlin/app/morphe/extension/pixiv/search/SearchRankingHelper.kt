package app.morphe.extension.pixiv.search

import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONObject

/**
 * Fills the Popular search tab on accounts Pixiv will not rank for.
 *
 * Pixiv ignores `sort=popular_desc` for a non-premium account and answers with the date order, so
 * the tab is indistinguishable from "Newest". This interceptor takes over that one request and asks
 * Pixiv's free preview endpoint instead, which is a real popularity ranking of about thirty works.
 *
 * Everything else - image loading, every other API call - passes straight through untouched.
 */
object SearchRankingHelper {

    private const val POPULAR_SORT = "popular_desc"


    private class Target(val searchPath: String, val previewPath: String, val itemsKey: String)

    private val TARGETS = listOf(
        Target("/v1/search/illust", "/v1/search/popular-preview/illust", "illusts"),
        Target("/v1/search/novel", "/v1/search/popular-preview/novel", "novels")
    )

    /** The preview endpoints accept only these query parameters. */
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
     * Installed from the patched `OkHttpClient.<init>(Builder)`, so every client the app builds
     * carries it. It is installed regardless of the current mode and decides per request, so
     * switching the mode in the Pixiv-Patched page takes effect without restarting the app.
     */
    @JvmStatic
    fun install(builder: OkHttpClient.Builder) {
        try {
            // Added first so the bookmark floor wraps this interceptor: it decides from the search
            // URL, and the page this interceptor builds from the preview endpoint is filtered too.
            BookmarkThreshold.install(builder)

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
            val url = request.url
            SearchRankingConfig.ensureLoaded()
            if (SearchRankingConfig.current != SearchRankingConfig.MODE_PREVIEW) {
                return chain.proceed(request)
            }

            val target = TARGETS.firstOrNull { it.searchPath == url.encodedPath }
                ?: return chain.proceed(request)

            val sort = url.queryParameter("sort")
            if (sort != POPULAR_SORT) {
                return chain.proceed(request)
            }

            val previewUrl = url.newBuilder()
                .encodedPath(target.previewPath)
                .query(null)
                .apply {
                    PREVIEW_PARAMS.forEach { name ->
                        url.queryParameter(name)?.let { value -> addQueryParameter(name, value) }
                    }
                }
                .build()

            val response = chain.proceed(request.newBuilder().url(previewUrl).build())
            return response.serveAsSearchPage(target.itemsKey)
        }

        /**
         * Turns a preview payload (`{items, search_span_limit}`) into the search payload the caller
         * expects (`{items, next_url}`). The body is always rebuilt because reading it consumes the
         * stream; a read failure is left to propagate the way any other broken response would.
         */
        private fun Response.serveAsSearchPage(itemsKey: String): Response {
            val contentType = body?.contentType()
            val text = body?.string() ?: return this

            val rewritten = try {
                val root = JSONObject(text)
                val container = root.optJSONObject("body") ?: root
                val items = container.optJSONArray(itemsKey) ?: return withBody(text, contentType)
                container.put(itemsKey, items)
                container.put("next_url", JSONObject.NULL)
                root.toString()
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
