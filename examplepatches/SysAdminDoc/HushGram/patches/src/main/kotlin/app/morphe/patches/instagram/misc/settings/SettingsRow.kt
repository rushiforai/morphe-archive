/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.misc.extension.freeLocalsAt
import app.morphe.patches.instagram.misc.extension.requireThisIntact
import app.morphe.patches.instagram.misc.extension.uniqueMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val WHAT = "HushGram settings row"

internal const val CREATE_VIEW_PARAMETERS = "Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;"

/**
 * The static factory of Instagram's settings screen fragment: it puts the screen to show under
 * "screen_id" and a fresh "new_settings_session" into a new instance's arguments, and answers that
 * instance. Two other methods put "new_settings_session" too, but answer something else.
 */
internal object SettingsScreenFactoryFingerprint : Fingerprint(
    strings = listOf("screen_id", "new_settings_session"),
    custom = { method, classDef -> AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == classDef.type },
)

/**
 * Puts the HushGram settings row at the top of Instagram's Settings and activity screen. That
 * screen's rows come from Instagram's server and are drawn in Compose, so the extension wraps the
 * view its fragment makes: before each `return-object` of `onCreateView`, the view goes through
 * SettingsEntry.withSettingsRow with the fragment's arguments, which name the screen shown.
 *
 * The first injected instruction takes the return's place, so a branch that jumped to the return
 * runs it too. Every name used is androidx's or the framework's.
 */
internal fun BytecodePatchContext.addSettingsRow() {
    val factory = uniqueMethod(WHAT, "settings screen factory", SettingsScreenFactoryFingerprint)
    val screen = mutableClassDefBy(factory.returnType)
    val createView = screen.methods.singleOrNull { method ->
        method.name == "onCreateView" && method.returnType == "Landroid/view/View;" && method.implementation != null &&
            method.parameterTypes.joinToString("") == CREATE_VIEW_PARAMETERS
    } ?: throw PatchException("$WHAT: ${screen.type} declares no onCreateView($CREATE_VIEW_PARAMETERS)")

    val returns = createView.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index }
    if (returns.isEmpty()) throw PatchException("$WHAT: ${screen.type}->onCreateView never returns a view")
    createView.requireThisIntact(WHAT, returns)

    val borrowed = returns.associateWith { index -> createView.freeLocalsAt(WHAT, index, 1).single() }
    returns.asReversed().forEach { index ->
        val view = createView.getInstruction<OneRegisterInstruction>(index).registerA
        if (view > 15) throw PatchException("$WHAT: ${screen.type}->onCreateView returns its view from v$view, past v15")
        val arguments = borrowed.getValue(index)
        createView.replaceInstruction(
            index,
            "invoke-virtual/range { p0 .. p0 }, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;",
        )
        createView.addInstructions(
            index + 1,
            """
                move-result-object v$arguments
                invoke-static { v$arguments, v$view }, $ENTRY->withSettingsRow(Landroid/os/Bundle;Landroid/view/View;)Landroid/view/View;
                move-result-object v$view
                return-object v$view
            """,
        )
    }
}
