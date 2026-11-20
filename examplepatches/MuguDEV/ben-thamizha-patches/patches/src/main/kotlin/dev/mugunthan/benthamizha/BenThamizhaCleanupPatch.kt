package dev.mugunthan.benthamizha

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private val BEN_THAMIZHA_COMPATIBILITY = Compatibility(
    name = "Ben Thamizha",
    packageName = "com.ben.thamizha",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x000000,
    targets = listOf(AppTarget(version = "1.0"))
)

private fun Fingerprint.replaceBody(registerCount: Int, smali: String) {
    val original = method
    val replacement = ImmutableMethod(
        original.definingClass,
        original.name,
        original.parameters,
        original.returnType,
        original.accessFlags,
        original.annotations,
        original.hiddenApiRestrictions,
        MutableMethodImplementation(registerCount)
    ).toMutable().apply {
        addInstructions(0, smali)
    }

    classDef.methods.apply {
        remove(original)
        add(replacement)
    }
}

@Suppress("unused")
val benThamizhaCleanupPatch = patch(
    name = "Disable ad checks",
    description = "Disables native and JavaScript ad-block detection without changing playback or navigation.",
    default = true
) {
    compatibleWith(BEN_THAMIZHA_COMPATIBILITY)

    execute {
        CheckAdBlockFingerprint.replaceBody(1, "return-void")
        IsAdBlockerActiveFingerprint.replaceBody(
            1,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        ShowAdBlockDialogFingerprint.replaceBody(1, "return-void")
        JavaScriptAdCheckFingerprint.replaceBody(
            3,
            """
                invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
                return-void
            """
        )
    }
}
