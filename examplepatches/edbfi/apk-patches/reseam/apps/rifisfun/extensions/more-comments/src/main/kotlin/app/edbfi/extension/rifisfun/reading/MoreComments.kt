// SPDX-License-Identifier: AGPL-3.0-or-later

@file:JvmName("MoreComments")

package app.edbfi.extension.rifisfun.reading

import android.net.Uri
import androidx.core.util.c
import app.reseam.runtime.Export

@Export
fun withQuery(endpoint: Uri, form: List<*>): Uri {
    val request = endpoint.buildUpon()
    for (entry in form) {
        val pair = entry as c
        request.appendQueryParameter(pair.a as String, pair.b as? String ?: "")
    }
    return request.build()
}
