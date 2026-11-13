package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val hotstarBypassSecurityChecksPatch = bytecodePatch(
    name = "Bypass Root & VPN Detection - JioHotstar",
    description = "Neutralizes RootBeer and native root detection (su binary, test-keys, Magisk) and disables VPN/Proxy network interface flags (isVpnActive, IsProxy), allowing seamless streaming through VPNs and AdGuard DNS.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarBypassSecurityChecksLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarBypassSecurityChecksLogic(logger: Logger) {
    logger.info("Executing Bypass Root & VPN Detection patch for JioHotstar...")
    var hookedSecurityPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. RootBeer / RootBeerNative root checks
        if (tl.contains("rootbeer")) {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val retType = method.returnType

                // checkForRoot()I -> return 0 (not rooted)
                if (retType == "I" && (mName == "checkForRoot" || mName.contains("Root", ignoreCase = true))) {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedSecurityPoints++
                        logger.fine("[Hotstar Security] Hooked RootBeer $type->$mName -> 0")
                    } catch (e: Exception) {
                        logger.fine("[Hotstar Security] Skip RootBeer hook: ${e.message}")
                    }
                }

                // isRooted()Z / isRootedWithoutBusyBoxCheck()Z -> return false
                if (retType == "Z") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedSecurityPoints++
                        logger.fine("[Hotstar Security] Hooked RootBeer boolean $type->$mName -> false")
                    } catch (e: Exception) {
                        logger.fine("[Hotstar Security] Skip RootBeer boolean hook: ${e.message}")
                    }
                }
            }
        }

        // 2. AppSuiteInfo (Ldl/p;) security flags: IsRooted, IsProxy, isVpnActive, IsEmulator
        var referencesSecurityFlags = false
        val fieldsToOverride = mutableSetOf<String>()

        for (method in classDef.methods) {
            val impl = method.implementation ?: continue
            var prevKey: String? = null
            for (insn in impl.instructions) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is StringReference) {
                        val s = ref.string
                        if (s in setOf(
                                "\"IsRooted\":\"", "\"IsProxy\":\"", "\"isVpnActive\":\"",
                                "\"IsEmulator\":\"", "\"isSuspiciousFileExists\":\"",
                                "\"isDebuggerEnabled\":\"", "\"isPortsOpen\":\"",
                                ", IsRooted=", ", IsProxy=", ", isVpnActive=", ", IsEmulator="
                            )
                        ) {
                            referencesSecurityFlags = true
                            prevKey = s
                            continue
                        }
                    } else if (prevKey != null && ref is FieldReference) {
                        if (ref.definingClass == type && ref.type == "Ljava/lang/String;") {
                            fieldsToOverride.add(ref.name)
                            prevKey = null
                        }
                    }
                }
            }
        }

        if (referencesSecurityFlags) {
            // Default known fields for 26.10: y (IsEmulator), z (IsRooted), B (IsProxy), C (isVpnActive), D, E, F
            if (fieldsToOverride.isEmpty()) {
                fieldsToOverride.addAll(listOf("y", "z", "B", "C", "D", "E", "F"))
            }

            logger.info("[Hotstar Security] Overriding security flags in $type: $fieldsToOverride")

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name

                if (mName == "<init>" || (mName == "a" && method.returnType == "Ljava/lang/String;")) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 1)
                        val insertIdx = if (mName == "<init>") {
                            val retIdx = cloned.implementation!!.instructions.indexOfLast { it.opcode.name == "return-void" }
                            if (retIdx >= 0) retIdx else 0
                        } else 0

                        val smali = buildString {
                            appendLine("const-string v0, \"false\"")
                            for (field in fieldsToOverride) {
                                appendLine("iput-object v0, p0, $type->$field:Ljava/lang/String;")
                            }
                        }
                        cloned.addInstructions(insertIdx, smali)
                        hookedSecurityPoints++
                        logger.fine("[Hotstar Security] Injected security flag override in $type->$mName")
                    } catch (e: Exception) {
                        logger.warning("[Hotstar Security] Failed to override in $type->$mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Hotstar Security] Completed: $hookedSecurityPoints security points hooked.")
}
