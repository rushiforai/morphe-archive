package patches.gboard.features.hiddenflags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.generated.GboardVersionBindings
import patches.gboard.Constants.COMPATIBILITY_GBOARD

private const val OVERRIDE_RUNTIME =
    "Ldev/jason/gboardpatches/extension/hiddenflags/GboardFlagOverrideRuntime;"

/**
 * Applies the stored hidden-flag overrides before the keyboard service reads its first flag.
 * The override goes through Gboard's own store (`adfk.o(name)` + `adfk.h(adiu.OVERRIDE)`), so no
 * flag-getter hook is needed and new names only require a catalog entry.
 */
internal val gboardHiddenFlagsBootstrapPatch = bytecodePatch(
    description = "Apply hidden-flag overrides when the keyboard service starts.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardVersionBindings.webClipboardCreate).addInstructions(
            0,
            "invoke-static {p0}, $OVERRIDE_RUNTIME->applyAtStartup(Landroid/content/Context;)V",
        )
    }
}
