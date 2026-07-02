package app.template.patches.analytics.vpnchecker

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object VpnCheckerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(8192),
        methodCall(
            definingClass = "Ljava/lang/Math;",
            name = "max"
        ),
        string("127.0.0.1")
    )
)