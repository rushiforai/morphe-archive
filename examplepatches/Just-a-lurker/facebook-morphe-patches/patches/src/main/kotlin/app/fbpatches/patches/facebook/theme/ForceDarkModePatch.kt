/*
 * The hook and the fingerprint follow Hushfacebook
 * (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0), layout/theme/ForceDarkModePatch.kt,
 * Fingerprints.kt (DarkModeFingerprint) and AmoledThemePatch.kt (hookDarkModeAnswer), rewritten
 * for facebook-morphe-patches, 2026. Hushfacebook's runtime switch is replaced by a tablet check,
 * so the patch needs no settings.
 */
package app.fbpatches.patches.facebook.theme

import app.fbpatches.patches.facebook.shared.EXTENSION_PACKAGE
import app.fbpatches.patches.facebook.shared.extensionPatch
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Kept enum holding the theme preference Facebook's dark mode controller reads. */
private const val THEME_PREFERENCES_STATE = "Lcom/facebook/prefs/theme/ThemePreferences\$State;"

private const val DARK_MODE_ANSWER = "$EXTENSION_PACKAGE/theme/DarkMode;->answer(Z)Z"

/**
 * Facebook's dark mode controller answering whether its dark mode is on for the whole app: the
 * Dark mode setting, or the system's night mode when the setting follows the system. It's the only
 * method holding the end-to-end tests' dark mode switch, and it reads the setting's
 * ThemePreferences state (585 found as `X.C01el;->A05`; the class and method names are renamed
 * every release). An activity's own theme can force dark or light without it, which is why the hook
 * goes here and not on the method that applies an activity's theme.
 */
internal object DarkModeFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("fb.e2e.enable_dark_mode"),
    filters = listOf(fieldAccess(type = THEME_PREFERENCES_STATE)),
)

/**
 * Turns Facebook's dark mode on for tablets, where its Settings page has no Dark mode row. Phones
 * keep Facebook's own light or dark choice. Off by default: pick it in Morphe Manager before
 * patching. Once patched in, it works without a runtime switch.
 */
@Suppress("unused")
val forceDarkModePatch = bytecodePatch(
    name = "Dark mode on tablets",
    description = "Turns Facebook's dark mode on for tablets, where its Settings page has no Dark mode " +
        "row. Phones keep Facebook's own light or dark choice. Off by default: pick it in Morphe " +
        "Manager before patching. Works as soon as you patch it in, with no switch.",
    default = false,
) {
    dependsOn(extensionPatch)
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        // Every answer of the controller passes through the extension before it returns.
        DarkModeFingerprint.method.hookBooleanReturns(DARK_MODE_ANSWER)
    }
}

/**
 * Puts `invoke-static { v<register> }, <call>` and a `move-result` into that register before each
 * `return` of this boolean method, so what it returns is what the call answers. The hooks go in
 * from last to first, because an insert moves every later index.
 */
private fun MutableMethod.hookBooleanReturns(call: String) {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no body")
    val instructions = implementation.instructions.toList()

    val addresses = instructions.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val indexOfAddress = addresses.withIndex().associate { (index, address) -> address to index }
    val branchTargets = instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction is OffsetInstruction) {
            indexOfAddress[addresses[index] + instruction.codeOffset]
        } else {
            null
        }
    }.toSet()

    val returns = instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }

    if (returns.isEmpty()) throw PatchException("$definingClass->$name returns no dark mode answer")
    returns.forEach { (index, register) ->
        if (register >= 16) {
            throw PatchException(
                "$definingClass->$name: return register v$register is out of invoke-static range",
            )
        }
        if (index in branchTargets) {
            throw PatchException("$definingClass->$name: the return at index $index is a branch target")
        }
    }

    returns.asReversed().forEach { (index, register) ->
        addInstructions(
            index,
            """
                invoke-static { v$register }, $call
                move-result v$register
            """,
        )
    }
}
