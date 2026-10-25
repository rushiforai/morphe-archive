package app.template.patches.sofascore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import app.template.patches.sofascore.shared.forceCallResult
import app.template.patches.sofascore.shared.modalPredicate
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Flip the local account flags the app's ad logic consults, so every
        // "should show ads" decision evaluates to false on its own:
        //   if (getForceAds()) showAds();                       // -> false
        //   if (!getHasServerAds() || getPurchasedAds()
        //       || getForceHideAds() || ...) hideAds();         // -> true
        GetForceAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        GetForceHideAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        GetHasServerAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // With getHasServerAds() false every user looks ad-free, so the one-time "Active
        // subscription" upgrade sheet (shown to subscribers after a plan change) would open for
        // everyone. Its queue predicate is "!hasServerAds || purchasedAds || PR_XAIST set";
        // reading hasServerAds as true there restores the stock answer for non-subscribers, and
        // the sheet is never queued (no queue item waits for its dismiss). Real purchases still
        // see it. Kept here because this patch causes it.
        modalPredicate(ACTIVE_SUBSCRIPTION_MODAL, ACTIVE_SUBSCRIPTION_PREDICATE_ANCHOR)
            .forceCallResult("UserAccount.getHasServerAds()", value = true) {
                it.definingClass == USER_ACCOUNT_CLASS && it.name == "getHasServerAds"
            }

        // Skip the ad SDK start-up. ReleaseApp's consent method ends with
        // `new Thread(new <runnable>(this, 1)).start()`, a background thread that sets the ad
        // SDKs' consent and starts Mintegral, Unity, Moloco, Pangle, Equativ, Nimbus, AppHarbr and
        // MobileAds.initialize. Only that Thread.start() is removed: the Firebase consent-mode
        // code above it stays, the method's own return-void follows, and the shared R8
        // runnable's run() is untouched (its other cases serve unrelated callers).
        // Rule 9: without init, MobileAds statics throw. setAppVolume / setAppMuted are only called
        // from the init listener and AppHarbr (both started by this thread), but openDebugMenu is
        // also reachable from the hidden developer options, so every MobileAds static void is
        // neutralised below.
        // The banner, interstitial, rewarded and IMA preroll loads are already gated by the
        // ad-free flags above and by PREF_AD_ADAPTER_INITIALISED, which stays false without init,
        // so no extra GMA load hooks are needed.
        AdSdkStartupFingerprint.method.apply {
            val starts = implementation!!.instructions.withIndex().filter { (_, insn) ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                insn.opcode == Opcode.INVOKE_VIRTUAL &&
                    ref?.definingClass == "Ljava/lang/Thread;" &&
                    ref.name == "start" && ref.parameterTypes.isEmpty() && ref.returnType == "V"
            }
            if (starts.size != 1) {
                throw PatchException(
                    "Disable ads: $definingClass->$name has ${starts.size} Thread.start() calls, expected 1"
                )
            }
            // Labels on the removed call move to the next instruction, the method's return-void.
            removeInstructions(starts.single().index, 1)
        }
        neutraliseMobileAdsStatics("initialize", "openDebugMenu", "setAppVolume", "setAppMuted")
    }
}
