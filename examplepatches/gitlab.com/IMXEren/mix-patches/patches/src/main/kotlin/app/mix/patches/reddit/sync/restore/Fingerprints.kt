/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.restore

import app.morphe.patcher.Fingerprint

internal val commentsResponseFingerprint = Fingerprint(
    returnType = "Lcom/android/volley/Response;",
    parameters = listOf("Lcom/android/volley/NetworkResponse;"),
    custom = { _, classDef -> classDef.sourceFile == "OAuthCommentsRequest.java" },
)
