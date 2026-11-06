package app.morphe.patches.pixiv

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val pixivAdblockerPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Adblocker",
    description = "Eliminates bottom advertising banners and interstitials across all screens without layout padding, suppresses rate-this-app dialogs, and hides sponsored works in feeds.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)
    extendWith("extensions/pixiv.mpe")

    execute {
        // --- Hook 1: collapse the bottom banner frame where it is built ---
        // Lbz6; is the per-screen banner binder used by the illustration detail, fullscreen and
        // novel text screens. Its constructor instantiates the Lvy6; FrameLayout, inflates the four
        // overlay ad views into it, sizes it to feature_advertisement_ad_frame_overlay_height (50dp)
        // plus 8dp top/bottom margins, and adds it to the screen's ad FrameLayout.
        // Lty6; - the state flow collector - only switches the four children between VISIBLE and GONE
        // on every emission, so hiding the children alone leaves that 66dp opaque container behind.
        val bannerBinderClass = mutableClassDefBy("Lbz6;")
        val bannerBinderCtor = bannerBinderClass.methods.firstOrNull { it.name == "<init>" }
            ?: error("Lbz6;: banner frame constructor not found")

        // v2 holds the Lvy6; frame at this call: iput-object v2, p0, Lbz6;->c then addView(p2, v2).
        val ctorInstructions = bannerBinderCtor.implementation?.instructions
            ?: error("Lbz6;: banner frame constructor has no body")
        val addFrameIndex = ctorInstructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference &&
                reference.definingClass == "Landroid/view/ViewGroup;" &&
                reference.name == "addView" &&
                reference.parameterTypes.size == 1
        }
        check(addFrameIndex >= 0) { "Lbz6;.<init>: banner frame addView() call not found" }
        bannerBinderCtor.addInstructions(
            addFrameIndex + 1,
            "invoke-static {v2}, Lapp/morphe/extension/pixiv/adblock/AdblockHelper;->collapseOverlayFrame(Landroid/view/View;)V"
        )

        // --- Hook 2: never let the binder show the frame again ---
        // d() is the "show banner frame" callback invoked by the pager ad controllers (pb0, rl6, s81):
        // it only sets the Lvy6; container to VISIBLE. The companion a() hides it, so returning early
        // here keeps the frame collapsed for the whole screen lifetime.
        val showFrameMethod = bannerBinderClass.methods.firstOrNull {
            it.name == "d" && it.returnType == "V" && it.parameterTypes.isEmpty()
        } ?: error("Lbz6;: d() not found")
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
        // Liw; is the MaxInterstitialAd container and listener. a(Lel1;)V is its load entry point:
        // it creates the MaxInterstitialAd, registers the listener, publishes the ready state and
        // calls loadAd(). Returning before that line means no interstitial exists, so none can be
        // displayed later either.
        // The method name is part of the match on purpose: onAdLoaded(MaxAd) also returns void, takes
        // one argument and calls MaxInterstitialAd.isReady(), so the old matcher could hit it instead.
        val interstitialManagerClass = mutableClassDefBy("Liw;")
        val interstitialLoadMethod = interstitialManagerClass.methods.firstOrNull { method ->
            method.name == "a" &&
                method.returnType == "V" &&
                method.parameterTypes.size == 1 &&
                method.implementation?.instructions?.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    reference is MethodReference &&
                        reference.definingClass == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" &&
                        reference.name == "isReady"
                } == true
        } ?: error("Liw;: AppLovin interstitial load entry a(Lel1;)V not found")
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
