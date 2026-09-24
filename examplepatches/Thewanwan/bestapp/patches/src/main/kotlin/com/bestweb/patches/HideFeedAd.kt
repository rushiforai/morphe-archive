package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val hideFeedAd = bytecodePatch(
    name = "Hide feed ads",
    description = "Blocks feed ad resort by returning early from ADResortFlowService",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        val adResortFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/feedv2/flow/services/adresort/ADResortFlowService;",
            returnType = "V",
            parameters = listOf("Lcom/sina/weibo/feed/model/c;")
        )

        adResortFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
    }
}
