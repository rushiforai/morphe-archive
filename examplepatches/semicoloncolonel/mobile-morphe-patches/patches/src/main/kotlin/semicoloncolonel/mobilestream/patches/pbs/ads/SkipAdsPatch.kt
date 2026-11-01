package semicoloncolonel.mobilestream.patches.pbs.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants

private const val NO_ADS_LOG = "Playing media without ads. No ads configuration found."

// PBS 5.27.0 plays sponsor pre-rolls and mid-rolls through Google IMA
// (Media3 ImaAdsLoader, client-side). Its MediaSource.Factory (pt8.a in
// 5.27.0, R8-renamed) builds the DASH/HLS source and, only when the item's
// localConfiguration has an AdsConfiguration, wraps it in an AdsMediaSource.
// It is the only AdsMediaSource in the app and logs the literal above when
// there is no ads configuration.
internal object AdsMediaSourceFactoryFingerprint : Fingerprint(
    strings = listOf(NO_ADS_LOG),
)

// The AdsConfiguration read (iget-object ...->adsConfiguration) is the last
// field load before that log. Loading null instead sends every item down the
// app's own "no ads configuration" branch, which returns the plain content
// source. DRM is set up earlier in the method and is unchanged.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops the sponsor messages that play before and during PBS videos. " +
        "Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        AdsMediaSourceFactoryFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val logIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == NO_ADS_LOG
            }
            val readIndex = (logIndex - 1 downTo 0).firstOrNull {
                instructions[it].opcode == Opcode.IGET_OBJECT
            } ?: throw PatchException("AdsConfiguration read not found")

            val register = (instructions[readIndex] as TwoRegisterInstruction).registerA
            replaceInstruction(readIndex, "const/4 v$register, 0x0")
        }
    }
}
