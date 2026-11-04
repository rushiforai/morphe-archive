package semicoloncolonel.mobilestream.patches.foxlocal.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.foxlocal.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// FOX LOCAL 7.22.0 keeps its privacy choice in Ketch. Until you choose, the
// app and its video player send the US Privacy string "1---" (no choice made)
// to ad partners. That default becomes "1YYN", opted out of sale and sharing,
// as Fox News does; a choice you make later in the privacy settings is saved
// and used instead. The app also reports limit-ad-tracking, so the player
// asks for non-personalized ads.

private const val NO_CHOICE = "1---"
private const val OPTED_OUT = "1YYN"

internal object StoredPrivacyFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/core/persistence/KetchDataProvider;",
    name = "getCCPA",
    strings = listOf(NO_CHOICE),
)

internal object PlayerPrivacyDefaultFingerprint : Fingerprint(
    definingClass = "Lcom/fox/android/video/player/api/utils/StringExtensionsKt;",
    name = "getUSPrivacyStringOrDefault",
    strings = listOf(NO_CHOICE),
)

internal object LimitAdTrackingFingerprint : Fingerprint(
    definingClass = "Lcom/fox/fts/mobile/core/ketch/KetchAdvertisingProvider;",
    name = "getLimitAdTracking",
    returnType = "Z",
)

private fun MutableMethod.optOutByDefault() {
    val instructions = implementation!!.instructions.toList()
    var replaced = 0
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
        if (((instruction as ReferenceInstruction).reference as StringReference).string != NO_CHOICE) return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        replaceInstruction(index, "const-string v$register, \"$OPTED_OUT\"")
        replaced++
    }
    if (replaced == 0) throw PatchException("$definingClass->$name has no default privacy string")
}

@Suppress("unused")
val optOutOfDataSalePatch = bytecodePatch(
    name = "Opt out of data sale & sharing",
    description = "Starts the FOX LOCAL app opted out of the sale and sharing of your data and of targeted ads. " +
        "You can still change the choice in the app's privacy settings.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        StoredPrivacyFingerprint.method.optOutByDefault()
        PlayerPrivacyDefaultFingerprint.method.optOutByDefault()
        LimitAdTrackingFingerprint.method.returnEarly("const/4 v0, 0x1\nreturn v0")
    }
}
