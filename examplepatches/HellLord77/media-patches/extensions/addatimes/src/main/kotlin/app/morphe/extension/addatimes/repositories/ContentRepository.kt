package app.morphe.extension.addatimes.repositories

import app.morphe.extension.shared.extension.org.json.objects
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.Request
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONArray
import org.json.JSONObject
import java.net.HttpURLConnection

internal class ContentRepository(
    private val chain: Interceptor.Chain,
    private val id: String,
    private val playVideo: JSONObject,
) {
    internal val movieDetails: JSONObject by lazy {
        getMovieDetails(id).apply {
            require(getString("category_slug") == "movies")
        }
    }

    internal val relatedMovieDetails: JSONObject by lazy {
        val related = movieDetails["related"] as JSONArray
        for (relatedMovie in related.objects()) {
            val relatedMovieDetails = getMovieDetails(relatedMovie["id"].toString())
            val related2 = relatedMovieDetails["related"] as JSONArray
            for (relatedMovie2 in related2.objects()) {
                if (id == relatedMovie2["id"].toString()) {
                    return@lazy relatedMovie2
                }
            }
        }
        throw NotImplementedError()
    }

    private fun getMovieDetails(movieId: String): JSONObject {
        val request = Request.Builder().url("https://app.addatimes.com/api/movie/$movieId").build()

        chain.proceed(request).use { response ->
            require(response.isSuccessful)
            JSONObject(response.body.string()).run {
                require(getBoolean("success"))
                return getJSONObject("data")
            }
        }
    }

    internal fun getResponse(response: Response): Response {
        movieDetails.put("video_url", relatedMovieDetails["download_video_file"])
        playVideo.put("success", true)
        playVideo.put("subscription_error", false)
        playVideo.put("data", movieDetails)

        val body = playVideo.toString().toResponseBody("application/json".toMediaType())
        return response
            .newBuilder()
            .code(HttpURLConnection.HTTP_OK)
            .header("Content-Length", body.contentLength().toString())
            .body(body)
            .build()
    }
}
