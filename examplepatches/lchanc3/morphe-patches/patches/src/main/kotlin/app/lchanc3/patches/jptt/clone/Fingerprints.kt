package app.lchanc3.patches.jptt.clone

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * `ImageUploadUtil.dispatchTakePictureIntent()`, which passes a hardcoded
 * FileProvider authority instead of deriving it from the package name.
 */
internal object DispatchTakePictureIntentFingerprint : Fingerprint(
    definingClass = "Lcom/joshua/jptt/picupload/ImageUploadUtil;",
    name = "dispatchTakePictureIntent",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "I"),
    filters = listOf(
        string("com.joshua.jptt.provider"),
        methodCall(
            smali = "Landroidx/core/content/FileProvider;->getUriForFile(" +
                "Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;",
            location = MatchAfterImmediately(),
        ),
    ),
)
