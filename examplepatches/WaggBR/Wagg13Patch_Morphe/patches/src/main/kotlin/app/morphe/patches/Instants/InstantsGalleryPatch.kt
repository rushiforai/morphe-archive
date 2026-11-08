package app.morphe.patches.instants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Gallery upload: a gallery button on the camera screen; the picked image replaces the captured
 * photo on the next shutter press, so it is posted through the app's own pipeline.
 * Part of [instantsModPatch].
 */
val instantsGalleryPatch = bytecodePatch {  // unnamed: only loaded through [instantsModPatch]
    compatibleWith(INSTANTS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")
    dependsOn(instantsActivityPatch)

    execute {
        // 1) The camera's control buttons are composed only while the camera is on screen: use that
        //    as the signal to attach the gallery button. No parameter is read, so no registers.
        CameraControlButtonFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->onCameraComposed()V
            """.trimIndent(),
        )

        // 2) The "photo captured" callback receives the captured Bitmap as its first argument. Right
        //    after it is cast, swap it for the picked image (the helper returns the same bitmap when
        //    no image is pending). Everything downstream - the posted photo, the thumbnails and the
        //    archive peek animation - then works from the picked image.
        val captured = CapturedPhotoFingerprint.method
        val capturedInstructions = captured.implementation!!.instructions
        val castIndex = capturedInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CHECK_CAST &&
                ((instruction as ReferenceInstruction).reference as TypeReference).type == "Landroid/graphics/Bitmap;"
        }
        check(castIndex >= 0) { "Instants: captured bitmap cast not found" }
        val bitmapRegister = (capturedInstructions[castIndex] as OneRegisterInstruction).registerA
        captured.addInstructions(
            castIndex + 1,
            """
            invoke-static/range {v$bitmapRegister .. v$bitmapRegister}, $GALLERY_HELPER->substituteCaptured(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
            move-result-object v$bitmapRegister
            """.trimIndent(),
        )

        // 3) Video: when a recording ends, the pipeline works from the recorded File (thumbnail,
        //    archive peek, upload; the size, duration and rotation are read from the file). Swap it
        //    for the video picked from the gallery. The constructor also receives the video's two
        //    dimensions as reported by the recorder; the helper keeps them consistent.
        val video = VideoRecordedFingerprint.method
        val videoTypes = video.parameterTypes.map { it.toString() }
        val fileIndex = videoTypes.indexOf("Ljava/io/File;")
        val sizeIndexes = videoTypes.withIndex().filter { (index, type) -> index > fileIndex && type == "I" }.map { it.index }
        check(fileIndex >= 0 && sizeIndexes.size >= 2) { "Instants: unexpected video recorded constructor" }
        // Non-static constructor: parameter N is register pN + 1 (p0 is this).
        val fileRegister = "p${fileIndex + 1}"
        val sizeA = "p${sizeIndexes[0] + 1}"
        val sizeB = "p${sizeIndexes[1] + 1}"
        video.addInstructions(
            0,
            """
            invoke-static {$fileRegister, $sizeA, $sizeB}, $GALLERY_HELPER->substituteVideo(Ljava/io/File;II)Ljava/io/File;
            move-result-object $fileRegister
            invoke-static {$sizeA}, $GALLERY_HELPER->videoSizeA(I)I
            move-result $sizeA
            invoke-static {$sizeB}, $GALLERY_HELPER->videoSizeB(I)I
            move-result $sizeB
            """.trimIndent(),
        )

        // 4) Hide the gallery button outside the camera. The navigator wrapper reports every route
        //    change; the helper shows the button only while the Home route is on top.
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
        val backInstructions = back.implementation!!.instructions
        val moveResult = (backIndex + 1 until backInstructions.size).first {
            backInstructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
        }
        val routeRegister = (backInstructions[moveResult] as OneRegisterInstruction).registerA
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
