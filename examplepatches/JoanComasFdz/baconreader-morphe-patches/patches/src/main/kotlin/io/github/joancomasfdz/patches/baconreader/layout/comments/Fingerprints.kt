// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.comments

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/** Requests the comments of a post: getComments(context, linkId, commentId, context, sort, limit, listener). */
internal object GetCommentsFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditApi;",
    name = "getComments",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "I",
        "Ljava/lang/String;",
        "I",
        "Lcom/onelouder/baconreader/connectivity/Tasks\$OnCompleteListener;",
    ),
)

/** Gives the comment list its items, from ThreadManager's data. */
internal object ProcessDataFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/CommentsAdapter;",
    name = "processData",
    returnType = "V",
    filters = listOf(opcode(Opcode.RETURN_VOID)),
)
