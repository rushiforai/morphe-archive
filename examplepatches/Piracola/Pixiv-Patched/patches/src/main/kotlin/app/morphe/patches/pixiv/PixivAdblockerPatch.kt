package app.morphe.patches.pixiv

import app.morphe.patches.pixiv.shared.PixivConstants
import app.morphe.patches.pixiv.shared.bannerBinderConstructorFingerprint
import app.morphe.patches.pixiv.shared.bannerShowFingerprint
import app.morphe.patches.pixiv.shared.interstitialLoadFingerprint

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val pixivAdblockerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Adblocker",
    description = "Removes the bottom banner frame on every screen, blocks AppLovin interstitials, " +
        "suppresses rate-this-app dialogs, and hides sponsored works in feeds and on the illustration detail screen.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        // --- Hook 1: collapse the bottom banner frame where it is built ---
        // The banner binder is the per-screen class that inflates the four overlay ad views into a
        // frame, sizes it to feature_advertisement_ad_frame_overlay_height (50dp) plus 8dp top and
        // bottom margins, and adds it to the screen's ad FrameLayout. Its class name is obfuscated,
        // so the fingerprint finds it by the ad view classes it builds. The frame has to be collapsed
        // at construction: the companion collector only toggles the four children between VISIBLE and
        // GONE, which would leave that 66dp opaque container behind.
        val bannerBinderCtor = bannerBinderConstructorFingerprint.method
        val ctorInstructions = bannerBinderCtor.implementation?.instructions
            ?: error("banner binder constructor has no body")
        val addFrameIndex = ctorInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference &&
                reference.definingClass == "Landroid/view/ViewGroup;" &&
                reference.name == "addView" &&
                reference.parameterTypes.size == 1
        }
        check(addFrameIndex >= 0) { "banner binder constructor: addView() call not found" }
        // The frame is added with a five-register call; anything else means the layout of that
        // constructor changed, and guessing a register would patch in a call that fails to verify.
        val addFrameCall = ctorInstructions[addFrameIndex] as? FiveRegisterInstruction
            ?: error("banner binder constructor: addView() call is not a five-register call")
        val frameRegister = registerName(bannerBinderCtor, addFrameCall.registerD)
        bannerBinderCtor.addInstructions(
            addFrameIndex + 1,
            "invoke-static {$frameRegister}, Lapp/morphe/extension/pixiv/adblock/AdblockHelper;->collapseOverlayFrame(Landroid/view/View;)V"
        )

        // --- Hook 2: never let the binder show the frame again ---
        // The show callback only sets the frame to VISIBLE. Returning early keeps it collapsed for
        // the whole screen lifetime; the hider callback stays untouched.
        val showFrameMethod = bannerShowFingerprint.method
        showFrameMethod.addInstructions(0, "return-void")

        // --- Hook 3: neutralize the overlay ad view constructors (secondary safeguard) ---
        // Hook 1 already removes the frame these views live in, but hiding them at construction also
        // covers a future screen that builds one of them outside that container.
        val bannerOverlayClasses = listOf(
            "Ljp/pxv/android/feature/advertisement/view/OverlayAppLovinView;",
            "Ljp/pxv/android/feature/advertisement/view/OverlayADGAutoRotationView;",
            "Ljp/pxv/android/feature/advertisement/view/OverlayAdgTamView;",
            "Ljp/pxv/android/feature/advertisement/view/YufulightOverlayAdView;"
        )

        for (overlayClassName in bannerOverlayClasses) {
            val overlayClass = mutableClassDefByOrNull(overlayClassName) ?: continue
            val constructors = overlayClass.methods.filter { it.name == "<init>" }
            for (ctor in constructors) {
                val instructions = ctor.implementation?.instructions
                val superInitIndex = instructions?.indexOfFirst {
                    it is ReferenceInstruction &&
                        (it.reference as? MethodReference)?.name == "<init>"
                } ?: -1

                val insertIndex = if (superInitIndex != -1) superInitIndex + 1 else 1
                ctor.addInstructions(
                    insertIndex,
                    "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/adblock/AdblockHelper;->hideBanner(Landroid/view/View;)V"
                )
            }
        }

        // --- Hook 4: AppLovin interstitial load -> return early ---
        // The interstitial manager builds the MaxInterstitialAd, registers the listener, publishes
        // the ready state and calls loadAd(). Returning before that means no interstitial exists, so
        // none can be displayed later either. The fingerprint requires creating the ad object *and*
        // calling loadAd in the same method, so the onAdLoaded(MaxAd) callback cannot match it.
        val interstitialLoadMethod = interstitialLoadFingerprint.method
        interstitialLoadMethod.addInstructions(0, "return-void")

        // --- Hook 5: hide sponsored works and promotional cards in feeds and detail screen ---
        // RectangleAdViewHolder.show() is a bare return-void stub, so it is not listed here; injecting
        // into it would only append dead instructions after that return.
        val sponsoredClasses = listOf(
            "Ljp/pxv/android/feature/commonlist/recyclerview/baserecycler/SelfServeItemViewHolder;",
            "Ljp/pxv/android/feature/illustviewer/detail/IllustDetailAdvertisementSolidItem;"
        )

        for (cardClassName in sponsoredClasses) {
            val cardClass = mutableClassDefByOrNull(cardClassName) ?: continue
            val showMethod = cardClass.methods.firstOrNull { it.name == "show" } ?: continue
            showMethod.addInstructions(
                0,
                """
                invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/adblock/AdblockHelper;->hideSponsoredItem(Ljava/lang/Object;)V
                return-void
                """.trimIndent()
            )
        }
    }
}

/** Formats an absolute dex register the way smali spells it: N for locals, pN for parameters. */
private fun registerName(method: Method, absolute: Int): String {
    val implementation = method.implementation ?: return "v$absolute"
    val parameterRegisters =
        method.parameterTypes.size + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val firstParameter = implementation.registerCount - parameterRegisters
    return if (absolute >= firstParameter) "p${absolute - firstParameter}" else "v$absolute"
}