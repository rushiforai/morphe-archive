package app.morphe.extension.hoichoi.repositories

import android.net.Uri
import app.morphe.extension.shared.Logger
import app.morphe.extension.shared.Utils
import app.morphe.extension.shared.extension.org.json.objects
import okhttp3.Interceptor
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.Request
import okhttp3.RequestBody
import okhttp3.Response
import okhttp3.ResponseBody.Companion.toResponseBody
import org.json.JSONArray
import org.json.JSONObject
import java.net.HttpURLConnection
import java.util.Random

internal class ContentRepository(
    private val chain: Interceptor.Chain,
    private val contentId: String,
    private val action: String?,
    private val language: String?,
    private val token: String?,
) {
    private val anonymousToken: String by lazy {
        val request =
            Request
                .Builder()
                .url("https://prod-api.hoichoi.dev/core/api/v1/users/anonymous-token")
                .build()

        chain.proceed(request).use { response ->
            require(response.isSuccessful)
            response.body.string().also { Utils.showToastShort("anonymousToken: $it") }
        }
    }

    private val freeContentIds: Set<String> by lazy {
        cachedFreeContentIds
            ?: filterFreeContentIds(getPageData(FREE_PAGE_ID)).also { cachedFreeContentIds = it }
    }

    internal val videoDetails: JSONObject by lazy {
        val uri =
            Uri
                .parse("https://prod-contents-api.hoichoi.dev/contents/api/v1/contents")
                .buildUpon()
                .appendQueryParameter("contentId", contentId)
                .appendQueryParameter("language", language)
                .build()
        val request = Request.Builder().url(uri.toString()).build()

        chain.proceed(request).use { response ->
            require(response.isSuccessful)
            JSONObject(response.body.string())
        }
    }

    internal val freeEntitlementInfo: JSONObject by lazy {
        val uri =
            Uri
                .parse("https://prod-api.hoichoi.dev/contents/api/v1/entitlement")
                .buildUpon()
                .appendQueryParameter("contentId", freeContentId)
                .appendQueryParameter("action", action)
                .appendQueryParameter("language", language)
                .build()
        val request =
            Request
                .Builder()
                .url(uri.toString())
                .header("Anonymous-Token", token ?: anonymousToken)
                .post(RequestBody.EMPTY)
                .build()

        chain.proceed(request).use { response ->
            require(response.isSuccessful)
            JSONObject(response.body.string())
        }
    }

    private val freeContentId: String
        get() {
            val random = RANDOM.nextInt(freeContentIds.size)
            for ((index, freeContentId) in freeContentIds.withIndex()) {
                if (index == random) {
                    Logger.printInfo { "freeContentId: $freeContentId" }
                    return freeContentId
                }
            }
            throw NotImplementedError()
        }

    private fun getPageData(
        @Suppress("SameParameterValue") pageId: String,
    ): JSONObject {
        val uri =
            Uri
                .parse("https://prod-contents-api.hoichoi.dev/contents/api/v1/pages")
                .buildUpon()
                .appendPath(pageId)
                .build()
        val request = Request.Builder().url(uri.toString()).build()

        chain.proceed(request).use { response ->
            require(response.isSuccessful)
            return JSONObject(response.body.string())
        }
    }

    internal fun getResponse(response: Response): Response {
        freeEntitlementInfo.put("videoDetails", videoDetails)

        val body =
            freeEntitlementInfo
                .toString()
                .toByteArray()
                .toResponseBody("application/json".toMediaType())
        return response
            .newBuilder()
            .code(HttpURLConnection.HTTP_OK)
            .header("Content-Length", body.contentLength().toString())
            .body(body)
            .build()
    }

    private companion object {
        private const val FREE_PAGE_ID = "f976deb6-79df-4c30-ae4a-6cd0648aaee9"

        private val RANDOM = Random()

        private var cachedFreeContentIds: Set<String>? = null

        private fun isFreeContent(content: JSONObject) =
            try {
                content["monetizationModel"] == "FREE" &&
                    (
                        (content["monetizationPlan"] as JSONObject)["includedMonetizationPlans"]
                            as JSONArray
                    ).objects()
                        .any { !(it["loginRequired"] as Boolean) }
            } catch (_: Throwable) {
                false
            }

        @Suppress("NestedBlockDepth")
        private fun filterFreeContentIds(pageData: JSONObject) =
            mutableSetOf<String>().apply {
                (pageData["modules"] as JSONArray)
                    .objects()
                    .flatMap { (it["contents"] as JSONArray).objects() }
                    .forEach { content ->
                        when (content["contentType"]) {
                            "movie" -> {
                                if (isFreeContent(content)) {
                                    add(content["contentId"] as String)
                                }
                            }

                            "series" -> {
                                addAll(
                                    (content["seasons"] as JSONArray)
                                        .objects()
                                        .flatMap {
                                            (it["episodes"] as JSONArray).objects()
                                        }.filter(::isFreeContent)
                                        .map { it["contentId"] as String },
                                )
                            }
                        }
                    }
            }
    }
}
