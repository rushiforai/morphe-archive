/*
 * Story mention indicator for Instagram (Morphe).
 *
 * Idea and mention-reading approach derived from the "View story mentions"
 * feature of Piko <https://github.com/crimera/piko> (GPLv3, with the NOTICE
 * file's §7(b) attribution terms — keep NOTICE.piko with this code).
 * Unlike Piko, the mention data is read by reflection over Instagram's
 * non-obfuscated model classes, so only two obfuscated method names are
 * resolved at patch time.
 */

package app.morphe.patches.instagram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi.ARM64_V8A
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/morphe/extension/instagram/patches/story/StoryMentionIcon;"
private const val SETTINGS_CLASS = "Lapp/morphe/extension/instagram/patches/story/StoryMentionSettings;"
private const val REEL_ITEM_CLASS = "Lcom/instagram/model/reels/ReelItem;"
private const val MEDIA_DICT_CLASS = "Lcom/instagram/feed/media/LiveTreeMediaDict;"
private const val USER_DICT_CLASS = "Lcom/instagram/user/model/LiveTreeUserDict;"

/**
 * Called by Instagram each time a story item becomes the active one: (ReelItem, item view holder).
 * Identified by its stable telemetry string; the holder is an obfuscated type, so it is deliberately
 * not part of the match. The holder is what leads to the active item's own header (see the extension).
 */
internal object CurrentActiveStoryItemFingerprint : Fingerprint(
    definingClass = "Linstagram/features/stories/fragment/ReelViewerFragment;",
    returnType = "V",
    strings = listOf("ReelViewerFragment.onCurrentActiveItemBound"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[0] == REEL_ITEM_CLASS
    },
)

/** LiveTreeMediaDict getter that returns the `reel_mentions` list. */
internal object ReelMentionsGetterFingerprint : Fingerprint(
    definingClass = MEDIA_DICT_CLASS,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    strings = listOf("reel_mentions"),
)

/**
 * LiveTreeUserDict `username` getter. Unlike its String siblings it never
 * spells its JSON key as a const-string, so: no-arg, returns String, reads a
 * LiveTree string value and contains no const-string. On 439.0.0.37.89 this
 * matches exactly one method.
 */
internal object UsernameGetterFingerprint : Fingerprint(
    definingClass = USER_DICT_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, _ -> method.readsLiveTreeStringWithoutLiteralKey() },
)


/**
 * Builds the CharSequence[] of the story "..." bottom sheet (other people's stories).
 * Same anchor Piko uses: no other method returns CharSequence[] from one parameter and
 * contains the "[INTERNAL] Pause Playback" debug entry.
 */
internal object StoryMenuItemsFingerprint : Fingerprint(
    returnType = "[Ljava/lang/CharSequence;",
    strings = listOf("[INTERNAL] Pause Playback"),
    custom = { method, _ -> method.parameterTypes.size == 1 },
)

/** Handles a tap on an entry of that bottom sheet (same anchor Piko uses). */
internal object StoryMenuClickFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("explore_viewer", "friendships/mute_friend_reel/%s/", "[INTERNAL] Pause Playback"),
)

private fun Method.readsLiveTreeStringWithoutLiteralKey(): Boolean {
    val instructions = implementation?.instructions ?: return false
    var reads = false
    for (instruction in instructions) {
        when {
            instruction.opcode == Opcode.CONST_STRING ||
                instruction.opcode == Opcode.CONST_STRING_JUMBO -> return false
            instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.name == "getOptionalStringValueNative" ->
                reads = true
        }
    }
    return reads
}

@Suppress("unused")
val storyMentionIconPatch = bytecodePatch(
    name = "Story mention indicator",
    description = "Shows an \"@N mention\" pill in the story header when the story mentions someone. " +
        "Tap it to list and open the mentioned profiles.",
) {
    compatibleWith(
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets = listOf(
                AppTarget(
                    version = "439.0.0.37.89",
                    versionCodes = mapOf(ARM64_V8A to 384510827),
                ),
            ),
        ),
    )

    // Merges StoryMentionIcon.java (built into this bundle's extension) into the patched APK.
    extendWith("extensions/extension.mpe")

    execute {
        val mentionsMethod = ReelMentionsGetterFingerprint.method.name
        val usernameMethod = UsernameGetterFingerprint.method.name

        CurrentActiveStoryItemFingerprint.method.apply {
            val locals = implementation!!.registerCount - parameterTypes.size - 1
            if (locals < 5) throw PatchException("Hook method has $locals locals, need at least 5")

            // Instance method: p0 = fragment, p1 = ReelItem, p2 = item view holder.
            addInstructions(
                0,
                """
                move-object/from16 v0, p0
                move-object/from16 v1, p1
                move-object/from16 v2, p2
                const-string v3, "$mentionsMethod"
                const-string v4, "$usernameMethod"
                invoke-static {v0, v1, v2, v3, v4}, $EXTENSION_CLASS->update(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
                """.trimIndent(),
            )
        }

        // "..." menu entry that opens the pill settings. Adds the label to the list being built...
        StoryMenuItemsFingerprint.method.apply {
            val index = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_OBJECT }
            if (index < 0) throw PatchException("No move-result-object in story menu builder")
            val listRegister = getInstruction<OneRegisterInstruction>(index).registerA

            addInstructions(
                index + 1,
                """
                invoke-static {v$listRegister}, $SETTINGS_CLASS->addButtons(Ljava/util/ArrayList;)Ljava/util/ArrayList;
                move-result-object v$listRegister
                """.trimIndent(),
            )
        }

        // ...and intercepts its tap before Instagram's own handling.
        StoryMenuClickFingerprint.method.apply {
            val classDef = StoryMenuClickFingerprint.classDef
            val activityField = classDef.fields.first { it.type == "Landroid/app/Activity;" }
            val textIndex = parameters.indexOfLast { it.type == "Ljava/lang/CharSequence;" }
            val helperIndex = parameters.indexOfLast { it.type == classDef.type }
            if (textIndex < 0 || helperIndex < 0) throw PatchException("Unexpected story menu click signature")

            // Hooked at index 0, where v0-v2 are free (the method has 22 locals on 439).
            addInstructionsWithLabels(
                0,
                """
                move-object/from16 v0, p$textIndex
                move-object/from16 v1, p$helperIndex
                iget-object v2, v1, $activityField
                invoke-static {v0, v2}, $SETTINGS_CLASS->buttonAction(Ljava/lang/CharSequence;Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :wagg13_story_menu_original
                return-void
                """.trimIndent(),
                ExternalLabel("wagg13_story_menu_original", getInstruction(0)),
            )
        }
    }
}
