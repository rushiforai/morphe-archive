package app.morphe.extension.addatimes.interceptors

import app.morphe.extension.addatimes.repositories.ContentRepository
import app.morphe.extension.shared.Logger
import app.morphe.extension.shared.Utils
import okhttp3.Interceptor
import okhttp3.Request
import okhttp3.Response
import org.json.JSONObject
import java.io.IOException
import java.net.HttpURLConnection

private fun intercept(
    request: Request,
    response: Response,
) = request.method == "GET" &&
    request.url.host == "app.addatimes.com" &&
    request.url.pathSegments == listOf("api", "play-video") &&
    (
        response.code != HttpURLConnection.HTTP_OK ||
            runCatching {
                !(JSONObject(response.peekBody(1024).string())["success"] as Boolean)
            }.getOrDefault(false)
    )

@Suppress("unused")
class PlayVideoInterceptor : Interceptor {
    @Throws(IOException::class)
    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        Logger.printDebug { "request: $request" }

        var response = chain.proceed(request)
        Logger.printDebug { "response: $response" }

        if (!intercept(request, response)) return response
        val playVideo = JSONObject(response.peekBody(1024).string())
        response.close()

        val id = request.url.queryParameter("id")!!
        Utils.showToastShort("id: $id")

        @Suppress("TooGenericExceptionCaught")
        try {
            ContentRepository(chain, id, playVideo).apply {
                Logger.printInfo { "movieDetails: $movieDetails" }
                Logger.printInfo { "relatedMovieDetails: $relatedMovieDetails" }
                response = getResponse(response)
            }
        } catch (e: Throwable) {
            Logger.printException({ "contentRepository failure" }, e)
        }
        return response
    }
}
