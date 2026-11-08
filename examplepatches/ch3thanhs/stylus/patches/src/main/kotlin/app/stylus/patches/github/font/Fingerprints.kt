package app.stylus.patches.github.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal object ResourcesCompatGetFontFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameters.size == 7 &&
            method.parameters[0].type == "Landroid/content/Context;" &&
            method.parameters[1].type == "I" &&
            method.parameters[2].type == "Landroid/util/TypedValue;" &&
            method.parameters[3].type == "I" &&
            method.parameters[5].type == "Z" &&
            method.parameters[6].type == "Z"
    }
)

/**
 * Compose's AndroidParagraphIntrinsics constructor.
 *
 * Its TextPaint is the single paint used to measure and draw all Compose text.
 * The constructor is matched by shape because R8 renames the bundled Compose
 * classes: it takes a String text, two lists (annotations and placeholders),
 * and a boolean soft-wrap flag.
 */
internal object ComposeParagraphIntrinsicsFingerprint : Fingerprint(
    returnType = "V",
    custom = { method, _ ->
        method.name == "<init>" &&
            method.parameters.size == 7 &&
            method.parameters[0].type == "Ljava/lang/String;" &&
            method.parameters[2].type == "Ljava/util/List;" &&
            method.parameters[3].type == "Ljava/util/List;" &&
            method.parameters[6].type == "Z"
    },
)

internal data class ComposeParagraphPaintTarget(
    val method: MutableMethod,
    val paintField: FieldReference,
)

/**
 * Resolves the paragraph intrinsics constructor and the field that holds its
 * TextPaint. The field name is obfuscated, so it is discovered from the
 * constructor instead of being hard-coded.
 */
internal fun resolveComposeParagraphPaintTarget(): ComposeParagraphPaintTarget {
    val method = ComposeParagraphIntrinsicsFingerprint.method
    val instructions = method.implementation?.instructions?.toList()
        ?: throw PatchException("Compose paragraph constructor has no implementation.")

    val paintType = instructions
        .asSequence()
        .filter { it.opcode == Opcode.NEW_INSTANCE }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? TypeReference }
        .map { it.type }
        .firstOrNull { isPaintType(it) }
        ?: throw PatchException("Could not find the Compose text paint allocation.")

    val paintField = instructions
        .asSequence()
        .filter { it.opcode == Opcode.IPUT_OBJECT }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
        .firstOrNull {
            it.definingClass == method.definingClass && it.type == paintType
        }
        ?: throw PatchException("Could not find the Compose text paint field.")

    return ComposeParagraphPaintTarget(method, paintField)
}

private fun isPaintType(type: String): Boolean {
    var current: String? = type
    val visited = mutableSetOf<String>()

    while (current != null && visited.add(current)) {
        if (current == "Landroid/graphics/Paint;" || current == "Landroid/text/TextPaint;") {
            return true
        }
        current = classDefByOrNull(current)?.superclass
    }

    return false
}