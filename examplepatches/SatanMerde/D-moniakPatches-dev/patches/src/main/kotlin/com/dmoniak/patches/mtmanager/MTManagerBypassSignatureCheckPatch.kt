package com.dmoniak.patches.mtmanager

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MT_MANAGER
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val mtManagerBypassSignatureCheckPatch = bytecodePatch(
    name = "Bypass Signature and Installer Verification - MT Manager (Experimental)",
    description = "Spoofs Google Play Store installation source and neutralizes Java-side APK signature and package verification checks in MT Manager. NOTE: Native integrity checks via libmtprotect.so may still require system-level signature spoofing.",
) {
    compatibleWith(COMPATIBILITY_MT_MANAGER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMTManagerBypassSignatureCheckLogic(logger)
    }
}

fun BytecodePatchContext.executeMTManagerBypassSignatureCheckLogic(logger: Logger) {
    logger.info("Executing Bypass Signature and Installer Verification patch for MT Manager...")
    var hookedPoints = 0

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

                // 1. Spoof installer package name -> "com.android.vending"
                if (!isStatic && retType == "Ljava/lang/String;" && pTypes.isEmpty() && (
                    mName == "getinstallerpackagename" ||
                    mName == "getinstallersource"
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const-string v0, "com.android.vending"
                                return-object v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[MTManager Signature] Spoofed installer source -> com.android.vending: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager Signature] Failed to hook installer getter: ${e.message}")
                    }
                }

                // 2. Signature verification checkers returning boolean -> true
                if (!isStatic && retType == "Z" && pTypes.isEmpty() && (
                    mName == "verifysignature" ||
                    mName == "checksignature" ||
                    mName == "isvalidsignature" ||
                    mName == "issignaturevalid" ||
                    mName == "isoriginalpackage"
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
                        logger.info("[MTManager Signature] Forced signature check -> true: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager Signature] Failed to hook signature check: ${e.message}")
                    }
                }

                // 3. Tamper detection checkers returning boolean -> false
                if (!isStatic && retType == "Z" && pTypes.isEmpty() && (
                    mName == "istampered" ||
                    mName == "isapkmodified" ||
                    mName == "iscracked" ||
                    mName == "checktamper"
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
                        logger.info("[MTManager Signature] Disabled tamper check -> false: ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.warning("[MTManager Signature] Failed to hook tamper check: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MTManager Signature] Total signature bypass hooks applied: $hookedPoints")
}
