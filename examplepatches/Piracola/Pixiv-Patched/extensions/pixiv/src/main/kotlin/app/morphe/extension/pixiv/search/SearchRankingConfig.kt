package app.morphe.extension.pixiv.search

import android.content.Context
import app.morphe.extension.pixiv.aiflag.AiDetectionHelper

/**
 * How the Popular search tab is filled in on a free account.
 *
 * Pixiv ranks search results on the server and answers a non-premium request for
 * `sort=popular_desc` with the plain date order, so the client has to supply something else:
 *
 * - [MODE_PREVIEW] swaps the popular search for the free preview endpoint Pixiv does serve
 *   (`/v1/search/popular-preview/illust`): about thirty genuinely popularity-ranked works, one page.
 * - [MODE_RERANK] keeps the normal request and re-sorts the page it returned by `total_bookmarks`,
 *   which is the closest a client can get to a popularity order over the full result set.
 */
object SearchRankingConfig {

    const val MODE_OFF = 0
    const val MODE_PREVIEW = 1
    const val MODE_RERANK = 2

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
            current = prefs(context).getInt(KEY_MODE, MODE_PREVIEW)
            loaded = true
        }
    }

    fun setMode(context: Context?, mode: Int) {
        current = mode
        loaded = true
        val target = context ?: AiDetectionHelper.getContext() ?: return
        runCatching { prefs(target).edit().putInt(KEY_MODE, mode).apply() }
    }

    fun next(mode: Int): Int = when (mode) {
        MODE_PREVIEW -> MODE_RERANK
        MODE_RERANK -> MODE_OFF
        else -> MODE_PREVIEW
    }

    private fun prefs(context: Context) =
        context.applicationContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
}
