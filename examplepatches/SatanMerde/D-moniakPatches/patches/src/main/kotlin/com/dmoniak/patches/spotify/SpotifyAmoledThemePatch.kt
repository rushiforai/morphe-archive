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

val spotifyAmoledThemeBytecodePatch = bytecodePatch(
    name = "Spicetify AMOLED Black Theme Bytecode",
    description = "Bytecode engine for Spicetify AMOLED Black Theme",
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSpotifyAmoledThemeLogic(logger)
    }
}

@Suppress("unused")
val spotifyAmoledThemePatch = resourcePatch(
    name = "Spicetify AMOLED Black Theme - Spotify (Experimental)",
    description = "⚠️ [En cours de développement / Non testé] Implements an OLED True Black (#000000) theme for Spotify Mobile, replacing dark-grey backgrounds across Android resources (res/values/colors.xml), Jetpack Compose Encore design system (64-bit literals), obfuscated Dalvik bytecode (32-bit & 24-bit literals), semantic theme methods, and string tables for maximum contrast and battery savings.",
) {
    compatibleWith(COMPATIBILITY_SPOTIFY)
    dependsOn(spotifyAmoledThemeBytecodePatch)

    execute {
        document("res/values/colors.xml").use { document ->
            val resourcesNode = document.getElementsByTagName("resources").item(0) as? Element ?: return@use
            val childNodes = resourcesNode.childNodes
            for (i in 0 until childNodes.length) {
                val node = childNodes.item(i) as? Element ?: continue
                val name = node.getAttribute("name")
                val newColor = when (name) {
                    "gray_7",
                    "gray_10",
                    "dark_base_background_base",
                    "dark_base_background_elevated_base",
                    "bg_gradient_start_color",
                    "bg_gradient_end_color",
                    "sthlm_blk",
                    "sthlm_blk_grad_start",
                    "image_placeholder_color",
                    "gray_15",
                    "opacity_white_10",
                    "dark_base_background_tinted_highlight",
                    "your_library_background",
                    "notification_bg_color",
                    "npv_bg_color" -> "#ff000000"

                    "opacity_gray_7_0" -> "#00000000"
                    "opacity_gray_7_80" -> "#cc000000"
                    else -> null
                }
                if (newColor != null) {
                    node.textContent = newColor
                }
            }
        }
    }
}

fun BytecodePatchContext.executeSpotifyAmoledThemeLogic(logger: Logger) {
    logger.info("Executing Spicetify AMOLED Black Theme patch for Spotify...")
    var wideLiteralsReplaced = 0
    var narrowLiteralsReplaced = 0
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

            // 1. Scan and replace dark grey literals across instructions
            val instructions = impl.instructions.toList()
            for ((index, instruction) in instructions.withIndex()) {
                // A. Jetpack Compose 64-bit color constants (const-wide)
                if (instruction is WideLiteralInstruction && instruction is OneRegisterInstruction) {
                    val lit = instruction.wideLiteral
                    val newWideVal = when (lit) {
                        // Standard Encore 64-bit dark surface & background tokens
                        0x00000000ff121212L, // Base Dark Surface 0
                        0x00000000ff181818L, // Base Dark Surface 1
                        0x00000000ff191414L, // Base Dark Black-Red Base
                        0x00000000ff191919L, // Base Dark Background Variant
                        0x00000000ff141414L, // Deep Surface Background
                        0x00000000ff171717L, // Surface Card Base
                        0x00000000ff1b1b1bL, // Surface Card Elevated
                        0x00000000ff1f1f1fL, // Home Cards, Search suggestions, Now Playing bottom cards, Connect sheet
                        0x00000000ff212121L, // Surface Highlight
                        0x00000000ff232323L, // Shortcut Tiles & Action Cards
                        0x00000000ff242424L, // Surface Mid-Grey
                        0x00000000ff282828L, // Surface Grey
                        0x00000000ff292929L, // Elevated Surface Containers, Sort & Layout Toggles
                        0x00000000ff2a2a2aL, // Surface Card Modal Background
                        0x00000000ff2b2b2bL, // Bottom Sheets & Dialogs
                        0x00000000ff333333L, // Home Category Filter Pills (Music / Podcasts / Audiobooks)
                        0x00000000ff343434L, // Search Bar Container, Category Filter Pills (Playlists/Podcasts), Status Boxes
                        0x00000000ff353535L, // Dark Grey Pill / Card Variant
                        0x00000000ff535353L, // Mid Dark Grey Container
                        0x00000000ff656565L, // Neutral Grey Container
                        0x00000000ff717171L, // Neutral Surface Border / Pill
                        0x00000000ff727272L, // Neutral Surface Variant
                        0x00000000ff747474L, // Secondary Surface Border
                        0x00000000ff7c7c7cL, // Elevated Grey Container
                        0x00000000ff0b0b0bL, // Border / Divider Dark
                        0x00000000ff040404L, // Deep Dark Tint
                        0x00000000ff444444L  // Inactive Pill Backgrounds & Dividers
                        -> 0x00000000ff000000L

                        // Shifted representations (high 32 bits)
                        -66971175938424832L, // 0xff12121200000000L
                        -67250682882752512L, // 0xff12121200000000L (alt)
                        -65275703238590464L, // 0xff18181800000000L
                        -65561833500213248L, // 0xff18181800000000L (alt)
                        -64998643488260096L, // 0xff19141400000000L
                        -65280358489948160L, // 0xff19141400000000L (alt)
                        -64993124455284736L, // 0xff19191900000000L
                        -66406018371813376L, // 0xff14141400000000L
                        -65558282021896192L, // 0xff17171700000000L
                        -64427966888673280L, // 0xff1b1b1b00000000L
                        -63297651755450368L, // 0xff1f1f1f00000000L
                        -62732494188838912L, // 0xff21212100000000L
                        -62167336622227456L, // 0xff23232300000000L
                        -61884757838921728L, // 0xff24242400000000L
                        -63872983790239744L, // 0xff24242400000000L (alt)
                        -60754442705698816L, // 0xff28282800000000L
                        -62747084529319936L, // 0xff28282800000000L (alt)
                        -60471863922393088L, // 0xff29292900000000L
                        -60189285139087360L, // 0xff2a2a2a00000000L
                        -59906706355781632L, // 0xff2b2b2b00000000L
                        -57646076089335808L, // 0xff33333300000000L (Home Category Pills)
                        -57363497306030080L, // 0xff34343400000000L
                        -57303024569155584L, // 0xff35353500000000L
                        -48644365769244672L, // 0xff53535300000000L
                        -43534960325296128L, // 0xff65656500000000L
                        -40126462719655936L, // 0xff71717100000000L
                        -39843883936350208L, // 0xff72727200000000L
                        -39278726369738752L, // 0xff74747400000000L
                        -37018131335446528L, // 0xff7c7c7c00000000L
                        -68949227421564928L, // 0xff0b0b0b00000000L
                        -70927278904705024L, // 0xff04040400000000L
                        -52842236773138432L  // 0xff44444400000000L
                        -> -72057594037927936L // 0xff00000000000000L
                        else -> null
                    }
                    if (newWideVal != null) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            val newInsn = BuilderInstruction51l(Opcode.CONST_WIDE, instruction.registerA, newWideVal)
                            mutableMethod.replaceInstruction(index, newInsn)
                            wideLiteralsReplaced++
                            logger.fine("[Spotify AMOLED] Replaced 64-bit dark Compose literal in ${type}->${mName}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify AMOLED] Skip wide literal replace: ${e.message}")
                        }
                    }
                }

                // B. 32-bit Narrow literals (legacy Android Views, Canvas, Drawables)
                if (instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction) {
                    val lit = instruction.narrowLiteral
                    val newIntVal = when (lit) {
                        // ARGB 32-bit ints
                        -15592942, // #FF121212
                        -15200232, // #FF181818
                        -15133676, // #FF191414
                        -15132391, // #FF191919
                        -15461356, // #FF141414
                        -15263977, // #FF171717
                        -15000805, // #FF1B1B1B
                        -14737633, // #FF1F1F1F
                        -14606047, // #FF212121
                        -14474461, // #FF232323
                        -14408668, // #FF242424
                        -14145496, // #FF282828
                        -14079703, // #FF292929
                        -14013910, // #FF2A2A2A
                        -13948117, // #FF2B2B2B
                        -13421773, // #FF333333 (Home Category Filter Pills)
                        -13355980, // #FF343434
                        -13289931, // #FF353535
                        -11316397, // #FF535353
                        -10132123, // #FF656565
                        -9342607,  // #FF717171
                        -9276814,  // #FF727272
                        -9145228,  // #FF747474
                        -8618884,  // #FF7C7C7C
                        -16053493, // #FF0B0B0B
                        -16514044, // #FF040404
                        -12303292  // #FF444444
                        -> -16777216 // 0xFF000000 (Pure Black)

                        // 24-bit RGB ints
                        1184274, // 0x121212
                        1579032, // 0x181818
                        1643540, // 0x191414
                        1644825, // 0x191919
                        1315860, // 0x141414
                        1513239, // 0x171717
                        1776411, // 0x1B1B1B
                        2039583, // 0x1F1F1F
                        2171169, // 0x212121
                        2302755, // 0x232323
                        2368548, // 0x242424
                        2631720, // 0x282828
                        2697513, // 0x292929
                        2763306, // 0x2A2A2A
                        2829099, // 0x2B2B2B
                        3355443, // 0x333333 (Home Category Filter Pills)
                        3420980, // 0x343434
                        3487029, // 0x353535
                        5460819, // 0x535353
                        6645093, // 0x656565
                        7434609, // 0x717171
                        7500402, // 0x727272
                        7631988, // 0x747474
                        8158332, // 0x7C7C7C
                        723723,  // 0x0B0B0B
                        263172,  // 0x040404
                        4473924  // 0x444444
                        -> 0 // 24-bit 0x000000
                        else -> null
                    }
                    if (newIntVal != null) {
                        try {
                            val mutableMethod = mutableClass.findMutableMethodOf(method)
                            val newInsn = BuilderInstruction31i(Opcode.CONST, instruction.registerA, newIntVal)
                            mutableMethod.replaceInstruction(index, newInsn)
                            narrowLiteralsReplaced++
                            logger.fine("[Spotify AMOLED] Replaced 32-bit dark literal in ${type}->${mName}")
                        } catch (e: Exception) {
                            logger.fine("[Spotify AMOLED] Skip narrow literal replace: ${e.message}")
                        }
                    }
                }

                // C. Dark grey background hex strings
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val strRef = (instruction as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    val s = strRef.string.lowercase()
                    if (s == "#121212" || s == "#181818" || s == "#191414" || s == "#191919" || s == "#141414" ||
                        s == "#171717" || s == "#1b1b1b" || s == "#1f1f1f" || s == "#212121" || s == "#232323" ||
                        s == "#242424" || s == "#282828" || s == "#292929" || s == "#2a2a2a" || s == "#2b2b2b" ||
                        s == "#333333" || s == "#343434" || s == "#353535" || s == "#535353" || s == "#656565" || s == "#717171" ||
                        s == "#727272" || s == "#747474" || s == "#7c7c7c" || s == "#0b0b0b" || s == "#040404" || s == "#444444" ||
                        s == "121212" || s == "181818" || s == "191414" || s == "191919" || s == "141414" ||
                        s == "171717" || s == "1b1b1b" || s == "1f1f1f" || s == "212121" || s == "232323" ||
                        s == "242424" || s == "282828" || s == "292929" || s == "2a2a2a" || s == "2b2b2b" ||
                        s == "333333" || s == "343434" || s == "353535" || s == "535353" || s == "656565" || s == "717171" ||
                        s == "727272" || s == "747474" || s == "7c7c7c" || s == "0b0b0b" || s == "040404" || s == "444444"
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

            // 2. Hook background color getter methods
            val semanticMatch = mNameLower.contains("backgroundcolor") ||
                    mNameLower.contains("surfacecolor") ||
                    mNameLower.contains("darkbackground") ||
                    mNameLower.contains("elevatedcolor")

            if (semanticMatch && method.parameterTypes.isEmpty()) {
                if (retType == "I") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/high16 v0, -0x1000000
                            return v0
                            """.trimIndent() // Pure Black
                        )
                        methodsHooked++
                        logger.info("[Spotify AMOLED] Hooked background color method in: ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.fine("[Spotify AMOLED] Failed to hook ${mName}: ${e.message}")
                    }
                } else if (retType == "J") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const-wide v0, 0x00000000ff000000L
                            return-wide v0
                            """.trimIndent()
                        )
                        methodsHooked++
                        logger.info("[Spotify AMOLED] Hooked Compose background color method in: ${type}->${mName}")
                    } catch (e: Exception) {
                        logger.fine("[Spotify AMOLED] Failed to hook Compose ${mName}: ${e.message}")
                    }
                }
            }

            // 3. Force dark theme
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

    logger.info("[Spotify AMOLED] Finished: $wideLiteralsReplaced 64-bit Compose literals replaced, $narrowLiteralsReplaced 32-bit literals replaced, $stringsReplaced grey strings redirected, $methodsHooked color/theme methods hooked.")
}

