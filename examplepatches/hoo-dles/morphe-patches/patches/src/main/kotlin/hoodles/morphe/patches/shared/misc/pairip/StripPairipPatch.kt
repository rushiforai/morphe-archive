package hoodles.morphe.patches.shared.misc.pairip

import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.hex.HexPatchBuilder
import app.morphe.patches.all.misc.hex.hexPatch
import hoodles.morphe.patches.shared.misc.pairip.bytecode.getBytecodePatch
import hoodles.morphe.patches.shared.misc.pairip.extension.getExtensionPatch
import hoodles.morphe.patches.shared.misc.pairip.resources.getPairipResourcesPatch

fun getStripPairipPatch(
    appName: String,
    useStub: Boolean = false,
    replacements: (HexPatchBuilder.() -> Unit)? = null
): BytecodePatch = bytecodePatch {
    dependsOn(
        getPairipResourcesPatch(useStub),
        getBytecodePatch(appName),
        getExtensionPatch(appName)
    )
    replacements?.also { dependsOn(hexPatch(false, it)) }
}