/*
 * Copyright 2026 De-Vanced
 * [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
 */

package app.morphe.patches.facebook.feed.refresh

import app.morphe.patcher.Fingerprint

object ReturnRefreshCallbackFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        "FeedRefreshTriggerController",
        "onRefresh",
    ),
    custom = { method, _ ->
        !method.definingClass.startsWith("Lapp/morphe/extension/") &&
            method.parameterTypes.size == 1
    },
)
