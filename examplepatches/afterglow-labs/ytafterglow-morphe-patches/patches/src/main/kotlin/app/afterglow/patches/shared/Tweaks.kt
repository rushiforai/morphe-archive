package app.afterglow.patches.shared

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode

/** Extension class that holds the ids of the installed tweaks. */
internal const val INSTALLED_TWEAKS = "$EXTENSION_PACKAGE/InstalledTweaks;"

/**
 * Records that the tweak [id] (an id from `tools/tweaks.json`) is installed, by inserting
 * `InstalledTweaks.mark(id)` before the final `return-void` of `InstalledTweaks.<clinit>`.
 * Every named tweak patch calls this from its execute block; the extension then enables only the
 * features of installed tweaks.
 *
 * The static initializer is a single field store, so after d8 it has one register, v0, which is
 * dead at the return; that register is checked before it is used.
 */
internal fun BytecodePatchContext.markTweakInstalled(id: String) {
    val clinit = mutableClassDefBy(INSTALLED_TWEAKS).methods.firstOrNull { method -> method.name == "<clinit>" }
        ?: throw PatchException("$INSTALLED_TWEAKS has no static initializer")
    val implementation = clinit.implementation
        ?: throw PatchException("$INSTALLED_TWEAKS.<clinit> has no code")
    if (implementation.registerCount < 1) {
        throw PatchException("$INSTALLED_TWEAKS.<clinit> has no register for the tweak id")
    }
    val instructions = implementation.instructions
    if (instructions.isEmpty() || instructions.last().opcode != Opcode.RETURN_VOID) {
        throw PatchException("$INSTALLED_TWEAKS.<clinit> must end in return-void")
    }

    clinit.addInstructions(
        instructions.lastIndex,
        """
            const-string v0, "$id"
            invoke-static { v0 }, $INSTALLED_TWEAKS->mark(Ljava/lang/String;)V
        """,
    )
}
