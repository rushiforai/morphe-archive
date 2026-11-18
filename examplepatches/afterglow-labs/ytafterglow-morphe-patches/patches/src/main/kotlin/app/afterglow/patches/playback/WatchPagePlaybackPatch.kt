/*
 * YTAfterglow for Android.
 *
 * Adapted from the "Disable continue watching prompt", "Hide end screen cards", "Hide
 * related video overlay" and "Hide end screen suggested video" patches of Morphe patches
 * v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3), which were forked from
 * ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: rewritten for patcher 2.1.0, only the YouTube 21.43.523 paths, gated by
 * the iOS settings. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.debugMatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val WATCH_PAGE_PLAYBACK_CLASS = "$EXTENSION_PLAYBACK/WatchPagePlayback;"

// region "Are you still watching?"

/**
 * The autoplay overlay's inactivity check: the minutes since the last interaction compared
 * with the limit (cmp-long), then the autoplay block check.
 *
 * 21.43.523: `Larep;->M()V`, `cmp-long v4, v11, v6` at 0x009f then `if-gez v4` (elapsed at or
 * past the limit). -1 takes the "not yet" path.
 */
internal object AutoplayInactivityLimitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Ljava/util/concurrent/TimeUnit;", name = "MINUTES"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/util/concurrent/TimeUnit;",
            name = "toMillis",
            location = MatchAfterWithin(5),
        ),
        opcode(Opcode.CMP_LONG, location = MatchAfterWithin(2)),
        anyInstruction(opcode(Opcode.IF_LTZ), opcode(Opcode.IF_GEZ), location = MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "Z", location = MatchAfterWithin(3)),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        opcode(Opcode.IF_NEZ, location = MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_STATIC, definingClass = "Landroid/animation/ObjectAnimator;", name = "ofObject"),
    ),
)

/** The playback progress' own inactivity check (flag 126827209), independent of autoplay. 21.43.523: `Larzk;->a(Ljava/lang/Object;)V`. */
internal object InactivityLimitFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(126827209L),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Ljava/util/concurrent/TimeUnit;", name = "SECONDS"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Ljava/util/concurrent/TimeUnit;",
            name = "toMillis",
            location = MatchAfterWithin(5),
        ),
        opcode(Opcode.CMP_LONG, location = MatchAfterWithin(2)),
        opcode(Opcode.IF_LEZ, location = MatchAfterImmediately()),
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "Ljava/util/concurrent/TimeUnit;",
            name = "MILLISECONDS",
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.IF_GTZ, location = MatchAfterWithin(20)),
    ),
)

/** Decides if the "Continue watching?" confirmation shows (flag 45381478, 21.30+). 21.43.523: `Loaf;->B()Z`. */
internal object AutoplayConfirmDialogEnabledFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        literal(45381478L),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, returnType = "Z", location = MatchAfterWithin(2)),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "I", location = MatchAfterWithin(6)),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lj\$/util/Optional;",
            name = "isPresent",
            location = MatchAfterWithin(6),
        ),
    ),
)

// endregion

// region End screen

private fun endScreenElementFingerprint(layout: String, public: Boolean) = Fingerprint(
    accessFlags = if (public) listOf(AccessFlags.PUBLIC) else listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    returnType = "Landroid/view/View;",
    filters = listOf(
        resourceLiteral(ResourceType.LAYOUT, layout),
        opcode(Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(10)),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
    ),
)

/**
 * Shows the creator's end screen elements of a video. 21.43.523: `Larnp;->b(Lardl;)V`; the
 * element views are inflated by `Larnt;->f()`, `Larnz;->f()` and `Larnr;->f()`.
 */
internal object ShowEndscreenCardsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT_OBJECT, type = "Ljava/lang/String;"),
        fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Ljava/lang/String;", location = MatchAfterImmediately()),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, name = "ordinal", location = MatchAfterWithin(7)),
        literal(5),
        literal(8),
        literal(9),
    ),
    custom = { method, classDef ->
        classDef.methods.count() == 5 && AccessFlags.FINAL.isSet(method.accessFlags)
    },
)

/** Class that inflates the grid of related videos shown at the end of a video. */
private object RelatedEndScreenResultsParentFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(resourceLiteral(ResourceType.LAYOUT, "app_related_endscreen_results")),
)

/** Shows the related videos grid at the end of a video (and when swiping up in fullscreen). 21.43.523: `Larym;->p(IZI)V`. */
internal object RelatedEndScreenResultsFingerprint : Fingerprint(
    classFingerprint = RelatedEndScreenResultsParentFingerprint,
    returnType = "V",
    parameters = listOf("I", "Z", "I"),
)

/** The autoplay ("autonav") state. */
private object AutoNavConstructorFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("main_app_autonav"),
)

/** True when autoplay is on. */
internal object AutoNavStatusFingerprint : Fingerprint(
    classFingerprint = AutoNavConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/**
 * Removes the overlays layout listener; the call before it shows the end screen. 21.43.523:
 * the end screen method is `Larep;->M()V`, the same method as the autoplay inactivity check.
 */
internal object RemoveOnLayoutChangeListenerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(opcode = Opcode.IPUT, type = "I"),
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = listOf(), returnType = "V", location = MatchAfterWithin(3)),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            definingClass = "Lcom/google/android/apps/youtube/app/common/player/overlay/YouTubePlayerOverlaysLayout;",
            name = "removeOnLayoutChangeListener",
            returnType = "V",
        ),
    ),
)

// endregion

/**
 * Watch page playback hooks of the iOS settings of the "watch-page" tweak:
 *
 * - `noContinueWatchingPrompt`: iOS answers "no" to "should show the You there? prompt".
 *   Here both inactivity checks never pass and the confirmation dialog is off.
 * - `hideEndScreenCards`: iOS keeps the creator end screen view hidden. Here the end screen
 *   element views (video, channel and link cards) are hidden and the end screen is not shown.
 * - `noRelatedVids`: iOS hides the related videos YouTube shows on the player when a video
 *   ends. Here the related videos grid and, when autoplay is off, the suggested video end
 *   screen are not shown.
 */
internal val watchPagePlaybackHookPatch = bytecodePatch(
    description = "Hides the continue watching prompt and the end screen of videos when Afterglow does.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        installWatchNextSections()
        val autoplayInactivity = AutoplayInactivityLimitFingerprint.method
        val autoplayInactivityIndex = AutoplayInactivityLimitFingerprint.instructionMatches[3].index
        val inactivity = InactivityLimitFingerprint.method
        val inactivityIndex = InactivityLimitFingerprint.instructionMatches[6].index
        val confirmDialog = AutoplayConfirmDialogEnabledFingerprint.method
        val endScreenElements = listOf(
            endScreenElementFingerprint("endscreen_element_layout_circle", false),
            endScreenElementFingerprint("endscreen_element_layout_icon", false),
            endScreenElementFingerprint("endscreen_element_layout_video", true),
        ).map { fingerprint -> fingerprint.method to fingerprint.instructionMatches.last().index }
        val showEndscreen = ShowEndscreenCardsFingerprint.method
        val relatedResults = RelatedEndScreenResultsFingerprint.method
        val autoNavStatus = AutoNavStatusFingerprint.method
        val endScreenCall = RemoveOnLayoutChangeListenerFingerprint.instructionMatches[1].getMethodCalled()
        val suggestedVideo = Fingerprint(
            definingClass = endScreenCall.definingClass,
            name = endScreenCall.name,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf(),
            filters = listOf(
                fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = autoNavStatus.definingClass),
                methodCall(autoNavStatus, location = MatchAfterWithin(3)),
            ),
        )
        val suggestedVideoMethod = suggestedVideo.method
        val autoNavField = suggestedVideo.instructionMatches.first().fieldReference

        debugMatch("autoplayInactivity", autoplayInactivity)
        debugMatch("inactivity", inactivity)
        debugMatch("confirmDialog", confirmDialog)
        endScreenElements.forEach { (method, _) -> debugMatch("endScreenElement", method) }
        debugMatch("showEndscreen", showEndscreen)
        debugMatch("relatedResults", relatedResults)
        debugMatch("suggestedVideo", suggestedVideoMethod)

        // "Are you still watching?": the comparison results, right before the branches that
        // test them, read as "not yet" (-1).
        listOf(autoplayInactivity to autoplayInactivityIndex, inactivity to inactivityIndex).forEach { (method, index) ->
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.addInstructions(
                index,
                """
                    ${invokeStaticOne(register, "$WATCH_PAGE_PLAYBACK_CLASS->adjustInactivityComparison(I)I")}
                    move-result v$register
                """,
            )
        }
        confirmDialog.returnEarlyWhen("$WATCH_PAGE_PLAYBACK_CLASS->hideContinueWatchingPrompt()Z", returnValue = 0)

        // End screen cards.
        endScreenElements.forEach { (method, castIndex) ->
            val register = method.getInstruction<OneRegisterInstruction>(castIndex).registerA
            method.addInstruction(
                castIndex + 1,
                invokeStaticOne(register, "$WATCH_PAGE_PLAYBACK_CLASS->hideEndScreenCardView(Landroid/view/View;)V"),
            )
        }
        showEndscreen.returnEarlyWhen("$WATCH_PAGE_PLAYBACK_CLASS->hideEndScreenCards()Z")

        // End screen related videos.
        relatedResults.returnEarlyWhen("$WATCH_PAGE_PLAYBACK_CLASS->hideRelatedVideos()Z")
        suggestedVideoMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $WATCH_PAGE_PLAYBACK_CLASS->hideRelatedVideos()Z
                move-result v0
                if-eqz v0, :afterglow_show
                iget-object v0, p0, $autoNavField
                invoke-virtual { v0 }, $autoNavStatus
                move-result v0
                if-nez v0, :afterglow_show
                return-void
                :afterglow_show
                nop
            """,
        )
    }
}
