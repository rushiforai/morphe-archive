/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.fonts

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

internal const val CUSTOM_FONT = "$EXTENSION_PACKAGE/misc/CustomFont;"
private const val FACE = "Landroid/graphics/Typeface;"

/** The TextPaint constructors that start a paint with no face. The copying one takes the face it copies. */
internal val NEW_TEXT_PAINTS = setOf("Landroid/text/TextPaint;-><init>()V", "Landroid/text/TextPaint;-><init>(I)V")

/** Android's text widgets, every one a TextView, built straight or as the parent of Telegram's own. */
internal val TEXT_WIDGETS = listOf("TextView", "EditText", "Button", "CheckBox", "RadioButton", "ToggleButton", "Switch",
    "CheckedTextView", "AutoCompleteTextView", "MultiAutoCompleteTextView", "CompoundButton").map { "Landroid/widget/$it;" }.toSet()

/** The stock faces Telegram reads by name for plain text. Monospace and serif keep the phone's. */
internal val PLAIN_FACES = mapOf("$FACE->DEFAULT:$FACE" to FontSiteKind.REGULAR, "$FACE->SANS_SERIF:$FACE" to FontSiteKind.REGULAR,
    "$FACE->DEFAULT_BOLD:$FACE" to FontSiteKind.BOLD)

/** What a site makes, and the CustomFont hook it's handed to right after. */
internal enum class FontSiteKind(val hook: String, val parameter: String, val result: String) {
    PAINT("paint", "Landroid/graphics/Paint;", "V"),
    VIEW("view", "Landroid/widget/TextView;", "V"),
    REGULAR("regular", FACE, FACE),
    BOLD("bold", FACE, FACE),
}

/** A paint or text view built, or a plain face read, by the instruction at [index], landing in [register]. */
internal class FontSite(val index: Int, val register: Int, val kind: FontSiteKind) {
    /** A static call with the one register, then the answer back into it when the hook gives one. */
    fun hook(): List<BuilderInstruction> {
        val call = BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
            ImmutableMethodReference(CUSTOM_FONT, kind.hook, listOf(kind.parameter), kind.result))
        return if (kind.result == "V") listOf(call) else listOf(call, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register))
    }
}

/** Every font site in [method]'s code, in order. */
internal fun fontSites(method: Method): List<FontSite> {
    val body = method.controlBody()
    val sites = ArrayList<FontSite>()
    for ((at, instruction) in body.withIndex()) {
        val ref = instruction.controlRef() ?: continue
        val kind = when (instruction.opcode) {
            Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> when {
                ref in NEW_TEXT_PAINTS -> FontSiteKind.PAINT
                "-><init>(" in ref && ref.substringBefore("->") in TEXT_WIDGETS -> FontSiteKind.VIEW
                else -> null
            }
            Opcode.SGET_OBJECT -> PLAIN_FACES[ref]
            else -> null
        } ?: continue
        sites += FontSite(at, instruction.namedRegisters().first(), kind)
    }
    return sites
}

/** Telegram's own classes and its libraries. HushTelegram's settings pages keep the phone's font. */
private fun ClassDef.takesCustomFont() = !type.startsWith("Lapp/hushtelegram/") && !type.startsWith("Lapp/morphe/")

private val SITE_TYPES = Mention.anyOf((TEXT_WIDGETS + "Landroid/text/TextPaint;" + FACE).map { Mention.type(it) })

/** How many sites of each kind [classes] hold, for the census before anything changes. */
internal fun fontSiteCounts(classes: List<ClassDef>): Map<FontSiteKind, Int> =
    classes.flatMap { cls -> cls.methods.flatMap(::fontSites) }.groupingBy { it.kind }.eachCount()

/** The classes of the context whose code builds a paint or text view or reads a plain face. */
internal fun BytecodePatchContext.customFontHosts(): List<ClassDef> =
    classDefsMentioning(SITE_TYPES).filter { cls -> cls.takesCustomFont() && cls.methods.any { fontSites(it).isNotEmpty() } }

/**
 * The runtime's four hooks, checked while the patch runs. The sites themselves are found and
 * changed in the patch's finalize, once every other patch has matched its code.
 */
internal fun BytecodePatchContext.resolveCustomFont() {
    requireStatusMethod("customFont")
    for (kind in FontSiteKind.entries) controlHook(CUSTOM_FONT, kind.hook, listOf(kind.parameter), kind.result)
}

/**
 * Puts the hook right after every site of [hosts], from the last site of a method up so the
 * earlier indexes hold. A branch to the instruction after a site keeps landing there, past the
 * hook: only the path through the site itself made the thing the hook is handed.
 */
internal fun BytecodePatchContext.insertCustomFont(hosts: List<ClassDef>) {
    for (host in hosts) {
        for (method in tgMutableClassDefBy(host).methods) insertFontHooks(method, fontSites(method))
    }
}

internal fun insertFontHooks(method: MutableMethod, sites: List<FontSite>) {
    for (site in sites.sortedByDescending { it.index }) {
        // Each goes in at the same index, so the last one first.
        for (instruction in site.hook().asReversed()) method.addInstruction(site.index + 1, instruction)
    }
}
