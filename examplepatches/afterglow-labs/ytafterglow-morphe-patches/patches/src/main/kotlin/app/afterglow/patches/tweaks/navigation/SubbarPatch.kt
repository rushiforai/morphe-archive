/* Native chip-row fingerprints adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for patcher 2.1 and reversible Afterglow preferences. Portions are
 * provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val RECYCLER = "Landroid/support/v7/widget/RecyclerView;"
private const val SUBBAR = "$EXTENSION_PACKAGE/navigation/Subbar;"

internal val subbarHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        // Bind the real RecyclerView, not a zero constructor dimension cached by
        // a native controller. Its parent is resolved when native attachment is done.
        val feed = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            filters = listOf(resourceLiteral(ResourceType.ID, "chip_bar_container"),
                resourceLiteral(ResourceType.DIMEN, "filter_bar_height"),
                methodCall(definingClass = RECYCLER, name = "setLayoutParams")),
            strings = listOf("conditionally_show_entry_point"),
        )
        val search = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            filters = listOf(resourceLiteral(ResourceType.ID, "chip_bar_chips_container"),
                resourceLiteral(ResourceType.DIMEN, "bar_container_height"),
                methodCall(definingClass = RECYCLER, name = "setLayoutParams")),
        )
        for (fingerprint in listOf(feed, search)) {
            val method = fingerprint.method
            val index = fingerprint.instructionMatches.last().index
            val register = (method.implementation!!.instructions[index] as FiveRegisterInstruction).registerC
            method.bindSubbar(index + 1, register)
            println("Afterglow native filter row: ${method.definingClass}->${method.name}")
        }

        val related = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            filters = listOf(resourceLiteral(ResourceType.ID, "related_chip_cloud"),
                methodCall(name = "findViewById", location = MatchAfterImmediately()),
                checkCast(type = RECYCLER, location = MatchAfterWithin(2))),
        )
        related.method.let { method ->
            val index = related.instructionMatches.last().index
            method.bindSubbar(index + 1, (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA)
        }

        val mirrors = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("Landroid/view/View;", "Landroid/view/View;"), returnType = "V",
            filters = listOf(resourceLiteral(ResourceType.ID, "related_chip_cloud"),
                methodCall(name = "findViewById", location = MatchAfterImmediately()),
                checkCast(type = RECYCLER, location = MatchAfterWithin(2)),
                methodCall(name = "findViewById", location = MatchAfterWithin(6)),
                checkCast(type = RECYCLER, location = MatchAfterWithin(2))),
        )
        // Resolve before mutation: strict revalidation must see the original pair.
        val mirrorMatch = mirrors.match()
        for (match in listOf(mirrorMatch.instructionMatches[4], mirrorMatch.instructionMatches[2])) {
            mirrorMatch.method.bindSubbar(match.index + 1,
                (match.instruction as OneRegisterInstruction).registerA)
        }
        val mirrorClass = mutableClassDefBy(mirrorMatch.method.definingClass)
        val attachmentMethods = mirrorClass.methods.filter {
            it.parameterTypes == listOf("Landroid/view/View;") && it.returnType == "V"
                    && it.implementation?.instructions?.any { instruction ->
                        instruction.opcode == Opcode.CHECK_CAST
                                && ((instruction as ReferenceInstruction).reference as TypeReference).type == RECYCLER
                    } == true
        }
        require(attachmentMethods.size == 2) { "Related-chip mirror attachment routes changed" }
        for (method in attachmentMethods) {
            val casts = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.CHECK_CAST
                        && ((instruction as ReferenceInstruction).reference as TypeReference).type == RECYCLER
            }
            require(casts.size == 1) { "Ambiguous related-chip mirror RecyclerView" }
            val (index, instruction) = casts.single()
            method.bindSubbar(index + 1, (instruction as OneRegisterInstruction).registerA)
        }

        // The feed's partial-pull controller can request a 0 -> full reveal while
        // our collapsed row still has its full native height. Start that one
        // bound-row animation at its actual height; retain validation/callbacks.
        val heightAnimator = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            parameters = listOf("I", "I", "Landroid/view/View;", "L", "I", "I", "Z", "Z"),
            strings = listOf("Target view height does not match expected height (",
                "FeedFilterBar HeightAnimator instantiated with null target view."),
        ).method
        heightAnimator.addInstructions(0, """
            invoke-static/range { p1 .. p3 }, $SUBBAR->animationStart(IILandroid/view/View;)I
            move-result p1
        """)
    }
}

private fun MutableMethod.bindSubbar(index: Int, register: Int) = addInstructions(index, """
    invoke-static/range { v$register .. v$register }, $SUBBAR->bind(Landroid/view/View;)V
""")
