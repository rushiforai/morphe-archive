package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly

object initializeDidomiFingerprint : Fingerprint (
	definingClass = "Lio/didomi/sdk/Didomi;",
	name="initialize"
)

val blockDidomiPatch = bytecodePatch (
    name = "Block data collection",
    description = "Block Didomi tracking SDK, disable consent prompt"
){
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        initializeDidomiFingerprint.method.returnEarly()
    }
}