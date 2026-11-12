package app.morphe.extension.pixiv.search

import android.content.Context
import app.morphe.extension.pixiv.aiflag.AiDetectionHelper

/**
 * How the Popular search tab is filled in on a free account.
 *
 * Pixiv ranks search results on the server and answers a non-premium request for
 * `sort=popular_desc` with the plain date order, so the client supplies something else: in
 * [MODE_PREVIEW] the request is swapped for the free preview endpoint Pixiv does serve, which
 * returns about thirty popularity-ranked illusts or novels.
 */
object SearchRankingConfig {

    const val MODE_OFF = 0
    const val MODE_PREVIEW = 1

    private const val PREFS_NAME = "pixiv_search_ranking_prefs"
    private const val KEY_MODE = "mode"

    @Volatile
    var current: Int = MODE_PREVIEW
        private set

    @Volatile
    private var loaded = false

    fun ensureLoaded() {
        if (loaded) return
        val context = AiDetectionHelper.getContext() ?: return
        synchronized(this) {
            if (loaded) return
            // Values outside the known modes are leftovers of an older build; fall back to on.
            current = prefs(context).getInt(KEY_MODE, MODE_PREVIEW).coerceIn(MODE_OFF, MODE_PREVIEW)
            loaded = true
        }
    }

    fun setMode(context: Context?, mode: Int) {
        current = mode
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching { prefs(target).edit().putInt(KEY_MODE, mode).apply() }
    }

    fun next(mode: Int): Int = if (mode == MODE_PREVIEW) MODE_OFF else MODE_PREVIEW

    private fun prefs(context: Context) =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
}
