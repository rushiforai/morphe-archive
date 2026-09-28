/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.cache

import app.morphe.patcher.Fingerprint

internal val oauthHasGoldResponseFingerprint = Fingerprint(
    returnType = "Lcom/android/volley/Response;",
    parameters = listOf("Lcom/android/volley/NetworkResponse;"),
    strings = listOf("is_gold"),
    custom = { _, classDef -> classDef.sourceFile == "OAuthHasGoldRequest.java" },
)
