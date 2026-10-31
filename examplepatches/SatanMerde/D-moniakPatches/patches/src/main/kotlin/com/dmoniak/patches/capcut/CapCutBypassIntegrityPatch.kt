package com.dmoniak.patches.capcut

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CAPCUT_ALT
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val capCutBypassIntegrityPatch = bytecodePatch(
    name = "Bypass Integrity & Update Dialog - CapCut (Experimental)",
    description = "⚠️ [Experimental / Untested] Bypasses CapCut tamper detection, security advisory notice, and force update popups.",
) {
    compatibleWith(COMPATIBILITY_CAPCUT, COMPATIBILITY_CAPCUT_ALT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeCapCutBypassIntegrityLogic(logger)
    }
}

fun BytecodePatchContext.executeCapCutBypassIntegrityLogic(logger: Logger) {
    logger.info("Executing Bypass Integrity & Update Dialog patch for CapCut...")

    classDefForEach { classDef ->
        val type = classDef.type
        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Neutralize VersionUpdateService popup & force update check
        if (type == "Lcom/vega/main/update/VersionUpdateService;") {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue

                // Check boolean methods (e.g. isUpdateNeeded, shouldShowPopup) -> return false
                if (method.returnType == "Z") {
                    mutableClass.replaceMethod(
                        method = method,
                        smaliCode = """
                            const/4 v0, 0x0
                            return v0
                        """.trimIndent()
                    )
                    logger.info("CapCut: VersionUpdateService.${method.name}() forced to return false")
                }

                // Neutralize popup trigger methods
                if (method.name.startsWith("show") || method.name == "c" || method.name == "d" || method.name == "e") {
                    if (method.returnType == "V") {
                        mutableClass.replaceMethod(
                            method = method,
                            smaliCode = """
                                return-void
                            """.trimIndent()
                        )
                        logger.info("CapCut: VersionUpdateService.${method.name}() neutralized")
                    }
                }
            }
        }

        // 2. Neutralize UpdatePopupDialogBuilder
        if (type == "Lcom/vega/main/update/UpdatePopupDialogBuilder;") {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.returnType == "V" && !method.name.startsWith("<")) {
                    mutableClass.replaceMethod(
                        method = method,
                        smaliCode = """
                            return-void
                        """.trimIndent()
                    )
                    logger.info("CapCut: UpdatePopupDialogBuilder.${method.name}() neutralized")
                }
            }
        }

        // 3. Bypass SignUtils signature verification
        if (type == "Lcom/bytedance/common/utility/SignUtils;") {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name == "checkSignature" && method.returnType == "Z") {
                    mutableClass.replaceMethod(
                        method = method,
                        smaliCode = """
                            const/4 v0, 0x1
                            return v0
                        """.trimIndent()
                    )
                    logger.info("CapCut: SignUtils.checkSignature() forced to return true")
                }
            }
        }
    }
}
