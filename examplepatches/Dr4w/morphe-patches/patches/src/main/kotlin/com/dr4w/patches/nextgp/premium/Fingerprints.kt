package com.dr4w.patches.nextgp.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

object ForceUpdateBypassFingerprint : Fingerprint(
    definingClass = "Lcom/jscti/commons/ui/premium/PremiumState;",
    name = "forceUpdateBypass",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Z")
)