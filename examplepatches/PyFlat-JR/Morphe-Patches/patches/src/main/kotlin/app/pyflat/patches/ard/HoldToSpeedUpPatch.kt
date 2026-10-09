package app.pyflat.patches.ard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.pyflat.patches.shared.findFieldStore
import app.pyflat.patches.shared.holdToSpeedUpPatch

private const val EXTENSION_CLASS = "Lapp/pyflat/extension/ard/HoldToSpeedUpPatch;"

internal val COMPATIBILITY_ARD = Compatibility(
    name = "ARD Mediathek",
    packageName = "de.swr.avp.ard",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x003D8F,
    targets = listOf(
        AppTarget(version = "12.4.1"),
    ),
)

// de.swr.ardplayer.lib.a, the player view that creates the controls WebView.
internal object PlayerViewConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("createWebView"),
)

@Suppress("unused")
val holdToSpeedUpPatch = holdToSpeedUpPatch(COMPATIBILITY_ARD, EXTENSION_CLASS) {
    PlayerViewConstructorFingerprint.method.apply {
        val (index, webViewRegister) = findFieldStore("Landroid/webkit/WebView;")

        addInstruction(
            index + 1,
            "invoke-static { v$webViewRegister }, $EXTENSION_CLASS->install(Landroid/webkit/WebView;)V",
        )
    }
}
