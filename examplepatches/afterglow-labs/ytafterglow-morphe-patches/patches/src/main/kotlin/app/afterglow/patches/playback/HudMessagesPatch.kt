/* Native skip-display fingerprint adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for patcher 2.1 and Afterglow's iOS setting and live preference.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Preserve native message callbacks while using its own skip-display branch. */
internal val hudMessagesHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val display = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("L"), returnType = "V",
            filters = listOf(
                methodCall(parameters = listOf(), returnType = "Z"),
                methodCall(definingClass = "Lcom/google/android/apps/youtube/app/common/ui/bottomui/BottomUiContainer;",
                    parameters = listOf("L", "L", "L"), returnType = "V"),
            ),
        )
        val resultIndex = display.instructionMatches.first().index + 1
        val result = display.method.implementation!!.instructions[resultIndex]
        require(result.opcode == Opcode.MOVE_RESULT) { "Native snackbar skip-display result changed" }
        val register = (result as OneRegisterInstruction).registerA
        display.method.addInstructions(resultIndex + 1, """
            invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/playback/PlayerBehavior;->hideHudMessages(Z)Z
            move-result v$register
        """)
        // Native message views outside the shared display route keep their own
        // layout, visibility and callbacks; the existing live binder moves them
        // outside the viewport and removes accessibility focus while hidden.
        val viewTypes = listOf(
            "Lcom/google/android/libraries/quantum/snackbar/Snackbar;",
            "Lcom/google/android/material/snackbar/Snackbar\$SnackbarLayout;",
            "Lcom/google/android/apps/youtube/app/common/ui/bottomui/AppSnackbar;",
            "Lcom/google/android/apps/youtube/app/common/ui/bottomui/YouTubeSnackbar;",
            "Lcom/google/android/apps/youtube/app/common/ui/bottomui/Mealbar;",
        )
        for (type in viewTypes) {
            val viewClass = mutableClassDefBy(type)
            val constructors = viewClass.methods.filter { it.name == "<init>" }
            require(constructors.isNotEmpty()) { "Missing native HUD constructors: $type" }
            for (create in constructors) {
                require(create.parameterTypes.all { it == "Landroid/content/Context;"
                        || it == "Landroid/util/AttributeSet;" || it == "I" })
                val thisRegister = create.implementation!!.registerCount - create.parameterTypes.size - 1
                val superIndex = create.implementation!!.instructions.indexOfFirst {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    it.opcode == Opcode.INVOKE_DIRECT && call != null && call.name == "<init>"
                            && (call.definingClass == type || call.definingClass == viewClass.superclass)
                            && (it as FiveRegisterInstruction).registerC == thisRegister
                }
                require(superIndex >= 0) { "Missing HUD constructor parent call: $type" }
                create.addInstructions(superIndex + 1, """
                    invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/playback/PlayerOverlay;->hud(Landroid/view/View;)V
                """)
            }
        }
        // root_pill_container is the native transient-message overlay. The second
        // FrameLayout (pane_fragment_footer_container) belongs to the watch page.
        val lithoLayout = Fingerprint(returnType = "Landroid/view/View;",
            parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
            filters = listOf(resourceLiteral(ResourceType.ID, "root_pill_container"),
                fieldAccess(definingClass = "this", opcode = Opcode.IPUT_OBJECT,
                    type = "Landroid/widget/FrameLayout;", location = MatchAfterWithin(6))),
            strings = listOf("instance_action_bar_color", "instance_status_bar_color",
                "instance_activated_text_color", "instance_secondary_text_color"))
        val frameIndex = lithoLayout.instructionMatches.last().index
        val frameRegister = (lithoLayout.method.implementation!!.instructions[frameIndex] as TwoRegisterInstruction).registerA
        lithoLayout.method.addInstructions(frameIndex, """
            invoke-static/range { v$frameRegister .. v$frameRegister }, $EXTENSION_PACKAGE/playback/PlayerOverlay;->hud(Landroid/view/View;)V
        """)
        println("Afterglow HUD messages: ${display.method.definingClass}->${display.method.name}")
    }
}
