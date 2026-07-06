package app.morphe.extension.prathxmpatches.discord

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.util.Base64
import androidx.browser.customtabs.CustomTabsIntent
import androidx.core.net.toUri
import app.morphe.extension.prathxmpatches.discord.DiscordDefaults.DISCORD_OAUTH_AUTHORIZE
import app.morphe.extension.prathxmpatches.discord.DiscordDefaults.DISCORD_OAUTH_TOKEN
import app.morphe.extension.prathxmpatches.discord.DiscordDefaults.DISCORD_SCOPES
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.TimeoutCancellationException
import kotlinx.coroutines.withContext
import kotlinx.coroutines.Dispatchers
import okhttp3.OkHttpClient
import okhttp3.FormBody
import okhttp3.Request
import org.json.JSONObject
import timber.log.Timber
import java.io.IOException
import java.net.URLEncoder
import java.nio.charset.StandardCharsets
import java.security.MessageDigest
import java.security.SecureRandom
import java.util.concurrent.TimeUnit

data class DiscordAuthResult(
    val accessToken: String,
    val refreshToken: String,
    val expiresInSec: Long,
    val scope: String,
)

data class PkcePair(val verifier: String, val challenge: String)

sealed class DiscordAuthException(message: String, cause: Throwable? = null) : Exception(message, cause) {
    class UserCancelled(message: String = "User cancelled authorization") : DiscordAuthException(message)
    class NetworkFailure(cause: Throwable) : DiscordAuthException("Network failure: ${cause.message}", cause)
    class InvalidGrant(message: String = "Invalid or expired grant") : DiscordAuthException(message)
    class StateMismatch : DiscordAuthException("OAuth state mismatch")
    class NoBrowser(message: String = "No browser available") : DiscordAuthException(message)
}

class DiscordAuth(
    private val httpClient: OkHttpClient = defaultClient(),
) {

    suspend fun authorize(activity: Activity): DiscordAuthResult {
        val pkce = generatePkcePair()
        val state = generateState()
        DiscordOAuthActivity.newDeferred()

        try {
            val authUrl = buildAuthorizeUrl(
                clientId = DiscordDefaults.APP_ID.toLong(),
                redirectUri = REDIRECT_URI,
                state = state,
                challenge = pkce.challenge,
            )

            Timber.tag(TAG).i("authorize: launching URL (clientId prefix=%s)", DiscordDefaults.APP_ID.take(8))

            val intent = CustomTabsIntent.Builder().build().intent
            intent.data = authUrl.toUri()
            intent.addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)

            try {
                activity.startActivity(intent)
            } catch (e: ActivityNotFoundException) {
                Timber.tag(TAG).w(e, "authorize: no browser available to launch URL")
                throw DiscordAuthException.NoBrowser()
            }

            val callback = try {
                DiscordOAuthActivity.awaitCode(timeoutMs = 120_000L)
            } catch (e: TimeoutCancellationException) {
                throw DiscordAuthException.UserCancelled()
            } catch (e: CancellationException) {
                Timber.tag(TAG).i("authorize: cancelled")
                throw DiscordAuthException.UserCancelled()
            }

            if (callback.state != state) {
                Timber.tag(TAG).w(
                    "authorize: state mismatch (expected=%s, got=%s)",
                    state.take(8),
                    callback.state.take(8),
                )
                throw DiscordAuthException.StateMismatch()
            }

            return exchangeAuthorizationCode(
                code = callback.code,
                verifier = pkce.verifier,
                redirectUri = REDIRECT_URI,
            )
        } finally {
            // no cleanup needed — no local server
        }
    }

    fun cancel() {
        DiscordOAuthActivity.cancelPending()
    }

    fun close() {
        // OkHttpClient doesn't need explicit close, but we can let it be
    }

    suspend fun refresh(refreshToken: String): DiscordAuthResult = refreshAccessToken(refreshToken)

    private suspend fun exchangeAuthorizationCode(
        code: String,
        verifier: String,
        redirectUri: String,
    ): DiscordAuthResult = performTokenExchange(
        grantType = "authorization_code",
        extraParams = mapOf(
            "code" to code,
            "redirect_uri" to redirectUri,
            "code_verifier" to verifier
        ),
    )

    private suspend fun refreshAccessToken(refreshToken: String): DiscordAuthResult =
        performTokenExchange(
            grantType = "refresh_token",
            extraParams = mapOf(
                "refresh_token" to refreshToken
            ),
        )

    private suspend fun performTokenExchange(
        grantType: String,
        extraParams: Map<String, String>,
    ): DiscordAuthResult = withContext(Dispatchers.IO) {
        val formBodyBuilder = FormBody.Builder()
            .add("client_id", DiscordDefaults.APP_ID)
            .add("grant_type", grantType)

        extraParams.forEach { (key, value) ->
            formBodyBuilder.add(key, value)
        }

        val request = Request.Builder()
            .url(DISCORD_OAUTH_TOKEN)
            .post(formBodyBuilder.build())
            .build()

        val response = try {
            httpClient.newCall(request).execute()
        } catch (e: Exception) {
            Timber.tag(TAG).w(e, "token exchange: network failure")
            throw DiscordAuthException.NetworkFailure(e)
        }

        response.use { resp ->
            val code = resp.code
            val body = resp.body?.string().orEmpty()

            if (resp.isSuccessful) {
                val json = JSONObject(body)
                val accessToken = json.getString("access_token")
                val refreshToken = json.optString("refresh_token", "")
                val expiresIn = json.optLong("expires_in", 0L)
                val scope = json.optString("scope", DISCORD_SCOPES)
                Timber.tag(TAG).i(
                    "token exchange: success (accessToken length=%d, refreshToken present=%s, expiresIn=%d)",
                    accessToken.length,
                    refreshToken.isNotEmpty(),
                    expiresIn,
                )
                return@withContext DiscordAuthResult(
                    accessToken = accessToken,
                    refreshToken = refreshToken,
                    expiresInSec = expiresIn,
                    scope = scope,
                )
            }

            val errorCode = runCatching { JSONObject(body).optString("error", "") }
                .getOrDefault("")
            if (code == 400 && errorCode == "invalid_grant") {
                Timber.tag(TAG).w("token exchange: invalid_grant on %s", grantType)
                throw DiscordAuthException.InvalidGrant()
            }
            Timber.tag(TAG).w(
                "token exchange: HTTP %d (grantType=%s, error=%s, body=%s)",
                code,
                grantType,
                errorCode,
                body.take(200),
            )
            throw DiscordAuthException.NetworkFailure(IOException("HTTP $code: $body"))
        }
    }

    private fun buildAuthorizeUrl(
        clientId: Long,
        redirectUri: String,
        state: String,
        challenge: String,
    ): String {
        val encodedRedirect = URLEncoder.encode(redirectUri, StandardCharsets.UTF_8.name())
        val encodedScope = URLEncoder.encode(DISCORD_SCOPES, StandardCharsets.UTF_8.name())
        return buildString {
            append(DISCORD_OAUTH_AUTHORIZE)
            append("?client_id=").append(clientId)
            append("&response_type=code")
            append("&redirect_uri=").append(encodedRedirect)
            append("&scope=").append(encodedScope)
            append("&state=").append(state)
            append("&code_challenge_method=S256")
            append("&code_challenge=").append(challenge)
        }
    }

    companion object {
        private const val TAG = "DiscordSvc"
        const val REDIRECT_URI = "morphediscord://oauth2/callback"

        private fun defaultClient(): OkHttpClient = OkHttpClient.Builder()
            .connectTimeout(10, TimeUnit.SECONDS)
            .readTimeout(15, TimeUnit.SECONDS)
            .writeTimeout(15, TimeUnit.SECONDS)
            .build()

        fun generatePkcePair(): PkcePair {
            val bytes = ByteArray(64)
            SecureRandom().nextBytes(bytes)
            val verifier = Base64.encodeToString(
                bytes,
                Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP,
            )
            val challenge = Base64.encodeToString(
                MessageDigest.getInstance("SHA-256").digest(verifier.toByteArray(StandardCharsets.UTF_8)),
                Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP,
            )
            return PkcePair(verifier = verifier, challenge = challenge)
        }

        private fun generateState(): String {
            val bytes = ByteArray(16)
            SecureRandom().nextBytes(bytes)
            return Base64.encodeToString(
                bytes,
                Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP,
            )
        }
    }
}
