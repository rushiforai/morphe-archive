package dev.materialtidal.patches.tidal.theme.systemtheme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.removeFlags
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.materialtidal.patches.shared.COMPATIBILITY_TIDAL
import dev.materialtidal.patches.shared.EXTENSION_PATH
import dev.materialtidal.patches.shared.MATERIAL_YOU_CONFIG_CLASS
import dev.materialtidal.patches.shared.MATERIAL_YOU_ENGINE_CLASS
import dev.materialtidal.patches.tidal.theme.materialyou.materialYouThemePatch

private val THEME_MODE_CHOICES = mapOf(
    "Follow System (Recommended)" to "system",
    "Light Mode" to "light",
    "Dark Mode" to "dark",
)

private fun themeModeToCode(value: String?): Int = when (value) {
    "dark" -> 0
    "system" -> 1
    "light" -> 2
    else -> throw PatchException("Invalid themeMode option value: $value")
}

private fun staticWave2RgbToTokenName(rgb: Long): String? = when (rgb) {
    0x33FFEEL, 0x21FEECL -> "accentFill"
    0x000000L -> "baseFill"
    0x18181BL -> "baseBright"
    0x242429L -> "baseBrighter"
    0x303036L -> "baseBrightest"
    0xFFFFFFL -> "contrastFill"
    0xE4E4E7L -> "contrastDark"
    0xAFAFB6L -> "contrastDarker"
    0x787887L -> "contrastDarkest"
    0x99334EL -> "warningDark"
    0xFF3269L -> "warningFill"
    else -> null
}

private fun wave1RgbToRoleId(rgb: Long): Int? = when (rgb) {
    0x000000L -> 0 // BASE_FILL
    0x18181BL -> 1 // BASE_BRIGHT
    0x242429L -> 2 // BASE_BRIGHTER
    0x303036L -> 3 // BASE_BRIGHTEST
    0xFFFFFFL -> 4 // CONTRAST_FILL
    0xE4E4E7L -> 5 // CONTRAST_DARK
    0xAFAFB6L -> 6 // CONTRAST_DARKER
    0x787887L -> 7 // CONTRAST_DARKEST
    0x33FFEEL -> 8 // ACCENT_FILL
    else -> null
}

private fun isMoveWideOpcode(opcode: Opcode): Boolean =
    opcode == Opcode.MOVE_WIDE ||
        opcode == Opcode.MOVE_WIDE_FROM16 ||
        opcode == Opcode.MOVE_WIDE_16

private fun isColorKtColorCall(opcode: Opcode, ref: Any?): Boolean =
    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
        (ref as? MethodReference)?.let {
            it.definingClass == "Landroidx/compose/ui/graphics/ColorKt;" &&
                it.name == "Color" &&
                it.parameterTypes == listOf("J") &&
                it.returnType == "J"
        } == true

private fun clearWidePairOverlap(map: MutableMap<Int, Long>, reg: Int) {
    map.remove(reg - 1)
    map.remove(reg)
    map.remove(reg + 1)
}

/**
 * Traces {@code const-wide -> move-wide -> ColorKt.Color(J)J -> move-result-wide -> sput/iput-wide}
 * so each color field on [ownerType] maps back to its original 24-bit RGB literal.
 */
private fun extractColorFieldRgbLiterals(
    method: MutableMethod,
    ownerType: String,
    isStaticField: Boolean,
): LinkedHashMap<String, Long> {
    val constRegs = mutableMapOf<Int, Long>()
    val resultRegs = mutableMapOf<Int, Long>()
    var lastColorInput: Long? = null
    val fieldToRgb = linkedMapOf<String, Long>()
    val storeOpcode = if (isStaticField) Opcode.SPUT_WIDE else Opcode.IPUT_WIDE

    for (insn in method.instructions) {
        when {
            insn is WideLiteralInstruction -> {
                val reg = (insn as OneRegisterInstruction).registerA
                clearWidePairOverlap(resultRegs, reg)
                clearWidePairOverlap(constRegs, reg)
                constRegs[reg] = insn.wideLiteral
            }
            isMoveWideOpcode(insn.opcode) -> {
                val two = insn as TwoRegisterInstruction
                val srcConst = constRegs[two.registerB]
                val srcResult = resultRegs[two.registerB]
                clearWidePairOverlap(constRegs, two.registerA)
                clearWidePairOverlap(resultRegs, two.registerA)
                if (srcConst != null) constRegs[two.registerA] = srcConst
                if (srcResult != null) resultRegs[two.registerA] = srcResult
            }
            isColorKtColorCall(insn.opcode, (insn as? ReferenceInstruction)?.reference) -> {
                val argReg = when (insn) {
                    is FiveRegisterInstruction -> insn.registerC
                    is RegisterRangeInstruction -> insn.startRegister
                    else -> throw PatchException("Unexpected ColorKt.Color insn: ${insn.opcode}")
                }
                lastColorInput = constRegs[argReg]
            }
            insn.opcode == Opcode.MOVE_RESULT_WIDE -> {
                val reg = (insn as OneRegisterInstruction).registerA
                clearWidePairOverlap(constRegs, reg)
                clearWidePairOverlap(resultRegs, reg)
                val input = lastColorInput
                if (input != null) {
                    resultRegs[reg] = input
                }
                lastColorInput = null
            }
            insn.opcode == storeOpcode -> {
                val fieldRef = (insn as ReferenceInstruction).reference as? FieldReference
                if (fieldRef != null && fieldRef.definingClass == ownerType && fieldRef.type == "J") {
                    val srcReg = if (isStaticField) {
                        (insn as OneRegisterInstruction).registerA
                    } else {
                        (insn as TwoRegisterInstruction).registerA
                    }
                    val raw = resultRegs[srcReg]
                        ?: throw PatchException("Unresolved literal for $ownerType.${fieldRef.name}")
                    fieldToRgb[fieldRef.name] = raw and 0xFFFFFFL
                }
            }
        }
    }
    return fieldToRgb
}

@Suppress("unused")
val systemThemeModePatch = patch(
    name = "System Light & Dark theme",
    description = "Adds a Material You Light Mode and automatically switches TIDAL between Light and Dark themes following your Android system setting (or locks to Light or Dark), adapting surfaces, icons, text contrast, dialogs, and system bars.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIDAL)

    extendWith(EXTENSION_PATH)

    dependsOn(materialYouThemePatch)

    val themeModeOption by stringOption(
        key = "themeMode",
        default = "system",
        values = THEME_MODE_CHOICES,
        title = "App theme mode",
        description = "Switch TIDAL automatically between Light and Dark theme using Android's system setting, or lock it to Light or Dark (also switchable live in Settings → MaterialTidal).",
        required = true,
    )

    execute {
        val configClass = mutableClassDefBy(MATERIAL_YOU_CONFIG_CLASS)
        configClass.methods.single { it.name == "isSystemThemeModeEnabled" }.returnEarly(true)
        configClass.methods.single { it.name == "defaultThemeMode" }.returnEarly(themeModeToCode(themeModeOption))

        // 1. Wire TidalMarketThemeKt.<clinit> to pass official Light tokens (Llck;.a) as
        //    lightThemeColors and Dark tokens (Ls9k;.a) as darkThemeColors in MarketTheme(...).
        TidalMarketThemeClinitFingerprint.matchSingle().method.let { clinit ->
            val firstInsn = clinit.getInstruction(0)
            if (firstInsn.opcode != Opcode.SGET_OBJECT) {
                throw PatchException("Expected sget-object at index 0 in ${clinit.definingClass}.<clinit>, found ${firstInsn.opcode}")
            }
            val lightReg = (firstInsn as OneRegisterInstruction).registerA
            val darkFieldRef = (firstInsn as ReferenceInstruction).reference as? FieldReference
                ?: throw PatchException("Missing FieldReference at index 0 in ${clinit.definingClass}.<clinit>")

            val darkTokensClass = classDefBy(darkFieldRef.definingClass)
            val tokensInterface = darkTokensClass.interfaces.singleOrNull()
                ?: throw PatchException("Expected single interface on ${darkTokensClass.type}, found ${darkTokensClass.interfaces}")

            val darkClinit = darkTokensClass.methods.firstOrNull { it.name == "<clinit>" }
                ?: throw PatchException("Missing <clinit> on ${darkTokensClass.type}")
            val firstDarkCall = darkClinit.implementation?.instructions
                ?.firstOrNull { it.opcode == Opcode.INVOKE_VIRTUAL }
                ?.let { (it as ReferenceInstruction).reference as? MethodReference }
                ?: throw PatchException("Missing virtual palette call in ${darkTokensClass.type}.<clinit>")

            val lightCandidates = mutableListOf<ClassDef>()
            classDefForEach { cls ->
                if (cls.type != darkTokensClass.type &&
                    tokensInterface in cls.interfaces &&
                    cls.staticFields.count { it.type == cls.type } == 1
                ) {
                    val hasAltPaletteCall = cls.methods.firstOrNull { it.name == "<clinit>" }
                        ?.implementation?.instructions?.any { insn ->
                            insn.opcode == Opcode.INVOKE_VIRTUAL &&
                                ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                                    ref.definingClass == firstDarkCall.definingClass &&
                                        ref.returnType == firstDarkCall.returnType &&
                                        ref.name != firstDarkCall.name
                                } == true
                        } == true
                    if (hasAltPaletteCall) {
                        lightCandidates += cls
                    }
                }
            }
            if (lightCandidates.size != 1) {
                throw PatchException(
                    "Expected 1 Light Market tokens sibling of ${darkTokensClass.type} implementing $tokensInterface, found ${lightCandidates.size}: ${lightCandidates.map { it.type }}"
                )
            }
            val lightTokensClass = lightCandidates.single()
            val lightSelfField = lightTokensClass.staticFields.single { it.type == lightTokensClass.type }

            val marketInitIdx = clinit.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_DIRECT_RANGE &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Lcom/squareup/ui/market/core/theme/MarketTheme;" &&
                            it.name == "<init>"
                    } == true
            }
            if (marketInitIdx <= 0) {
                throw PatchException("Missing MarketTheme.<init> in ${clinit.definingClass}.<clinit>")
            }

            val moveIdx = clinit.instructions.withIndex()
                .lastOrNull { (idx, insn) ->
                    idx < marketInitIdx &&
                        insn.opcode == Opcode.MOVE_OBJECT &&
                        (insn as TwoRegisterInstruction).registerB == lightReg
                }?.index
                ?: throw PatchException("Missing move-object for darkThemeColors in ${clinit.definingClass}.<clinit>")
            val darkReg = (clinit.getInstruction(moveIdx) as TwoRegisterInstruction).registerA

            if (lightReg > 15 || darkReg > 15) {
                throw PatchException("MarketTheme registers out of sget-object range: light=v$lightReg dark=v$darkReg")
            }

            // Replace higher index first so index 0 stays valid.
            clinit.replaceInstruction(
                moveIdx,
                "sget-object v$darkReg, ${darkFieldRef.definingClass}->${darkFieldRef.name}:${darkFieldRef.type}",
            )
            clinit.replaceInstruction(
                0,
                "sget-object v$lightReg, ${lightTokensClass.type}->${lightSelfField.name}:${lightSelfField.type}",
            )
        }

        // 2. Hook Square Market dark-mode resolver (Lsta;.a and Lsta;.b) so even hardcoded
        //    ColorMode.DARK overrides follow the user's configured Light/Dark/System mode.
        MarketIsDarkThemeHelperFingerprint.matchSingle().let { match ->
            val aMethod = match.method
            val aP0 = aMethod.p0Register
            if (aP0 < 1) {
                throw PatchException("Expected p0 >= 1 in ${aMethod.definingClass}.${aMethod.name}, got $aP0")
            }
            aMethod.addInstructions(
                0,
                """
                    invoke-static/range { v$aP0 .. v$aP0 }, $MATERIAL_YOU_ENGINE_CLASS->isDarkMode(Landroid/content/Context;)Z
                    move-result v0
                    return v0
                """,
            )

            val helperClass = mutableClassDefBy(match.classDef.type)
            val bMethod = helperClass.methods.single { m ->
                AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.returnType == "Lcom/squareup/ui/market/designtokens/core/ColorMode;" &&
                    m.parameterTypes.size == 2 &&
                    m.parameterTypes[1].toString() == "Landroid/content/Context;"
            }
            val bP0 = bMethod.p0Register
            if (bP0 < 1) {
                throw PatchException("Expected p0 >= 1 in ${bMethod.definingClass}.${bMethod.name}, got $bP0")
            }
            val ctxReg = bP0 + 1
            bMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { v$ctxReg .. v$ctxReg }, $MATERIAL_YOU_ENGINE_CLASS->isDarkMode(Landroid/content/Context;)Z
                    move-result v0
                    if-eqz v0, :mt_market_light_mode
                    sget-object v0, Lcom/squareup/ui/market/designtokens/core/ColorMode;->DARK:Lcom/squareup/ui/market/designtokens/core/ColorMode;
                    return-object v0
                    :mt_market_light_mode
                    sget-object v0, Lcom/squareup/ui/market/designtokens/core/ColorMode;->LIGHT:Lcom/squareup/ui/market/designtokens/core/ColorMode;
                    return-object v0
                """,
            )
        }

        // 3. Synchronize Wave 2 live instance tokens (Lzwj;) and static constants (Lxwj;)
        //    across Light/Dark theme transitions.
        val wave2ToStringMatch = Wave2ColorsToStringFingerprint.matchSingle()
        val waveColorsClass = mutableClassDefBy(wave2ToStringMatch.classDef.type)
        wave2ToStringMatch.method.let { toStringMethod ->
            val igetNames = mutableListOf<String>()
            val rawLabels = mutableListOf<String>()
            for (insn in toStringMethod.instructions) {
                if (insn.opcode == Opcode.IGET_WIDE) {
                    val ref = (insn as ReferenceInstruction).reference as? FieldReference
                    if (ref != null && ref.definingClass == waveColorsClass.type && ref.type == "J") {
                        igetNames += ref.name
                    }
                } else if (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) {
                    val str = ((insn as ReferenceInstruction).reference as? StringReference)?.string
                    if (str != null && str.contains('=')) {
                        rawLabels += str
                    }
                }
            }
            val firstRaw = rawLabels.singleOrNull { it.startsWith("WaveColors(") && it.endsWith("=") }
                ?: throw PatchException("Missing 'WaveColors(...=' label in ${waveColorsClass.type}.toString")
            val firstToken = firstRaw.removePrefix("WaveColors(").removeSuffix("=")
            val restTokens = rawLabels
                .filter { it.startsWith(", ") && it.endsWith("=") }
                .map { it.removePrefix(", ").removeSuffix("=") }
            val tokenNames = listOf(firstToken) + restTokens
            if (igetNames.size != tokenNames.size || igetNames.size < 100) {
                throw PatchException(
                    "Mismatch in ${waveColorsClass.type}.toString fields vs labels: fields=${igetNames.size}, labels=${tokenNames.size}"
                )
            }
            val fieldMapStr = igetNames.zip(tokenNames).joinToString(";") { (f, t) -> "$f=$t" }
            configClass.methods.single { it.name == "getWave2FieldMap" }.returnEarly(fieldMapStr)
        }
        waveColorsClass.instanceFields
            .filter { it.type == "J" }
            .forEach { it.removeFlags(AccessFlags.FINAL) }

        Wave2ThemeComposableFingerprint.matchSingle().method.let { waveThemeMethod ->
            val sgetIdx = waveThemeMethod.instructions.indexOfFirst { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                        it.definingClass == "Lcom/tidal/wave2/theme/WaveThemeKt;" &&
                            it.type == waveColorsClass.type
                    } == true
            }
            if (sgetIdx < 0) {
                throw PatchException("Missing WaveThemeKt->${waveColorsClass.type} sget-object in ${waveThemeMethod.definingClass}.${waveThemeMethod.name}")
            }
            val waveColorsReg = (waveThemeMethod.getInstruction(sgetIdx) as OneRegisterInstruction).registerA
            waveThemeMethod.addInstructions(
                sgetIdx + 1,
                "invoke-static/range { v$waveColorsReg .. v$waveColorsReg }, $MATERIAL_YOU_ENGINE_CLASS->syncWave2Colors(Ljava/lang/Object;)V",
            )
        }

        Wave2StaticColorsClinitFingerprint.matchSingle().let { staticMatch ->
            val staticClass = mutableClassDefBy(staticMatch.classDef.type)
            val fieldToRgb = extractColorFieldRgbLiterals(staticMatch.method, staticClass.type, isStaticField = true)
            val expectedFields = staticClass.staticFields.filter { it.type == "J" }.map { it.name }.toSet()
            if (fieldToRgb.keys != expectedFields) {
                throw PatchException(
                    "Static Wave2 field mapping incomplete on ${staticClass.type}: expected=$expectedFields mapped=${fieldToRgb.keys}"
                )
            }
            val fieldToToken = linkedMapOf<String, String>()
            for ((name, rgb) in fieldToRgb) {
                fieldToToken[name] = staticWave2RgbToTokenName(rgb)
                    ?: throw PatchException("Unmapped static Wave2 literal 0x${rgb.toString(16)} for ${staticClass.type}.$name")
            }
            staticClass.staticFields
                .filter { it.type == "J" }
                .forEach { it.removeFlags(AccessFlags.FINAL) }

            val dottedName = staticClass.type.removePrefix("L").removeSuffix(";").replace('/', '.')
            val staticFieldMapStr = fieldToToken.entries.joinToString(";") { (k, v) -> "$k=$v" }
            configClass.methods.single { it.name == "getWave2StaticColorsClass" }.returnEarly(dottedName)
            configClass.methods.single { it.name == "getWave2StaticFieldMap" }.returnEarly(staticFieldMapStr)
        }

        // 4. Intercept TIDAL Wave 1 dark color palette getters (Lywj;.<init> & 25 ()J getters)
        //    so every Wave 1 button, badge, surface, and typography role swaps cleanly in Light Mode.
        Wave1DarkColorsInitFingerprint.matchSingle().let { wave1Match ->
            val wave1Class = mutableClassDefBy(wave1Match.classDef.type)
            val fieldToRgb = extractColorFieldRgbLiterals(wave1Match.method, wave1Class.type, isStaticField = false)
            val expectedFields = wave1Class.instanceFields.filter { it.type == "J" }.map { it.name }.toSet()
            if (fieldToRgb.keys != expectedFields) {
                throw PatchException(
                    "Wave1 field mapping incomplete on ${wave1Class.type}: expected=$expectedFields mapped=${fieldToRgb.keys}"
                )
            }
            val fieldToRole = linkedMapOf<String, Int>()
            for ((name, rgb) in fieldToRgb) {
                fieldToRole[name] = wave1RgbToRoleId(rgb)
                    ?: throw PatchException("Unmapped Wave1 literal 0x${rgb.toString(16)} for ${wave1Class.type}.$name")
            }

            val getters = wave1Class.methods.filter { m ->
                m.parameters.isEmpty() &&
                    m.returnType == "J" &&
                    !AccessFlags.STATIC.isSet(m.accessFlags)
            }
            if (getters.size != 25) {
                throw PatchException("Expected 25 ()J getters on ${wave1Class.type}, found ${getters.size}")
            }
            for (getter in getters) {
                val iget = getter.instructions.firstOrNull { it.opcode == Opcode.IGET_WIDE }
                    ?: throw PatchException("Missing iget-wide in ${wave1Class.type}.${getter.name}")
                val fieldRef = (iget as ReferenceInstruction).reference as FieldReference
                val roleId = fieldToRole[fieldRef.name]
                    ?: throw PatchException("Missing role mapping for ${wave1Class.type}.${fieldRef.name}")
                if (getter.p0Register < 2) {
                    throw PatchException("Expected p0 >= 2 for wide return in ${wave1Class.type}.${getter.name}, got ${getter.p0Register}")
                }
                getter.addInstructions(
                    0,
                    """
                        const/16 v0, $roleId
                        invoke-static { v0 }, $MATERIAL_YOU_ENGINE_CLASS->resolveWave1RoleColor(I)J
                        move-result-wide v0
                        return-wide v0
                    """,
                )
            }
        }

        // 5. Override Compose isSystemInDarkTheme() right before its return instructions so
        //    Composer.consume(LocalConfiguration) keeps tracking live configuration updates.
        ComposeIsSystemInDarkThemeFingerprint.matchSingle().method.let { m ->
            val returnIndices = m.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN }
                .map { it.index }
            if (returnIndices.isEmpty()) {
                throw PatchException("No return found in ${m.definingClass}.${m.name}")
            }
            for (idx in returnIndices.reversed()) {
                val reg = (m.getInstruction(idx) as OneRegisterInstruction).registerA
                val invokeInsn = if (reg <= 15) {
                    """
                        invoke-static { v$reg }, $MATERIAL_YOU_ENGINE_CLASS->resolveEffectiveDarkTheme(Z)Z
                        move-result v$reg
                    """.trimIndent()
                } else {
                    """
                        invoke-static/range { v$reg .. v$reg }, $MATERIAL_YOU_ENGINE_CLASS->resolveEffectiveDarkTheme(Z)Z
                        move-result v$reg
                    """.trimIndent()
                }
                m.addInstructionsAtControlFlowLabel(idx, invokeInsn)
            }
        }

        // 6. Runtime foreground safeguard on AndroidTextPaint.setColor-8_81llA and
        //    ColorFilter$Companion.tint-xETnrds to catch any remaining dark-mode foregrounds in Light Mode.
        for (fgFp in listOf(
            AndroidTextPaintSetColorFingerprint,
            ColorFilterTintFingerprint,
        )) {
            fgFp.matchSingle().method.let { m ->
                val colorReg = m.p0Register + 1
                val colorRegHigh = colorReg + 1
                m.addInstructions(
                    0,
                    """
                        invoke-static/range { v$colorReg .. v$colorRegHigh }, $MATERIAL_YOU_ENGINE_CLASS->remapComposeForegroundColor(J)J
                        move-result-wide v$colorReg
                    """,
                )
            }
        }

        // 7. Resolve Square Market textWhite (J0()/n()) to text10 in Light Mode so all Compose
        //    carousel/recent-activity titles remain high-contrast without altering textInverse buttons.
        MarketStylesheetColorsToStringFingerprint.matchSingle().let { toStringMatch ->
            val colorsClass = mutableClassDefBy(toStringMatch.classDef.type)
            val insns = toStringMatch.method.instructions
            var text10Field: FieldReference? = null
            var textWhiteField: FieldReference? = null
            for (i in insns.indices) {
                val insn = insns[i]
                if (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) {
                    val label = ((insn as ReferenceInstruction).reference as? StringReference)?.string
                    if (label == ", text10=" || label == ", textWhite=") {
                        val lookaheadEnd = minOf(insns.size, i + 6)
                        for (j in (i + 1) until lookaheadEnd) {
                            val next = insns[j]
                            if (next.opcode == Opcode.IGET_OBJECT) {
                                val ref = (next as ReferenceInstruction).reference as? FieldReference
                                if (ref != null && ref.definingClass == colorsClass.type) {
                                    if (label == ", text10=" && text10Field == null) {
                                        text10Field = ref
                                    } else if (label == ", textWhite=" && textWhiteField == null) {
                                        textWhiteField = ref
                                    }
                                    break
                                }
                            }
                        }
                    }
                }
            }
            val t10 = text10Field
                ?: throw PatchException("Missing ', text10=' field in ${colorsClass.type}.toString")
            val tWhite = textWhiteField
                ?: throw PatchException("Missing ', textWhite=' field in ${colorsClass.type}.toString")
            if (t10.type != tWhite.type) {
                throw PatchException("Mismatched MarketStylesheet color field types: ${t10.type} vs ${tWhite.type}")
            }

            val getters = colorsClass.methods.filter { m ->
                !AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.parameters.isEmpty() &&
                    m.returnType == tWhite.type &&
                    m.implementation?.instructions?.let { body ->
                        val igets = body.filter { it.opcode == Opcode.IGET_OBJECT }
                        igets.size == 1 &&
                            ((igets.single() as ReferenceInstruction).reference as? FieldReference)?.name == tWhite.name
                    } == true
            }
            if (getters.isEmpty()) {
                throw PatchException("No textWhite getters found on ${colorsClass.type} for field ${tWhite.name}")
            }
            for (getter in getters.toList()) {
                val newMethod = ImmutableMethod(
                    colorsClass.type,
                    getter.name,
                    getter.parameters.map { ImmutableMethodParameter(it.type, it.annotations, it.name) },
                    getter.returnType,
                    getter.accessFlags,
                    getter.annotations,
                    getter.hiddenApiRestrictions,
                    MutableMethodImplementation(2),
                ).toMutable()

                newMethod.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->isLightMode()Z
                        move-result v0
                        if-eqz v0, :mt_keep_text_white
                        iget-object v0, v1, ${t10.definingClass}->${t10.name}:${t10.type}
                        return-object v0
                        :mt_keep_text_white
                        iget-object v0, v1, ${tWhite.definingClass}->${tWhite.name}:${tWhite.type}
                        return-object v0
                    """.trimIndent(),
                )

                colorsClass.methods.remove(getter)
                colorsClass.methods.add(newMethod)
            }
        }

        // 8. Tint untinted monochrome white Compose ImageKt.Image icons (Home AppBarIcon & "My Tracks")
        //    to onSurface in Light Mode while preserving null ColorFilter in Dark Mode.
        for (iconFp in listOf(
            HomeAppBarIconFingerprint,
            ShortcutDeeplinkIconFingerprint,
        )) {
            hookComposeImageTintForLightMode(iconFp.matchSingle().method)
        }
    }
}

private fun hookComposeImageTintForLightMode(method: MutableMethod) {
    val insns = method.instructions
    val imageIdx = insns.indexOfFirst { insn ->
        insn.opcode == Opcode.INVOKE_STATIC_RANGE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Landroidx/compose/foundation/ImageKt;" &&
                    it.name == "Image" &&
                    it.parameterTypes.size == 10
            } == true
    }
    if (imageIdx < 5) {
        throw PatchException("Missing ImageKt.Image in ${method.definingClass}.${method.name} (idx=$imageIdx)")
    }
    val rangeInsn = insns[imageIdx] as RegisterRangeInstruction
    if (rangeInsn.registerCount != 10) {
        throw PatchException("Unexpected ImageKt.Image registerCount=${rangeInsn.registerCount} in ${method.definingClass}.${method.name}")
    }
    val base = rangeInsn.startRegister
    val s0 = base + 3 // Alignment (initially 0)
    val s1 = base + 4 // ContentScale (initially 0)
    val s2 = base + 5 // alpha (initially 0)
    val s3 = base + 6 // ColorFilter (initially 0)
    val defaultReg = base + 9 // defaultMask (expected 0x78)
    if (defaultReg > 15) {
        throw PatchException("ImageKt.Image registers exceed 15 (defaultReg=v$defaultReg) in ${method.definingClass}.${method.name}")
    }

    val lookbackStart = maxOf(0, imageIdx - 10)
    val recent = insns.subList(lookbackStart, imageIdx)
    val hasDefault78 = recent.any { insn ->
        insn is OneRegisterInstruction &&
            insn is NarrowLiteralInstruction &&
            insn.registerA == defaultReg &&
            insn.narrowLiteral == 0x78
    }
    val hasZeroArgs = listOf(s0, s1, s2, s3).all { targetReg ->
        recent.any { insn ->
            insn is OneRegisterInstruction &&
                insn is NarrowLiteralInstruction &&
                insn.registerA == targetReg &&
                insn.narrowLiteral == 0
        }
    }
    if (!hasDefault78 || !hasZeroArgs) {
        throw PatchException(
            "Unexpected pre-call constants before ImageKt.Image in ${method.definingClass}.${method.name} " +
                "(hasDefault78=$hasDefault78, hasZeroArgs=$hasZeroArgs)"
        )
    }

    method.addInstructionsWithLabels(
        imageIdx,
        """
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->isLightMode()Z
            move-result v$s0
            if-eqz v$s0, :mt_restore_zero_args
            sget-object v$s0, Landroidx/compose/ui/graphics/ColorFilter;->Companion:Landroidx/compose/ui/graphics/ColorFilter${'$'}Companion;
            invoke-static {}, $MATERIAL_YOU_ENGINE_CLASS->getOnSurfaceCompose()J
            move-result-wide v$s1
            sget-object v$s3, Landroidx/compose/ui/graphics/BlendMode;->Companion:Landroidx/compose/ui/graphics/BlendMode${'$'}Companion;
            invoke-virtual { v$s3 }, Landroidx/compose/ui/graphics/BlendMode${'$'}Companion;->getSrcIn-0nO6VwU()I
            move-result v$s3
            invoke-virtual { v$s0, v$s1, v$s2, v$s3 }, Landroidx/compose/ui/graphics/ColorFilter${'$'}Companion;->tint-xETnrds(JI)Landroidx/compose/ui/graphics/ColorFilter;
            move-result-object v$s3
            const/16 v$defaultReg, 0x38
            :mt_restore_zero_args
            const/4 v$s0, 0x0
            const/4 v$s1, 0x0
            const/4 v$s2, 0x0
        """.trimIndent(),
    )
}
