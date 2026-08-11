package app.atharv.patches.olaelectric.docupload

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall

/**
 * The shared image/file picker helper's result-processing method for camera/gallery captures.
 * Its own class name is obfuscated in this app build, so it is matched structurally: by its
 * non-obfuscated parameter type (filepicker.customStartActivityResult.StartActivityForResultEnum,
 * which is not renamed) and by its Bitmap.compress() call, which is only reached by the
 * "capture with compression" branch that currently re-encodes at JPEG quality 0.
 */
object ImagePickerCompressResultFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(
        "Lfilepicker/customStartActivityResult/StartActivityForResultEnum;",
        "Landroid/content/Intent;",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Bitmap;", name = "compress"),
    ),
)

/**
 * DocumentBottomSheet rejects a picked document/photo outright once its size exceeds 6MB
 * (compared as a float literal, appears twice in the class: once for single-file picks and
 * once for multi-file picks). Class name is not obfuscated in this app build.
 */
object DocumentFileSizeLimitFingerprint : Fingerprint(
    definingClass = "Lcom/olaelectric/presentationv3/views/document/documentBottomSheet/DocumentBottomSheet;",
    filters = listOf(
        literal(6.0f),
    ),
)
