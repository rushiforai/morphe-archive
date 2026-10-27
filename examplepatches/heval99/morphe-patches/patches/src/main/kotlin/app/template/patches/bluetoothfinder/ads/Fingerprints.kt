package app.template.patches.bluetoothfinder.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ADVIEW = "Lcom/google/android/gms/ads/AdView;"

// The whole app, GMA included, is R8-renamed, so the anchors are the app's live interstitial ad
// unit and the kept GMA AdView class.

// MainActivity's MobileAds init-complete listener (1.9.3: ib0.a(q40)): sets the test-device ids,
// loads the banner (check-cast AdView, then BaseAdView.loadAd) and loads the interstitial with the
// live unit. The only other holder of the unit (1.9.3: zb0.e()) is the no-arg interstitial reload
// after a dismissed ad, which never touches AdView.
internal object MobileAdsInitCompleteFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(string("ca-app-pub-9043738977093939/5919566899", StringComparisonType.CONTAINS)),
    custom = { method, _ ->
        method.parameterTypes.size == 1 &&
            method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == ADVIEW
            } == true
    },
)
