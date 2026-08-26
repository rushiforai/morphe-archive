/*
 * Copyright 2026 wchill, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.customclients

internal const val INSTALL_NEW_CLIENT_METHOD =
    $$"install(Lokhttp3/OkHttpClient$Builder;)Lokhttp3/OkHttpClient;"
internal const val CREATE_NEW_CLIENT_METHOD = "createClient()Lokhttp3/OkHttpClient;"
