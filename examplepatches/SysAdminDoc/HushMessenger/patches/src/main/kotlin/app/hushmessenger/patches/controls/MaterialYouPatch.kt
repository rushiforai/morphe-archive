/*
 * Material You theme patch: hooks Messenger's dark mode colour resolution to tint it
 * with the wallpaper palette on Android 12+.
 *
 * Four routes:
 * 1. Mig dark scheme resolver returns → mig() recolours greys and blues
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
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val THEME = "Lapp/hushmessenger/extension/MaterialYouTheme;"
internal const val DARK_SCHEME = "Lcom/facebook/mig/scheme/schemes/DarkColorScheme;"
internal const val FDS_COLORS = "Lcom/facebook/fds/core/theme/component/FDSColors;"

/** Route 3: dark surface constants and the MaterialYouTheme fields that replace them. scripts/CompatReport.java counts the same constants. */
internal val materialYouSurfaces = mapOf(
    0xFF080809.toInt() to "DARK_080809",
    0xFF1C1C1D.toInt() to "DARK_1C1C1D",
    0xFF252728.toInt() to "DARK_252728",
    0xFF333334.toInt() to "DARK_333334",
    0xFF323339.toInt() to "DARK_323339",
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
 * parameter's own type. 346013440 names them DCz(LX/4r6;)I and ApL()I, 346013372 DCt(LX/4rB;)I
 * and ApN()I; every naming group renames both, so match the shape instead of the names.
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
    description = "Gives Messenger's dark mode the colors of your wallpaper on Android 12 and newer, and a fixed blue palette on Android 11. Light mode stays as it is. Turn on dark mode in Messenger first.",
    default = false,
) {
    category("Theme")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension, materialYouResources)
    execute {
        // Discover and validate against immutable definitions. A mutable lookup registers
        // the whole class for recompilation, even when it needs no theme changes.
        data class Edit(val index: Int, val code: String, val tail: String? = null)
        val edits = linkedMapOf<Method, MutableList<Edit>>()

        fun planReturns(method: Method, helper: String) {
            val implementation = method.implementation
                ?: throw app.morphe.patcher.patch.PatchException("No code in ${method.hookId()}")
            var count = 0
            for ((index, instruction) in implementation.instructions.withIndex()) {
                if (instruction.opcode != Opcode.RETURN) continue
                val register = (instruction as OneRegisterInstruction).registerA
                val call = if (register < 16) "invoke-static {v$register}"
                    else "invoke-static/range {v$register .. v$register}"
                edits.getOrPut(method) { mutableListOf() }.add(
                    Edit(index, "$call, $THEME->$helper", "move-result v$register\nreturn v$register"))
                count++
            }
            if (count == 0) throw app.morphe.patcher.patch.PatchException("No return in ${method.hookId()}")
        }

        val resolver = classDefBy(DARK_SCHEME).methods.filter(::isTokenColorMethod).singleOrNull()
            ?: throw app.morphe.patcher.patch.PatchException("DarkColorScheme's colour token method not found")
        planReturns(resolver, "mig(I)I")

        val fdsMethods = classDefBy(FDS_COLORS).methods.filter {
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
        planReturns(darkCheck, "darkModeAnswer(Z)Z")
        fdsMethods.forEach { planReturns(it, "fds(I)I") }

        var surfaceCount = 0
        var colorCount = 0
        classDefForEach { cls ->
            if (cls.type.startsWith("Lapp/hushmessenger/extension/")) return@classDefForEach
            for (method in cls.methods) {
                val implementation = method.implementation ?: continue
                for ((index, instruction) in implementation.instructions.withIndex()) {
                    if (instruction.opcode == Opcode.CONST || instruction.opcode == Opcode.CONST_HIGH16) {
                        val field = materialYouSurfaces[(instruction as NarrowLiteralInstruction).narrowLiteral]
                        if (field != null) {
                            val register = (instruction as OneRegisterInstruction).registerA
                            edits.getOrPut(method) { mutableListOf() }.add(
                                Edit(index, "sget v$register, $THEME->$field:I"))
                            surfaceCount++
                        }
                    } else if (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_VIRTUAL ||
                        instruction.opcode == Opcode.INVOKE_STATIC_RANGE || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                        val reference = (instruction as ReferenceInstruction).reference.toString()
                        val replacement = materialYouColorCalls[reference] ?: continue
                        val contextCall = reference.startsWith("Landroid/content/Context;")
                        val range = instruction as? RegisterRangeInstruction
                        val invoke = instruction as? FiveRegisterInstruction
                        val expectedOpcode = if (contextCall) {
                            if (range != null) Opcode.INVOKE_VIRTUAL_RANGE else Opcode.INVOKE_VIRTUAL
                        } else if (range != null) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC
                        val expectedRegisters = if (contextCall) 2 else 1
                        if (instruction.opcode != expectedOpcode || (range?.registerCount ?: invoke?.registerCount) != expectedRegisters ||
                            (range != null && range.startRegister + range.registerCount > implementation.registerCount)) {
                            throw app.morphe.patcher.patch.PatchException("Invalid colour call in ${method.hookId()}")
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
            throw app.morphe.patcher.patch.PatchException("Missing Material You surface or colour-call route")
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
