// SPDX-License-Identifier: AGPL-3.0-or-later
@file:JvmName("CommentRequest")

package app.edbfi.extension.syncforreddit.comments

import android.net.Uri
import app.reseam.runtime.Export

@Export
fun withQuery(url: String, params: Map<String, String>?): String {
    // The superclass logs getUrl() before the subclass has set its parameters.
    if (params.isNullOrEmpty()) return url
    val builder = Uri.parse(url).buildUpon()
    for ((key, value) in params) {
        builder.appendQueryParameter(key, value)
    }
    return builder.build().toString()
}
