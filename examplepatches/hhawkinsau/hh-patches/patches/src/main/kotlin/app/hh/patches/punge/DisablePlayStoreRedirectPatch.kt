package app.hh.patches.punge

import app.hh.patches.shared.Constants.COMPATIBILITY_PUNGE
import app.hh.patches.shared.disablePairIpPlayStoreRedirect
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disablePlayStoreRedirectPatch = bytecodePatch(
    name = "Disable Play Store redirect for Punge",
    description = "Stops Punge from opening the Play Store on launch when the " +
        "app was sideloaded or patched instead of installed from Play.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PUNGE)

    execute {
        val patched = disablePairIpPlayStoreRedirect()
        if (patched == 0) {
            throw PatchException(
                "Could not find Punge's Play Store redirect (PairIP license check " +
                    "or installer-source check). The app may have changed; no changes applied.",
            )
        }
    }
}
