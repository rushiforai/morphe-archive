package app.ayufa.patches.transit.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.transit.shared.Constants.COMPATIBILITY_YAHOO_TRANSIT
import app.ayufa.patches.transit.shared.forceVisibilityCallsGone
import app.ayufa.patches.transit.shared.goneAfterSuperInit
import app.ayufa.patches.transit.shared.pinVisibilityGone

@Suppress("unused")
val hideTransitAdsPatch = bytecodePatch(
    name = "広告を非表示",
    description = "Yahoo!乗換案内の広告（各画面のバナー・ネイティブ広告、" +
        "全画面のオーバーレイ広告）を非表示にします。",
    default = true
) {
    compatibleWith(COMPATIBILITY_YAHOO_TRANSIT)

    execute {
        // Hide every ad placement view at construction time; an
        // ad slot that starts out GONE has no area to render into.
        adViewConstructorFingerprints.forEach { fingerprint ->
            fingerprint.method.goneAfterSuperInit()
        }

        // Slots are also re-shown from outside the view (state
        // collectors and load callbacks call setVisibility(VISIBLE)
        // on the view). Give every ad view a setVisibility override
        // that always applies GONE, so no caller can revive it.
        adViewConstructorFingerprintsByClass.values.forEach { constructors ->
            constructors.first().classDef.pinVisibilityGone()
        }

        // The views' own visibility state machines force the slot
        // back to VISIBLE when the ad state changes (loading / ad /
        // error), reviving an empty ad frame even when the view
        // itself starts hidden. Pin every visibility call inside
        // those state machines to GONE. Views without a state
        // machine are skipped.
        adViewStateMachineFingerprints.forEach { fingerprint ->
            try {
                fingerprint.method.forceVisibilityCallsGone()
            } catch (e: PatchException) {
                // No declared setVisibility state machine here.
            }
        }
    }
}
