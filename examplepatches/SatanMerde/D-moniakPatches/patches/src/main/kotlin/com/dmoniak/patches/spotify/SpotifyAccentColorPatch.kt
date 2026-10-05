package com.dmoniak.patches.spotify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31i
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction51l
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SPOTIFY
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import java.util.logging.Logger

val spotifyAccentColorBytecodePatch = bytecodePatch(
    name = "Spicetify Custom Accent Color Bytecode",
    description = "Bytecode engine for Spicetify Custom Accent Color",
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAccentColorLogic(logger)
    }
}

@Suppress("unused")
val spotifyAccentColorPatch = resourcePatch(
    name = "Spicetify Custom Accent Color - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Replaces Spotify brand green (#1DB954 / #1ED760) with custom Cyberpunk Electric Purple (#8A2BE2) across Android resources (res/values/colors.xml), Jetpack Compose Encore design system (64-bit literals), obfuscated Dalvik bytecode (32-bit & 24-bit literals including Lottie float rounding variations and checkmarks), semantic theme methods, and string tables.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)
    dependsOn(spotifyAccentColorBytecodePatch)

    execute {
        document("res/values/colors.xml").use { document ->
            val resourcesNode = document.getElementsByTagName("resources").item(0) as? Element ?: return@use
            val childNodes = resourcesNode.childNodes
            for (i in 0 until childNodes.length) {
                val node = childNodes.item(i) as? Element ?: continue
                val name = node.getAttribute("name")
                val newColor = when (name) {
                    "dark_brightaccent_background_base",
                    "dark_base_text_brightaccent",
                    "green_light",
                    "spotify_green_157",
                    "spotifybrand_essential_base",
                    "accent" -> "#ff8a2be2"

                    "dark_brightaccent_background_press",
                    "green_trailing_icon",
                    "green_focus" -> "#ff7a1fd2"
                    else -> null
                }
                if (newColor != null) {
                    node.textContent = newColor
                }
            }
        }
    }
}

fun BytecodePatchContext.executeSpotifyAccentColorLogic(logger: Logger) {
    logger.info("Executing Spicetify Custom Accent Color patch for Spotify...")
    var wideLiteralsReplaced = 0
    var narrowLiteralsReplaced = 0
    var stringsReplaced = 0
    var methodsHooked = 0

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

            val instructions = impl.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                // 1. Jetpack Compose Encore 64-bit color constants (const-wide)
                if (instruction is WideLiteralInstruction && instruction is OneRegisterInstruction) {
                    val lit = instruction.wideLiteral
                    val newWideVal = when (lit) {
                        // Standard Encore 64-bit green tokens
                        0x00000000ff1ed760L, // Primary Brand Green
                        0x00000000ff1ed75fL, // Primary Brand Green (Lottie float rounding variation)
                        0x00000000ff1db954L, // Classic Green
                        0x00000000ff1cb854L, // Classic Green (Lottie float rounding variation)
                        0x00000000ff21df65L, // "Saved/Liked" track checkmark (✔) & Play buttons
                        0x00000000ff3be477L, // Light Active Green / Media control highlight
                        0x00000000ff1abc54L, // Dark Brand Accent
                        0x00000000ff159542L, // Pressed Brand Green
                        0x00000000ff60e890L, // Soft Positive Green
                        0x00000000ff107434L, // Deep Green Tone
                        0x00000000ff1fdf64L, // Secondary Vibrant Green
                        0x00000000ff169c46L, // Secondary Dark Green
                        0x00000000ff2ebd59L  // Active Status Green
                        -> 0x00000000ff8a2be2L // Cyberpunk Electric Purple (#8A2BE2)

                        // Shifted representations (high 32 bits)
                        -63376537419776000L, // 0xff1ed76000000000L
                        -63376541714743296L, // 0xff1ed75f00000000L (float rounding)
                        -63479633854580224L, // 0xff1ed76000000000L (alt)
                        -63691049284927488L, // 0xff1db95400000000L
                        -63973623773265920L, // 0xff1cb85400000000L (float rounding)
                        -58843912170668032L, // 0xff1db95400000000L (alt)
                        -62523294921785344L, // 0xff21df6500000000L (checkmark)
                        -55199370659758080L, // 0xff3be47700000000L
                        -64532175680176128L, // 0xff1abc5400000000L
                        -65982508826624000L, // 0xff15954200000000L
                        -44780291100770304L, // 0xff60e89000000000L
                        -67426227723436032L, // 0xff10743400000000L
                        -63086249170173952L, // 0xff1fdf6400000000L
                        -65693320088649728L, // 0xff169c4600000000L
                        -58901555159498752L  // 0xff2ebd5900000000L
                        -> -33165275882618880L // 0xff8a2be200000000L
                        else -> null
                    }
                    if (newWideVal != null) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            val newInsn = BuilderInstruction51l(Opcode.CONST_WIDE, instruction.registerA, newWideVal)
                            mutableMethod.replaceInstruction(index, newInsn)
                            wideLiteralsReplaced++
                            logger.fine("[Spotify Accent] Replaced 64-bit green Compose literal in ${classDef.type}->${method.name}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify Accent] Skip wide literal replace: ${e.message}")
                        }
                    }
                }

                // 2. 32-bit Narrow literals (legacy Android Views, Canvas, ARGB ints)
                if (instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction) {
                    val lit = instruction.narrowLiteral
                    val newIntVal = when (lit) {
                        // ARGB 32-bit ints
                        -14756000, // #FF1ED760
                        -14756001, // #FF1ED75F (Lottie float rounding variation)
                        -14829228, // #FF1DB954
                        -14894988, // #FF1CB854 (Lottie float rounding variation)
                        -14557339, // #FF21DF65 (Checkmark ✔)
                        -12852105, // #FF3BE477
                        -14960044, // #FF1ABC54
                        -15362750, // #FF159542
                        -10426224, // #FF60E890
                        -15698892, // #FF107434
                        -14688412, // #FF1FDF64
                        -15295418, // #FF169C46
                        -13713831  // #FF2EBD59
                        -> -7722014 // 0xFF8A2BE2

                        // 24-bit RGB ints
                        2021216, // 0x1ED760
                        2021215, // 0x1ED75F
                        1948004, // 0x1DB954
                        1882196, // 0x1CB854
                        2219877, // 0x21DF65
                        3925111, // 0x3BE477
                        1752148, // 0x1ABC54
                        1414466, // 0x159542
                        6350992, // 0x60E890
                        1078324, // 0x107434
                        2088804, // 0x1FDF64
                        1481798, // 0x169C46
                        3063129  // 0x2EBD59
                        -> 9055202 // 0x8A2BE2
                        else -> null
                    }
                    if (newIntVal != null) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            val newInsn = BuilderInstruction31i(Opcode.CONST, instruction.registerA, newIntVal)
                            mutableMethod.replaceInstruction(index, newInsn)
                            narrowLiteralsReplaced++
                            logger.fine("[Spotify Accent] Replaced 32-bit green literal in ${classDef.type}->${method.name}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify Accent] Skip narrow literal replace: ${e.message}")
                        }
                    }
                }

                // 3. String hex constants (#1DB954, #1ED760, #21DF65, etc.)
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val strRef = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    val s = strRef.string.lowercase()
                    if (s == "#1db954" || s == "#1cb854" || s == "#1ed760" || s == "#1ed75f" || s == "#21df65" || s == "#3be477" || s == "#1abc54" ||
                        s == "#159542" || s == "#60e890" || s == "#107434" || s == "#1fdf64" || s == "#169c46" || s == "#2ebd59" ||
                        s == "1db954" || s == "1cb854" || s == "1ed760" || s == "1ed75f" || s == "21df65" || s == "3be477" || s == "1abc54" ||
                        s == "159542" || s == "60e890" || s == "107434" || s == "1fdf64" || s == "169c46" || s == "2ebd59"
                    ) {
                        val reg = (instruction as? OneRegisterInstruction)?.registerA ?: continue
                        val newInsn = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                            BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, ImmutableStringReference(purpleHex))
                        } else {
                            BuilderInstruction21c(Opcode.CONST_STRING, reg, ImmutableStringReference(purpleHex))
                        }
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            mutableMethod.replaceInstruction(index, newInsn)
                            stringsReplaced++
                            logger.fine("[Spotify Accent] Replaced green string in ${classDef.type}->${method.name}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify Accent] Skip string replace: ${e.message}")
                        }
                    }
                }
            }

            // 4. Hook semantic color getter methods returning ARGB int or Compose Color Long
            val semanticMatch = mName.contains("accentcolor") ||
                    mName.contains("brandcolor") ||
                    mName.contains("primarybrandcolor") ||
                    mName.contains("spotifygreen")

            if (semanticMatch && method.parameterTypes.isEmpty()) {
                if (retType == "I") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const v0, -0x75d41e
                            return v0
                            """.trimIndent() // #8A2BE2
                        )
                        methodsHooked++
                        logger.info("[Spotify Accent] Hooked brand color method in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Spotify Accent] Failed to hook ${method.name}: ${e.message}")
                    }
                } else if (retType == "J") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-wide v0, 0x00000000ff8a2be2L
                            return-wide v0
                            """.trimIndent()
                        )
                        methodsHooked++
                        logger.info("[Spotify Accent] Hooked Compose brand color method in ${classDef.type}->${method.name}")
                    } catch (e: Exception) {
                        logger.fine("[Spotify Accent] Failed to hook Compose ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Spotify Accent] Finished: $wideLiteralsReplaced 64-bit Compose literals replaced, $narrowLiteralsReplaced 32-bit literals replaced, $stringsReplaced green hex strings redirected, $methodsHooked color methods hooked.")
}

