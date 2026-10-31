package com.dmoniak.patches.shazam

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SHAZAM
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val shazamAlwaysOnAutoPatch = bytecodePatch(
    name = "Always-On Auto Shazam - Shazam (Experimental)",
    description = "Keeps Auto Shazam background listening continuously active without automatic timeout cancellation or sleep limits.",
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeShazamAlwaysOnAutoLogic(logger)
    }
}

fun BytecodePatchContext.executeShazamAlwaysOnAutoLogic(logger: Logger) {
    logger.info("Executing Always-On Auto Shazam patch for Shazam...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        // 1. Hook timeout scheduler classes implementing Lqe/a; (method b(params)V -> return-void)
        // This suppresses AlarmManager.set(...) of the AUTO_SHAZAM_TIMEOUT alarm
        if (classDef.interfaces.contains("Lqe/a;")) {
            for (method in classDef.methods.toList()) {
                if (method.name == "b" && method.returnType == "V") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = "return-void"
                        )
                        hookedPoints++
                        logger.info("[Shazam Auto] Neutralized timeout scheduler: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Shazam Auto] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. Hook PendingIntent providers for AUTO_SHAZAM_TIMEOUT
        var hasTimeoutString = false
        for (m in classDef.methods) {
            val impl = m.implementation ?: continue
            for (inst in impl.instructions) {
                if (inst is ReferenceInstruction) {
                    val ref = inst.reference
                    if (ref is StringReference && ref.string == "com.shazam.android.intent.actions.AUTO_SHAZAM_TIMEOUT") {
                        hasTimeoutString = true
                        break
                    }
                }
            }
            if (hasTimeoutString) break
        }

        if (hasTimeoutString) {
            for (method in classDef.methods.toList()) {
                if (method.returnType == "Landroid/app/PendingIntent;" && method.parameterTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Shazam Auto] Neutralized PendingIntent timeout provider: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Shazam Auto] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 3. Fallback generic timeout check hooks
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            if (!isStatic && (
                mName == "isautoshazamtimeooutenabled" ||
                mName == "isautoshazamtimedout" ||
                mName == "shouldpauseautoshazam" ||
                mName == "isbatterysaverpauseallowed"
            ) && retType == "Z") {
                try {
                    replaceMethod(
                        method = method,
                        registerCount = 2,
                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[Shazam Auto] Disabled auto-shazam pause/timeout: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Shazam Auto] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[Shazam Auto] Total always-on hooks applied: $hookedPoints")
}
