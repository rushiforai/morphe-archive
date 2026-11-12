package com.dmoniak.patches.claude

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_CLAUDE
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

val claudeBypassPlayIntegrityPatch = bytecodePatch(
    name = "Bypass Play Integrity & Installer Check - Claude AI (Experimental)",
    description = "Spoofs Google Play Store (com.android.vending) installation source and neutralizes client-side Play Integrity attestation during sign-in and session initialization.",
) {
    compatibleWith(COMPATIBILITY_CLAUDE)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeClaudeBypassPlayIntegrityLogic(logger)
    }
}

fun BytecodePatchContext.executeClaudeBypassPlayIntegrityLogic(logger: Logger) {
    logger.info("Executing Bypass Play Integrity & Installer Check patch for Claude AI (com.anthropic.claude)...")
    var installerHooksCount = 0
    var integrityHooksCount = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        if (!tl.contains("androidx") && !tl.contains("android/support")) {
            val mutableClass by lazy { mutableClassDefBy(classDef) }

            // 1. Installer Package / Source resolution spoofing
            // Maps the installer source to Google Play Store (Llt1;->c)
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes
                val retType = method.returnType

                // Hook installer resolver (La01;->n(String)Llt1;)
                if (isStatic && pTypes.size == 1 && pTypes[0].toString() == "Ljava/lang/String;" && retType == "Llt1;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                sget-object v0, Llt1;->c:Llt1;
                                return-object v0
                            """.trimIndent(),
                        )
                        installerHooksCount++
                        logger.info("[Claude Integrity] Spoofed installer source resolver ${type}->${method.name} -> Google Play (Llt1;->c)")
                    } catch (e: Exception) {
                        logger.warning("[Claude Integrity] Failed to hook installer resolver ${method.name}: ${e.message}")
                    }
                }

                // Generic installer string getter -> "com.android.vending"
                val mNameLower = mName.lowercase()
                if (!isStatic && pTypes.isEmpty() && retType == "Ljava/lang/String;" && (
                    mNameLower == "getinstallerpackagename" ||
                    mNameLower == "getinstallersource" ||
                    mNameLower == "getinstallpackagename"
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
                        installerHooksCount++
                        logger.info("[Claude Integrity] Hooked installer name in ${type}->${method.name} -> com.android.vending")
                    } catch (e: Exception) {
                        logger.fine("[Claude Integrity] Failed to hook ${method.name}: ${e.message}")
                    }
                }

                // 2. Play Integrity Attestation and verification flags
                // Hook boolean checks related to play integrity and attestation
                if (retType == "Z" && pTypes.isEmpty() && (
                    mNameLower.contains("asksplay") ||
                    mNameLower.contains("playintegrity") ||
                    mNameLower.contains("requireattestation") ||
                    mNameLower.contains("shouldattest")
                )) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 3,
                            smaliCode = """
                                const/4 v0, 0x0
                                return v0
                            """.trimIndent(),
                        )
                        integrityHooksCount++
                        logger.info("[Claude Integrity] Neutralized attestation requirement in ${type}->${method.name} -> false")
                    } catch (e: Exception) {
                        logger.fine("[Claude Integrity] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info(
        "[Claude Integrity] Patch completed: " +
            "installerHooksCount=$installerHooksCount, " +
            "integrityHooksCount=$integrityHooksCount",
    )
}
