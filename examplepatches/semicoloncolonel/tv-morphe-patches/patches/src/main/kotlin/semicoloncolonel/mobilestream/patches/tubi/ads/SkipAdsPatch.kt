/*
 * Ported from ajstrick81's Tubi Android TV patch:
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.tubi.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.shared.misc.disableAutoUpdatesPatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// Port of the TV "Skip ads" patch to the phone app. Dropped from the TV
// patch: the legacy ImagePauseAds.n hook (that method no longer exists; its
// work moved into suspend functions) and the two SPA WebView hooks (the phone
// UI is native and never loads ott-androidtv.tubitv.com).
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the ads in videos, including ad breaks and image pause ads.",
) {
    category("Ads")
    compatibleWith(Constants.COMPATIBILITY)

    // A Play Store update would replace the patched app and bring the ads
    // back, so Tubi always gets the auto-update block with this patch.
    dependsOn(disableAutoUpdatesPatch)

    execute {

        // Hooks 1-3 — Fox IMA SDK, identical to the TV build.
        FoxImaAdEventListenerFingerprint.method.addInstructions(0, "return-void")
        FoxImaAdsLoadedListenerFingerprint.method.addInstructions(0, "return-void")
        FoxPlayerClearVodAdsFingerprint.method.addInstructions(0, "return-void")

        // Hooks 4-5 — fail the VOD and live DAI stream requests through their
        // own onFailure callbacks, as the TV patch does.
        FoxImaVodStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface {p3, v0}, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamUrlCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """
        )
        FoxImaLiveStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface {p3, v0}, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamIdCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """
        )

        // Hook 6 — Rainmaker ad-break fetch. Same approach as the TV patch:
        // return an immediate error result instead of suspending, so the
        // coroutine completes and the caller takes its existing error branch.
        // The callers test only the wrapper's success subtype; anything else
        // is treated as "no ad breaks". The error result is the wrapper's
        // generic error subtype, the one built from a Throwable. R8 renames the
        // wrapper in every release (10.42.0: u9d, 10.43.1: p9d, 10.44.1: l8d),
        // so it is found here rather than named: the fetch method itself tests
        // its result with instance-of against the wrapper's subtypes, and only
        // the generic error subtype has a (Throwable) constructor.
        val getAdBreaks = PhoneGetAdBreaksFingerprint.method
        val errorResult = getAdBreaks.implementation!!.instructions
            .filter { it.opcode == Opcode.INSTANCE_OF }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
            .distinct()
            .firstOrNull { type ->
                classDefByOrNull(type)?.methods?.any { method ->
                    method.name == "<init>" &&
                        method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Throwable;")
                } == true
            } ?: throw PatchException("Ad-break error result type not found")

        getAdBreaks.addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                const-string v1, "ads_blocked"
                invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                new-instance v1, $errorResult
                invoke-direct {v1, v0}, $errorResult-><init>(Ljava/lang/Throwable;)V
                return-object v1
            """
        )

        // Hooks 7-8 — both places that post the pause-ad bitmap to the
        // LiveData PauseAdsView observes. Skipping them means the view is
        // never raised, for one-shot and rotating pause ads alike.
        PhonePauseAdCallbackFingerprint.method.addInstructions(0, "return-void")
        PhonePauseAdRotationFingerprint.method.addInstructions(0, "return-void")
    }
}
