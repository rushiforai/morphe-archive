package com.dmoniak.patches.hideme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HIDEME
import java.util.logging.Logger

@Suppress("unused")
val hideMeBypassDataLimitPatch = bytecodePatch(
    name = "Bypass Free Data Cap & Bandwidth Throttling - hide.me VPN (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Overrides free plan data transfer limit counters, prevents speed throttling upon quota exhaustion, and maintains unlimited traffic in hide.me VPN.",
) {
    compatibleWith(COMPATIBILITY_HIDEME)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHideMeBypassDataLimitLogic(logger)
    }
}

fun BytecodePatchContext.executeHideMeBypassDataLimitLogic(logger: Logger) {
    logger.info("Executing Bypass Data Cap patch for hide.me VPN...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Data limit reached check -> false
            if (!isStatic && (
                mName == "isdatalimitreached" ||
                mName == "isquotaexceeded" ||
                mName == "hasreachedmonthlylimit" ||
                mName == "isbandwidthcapped"
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
                    logger.info("[hide.me Data] Disabled quota exceeded check in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[hide.me Data] Failed to hook ${method.name}: ${e.message}")
                }
            }

            // 2. Unlimited data flag -> true
            if (!isStatic && (
                mName == "hasunlimiteddata" ||
                mName == "isunlimitedplan" ||
                mName == "canbypasstransferlimit"
            ) && retType == "Z") {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.info("[hide.me Data] Forced unlimited plan flag in: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[hide.me Data] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }
    logger.info("[hide.me Data] Total data limit bypass hooks applied: $hookedPoints")
}
