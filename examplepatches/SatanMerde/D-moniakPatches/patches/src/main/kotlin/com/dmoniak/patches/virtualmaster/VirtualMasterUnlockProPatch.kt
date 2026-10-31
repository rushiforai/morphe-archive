package com.dmoniak.patches.virtualmaster

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VIRTUAL_MASTER
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_VIRTUAL_MASTER_ALT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val virtualMasterUnlockProPatch = bytecodePatch(
    name = "Unlock Pro & Multi-Instance - Virtual Master (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks Virtual Master Pro edition, allowing unlimited virtual Android instances, root permission toggles, customized device ID spoofing, and advanced backup/restore by hooking MemberStatusResponse, obfuscated BillingManager gatekeepers, and Google Play Billing.",
) {
    compatibleWith(COMPATIBILITY_VIRTUAL_MASTER, COMPATIBILITY_VIRTUAL_MASTER_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeVirtualMasterUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeVirtualMasterUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro patch for Virtual Master...")
    var hookedPoints = executeGooglePlayBillingBypass(logger, "VirtualMaster")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("lkotlin/") || tl.startsWith("landroidx/") || tl.startsWith("landroid/support/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // =========================================================================
        // 1. Virtual Master MemberStatusResponse Model
        // =========================================================================
        if (tl.endsWith("/memberstatusresponse;")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType
                val pTypes = method.parameterTypes

                // getMemberStatus() -> String ("active")
                if (mName == "getMemberStatus" && retType == "Ljava/lang/String;" && pTypes.isEmpty()) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                            const-string v0, "active"
                            return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Virtual Master] Hooked MemberStatusResponse.getMemberStatus -> 'active'")
                    } catch (e: Exception) {
                        logger.warning("[Virtual Master] Failed to hook getMemberStatus: ${e.message}")
                    }
                }

                // getExpiresAt() -> Long (0x7fffffffffffffffL)
                if (mName == "getExpiresAt" && retType == "J" && pTypes.isEmpty()) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 4,
                            smaliCode = """
                            const-wide v0, 0x7fffffffffffffffL
                            return-wide v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Virtual Master] Hooked MemberStatusResponse.getExpiresAt -> permanent (max timestamp)")
                    } catch (e: Exception) {
                        logger.warning("[Virtual Master] Failed to hook getExpiresAt: ${e.message}")
                    }
                }
            }
        }

        // =========================================================================
        // 2. Obfuscated BillingManager (com/android/vmapp/billing/)
        // =========================================================================
        if (tl.contains("/vmapp/billing/")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                val retType = method.returnType
                val pTypes = method.parameterTypes

                // Hook all zero-arg boolean methods in vmapp/billing/ (isVip, hasSubscription, isLifetimeVip, etc.)
                if (retType == "Z" && pTypes.isEmpty() && mName != "equals") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.fine("[Virtual Master Billing] Hooked gatekeeper method: ${classDef.type}->${method.name}()Z -> true")
                    } catch (e: Exception) {
                        logger.warning("[Virtual Master Billing] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                    }
                }
            }
        }

        // =========================================================================
        // 3. General Pro / VIP Status Getters (Fallback & Standalone Builds)
        // =========================================================================
        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                mName == "ispro" || mName == "isvip" || mName == "ispremium" ||
                mName == "issubscribed" || mName == "haspro" || mName == "isvipuser" ||
                mName == "isvalidvip" || mName == "isproversion" || mName == "checkpro" ||
                mName == "ismember" || mName == "hasmembership"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Pro] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                mName == "isexpired" || mName == "isvipexpired" || mName == "isproexpired"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                        const/4 v0, 0x0
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Pro] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            if (!isStatic && pTypes.isEmpty() && retType == "I" && (
                mName == "getviplevel" || mName == "getprolevel" || mName == "getusertype" ||
                mName == "getviptype" || mName == "getmembertype"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                        const/4 v0, 0x2
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Pro] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            if (!isStatic && pTypes.isEmpty() && retType == "J" && (
                mName == "getexpiretime" || mName == "getexpiredate" || mName == "getvipexpiretime"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 4,
                        smaliCode = """
                        const-wide v0, 0x7fffffffffffffffL
                        return-wide v0
                        """.trimIndent()
                    )
                    hookedPoints++
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Pro] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            if (!isStatic && pTypes.isEmpty() && retType == "I" && (
                mName == "getmaxinstancecount" || mName == "getinstancelimit" || mName == "getmaxclones"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 2,
                        smaliCode = """
                        const/16 v0, 0x64
                        return v0
                        """.trimIndent()
                    )
                    hookedPoints++
                } catch (e: Exception) {
                    logger.warning("[Virtual Master Pro] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Virtual Master Pro] Total Pro hooks applied: $hookedPoints")
}
