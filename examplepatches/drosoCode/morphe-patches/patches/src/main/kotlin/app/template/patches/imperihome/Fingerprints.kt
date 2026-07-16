package app.template.patches.imperihome

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object PremiumCheckFingerprint : Fingerprint(
    definingClass = "Lcom/imperihome/common/a/a;",
    name = "c",
    filters = listOf(
        string("com.environexus.nexusbridge.app"),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC),
)
