package app.template.patches.lockmeout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object IsPremiumLicenseCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "Landroid/content/Context;",
        "Z", "Z", "Z",
        "Lcom/teqtic/lockmeout/utils/PreferencesProvider\$a;",
        "Lcom/teqtic/lockmeout/utils/PreferencesProvider\$a\$a;"
    ),
    filters = listOf(
        string("GPPSAUPC()"),
        string("Online check attempted"),
        string("hP: ")
    )
)
