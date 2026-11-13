package com.dmoniak.patches.mtmanager

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MT_MANAGER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val mtManagerUnlockVIPPatch = bytecodePatch(
    name = "Unlock VIP Features and Themes - MT Manager (Experimental)",
    description = "Unlocks MT Manager VIP capabilities (batch rename, advanced DEX and Arsc editors, syntax highlighting, XML text search and replace, VIP themes) by hooking VIP privilege getters, expiration checks, and Google Play Billing. WARNING: MT Manager incorporates native MTProtect anti-tamper (libmtprotect.so).",
) {
    compatibleWith(COMPATIBILITY_MT_MANAGER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMTManagerUnlockVIPLogic(logger)
    }
}

fun BytecodePatchContext.executeMTManagerUnlockVIPLogic(logger: Logger) {
    logger.info("Executing Unlock VIP patch for MT Manager...")
    var hookedPoints = 0

    // 1. Universal Google Play Billing SDK bypass
    hookedPoints += executeGooglePlayBillingBypass(logger, "MTManager")

    // 2. MT Manager VIP privilege and expiration getters
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (!tl.startsWith("lkotlin/") && !tl.startsWith("landroidx/") && !tl.startsWith("landroid/")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType
                val pTypes = method.parameterTypes

                // 2a. VIP Status Checkers (isVip, isVIP, isVipUser, hasVip, hasPrivilege) -> true
                if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                    mName == "isvip" ||
                    mName == "isvipuser" ||
                    mName == "hasvip" ||
                    mName == "hasprivilege" ||
                    mName == "checkvip" ||
                    mName == "isviplevel" ||
                    mName == "isvipactive"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager VIP] Hooked VIP getter -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager VIP] Failed to hook VIP getter ${classDef.type}->${method.name}: ${e.message}")
                    }
                }

                // 2b. VIP Expiration Checkers (isExpired, isVipExpired) -> false
                if (!isStatic && pTypes.isEmpty() && retType == "Z" && (
                    mName == "isexpired" ||
                    mName == "isvipexpired"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager VIP] Hooked expiration check -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager VIP] Failed to hook expiration check ${classDef.type}->${method.name}: ${e.message}")
                    }
                }

                // 2c. VIP Tier / Type (getVipType, getVipLevel) -> 1
                if (!isStatic && pTypes.isEmpty() && retType == "I" && (
                    mName == "getviptype" ||
                    mName == "getviplevel" ||
                    mName == "getmembershiplevel"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager VIP] Hooked VIP level getter -> 1: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager VIP] Failed to hook VIP level getter ${classDef.type}->${method.name}: ${e.message}")
                    }
                }

                // 2d. VIP Expiration Timestamp -> Max value (forever valid)
                if (!isStatic && pTypes.isEmpty() && retType == "J" && (
                    mName == "getvipexpiretime" ||
                    mName == "getexpiretime" ||
                    mName == "getexpiredate"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const-wide v0, 0x7fffffffffffffffL
                                return-wide v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager VIP] Hooked VIP timestamp getter: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager VIP] Failed to hook VIP timestamp getter ${classDef.type}->${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MTManager VIP] Total VIP hooks applied: $hookedPoints")
}
