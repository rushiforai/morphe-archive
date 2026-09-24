package app.template.patches.ovicut

import app.morphe.patcher.Fingerprint

object IsProOneFingerprint : Fingerprint(
    definingClass = "Lcom/quvideo/vivacut/router/iap/a;",
    name = "m",
    returnType = "Z",
    parameters = emptyList(),
)

object IsProTwoFingerprint : Fingerprint(
    definingClass = "Lnt/d;",
    name = "b",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

object IsProThreeFingerprint : Fingerprint(
    definingClass = "Lcom/quvideo/vivacut/editor/controller/EditorHoverController;",
    name = "S5",
    returnType = "Z",
    parameters = emptyList(),
)

object IsProFourFingerprint : Fingerprint(
    definingClass = "Lcom/quvideo/vivacut/iap/IapRouterServiceImpl;",
    name = "isProUser",
    returnType = "Z",
    parameters = emptyList(),
)