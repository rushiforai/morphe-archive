package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

object initializeDidomiFingerprint : Fingerprint (
	definingClass = "Lio/didomi/sdk/Didomi;",
	name="initialize"
)

val blockDidomiPatch = bytecodePatch (
    name = "Block data collection",
    description = "Block Didomi tracking SDK, disable consent prompt."
){
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        initializeDidomiFingerprint.method.returnEarly()
    }
}