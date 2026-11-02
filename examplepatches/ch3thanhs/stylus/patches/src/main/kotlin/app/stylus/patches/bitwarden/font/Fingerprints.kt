package app.stylus.patches.bitwarden.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal enum class TypefaceCompatCreateFromResourcesFontFileVariant {
    LEGACY_STATIC,
    MODERN_VIRTUAL,
}

internal data class TypefaceCompatCreateFromResourcesFontFileTarget(
    val variant: TypefaceCompatCreateFromResourcesFontFileVariant,
    val method: MutableMethod,
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
context(context: BytecodePatchContext)
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

context(context: BytecodePatchContext)
private fun isPaintType(type: String): Boolean {
    var current: String? = type
    val visited = mutableSetOf<String>()

    while (current != null && visited.add(current)) {
        if (current == "Landroid/graphics/Paint;" || current == "Landroid/text/TextPaint;") {
            return true
        }
        current = context.classDefByOrNull(current)?.superclass
    }

    return false
}

internal object LegacyTypefaceCompatCreateFromResourcesFontFileFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf(
        "Landroid/content/res/Resources;",
        "I",
        "Ljava/lang/String;",
        "I",
        "I",
    ),
    filters = listOf(
        methodCall(smali = "Landroid/graphics/fonts/Font${'$'}Builder;-><init>(Landroid/content/res/Resources;I)V"),
    ),
)

internal object ModernTypefaceCompatCreateFromResourcesFontFileFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/res/Resources;",
        "I",
        "Ljava/lang/String;",
        "I",
    ),
    filters = listOf(
        methodCall(smali = "Landroid/graphics/fonts/Font${'$'}Builder;-><init>(Landroid/content/res/Resources;I)V"),
    ),
)

context(_: BytecodePatchContext)
internal fun resolveTypefaceCompatCreateFromResourcesFontFileTarget(): TypefaceCompatCreateFromResourcesFontFileTarget {
    listOf(
        TypefaceCompatCreateFromResourcesFontFileVariant.LEGACY_STATIC to LegacyTypefaceCompatCreateFromResourcesFontFileFingerprint,
        TypefaceCompatCreateFromResourcesFontFileVariant.MODERN_VIRTUAL to ModernTypefaceCompatCreateFromResourcesFontFileFingerprint,
    ).forEach { (variant, fingerprint) ->
        try {
            return TypefaceCompatCreateFromResourcesFontFileTarget(variant, fingerprint.method)
        } catch (_: Throwable) {
            // Try the next method shape.
        }
    }

    throw IllegalStateException("Failed to match any typeface creation method shape")
}
