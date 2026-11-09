/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.apps

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val NAME_FOLD = "$EXTENSION_PACKAGE/misc/NameFold;"
internal const val LOCALE_CONTROLLER = "Lorg/telegram/messenger/LocaleController;"
internal const val TRANSLIT = "getTranslitString"
private const val STRING = "Ljava/lang/String;"
internal const val TRANSLIT_FULL = "$LOCALE_CONTROLLER->$TRANSLIT(${STRING}ZZ)$STRING"
private const val TO_LOWER_CASE = "$STRING->toLowerCase()$STRING"

/** The name or query, folded before Telegram reads it. */
internal const val NAME_FOLD_CODE = """
    invoke-static/range {p1 .. p3}, $NAME_FOLD->fold(${STRING}ZZ)$STRING
    move-result-object p1
"""
internal const val NAME_FOLD_SIZE = 2

/** The transliteration the fold goes in front of, found and checked before anything is edited, or [missing], why this build can't fold. */
internal class NameFoldPlan(val translit: MutableMethod?, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val method = translit?.let(into) ?: return
        val before = method.implementation!!.instructions.size
        method.addInstructions(0, NAME_FOLD_CODE)
        // smali drops an instruction it can't build, a register out of reach among them, and only logs it.
        fits(method.implementation!!.instructions.size - before == NAME_FOLD_SIZE, "the name fold didn't compile whole")
    }

    /**
     * The same edit on a copy, so a smali or register problem shows before the app is touched. A
     * snippet smali refuses outright comes back as no class, which the patcher trips over as an
     * empty collection or a null, so any failure on the copy is a reason to leave the switch out.
     */
    fun rehearse() = try {
        apply { MutableMethod(ImmutableMethod.of(it)) }
    } catch (failed: RuntimeException) {
        throw Unfit("the name fold doesn't compile (${failed.javaClass.simpleName}: ${failed.message})")
    }
}

/** The runtime the fold calls. It's the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireNameFoldRuntime() {
    requireStatusMethod("nameFold")
    controlHook(NAME_FOLD, "fold", listOf(STRING, "Z", "Z"), STRING)
}

/** Why this build's transliteration can't take the fold. */
private class Unfit(val why: String) : Exception(why)

private fun fits(ok: Boolean, why: String) {
    if (!ok) throw Unfit(why)
}

/**
 * Local search compares each lowercased name, and the query, in the form LocaleController's
 * transliteration gives them. Every overload of it hands its work to one, (src, ru, onlyEnglish),
 * where onlyEnglish is the flag that keeps case, for Passport. The fold goes at its start, so it
 * sees every name and query search transliterates. Anything else and the switch is left out.
 */
internal fun BytecodePatchContext.resolveNameFold(): NameFoldPlan = try {
    // Rehearsed here, so an edit that doesn't fit this build leaves the switch out rather than the patch.
    NameFoldPlan(translit(), null).also { it.rehearse() }
} catch (unfit: Unfit) {
    NameFoldPlan(null, unfit.why)
}

private fun BytecodePatchContext.translit(): MutableMethod {
    val owner = tgMutableClassDefByOrNull(LOCALE_CONTROLLER)
    fits(owner != null, "LocaleController is missing")
    val named = owner!!.methods.filter { it.origName == TRANSLIT }
    val full = named.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.origReturnType == STRING &&
        it.origParameterTypes == listOf(STRING, "Z", "Z") }
    fits(full.size == 1, "the transliteration is missing or ambiguous")
    val method = full.single()
    val others = named.filter { it !== method }
    fits(others.all { other -> other.controlBody().any { it.controlRef() == TRANSLIT_FULL } },
        "another transliteration doesn't go through the full one")
    val registers = method.implementation?.registerCount ?: 0
    // this, src, ru and onlyEnglish are the last four registers; the fold writes src back, which move-result reaches only below 256.
    fits(registers >= 4 && registers - 3 <= 255, "the transliteration keeps its name past register 255")
    val onlyEnglish = registers - 1
    // onlyEnglish is still the flag that keeps case: on it, each letter is lowercased to look up and put back.
    val body = method.controlBody()
    fits(body.indices.any { body[it].opcode == Opcode.IF_EQZ && body[it].namedRegisters() == listOf(onlyEnglish) &&
        body.getOrNull(it + 1)?.controlRef() == TO_LOWER_CASE }, "the transliteration's case-keeping flag changed")
    val flow = try {
        ControlFlow.of(method)
    } catch (failed: IllegalArgumentException) {
        throw Unfit("the transliteration's control flow can't be read (${failed.message})")
    }
    fits(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of the transliteration")
    return method
}
