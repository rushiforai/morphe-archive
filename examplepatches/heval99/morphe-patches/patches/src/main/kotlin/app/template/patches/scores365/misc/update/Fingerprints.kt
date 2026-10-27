package app.template.patches.scores365.misc.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The startup flow (R8-renamed) restarts the launch activity with the boolean extra
// "ForceUpdateDialog" (server says this version is too old) or "NewVersionPopup" (a newer version
// exists). The two readable base activities read those extras in onCreate and show the
// full-screen update block or the update popup.
internal object BaseActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(
        string("ForceUpdateDialog", StringComparisonType.CONTAINS),
        string("NewVersionPopup", StringComparisonType.CONTAINS),
    ),
)

internal object BaseActionBarActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActionBarActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    strings = listOf(
        string("ForceUpdateDialog", StringComparisonType.CONTAINS),
        string("NewVersionPopup", StringComparisonType.CONTAINS),
    ),
)
