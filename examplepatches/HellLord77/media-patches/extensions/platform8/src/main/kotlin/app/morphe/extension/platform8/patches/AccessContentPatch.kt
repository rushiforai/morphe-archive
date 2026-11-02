@file:JvmName("AccessContentPatch")

package app.morphe.extension.platform8.patches

import android.net.Uri
import app.morphe.extension.platform8.repositories.ContentRepository
import app.morphe.extension.shared.Logger
import app.morphe.extension.shared.Utils
import com.android.volley.Network
import com.android.volley.NetworkResponse
import com.android.volley.Request
import com.android.volley.VolleyError
import org.json.JSONObject
import java.net.HttpURLConnection

private fun performRequest(
    request: Request<*>,
    response: NetworkResponse,
): Boolean {
    val uri = Uri.parse(request.url)
    return request.method == Request.Method.GET &&
        uri.host == "apps.digivive.com" &&
        uri.pathSegments == listOf("platform8_dynamic", "geturlv4") &&
        (
            response.statusCode != HttpURLConnection.HTTP_OK ||
                runCatching {
                    (JSONObject(response.data.decodeToString())["error_code"] as String).toInt() !=
                        HttpURLConnection.HTTP_OK
                }.getOrDefault(false)
        )
}

@Suppress("unused")
@Throws(VolleyError::class)
fun performRequest(
    self: Network,
    request: Request<*>,
): NetworkResponse {
    Logger.printDebug { "request: $request" }
    var response = self.performRequest(request)
    Logger.printDebug { "response: $response" }

    if (!performRequest(request, response)) return response
    val uri = Uri.parse(request.url)

    val chargeCode = uri.getQueryParameter("charge_code")!!
    Utils.showToastShort("chargeCode: $chargeCode")

    val catalogue = uri.getQueryParameter("catlogue")
    Logger.printDebug { "catalogue: $catalogue" }

    val authorization = request.headers["authorization"]
    Logger.printDebug { "authorization: $authorization" }

    @Suppress("TooGenericExceptionCaught")
    try {
        ContentRepository(self, chargeCode, catalogue, authorization).apply {
            Logger.printInfo { "assetData: $assetData" }
            Logger.printInfo { "cloudFront: $cloudFront" }
            Logger.printInfo { "seasonData: $seasonData" }
            response = getResponse()
        }
    } catch (e: Throwable) {
        Logger.printException({ "contentRepository failure" }, e)
    }
    return response
}
