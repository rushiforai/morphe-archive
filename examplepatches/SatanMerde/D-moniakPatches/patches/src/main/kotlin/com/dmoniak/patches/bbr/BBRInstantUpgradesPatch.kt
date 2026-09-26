package com.dmoniak.patches.bbr

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_BEACH_BUGGY_RACING
import java.util.logging.Logger

@Suppress("unused")
val bbrInstantUpgradesPatch = bytecodePatch(
    name = "Instant Car Upgrades - Beach Buggy Racing (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Eliminates vehicle tuning delivery and upgrade wait timers in Beach Buggy Racing for immediate horsepower, acceleration, and handling boosts. (Experimental - Not yet tested on device).",
) {
    compatibleWith(COMPATIBILITY_BEACH_BUGGY_RACING)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeBBRInstantUpgradesLogic(logger)
    }
}

fun BytecodePatchContext.executeBBRInstantUpgradesLogic(logger: Logger) {
    logger.info("Executing Instant Car Upgrades patch for Beach Buggy Racing...")
    var upgradeCount = 0

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

            // 1. Upgrade remaining delivery time -> 0L
            if (!isStatic && (
                mName == "getupgradetimeleft" ||
                mName == "getdeliverytime" ||
                mName == "getremainingupgradetime" ||
                mName == "gettimeuntilupgrade"
            ) && retType == "J" && pTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const-wide/16 v0, 0x0
                        return-wide v0
                        """.trimIndent()
                    )
                    upgradeCount++
                    logger.info("[BBR] Hooked upgrade countdown timer: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BBR] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Is upgrade completed / ready -> always true
            if (!isStatic && (
                mName == "isupgradecomplete" ||
                mName == "isupgradedelivered" ||
                mName == "isreadyforupgrade" ||
                mName == "isdeliverydone"
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
                    upgradeCount++
                    logger.info("[BBR] Hooked upgrade completion status: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[BBR] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[BBR] Instant Car Upgrades: $upgradeCount method(s) hooked.")
}
