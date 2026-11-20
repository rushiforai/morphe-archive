/*
 * Meta Patches — fingerprints of the main app's Instants camera.
 *
 * The gallery-upload mechanism is the one of the Instants Mod for
 * Instagram Instants (ported from Wagg13Patch_Morphe
 * (https://github.com/WaggBR/Wagg13Patch_Morphe) by Wagg13, GPL-3); this
 * patch applies it to the main Instagram app. The main app keeps the
 * Instants camera classes unobfuscated but strips their Compose trace
 * strings, so unlike the Instants app the fingerprints here are structural:
 * they anchor on kept class names and on what a method does with its
 * arguments. Verified against Instagram 457.0.0.0.26.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.instantsupload

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private fun Method.instructionsOrNull(): List<Instruction>? = implementation?.instructions?.toList()

// The main activity hosting the Instants camera. It declares no onCreate of
// its own; the base activity of Instagram's fragment activities does, and it
// is where the extension records the current activity.
internal object InstagramActivityFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/base/activity/BaseFragmentActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

// Creation of the camera's view model: the only place in the app that
// instantiates QuickSnapCameraViewModel (its factory runs on the UI thread
// when the camera screen opens, which is the signal to show the gallery
// button — the main app has no route object for the camera).
internal object CameraViewModelFactoryFingerprint : Fingerprint(
    custom = { method, _ ->
        method.instructionsOrNull()?.any { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == CAMERA_VIEW_MODEL
        } == true
    },
)

// The camera's "photo captured" callback: the only 8-argument lambda invoking
// the view model's captured-photo step (Context, Bitmap, ViewModel, String).
// The video callback invokes the same step with a thumbnail but has a single
// argument (invokeSuspend), so the parameters disambiguate.
internal object CapturedPhotoFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = List(8) { "Ljava/lang/Object;" },
    custom = { method, _ ->
        method.instructionsOrNull()?.any { instruction ->
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ((instruction as ReferenceInstruction).reference as? MethodReference).let { reference ->
                    reference != null && reference.definingClass == CAMERA_VIEW_MODEL &&
                        reference.parameterTypes.map { it.toString() } == listOf(
                            "Landroid/content/Context;",
                            "Landroid/graphics/Bitmap;",
                            CAMERA_VIEW_MODEL,
                            "Ljava/lang/String;",
                        )
                }
        } == true
    },
)

private const val VIDEO_RECORDED_PREFIX =
    "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel\$onVideoRecorded\$"

// Constructor of the coroutine that runs when a video recording ends. It holds
// the recorded file, which the rest of the pipeline (thumbnail, upload) works
// from; the video's size is read from the file later. Same shape as in the
// Instants app.
internal object VideoRecordedFingerprint : Fingerprint(
    name = "<init>",
    custom = { method, classDef ->
        classDef.type.startsWith(VIDEO_RECORDED_PREFIX) &&
            method.parameterTypes.any { it.toString() == "Ljava/io/File;" }
    },
)

// The camera view model's lifecycle end: the only zero-argument method on the
// (kept-name) view model whose first instruction calls the same-named method
// of its base view model (the framework clear hook). Fires when the camera
// screen is destroyed — the signal to hide the gallery button.
internal object CameraClosedFingerprint : Fingerprint(
    definingClass = CAMERA_VIEW_MODEL,
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.instructionsOrNull()?.firstOrNull { instruction ->
            instruction.opcode == Opcode.INVOKE_SUPER &&
                (instruction as ReferenceInstruction).reference.let { reference ->
                    reference is MethodReference && reference.name == method.name &&
                        reference.definingClass != CAMERA_VIEW_MODEL
                }
        } != null
    },
)
