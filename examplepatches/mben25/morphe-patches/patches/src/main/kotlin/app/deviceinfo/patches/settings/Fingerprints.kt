package app.deviceinfo.patches.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/**
 * `DonateActivity.onCreate` - the activity class is not obfuscated. Its first call is the
 * `invoke-super/range` to the base activity's `onCreate(Bundle)`, which must run before
 * `finish()` or the framework throws `SuperNotCalledException`.
 */
object DonateActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ytheekshana/deviceinfo/DonateActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
    filters = listOf(
        methodCall(
            name = "onCreate",
            parameters = listOf("Landroid/os/Bundle;"),
        ),
    ),
)
