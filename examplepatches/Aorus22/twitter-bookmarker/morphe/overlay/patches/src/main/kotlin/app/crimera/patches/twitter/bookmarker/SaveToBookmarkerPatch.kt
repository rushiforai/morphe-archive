/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md. The structure
 * mirrors Piko's own InlineDownloadButtonPatch, which is the proven way to put a
 * button on the tweet inline action bar.
 */

package app.crimera.patches.twitter.bookmarker

import app.crimera.patches.twitter.entity.entityGenerator
import app.crimera.patches.twitter.misc.extension.sharedExtensionPatch
import app.crimera.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.crimera.patches.twitter.utils.Constants.PATCHES_DESCRIPTOR
import app.crimera.utils.changeFirstString
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val INLINE_ACTION_BAR_DESCRIPTOR = "Lcom/twitter/ui/tweet/inlineactions/InlineActionBar;"
private const val EXTENSION_CLASS = "$PATCHES_DESCRIPTOR/bookmarker/SaveButton;"

/**
 * Finds the placeholder field name inside our own extension class, so it can be
 * rewritten to the app's real (obfuscated) one. The literal below is the seam:
 * it exists in SaveButton.java only to be replaced here.
 */
private fun placeholderFingerprint(value: String) =
    object : Fingerprint(
        definingClass = EXTENSION_CLASS,
        strings = listOf(value),
    ) {}

private val tweetFieldPlaceholderFingerprint = placeholderFingerprint("mTweet")

/** The view group that holds reply/repost/like/bookmark/share for one tweet. */
private object OnFinishInflateFingerprint : Fingerprint(
    definingClass = INLINE_ACTION_BAR_DESCRIPTOR,
    name = "onFinishInflate",
    returnType = "V",
)

/**
 * The method that stores the tweet on the action bar. Its identity comes from the
 * heart animation asset it also references, which is what makes it findable
 * without knowing any obfuscated name.
 */
private object SetTweetFingerprint : Fingerprint(
    definingClass = INLINE_ACTION_BAR_DESCRIPTOR,
    returnType = "V",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this",
        ),
        string("file:///android_asset/default_heart_v3.json"),
    ),
)

/**
 * Adds the Twitter Bookmarker save button next to the native bookmark action.
 *
 * The button reads the tweet the action bar already holds, offers the backend's
 * collections in a native sheet, and posts the tweet to the chosen one. The app's
 * own bookmark action is untouched: this never reads or writes the account's real
 * bookmarks.
 */
@Suppress("unused")
val saveToBookmarkerPatch =
    bytecodePatch(
        name = "Save to Twitter Bookmarker",
        description =
            "Adds a save button to the tweet inline action bar that sends the tweet to a " +
                "Twitter Bookmarker backend. The native bookmark action keeps working as before.",
    ) {
        compatibleWith(COMPATIBILITY_X)

        // The entity patches rewrite the placeholders in entity/Tweet.java, which is
        // how SaveButton turns the raw tweet object into a URL, a handle and a date.
        // The shared extension is what loads our Java code and provides Utils/Logger,
        // so it is named here rather than inherited from whichever patches happen to
        // be selected alongside this one.
        dependsOn(saveToBookmarkerResourcePatch, entityGenerator, sharedExtensionPatch)

        execute {
            // Hand every inflated action bar to the extension class, right before
            // onFinishInflate returns.
            OnFinishInflateFingerprint.method.apply {
                val index = indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID)

                addInstruction(
                    index,
                    "invoke-static { p0 }, $EXTENSION_CLASS->onFinishInflate(Landroid/view/ViewGroup;)V",
                )
            }

            // Replace the placeholder with the field the app actually writes the
            // tweet into. Reading that field is the whole point of the hook.
            val tweetFieldName =
                SetTweetFingerprint.instructionMatches.first().instruction
                    .getReference<FieldReference>()!!
                    .name
            tweetFieldPlaceholderFingerprint.changeFirstString(tweetFieldName)
        }
    }
