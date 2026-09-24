package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val hideSupergroup = bytecodePatch(
    name = "Hide supergroup",
    description = "Blocks supergroup from appearing in the home feed",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        val sgsFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/supergroup/i/c;",
            returnType = "Z",
            parameters = emptyList()
        )

        sgsFingerprint.method.apply {
            addInstructions(0, """
                invoke-static {}, Lcom/sina/weibo/module/ModulePrefs;->shouldHideSupergroup()Z
                move-result v0
                if-eqz v0, :skip
                const/4 v0, 0x0
                return v0
                :skip
            """.trimIndent())
        }
    }
}
