package app.template.patches.bplace

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object OnShowFileChooserFingerprint : Fingerprint(
    definingClass = "LA5/h1;",
    name = "onShowFileChooser",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(
        "Landroid/webkit/WebView;",
        "Landroid/webkit/ValueCallback;",
        "Landroid/webkit/WebChromeClient\$FileChooserParams;"
    ),
    filters = listOf(
        string("android.permission.CAMERA"),
        methodCall(
            definingClass = "LS1/c;",
            name = "checkSelfPermission",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
            returnType = "I"
        )
    )
)

object OpenFileChooserFingerprint : Fingerprint(
    definingClass = "Lcom/bplace/MainActivity;",
    name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebChromeClient\$FileChooserParams;"),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebChromeClient\$FileChooserParams;",
            name = "isCaptureEnabled",
            returnType = "Z"
        )
    )
)
