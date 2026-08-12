package app.template.patches.bplace

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

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
        app.morphe.patcher.string("android.permission.CAMERA"),
        app.morphe.patcher.methodCall(
            definingClass = "LS1/c;",
            name = "checkSelfPermission"
        )
    )
)