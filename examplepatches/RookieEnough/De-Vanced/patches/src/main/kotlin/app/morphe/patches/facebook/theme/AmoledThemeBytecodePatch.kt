/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.shared.Constants
import app.morphe.patches.facebook.shared.FacebookTargets
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val extensionPatch = sharedExtensionPatch("facebook", false)

private const val AMOLED_THEME =
    "Lapp/morphe/extension/facebook/theme/AmoledTheme;"
private const val AMOLED_APPLY =
    "$AMOLED_THEME->apply(ILjava/lang/Object;)I"
private const val PARSE_COLOR =
    "Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I"
private const val PARSE_COLOR_DARK =
    "$AMOLED_THEME->parseColor(Ljava/lang/String;)I"
private const val VIEW_SET_BACKGROUND_COLOR =
    "Landroid/view/View;->setBackgroundColor(I)V"
private const val VIEW_SET_BACKGROUND =
    "Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V"
private const val VIEW_SET_BACKGROUND_RESOURCE =
    "Landroid/view/View;->setBackgroundResource(I)V"
private const val VIEW_SET_FOREGROUND =
    "Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V"
private const val VIEW_SET_BACKGROUND_TINT_LIST =
    "Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V"
private const val DRAWABLE_SET_TINT =
    "Landroid/graphics/drawable/Drawable;->setTint(I)V"
private const val DRAWABLE_SET_TINT_LIST =
    "Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V"
private const val GRADIENT_SET_COLOR =
    "Landroid/graphics/drawable/GradientDrawable;->setColor(I)V"
private const val GRADIENT_SET_COLOR_STATE =
    "Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V"
private const val GRADIENT_SET_COLORS =
    "Landroid/graphics/drawable/GradientDrawable;->setColors([I)V"
private const val GRADIENT_CONSTRUCTOR =
    "Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable\$Orientation;[I)V"
private const val GRADIENT_COLOR_REPAIR =
    "$AMOLED_THEME->repairGradientColors([I)[I"
private const val RESOURCES_GET_COLOR =
    "Landroid/content/res/Resources;->getColor(I)I"
private const val RESOURCES_GET_COLOR_THEME =
    "Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources\$Theme;)I"
private const val CONTEXT_GET_COLOR =
    "Landroid/content/Context;->getColor(I)I"
private const val TYPED_ARRAY_GET_COLOR =
    "Landroid/content/res/TypedArray;->getColor(II)I"
private val VIEW_BACKGROUND_CALLS = mapOf(
    VIEW_SET_BACKGROUND_COLOR to
        "$AMOLED_THEME->setBackgroundColor(Landroid/view/View;I)V",
    VIEW_SET_BACKGROUND to
        "$AMOLED_THEME->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V",
    VIEW_SET_BACKGROUND_RESOURCE to
        "$AMOLED_THEME->setBackgroundResource(Landroid/view/View;I)V",
    VIEW_SET_FOREGROUND to
        "$AMOLED_THEME->setForeground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V",
    VIEW_SET_BACKGROUND_TINT_LIST to
        "$AMOLED_THEME->setBackgroundTintList(Landroid/view/View;Landroid/content/res/ColorStateList;)V",
    DRAWABLE_SET_TINT to
        "$AMOLED_THEME->setDrawableTint(Landroid/graphics/drawable/Drawable;I)V",
    DRAWABLE_SET_TINT_LIST to
        "$AMOLED_THEME->setDrawableTintList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V",
    GRADIENT_SET_COLOR to
        "$AMOLED_THEME->setGradientColor(Landroid/graphics/drawable/Drawable;I)V",
    GRADIENT_SET_COLOR_STATE to
        "$AMOLED_THEME->setGradientColorStateList(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V",
    GRADIENT_SET_COLORS to
        "$AMOLED_THEME->setGradientColors(Landroid/graphics/drawable/Drawable;[I)V",
    RESOURCES_GET_COLOR to
        "$AMOLED_THEME->getColor(Landroid/content/res/Resources;I)I",
    RESOURCES_GET_COLOR_THEME to
        "$AMOLED_THEME->getColor(Landroid/content/res/Resources;ILandroid/content/res/Resources\$Theme;)I",
    CONTEXT_GET_COLOR to
        "$AMOLED_THEME->getContextColor(Landroid/content/Context;I)I",
    TYPED_ARRAY_GET_COLOR to
        "$AMOLED_THEME->getTypedArrayColor(Landroid/content/res/TypedArray;II)I",
)
private const val EXTENSION_PACKAGE =
    "Lapp/morphe/extension/"
private const val DARK_COLOR_SCHEME =
    "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;"
private const val FDS_COLOR_SCHEME =
    "Lcom/facebook/mig/scheme/schemes/fds/FdsColorScheme;"
private const val BLACK = -0x1000000
private const val FDS_COLORS =
    "Lcom/facebook/fds/core/theme/component/FDSColors;"

private fun MutableMethod.patchColorReturns(
    contextParameter: String,
    tokenParameter: String,
    contextFromComponent: Boolean,
    componentType: String? = null,
    expectedReturns: Int = 2,
): Int {
    val originalInstructions = implementation!!.instructions.toList()
    val returnIndexes = originalInstructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { (index, _) -> index }
    check(returnIndexes.size == expectedReturns) {
        "Expected $expectedReturns color return sites in $definingClass->$name"
    }

    returnIndexes.asReversed().forEach { returnIndex ->
        val returnRegister =
            (originalInstructions[returnIndex] as OneRegisterInstruction)
                .registerA
        val freeRegisters = getFreeRegisterProvider(returnIndex, 3)
        val contextRegister = freeRegisters.getFreeRegister4Bit()
        val tokenRegister = freeRegisters.getFreeRegister4Bit()
        val colorRegister = freeRegisters.getFreeRegister4Bit()
        val resolveContext = if (contextFromComponent) {
            val type = requireNotNull(componentType) {
                "FDS component type is required"
            }
            """
                move-object/from16 v$contextRegister, $contextParameter
                iget-object v$contextRegister, v$contextRegister, $type->A0C:Landroid/content/Context;
            """.trimIndent()
        } else {
            "move-object/from16 v$contextRegister, $contextParameter"
        }
        addInstructions(
            returnIndex,
            """
                $resolveContext
                move-object/from16 v$tokenRegister, $tokenParameter
                move/from16 v$colorRegister, v$returnRegister
                invoke-static {v$contextRegister, v$tokenRegister, v$colorRegister}, $AMOLED_THEME->overrideFdsColor(Landroid/content/Context;Ljava/lang/Object;I)I
                move-result v$colorRegister
                move/from16 v$returnRegister, v$colorRegister
            """.trimIndent(),
        )
    }
    return returnIndexes.size
}

private fun MutableMethod.hook580FdsColor(): Int {
    val original = implementation!!.instructions.toList()
    val returnIndexes = original.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { (index, _) -> index }
    check(returnIndexes.isNotEmpty()) {
        "Expected color return sites in $definingClass->$name"
    }
    returnIndexes.asReversed().forEach { returnIndex ->
        val returnRegister =
            (original[returnIndex] as OneRegisterInstruction).registerA
        addInstructions(
            returnIndex,
            """
                invoke-static {p1, p2, v$returnRegister}, $AMOLED_THEME->overrideFdsColor(Landroid/content/Context;Ljava/lang/Object;I)I
                move-result v$returnRegister
            """.trimIndent(),
        )
    }
    return returnIndexes.size
}

private fun CharSequence.width(): Int =
    if (toString() == "J" || toString() == "D") 2 else 1

private fun Method.parameterRegisterNumber(index: Int): Int {
    val self = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val parameterCount = self + parameterTypes.sumOf { it.width() }
    val target = self + parameterTypes.take(index).sumOf { it.width() }
    return implementation!!.registerCount - parameterCount + target
}

/**
 * Hooks every `return <int>` in a color resolver. A branch target check keeps an inserted hook
 * from being skipped by Facebook's own control flow.
 */
private fun MutableMethod.hookColorReturns(
    tokenParameterIndex: Int,
    target: String,
): Int {
    val instructions = implementation!!.instructions.toList()
    val addresses = instructions.runningFold(0) { address, instruction ->
        address + instruction.codeUnits
    }
    val indexOfAddress = addresses.withIndex()
        .associate { (index, address) -> address to index }
    val branchTargets = instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction is OffsetInstruction) {
            indexOfAddress[addresses[index] + instruction.codeOffset]
        } else {
            null
        }
    }.toSet()
    val returns = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { (index, instruction) ->
            index to (instruction as OneRegisterInstruction).registerA
        }
    check(returns.isNotEmpty()) {
        "$definingClass->$name returns no int to hook"
    }

    val tokenRegister = parameterRegisterNumber(tokenParameterIndex)
    check(tokenRegister < 16) {
        "$definingClass->$name token register v$tokenRegister is outside invoke-static range"
    }

    returns.asReversed().forEach { (index, returnRegister) ->
        check(returnRegister < 16) {
            "$definingClass->$name return register v$returnRegister is outside invoke-static range"
        }
        check(index !in branchTargets) {
            "$definingClass->$name return at $index is a branch target"
        }
        addInstructions(
            index,
            """
                invoke-static {v$returnRegister, v$tokenRegister}, $target
                move-result v$returnRegister
            """.trimIndent(),
        )
    }
    return returns.size
}

private fun BytecodePatchContext.fdsViewResolver(): MutableMethod {
    val resolverCall = FdsSchemeResolveFingerprint.method
        .implementation!!.instructions.mapNotNull { instruction ->
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        }.singleOrNull { reference ->
            reference.returnType == "I" &&
                reference.parameterTypes.any { it.toString() == "Landroid/content/Context;" }
        } ?: error("Facebook 580 FDS view resolver call was not resolved")
    check(resolverCall.definingClass.toString() != FDS_COLOR_SCHEME) {
        "Facebook 580 FDS view resolver moved into FdsColorScheme"
    }

    return mutableClassDefBy(resolverCall.definingClass.toString())
        .methods.single { method ->
            method.name == resolverCall.name &&
                method.returnType == "I" &&
                method.parameterTypes.map(CharSequence::toString) ==
                resolverCall.parameterTypes.map(CharSequence::toString)
        }
}

private fun isDarkNeutral(red: Int, green: Int, blue: Int): Boolean {
    val high = maxOf(red, green, blue)
    return high <= 0x2A && high - minOf(red, green, blue) <= 8
}

private fun Instruction.isDarkColor(): Boolean {
    if (this !is NarrowLiteralInstruction || this !is OneRegisterInstruction) return false
    val value = narrowLiteral
    if (value == BLACK || (value ushr 24) != 0xFF) return false
    return isDarkNeutral(
        (value shr 16) and 0xFF,
        (value shr 8) and 0xFF,
        value and 0xFF,
    )
}

private fun Method.hasDarkColor(): Boolean =
    implementation?.instructions?.any { it.isDarkColor() } == true

private fun MutableMethod.blackenDarkColors(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.isDarkColor() }
        .map { (index, instruction) ->
            Triple(
                index,
                (instruction as OneRegisterInstruction).registerA,
                instruction.opcode,
            )
        }

    sites.asReversed().forEach { (index, register, opcode) ->
        val replacement = when (opcode) {
            Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32 ->
                "const-wide/32 v$register, $BLACK"
            else -> "const v$register, $BLACK"
        }
        replaceInstruction(index, replacement)
    }
    return sites.size
}

private fun Instruction.isParseColorCall(): Boolean =
    (this as? ReferenceInstruction)?.reference?.toString() == PARSE_COLOR

private fun Method.callsParseColor(): Boolean =
    implementation?.instructions?.any { it.isParseColorCall() } == true

private fun MutableMethod.rerouteParseColor(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) -> instruction.isParseColorCall() }

    sites.asReversed().forEach { (index, instruction) ->
        val replacement = when (instruction) {
            is RegisterRangeInstruction ->
                "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister}}, $PARSE_COLOR_DARK"
            is FiveRegisterInstruction ->
                "invoke-static {v${instruction.registerC}}, $PARSE_COLOR_DARK"
            else -> error(
                "$definingClass->$name has unsupported Color.parseColor call form ${instruction.opcode}",
            )
        }
        replaceInstruction(index, replacement)
    }
    return sites.size
}

private fun Instruction.backgroundOverride(): String? {
    val reference = (this as? ReferenceInstruction)?.reference
        as? MethodReference ?: return null
    return VIEW_BACKGROUND_CALLS[reference.toString()]
}

private fun Method.callsViewBackground(): Boolean =
    implementation?.instructions?.any {
        it.opcode != Opcode.INVOKE_SUPER &&
            it.backgroundOverride() != null
    } == true

private fun MutableMethod.rerouteViewBackgrounds(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.opcode != Opcode.INVOKE_SUPER &&
                instruction.backgroundOverride() != null
        }

    sites.asReversed().forEach { (index, instruction) ->
        val target = requireNotNull(instruction.backgroundOverride())
        val registers = when (instruction) {
            is RegisterRangeInstruction ->
                (instruction.startRegister until
                    instruction.startRegister + instruction.registerCount).toList()
            is FiveRegisterInstruction ->
                listOf(
                    instruction.registerC,
                    instruction.registerD,
                    instruction.registerE,
                    instruction.registerF,
                    instruction.registerG,
                ).take(instruction.registerCount)
            else -> error(
                "$definingClass->$name has unsupported override call form " +
                    instruction.opcode,
            )
        }
        val replacement = if (registers.all { it < 16 }) {
            "invoke-static {${registers.joinToString(", ") { "v$it" }}}, $target"
        } else {
            "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $target"
        }
        replaceInstruction(index, replacement)
    }
    return sites.size
}

private fun Instruction.isGradientConstructor(): Boolean =
    (this as? ReferenceInstruction)?.reference?.toString() ==
        GRADIENT_CONSTRUCTOR

private fun Method.callsGradientConstructor(): Boolean =
    implementation?.instructions?.any { it.isGradientConstructor() } == true

private fun MutableMethod.rerouteGradientConstructors(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { (_, instruction) ->
            instruction.isGradientConstructor()
        }

    sites.asReversed().forEach { (index, instruction) ->
        val colorsRegister = when (instruction) {
            is RegisterRangeInstruction ->
                instruction.startRegister + instruction.registerCount - 1
            is FiveRegisterInstruction -> instruction.registerE
            else -> error(
                "$definingClass->$name has unsupported GradientDrawable constructor form " +
                    instruction.opcode,
            )
        }
        val invoke = if (colorsRegister < 16) {
            "invoke-static {v$colorsRegister}, $GRADIENT_COLOR_REPAIR"
        } else {
            "invoke-static/range {v$colorsRegister .. v$colorsRegister}, $GRADIENT_COLOR_REPAIR"
        }
        addInstructions(
            index,
            """
                $invoke
                move-result-object v$colorsRegister
            """.trimIndent(),
        )
    }
    return sites.size
}

@Suppress("unused")
val amoledThemePatch = bytecodePatch(
    name = "AMOLED dark theme",
    description = "Makes Facebook's native dark themes use pure-black AMOLED surfaces.",
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(
        extensionPatch,
        amoledThemeResourcePatch,
    )

    execute {
        if (packageMetadata.versionName == FacebookTargets.V580) {
            val contextReturns = FdsContextColor580Fingerprint.method
                .hook580FdsColor()
            val componentReturns = FdsComponentColor580Fingerprint.method
                .hook580FdsColor()
            val migReturns = DarkSchemeResolveFingerprint.method
                .hookColorReturns(0, AMOLED_APPLY)
            val viewReturns = fdsViewResolver()
                .hookColorReturns(1, AMOLED_APPLY)

            val parserOwners = mutableSetOf<String>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith(EXTENSION_PACKAGE)) {
                    return@classDefForEach
                }
                if (classDef.methods.any { it.callsParseColor() }) {
                    parserOwners += classDef.type
                }
            }
            val reroutedParsers = parserOwners.sumOf { type ->
                mutableClassDefByOrNull(type)?.methods?.sumOf {
                    it.rerouteParseColor()
                } ?: 0
            }
            check(reroutedParsers > 0) {
                "No Color.parseColor call found for Facebook 580"
            }

            val backgroundOwners = mutableSetOf<String>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith(EXTENSION_PACKAGE)) {
                    return@classDefForEach
                }
                if (classDef.methods.any { it.callsViewBackground() }) {
                    backgroundOwners += classDef.type
                }
            }
            val reroutedBackgrounds = backgroundOwners.sumOf { type ->
                mutableClassDefByOrNull(type)?.methods?.sumOf {
                    it.rerouteViewBackgrounds()
                } ?: 0
            }
            check(reroutedBackgrounds > 0) {
                "No View background assignment found for Facebook 580"
            }

            val constructorOwners = mutableSetOf<String>()
            classDefForEach { classDef ->
                if (classDef.type.startsWith(EXTENSION_PACKAGE)) {
                    return@classDefForEach
                }
                if (classDef.methods.any { it.callsGradientConstructor() }) {
                    constructorOwners += classDef.type
                }
            }
            val repairedConstructors = constructorOwners.sumOf { type ->
                mutableClassDefByOrNull(type)?.methods?.sumOf {
                    it.rerouteGradientConstructors()
                } ?: 0
            }
            check(repairedConstructors > 0) {
                "No GradientDrawable constructor found for Facebook 580"
            }

            println(
                "[AmoledTheme] 580 contextReturns=$contextReturns " +
                    "componentReturns=$componentReturns " +
                    "migReturns=$migReturns viewReturns=$viewReturns " +
                    "reroutedParsers=$reroutedParsers " +
                    "reroutedBackgrounds=$reroutedBackgrounds " +
                    "repairedConstructors=$repairedConstructors",
            )
            return@execute
        }

        val resolverMethod = FdsThemeResolverColorFingerprint.method
        val resolverType = resolverMethod.definingClass
        val tokenType =
            resolverMethod.parameterTypes[1].toString()
        val fallbackReference =
            "$resolverType->A03(Landroid/content/Context;$tokenType)I"

        val contextMethod = FdsContextColorFingerprint.method
        val contextReferences = contextMethod.implementation!!.instructions
            .mapNotNull {
                (it as? ReferenceInstruction)?.reference?.toString()
            }
        check(
            contextReferences.count {
                it == fallbackReference
            } == 1,
        ) {
            "Facebook context FDS fallback was not resolved exactly once"
        }

        val componentMethod = FdsComponentColorFingerprint.method
        val componentReferences = componentMethod.implementation!!.instructions
            .mapNotNull {
                (it as? ReferenceInstruction)?.reference?.toString()
            }
        check(
            componentReferences.count {
                it == fallbackReference
            } == 1,
        ) {
            "Facebook component FDS fallback was not resolved exactly once"
        }

        val contextReturns = contextMethod.patchColorReturns(
            contextParameter = "p1",
            tokenParameter = "p2",
            contextFromComponent = false,
        )
        val componentReturns = componentMethod.patchColorReturns(
            contextParameter = "p2",
            tokenParameter = "p1",
            contextFromComponent = true,
            componentType =
                componentMethod.parameterTypes[1].toString(),
        )
        val resolverReferences = resolverMethod.implementation!!.instructions
            .mapNotNull {
                (it as? ReferenceInstruction)?.reference?.toString()
            }
        check(
            resolverReferences.count {
                it == "Landroid/content/res/TypedArray;->getColor(II)I"
            } == 1,
        ) {
            "Facebook 576 semantic color resolver changed"
        }
        val resolverReturns = resolverMethod.patchColorReturns(
            contextParameter = "p0",
            tokenParameter = "p1",
            contextFromComponent = false,
            expectedReturns = 1,
        )
        println(
            "[AmoledTheme] contextReturns=$contextReturns " +
                "componentReturns=$componentReturns " +
                "resolverReturns=$resolverReturns",
        )
    }
}

object FdsContextColorFingerprint : Fingerprint(
    definingClass = FDS_COLORS,
    name = "A0A",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
        "L",
    ),
)

object FdsComponentColorFingerprint : Fingerprint(
    definingClass = FDS_COLORS,
    name = "A0B",
    returnType = "I",
    parameters = listOf(
        "L",
        "L",
    ),
)

object FdsContextColor580Fingerprint : Fingerprint(
    definingClass = FDS_COLORS,
    name = "A0A",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
        "L",
    ),
)

object FdsComponentColor580Fingerprint : Fingerprint(
    definingClass = FDS_COLORS,
    name = "A0B",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
        "L",
    ),
)

object FdsThemeResolverColorFingerprint : Fingerprint(
    name = "A00",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Context;",
        "L",
    ),
    custom = { method, _ ->
        method.implementation?.instructions?.count {
            (it as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/content/res/TypedArray;->getColor(II)I"
        } == 1
    },
)

object DarkSchemeResolveFingerprint : Fingerprint(
    definingClass = DARK_COLOR_SCHEME,
    returnType = "I",
    parameters = listOf("L"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        if (instructions == null) {
            false
        } else {
            val resolvesInterface = instructions.filter {
                it.opcode == Opcode.INVOKE_INTERFACE
            }.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.any { it.returnType == "I" }
            resolvesInterface &&
                instructions.any { it.opcode == Opcode.MOVE_RESULT } &&
                instructions.any { it.opcode == Opcode.RETURN }
        }
    },
)

object FdsSchemeResolveFingerprint : Fingerprint(
    definingClass = FDS_COLOR_SCHEME,
    returnType = "I",
    parameters = listOf("L"),
    custom = { method, _ ->
        val instructions = method.implementation?.instructions
        if (instructions == null) {
            false
        } else {
            val readsContext = instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? FieldReference
                reference != null &&
                    reference.definingClass == FDS_COLOR_SCHEME &&
                    reference.type == "Landroid/content/Context;"
            }
            val callsIntResolver = instructions.filter {
                it.opcode == Opcode.INVOKE_STATIC
            }.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.any { it.returnType == "I" }
            readsContext &&
                callsIntResolver &&
                instructions.any { it.opcode == Opcode.MOVE_RESULT } &&
                instructions.any { it.opcode == Opcode.RETURN }
        }
    },
)
