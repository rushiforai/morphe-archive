package app.aapam.patches.zee5.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.aapam.patches.zee5.shared.Constants
import app.aapam.patches.zee5.shared.MediaSourceFactoryFingerprint

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes Google IMA ad insertion (client-side and " +
        "server-side DAI) from the ZEE5 player. The media source factory is " +
        "returned DRM-configured but with ad-insertion components never attached, " +
        "so content and DRM playback are unaffected.",
) {
    compatibleWith(Constants.COMPATIBILITY_ZEE5_TV)

    execute {
        val method = MediaSourceFactoryFingerprint.method

        // Locate the first call to setLocalAdInsertionComponents(...). It directly
        // follows the DRM setup, so returning the factory right here keeps DRM but
        // skips both local ad insertion and setServerSideAdInsertionMediaSourceFactory.
        val index = method.instructions.indexOfFirst { ins ->
            (ins as? ReferenceInstruction)?.reference is MethodReference &&
                (ins.reference as MethodReference).name == "setLocalAdInsertionComponents"
        }
        check(index >= 0) {
            "Could not locate 'setLocalAdInsertionComponents' in mediaSourceFactory"
        }

        // At this point v0 holds the DefaultMediaSourceFactory already configured
        // with the DRM session manager provider, so returning it is safe.
        method.addInstructions(index, "return-object v0\n")
    }
}
