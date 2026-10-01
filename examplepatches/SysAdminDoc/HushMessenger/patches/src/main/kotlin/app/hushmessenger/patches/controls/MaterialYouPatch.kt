/*
 * Material You theme patch: hooks Messenger's dark mode colour resolution to tint it
 * with the wallpaper palette on Android 12+.
 *
 * Four routes:
 * 1. Mig dark scheme resolver returns → mig() recolours greys and blues
 * 2. FDS colour resolver returns → fds() recolours greys and blues
 * 3. Dark surface constants (0xFF080809 etc.) → reads from volatile fields
 * 4. Color.parseColor and Context/Resources.getColor → surface-aware wrappers
 *
 * The dark mode detection hook sends Messenger's own answer through
 * MaterialYouTheme.darkModeAnswer() so the runtime knows when to act.
 */
package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
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
        // --- Find DarkColorScheme's token resolver (DCz in 346013440) ---
        // It reads the colour from the token and returns it.
        // We hook before the RETURN to recolour through MaterialYouTheme.mig(int).
        val darkScheme = mutableClassDefBy(DARK_SCHEME)
        val dcz = darkScheme.methods.filter(::isTokenColorMethod).singleOrNull()
            ?: throw app.morphe.patcher.patch.PatchException(
                "DarkColorScheme's colour token method not found"
            )
        val dczCode = dcz.implementation!!.instructions.toList()

        // Find the RETURN instruction and hook before it
        val returnIndex = dczCode.indexOfLast { it.opcode == Opcode.RETURN }
        check(returnIndex >= 0) { "no RETURN in DCz" }

        // The return register holds the resolved colour
        val returnReg = (dczCode[returnIndex] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA

        // Insert: invoke-static {vReturn}, MaterialYouTheme.mig(I)I; move-result vReturn
        dcz.addInstructions(
            returnIndex,
            """
                invoke-static {v$returnReg}, $THEME->mig(I)I
                move-result v$returnReg
            """
        )

        // --- Find the FDS dark mode check and hook it ---
        // FDSColors.A00 calls LX/2AN.A02(Context)Z (the isDarkMode check).
        // LX/2AN.A02 calls LX/2AO.A07(Context)Z and returns its result.
        // We hook the return of A02 to also feed through darkModeAnswer.
        val fdsColors = mutableClassDefBy(FDS_COLORS)
        val fdsMethod = fdsColors.methods.firstOrNull { m ->
            m.returnType == "I" && m.parameterTypes.size == 3 &&
                m.parameterTypes[0] == "Landroid/content/Context;" &&
                m.implementation != null
        }

        if (fdsMethod != null) {
            // Find the dark mode check class from FDSColors: it's called as a static method returning boolean
            val darkCheckRef = fdsMethod.implementation!!.instructions.toList()
                .filterIsInstance<ReferenceInstruction>()
                .mapNotNull { it.reference as? MethodReference }
                .firstOrNull { it.returnType == "Z" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Landroid/content/Context;" }

            if (darkCheckRef != null) {
                val darkCheckClass = mutableClassDefBy(darkCheckRef.definingClass)
                val darkCheckMethod = darkCheckClass.methods.singleOrNull { m ->
                    m.name == darkCheckRef.name && m.returnType == "Z" &&
                        m.parameterTypes.size == 1 &&
                        m.parameterTypes[0] == "Landroid/content/Context;" &&
                        m.implementation != null
                }

                if (darkCheckMethod != null) {
                    val darkCode = darkCheckMethod.implementation!!.instructions.toList()
                    val darkReturn = darkCode.indexOfLast { it.opcode == Opcode.RETURN }
                    if (darkReturn >= 0) {
                        val darkReg = (darkCode[darkReturn] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                        darkCheckMethod.addInstructions(
                            darkReturn,
                            """
                                invoke-static {v$darkReg}, $THEME->darkModeAnswer(Z)Z
                                move-result v$darkReg
                            """
                        )
                    }
                }
            }

            // --- Hook FDS colour returns ---
            // FDSColors has two return paths: one from the resolver (intValue), one from the fallback.
            // Hook both returns of each method that returns int.
            // Insert in reverse order so indices stay valid.
            for (m in fdsColors.methods) {
                if (m.returnType != "I" || m.implementation == null) continue
                val code = m.implementation!!.instructions.toList()
                val returns = code.indices.filter { code[it].opcode == Opcode.RETURN }
                for (index in returns.reversed()) {
                    val reg = (code[index] as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                    m.addInstructions(
                        index,
                        """
                            invoke-static {v$reg}, $THEME->fds(I)I
                            move-result v$reg
                        """
                    )
                }
            }
        }

        // --- Route 3: replace dark surface constants with reads from volatile fields ---
        // Scan every class for const instructions loading known dark surfaces and replace
        // each with an sget from MaterialYouTheme's route 3 fields.
        val surfaces = materialYouSurfaces
        val extensionPackage = "Lapp/hushmessenger/extension/"
        var route3Count = 0
        classDefForEach { cls ->
            if (cls.type.startsWith(extensionPackage)) return@classDefForEach
            val mutable = runCatching { mutableClassDefBy(cls.type) }.getOrNull() ?: return@classDefForEach
            for (method in mutable.methods) {
                val impl = method.implementation ?: continue
                val code = impl.instructions.toList()
                for ((index, insn) in code.withIndex()) {
                    if (insn.opcode != Opcode.CONST && insn.opcode != Opcode.CONST_HIGH16) continue
                    val lit = (insn as NarrowLiteralInstruction).narrowLiteral
                    val fieldName = surfaces[lit] ?: continue
                    val reg = (insn as OneRegisterInstruction).registerA
                    method.replaceInstruction(index, "sget v$reg, $THEME->$fieldName:I")
                    route3Count++
                }
            }
        }

        // --- Route 4: redirect Color.parseColor and getColor calls ---
        // Replace invoke-static Color.parseColor(String) with MaterialYouTheme.parseColor(String).
        // Replace invoke-virtual Context.getColor(int) with MaterialYouTheme.getColor(Context, int).
        val colorReroutes = materialYouColorCalls
        var route4Count = 0
        classDefForEach { cls ->
            if (cls.type.startsWith(extensionPackage)) return@classDefForEach
            val mutable = runCatching { mutableClassDefBy(cls.type) }.getOrNull() ?: return@classDefForEach
            for (method in mutable.methods) {
                val impl = method.implementation ?: continue
                val code = impl.instructions.toList()
                for ((index, insn) in code.withIndex()) {
                    if (insn !is ReferenceInstruction) continue
                    val ref = insn.reference.toString()
                    val replacement = colorReroutes[ref] ?: continue
                    if (insn.opcode == Opcode.INVOKE_STATIC || insn.opcode == Opcode.INVOKE_VIRTUAL) {
                        // For both: replace with invoke-static keeping the same registers.
                        // Context.getColor(int) receiver becomes the first static parameter.
                        method.replaceInstruction(index, "invoke-static {${registerList(insn as FiveRegisterInstruction)}}, $replacement")
                        route4Count++
                    }
                }
            }
        }

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
