package com.dmoniak.patches.bbr

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BEACH_BUGGY_RACING
import java.util.logging.Logger

@Suppress("unused")
val bbrInfiniteTicketsPatch = bytecodePatch(
    name = "Infinite Race Tickets - Beach Buggy Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Prevents race ticket depletion in Beach Buggy Racing, allowing unlimited participation in Career events and Championships without waiting for ticket recharge. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_BEACH_BUGGY_RACING)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBBRInfiniteTicketsLogic(logger)
    }
}

fun BytecodePatchContext.executeBBRInfiniteTicketsLogic(logger: Logger) {
    logger.info("Executing Infinite Race Tickets patch for Beach Buggy Racing...")
    var ticketCount = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Check if player has tickets / can race -> always true
            if (!isStatic && (
                mName == "hastickets" ||
                mName == "hasenoughtickets" ||
                mName == "canrace" ||
                mName == "isticketavailable"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    ticketCount++
                    logger.info("[BBR] Hooked ticket check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BBR] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Consume / spend ticket -> no-op return-void
            if (!isStatic && (
                mName == "consumeticket" ||
                mName == "spendticket" ||
                mName == "decreasetickets" ||
                mName == "useticket"
            ) && retType == "V") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        return-void
                        """.trimIndent()
                    )
                    ticketCount++
                    logger.info("[BBR] Hooked ticket deduction: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BBR] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 3. Current ticket count -> return 5 (maximum tickets)
            if (!isStatic && (
                mName == "getnumtickets" ||
                mName == "getticketcount" ||
                mName == "getcurrenttickets" ||
                mName == "gettickets"
            ) && retType == "I" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x5
                        return v0
                        """.trimIndent()
                    )
                    ticketCount++
                    logger.info("[BBR] Hooked ticket getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BBR] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[BBR] Infinite Race Tickets: $ticketCount method(s) hooked.")
}
