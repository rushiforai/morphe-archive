/*
 * EXTERNAL REFERENCE ONLY
 *
 * Source:
 * https://github.com/alienware377/purpletv-revive/blob/main/xposed/app/src/main/java/tv/purple/xp/ChannelPoints.kt
 *
 * Project: PurpleTV ReVive
 * License: Apache License 2.0
 *
 * This file is kept in Kizu only as an archival, readable reference for the working
 * GraphQL-layer auto-claim architecture. It is NOT compiled by Kizu and is NOT the Kizu
 * implementation.
 */

package tv.purple.xp

import android.content.Context
import org.json.JSONObject

object ChannelPoints {

    private const val H_CONTEXT = "1530a003a7d374b0380b79db0be0534f30ff46e61cffa2bc0e2468a909fbc024"
    private const val H_CLAIM = "46aaeebe02c99afdf4fc97c7c0cba964124bf6b0af229395f1f6d1feed05b3d0"

    private const val POLL_MS = 30_000L

    @Volatile private var channelId: String? = null
    @Volatile private var channelLogin: String? = null
    @Volatile private var started = false
    @Volatile private var lastClaimId: String? = null
    @Volatile private var probedOk = false

    fun onChannel(id: String?, login: String?) {
        if (!id.isNullOrBlank()) channelId = id
        if (!login.isNullOrBlank()) channelLogin = login
    }

    fun install(ctx: Context) {
        if (started) return
        started = true
        Thread({
            while (true) {
                runCatching {
                    if (Settings.get(Settings.KEY_AUTO_POINTS)) tick(ctx)
                }.onFailure { log("CP tick error: $it") }
                runCatching { Thread.sleep(POLL_MS) }
            }
        }, "ptv-channel-points").apply { isDaemon = true }.start()
        log("CP auto-claim miner started")
    }

    private fun tick(ctx: Context) {
        val login = channelLogin ?: return
        val id = channelId ?: return
        val token = EmoteRepo.authToken(ctx)
        if (token.isBlank()) return
        val claimId = fetchAvailableClaim(token, login) ?: return
        if (claimId == lastClaimId) return
        if (claim(token, id, claimId)) {
            lastClaimId = claimId
            log("CP claimed")
        }
    }

    private fun fetchAvailableClaim(token: String, login: String): String? {
        val body = JSONObject()
            .put("operationName", "ChannelPointsContext")
            .put("variables", JSONObject().put("channelLogin", login))
            .put("extensions", JSONObject().put(
                "persistedQuery",
                JSONObject().put("version", 1).put("sha256Hash", H_CONTEXT)
            ))
            .toString()

        val resp = EmoteRepo.gqlPost(token, body) ?: return null
        val json = runCatching { JSONObject(resp) }.getOrNull() ?: return null

        json.optJSONArray("errors")?.let {
            if (it.length() > 0) return null
        }

        val cp = json.optJSONObject("data")
            ?.optJSONObject("community")
            ?.optJSONObject("channel")
            ?.optJSONObject("self")
            ?.optJSONObject("communityPoints")

        if (cp == null) return null

        val claim = cp.optJSONObject("availableClaim") ?: return null
        return claim.optString("id").ifBlank { null }
    }

    private fun claim(token: String, channelId: String, claimId: String): Boolean {
        val input = JSONObject()
            .put("channelID", channelId)
            .put("claimID", claimId)

        val body = JSONObject()
            .put("operationName", "ClaimCommunityPoints")
            .put("variables", JSONObject().put("input", input))
            .put("extensions", JSONObject().put(
                "persistedQuery",
                JSONObject().put("version", 1).put("sha256Hash", H_CLAIM)
            ))
            .toString()

        val resp = EmoteRepo.gqlPost(token, body) ?: return false
        val json = runCatching { JSONObject(resp) }.getOrNull() ?: return false

        json.optJSONArray("errors")?.let {
            if (it.length() > 0) return false
        }

        val node = json.optJSONObject("data")
            ?.optJSONObject("claimCommunityPoints")

        val err = node?.optJSONObject("error")
        return err == null
    }
}
