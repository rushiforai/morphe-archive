package semicoloncolonel.mobilestream.patches.nfl.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants

private const val ADS_KEY = "ads"

// The NFL app is React Native and plays video with THEOplayer through
// react-native-theoplayer. Every source the JavaScript sends to the player
// passes through the bridge's SourceAdapter (zl/f in 61.0.18, R8-renamed),
// which turns the JS map into a SourceDescription. Its parse method reads the
// "ads" array with optJSONArray("ads"), converts each entry (Google IMA or
// THEOads) into an AdDescription, and hands the list to
// SourceDescription.Builder.ads().
//
// Replacing that optJSONArray result with null sends the parser down its own
// "no ads" branch, so the player is built with an empty ad list. Stream URLs,
// DRM, text tracks and metadata are unchanged. Google DAI and other
// server-stitched streams are set on the source itself, not in this list,
// and are left alone.
internal object SourceAdapterParseFingerprint : Fingerprint(
    returnType = "Lcom/theoplayer/android/api/source/SourceDescription;",
    parameters = listOf("Lcom/facebook/react/bridge/ReadableMap;"),
    strings = listOf("sources", "poster", ADS_KEY, "textTracks"),
)

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Stops the video ads the NFL app adds before and during clips and " +
        "highlights. Ads stitched into a live stream still play. Experimental; " +
        "test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        SourceAdapterParseFingerprint.method.apply {
            val instructions = implementation!!.instructions.toList()
            val keyIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string == ADS_KEY
            }
            val resultIndex = (keyIndex + 1 until instructions.size).firstOrNull {
                instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT
            } ?: throw PatchException("ads array read not found")

            val register = (instructions[resultIndex] as OneRegisterInstruction).registerA
            addInstructions(resultIndex + 1, "const/4 v$register, 0x0")
        }
    }
}
