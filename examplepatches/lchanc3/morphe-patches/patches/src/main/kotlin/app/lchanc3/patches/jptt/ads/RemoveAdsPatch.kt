package app.lchanc3.patches.jptt.ads

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.JpttApplicationOnCreateFingerprint
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** The ad SDKs, which the app touches in JpttApplication.onCreate() and nowhere else. */
private val AD_SDK_CLASSES = setOf(
    "Lcom/google/android/gms/ads/MobileAds;",
    "Lcom/aotter/net/trek/TrekAds;",
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops the banner, the rows inside articles and lists, and the ad the " +
        "app falls back to when it thinks AdMob is blocked. No ad is requested at all, so " +
        "nothing is downloaded and nothing is reported.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    execute {
        emptyBanner()
        silence(AddLocalAdFingerprint, AddTAMediaAdFingerprint)
        silence(ArticleNativeAdLoadFingerprint, DigestNativeAdLoadFingerprint)
        dropAdSdkCalls()
    }
}

/**
 * The banner factory still builds its AdView, because three of its five callers
 * use what it returns without checking it for null. It just never asks for an ad
 * and hands back a view that is gone, which takes no space in the layouts it is
 * added to.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.emptyBanner() {
    val method = GetAdmobBannerAdFingerprint.method
    val instructions = method.implementation?.instructions
        ?: throw PatchException("Util.getAdmobBannerAd() has no body.")

    val loadIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "loadAd"
    }
    if (loadIndex < 0) {
        throw PatchException("Util.getAdmobBannerAd() no longer calls loadAd().")
    }

    // The AdView is the first register of the call, the request the second; the
    // request is dead once the call is gone, so its register is free to borrow.
    val load = method.getInstruction<FiveRegisterInstruction>(loadIndex)
    val adView = load.registerC
    val scratch = load.registerD

    method.removeInstruction(loadIndex)
    method.addInstructions(
        loadIndex,
        """
            const/16 v$scratch, 0x8
            invoke-virtual { v$adView, v$scratch }, Landroid/view/View;->setVisibility(I)V
        """,
    )
}

/** Turns each method into a no-op at its first instruction. */
private fun app.morphe.patcher.patch.BytecodePatchContext.silence(vararg fingerprints: Fingerprint) {
    fingerprints.forEach { fingerprint ->
        fingerprint.method.addInstruction(0, "return-void")
    }
}

/**
 * Neither SDK is asked for an ad any more, so neither is started. Every call into
 * them goes, not just the one that starts them: `MobileAds.setAppMuted()` throws
 * `IllegalStateException` when `initialize()` has not run, which takes the whole
 * app down on launch, and it is called on the next line.
 *
 * Only the calls go. What was built to pass to them is left as dead code, which
 * is cheaper than working out what else those registers were for.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.dropAdSdkCalls() {
    val method = JpttApplicationOnCreateFingerprint.method
    val instructions = method.implementation?.instructions
        ?: throw PatchException("JpttApplication.onCreate() has no body.")

    val calls = instructions.withIndex().mapNotNull { (index, instruction) ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference != null && reference.definingClass in AD_SDK_CLASSES) index to reference else null
    }

    if (calls.isEmpty()) {
        throw PatchException(
            "JpttApplication.onCreate() calls neither ad SDK any more: " +
                AD_SDK_CLASSES.joinToString(),
        )
    }

    // Removing a call whose result is used would leave the register it filled
    // undefined, so say so rather than writing dex that will not verify.
    calls.firstOrNull { (_, reference) -> reference.returnType != "V" }?.let { (_, reference) ->
        throw PatchException(
            "${reference.definingClass}->${reference.name}() returns " +
                "${reference.returnType} rather than void, so its call cannot simply be dropped.",
        )
    }

    // Descending, so an earlier index is still correct after a removal.
    calls.map { it.first }.sortedDescending().forEach { index -> method.removeInstruction(index) }
}
