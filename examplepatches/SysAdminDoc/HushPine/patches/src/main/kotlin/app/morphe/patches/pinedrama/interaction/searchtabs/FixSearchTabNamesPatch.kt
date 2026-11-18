/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.searchtabs

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.registerForBuildDetails
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/morphe/extension/pinedrama/search/SearchTabTitles;"

/**
 * PineDrama's server can name a search tab with a template it never filled in, and the app shows
 * that text as it is (`${drama_tab_name}`, #9). Every title leaves through one method, so each of
 * its returns gets checked: a drama placeholder becomes the Home screen's Drama label, in the
 * app's language, and any other placeholder becomes readable. Normal titles pass through.
 */
@Suppress("unused")
val fixSearchTabNamesPatch = bytecodePatch(
    name = "Fix search tab names",
    description = "Shows the real name on search result tabs when PineDrama is sent a placeholder " +
        "like \${drama_tab_name} instead. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Search")
    // The title check lives in the extension.
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        val dramaLabel = DramaTabLabelFingerprint.method
        val protocol = dramaLabel.definingClass
        val labelCall = "$protocol->${dramaLabel.name}(Landroid/content/Context;)Ljava/lang/String;"

        SearchTabTitleFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()
            returns.asReversed().forEachIndexed { ordinal, index ->
                val title = getInstruction<OneRegisterInstruction>(index).registerA
                // Nothing is read after a return, so any other local is free here.
                val spare = if (title == 0) 1 else 0
                addInstructionsAtControlFlowLabel(
                    index,
                    """
                        invoke-static {v$title, p1}, $EXTENSION_CLASS->dramaLabelContext(Ljava/lang/CharSequence;Landroid/content/Context;)Landroid/content/Context;
                        move-result-object v$spare
                        if-eqz v$spare, :morphe_search_tab_plain_$ordinal
                        new-instance v$title, $protocol
                        invoke-direct {v$title}, $protocol-><init>()V
                        invoke-virtual {v$title, v$spare}, $labelCall
                        move-result-object v$title
                        return-object v$title
                        :morphe_search_tab_plain_$ordinal
                        invoke-static {v$title}, $EXTENSION_CLASS->readable(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                        move-result-object v$title
                    """,
                )
            }
        }

        registerForBuildDetails("enableSearchTabNameFix")
    }
}
