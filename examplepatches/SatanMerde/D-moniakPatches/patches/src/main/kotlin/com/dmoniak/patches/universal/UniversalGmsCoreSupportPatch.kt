package com.dmoniak.patches.universal

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.Opcode
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import java.util.logging.Logger

@Suppress("unused")
val universalGmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore (MicroG) Support (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Redirects Google Play Services (GMS) dependencies to GmsCore / MicroG (app.revanced.android.gms / org.microg.gms.core), enabling Google account login and push notifications on non-rooted devices for morphed Google and third-party apps.",
) {
    // Universal patch: Applies to any app requiring Google Play Services / MicroG redirection
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeUniversalGmsCoreSupportLogic(logger)
    }
}

fun BytecodePatchContext.executeUniversalGmsCoreSupportLogic(logger: Logger) {
    logger.info("Executing Universal GmsCore / MicroG Support patch...")
    var redirectedStrings = 0

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        // Skip Android framework internals
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            val impl = method.implementation ?: continue

            for ((index, instruction) in impl.instructions.withIndex()) {
                if (instruction is ReferenceInstruction && instruction.opcode == Opcode.CONST_STRING) {
                    val ref = instruction.reference
                    if (ref is StringReference) {
                        val str = ref.string
                        if (str == "com.google.android.gms") {
                            try {
                                val mutableMethod = mutableClass.findMutableMethodOf(method)
                                val mutableImpl = mutableMethod.implementation ?: continue
                                val reg = (instruction as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction)?.registerA ?: 0
                                
                                // Replace "com.google.android.gms" with "app.revanced.android.gms"
                                val newInstruction = BuilderInstruction21c(
                                    Opcode.CONST_STRING,
                                    reg,
                                    ImmutableStringReference("app.revanced.android.gms")
                                )
                                mutableImpl.instructions[index] = newInstruction
                                redirectedStrings++
                                logger.info("[GmsCore Support] Redirected GMS package in ${classDef.type}->${method.name}")
                            } catch (e: Exception) {
                                logger.fine("[GmsCore Support] Failed string replace: ${e.message}")
                            }
                        }
                    }
                }
            }
        }
    }

    logger.info("[GmsCore Support] Total GMS package references redirected to GmsCore: $redirectedStrings")
}
