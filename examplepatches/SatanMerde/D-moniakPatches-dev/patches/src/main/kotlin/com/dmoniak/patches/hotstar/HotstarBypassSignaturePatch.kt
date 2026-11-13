package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import java.util.logging.Logger

@Suppress("unused")
val hotstarBypassSignaturePatch = bytecodePatch(
    name = "Bypass Signature Check & Anti-Tamper - JioHotstar",
    description = "Bypasses certificate MD5 verification and internal telemetry tamper detection to prevent API blocks, stream degradation, and account flagging in JioHotstar.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarBypassSignatureLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarBypassSignatureLogic(logger: Logger) {
    logger.info("Executing Bypass Signature & Anti-Tamper patch for JioHotstar (in.startv.hotstar)...")

    // 1. Battle-tested certificate MD5 hash bypass
    // Overwrites the computed MD5+Base64 hash with the genuine original signature hash ("GnwgdTsKCP54v02ZSST5iA")
    // from libnative-lib.so so signature comparison always succeeds on modified/re-signed builds.
    try {
        val method = SignatureCheckFingerprint.method
        val matches = SignatureCheckFingerprint.instructionMatches
        if (matches.size > 1) {
            val encodeIndex = matches[1].index
            val moveResultIndex = encodeIndex + 1
            val reg = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

            method.addInstructions(
                moveResultIndex + 1,
                """
                const-string v$reg, "GnwgdTsKCP54v02ZSST5iA"
                """.trimIndent()
            )
            logger.info("[Hotstar Signature] Successfully patched certificate MD5 hash verification to genuine cert")
        }
    } catch (e: Exception) {
        logger.warning("[Hotstar Signature] SignatureCheckFingerprint bypass failed: ${e.message}")
    }

    // 2. Telemetry and AppSuiteInfo IsTampered spoofing
    var hookedTamper = 0
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val isTamperTelemetry = (tl.contains("appsuiteinfo") || tl.contains("deviceinfo") || tl.contains("telemetry") || tl.contains("tamper")) &&
                !tl.startsWith("lcom/google/")

        if (isTamperTelemetry) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name.lowercase()
                val retType = method.returnType

                val isTamperedGetter = !isStatic && (
                    mName == "istampered" ||
                    mName == "isapptampered" ||
                    mName == "isapkmodified" ||
                    mName == "isrootedortampered"
                ) && retType == "Z"

                if (isTamperedGetter) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 2)
                        cloned.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedTamper++
                        logger.fine("[Hotstar Signature] Enforced IsTampered=false on ${type}->${method.name}")
                    } catch (_: Exception) {}
                }
            }
        }
    }

    logger.info("[Hotstar Signature] Supplemental tamper telemetry points hooked: $hookedTamper")
}
