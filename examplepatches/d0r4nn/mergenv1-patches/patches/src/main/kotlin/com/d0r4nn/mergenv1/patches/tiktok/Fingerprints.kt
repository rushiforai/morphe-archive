package com.d0r4nn.mergenv1.patches.tiktok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

internal object AwemeHostApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/app/host/AwemeHostApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_SUPER,
            definingClass = "Landroid/app/Application;",
            name = "onCreate"
        )
    )
)
