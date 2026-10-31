// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.random

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Fills the feed list of the post list (Front Page, All, Popular, Random, My Random, Friends, subreddits):
 * list.add(new FeedItem("Random", ...)) and the same for "My Random" (RedditId.RANDOM and RedditId.MYRANDOM).
 */
internal object FeedAdapterResetFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/FeedAdapter;",
    name = "reset",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        *addFeed("Random"),
        *addFeed("My Random"),
    ),
)

private fun addFeed(feed: String) = arrayOf(
    string(feed),
    methodCall(
        name = "add",
        opcodes = listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_INTERFACE),
        location = InstructionLocation.MatchAfterWithin(2),
    ),
)
