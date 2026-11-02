package app.morphe.patches.bongobd.update

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.bongobd.shared.Constants.COMPATIBILITY_BONGO
import app.morphe.patches.bongobd.shared.moprhe.com.bongo.bongobd.view.model2.version_chek.VersionCheckRsp

@Suppress("unused")
val disableUpdatePatch =
    bytecodePatch(
        name = "Disable update",
        description = "Disables forced update.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_BONGO)

        dependsOn(VersionCheckRsp.getForcedUpdatePatch)
    }
