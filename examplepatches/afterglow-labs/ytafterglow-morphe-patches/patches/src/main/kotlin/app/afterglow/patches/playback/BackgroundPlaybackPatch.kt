/*
 * YTAfterglow for Android.
 *
 * Adapted from the "Remove background playback restrictions" patch of Morphe patches
 * v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3), which was forked from
 * ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: rewritten for patcher 2.1.0, only the YouTube 21.43.523 paths, gated by
 * the iOS setting backgroundPlayback. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.debugMatch
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.OpcodesFilter
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val BACKGROUND_PLAYBACK_CLASS = "$EXTENSION_PLAYBACK/BackgroundPlayback;"

/**
 * Decides if a regular video may keep playing in the background.
 *
 * 21.43.523: `Larow;->n(Lbgzu;)Z` (the opcode pattern matches only it).
 */
internal object BackgroundPlaybackManagerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L"),
    filters = OpcodesFilter.opcodesToFilters(
        Opcode.CONST_4,
        Opcode.IF_EQZ,
        Opcode.IGET,
        Opcode.AND_INT_LIT16,
        Opcode.IF_EQZ,
        Opcode.IGET_OBJECT,
        Opcode.IF_NEZ,
        Opcode.SGET_OBJECT,
        Opcode.IGET,
        Opcode.CONST,
        Opcode.IF_NE,
        Opcode.IGET_OBJECT,
        Opcode.IF_NEZ,
        Opcode.SGET_OBJECT,
        Opcode.IGET,
        Opcode.IF_NE,
        Opcode.IGET_OBJECT,
        Opcode.CHECK_CAST,
        Opcode.GOTO,
        Opcode.SGET_OBJECT,
        Opcode.GOTO,
        Opcode.CONST_4,
        Opcode.IF_EQZ,
        Opcode.IGET_BOOLEAN,
        Opcode.IF_EQZ,
    ),
)

/** Decides if a Short may keep playing in the background (flag 151635310). 21.43.523: `Larow;->s(Lbgzu;)Z`. */
internal object BackgroundPlaybackManagerShortsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        literal(151635310),
        opcode(Opcode.IGET_BOOLEAN, location = MatchAfterWithin(8)),
    ),
)

/**
 * Builds the "Background & downloads" settings; the first call is "background playback
 * allowed", which decides if the Background play setting is offered (21.23+).
 *
 * 21.43.523: `Lpgc;->a(Ljava/lang/Object;)Ljava/lang/Object;` calls `Lnja;->L()Z` (whether the
 * account's entitlements include background playback), then reads string 0x7f140b07.
 */
internal object BackgroundPlaybackSettingsFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Z", parameters = listOf()),
        methodCall(smali = "Ljava/lang/Boolean;->booleanValue()Z", location = MatchAfterWithin(2)),
        resourceLiteral(ResourceType.STRING, "pref_background_and_offline_category", location = MatchAfterWithin(10)),
        resourceLiteral(ResourceType.STRING, "pref_background_category"),
    ),
)

/** Stops background playback of videos made for kids. 21.43.523: `Lrku;->g(ILjkj;Lbjhy;)V`. */
internal object KidsBackgroundPlaybackPolicyControllerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "L", "L"),
    filters = listOf(literal(5)) + OpcodesFilter.opcodesToFilters(
        Opcode.CONST_4,
        Opcode.IF_NE,
        Opcode.SGET_OBJECT,
        Opcode.IF_NE,
        Opcode.IGET,
        Opcode.CONST_4,
        Opcode.IF_NE,
        Opcode.IGET_OBJECT,
    ),
)

/** Shorts background playback flag; 21.43.523 reads it only in `Latot;->cq()Z`. */
private const val SHORTS_BACKGROUND_PLAYBACK_FLAG = 45415425L

/** Resumes playback when the app returns to the foreground (21.30+ reads it inline). */
private const val AUTOMATIC_FOREGROUND_PLAYBACK_RESUME_FLAG = 45770945L

/**
 * Saves and restores if the video was playing when the app went to the background.
 * 21.43.523: `Lnyl;` (4 reads of flag 45770945) and `Lnyx;` (1 read).
 */
internal object PlayingWhenBackgroundedFingerprint : Fingerprint(
    filters = listOf(string("was_playing_when_backgrounded")),
)

/**
 * Background playback for the iOS setting `backgroundPlayback` (tweak "background-playback").
 *
 * - The regular video and Shorts background checks pass their result through the extension,
 *   which allows background playback while the setting is on.
 * - The Background play option is offered in YouTube's settings, and the kids video policy
 *   that stops background playback does nothing, while the setting is on.
 * - The Shorts background playback flag is forced on while the setting is on.
 * - A video paused from the notification no longer resumes by itself when the app returns to
 *   the foreground (flag 45770945 off), which background playback would otherwise cause.
 */
internal val backgroundPlaybackHookPatch = bytecodePatch(
    description = "Lets videos keep playing in the background when Afterglow allows it.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, videoStatePatch)

    execute {
        val manager = BackgroundPlaybackManagerFingerprint.method
        val shortsManager = BackgroundPlaybackManagerShortsFingerprint.method
        val settingsAllowed = BackgroundPlaybackSettingsFingerprint.instructionMatches.first().getMethodCalled()
        val kidsPolicy = KidsBackgroundPlaybackPolicyControllerFingerprint.method
        val shortsFlagMethods = Fingerprint(filters = listOf(literal(SHORTS_BACKGROUND_PLAYBACK_FLAG)))
            .matchAll().map { it.method }
        if (shortsFlagMethods.isEmpty()) throw PatchException("No method reads flag $SHORTS_BACKGROUND_PLAYBACK_FLAG")
        val foregroundResumeClasses = PlayingWhenBackgroundedFingerprint.matchAll().map { it.classDef.type }.toSet()

        debugMatch("backgroundManager", manager)
        debugMatch("backgroundManagerShorts", shortsManager)
        debugMatch("backgroundSettingsAllowed", settingsAllowed)
        debugMatch("kidsPolicy", kidsPolicy)
        shortsFlagMethods.forEach { method -> debugMatch("shortsBackgroundFlag", method) }

        manager.overrideReturnedBoolean("$BACKGROUND_PLAYBACK_CLASS->isBackgroundPlaybackAllowed(Z)Z")
        shortsManager.overrideReturnedBoolean("$BACKGROUND_PLAYBACK_CLASS->isBackgroundShortsPlaybackAllowed(Z)Z")
        settingsAllowed.returnEarlyWhen("$BACKGROUND_PLAYBACK_CLASS->isEnabled()Z", returnValue = 1)
        kidsPolicy.returnEarlyWhen("$BACKGROUND_PLAYBACK_CLASS->isEnabled()Z")

        shortsFlagMethods.forEach { method ->
            method.literalIndices(SHORTS_BACKGROUND_PLAYBACK_FLAG).asReversed().forEach { index ->
                method.overrideFlagAfterLiteral(index, "$BACKGROUND_PLAYBACK_CLASS->enableFeatureFlag(Z)Z")
            }
        }

        var foregroundResumeReads = 0
        foregroundResumeClasses.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                method.literalIndices(AUTOMATIC_FOREGROUND_PLAYBACK_RESUME_FLAG).asReversed().forEach { index ->
                    method.overrideFlagAfterLiteral(index, "$BACKGROUND_PLAYBACK_CLASS->isAutomaticForegroundPlaybackAllowed(Z)Z")
                    foregroundResumeReads++
                    debugMatch("foregroundResumeFlag", method)
                }
            }
        }
        if (foregroundResumeReads == 0) throw PatchException("No read of flag $AUTOMATIC_FOREGROUND_PLAYBACK_RESUME_FLAG")
    }
}
