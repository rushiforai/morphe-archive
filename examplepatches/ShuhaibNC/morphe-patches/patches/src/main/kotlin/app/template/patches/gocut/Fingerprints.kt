package app.template.patches.gocut

import app.morphe.patcher.Fingerprint


object IsProFourFingerprint : Fingerprint(
    definingClass = "Lcom/videoedit/gocut/iap/abroad/IapRouterServiceImpl;",
    name = "isProUser",
    returnType = "Z",
    parameters = emptyList(),
)