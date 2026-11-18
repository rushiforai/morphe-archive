package io.github.kirby1997.patches.meetup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import io.github.kirby1997.patches.shared.Constants

// Removes the third-party "Powered by Rokt" partner-offer popup (e.g. the
// "You've unlocked Disney+" interstitial after signing up for an event). Meetup
// integrates the Rokt SDK through mParticle's RoktKit; every placement is shown by
// the single funnel RoktKit.execute(...), which forwards to Rokt.execute and
// ultimately renders the Compose widget. No-op that one method and no Rokt
// placement ever renders, regardless of which viewName/event triggers it. The Rokt
// SDK itself stays initialised (init is untouched), so nothing that merely queries
// Rokt state breaks — the offer simply never displays.

object RoktKitExecuteFingerprint : Fingerprint(
    definingClass = "Lcom/mparticle/kits/RoktKit;",
    name = "execute",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Lcom/mparticle/MpRoktEventCallback;",
        "Ljava/util/Map;",
        "Ljava/util/Map;",
        "Lcom/mparticle/kits/FilteredMParticleUser;",
        "Lcom/mparticle/rokt/RoktConfig;",
    ),
)

@Suppress("unused")
val disableRoktOffersPatch = bytecodePatch(
    name = "Disable Rokt partner offers",
    description = "Removes the 'Powered by Rokt' third-party offer popups (e.g. the post-signup Disney+ " +
        "interstitial) by no-oping the mParticle RoktKit.execute funnel so no Rokt placement renders.",
) {
    compatibleWith(Constants.MEETUP)

    execute {
        RoktKitExecuteFingerprint.method.addInstructions(0, "return-void")
    }
}
