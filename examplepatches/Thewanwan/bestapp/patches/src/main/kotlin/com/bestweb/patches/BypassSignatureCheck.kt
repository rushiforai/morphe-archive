package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val bypassSignatureCheck = bytecodePatch(
    name = "Bypass signature check",
    description = "Bypass Weibo WBSecurity and SLib native signature verification",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        // 1. Skip WBSecurity$1.run() - the background thread that loads libslib.so,
        // calls native getSignature("weibo"), and compares against hardcoded signature.
        val wbSecurityRunFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/security/WBSecurity\$1;",
            returnType = "V",
            name = "run"
        )
        wbSecurityRunFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        // 2. Make SLib.checkV2() always return true.
        // Called by network engine; returns false if native signature check fails.
        val sLibCheckV2Fingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/security/SLib;",
            returnType = "Z",
            name = "checkV2"
        )
        sLibCheckV2Fingerprint.method.apply {
            addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """.trimIndent())
        }

        // 3. Make SLib.init() skip nativeInit but still set sInit = true.
        // nativeInit validates the signature internally; skipping it prevents
        // the check while sInit=true keeps checkV2() working.
        val sLibInitFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/security/SLib;",
            returnType = "V",
            name = "init"
        )
        sLibInitFingerprint.method.apply {
            addInstructions(0, """
                sget-object v0, Lcom/sina/weibo/security/SLib;->sLoadLibrarySuccess:Z
                if-eqz v0, :skip
                const/4 v0, 0x1
                sput-boolean v0, Lcom/sina/weibo/security/SLib;->sInit:Z
                :skip
                return-void
            """.trimIndent())
        }

        // 4. Bypass WBSecurity mCheck1/mCheck2 fields to always report success.
        // The needReportSoResult() method returns mCheck1 && isUnpackSuccess().
        // Setting mCheck1 = true prevents error reporting.
        val wbSecurityFieldFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/security/WBSecurity;",
            returnType = "Z",
            name = "needReportSoResult"
        )
        wbSecurityFieldFingerprint.method.apply {
            addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """.trimIndent())
        }
    }
}
