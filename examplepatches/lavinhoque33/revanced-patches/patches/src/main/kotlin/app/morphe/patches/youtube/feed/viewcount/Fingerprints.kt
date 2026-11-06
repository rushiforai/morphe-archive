/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3862
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.feed.viewcount

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Creates the text of a Litho text component, such as the text below the title of a feed video.
 * This is the same method the Hide view count option of Morphe hooks.
 */
internal object FeedSubtitleFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/CharSequence;",
    filters = listOf(
        string("Font fetching future task failed."), // Unique string in only one method.
        string("Has attachmentRuns but drawableRequester is missing."),
        methodCall(smali = "Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F"),
        methodCall( // Sets the span of the returned string.
            opcode = Opcode.INVOKE_STATIC,
            parameters = listOf("Landroid/text/SpannableString;", "Ljava/lang/Object;", "I", "Z", "I"),
            returnType = "V",
            location = MatchAfterWithin(10)
        )
    )
)
