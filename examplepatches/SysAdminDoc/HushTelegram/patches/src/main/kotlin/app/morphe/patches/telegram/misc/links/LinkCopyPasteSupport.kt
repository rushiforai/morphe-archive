/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.links

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCallable
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.paste.resolveNormalPaste
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

private const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val PLAIN_TEXT = "Landroid/content/ClipData;->newPlainText($CHAR_SEQUENCE$CHAR_SEQUENCE)Landroid/content/ClipData;"
private const val HTML_TEXT = "Landroid/content/ClipData;->newHtmlText($CHAR_SEQUENCE$CHAR_SEQUENCE" + "Ljava/lang/String;)Landroid/content/ClipData;"

internal const val COPIED_LINK = "$LINKS->cleanCopiedLink($CHAR_SEQUENCE)$CHAR_SEQUENCE"
internal const val WATCH_PASTE = "$LINKS->watchPaste(Landroid/view/View;I)V"

/** Where a copied or pasted link is cleaned: Telegram's one-argument clipboard copy, and the two message box editors. */
internal class CopyPasteSites(val copy: MutableMethod, val pastes: List<MutableMethod>) {
    fun insert() {
        insertCopy()
        insertPastes()
    }

    fun insertCopy() = copy.addInstructionsAtControlFlowLabel(0, "invoke-static {p0}, $COPIED_LINK\nmove-result-object p0")

    /** Use normal paste checks the stock editors as it runs, so the patch puts these in once every patch has run. */
    fun insertPastes() = pastes.forEach { it.addInstructionsAtControlFlowLabel(0, "invoke-static {p0, p1}, $WATCH_PASTE") }

    /** The same edits on copies, so a register or smali problem shows before the app is touched. */
    fun rehearse() {
        MutableMethod(ImmutableMethod.of(copy)).addInstructionsAtControlFlowLabel(0, "invoke-static {p0}, $COPIED_LINK\nmove-result-object p0")
        pastes.forEach {
            MutableMethod(ImmutableMethod.of(it)).addInstructionsAtControlFlowLabel(0, "invoke-static {p0, p1}, $WATCH_PASTE")
        }
    }
}

/**
 * Telegram's `AndroidUtilities.addToClipboard(CharSequence)` keeps its name in every build and is
 * where a plain copy ends: it wraps a Spanned text as HTML and anything else as plain text. The
 * paste editors are the two `onTextContextMenuItem` methods the plain paste patch finds, one in the
 * message box and one in the caption box. A build whose editors can't be found keeps the copy half.
 */
internal fun BytecodePatchContext.resolveCopyPaste(): CopyPasteSites {
    controlHook(LINKS, "cleanCopiedLink", listOf(CHAR_SEQUENCE), CHAR_SEQUENCE)
    controlHook(LINKS, "watchPaste", listOf("Landroid/view/View;", "I"), "V")
    val found = classDefsMentioning(Mention.reference(PLAIN_TEXT) and Mention.reference(HTML_TEXT))
        .filter { it.origType == ANDROID_UTILITIES }.flatMap { it.methods.toList() }.filter { method ->
            method.origName == "addToClipboard" && method.parameterTypes.map { it.toString() } == listOf(CHAR_SEQUENCE) &&
                method.origReturnType == "Z" && method.controlCallable(true) &&
                method.controlBody().any { it.controlRef() == PLAIN_TEXT } && method.controlBody().any { it.controlRef() == HTML_TEXT }
        }
    controlShape(found.size == 1, "the one-argument clipboard copy is missing or ambiguous")
    val copy = tgMutableClassDefBy(found.single().definingClass).methods.single { it.toString() == found.single().toString() }
    controlShape(!AccessFlags.NATIVE.isSet(copy.accessFlags), "the clipboard copy is native")
    val pastes = try {
        resolveNormalPaste().map { it.method }
    } catch (unfit: PatchException) {
        patchLog.warning("Strip link tracking: ${unfit.message}. Links you paste are left as they are.")
        emptyList()
    }
    return CopyPasteSites(copy, pastes).also { it.rehearse() }
}
