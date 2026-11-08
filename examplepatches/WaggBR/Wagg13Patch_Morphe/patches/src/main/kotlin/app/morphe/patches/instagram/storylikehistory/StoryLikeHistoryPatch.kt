/*
 * Story like history for Instagram (Morphe): records the stories the user likes in the last 24h
 * and exposes them through a native screen opened from the story "..." menu.
 *
 * The way a custom entry is added to the story "..." options dialog (append to the label array
 * being built, then intercept the tap) follows Piko's StoryButton
 * <https://github.com/crimera/piko> (GPLv3; see NOTICE.piko).
 */

package app.morphe.patches.instagram.storylikehistory

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/instagram/patches/story/StoryLikeHistoryActivity;"
private const val RECORDER_CLASS = "Lapp/morphe/extension/instagram/patches/story/StoryLikeHistoryRecorder;"

/**
 * Builders of the `CharSequence[]` shown by the story "..." bottom sheet. 452 splits it into
 * three methods that each build a list and return the same CharSequence[]:
 * - `A0r` is the overflow sheet (it also carries the `[INTERNAL] Pause Playback` debug entry),
 * - `A0s` is the regular story action sheet,
 * - `A0t` is the story-highlight action sheet.
 *
 * The caller `LX/0ASJ` (methods A06/A0X) dispatches to exactly one of them per open, so every
 * one must carry our entry. Anchored on the stable class + method name (both Redex names for the
 * single supported version), the same way the like hook anchors `LX/0ATY.FhI`.
 */
internal val storyMenuBuilders = listOf(
    Fingerprint(definingClass = "LX/0YmS;", name = "A0r"),
    Fingerprint(definingClass = "LX/0YmS;", name = "A0s"),
    Fingerprint(definingClass = "LX/0YmS;", name = "A0t"),
)

/**
 * Handles a tap on an entry of that dialog (452: LX/0YmS.A0I). Anchored on the same strings the
 * 439 implementation used; the clicked label is its last parameter.
 */
internal object StoryOptionsClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore_viewer", "friendships/mute_friend_reel/%s/", "[INTERNAL] Pause Playback"),
    custom = { method, _ -> method.parameterTypes.lastOrNull() == "Ljava/lang/CharSequence;" },
)

/**
 * Story viewer's like-state setters (452). One of the viewer's click listeners
 * (LX/0hbE.onClick) calls `LX/0nzj.FhI(LX/04gU; ReelItem; LX/02z4;)`, which dispatches to the
 * viewer's handler. Two classes define that exact shape:
 * - `LX/0ATY.FhI` is the real one (delegates to `LX/0kzn.FhG`, the like executor);
 * - `LX/0H13.FhI` is a no-op singleton (only instantiated once, in `LX/0H14.<clinit>`).
 *
 * Both are hooked as a safety net: the heart icon users actually tap goes through
 * {@link StoryHeartToggleFingerprint} below, but any tap that does reach this older path
 * is still captured. The recorder itself filters non-LIKED and is idempotent, so hooking
 * every path is safe. Unlike `story_interactions/bulk_story_like/`, which is an internal
 * debug entry of the "..." menu, these see real heart taps.
 */
internal object StoryLikeToggleFingerprint : Fingerprint(
    definingClass = "LX/0ATY;",
    name = "FhI",
    returnType = "V",
    parameters = listOf(
        "LX/04gU;",
        "Lcom/instagram/model/reels/ReelItem;",
        "LX/02z4;",
    ),
)

internal object StoryLikeToggleNoOpFingerprint : Fingerprint(
    definingClass = "LX/0H13;",
    name = "FhI",
    returnType = "V",
    parameters = listOf(
        "LX/04gU;",
        "Lcom/instagram/model/reels/ReelItem;",
        "LX/02z4;",
    ),
)

/**
 * Terminal like executor (452: LX/0AkV.FhG). Every like path converges here: `LX/0ATY.FhI`
 * delegates to `LX/0kzn.FhG`, `LX/0ASJ.FhG` forwards to the same interface, and `LX/0AkV.FhG`
 * (37 registers, reads the story's Media and like state) is the only non-trivial
 * implementation. Hooked with the same recorder so likes that bypass `FhI` (double-tap and
 * other entry points) are still captured; the recorder's LIKED filter and idempotent `add()`
 * make the extra hook safe.
 */
internal object StoryLikeExecutorFingerprint : Fingerprint(
    definingClass = "LX/0AkV;",
    name = "FhG",
    returnType = "V",
    parameters = listOf(
        "LX/04gU;",
        "LX/03sm;",
        "Lcom/instagram/model/reels/ReelItem;",
        "LX/02z4;",
    ),
)

/** Heart-icon tap entry point (452: LX/09TS.A0W). The story viewer's other click listener
 * (LX/0hbD.onClick) calls it after haptic feedback; it carries no params, so the holder
 * object itself ({@code p0}) is handed to the recorder, which recovers the story and the
 * tap's direction. Also reached via LX/0A3F.A02, likewise from that same click listener,
 * so every call here is a user tap, never background work.
 */
internal object StoryHeartToggleFingerprint : Fingerprint(
    definingClass = "LX/09TS;",
    name = "A0W",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val storyLikeHistoryPatch = bytecodePatch(
    name = "Story like history",
    description = "Keeps a local history of the stories you liked in the last 24 hours and shows it " +
        "in a native grid, opened from the story \"...\" menu.",
) {
    compatibleWith(
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets = listOf(
                AppTarget(
                    version = "452.1.0.53.64",
                    versionCodes = mapOf(ARM64_V8A to 385811006),
                ),
            ),
        ),
    )

    dependsOn(storyLikeHistoryManifestPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // "..." menu: append our label to the array each builder returns. All three converge on a
        // single `return-object` (after their `toArray`), so hooking that point covers every path.
        storyMenuBuilders.forEach { fingerprint ->
            fingerprint.method.apply {
                val returnIndex = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
                if (returnIndex < 0) throw PatchException("Story options builder has no return-object")
                val arrayRegister = getInstruction<OneRegisterInstruction>(returnIndex).registerA

                addInstructions(
                    returnIndex,
                    """
                    invoke-static {v$arrayRegister}, $EXTENSION_CLASS->addButtons([Ljava/lang/CharSequence;)[Ljava/lang/CharSequence;
                    move-result-object v$arrayRegister
                    """.trimIndent(),
                )
            }
        }

        // "..." menu click: intercept our label before Instagram's own handling.
        StoryOptionsClickFingerprint.method.apply {
            val classDef = StoryOptionsClickFingerprint.classDef
            val activityField = classDef.fields.firstOrNull { it.type == "Landroid/app/Activity;" }
                ?: throw PatchException("Story options handler has no Activity field")
            val textIndex = parameters.indexOfLast { it.type == "Ljava/lang/CharSequence;" }
            val helperIndex = parameters.indexOfLast { it.type == classDef.type }
            if (textIndex < 0 || helperIndex < 0) throw PatchException("Unexpected story options click signature")

            addInstructionsWithLabels(
                0,
                """
                move-object/from16 v0, p$textIndex
                move-object/from16 v1, p$helperIndex
                iget-object v2, v1, $activityField
                invoke-static {v0, v2}, $EXTENSION_CLASS->buttonAction(Ljava/lang/CharSequence;Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :wagg13_story_like_history_original
                return-void
                """.trimIndent(),
                ExternalLabel("wagg13_story_like_history_original", getInstruction(0)),
            )
        }

        // Heart tap: record the like before Instagram applies it. Both FhI shapes are
        // hooked (real handler + no-op singleton); the recorder filters non-LIKED and is
        // idempotent, so whichever object the viewer holds, the tap is captured once.
        StoryLikeToggleFingerprint.method.apply {
            addInstructions(
                0,
                """
                invoke-static {p1, p2}, $RECORDER_CLASS->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }
        StoryLikeToggleNoOpFingerprint.method.apply {
            addInstructions(
                0,
                """
                invoke-static {p1, p2}, $RECORDER_CLASS->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        // Terminal executor: catches likes that bypass FhI (double-tap and other entries).
        // FhG params are (action, 03sm, reelItem, 02z4); the reel (p3) is not consecutive
        // with the action (p1), so both are moved to free locals first (v0/v1 are locals in
        // this 37-register method and undefined at index 0). Same pattern as the click hook.
        StoryLikeExecutorFingerprint.method.apply {
            addInstructions(
                0,
                """
                move-object/from16 v0, p1
                move-object/from16 v1, p3
                invoke-static {v0, v1}, $RECORDER_CLASS->onLikeStateChanged(Ljava/lang/Object;Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        // ---- heart-icon tap: the path users actually take ----------------------------
        // The heart icon is handled by a different listener (LX/0hbD.onClick), which calls
        // LX/09TS.A0W after haptic feedback. That method carries no params, so its holder
        // (p0) is passed; the recorder recovers story + direction from it.
        StoryHeartToggleFingerprint.method.apply {
            addInstructions(
                0,
                """
                move-object/from16 v0, p0
                invoke-static {v0}, $RECORDER_CLASS->onStoryToggle(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }
    }
}
