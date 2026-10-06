package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction

/**
 * Adds a native gallery button to Instants and feeds selected media through
 * the existing capture pipeline on the next shutter press.
 */
@Suppress("unused")
val instantsGalleryPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        MoonshotOnCreateFingerprint.method.addInstructions(
            0,
            """
            invoke-static/range {p0 .. p0}, $GALLERY_HELPER->setActivity(Landroid/app/Activity;)V
            """.trimIndent(),
        )

        // CameraControlButton is composed only while the camera controls are on screen
        // (it is used by the flash and flip buttons, not by the shutter). Use it purely as
        // a signal to attach the gallery button; no parameter is read, so no registers.
        CameraControlButtonFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->onCameraComposed()V
            """.trimIndent(),
        )

        // The selected Bitmap is stored by the extension. On the user's next real shutter
        // press, this hook substitutes it for both Bitmap inputs before QuickSnap's
        // existing processing begins.
        // p1/p2 are v17/v18 (registers=26, ins=10), hence move-object/from16.
        // The label is only referenced here: addInstructionsWithLabels defines it.
        QuickSnapProcessBitmapFingerprint.method.addInstructionsWithLabels(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->consumePendingBitmap()Landroid/graphics/Bitmap;
            move-result-object v0
            if-eqz v0, :instants_gallery_original
            move-object/from16 p1, v0
            move-object/from16 p2, v0
            """.trimIndent(),
            ExternalLabel("instants_gallery_original", QuickSnapProcessBitmapFingerprint.method.getInstruction(0)),
        )

        // The thumbnail that flies to the archive after posting is built by a separate step
        // from the same two Bitmap parameters; without this it would show the camera frame.
        // p1/p2 are v27/v28 (registers=43, ins=17); each gets its own copy because this step
        // draws on one and recycles the other.
        QuickSnapArchivePeekFingerprint.method.addInstructionsWithLabels(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->consumePendingBitmap()Landroid/graphics/Bitmap;
            move-result-object v0
            if-eqz v0, :instants_gallery_original
            move-object/from16 p1, v0
            invoke-static {v0}, $GALLERY_HELPER->duplicate(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
            move-result-object v0
            move-object/from16 p2, v0
            """.trimIndent(),
            ExternalLabel("instants_gallery_original", QuickSnapArchivePeekFingerprint.method.getInstruction(0)),
        )

        // Hide the gallery button outside the camera. The navigator wrapper reports every
        // route change; the helper shows the button only while the Home route is on top.
        val forward = NavigateForwardFingerprint.method
        val forwardIndex = forward.delegateCallIndex()
        forward.addInstructions(
            forwardIndex + 1,
            """
            invoke-static {p1}, $GALLERY_HELPER->onRoute(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val back = NavigateBackFingerprint.method
        val backIndex = back.delegateCallIndex()
        // After the delegate pops, the wrapper reads the new top route into a register
        // (invoke-direct getter + move-result-object); report that route.
        val instructions = back.implementation!!.instructions
        val moveResult = (backIndex + 1 until instructions.size).first {
            instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
        }
        val routeRegister = (instructions[moveResult] as OneRegisterInstruction).registerA
        back.addInstructions(
            moveResult + 1,
            """
            invoke-static {v$routeRegister}, $GALLERY_HELPER->onRoute(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}


// Index of the call that forwards to the wrapped navigator: an invoke-interface with the same
// name as this method, on a different class.
private fun MutableMethod.delegateCallIndex(): Int {
    val index = implementation!!.instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_INTERFACE &&
            ((instruction as ReferenceInstruction).reference as MethodReference).let {
                it.name == name && it.definingClass != definingClass
            }
    }
    check(index >= 0) { "Instants: navigator delegate call not found in $name" }
    return index
}
