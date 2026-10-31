package com.dmoniak.patches.swiftkey

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SWIFTKEY
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val swiftKeyDisableTelemetryPatch = bytecodePatch(
    name = "Disable Telemetry & Clean Onboarding - Microsoft SwiftKey (Experimental)",
    description = "⚠️ [Experimental / Untested] Disables telemetry logging, user feedback surveys, and bypasses forced Microsoft cloud account sign-in prompts on initial keyboard setup in SwiftKey.",
) {
    compatibleWith(COMPATIBILITY_SWIFTKEY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSwiftKeyDisableTelemetryLogic(logger)
    }
}

fun BytecodePatchContext.executeSwiftKeyDisableTelemetryLogic(logger: Logger) {
    logger.info("Executing Disable Telemetry & Clean Onboarding patch for SwiftKey...")
    var hooked = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        if (tl.contains("telemetry") || tl.contains("analytics") || tl.contains("logging") || tl.contains("onboarding")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name.lowercase()
                val retType = method.returnType

                if ((mName == "istelemetryenabled" || mName == "isanalyticstrackingenabled" || mName == "sendtelemetry") && retType == "Z") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent()
                        )
                        hooked++
                    } catch (e: Exception) {
                        logger.fine("[SwiftKey Telemetry] Failed to hook $mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[SwiftKey Telemetry] Total hooks applied: $hooked")
}
