/*
 * Material You theme patch: hooks Messenger's dark mode colour resolution to tint it
 * with the wallpaper palette on Android 12+.
 *
 * Four routes:
 * 1. Mig dark scheme resolver returns → mig() recolours greys and blues; the light scheme's → migLight() its blues
 * 2. FDS colour resolver returns → fds() recolours greys and blues
 * 3. Dark surface constants (0xFF080809 etc.) → reads from volatile fields
 * 4. Color.parseColor and Context.getColor → surface-aware wrappers
 *
 * The dark mode detection hook sends Messenger's own answer through
 * MaterialYouTheme.darkModeAnswer() so the runtime knows when to act.
 */
package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val THEME = "Lapp/hushmessenger/extension/MaterialYouTheme;"
internal const val DARK_SCHEME = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;"
internal const val LIGHT_SCHEME = "Lcom/facebook/mig/scheme/schemes/LightColorScheme;"
internal const val FDS_COLORS = "Lcom/facebook/fds/core/theme/component/FDSColors;"

/**
 * Route 3: dark surface constants and the MaterialYouTheme fields that replace them. scripts/CompatReport.java counts the
 * same constants. Whole references, like every extension member the patches name, so the catalog check can find them.
 */
internal val materialYouSurfaces = mapOf(
    0xFF080809.toInt() to "$THEME->DARK_080809:I",
    0xFF1C1C1D.toInt() to "$THEME->DARK_1C1C1D:I",
    0xFF252728.toInt() to "$THEME->DARK_252728:I",
    0xFF333334.toInt() to "$THEME->DARK_333334:I",
    0xFF323339.toInt() to "$THEME->DARK_323339:I",
)

/** Route 4: colour calls and their MaterialYouTheme replacements. scripts/CompatReport.java counts the same calls. */
internal val materialYouColorCalls = mapOf(
    "Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I" to "$THEME->parseColor(Ljava/lang/String;)I",
    "Landroid/content/Context;->getColor(I)I" to "$THEME->getColor(Landroid/content/Context;I)I",
)

private var materialYouApplied = false

/**
 * DarkColorScheme's colour token resolver: one class-typed parameter (the Mig colour token
 * interface every token enum implements), an int result, and an interface call ()I on that
 * parameter's own type. Every naming group renames both methods (the 580 builds had DCz(LX/4r6;)I
 * with ApL()I and DCt(LX/4rB;)I with ApN()I), so match the shape instead of the names.
 */
internal fun isTokenColorMethod(method: Method): Boolean {
    val token = method.parameterTypes.singleOrNull()?.toString() ?: return false
    if (method.returnType != "I" || !token.startsWith("L")) return false
    val code = method.implementation?.instructions ?: return false
    return code.any { insn ->
        insn.opcode == Opcode.INVOKE_INTERFACE &&
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == token && it.returnType == "I" && it.parameterTypes.isEmpty()
            } == true
    }
}

/** An FDS resolver: `(Context, ?, ?)I`, asking a `(Context)Z` whether dark mode is on. */
private fun isFdsResolver(method: Method): Boolean =
    method.returnType == "I" && method.parameterTypes.size == 3 && method.parameterTypes[0] == "Landroid/content/Context;" &&
        method.implementation?.instructions?.any { insn ->
            ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
            } == true
        } == true

/**
 * FDSColors by its shape, for the builds that dropped its name (584 calls it LX/9TH;): a class whose only field is a
 * static instance of itself, with FDS resolvers. scripts/CompatReport.java looks for the same shape.
 */
internal fun isFdsColorsShape(cls: ClassDef): Boolean {
    val field = cls.fields.singleOrNull() ?: return false
    return field.type == cls.type && AccessFlags.STATIC.isSet(field.accessFlags) && cls.methods.any(::isFdsResolver)
}

private val materialYouResources = resourcePatch(description = "Record HushMessenger capability: material_you") {
    dependsOn(settingsResources)
    execute {
        materialYouApplied = false
        document("AndroidManifest.xml").use { it.requireFeatureAbsent("material_you") }
    }
    finalize {
        if (materialYouApplied) document("AndroidManifest.xml").use { it.addFeature("material_you") }
    }
}

@Suppress("unused")
val materialYouPatch = bytecodePatch(
    name = "Material You theme",
    description = "Colors Messenger's dark mode with your wallpaper colors on Android 12 and newer, and a fixed blue on Android 11. Turn on dark mode in Messenger first. Light mode keeps its colors unless you turn on Light mode accent. Starts off. Turn it on in HushMessenger settings > Controls.",
) {
    category("Theme")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, materialYouResources)
    execute {
        // Discover and validate against immutable definitions. A mutable lookup registers
        // the whole class for recompilation, even when it needs no theme changes.
        data class Edit(val index: Int, val code: String, val tail: String? = null)
        val edits = linkedMapOf<Method, MutableList<Edit>>()

        fun planReturns(method: Method, helper: String, skip: Set<Int> = emptySet()) {
            val implementation = method.implementation
                ?: throw app.morphe.patcher.patch.PatchException("No code in ${method.hookId()}")
            var count = 0
            for ((index, instruction) in implementation.instructions.withIndex()) {
                if (instruction.opcode != Opcode.RETURN || index in skip) continue
                val register = (instruction as OneRegisterInstruction).registerA
                val call = if (register < 16) "invoke-static {v$register}"
                    else "invoke-static/range {v$register .. v$register}"
                edits.getOrPut(method) { mutableListOf() }.add(
                    Edit(index, "$call, $helper", "move-result v$register\nreturn v$register"))
                count++
            }
            if (count == 0) throw app.morphe.patcher.patch.PatchException("No return in ${method.hookId()}")
        }

        val resolver = classDefBy(DARK_SCHEME).methods.filter(::isTokenColorMethod).singleOrNull()
            ?: throw app.morphe.patcher.patch.PatchException("DarkColorScheme's color token method not found")
        planReturns(resolver, "$THEME->mig(I)I")
        // Light mode's accent (#132). A build without the light scheme keeps the dark routes; CompatReport flags it.
        classDefByOrNull(LIGHT_SCHEME)?.let { light ->
            val lightResolver = light.methods.filter(::isTokenColorMethod).singleOrNull()
                ?: throw app.morphe.patcher.patch.PatchException("LightColorScheme's color token method not found")
            planReturns(lightResolver, "$THEME->migLight(I)I")
        }

        var surfaceCount = 0
        var colorCount = 0
        val fdsShapes = mutableListOf<ClassDef>()
        val colorCalls = MemberTable(materialYouColorCalls)
        classDefForEach { cls ->
            if (cls.type.startsWith("Lapp/hushmessenger/extension/")) return@classDefForEach
            if (isFdsColorsShape(cls)) fdsShapes += cls
            for (method in cls.methods) {
                val implementation = method.implementation ?: continue
                for ((index, instruction) in implementation.instructions.withIndex()) {
                    if (instruction.opcode == Opcode.CONST || instruction.opcode == Opcode.CONST_HIGH16) {
                        val field = materialYouSurfaces[(instruction as NarrowLiteralInstruction).narrowLiteral]
                        if (field != null) {
                            val register = (instruction as OneRegisterInstruction).registerA
                            edits.getOrPut(method) { mutableListOf() }.add(
                                Edit(index, "sget v$register, $field"))
                            surfaceCount++
                        }
                    } else if (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_VIRTUAL ||
                        instruction.opcode == Opcode.INVOKE_STATIC_RANGE || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                        val target = (instruction as ReferenceInstruction).reference
                        val replacement = colorCalls[target] ?: continue
                        val reference = target.toString()
                        val contextCall = reference.startsWith("Landroid/content/Context;")
                        val range = instruction as? RegisterRangeInstruction
                        val invoke = instruction as? FiveRegisterInstruction
                        val expectedOpcode = if (contextCall) {
                            if (range != null) Opcode.INVOKE_VIRTUAL_RANGE else Opcode.INVOKE_VIRTUAL
                        } else if (range != null) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                        val expectedRegisters = if (contextCall) 2 else 1
                        if (instruction.opcode != expectedOpcode || (range?.registerCount ?: invoke?.registerCount) != expectedRegisters ||
                            (range != null && range.startRegister + range.registerCount > implementation.registerCount)) {
                            throw app.morphe.patcher.patch.PatchException("Invalid color call in ${method.hookId()}")
                        }
                        val call = if (range != null) {
                            "invoke-static/range {v${range.startRegister} .. v${range.startRegister + range.registerCount - 1}}"
                        } else "invoke-static {${registerList(invoke!!)}}"
                        edits.getOrPut(method) { mutableListOf() }.add(
                            Edit(index, "$call, $replacement"))
                        colorCount++
                    }
                }
            }
        }
        if (surfaceCount == 0 || colorCount == 0) {
            throw app.morphe.patcher.patch.PatchException("Missing Material You surface or color-call route")
        }

        val fdsColors = classDefByOrNull(FDS_COLORS) ?: fdsShapes.singleOrNull()
            ?: throw app.morphe.patcher.patch.PatchException("Expected one FDSColors, found ${fdsShapes.size} by shape")
        val fdsMethods = fdsColors.methods.filter {
            it.returnType == "I" && it.implementation != null
        }
        val fdsResolvers = fdsMethods.filter {
            it.parameterTypes.size == 3 && it.parameterTypes[0] == "Landroid/content/Context;"
        }
        val darkChecks = fdsResolvers.flatMap { method ->
            method.implementation!!.instructions.mapNotNull { instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
                ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf {
                    it.returnType == "Z" && it.parameterTypes == listOf("Landroid/content/Context;")
                }
            }
        }.distinctBy { it.toString() }
        val darkCheckRef = darkChecks.singleOrNull()
            ?: throw app.morphe.patcher.patch.PatchException("Expected one FDS (Context)Z dark mode check")
        val darkCheck = classDefBy(darkCheckRef.definingClass).methods.singleOrNull {
            it.hookId() == darkCheckRef.toString() && AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw app.morphe.patcher.patch.PatchException("Dark mode check not found: $darkCheckRef")
        planReturns(darkCheck, "$THEME->darkModeAnswer(Z)Z")
        // A method that only returns another FDSColors method's answer (583's A02 hands its token to A01) already gets
        // the remapped color from that one, so wrapping it too would remap twice.
        val fdsIds = fdsMethods.map { it.hookId() }.toSet()
        fun Method.delegatedReturns(): Set<Int> {
            val code = implementation!!.instructions.toList()
            val targets = jumpTargets()
            return code.indices.filter { at ->
                val call = (code.getOrNull(at - 2) as? ReferenceInstruction)?.reference as? MethodReference
                code[at].opcode == Opcode.RETURN && at >= 2 && at !in targets &&
                    code[at - 1].opcode == Opcode.MOVE_RESULT &&
                    (code[at - 1] as OneRegisterInstruction).registerA == (code[at] as OneRegisterInstruction).registerA &&
                    call != null && call.toString() != hookId() && call.toString() in fdsIds
            }.toSet()
        }
        for (method in fdsMethods) {
            val skip = method.delegatedReturns()
            if (skip.size < method.implementation!!.instructions.count { it.opcode == Opcode.RETURN }) {
                planReturns(method, "$THEME->fds(I)I", skip)
            }
        }

        // Resolve every editable target before the first edit. Apply backwards so original
        // instruction coordinates remain valid when wrappers add instructions.
        val targets = edits.map { (method, changes) ->
            mutableClassDefBy(method.definingClass).methods.single { it.hookId() == method.hookId() } to changes
        }
        for ((method, changes) in targets) for (edit in changes.sortedByDescending { it.index }) {
            // Replacing the return preserves incoming labels on the helper call.
            method.replaceInstruction(edit.index, edit.code)
            edit.tail?.let { method.addInstructions(edit.index + 1, it) }
        }
        java.util.logging.Logger.getLogger("").info(
            "Material You: ${edits.keys.map { it.definingClass }.toSet().size} classes, " +
                "$surfaceCount surfaces, $colorCount colour calls")

        recordControl("material_you")
        materialYouApplied = true
    }
}

/** Format the register list from a five-register invoke instruction as "v0, v1, ...". */
private fun registerList(insn: FiveRegisterInstruction): String {
    val regs = mutableListOf<String>()
    val count = insn.registerCount
    if (count >= 1) regs.add("v${insn.registerC}")
    if (count >= 2) regs.add("v${insn.registerD}")
    if (count >= 3) regs.add("v${insn.registerE}")
    if (count >= 4) regs.add("v${insn.registerF}")
    if (count >= 5) regs.add("v${insn.registerG}")
    return regs.joinToString(", ")
}
