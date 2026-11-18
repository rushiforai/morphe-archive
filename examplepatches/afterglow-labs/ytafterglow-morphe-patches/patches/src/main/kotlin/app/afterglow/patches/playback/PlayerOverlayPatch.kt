/* Native fingerprints adapted from Morphe patches v2.2.0 (GPLv3),
 * https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for patcher 2.1 and Afterglow's independently installed, live settings.
 * Portions provided "AS IS" by the Morphe software project without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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

private const val OVERLAY = "$EXTENSION_PACKAGE/playback/PlayerOverlay;"

internal val playerOverlayHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        // Resolve a fresh match: the independently selected Autoplay patch also edits this method.
        val controls = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
            filters = listOf(
                literal(159962),
                resourceLiteral(ResourceType.ID, "player_control_previous_button_touch_area"),
                resourceLiteral(ResourceType.ID, "player_control_next_button_touch_area"),
                methodCall(parameters = listOf("Landroid/view/View;", "I"))
            ))
        installPauseOnOverlay(controls.method)
        installPlayerPaddles()
        val index = controls.instructionMatches.last().index
        val root = controls.method.implementation!!.instructions[index].invokeRegisters.first()
        controls.method.addInstructions(index,
            "invoke-static/range { v$root .. v$root }, $OVERLAY->controls(Landroid/view/View;)V")
        println("Afterglow overlay controls: ${controls.method.definingClass}->${controls.method.name}")

        val captions = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("L"), filters = listOf(
                fieldAccess(opcode = Opcode.IGET_OBJECT, type = "Lcom/google/android/libraries/youtube/common/ui/TouchImageView;"),
                resourceLiteral(ResourceType.STRING, "accessibility_captions_unavailable"),
                resourceLiteral(ResourceType.STRING, "accessibility_captions_button_name")
            ))
        val captionRead = captions.instructionMatches.first().index
        val captionRegister = (captions.method.implementation!!.instructions[captionRead] as OneRegisterInstruction).registerA
        captions.method.addInstructions(captionRead + 1,
            "invoke-static/range { v$captionRegister .. v$captionRegister }, $OVERLAY->captions(Landroid/widget/ImageView;)V")

        val collapse = Fingerprint(returnType = "V", filters = listOf(
            resourceLiteral(ResourceType.ID, "player_collapse_button"),
            opcode(Opcode.CHECK_CAST),
            resourceLiteral(ResourceType.ID, "title_anchor"),
            opcode(Opcode.MOVE_RESULT_OBJECT)
        ))
        val collapseCast = collapse.instructionMatches[1].index
        val collapseRegister = (collapse.method.implementation!!.instructions[collapseCast] as OneRegisterInstruction).registerA
        collapse.method.addInstructions(collapseCast + 1,
            "invoke-static/range { v$collapseRegister .. v$collapseRegister }, $OVERLAY->collapse(Landroid/widget/ImageView;)V")

        val fullscreen = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            parameters = listOf("Landroid/view/View;"), returnType = "V", filters = listOf(
                resourceLiteral(ResourceType.ID, "fullscreen_button"),
                opcode(Opcode.CHECK_CAST, MatchAfterWithin(10))
            ))
        val fullscreenCast = fullscreen.instructionMatches[1].index
        val fullscreenRegister = (fullscreen.method.implementation!!.instructions[fullscreenCast] as OneRegisterInstruction).registerA
        fullscreen.method.addInstructions(fullscreenCast + 1,
            "invoke-static/range { v$fullscreenRegister .. v$fullscreenRegister }, $OVERLAY->fullscreen(Landroid/widget/ImageView;)V")
        println("Afterglow overlay controllers: captions=${captions.method.definingClass}, collapse=${collapse.method.definingClass}, fullscreen=${fullscreen.method.definingClass}")

        // The title has its own parent: the collapse/overflow controls are siblings.
        val heading = Fingerprint(name = "<init>", returnType = "V",
            parameters = listOf("Landroid/view/View;", "I", "Z"), filters = listOf(
                resourceLiteral(ResourceType.ID, "player_video_heading"),
                checkCast("Lcom/google/android/apps/youtube/app/player/overlay/InterceptingFrameLayout;", MatchAfterWithin(10))
            ))
        val headingCast = heading.instructionMatches.last().index
        val headingRegister = (heading.method.implementation!!.instructions[headingCast] as OneRegisterInstruction).registerA
        heading.method.addInstructions(headingCast + 1,
            "invoke-static/range { v$headingRegister .. v$headingRegister }, $OVERLAY->title(Landroid/view/View;)V")

        // These are the native controls' center/top/bottom scrims, not ambient lighting.
        // Resolve each match after the preceding edit, since all three share one method.
        for (name in listOf("scrim_overlay", "top_gradient_scrim_overlay", "bottom_gradient_scrim_overlay")) {
            val scrim = Fingerprint(returnType = "V", filters = listOf(
                resourceLiteral(ResourceType.ID, name),
                checkCast("Landroid/widget/ImageView;", MatchAfterWithin(10))
            ))
            val cast = scrim.instructionMatches.last().index
            val register = (scrim.method.implementation!!.instructions[cast] as OneRegisterInstruction).registerA
            scrim.method.addInstructions(cast + 1,
                "invoke-static/range { v$register .. v$register }, $OVERLAY->shading(Landroid/view/View;)V")
            println("Afterglow overlay shading $name: ${scrim.method.definingClass}->${scrim.method.name}")
        }
        val topBackground = Fingerprint(name = "<init>", returnType = "V",
            parameters = listOf("Landroid/view/View;", "I", "Z"), filters = listOf(
                resourceLiteral(ResourceType.ID, "top_bar_background"),
                methodCall(smali = "Landroid/view/View;->findViewById(I)Landroid/view/View;", location = MatchAfterWithin(3)),
                opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately())
            ))
        val backgroundRead = topBackground.instructionMatches.last().index
        val backgroundRegister = (topBackground.method.implementation!!.instructions[backgroundRead] as OneRegisterInstruction).registerA
        topBackground.method.addInstructions(backgroundRead + 1,
            "invoke-static/range { v$backgroundRegister .. v$backgroundRegister }, $OVERLAY->shading(Landroid/view/View;)V")

        val actions = Fingerprint(accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Landroid/view/View;"), filters = listOf(
                resourceLiteral(ResourceType.ID, "quick_actions_element_container"),
                checkCast("Landroid/view/ViewGroup;", MatchAfterWithin(10))
            ))
        val actionsCast = actions.instructionMatches.last().index
        val actionsRegister = (actions.method.implementation!!.instructions[actionsCast] as OneRegisterInstruction).registerA
        actions.method.addInstructions(actionsCast + 1,
            "invoke-static/range { v$actionsRegister .. v$actionsRegister }, $OVERLAY->actions(Landroid/view/View;)V")

        // Legacy in-video programming still has a native ImageView in 21.43.523.
        // Modern featured-channel watermarks are handled by PlayerOverlayFilter.
        val watermark = Fingerprint(returnType = "Landroid/view/View;", filters = listOf(
            resourceLiteral(ResourceType.ID, "branding_watermark"),
            checkCast("Landroid/widget/ImageView;", MatchAfterWithin(10))
        ))
        val watermarkCast = watermark.instructionMatches.last().index
        val watermarkRegister = (watermark.method.implementation!!.instructions[watermarkCast] as OneRegisterInstruction).registerA
        watermark.method.addInstructions(watermarkCast + 1,
            "invoke-static/range { v$watermarkRegister .. v$watermarkRegister }, $OVERLAY->watermark(Landroid/widget/ImageView;)V")
        // Resolve the actual inflated button in its native binder. Do not replace
        // ViewStub listeners or force a button YouTube did not provide to appear.
        val musicBindings = Fingerprint(parameters = listOf(), returnType = "V", filters = listOf(
            resourceLiteral(ResourceType.ID, "music_app_deeplink_button_view"),
            checkCast("Lcom/google/android/libraries/youtube/common/ui/TouchImageView;", MatchAfterWithin(5))
        )).matchAll()
        require(musicBindings.size == 2) { "Native music button binders changed" }
        for (music in musicBindings) {
            val cast = music.instructionMatches.last().index
            val register = (music.method.implementation!!.instructions[cast] as OneRegisterInstruction).registerA
            music.method.addInstructions(cast + 1,
                "invoke-static/range { v$register .. v$register }, $OVERLAY->music(Landroid/widget/ImageView;)V")
        }
        println("Afterglow overlay title=${heading.method.definingClass}, actions=${actions.method.definingClass}, watermark=${watermark.method.definingClass}")
    }
}
