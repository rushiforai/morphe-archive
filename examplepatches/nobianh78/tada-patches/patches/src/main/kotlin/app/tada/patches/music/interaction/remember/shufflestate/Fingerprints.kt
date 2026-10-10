/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches/pull/1881
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.interaction.remember.shufflestate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object ShuffleOnClickFingerprint : Fingerprint(
    name = "onClick",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    filters = listOf(
        literal(45468L)
    )
)

internal object ShuffleEnumFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("SHUFFLE_OFF"),
        string("SHUFFLE_ALL"),
        string("SHUFFLE_DISABLED")
    )
)
