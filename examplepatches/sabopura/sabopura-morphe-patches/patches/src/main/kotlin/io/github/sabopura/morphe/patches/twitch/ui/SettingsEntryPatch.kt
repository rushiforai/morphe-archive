package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.sabopura.morphe.patches.twitch.Constants.TWITCH_SUPPORTED
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.softHook

private const val ENTRY = "Lio/github/sabopura/morphe/extension/twitch/ui/SettingsEntry;"

private fun BytecodePatchContext.onCreateView(type: String) = mutableClassDefBy(type).methods.singleOrNull {
    it.name == "onCreateView" && it.returnType == "Landroid/view/View;"
} ?: throw PatchException("Settings entry: $type has no onCreateView")

private fun MutableMethod.filterReturnedView(call: String) {
    val returns = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
    if (returns.isEmpty()) throw PatchException("Settings entry: $definingClass.onCreateView has no return")
    returns.asReversed().forEach { index ->
        val register = (getInstruction(index) as OneRegisterInstruction).registerA
        insertBeforeKeepingLabels(index, call.replace("REG", "v$register"))
    }
}

/**
 * The older screen shares onCreateView with every list-style settings page, and from 31.9.0 the
 * method reuses p0 for the view it returns, so the fragment is noted on entry.
 */
internal fun MutableMethod.wrapLegacySettingsView() {
    addInstruction(0, "invoke-static/range {p0 .. p0}, $ENTRY->creating(Ljava/lang/Object;)V")
    filterReturnedView(
        """
            invoke-static/range {REG .. REG}, $ENTRY->wrapIfMain(Landroid/view/View;)Landroid/view/View;
            move-result-object REG
        """,
    )
}

/**
 * Adds a "patch settings" row to the top of Twitch's own settings screen (the gear on the
 * profile page), in both the current screen and the older list-style one.
 */
internal val settingsEntryPatch = bytecodePatch(
    description = "Adds the patch settings to Twitch's settings screen.",
) {
    compatibleWith(TWITCH_SUPPORTED)
    extendWith("extensions/twitch.mpe")

    execute {
        softHook("settings entry (current screen)") {
            onCreateView("Ltv/twitch/android/settings/main/MainSettingsFragmentV2;").filterReturnedView(
                """
                    invoke-static/range {REG .. REG}, $ENTRY->wrap(Landroid/view/View;)Landroid/view/View;
                    move-result-object REG
                """,
            )
        }
        softHook("settings entry (older screen)") {
            onCreateView("Ltv/twitch/android/shared/settings/BaseSettingsFragment;").wrapLegacySettingsView()
        }
    }
}
