package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import java.util.logging.Logger

@Suppress("unused")
val spotifyAccentColorPatch = bytecodePatch(
    name = "Spicetify Custom Accent Color - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Replaces Spotify brand green (#1DB954 / #1ED760) with custom Cyberpunk Electric Purple (#8A2BE2) across obfuscated bytecode, string tables, and color models.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAccentColorLogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyAccentColorLogic(logger: Logger) {
    logger.info("Executing Spicetify Custom Accent Color patch for Spotify...")
    var stringReplaced = 0
    var hookedMethods = 0

    // Electric Purple / Neon Violet (#8A2BE2)
    val purpleHex = "#8A2BE2"

    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            val impl = method.implementation ?: continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType

            // 1. Scan for string constants containing Spotify green hex codes
            val instructions = impl.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val strRef = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    val str = strRef.string
                    val strLower = str.lowercase()

                    if (strLower == "#1db954" || strLower == "#1ed760" || strLower == "1db954" || strLower == "1ed760") {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val newInsn = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, ImmutableStringReference(purpleHex))
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, reg, ImmutableStringReference(purpleHex))
                        }
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.replaceInstruction(index, newInsn)
                            stringReplaced++
                            logger.fine("[Spotify Accent] Replaced green string in ${classDef.type}->${method.name}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify Accent] Skip string replace: ${e.message}")
                        }
                    }
                }
            }

            // 2. Hook methods returning int (Color ARGB) matching Spotify green literals or semantic names
            var hasGreenLiteral = false
            for (insn in impl.instructions) {
                if (insn is NarrowLiteralInstruction) {
                    val lit = insn.narrowLiteral
                    // #1DB954 = -14829228 (0xFF1DB954) or 1948004 (0x1DB954)
                    // #1ED760 = -14756000 (0xFF1ED760) or 2021216 (0x1ED760)
                    if (lit == -14829228 || lit == -14756000 || lit == 1948004 || lit == 2021216) {
                        hasGreenLiteral = true
                        break
                    }
                }
            }

            val semanticMatch = mName.contains("accentcolor") ||
                    mName.contains("brandcolor") ||
                    mName.contains("primarybrandcolor") ||
                    mName.contains("spotifygreen")

            if ((hasGreenLiteral || semanticMatch) && retType == "I" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const v0, -0x75d41e
                        return v0
                        """.trimIndent() // #8A2BE2
                    )
                    hookedMethods++
                    logger.info("[Spotify Accent] Hooked brand color method in ${classDef.type}->${method.name}")
                } catch (e: Exception) {
                    logger.fine("[Spotify Accent] Failed to hook ${method.name}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Spotify Accent] Finished: $stringReplaced green hex strings redirected, $hookedMethods color methods hooked.")
}
