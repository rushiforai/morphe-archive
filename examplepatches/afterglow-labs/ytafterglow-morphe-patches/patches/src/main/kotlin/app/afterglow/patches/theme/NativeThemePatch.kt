/*
 * Context and Litho fingerprints adapted from Morphe patches (2026, GPLv3),
 * https://github.com/MorpheApp/morphe-patches . See NOTICE.
 * Rewritten for patcher 2.1.0 and Afterglow's runtime palette.
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */
package app.afterglow.patches.theme

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.MainActivityOnCreateFingerprint
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.tweaks.navigation.invokeStatic
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val THEME = "$EXTENSION_PACKAGE/theme/NativeTheme;"

/** 21.43.523: Lauoa;->A()Lkvg;, enum LIGHT=0 / DARK=1, preserving the stored preference. */
private object AppearanceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "L", parameters = emptyList(),
    filters = listOf(resourceLiteral(ResourceType.STRING, "app_theme_appearance_dark")),
)

/** 21.43.523: Lvte;->onBoundsChange(Rect)V, color v2, Paint v1 (classes2.dex). */
internal object LithoColorFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = emptyList(),
        filters = listOf(
            methodCall(smali = "Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path\$Direction;)V"),
            fieldAccess(opcode = Opcode.IPUT_OBJECT, definingClass = "this", type = "Landroid/graphics/Path;"),
        ),
    ),
    name = "onBoundsChange",
    accessFlags = listOf(AccessFlags.PROTECTED, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/graphics/Rect;"),
    filters = listOf(
        // The original feed-card, player-control and seekbar hooks add three call/result
        // pairs before this load (stock index 5 becomes 11). Keep the Paint call adjacent.
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "this", type = "Landroid/graphics/Paint;", location = MatchAfterWithin(12)),
        methodCall(smali = "Landroid/graphics/Paint;->setColor(I)V", location = MatchAfterImmediately()),
    ),
)

internal fun MutableMethod.hookLithoThemeColor(colorCallIndex: Int) {
    val instructions = implementation!!.instructions
    val load = instructions[colorCallIndex - 1]
    val field = (load as? ReferenceInstruction)?.reference as? FieldReference
    val call = instructions[colorCallIndex]
    val target = (call as? ReferenceInstruction)?.reference as? MethodReference
    val registers = call.invokeRegisters
    require(load.opcode == Opcode.IGET_OBJECT && field?.definingClass == definingClass
        && field.type == "Landroid/graphics/Paint;"
        && target?.definingClass == "Landroid/graphics/Paint;" && target.name == "setColor"
        && target.parameterTypes == listOf("I") && target.returnType == "V"
        && registers.size == 2) { "Unexpected Litho Paint color boundary" }
    val paint = load as TwoRegisterInstruction
    val color = registers[1]
    require(registers[0] == paint.registerA && color != paint.registerA && color != paint.registerB) {
        "Unexpected Litho Paint/color registers"
    }
    // Keep the native load/call pair intact for the original color-hook fingerprint.
    // The original providers and the native zero-color branch retain their order and registers.
    addInstructions(colorCallIndex - 1, """
        ${invokeStatic(color, method = "$THEME->lithoColor(I)I")}
        move-result v$color
    """)
}

internal val nativeThemePatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch, themeResourcesPatch)
    execute {
        AppearanceFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
            if (returns.isEmpty()) throw PatchException("No YouTube appearance return")
            returns.asReversed().forEach { index ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                var insert = index
                // Existing observer hooks (including GmsCore's settings dependency) must see
                // the effective theme too. Retarget branches at the start of that observer chain.
                while (insert > 0) {
                    val previous = instructions[insert - 1]
                    val call = (previous as? ReferenceInstruction)?.reference as? MethodReference ?: break
                    if (call.returnType != "V" || call.parameterTypes != listOf("Ljava/lang/Enum;")
                        || previous.invokeRegisters != listOf(register)) break
                    insert--
                }
                addInstructionsAtControlFlowLabel(insert, """
                    ${invokeStatic(register, method = "$THEME->appearance(Ljava/lang/Enum;)Ljava/lang/Enum;")}
                    move-result-object v$register
                    check-cast v$register, $returnType
                """)
            }
        }
        val contexts = Fingerprint(
            name = "attachBaseContext", isStatic = false,
            returnType = "V", parameters = listOf("Landroid/content/Context;"),
            custom = { _, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") },
        ).matchAll()
        if (contexts.isEmpty()) throw PatchException("No YouTube base contexts found")
        contexts.forEach { match ->
            match.method.addInstructions(0, """
                invoke-static/range { p1 .. p1 }, $THEME->wrapContext(Landroid/content/Context;)Landroid/content/Context;
                move-result-object p1
            """)
        }
        // Activity configuration wrappers can create Resources after attachBaseContext.
        // Apply to the actual host before it creates its native views.
        MainActivityOnCreateFingerprint.method.addInstructions(0, """
            invoke-static/range { p0 .. p0 }, $THEME->onMainActivityCreate(Landroid/app/Activity;)V
        """)
        val match = LithoColorFingerprint.match()
        val colorCall = match.instructionMatches.last()
        match.method.hookLithoThemeColor(colorCall.index)
        println("Afterglow theme: ${contexts.size} base contexts, Litho ${match.method.definingClass}->${match.method.name}")
    }
}
