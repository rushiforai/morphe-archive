// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.votes

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object VoteFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditApi;",
    name = "vote",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "I", "Ljava/lang/String;"),
)

/** Saves the post that comes with the comments to the post list, with LinksetManager.update. */
internal object CommentsLoadedFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/data/ThreadManager\$CommentsListener;",
    name = "processInBackground",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/onelouder/baconreader/data/LinksetManager;",
            name = "update",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)
