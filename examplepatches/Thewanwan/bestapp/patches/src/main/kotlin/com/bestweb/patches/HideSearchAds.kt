package com.bestweb.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

val hideSearchAds = bytecodePatch(
    name = "Hide search ads",
    description = "Blocks search result ads and video ads in the discover/search tab",
    default = true
) {
    compatibleWith(WEIBO_COMPATIBILITY)

    execute {
        val searchAdCallbackFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/page/SearchResultActivity\$4;",
            returnType = "V",
            parameters = listOf("Lcom/sina/weibo/models/SearchAdParentBean;")
        )

        searchAdCallbackFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        val videoAdRenderFingerprint = Fingerprint(
            definingClass = "Lcom/sina/weibo/page/SearchResultActivity;",
            returnType = "V",
            parameters = listOf("Lcom/sina/weibo/models/SearchAdBean;")
        )

        videoAdRenderFingerprint.method.apply {
            addInstructions(0, "return-void")
        }
    }
}
