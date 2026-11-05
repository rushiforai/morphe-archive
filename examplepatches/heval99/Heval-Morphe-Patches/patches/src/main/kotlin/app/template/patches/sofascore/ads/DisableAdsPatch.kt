package app.template.patches.sofascore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
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
            // The consent method sits in ReleaseApp (26.10.19) or, since 26.10.26, in its
            // R8-renamed abstract superclass; anything outside that chain is a wrong match.
            val appClasses = generateSequence(RELEASE_APP_CLASS) { classDefByOrNull(it)?.superclass }
                .takeWhile { it != "Landroid/app/Application;" }.toSet()
            if (definingClass !in appClasses) {
                throw PatchException("Disable ads: consent method $definingClass->$name is not in ReleaseApp's hierarchy")
            }
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

        // Skip the ad SDK work the manifest starts before Application.onCreate (2026-11-03). In
        // bytecode, not by removing the manifest entries: this patch has no resource pass, and
        // adding one only for this would re-encode the resource table (rule 12) when Disable ads
        // is applied alone. The provider objects are still created, but their onCreate bodies
        // (lifecycle tracking that loads each SDK's classes) and Unity's initializer no longer
        // run. An SDK the app dropped has nothing to skip; a present class with no such method
        // fails the patch.
        skipAdSdkStartupComponents()
    }
}

private fun BytecodePatchContext.skipAdSdkStartupComponents() {
    val providers = AD_SDK_LIFECYCLE_PROVIDERS.mapNotNull { type ->
        val classDef = mutableClassDefByOrNull(type) ?: return@mapNotNull null
        classDef.methods.singleOrNull {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("Disable ads: $type has no onCreate()Z with a body")
    }
    val unity = mutableClassDefByOrNull(UNITY_ADS_INITIALIZER)?.let { classDef ->
        classDef.methods.singleOrNull {
            it.name == "create" && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.implementation != null
        } ?: throw PatchException("Disable ads: $UNITY_ADS_INITIALIZER has no create(Context)Object with a body")
    }
    if (providers.isEmpty() && unity == null) {
        throw PatchException("Disable ads: none of the ad SDK start-up components was found")
    }

    // A provider that reports success (true) without doing anything.
    providers.forEach { it.returnEarly(true) }
    // The Initializer result is only stored by androidx.startup; nothing asks for it.
    unity?.addInstructionsChecked(
        0,
        """
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
        """,
    )
}
