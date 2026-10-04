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
val spotifyAmoledThemePatch = bytecodePatch(
    name = "Spicetify AMOLED Black Theme - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Implements an OLED True Black (#000000) theme for Spotify Mobile, replacing dark-grey backgrounds on AMOLED displays for maximum contrast and battery savings across updates.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAmoledThemeLogic(logger)
    }
}

fun BytecodePatchContext.executeSpotifyAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Spicetify AMOLED Black Theme patch for Spotify...")
    var windowHooks = 0
    var stringsReplaced = 0
    var methodsHooked = 0

    val blackHex = "#000000"

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroid/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        for (method in classDef.methods.toList()) {
            val impl = method.implementation ?: continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name
            val mNameLower = mName.lowercase()
            val retType = method.returnType

            // 1. Force OLED Black Window & DecorView on all Spotify Activity screens
            if (!isStatic && (mName == "onCreate" || mName == "onResume") && tl.contains("activity")) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                        move-result-object v0
                        if-nez v0, :morphe_spot_amoled_skip
                        new-instance v1, Landroid/graphics/drawable/ColorDrawable;
                        const/high16 v2, -0x1000000
                        invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V
                        invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
                        invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
                        move-result-object v3
                        if-nez v3, :morphe_spot_amoled_skip
                        invoke-virtual {v3, v2}, Landroid/view/View;->setBackgroundColor(I)V
                        :morphe_spot_amoled_skip
                        """.trimIndent()
                    )
                    windowHooks++
                    logger.fine("[Spotify AMOLED] Injected pure black Window in: ${type}->${mName}")
                } catch (e: Exception) {
                    logger.fine("[Spotify AMOLED] Skip window hook: ${e.message}")
                }
            }

            // 2. Scan and replace dark grey background string literals (#121212, #181818, #191414, #242424, #282828)
            val instructions = impl.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val strRef = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    val s = strRef.string.lowercase()
                    if (s == "#121212" || s == "#181818" || s == "#191414" || s == "#242424" || s == "#282828" ||
                        s == "121212" || s == "181818" || s == "191414" || s == "242424" || s == "282828"
                    ) {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val newInsn = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, ImmutableStringReference(blackHex))
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, reg, ImmutableStringReference(blackHex))
                        }
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.replaceInstruction(index, newInsn)
                            stringsReplaced++
                            logger.fine("[Spotify AMOLED] Replaced dark grey string in: ${type}->${mName}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify AMOLED] Skip string replace: ${e.message}")
                        }
                    }
                }
            }

            // 3. Hook methods returning dark grey literals or background color getters
            var hasDarkGreyLiteral = false
            for (insn in impl.instructions) {
                if (insn is NarrowLiteralInstruction) {
                    val lit = insn.narrowLiteral
                    // #121212 = -15592942, #181818 = -15200232, #191414 = -15133676, #242424 = -14408668, #282828 = -14145496
                    if (lit == -15592942 || lit == -15200232 || lit == -15133676 || lit == -14408668 || lit == -14145496) {
                        hasDarkGreyLiteral = true
                        break
                    }
                }
            }

            val semanticMatch = mNameLower.contains("backgroundcolor") ||
                    mNameLower.contains("surfacecolor") ||
                    mNameLower.contains("darkbackground") ||
                    mNameLower.contains("elevatedcolor")

            if ((hasDarkGreyLiteral || semanticMatch) && retType == "I" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/high16 v0, -0x1000000
                        return v0
                        """.trimIndent()
                    )
                    methodsHooked++
                    logger.info("[Spotify AMOLED] Hooked background color method in: ${type}->${mName}")
                } catch (e: Exception) {
                    logger.fine("[Spotify AMOLED] Failed to hook ${mName}: ${e.message}")
                }
            }

            // 4. Force dark theme
            if (!isStatic && (
                mNameLower == "isdarktheme" ||
                mNameLower == "isdarkmode" ||
                mNameLower == "isnightmodeactive"
            ) && retType == "Z" && method.parameterTypes.isEmpty()) {
                try {
                    val mutableMethod = mutableClass.findMutableMethodOf(method)
                    mutableMethod.addInstructions(
                        0,
                        """
                        const/4 v0, 0x1
                        return v0
                        """.trimIndent()
                    )
                    methodsHooked++
                    logger.info("[Spotify AMOLED] Enforced dark theme: ${type}->${mName}")
                } catch (e: Exception) {
                    logger.fine("[Spotify AMOLED] Failed to hook ${mName}: ${e.message}")
                }
            }
        }
    }

    logger.info("[Spotify AMOLED] Finished: $windowHooks Activity Window decor hooks, $stringsReplaced grey strings redirected, $methodsHooked color/theme methods hooked.")
}
