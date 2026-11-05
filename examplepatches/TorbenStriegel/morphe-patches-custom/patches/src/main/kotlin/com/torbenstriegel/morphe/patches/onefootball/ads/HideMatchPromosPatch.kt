package com.torbenstriegel.morphe.patches.onefootball.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.torbenstriegel.morphe.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL

private val featureFlags = Fingerprint(
    definingClass = "Lcom/onefootball/core/flutter/methodhandlers/FeatureFlagsMethodHandler;",
    name = "handle", returnType = "V",
    parameters = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;")
)

private fun BytecodePatchContext.overrideFlutterFlag(key: String, value: String) {
    val method = featureFlags.method
    val implementation = method.implementation ?: throw PatchException("Missing Flutter feature flag handler body")
    if (implementation.registerCount != 5) throw PatchException("Unexpected Flutter feature flag handler registers")
    val before = implementation.instructions.count { it.opcode != Opcode.NOP }
    method.addInstructionsWithLabels(0, """
        iget-object v0, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
        const-string v1, "remoteConfigValue"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :original
        const-string v0, "key"
        invoke-virtual {p1, v0}, Lio/flutter/plugin/common/MethodCall;->argument(Ljava/lang/String;)Ljava/lang/Object;
        move-result-object v0
        const-string v1, "$key"
        invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v1
        if-eqz v1, :original
        const-string v0, "$value"
        invoke-interface {p2, v0}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->success(Ljava/lang/Object;)V
        return-void
    """.trimIndent(), ExternalLabel("original", method.getInstruction(0)))
    val added = implementation.instructions.count { it.opcode != Opcode.NOP } - before
    if (added != 15) throw PatchException("Incomplete feature flag injection for $key: $added/15")
}

@Suppress("unused")
val hideMatchShopPatch = bytecodePatch(
    name = "Hide match FanShop promotions",
    description = "Hides the FanShop product carousel on the match overview."
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)
    execute { overrideFlutterFlag("marketplace_match_overview", "disabled") }
}

@Suppress("unused")
val hideMatchBettingPatch = bytecodePatch(
    name = "Hide match betting odds",
    description = "Disables bookmaker betting cards and odds on the match overview while retaining match predictions."
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)
    execute {
        overrideFlutterFlag("betting_card_enabled", "false")
        overrideFlutterFlag("legacy_betting_card_enabled", "disabled")
    }
}
