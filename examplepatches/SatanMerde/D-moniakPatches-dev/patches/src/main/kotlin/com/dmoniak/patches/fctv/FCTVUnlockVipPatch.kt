package com.dmoniak.patches.fctv

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV_TV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE_TV
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fctvUnlockVipPatch = bytecodePatch(
    name = "Unlock Permanent VIP & Activation - FCTV33 & RBTV+",
    description = "Bypasses activation lock codes, unlocks free VIP status, and lifts channel access restrictions on FCTV33 & RBTV+.",
) {
    compatibleWith(COMPATIBILITY_FCTV, COMPATIBILITY_FCTV_TV, COMPATIBILITY_RBLIVE, COMPATIBILITY_RBLIVE_TV)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFCTVUnlockVipLogic(logger)
    }
}

fun BytecodePatchContext.executeFCTVUnlockVipLogic(logger: Logger) {
    logger.info("Executing Unlock Permanent VIP & Activation patch for FCTV33...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        if (type.startsWith("Landroidx/") || type.startsWith("Landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. ActivationState in common state model
        if (type == "Lcom/rblive/common/model/state/ActivationState;") {
            for (method in classDef.methods.toList()) {
                if ((method.name == "getActivated" || method.name == "getFree") && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV VIP] Unlocked ActivationState->${method.name} = true")
                    } catch (e: Exception) {
                        logger.warning("[FCTV VIP] Failed to hook ActivationState->${method.name}: ${e.message}")
                    }
                }
            }
        }

        // 2. PBActivation protobuf model
        if (type == "Lcom/rblive/payment/proto/order/PBActivation;") {
            for (method in classDef.methods.toList()) {
                if ((method.name == "getActivated" || method.name == "getFree") && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV VIP] Unlocked PBActivation->${method.name} = true")
                    } catch (e: Exception) {
                        logger.warning("[FCTV VIP] Failed to hook PBActivation->${method.name}: ${e.message}")
                    }
                } else if (method.name == "getExpirationDate" && method.returnType == "J") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                const-wide v0, 0x7fffffffffffffffL
                                return-wide v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV VIP] Extended PBActivation->getExpirationDate to max lifetime")
                    } catch (e: Exception) {
                        logger.warning("[FCTV VIP] Failed to hook PBActivation->getExpirationDate: ${e.message}")
                    }
                }
            }
        }

        // 3. Signature verification bypass
        if (type == "Lcom/rblive/common/utils/SignatureUtils;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getSignature" && method.returnType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 1,
                            smaliCode = """
                                const/4 v0, 0x1
                                return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV VIP] Bypassed SignatureUtils->getSignature anti-tamper")
                    } catch (e: Exception) {
                        logger.warning("[FCTV VIP] Failed to hook SignatureUtils->getSignature: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[FCTV VIP] Total hooks applied: $hookedPoints")
}
