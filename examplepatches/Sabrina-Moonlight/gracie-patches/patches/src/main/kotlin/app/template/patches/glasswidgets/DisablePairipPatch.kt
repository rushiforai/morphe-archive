package app.template.patches.glasswidgets

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.misc.pairip.GLASS_WIDGETS
import app.template.patches.shared.misc.pairip.removePairipKeyImportPatch
import app.template.patches.shared.misc.pairip.removePairipProtectionPatch
import app.template.patches.shared.misc.pairip.removePairipVirtualizationPatch

internal val disablePairipPatch = bytecodePatch {
    compatibleWith(GLASS_WIDGETS)

    dependsOn(
        removePairipKeyImportPatch,
        removePairipVirtualizationPatch,
        removePairipProtectionPatch,
    )

    execute {
        // Work is done in the dependent patches.
    }
}
