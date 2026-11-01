/*
 * Ported from ajstrick81's ESPN Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/espn
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.espn.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

internal const val AD_DISABLED_FIELD = "isAdDisabled"

// ESPN plays video through Disney's DMP SGAI plugin, the same as the TV app.
// com.disney.dmp.sgai.InterstitialManager reads one boolean, isAdDisabled,
// before it schedules an interstitial, a live break, or a VOD mid-roll
// (processInterstitialTag, processBreakTag twice, scheduleVodMidRoll,
// groupVodInsertionPoints). The field is written once, in the constructor
// that takes the full argument list. The synthetic default-args constructor
// only forwards to it, so the match requires the iput itself.
//
// The phone build 8.27.0 keeps the com.disney.dmp.sgai names unobfuscated,
// as the TV build does.
internal object InterstitialManagerInitFingerprint : Fingerprint(
    custom = { method, _ ->
        method.name == "<init>" &&
            method.definingClass == "Lcom/disney/dmp/sgai/InterstitialManager;" &&
            method.implementation?.instructions?.any { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN &&
                    ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.name == AD_DISABLED_FIELD
            } == true
    },
)
