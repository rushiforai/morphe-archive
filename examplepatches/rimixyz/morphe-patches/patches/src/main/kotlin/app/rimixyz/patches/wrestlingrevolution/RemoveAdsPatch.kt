package app.rimixyz.patches.wrestlingrevolution

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_WRESTLINGREVOLUTION

private const val BRIDGE = "Lcom/AdobeAir/Yodo1Mas/Yodo1MasBridge;"

private const val RETURN_VOID = "return-void"
private const val RETURN_TRUE = "const/4 v0, 0x1\nreturn v0"

/**
 * Dispatches one event through the bridge's private dispatchEvent().
 *
 * The injected code lives inside Yodo1MasBridge itself, so invoke-direct is
 * legal even though dispatchEvent is private. v0/v1 are local registers in
 * every method we patch (verified against the 2.150.64 DEX).
 */
private fun dispatch(event: String): String =
    """
        const-string v0, "$event"
        const-string v1, ""
        invoke-direct { p0, v0, v1 }, $BRIDGE->dispatchEvent(Ljava/lang/String;Ljava/lang/String;)V
    """.trimIndent()

/** Simulates the "loaded" callback so ActionScript considers the ad ready. */
private fun fakeLoad(event: String): String = "${dispatch(event)}\n$RETURN_VOID"

/**
 * Simulates the full show lifecycle. The bridge listeners reload ads on
 * "closed", but those listeners are never registered because handleInitSuccess
 * returns before setupXListeners(), and the ActionScript only reacts to the
 * events we dispatch here.
 */
private fun fakeShow(opened: String, closed: String, earned: String? = null): String = buildString {
    appendLine(dispatch(opened))
    if (earned != null) {
        appendLine(dispatch(earned))
    }
    appendLine(dispatch(closed))
    append(RETURN_VOID)
}

/**
 * Removes Yodo1 MAS ads by short-circuiting the ANE bridge.
 *
 * - handleInitSuccess() is stopped before it preloads app-open/rewarded/
 *   interstitial through the real SDK.
 * - load and show methods dispatch the same events the real SDK would, so the
 *   ActionScript state machine keeps working without any ad being requested.
 * - is*Loaded() returns true so the game does not loop trying to prepare ads.
 *
 * Banners are fully suppressed (no view is ever created). The rewarded flow
 * intentionally dispatches onRewardedAdEarned so gameplay rewards are not
 * lost.
 */
@Suppress("unused")
val removeAdsPatch = patch(
    name = "Remove ads",
    description = "Suppresses Yodo1 MAS banners, interstitials, rewarded videos and app-open ads, including the preloads done at SDK init. Rewarded flows still grant their in-game reward.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WRESTLINGREVOLUTION)

    execute {
        // 1. Do not preload any format at SDK init.
        runCatching {
            Yodo1HandleInitSuccessFingerprint.method.addInstructions(
                0,
                """
                    ${dispatch("onSdkInitSuccess")}
                    $RETURN_VOID
                """.trimIndent(),
            )
        }.onFailure {
            println("Remove ads: handleInitSuccess not patched (${it.message})")
        }

        // 2. Interstitial.
        runCatching {
            Yodo1LoadInterstitialFingerprint.method.addInstructions(
                0,
                fakeLoad("onInterstitialAdLoaded"),
            )
            Yodo1ShowInterstitialFingerprint.method.addInstructions(
                0,
                fakeShow("onInterstitialAdOpened", "onInterstitialAdClosed"),
            )
            Yodo1IsInterstitialLoadedFingerprint.method.addInstructions(0, RETURN_TRUE)
        }.onFailure {
            println("Remove ads: interstitial not patched (${it.message})")
        }

        // 3. Rewarded video (reward is granted without watching).
        runCatching {
            Yodo1LoadRewardedFingerprint.method.addInstructions(
                0,
                fakeLoad("onRewardedAdLoaded"),
            )
            Yodo1ShowRewardedFingerprint.method.addInstructions(
                0,
                fakeShow("onRewardedAdOpened", "onRewardedAdClosed", "onRewardedAdEarned"),
            )
            Yodo1IsRewardedLoadedFingerprint.method.addInstructions(0, RETURN_TRUE)
        }.onFailure {
            println("Remove ads: rewarded not patched (${it.message})")
        }

        // 4. App-open.
        runCatching {
            Yodo1LoadAppOpenFingerprint.method.addInstructions(
                0,
                fakeLoad("onAppOpenAdLoaded"),
            )
            Yodo1ShowAppOpenFingerprint.method.addInstructions(
                0,
                fakeShow("onAppOpenAdOpened", "onAppOpenAdClosed"),
            )
            Yodo1IsAppOpenLoadedFingerprint.method.addInstructions(0, RETURN_TRUE)
        }.onFailure {
            println("Remove ads: app-open not patched (${it.message})")
        }

        // 5. Banners: never create/show a view. Report "loaded" so the game
        //    does not retry forever.
        runCatching {
            Yodo1LoadBannerFingerprint.method.addInstructions(0, RETURN_VOID)
            Yodo1ShowBannerFingerprint.method.addInstructions(0, RETURN_VOID)
            Yodo1HideBannerFingerprint.method.addInstructions(0, RETURN_VOID)
            Yodo1DestroyBannerFingerprint.method.addInstructions(0, RETURN_VOID)
            Yodo1IsBannerLoadedFingerprint.method.addInstructions(0, RETURN_TRUE)
        }.onFailure {
            println("Remove ads: banner not patched (${it.message})")
        }
    }
}
