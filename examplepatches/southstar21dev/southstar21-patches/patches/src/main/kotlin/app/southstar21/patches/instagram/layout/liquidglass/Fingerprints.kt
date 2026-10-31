package app.southstar21.patches.instagram.layout.liquidglass

import app.morphe.patcher.Fingerprint

internal const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/liquidglass/LiquidGlassNavBarPatch;"

internal object BlurRadiusFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "blurRadiusDp",
    returnType = "I",
)

internal object RefractionStrengthFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "refractionPercent",
    returnType = "I",
)

internal object ExtendContentFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "extendContentBehindBar",
    returnType = "Z",
)

internal object EnforceTextureViewFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/ui/simplevideolayout/SimpleVideoLayout;",
    name = "getEnforceTextureView",
    returnType = "Z",
    parameters = listOf(),
)
