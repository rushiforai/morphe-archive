// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.editor

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

internal const val POST_ACTIVITY = "Lcom/onelouder/baconreader/PostActivity;"
internal const val COMPOSE_MESSAGE_ACTIVITY = "Lcom/onelouder/baconreader/ComposeMessageActivity;"
internal const val SUBMIT_ACTIVITY = "Lcom/onelouder/baconreader/SubmitActivity;"

/** The comment, reply and edit screen (PostCommentActivity, PostEditActivity): setContentView(layout). */
internal object PostActivityOnCreateFingerprint : Fingerprint(
    definingClass = POST_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    filters = listOf(
        methodCall(name = "setContentView"),
    ),
)

/** The message screen: setContentView(layout). */
internal object ComposeMessageOnCreateFingerprint : Fingerprint(
    definingClass = COMPOSE_MESSAGE_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    filters = listOf(
        methodCall(name = "setContentView"),
    ),
)

/** The text post page of the submit screen: returns its view. */
internal object SubmitTextPageOnCreateViewFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/SubmitTextPage;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
    filters = listOf(
        opcode(Opcode.RETURN_OBJECT),
    ),
)

/** The menus of the editors: menuInflater.inflate(menuId, menu). */
internal object PostActivityMenuFingerprint : Fingerprint(
    definingClass = POST_ACTIVITY,
    name = "onCreateOptionsMenu",
    filters = listOf(
        methodCall(name = "inflate"),
    ),
)

internal object ComposeMessageMenuFingerprint : Fingerprint(
    definingClass = COMPOSE_MESSAGE_ACTIVITY,
    name = "onCreateOptionsMenu",
    filters = listOf(
        methodCall(name = "inflate"),
    ),
)

internal object SubmitMenuFingerprint : Fingerprint(
    definingClass = SUBMIT_ACTIVITY,
    name = "onCreateOptionsMenu",
    filters = listOf(
        methodCall(name = "inflate"),
    ),
)
