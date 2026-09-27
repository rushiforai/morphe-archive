package com.dmoniak.patches.signal

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SIGNAL
import java.util.logging.Logger

@Suppress("unused")
val signalDisableTypingIndicatorsPatch = bytecodePatch(
    name = "Enhanced Privacy & Disable Typing - Signal (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents sending outgoing typing indicators and suppresses read receipt delivery confirmations for enhanced conversation privacy.",
) {
    compatibleWith(COMPATIBILITY_SIGNAL)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSignalDisableTypingIndicatorsLogic(logger)
    }
}

fun BytecodePatchContext.executeSignalDisableTypingIndicatorsLogic(logger: Logger) {
    logger.info("Executing Enhanced Privacy & Disable Typing patch for Signal...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // Hook typing indicator sending boolean
            if (!isStatic && (
                mName == "istypingindicatorsenabled" ||
                mName == "shouldsendtypingindicator" ||
                mName == "isreadreceiptsdeliveryallowed" ||
                mName == "canbroadcasttypingstatus"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Signal Privacy] Disabled typing / receipts in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[Signal Privacy] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Signal Enhanced Privacy] Total hooks applied: $hookedPoints")
}
