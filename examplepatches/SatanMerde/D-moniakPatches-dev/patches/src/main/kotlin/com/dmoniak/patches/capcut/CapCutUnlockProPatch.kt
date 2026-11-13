package com.dmoniak.patches.capcut

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT_ALT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val capCutUnlockProPatch = bytecodePatch(
    name = "Unlock Pro & VIP Effects - CapCut (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks CapCut Pro filters, VIP transitions, premium audio effects, high-bitrate export settings, and removes default ending watermark prompts by hooking VIP user entitlements and Google Play Billing.",
) {
    compatibleWith(COMPATIBILITY_CAPCUT, COMPATIBILITY_CAPCUT_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCapCutUnlockProLogic(logger)
    }
}

fun BytecodePatchContext.executeCapCutUnlockProLogic(logger: Logger) {
    logger.info("Executing Unlock Pro & VIP Effects patch for CapCut (verified on v20.0.0)...")
    var hookedPoints = executeGooglePlayBillingBypass(logger, "CapCut")

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("lkotlin/") || tl.startsWith("landroidx/") || tl.startsWith("landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // =========================================================================
        // 1. Direct Architecture Hooks: Root Subscription & Proxy Classes
        //    - Lcom/vega/subscribe/SubscribeImpl;
        //    - Lcom/lemon/editor/proxy/SubscribeImpl;
        //    - Lcom/lemon/editor/proxy/PayVipImpl;
        //    - Lcn/capcut/ad/api/IUserProvider;
        // =========================================================================
        val isCoreSubscriptionClass = type.contains("/SubscribeImpl;") ||
            type.contains("/PayVipImpl;") ||
            type.contains("UnifiedAdKMPInit") ||
            type.contains("IUserProvider;")

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // Core class specific overrides
            if (isCoreSubscriptionClass) {
                // isVip() -> true
                if (!isStatic && pTypes.isEmpty() && retType == "Z" && mName == "isvip") {
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
                        logger.fine("[CapCut Pro Core] Hooked core VIP getter: $type->${method.name}")
                        continue
                    } catch (e: Exception) {
                        logger.warning("[CapCut Pro Core] Failed to hook $type->${method.name}: ${e.message}")
                    }
                }

                // c() -> Boolean.TRUE (boxed Boolean getter in SubscribeImpl / ISubscribe)
                if (!isStatic && pTypes.isEmpty() && retType == "Ljava/lang/Boolean;" && mName == "c") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                            return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.fine("[CapCut Pro Core] Hooked boxed Boolean VIP getter: $type->${method.name}")
                        continue
                    } catch (e: Exception) {
                        logger.warning("[CapCut Pro Core] Failed to hook $type->${method.name}: ${e.message}")
                    }
                }

                // v() -> Tier level 2 (Pro/VIP member tier in SubscribeImpl / ISubscribe)
                if (!isStatic && pTypes.isEmpty() && retType == "I" && mName == "v") {
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
                        logger.fine("[CapCut Pro Core] Hooked VIP tier level getter: $type->${method.name}")
                        continue
                    } catch (e: Exception) {
                        logger.warning("[CapCut Pro Core] Failed to hook $type->${method.name}: ${e.message}")
                    }
                }
            }

            // =========================================================================
            // 2. Universal Pro / VIP Status & Feature Getters
            // =========================================================================
            // VIP / Pro status getters returning boolean -> true
            if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                mName == "isvip" || mName == "isvipuser" || mName == "isvipexport" ||
                mName == "isvipdraft" || mName == "ispro" || mName == "isprouser" ||
                mName == "haspro" || mName == "hasvip" || mName == "isvipmember" ||
                mName == "ispromember" || mName == "checkvipstatus" || mName == "getisvip" ||
                mName == "issubscriptionactive" || mName == "isproversion" || mName == "isvalidvip"
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
                    logger.fine("[CapCut Pro] Hooked Pro status getter: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Pro] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // Expiration checks returning boolean -> false
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
                    logger.fine("[CapCut Pro] Hooked expiration check: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Pro] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // VIP / Pro tier level returning int -> 2 (Pro tier)
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
                    logger.fine("[CapCut Pro] Hooked tier level getter: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Pro] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // Expiration timestamp returning long -> far future (0x7fffffffffffffffL)
            if (!isStatic && pTypes.isEmpty() && retType == "J" && (
                mName == "getexpiretime" || mName == "getexpiredate" || mName == "getvipexpiretime" ||
                mName == "getproexpiretime"
            )) {
                try {
                    mutableClass.replaceMethod(
                        method,
                        registerCount = 3,
                        smaliCode = """
                        const-wide v0, 0x7fffffffffffffffL
                        return-wide v0
                        """.trimIndent()
                    )
                    hookedPoints++
                    logger.fine("[CapCut Pro] Hooked expiration timestamp: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Pro] Failed to hook $type->${method.name}: ${e.message}")
                }
            }

            // Feature and 4K export checks -> true
            if (!isStatic && retType == "Z" && (
                mName == "isprofeature" || mName == "isfeatureunlocked" || mName == "canuseproeffect" ||
                mName == "isprotemplate" || mName == "canexportin4k" || mName == "getenablegetdraftjsonwithoutwatermarkasync"
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
                    logger.fine("[CapCut Pro] Hooked feature access check: $type->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[CapCut Pro] Failed to hook $type->${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[CapCut Pro] Total Pro & VIP hooks applied: $hookedPoints")
}
