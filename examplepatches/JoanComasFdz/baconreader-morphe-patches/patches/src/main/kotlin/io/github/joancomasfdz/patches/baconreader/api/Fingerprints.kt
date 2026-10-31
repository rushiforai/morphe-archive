// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val ORIGINAL_CLIENT_ID = "zACVn0dSFGdWqQ"
internal const val ORIGINAL_CLIENT_SECRET = "kDm2tYpu9DqyWFFyPlNcXGEni4k"
internal const val ORIGINAL_REDIRECT_URI = "http://baconreader.com/auth"

// Builds the authorization URL with the client ID and redirect URI.
internal object GetAuthorizationUrlFingerprint : Fingerprint(
    filters = listOf(
        string("client_id=$ORIGINAL_CLIENT_ID"),
    ),
)

// Sends the client ID and secret as Basic auth to get and refresh tokens.
internal object RequestTokenFingerprint : Fingerprint(
    filters = listOf(
        string(ORIGINAL_CLIENT_ID),
        string(ORIGINAL_CLIENT_SECRET, StringComparisonType.CONTAINS),
    ),
)

// Tells the login web view when Reddit redirects back to the app.
internal object IsRedirectUrlFingerprint : Fingerprint(
    name = "isRedirectUrl",
    filters = listOf(
        string(ORIGINAL_REDIRECT_URI, StringComparisonType.CONTAINS),
    ),
)

// Reddit only trades the authorization code for a token when the redirect URI matches.
internal object CodeExchangeFingerprint : Fingerprint(
    name = "runTask",
    filters = listOf(
        string(ORIGINAL_REDIRECT_URI, StringComparisonType.CONTAINS),
    ),
)

internal object RestClientUserAgentFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/connectivity/RestClient;",
    name = "getUserAgent",
    returnType = "Ljava/lang/String;",
)

internal object RetrofitUserAgentFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditRetrofitClientModule;",
    name = "getUserAgent",
    returnType = "Ljava/lang/String;",
)
