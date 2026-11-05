package semicoloncolonel.mobilestream.patches.tmobileplay.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants

// T-Mobile Play 19.4.4 starts Vizbee at launch. Vizbee looks for TVs and streaming
// devices on the home network and reports to its servers, tagged with the
// T-Mobile subscriber's device ID. The app's Vizbee wrapper no longer starts
// it, so nothing scans or reports. Sending video to a TV from T-Mobile Play will not
// work with this patch.

// The wrapper's init(): the only app method that calls VizbeeTPlay.Companion.init.
internal object VizbeeWrapperInitFingerprint : Fingerprint(
    name = "init",
    returnType = "V",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                it.definingClass == "Ltv/vizbee/tplay/VizbeeTPlay\$Companion;" && it.name == "init"
            } == true
        } == true
    },
)

@Suppress("unused")
val blockTvDiscoveryPatch = bytecodePatch(
    name = "Block TV discovery",
    description = "Stops Vizbee, which scans your home network for TVs.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        VizbeeWrapperInitFingerprint.method.returnEarly("return-void")
    }
}
