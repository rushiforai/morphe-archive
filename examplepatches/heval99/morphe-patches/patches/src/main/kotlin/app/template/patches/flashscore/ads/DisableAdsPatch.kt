package app.template.patches.flashscore.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Since 26.11.4 R8 repackages Google's next-generation Mobile Ads SDK into ads_mobile_sdk.* (only
// AdActivity and a few internal classes keep their names), so the SDK surface can no longer be
// hooked by name (same as 365Scores 14.9.8). The patch works at the app layer instead, on
// kept classes, stable config key names and stable preference keys:
//   1. The ADS_ENABLED remote-config switch answers false. It is the app's own ads kill switch:
//      AdvertZone, the zone id resolver, the embedded list/news ad components and the screens'
//      ad states all read it. ADS_AMAZON_ENABLED (APS bidding) answers false too.
//   2. AdvertZone (every ad slot, including its bookmaker WebView provider) collapses itself
//      instead of loading, so no empty placeholder is left behind. The sponsored bookmaker
//      strip, bonus strip and odds are not ad slots; Hide betting content covers them.
//   3. The interstitial manager has no ad unit id, so it takes its own "no unit configured" exit
//      and never loads or shows an interstitial (it does not read ADS_ENABLED).
//   4. The video player never receives a VMAP response, so IMA video ads are never requested.
// The SDK itself may still initialise (its app-side caller is an R8-merged lambda with no stable
// anchor); with no ad requested it shows nothing.
private const val ADS_HELPER_NAME = "morpheAdsGet"
private const val ADS_ENABLED = "ADS_ENABLED"
private val FORCED_KEYS = linkedMapOf(
    ADS_ENABLED to ForcedConfigValue.FALSE,
    "ADS_AMAZON_ENABLED" to ForcedConfigValue.FALSE,
)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        // 1. Remote config: ads off. Chains with Hide betting content's helper on the same get().
        forceRemoteConfigValues(
            patchName = "Disable ads",
            helperName = ADS_HELPER_NAME,
            forced = FORCED_KEYS,
            required = setOf(ADS_ENABLED),
        )

        // 2. AdvertZone: do what the app itself does when ads are disabled (GONE, then the
        // (I)V helper that resets the min height and reports the visibility) and return
        // before any provider is picked. The helper is found by its setMinHeight call.
        val collapse = mutableClassDefBy(ADVERT_ZONE).methods.singleOrNull { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroidx/constraintlayout/widget/ConstraintLayout;" &&
                        ref.name == "setMinHeight"
                } == true
        } ?: throw PatchException("AdvertZone has no single (I)V setMinHeight helper")
        // The load method has 34 locals, so p0 is beyond the 4-bit range of invoke-virtual.
        AdvertZoneLoadFingerprint.method.addInstructionsChecked(
            0,
            """
                move-object/from16 v0, p0
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {v0, v1}, $ADVERT_ZONE->${collapse.name}(I)V
                return-void
            """.trimIndent()
        )

        // 3. Interstitials: the manager's ad unit id getter (its only ()String method) answers "".
        // Its load entry point checks that id's length first and returns when it is empty, which
        // is required here so an empty id is a state the app handles.
        val manager = InterstitialManagerConstructorFingerprint.classDef
        val unitId = manager.methods.singleOrNull {
            it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
        } ?: throw PatchException("${manager.type} has no single ()String ad unit id getter")
        val guarded = manager.methods.any { method ->
            val refs = method.implementation?.instructions
                ?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                ?.toList().orEmpty()
            val call = refs.indexOfFirst { it.definingClass == manager.type && it.name == unitId.name && it.parameterTypes.isEmpty() }
            call >= 0 && refs.getOrNull(call + 1)?.let { it.definingClass == "Ljava/lang/String;" && it.name == "length" } == true
        }
        if (!guarded) throw PatchException("${manager.type}: no method checks ${unitId.name}()'s length before loading")
        unitId.addInstructionsChecked(
            0,
            """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )

        // 4. Video ads: drop the VMAP response before it is stored on the media item.
        VideoMediaConstructorFingerprint.method.addInstructionsChecked(0, "const/4 p3, 0x0")
    }
}
