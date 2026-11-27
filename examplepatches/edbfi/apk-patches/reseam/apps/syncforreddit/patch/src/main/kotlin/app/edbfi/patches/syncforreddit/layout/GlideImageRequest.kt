// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.layout

import app.reseam.patch.Type
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.points

private const val REQUEST_BUILDER = "okhttp3.Request\$Builder"

private val streamFetcher = klass("Glide OkHttp stream fetcher") {
    sourceFile("OkHttpStreamFetcher.java")
}

internal val glideImageRequestUrl = method("Build Glide image request") {
    inClass(streamFetcher)
    returns(Type.Void)
    calls {
        owner(REQUEST_BUILDER)
        name("url")
        params(Type.String)
    }
}.points("Glide request URL") {
    invokeVirtual {
        owner(REQUEST_BUILDER)
        name("url")
        params(Type.String)
    }
}.single().captureArgumentAs("url", 1)
