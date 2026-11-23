package app.template.patches.digisport.misc.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// MainActivityBase.checkUpdate() (merged into MainActivity, the manifest launcher activity, with
// Play Core's AppUpdateManager inlined since 1.1.16): asks Play for update info ("requestUpdateInfo
// (%s)" is Play Core's own log line) and, on success, starts the update flow. onCreate is its only
// caller, and it is the app's only update request.
internal val checkUpdateFingerprint = Fingerprint(
    definingClass = "Lro/rcsrds/digisport/ui/main/MainActivity;",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("requestUpdateInfo(%s)")),
    custom = { method, _ -> method.implementation != null },
)
