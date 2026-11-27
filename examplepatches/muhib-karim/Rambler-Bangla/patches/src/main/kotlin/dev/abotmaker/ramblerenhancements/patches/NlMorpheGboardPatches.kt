/*
 * Rambler Bangla - Gboard 18.5.4 ports of nl-morphe-patches features:
 *   1. AMOLED Dark Keyboard (pure #000000 Material 3 dark surfaces)
 *   2. Rambler Toolbar & Revert Extras (overflow menu, keep rewritten on revert, quick-paste)
 *   3. Hidden Flags Override (native Gboard override-store toggles)
 *
 * Adapted from johninnld/nl-morphe-patches (GPL-3.0). See ATTRIBUTION.md and THIRD-PARTY-NOTICES.md.
 */
package dev.abotmaker.ramblerenhancements.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val AMOLED_DARK_BACKGROUND = "0xff000000"
internal const val AMOLED_DARK_COLOR = -0x1000000

private val AMOLED_SURFACE_TOKENS = listOf(
    "color_gm3_surface_dim",
    "color_gm3_surface_container",
    "color_gm3_surface_container_low",
    "color_gm3_surface_container_lowest",
)

@Suppress("unused")
val gboardAmoledDarkKeyboardPatch = bytecodePatch(
    name = "AMOLED Dark Keyboard",
    description = "Turns Gboard's Material You dark keyboard surfaces pure AMOLED black (#000000) " +
        "instead of grey while leaving the light theme, accent colors, and key faces unchanged. " +
        "Ported from nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val targets = resolveAmoledPaletteTargets(this)
        targets.constructor.applyAmoledDarkPalette(
            isLightField = targets.isLightField,
            surfaceFields = targets.surfaceFields,
        )
    }
}

@Suppress("unused")
val ramblerToolbarExtrasPatch = bytecodePatch(
    name = "Rambler Toolbar & Revert Extras",
    description = "Enables Gboard 18.5.4's floating Rambler toolbar overflow menu, keeps rewritten " +
        "text when reverting from the full transcript, and activates one-tap direct clipboard " +
        "quick-paste. Ported from nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.RAMBLER_EXTRAS)
    }
}

@Suppress("unused")
val gboardHiddenFlagsOverridePatch = bytecodePatch(
    name = "Hidden Flags Override",
    description = "Applies curated Gboard 18.5.4 hidden/beta flags (direct quick-paste chip, " +
        "Rambler toolbar overflow, preserve rewritten on revert, auto parallel retry, toolbar " +
        "entry, UI persistence, emoji skin-tone replacement, email provider completion) through " +
        "Gboard's own OVERRIDE flag store with live toggles inside Settings. Ported from " +
        "nl-morphe-patches for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.HIDDEN_FLAGS)
    }
}

@Suppress("unused")
val ramblerAtMentionSuggestionsPatch = bytecodePatch(
    name = "At-Mention & Email Strip Suggestions",
    description = "Native Gboard suggestion-strip personalized @handle and email domain suggestions: " +
        "renders directly inside Gboard's own themed suggestion bar (zero floating overlay; matches " +
        "AMOLED Dark, Material You, Frosted Glass & Custom Themes), learns typed/sent/dictated " +
        "@mentions (e.g. @grok, @claude) without fixed standalone defaults, supports native " +
        "drag-up-to-remove and Settings add/manage, and stays fail-closed in password/incognito " +
        "fields for Gboard 18.5.4.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(
        ramblerSharedExtensionPatch,
        ramblerSharedSettingsResourcePatch,
    )

    execute {
        RamblerPatchStateStore.state(this).selectedFeatures.add(RamblerFeature.AT_MENTION_SUGGESTIONS)
    }
}

internal data class AmoledPaletteTargets(
    val constructor: MutableMethod,
    val isLightField: String,
    val surfaceFields: List<String>,
)

internal fun resolveAmoledPaletteTargets(context: BytecodePatchContext): AmoledPaletteTargets {
    val matches = mutableListOf<Pair<ClassDef, Method>>()
    context.classDefForEach { cls ->
        for (method in cls.methods) {
            val insns = method.implementation?.instructions ?: continue
            val strings = mutableSetOf<String>()
            for (insn in insns) {
                val ref = (insn as? ReferenceInstruction)?.reference as? StringReference ?: continue
                if (ref.string in AMOLED_SURFACE_TOKENS) {
                    strings.add(ref.string)
                }
            }
            if (strings.size == AMOLED_SURFACE_TOKENS.size) {
                matches.add(cls to method)
            }
        }
    }
    val (paletteClass, builderMethod) = matches.singleOrNull()
        ?: throw PatchException(
            "FAIL-CLOSED: Expected exactly 1 Material 3 GM3 palette class owning " +
                "$AMOLED_SURFACE_TOKENS, found ${matches.size}",
        )

    // Extract the 4 int field references paired with the 4 surface tokens in builderMethod.
    val builderInsns = builderMethod.implementation!!.instructions.toList()
    val fieldsByToken = linkedMapOf<String, String>()
    for (idx in builderInsns.indices) {
        val str = ((builderInsns[idx] as? ReferenceInstruction)?.reference as? StringReference)?.string
            ?: continue
        if (str !in AMOLED_SURFACE_TOKENS || str in fieldsByToken) continue
        // Look ahead up to 6 instructions for `iget vX, p0, L<cls>;-><field>:I`.
        for (j in (idx + 1) until minOf(idx + 7, builderInsns.size)) {
            val next = builderInsns[j]
            if (next.opcode == Opcode.IGET) {
                val fref = (next as? ReferenceInstruction)?.reference as? FieldReference
                if (fref != null && fref.definingClass == paletteClass.type && fref.type == "I") {
                    fieldsByToken[str] = fref.toString()
                    break
                }
            }
        }
    }
    if (fieldsByToken.size != AMOLED_SURFACE_TOKENS.size) {
        throw PatchException(
            "FAIL-CLOSED: Expected all 4 GM3 surface fields in ${paletteClass.type}, " +
                "resolved ${fieldsByToken.keys}",
        )
    }

    // Locate the unique boolean `isLight` field on the palette class written in <init>(Context, Z)V.
    val mutableClass = context.mutableClassDefBy(paletteClass.type)
    val ctor = mutableClass.methods.singleOrNull { m ->
        m.name == "<init>" &&
            m.parameterTypes.map { it.toString() } == listOf("Landroid/content/Context;", "Z") &&
            m.returnType == "V"
    } ?: throw PatchException(
        "FAIL-CLOSED: Missing <init>(Context, Z)V on GM3 palette class ${paletteClass.type}",
    )

    val boolFields = paletteClass.instanceFields.filter { it.type == "Z" }
    val isLightFieldRef = boolFields.singleOrNull()?.let { f ->
        "${paletteClass.type}->${f.name}:Z"
    } ?: throw PatchException(
        "FAIL-CLOSED: Expected 1 boolean isLight field on ${paletteClass.type}, found ${boolFields.size}",
    )

    return AmoledPaletteTargets(
        constructor = ctor,
        isLightField = isLightFieldRef,
        surfaceFields = AMOLED_SURFACE_TOKENS.map { fieldsByToken.getValue(it) },
    )
}

internal fun MutableMethod.applyAmoledDarkPalette(
    isLightField: String,
    surfaceFields: List<String>,
) {
    require(surfaceFields.isNotEmpty()) { "No palette fields to override in $definingClass->$name" }
    val impl = implementation ?: throw PatchException("No instructions in $definingClass->$name")
    val instructions = impl.instructions.toList()
    val alreadyPatched = instructions.any { insn ->
        insn.opcode == Opcode.CONST_HIGH16 &&
            (insn as NarrowLiteralInstruction).narrowLiteral == AMOLED_DARK_COLOR
    }
    if (alreadyPatched) return

    surfaceFields.forEach { field ->
        val writes = instructions.count { insn ->
            insn.opcode == Opcode.IPUT &&
                (insn as? ReferenceInstruction)?.reference?.toString() == field
        }
        if (writes < 1) {
            throw PatchException("FAIL-CLOSED: Could not find stock $field write in $definingClass->$name")
        }
    }

    val returns = instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }
    if (returns.size != 1) {
        throw PatchException("FAIL-CLOSED: Expected 1 RETURN_VOID in $definingClass->$name, found ${returns.size}")
    }

    val paramRegs = 1 + parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val localCount = impl.registerCount - paramRegs
    val scratch = minOf(localCount - 1, 15)
    if (scratch < 0) {
        throw PatchException("FAIL-CLOSED: No local register available in $definingClass->$name")
    }
    // Check that p0 is addressable by 4-bit iget-boolean/iput (paramRegs <= 16 -> p0 <= 15; else move).
    val p0RegIndex = localCount
    val returnIndex = returns.single()
    val snippet = if (p0RegIndex <= 15) {
        buildString {
            appendLine("iget-boolean v$scratch, p0, $isLightField")
            appendLine("if-nez v$scratch, :amoled_dark_surface_done")
            appendLine("const/high16 v$scratch, $AMOLED_DARK_BACKGROUND")
            surfaceFields.forEach { appendLine("iput v$scratch, p0, $it") }
        }
    } else {
        if (localCount < 2) {
            throw PatchException("FAIL-CLOSED: Need 2 low local registers for high p0 in $definingClass->$name")
        }
        buildString {
            appendLine("move-object/from16 v0, p0")
            appendLine("iget-boolean v1, v0, $isLightField")
            appendLine("if-nez v1, :amoled_dark_surface_done")
            appendLine("const/high16 v1, $AMOLED_DARK_BACKGROUND")
            surfaceFields.forEach { appendLine("iput v1, v0, $it") }
        }
    }
    addInstructionsWithLabels(
        returnIndex,
        snippet,
        ExternalLabel("amoled_dark_surface_done", getInstruction(returnIndex)),
    )
}
