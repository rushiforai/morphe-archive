package app.template.patches.bplace

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object WebViewClientFingerprint : Fingerprint(
    definingClass = "LA5/k1;", // addefiningClass = "LA5/C0123k1;", // adjust once you confirm the full smali path
    name = "onPageStarted",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;"),
)