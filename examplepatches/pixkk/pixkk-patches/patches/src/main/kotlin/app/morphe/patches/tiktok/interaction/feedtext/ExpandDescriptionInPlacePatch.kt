/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.feedtext

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.shared.guardAtEntry
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.addInstructionsWithLabels
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WHAT = "Expand description in place"
private const val EXTENSION = "Lapp/pixkk/extension/feed/DescriptionExpand;"
private const val POST_MODE = "Lcom/ss/android/ugc/aweme/model/PostModeEntranceMechanism;"

/**
 * The description's expand and collapse entry: the See more button, the collapse tap and the
 * auto-collapse all end here. `title_panel_more_click_track_enable` is the setting key it reads
 * for ad tracking, and no other method takes this signature together with that string.
 */
internal object DescriptionExpandFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/String;", POST_MODE),
    strings = listOf("title_panel_more_click_track_enable"),
)

/**
 * The delegates that open the post-mode detail screen: one for videos and one for photo posts.
 * Both log `handleNavigateToPostModeDetail: ` and take the same four arguments. The photo one
 * starts opening the screen before it answers, so the answer alone cannot stop it.
 */
internal object PostModeNavigationFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;", POST_MODE, "Ljava/lang/Boolean;", "Ljava/lang/String;",
    ),
    strings = listOf("handleNavigateToPostModeDetail: "),
)

@Suppress("unused")
val expandDescriptionInPlacePatch = bytecodePatch(
    name = WHAT,
    description = "Makes See more unfold the description right where it is, the way TikTok used to, " +
        "instead of opening the full text in a new screen. Starts off. Turn it on in the " +
        "Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // Each delegate answers false at once for See more and a tap on the text, before it does
        // anything, so neither the video nor the photo post opens the detail screen.
        val delegates = PostModeNavigationFingerprint.matchAllOrNull().orEmpty()
        if (delegates.isEmpty()) throw PatchException("$WHAT: the post-mode navigation delegates are gone")
        delegates.forEach {
            // p0 is the delegate, p1 the Aweme, p2 the mechanism.
            it.method.guardAtEntry(
                WHAT,
                "invoke-static { p2 }, $EXTENSION->keepOutOfDetail(Ljava/lang/Object;)Z",
                "const/4 v0, 0x0\nreturn v0",
            )
        }

        // The method asks the description delegate to open the post-mode detail screen and
        // returns at once when that answers true. Overwriting the answer with false lets it fall
        // through to the in-place expand it always had, so one hook on the answer covers both
        // delegates the app can pick between.
        DescriptionExpandFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val callIndex = instructions.indexOfFirst { instruction ->
                if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@indexOfFirst false
                val reference = instruction.getReference<MethodReference>() ?: return@indexOfFirst false
                reference.returnType == "Z" && reference.parameterTypes.map { it.toString() } ==
                    listOf("Lcom/ss/android/ugc/aweme/feed/model/Aweme;", POST_MODE,
                        "Ljava/lang/Boolean;", "Ljava/lang/String;")
            }
            if (callIndex < 0) throw PatchException("$WHAT: the post-mode navigation call is gone")
            val call = instructions[callIndex] as? FiveRegisterInstruction
                ?: throw PatchException("$WHAT: the navigation call no longer takes five registers")
            val result = instructions.getOrNull(callIndex + 1) as? OneRegisterInstruction
            if (result == null || instructions[callIndex + 1].opcode != Opcode.MOVE_RESULT) {
                throw PatchException("$WHAT: the navigation answer is not read right after the call")
            }
            // Arguments are the delegate, the Aweme, the mechanism, the expand flag, the hide reason.
            if (result.registerA > 15 || call.registerE > 15) {
                throw PatchException("$WHAT: the registers no longer fit a four-bit call")
            }
            addInstructions(
                callIndex + 2,
                """
                    invoke-static { v${result.registerA}, v${call.registerE} }, $EXTENSION->keepInPlace(ZLjava/lang/Object;)Z
                    move-result v${result.registerA}
                """,
            )

            // With the answer false the method goes on, and when a visual-search flag is on it
            // opens the description in the full-screen search viewer for the See more button and
            // a tap on the text. The flag is read right before the mechanism is compared with
            // TAP_TEXT; the same hook turns it off for See more, so the in-place expand runs.
            val after = implementation!!.instructions.toList()
            val tapTextIndex = after.indexOfFirst { instruction ->
                if (instruction.opcode != Opcode.SGET_OBJECT) return@indexOfFirst false
                val field = instruction.getReference<FieldReference>() ?: return@indexOfFirst false
                field.definingClass == POST_MODE && field.name == "TAP_TEXT"
            }
            if (tapTextIndex < 3) throw PatchException("$WHAT: the visual-search check is gone")
            val flag = after[tapTextIndex - 2] as? OneRegisterInstruction
            if (flag == null || after[tapTextIndex - 2].opcode != Opcode.MOVE_RESULT ||
                // The answer may already pass through a filter called as a range.
                (after[tapTextIndex - 3].opcode != Opcode.INVOKE_STATIC &&
                    after[tapTextIndex - 3].opcode != Opcode.INVOKE_STATIC_RANGE) ||
                after[tapTextIndex - 1].opcode != Opcode.IF_EQZ
            ) {
                throw PatchException("$WHAT: the visual-search flag is not read as expected")
            }
            val compare = after.drop(tapTextIndex + 1).firstOrNull { it.opcode == Opcode.IF_EQ } as? TwoRegisterInstruction
                ?: throw PatchException("$WHAT: the mechanism is no longer compared with TAP_TEXT")
            if (flag.registerA > 15 || compare.registerA > 15) {
                throw PatchException("$WHAT: the registers no longer fit a four-bit call")
            }
            // The hook goes after the branch, not between the flag and the branch: the flag's move
            // and its if-eqz stay next to each other, the shape another bundle's filter looks for.
            // On the way through the branch the flag is known to be true, and the register that
            // TAP_TEXT is loaded into next is free, so it holds the answer.
            val branch = after[tapTextIndex - 1] as? OffsetInstruction
                ?: throw PatchException("$WHAT: the visual-search flag is not tested by a branch")
            val scratch = (after[tapTextIndex] as OneRegisterInstruction).registerA
            if (scratch > 15 || scratch == compare.registerA) {
                throw PatchException("$WHAT: no free register for the visual-search hook")
            }
            var address = 0
            val addresses = IntArray(after.size + 1) { index ->
                val at = address
                if (index < after.size) address += after[index].codeUnits
                at
            }
            val skip = addresses.indexOf(addresses[tapTextIndex - 1] + branch.codeOffset)
            if (skip !in after.indices) throw PatchException("$WHAT: the visual-search branch lands between instructions")
            addInstructionsWithLabels(
                tapTextIndex,
                """
                    const/4 v$scratch, 0x1
                    invoke-static { v$scratch, v${compare.registerA} }, $EXTENSION->keepSearchViewerOff(ZLjava/lang/Object;)Z
                    move-result v$scratch
                    if-eqz v$scratch, :skip
                """,
                ExternalLabel("skip", getInstruction(skip)),
            )
        }
    }
}
