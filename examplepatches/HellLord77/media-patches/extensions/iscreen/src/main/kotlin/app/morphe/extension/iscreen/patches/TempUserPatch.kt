@file:JvmName("TempUserPatch")

package app.morphe.extension.iscreen.patches

import app.morphe.extension.shared.Logger
import app.morphe.extension.shared.Utils
import okhttp3.MediaType.Companion.toMediaType
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.RequestBody.Companion.toRequestBody
import org.json.JSONObject

private val authToken by lazy {
    val body =
        JSONObject()
            .put("platform", "iscreen")
            .toString()
            .toRequestBody("application/json".toMediaType())

    val request =
        Request
            .Builder()
            .url("https://api.rockstreamer.com/auth/token/temp")
            .post(body)
            .build()

    OkHttpClient().newCall(request).execute().use { response ->
        require(response.isSuccessful)
        JSONObject(response.body.string())
    }
}

private fun getRefreshToken(
    getRefreshToken: () -> String,
    setRefreshToken: (String) -> Unit,
): String {
    var refreshToken = getRefreshToken()
    if (refreshToken.isEmpty()) {
        @Suppress("TooGenericExceptionCaught")
        try {
            refreshToken = authToken["refreshToken"] as String
            Utils.showToastShort("refreshToken: $refreshToken")

            setRefreshToken(refreshToken)
        } catch (e: Throwable) {
            Logger.printException({ "authToken failure" }, e)
        }
    }
    return refreshToken
}

@Suppress("unused")
fun getRefreshToken(self: com.rockstreamer.iscreen.util.PreferenceUtil): String =
    getRefreshToken(self::getRefreshToken, self::setRefreshToken)

@Suppress("unused")
fun getRefreshToken(self: com.rockstreamer.iscreentv.utils.PreferenceUtil): String =
    getRefreshToken(self::getRefreshToken, self::setRefreshToken)
