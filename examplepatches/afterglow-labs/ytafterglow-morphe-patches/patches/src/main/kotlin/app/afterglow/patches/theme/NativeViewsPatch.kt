/* Foreground call sites adapted from Morphe patches (GPLv3), https://github.com/MorpheApp/morphe-patches.
 * See NOTICE. Rewritten for patcher 2.1 and Afterglow semantic colors.
 * Portions are provided "AS IS" by the Morphe software project, without express or implied warranties,
 * including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.theme

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.MainActivityOnCreateFingerprint
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Adapted from Morphe's 21.32+ font registry fingerprint. The returned font also
// feeds styled spans, which can replace the TextPaint after a layout is created.
private val typefaceRegistryFingerprint = Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf("Landroid/content/Context;", "I", "I", "I", "Ljava/lang/String;"),
    filters = listOf(methodCall(opcode = Opcode.INVOKE_INTERFACE,
        parameters = listOf("Landroid/content/Context;", "I", "I", "Ljava/lang/String;"),
        returnType = "Landroid/graphics/Typeface;"))
)

internal val nativeViewsPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        MainActivityOnCreateFingerprint.method.apply {
            implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.asReversed().forEach { index ->
                    addInstructionsAtControlFlowLabel(index,
                        "invoke-static/range { p0 .. p0 }, $EXTENSION_PACKAGE/theme/NativeViews;->install(Landroid/app/Activity;)V")
                }
        }
    }
}

internal val semanticForegroundPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch)
    execute {
        // Text spans are values from the server. Recolor only neutral foregrounds at their text boundary.
        val target = "Landroid/text/style/ForegroundColorSpan;"
        var count = 0
        Fingerprint(filters = listOf(methodCall(definingClass = target, name = "<init>", parameters = listOf("I"))),
            custom = { _, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") }).matchAll().forEach { match ->
            val indices = match.method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == target && ref.name == "<init>" && ref.parameterTypes == listOf("I")
            }.map { it.index }
            indices.asReversed().forEach { index ->
                val register = match.method.implementation!!.instructions[index].invokeRegisters[1]
                match.method.addInstructions(index, """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/theme/NativeTheme;->foregroundColor(I)I
                    move-result v$register
                """)
                count++
            }
        }
        println("Afterglow semantic text: $count span constructors")
    }
}

internal val typographyResourcesPatch = resourcePatch {
    execute {
        val resources = object {}.javaClass
        val index = resources.getResourceAsStream("/afterglow/fonts/index.txt")
            ?: error("Missing Afterglow fonts")
        val names = index.bufferedReader().use { it.readLines().filter(String::isNotBlank) }
        val directory = get("assets/afterglow/fonts")
        directory.mkdirs()
        names.forEach { name ->
            resources.getResourceAsStream("/afterglow/fonts/$name")!!.use { input ->
                directory.resolve(name).outputStream().use { input.copyTo(it) }
            }
        }
    }
}

internal val typographyHooksPatch = bytecodePatch {
    dependsOn(nativeViewsPatch, typographyResourcesPatch)
    execute {
        typefaceRegistryFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
            require(returns.isNotEmpty()) { "No return from YouTube font registry" }
            returns.asReversed().forEach { index ->
                val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
                addInstructionsAtControlFlowLabel(index, """
                    invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/theme/Typography;->nativeTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
                    move-result-object v$register
                """)
            }
            println("Afterglow typography registry: $definingClass->$name")
        }
        val target = "Landroid/text/StaticLayout\$Builder;"
        var count = 0
        Fingerprint(filters = listOf(methodCall(definingClass = target, name = "obtain")),
            custom = { _, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") }).matchAll().forEach { match ->
            val indices = match.method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == target && ref.name == "obtain" && ref.parameterTypes.getOrNull(3) == "Landroid/text/TextPaint;"
            }.map { it.index }
            indices.asReversed().forEach { index ->
                val register = match.method.implementation!!.instructions[index].invokeRegisters[3]
                match.method.addInstructions(index,
                    "invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/theme/Typography;->textPaint(Landroid/text/TextPaint;)V")
                count++
            }
        }
        println("Afterglow typography: $count text layout builders")
        // Elements also measures through BoringLayout, and styled spans can set
        // their own face after a layout builder received the base TextPaint.
        var additional = 0
        for (layout in listOf("Landroid/text/BoringLayout;", "Landroid/text/StaticLayout;")) {
            Fingerprint(filters = listOf(methodCall(definingClass = layout)),
                custom = { _, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") }).matchAll().forEach { match ->
                val calls = match.method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == layout && "Landroid/text/TextPaint;" in ref.parameterTypes
                }.map { it.index }
                calls.asReversed().forEach { index ->
                    val instruction = match.method.implementation!!.instructions[index]
                    val ref = (instruction as ReferenceInstruction).reference as MethodReference
                    val paint = ref.parameterTypes.indexOf("Landroid/text/TextPaint;")
                    val receiver = if (instruction.opcode == Opcode.INVOKE_STATIC || instruction.opcode == Opcode.INVOKE_STATIC_RANGE) 0 else 1
                    val offset = ref.parameterTypes.take(paint).sumOf { if (it == "J" || it == "D") 2 else 1 } + receiver
                    val register = instruction.invokeRegisters[offset]
                    match.method.addInstructions(index, "invoke-static/range { v$register .. v$register }, $EXTENSION_PACKAGE/theme/Typography;->textPaint(Landroid/text/TextPaint;)V")
                    additional++
                }
            }
        }
        var spans = 0
        Fingerprint(returnType = "V", parameters = listOf("Landroid/text/TextPaint;"),
            custom = { method, cls -> !cls.type.startsWith("$EXTENSION_PACKAGE/") &&
                (method.name == "updateDrawState" || method.name == "updateMeasureState") }).matchAll().forEach { match ->
            match.method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.asReversed().forEach { index ->
                    match.method.addInstructionsAtControlFlowLabel(index,
                        "invoke-static/range { p1 .. p1 }, $EXTENSION_PACKAGE/theme/Typography;->span(Landroid/text/TextPaint;)V")
                    spans++
                }
        }
        println("Afterglow typography: $additional layout measurements, $spans span returns")
    }
}
