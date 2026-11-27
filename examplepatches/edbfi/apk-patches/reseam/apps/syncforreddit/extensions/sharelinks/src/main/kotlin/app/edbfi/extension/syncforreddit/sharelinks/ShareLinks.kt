// SPDX-License-Identifier: AGPL-3.0-or-later
@file:JvmName("ShareLinks")

package app.edbfi.extension.syncforreddit.sharelinks

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Handler
import android.os.Looper
import android.widget.Toast
import app.edbfi.extension.shared.redditshare.RedditShareLinks
import app.reseam.runtime.Export
import java.lang.ref.WeakReference

@Export
external fun openResolved(context: Context, url: String)

@Export
fun resolve(context: Context?, link: String?): Boolean {
    if (context == null) return false
    val url = RedditShareLinks.parse(link) ?: return false
    val activity = WeakReference(context as? Activity)
    val application = context.applicationContext
    RedditShareLinks.resolve(url) { destination ->
        Handler(Looper.getMainLooper()).post {
            val original = activity.get()
            if (destination == null) {
                Toast.makeText(application, "Couldn't open this Reddit share link.", Toast.LENGTH_SHORT).show()
            } else if (original != null && !original.isFinishing && !original.isDestroyed) {
                openResolved(original, destination.syncUrl())
            } else {
                // The stock IntentActivity finishes after dispatch; its profile launcher needs an Activity.
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(destination.syncUrl()))
                    .setClassName(application, "${application.packageName}.ui.activities.IntentActivity")
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                application.startActivity(intent)
            }
        }
    }
    return true
}
