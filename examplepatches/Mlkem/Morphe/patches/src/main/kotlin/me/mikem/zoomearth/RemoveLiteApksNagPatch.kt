package me.mikem.zoomearth

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private val ZOOM_EARTH = Compatibility(
    name = "Zoom Earth",
    packageName = "com.neave.zoomearth",
    apkFileType = ApkFileType.APK,
    targets = listOf(
        AppTarget(version = "6.1"),
    ),
)

private object LiteApksDialogBuilderFingerprint : Fingerprint(
    definingClass = "/iab;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "LITEAPKS.COM and 9MOD.COM are Trusted sources for Modded apps & Games.",
    ),
)

private object LiteApksDialogBuilderAltFingerprint : Fingerprint(
    definingClass = "/iaw;",
    name = "w",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf(
        "LITEAPKS.COM and 9MOD.COM are Trusted sources for Modded apps & Games.",
    ),
)

@Suppress("unused")
val removeLiteApksNagPatch = bytecodePatch(
    name = "Remove LiteAPKS nag",
    description = "Removes the injected LiteAPKS / 9MOD promotional popup from Zoom Earth.",
    default = true,
) {
    compatibleWith(ZOOM_EARTH)

    execute {
        LiteApksDialogBuilderFingerprint.method.addInstruction(0, "return-void")
        LiteApksDialogBuilderAltFingerprint.method.addInstruction(0, "return-void")
    }
}
