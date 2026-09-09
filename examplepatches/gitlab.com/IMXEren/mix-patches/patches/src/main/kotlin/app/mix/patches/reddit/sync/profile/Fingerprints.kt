/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.profile

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal val postsResponseParserFingerprint = Fingerprint(
    returnType = "Lcom/android/volley/Response;",
    parameters = listOf("Lcom/android/volley/NetworkResponse;"),
    strings = listOf("Raw post count: ", "New count:  "),
)

internal val postsHeadersFingerprint = Fingerprint(
    returnType = "Ljava/util/Map;",
    strings = listOf("https://ssl.reddit.com/submit.json?"),
)

internal val oauthBasicHeaderFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("Basic "),
)

internal val userAgentFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("android:com.laurencedawson.reddit_sync:vv23.06.30-13:39 (by /u/ljdawson)"),
)

internal val applicationContextFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/RedditApplication;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/Context;",
    parameters = emptyList(),
)

internal val volleyErrorDeliveryFingerprint = Fingerprint(
    definingClass = "Lcom/android/volley/Request;",
    name = "deliverError",
    returnType = "V",
    parameters = listOf("Lcom/android/volley/VolleyError;"),
)

internal val postDescriptionFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/posts/PostDescriptionTextView;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "I", "Z", "Z", "Z"),
)

internal val commentDescriptionFingerprint = Fingerprint(
    definingClass = "Lcom/laurencedawson/reddit_sync/ui/views/text/spannable/children/comments/CommentDescriptionTextView;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L", "Z"),
)
