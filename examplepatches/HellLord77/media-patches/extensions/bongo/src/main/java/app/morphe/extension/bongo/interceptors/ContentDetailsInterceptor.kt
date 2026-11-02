package app.morphe.extension.bongo.interceptors

import app.morphe.extension.shared.Logger
import okhttp3.Interceptor
import okhttp3.Request
import okhttp3.Response
import okhttp3.internal.closeQuietly
import java.io.IOException
import java.net.HttpURLConnection

private fun intercept(
    request: Request,
    response: Response,
) = request.method == "GET" &&
    request.url.host == "api.bongo-solutions.com" &&
    request.url.pathSegments.dropLast(1) ==
    listOf(
        "ironman",
        "api",
        "v1",
        "content",
        "detail",
    ) &&
    response.code != HttpURLConnection.HTTP_OK

@Deprecated("")
class ContentDetailsInterceptor : Interceptor {
    @Throws(IOException::class)
    override fun intercept(chain: Interceptor.Chain): Response {
        val request = chain.request()
        Logger.printDebug { "request: $request" }

        val response = chain.proceed(request)
        Logger.printDebug { "response: $response" }

        if (!intercept(request, response)) return response
        response.closeQuietly()
        Logger.printInfo { "intercepted content details request: $request" }

        val systemId = request.url.pathSegments.last()
        Logger.printDebug { "systemId: $systemId" }

        val authorization = request.header("Authorization")
        Logger.printDebug { "authorization: $authorization" }

        val acceptLanguage = request.header("Accept-Language")
        Logger.printDebug { "acceptLanguage: $acceptLanguage" }

        @Suppress("TooGenericExceptionCaught")
        try {
            throw NotImplementedError()
        } catch (e: Throwable) {
            Logger.printException({ "contentRepository failure" }, e)
        }
        return response
    }
}
