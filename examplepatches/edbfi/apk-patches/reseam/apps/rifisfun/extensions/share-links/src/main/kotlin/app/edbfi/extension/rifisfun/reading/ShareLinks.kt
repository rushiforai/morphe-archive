// SPDX-License-Identifier: AGPL-3.0-or-later

@file:JvmName("ShareLinks")

package app.edbfi.extension.rifisfun.reading

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import app.edbfi.extension.shared.redditshare.RedditShareLinks
import app.reseam.runtime.Export
import java.util.UUID

private val main = Handler(Looper.getMainLooper())
private const val STOCK_FALLBACK = "app.edbfi.rif.RESHARE"
private val fallbackToken = UUID.randomUUID().toString()
private val inAppReplay = InAppShareReplay()

private fun redirect(activity: Activity, stock: Intent, destination: RedditShareLinks.Destination?): Intent =
    if (destination == null) {
        // MainActivity must see its original VIEW intent once without retrying the resolver.
        Intent(stock).putExtra(STOCK_FALLBACK, fallbackToken)
    } else {
        val activityName = if (destination.profileName == null) "MainActivity" else "user.ProfileActivity"
        Intent(stock).setData(Uri.parse(destination.url))
            .setClassName(activity, "${activity.packageName}.$activityName")
    }

private fun launch(activity: Activity, intent: Intent) {
    if (!activity.isFinishing && !activity.isDestroyed) {
        activity.startActivity(intent)
        activity.finish()
    } else {
        activity.applicationContext.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }
}

@Export
fun resolveIncoming(activity: Activity): Boolean {
    val incoming = activity.intent ?: return false
    if (incoming.getStringExtra(STOCK_FALLBACK) == fallbackToken) {
        incoming.removeExtra(STOCK_FALLBACK)
        return false
    }
    if (incoming.action != Intent.ACTION_VIEW && incoming.action != "android.nfc.action.NDEF_DISCOVERED") return false
    val url = RedditShareLinks.parse(incoming.dataString) ?: return false
    val stock = Intent(incoming).setClass(activity, activity.javaClass)
    RedditShareLinks.resolve(url) { destination ->
        main.post { launch(activity, redirect(activity, stock, destination)) }
    }
    return true
}

@Export
fun resolveUserPath(activity: Activity, stock: Intent): Boolean {
    val url = RedditShareLinks.parse(stock.dataString) ?: return false
    RedditShareLinks.resolve(url) { destination ->
        main.post { launch(activity, if (destination == null) stock else redirect(activity, stock, destination)) }
    }
    return true
}

@Export
fun markStockBrowserIntent(intent: Intent) {
    val url = RedditShareLinks.parse(intent.dataString) ?: return
    if (inAppReplay.markStockIntentOnce(url)) intent.putExtra(STOCK_FALLBACK, fallbackToken)
}

@Export
fun resolveInApp(
    raw: String?, display: String?, mediaType: Any?, thread: String?, title: String?,
    nsfw: Boolean, whitelist: Any?, fragments: Any?, context: Context?, source: Any?,
): Boolean {
    val url = RedditShareLinks.parse(raw) ?: return false
    if (inAppReplay.skipResolverOnce(url)) return false
    RedditShareLinks.resolve(url) { destination ->
        main.post {
            if (context is Activity && (context.isFinishing || context.isDestroyed)) return@post
            if (destination == null) {
                // Replay the stock router. Its fragmentless path launches a new VIEW intent.
                inAppReplay.withStockRouter(url) {
                    resumeInApp(raw, display, mediaType, thread, title, nsfw, whitelist, fragments, context, source)
                }
            } else {
                resumeInApp(destination.url, display, mediaType, thread, title, nsfw, whitelist, fragments, context, source)
            }
        }
    }
    return true
}

@Export
external fun resumeInApp(
    raw: String?, display: String?, mediaType: Any?, thread: String?, title: String?,
    nsfw: Boolean, whitelist: Any?, fragments: Any?, context: Context?, source: Any?,
)
