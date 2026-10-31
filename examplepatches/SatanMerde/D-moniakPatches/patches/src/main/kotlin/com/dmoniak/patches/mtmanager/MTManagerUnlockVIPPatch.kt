package com.dmoniak.patches.mtmanager

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MT_MANAGER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val mtManagerUnlockVIPPatch = bytecodePatch(
    name = "Unlock VIP Features & Themes - MT Manager (Experimental)",
    description = "⚠️ [Experimental / Untested] Unlocks MT Manager VIP features (batch rename, DEX/Arsc editor++, syntax highlighting, XML/DEX search & replace, signature verification bypass, VIP theme customization) by hooking VIP privilege getters, expiration checks, and Google Play Billing.",
) {
    compatibleWith(COMPATIBILITY_MT_MANAGER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMTManagerUnlockVIPLogic(logger)
    }
}

fun BytecodePatchContext.executeMTManagerUnlockVIPLogic(logger: Logger) {
    logger.info("Executing Unlock VIP patch for MT Manager...")
    var hookedPoints = executeGooglePlayBillingBypass(logger, "MTManager")

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("lkotlin/") || tl.startsWith("landroidx/") || tl.startsWith("landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. VIP Status Checkers (isVip, isVIP, isVipUser, hasVip, hasPrivilege) -> true
            if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                mName == "isvip" || mName == "isvipuser" || mName == "hasvip" ||
                mName == "hasprivilege" || mName == "checkvip" || mName == "isviplevel"
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
                    logger.fine("[MTManager VIP] Hooked VIP getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MTManager VIP] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            // 2. VIP Expiration Checkers (isExpired, isVipExpired) -> false
            if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                mName == "isexpired" || mName == "isvipexpired"
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
                    logger.fine("[MTManager VIP] Hooked expiration check: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MTManager VIP] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            // 3. VIP Tier / Type (getVipType, getVipLevel) -> 1
            if (!isStatic && pTypes.isEmpty() && retType == "I" && (
                mName == "getviptype" || mName == "getviplevel"
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
                    logger.fine("[MTManager VIP] Hooked VIP level getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MTManager VIP] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }

            // 4. VIP Expiration Timestamp -> Max value (forever valid)
            if (!isStatic && pTypes.isEmpty() && retType == "J" && (
                mName == "getvipexpiretime" || mName == "getexpiretime" || mName == "getexpiredate"
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
                    logger.fine("[MTManager VIP] Hooked VIP timestamp getter: ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.warning("[MTManager VIP] Failed to hook ${classDef.type}->${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[MTManager VIP] Total VIP hooks applied: $hookedPoints")
}

