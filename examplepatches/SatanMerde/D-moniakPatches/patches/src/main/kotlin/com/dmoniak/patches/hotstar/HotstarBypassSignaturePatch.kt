package com.dmoniak.patches.hotstar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_HOTSTAR
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import java.util.logging.Logger

@Suppress("unused")
val hotstarBypassSignaturePatch = bytecodePatch(
    name = "Bypass Signature & Integrity Check - JioHotstar",
    description = "Bypasses signature verification and anti-tamper telemetry (IsTampered, package signatures) in JioHotstar, preventing account flagging, session termination, and NET_201 security blocks.",
) {
    compatibleWith(COMPATIBILITY_HOTSTAR)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeHotstarBypassSignatureLogic(logger)
    }
}

fun BytecodePatchContext.executeHotstarBypassSignatureLogic(logger: Logger) {
    logger.info("Executing Bypass Signature & Integrity Check patch for JioHotstar...")
    var hookedTamperPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        // Find AppSuiteInfo model (or any class computing IsTampered)
        var referencesIsTampered = false
        var isTamperedFieldName: String? = null

        for (method in classDef.methods) {
            val impl = method.implementation ?: continue
            var prevWasTamperedString = false
            for (insn in impl.instructions) {
                if (insn is ReferenceInstruction) {
                    val ref = insn.reference
                    if (ref is StringReference) {
                        val s = ref.string
                        if (s == "IsTampered" || s == "\"IsTampered\":\"" || s == ", IsTampered=") {
                            referencesIsTampered = true
                            prevWasTamperedString = true
                            continue
                        }
                    } else if (prevWasTamperedString && ref is FieldReference) {
                        if (ref.definingClass == type && ref.type == "Ljava/lang/String;") {
                            isTamperedFieldName = ref.name
                            prevWasTamperedString = false
                        }
                    }
                }
            }
        }

        if (referencesIsTampered) {
            val fieldToNullify = isTamperedFieldName ?: "A"
            logger.info("[Hotstar Signature] Found IsTampered in $type (field: $fieldToNullify)")

            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name

                // Hook constructor: override field to "false"
                if (mName == "<init>") {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 1)
                        val returnVoidIdx = cloned.implementation!!.instructions.indexOfLast { 
                            it.opcode.name == "return-void" 
                        }
                        val insertIdx = if (returnVoidIdx >= 0) returnVoidIdx else 0
                        cloned.addInstructions(
                            insertIdx,
                            """
                            const-string v0, "false"
                            iput-object v0, p0, $type->$fieldToNullify:Ljava/lang/String;
                            """.trimIndent()
                        )
                        hookedTamperPoints++
                        logger.fine("[Hotstar Signature] Injected false IsTampered override in $type-><init>")
                    } catch (e: Exception) {
                        logger.warning("[Hotstar Signature] Failed to hook $type constructor: ${e.message}")
                    }
                }

                // If serializer method a() exists, also hook it
                if (mName == "a" && method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty()) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 1)
                        cloned.addInstructions(
                            0,
                            """
                            const-string v0, "false"
                            iput-object v0, p0, $type->$fieldToNullify:Ljava/lang/String;
                            """.trimIndent()
                        )
                        hookedTamperPoints++
                        logger.fine("[Hotstar Signature] Injected false IsTampered override in $type->a")
                    } catch (e: Exception) {
                        logger.warning("[Hotstar Signature] Failed to hook $type->a: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Hotstar Signature] Completed: $hookedTamperPoints tamper points hooked.")
}
