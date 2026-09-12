package app.asken.patches.restore

import app.morphe.patcher.Fingerprint

object AppClinitFingerprint : Fingerprint(
    definingClass = "Ljp/co/greenhouse/asken/App;",
    name = "<clinit>",
    returnType = "V",
    parameters = listOf()
)
