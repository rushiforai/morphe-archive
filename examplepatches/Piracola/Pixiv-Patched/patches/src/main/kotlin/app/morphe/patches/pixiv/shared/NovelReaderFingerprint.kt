package app.morphe.patches.pixiv.shared

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val NOVEL_TEXT_ACTIVITY = "Ljp/pxv/android/feature/novelviewer/noveltext/NovelTextActivity;"

/**
 * `WebViewClient.onPageFinished` of the client Pixiv attaches to the novel reader's WebView.
 *
 * Pixiv folds every in-app web view into one compiled client class that dispatches on a stored tag,
 * so a second, trimmed client with the same callback sits next to it. Only this one knows the novel
 * reader screen, and the class name itself is renamed with each release.
 */
internal val novelReaderPageFinishedFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/webkit/WebView;", "Ljava/lang/String;")
    custom { method, _ ->
        method.name == "onPageFinished" &&
            method.implementation?.instructions?.any { instruction ->
                (instruction as? ReferenceInstruction)?.reference.let {
                    it is TypeReference && it.type == NOVEL_TEXT_ACTIVITY
                }
            } == true
    }
}
