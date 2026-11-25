/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Found by reading Pinterest 14.45.0's AndroidX ResourcesCompat (2026-11-24).
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val CUSTOM_FONT_PATCH = "Custom font"
internal const val CUSTOM_FONT = "$EXTENSION_PACKAGE/ui/CustomFont;"
internal const val TYPEFACE = "Landroid/graphics/Typeface;"

/** AndroidX ResourcesCompat's message for a font resource it can't load, which its loader holds. */
internal const val FONT_RESOURCE = "Font resource ID #0x"

internal const val RESOURCE_FONT_HOOK = "$CUSTOM_FONT->resourceFont(${TYPEFACE}I)$TYPEFACE"

/**
 * ResourcesCompat's loadFont: the context, the font resource's id, the value it's read into, the
 * style, a callback (any type, since it's renamed), and two flags.
 */
internal val FONT_LOADER_SHAPE = listOf("Landroid/content/Context;", "I", "Landroid/util/TypedValue;", "I", null, "Z", "Z")

/** The font resource id is the loader's second parameter. */
internal const val FONT_ID_PARAMETER = 1

/** Android's default fonts by field name, and the extension's field each read of one goes to. */
internal val ANDROID_DEFAULTS = mapOf(
    "DEFAULT" to "androidDefault",
    "SANS_SERIF" to "androidSansSerif",
    "DEFAULT_BOLD" to "androidDefaultBold",
)

/** The loader, the index of its only return, and the registers holding its typeface and the font's id there. */
internal class FontLoader(val method: Method, val at: Int, val result: Int, val id: Int)

/** A read of one of Android's default fonts: the instruction's [index], its [register], and the extension's [field]. */
internal class DefaultRead(val index: Int, val register: Int, val field: String)

/** A method of Pinterest's and its reads of Android's default fonts. */
internal class DefaultReads(val method: Method, val at: List<DefaultRead>)

/**
 * Shows Pinterest's text in a font file the person picks (#51).
 *
 * Pinterest sets its text in its own Pin Sans, which it loads as font resources through AndroidX's
 * ResourcesCompat, and the rest in Android's sans-serif families and default. Right before
 * ResourcesCompat's loader returns a typeface, the typeface goes to the extension with the
 * resource it was loaded from, and the extension's answer is returned instead. The extension swaps
 * Pin Sans only, and only while the switch is on and a file is picked.
 *
 * At the end of the application's onCreate, before any screen exists, the extension puts the
 * picked font in Android's font table and defaults by style for this process. Android won't let
 * Typeface.DEFAULT, SANS_SERIF or DEFAULT_BOLD change, so every read of them in Pinterest's code
 * reads the extension's stand-in instead, Android's own font until the extension puts the picked
 * one there.
 *
 * The loader has to be the only one, return from one place, and still hold the font's id there.
 * Everything is found and checked before the first change.
 */
@Suppress("unused")
val customFontPatch = bytecodePatch(
    name = CUSTOM_FONT_PATCH,
    description = "Shows Pinterest's text in a font file you pick, a .ttf or .otf. Icons keep their own look. " +
        "Starts off. Pick the file with Font file in HushPinterest settings > Interface, which turns the " +
        "switch on for you, then restart Pinterest.",
) {
    category("Theme")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("customFont")
        requireCustomFontExtension()
        val loader = fontLoader()
        val defaults = defaultReads()
        // Each read is swapped one for one, so no index anywhere moves.
        defaults.forEach { reads ->
            val method = mutable(reads.method)
            reads.at.forEach { read ->
                method.replaceInstruction(read.index, "sget-object v${read.register}, $CUSTOM_FONT->${read.field}:$TYPEFACE")
            }
        }
        // At the return's label, so every path to it goes through the hook.
        mutable(loader.method).addInstructionsAtControlFlowLabel(
            loader.at,
            """
                invoke-static {v${loader.result}, v${loader.id}}, $RESOURCE_FONT_HOOK
                move-result-object v${loader.result}
            """,
        )
        enableStatus("customFont")
    }
}

/** Throws unless the extension has the hook and the three stand-ins this patch sends Pinterest to. */
private fun BytecodePatchContext.requireCustomFontExtension() {
    val extension = classDefByOrNull(CUSTOM_FONT) ?: throw PatchException("$CUSTOM_FONT_PATCH: the extension has no $CUSTOM_FONT")
    fun publicStatic(flags: Int) = AccessFlags.PUBLIC.isSet(flags) && AccessFlags.STATIC.isSet(flags)
    extension.methods.singleOrNull {
        it.name == "resourceFont" && it.returnType == TYPEFACE && it.parameters() == listOf(TYPEFACE, "I") && publicStatic(it.accessFlags)
    } ?: throw PatchException("$CUSTOM_FONT_PATCH: the extension has no public static resourceFont(${TYPEFACE}I)")
    for (name in ANDROID_DEFAULTS.values) {
        if (extension.fields.none { it.name == name && it.type == TYPEFACE && publicStatic(it.accessFlags) }) {
            throw PatchException("$CUSTOM_FONT_PATCH: the extension has no field $name to read in place of Android's default font")
        }
    }
}

/**
 * ResourcesCompat's font loader, found by its message for a font that can't be loaded and its
 * shape. Its one return goes through the hook with the font's id, so that id has to still be in
 * its parameter's register there, and both registers have to fit a plain call.
 */
internal fun BytecodePatchContext.fontLoader(): FontLoader {
    val loaders = methodsWithString(FONT_RESOURCE).filter { it.isFontLoader() }
    val loader = loaders.singleOrNull()
        ?: throw PatchException("$CUSTOM_FONT_PATCH: this Pinterest build has ${loaders.size} ResourcesCompat font loaders, not 1")
    val signature = "${loader.definingClass}->${loader.name}"
    val body = loader.instructions()
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
    val at = returns.singleOrNull() ?: throw PatchException("$CUSTOM_FONT_PATCH: $signature returns from ${returns.size} places, not 1")
    val result = (body[at] as OneRegisterInstruction).registerA
    val id = loader.parameterRegisterNumber(FONT_ID_PARAMETER)
    if (result > 15 || id > 15) throw PatchException("$CUSTOM_FONT_PATCH: $signature keeps its typeface or the font's id above v15")
    loader.requireParameterIntact("$CUSTOM_FONT_PATCH: the font's id", FONT_ID_PARAMETER, listOf(at))
    return FontLoader(loader, at, result, id)
}

/** True for a static loader of ResourcesCompat's shape that returns a Typeface. */
internal fun Method.isFontLoader(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != TYPEFACE) return false
    val types = parameters()
    return types.size == FONT_LOADER_SHAPE.size && types.zip(FONT_LOADER_SHAPE).all { (type, wanted) ->
        if (wanted == null) type.startsWith("L") else type == wanted
    }
}

/**
 * Every read of Typeface.DEFAULT, SANS_SERIF and DEFAULT_BOLD in Pinterest's code. Text with no font
 * of its own draws in those, and Android 16 refuses a write to those static final fields, so the
 * reads themselves have to move. The extension's own reads stay. Pinterest with none at all is
 * refused.
 */
internal fun BytecodePatchContext.defaultReads(): List<DefaultReads> {
    val fields = ANDROID_DEFAULTS.mapKeys { (name, _) -> "$TYPEFACE->$name:$TYPEFACE" }
    val found = mutableListOf<DefaultReads>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in classDef.methods) {
            val reads = method.instructions().withIndex().mapNotNull { (index, instruction) ->
                if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
                val field = fields[instruction.getReference<FieldReference>()?.toString()] ?: return@mapNotNull null
                DefaultRead(index, (instruction as OneRegisterInstruction).registerA, field)
            }
            if (reads.isNotEmpty()) found += DefaultReads(method, reads)
        }
    }
    if (found.isEmpty()) throw PatchException("$CUSTOM_FONT_PATCH: Pinterest never reads Android's default font")
    return found
}
