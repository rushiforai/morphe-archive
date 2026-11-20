/*
 * Meta Patches — main Instagram: Instants camera gallery upload.
 *
 * Applies the Instants Mod gallery-upload mechanism (ported from
 * Wagg13Patch_Morphe (https://github.com/WaggBR/Wagg13Patch_Morphe) by
 * Wagg13, GPL-3) to the main Instagram app. The camera pipeline is the same
 * as in the Instants app (which this bundle already patches), so the hooks
 * are the same; only the button's visibility differs: the main app's camera
 * has no route object of its own, so the button's visibility is tracked
 * through the camera view model's lifecycle.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instantsupload

import app.hemk651.patches.shared.MetaCompatibilities
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * A gallery button on the Instants camera; the picked image replaces the captured
 * photo on the next shutter press, so it is posted through the app's own pipeline.
 * Unnamed: only loaded through [uploadInstantsFromGalleryPatch].
 */
internal val instantsUploadGalleryPatch = patch {
    compatibleWith(MetaCompatibilities.INSTAGRAM)
    extendWith("extensions/extension.mpe")
    dependsOn(instantsUploadActivityPatch)

    execute {
        // 1) The camera's view model is created only when the camera screen opens: show the
        //    gallery button then. No parameter is read, so no registers.
        CameraViewModelFactoryFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->onCameraOpened()V
            """.trimIndent(),
        )

        // 2) The camera's view model clear hook runs when the camera screen is destroyed: hide
        //    the gallery button until the camera opens again. No parameter is read.
        CameraClosedFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $GALLERY_HELPER->onCameraClosed()V
            """.trimIndent(),
        )

        // 3) The "photo captured" callback receives the captured Bitmap as its first argument.
        //    Right after it is cast, swap it for the picked image (the helper returns the same
        //    bitmap when no image is pending). Everything downstream - the compose step, the
        //    HQ still render (the render request carries the bitmap), the thumbnails and the
        //    archive peek animation - then works from the picked image.
        val captured = CapturedPhotoFingerprint.method
        val capturedInstructions = captured.implementation!!.instructions
        val castIndex = capturedInstructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.CHECK_CAST &&
                ((instruction as ReferenceInstruction).reference as TypeReference).type == "Landroid/graphics/Bitmap;"
        }
        check(castIndex >= 0) { "Instants upload: captured bitmap cast not found" }
        val bitmapRegister = (capturedInstructions[castIndex] as OneRegisterInstruction).registerA
        captured.addInstructions(
            castIndex + 1,
            """
            invoke-static/range {v$bitmapRegister .. v$bitmapRegister}, $GALLERY_HELPER->substituteCaptured(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
            move-result-object v$bitmapRegister
            """.trimIndent(),
        )

        // 4) Video: when a recording ends, the pipeline works from the recorded File (thumbnail,
        //    upload; the size is read from the file). Swap it for the video picked from the
        //    gallery. The constructor also receives the video's two dimensions as reported by
        //    the recorder; the helper keeps them consistent.
        val video = VideoRecordedFingerprint.method
        val videoTypes = video.parameterTypes.map { it.toString() }
        val fileIndex = videoTypes.indexOf("Ljava/io/File;")
        val sizeIndexes = videoTypes.withIndex().filter { (index, type) -> index > fileIndex && type == "I" }.map { it.index }
        check(fileIndex >= 0 && sizeIndexes.size >= 2) { "Instants upload: unexpected video recorded constructor" }
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
    }
}
