package app.template.patches.textnow.trackers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY

import app.template.patches.shared.requireProgress
import app.template.patches.shared.returnVoid

/**
 * TextNow 26.45.0.0's attribution stack is **AppsFlyer**. (The 6.1.0.1 stack — Adjust +
 * Flurry — no longer exists in this build.)
 *
 * Chokepoint: `com.appsflyer.internal.AFa1tSDK` is the concrete `AppsFlyerLib`
 * implementation. `AppsFlyerLib` declares `start()` / `start(AppsFlyerRequestListener)`
 * as the abstract entry points, and TextNow drives the SDK through exactly
 * `AppsFlyerLib.start()` (verified: the app's only AppsFlyer caller,
 * `…attribution.AppsFlyerAttributionProvider`, invokes `AppsFlyerLib;->start()V`).
 *
 * So no-op'ing `AFa1tSDK`'s **void** entry points stops the SDK from ever starting and
 * from receiving events, for every caller:
 *
 *     start()V
 *     start(AppsFlyerRequestListener)V
 *     logEvent(Context, String, Map)V
 *     logEvent(Context, String, Map, AppsFlyerRequestListener)V
 *
 * NOTE: the suspend functions in the app's own provider (`start`/`setUser`) are
 * deliberately **not** rewritten. A suspend no-op must return a `Unit` value, and the
 * reference to `kotlin.Unit.INSTANCE` is not safe in a shrunk app — TextNow's R8 pass
 * removes that field (it is unread), so an injected `sget-object …Lkotlin/Unit;->INSTANCE`
 * crashes with `NoSuchFieldError` at runtime (verified on device). Neutralising the void
 * SDK entry points avoids the whole class of problem.
 *
 * Facebook app-events and Firebase measurement are handled at the manifest layer by
 * [textnowDisableTrackerComponentsPatch].
 */
private const val SDK_IMPL = "Lcom/appsflyer/internal/AFa1tSDK;"

@Suppress("unused")
val textnowDisableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "No-ops AppsFlyer's implementation entry points (start, logEvent) so the " +
        "attribution SDK never starts and no attribution or analytics event is sent.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        val sdk = mutableClassDefBy(SDK_IMPL)
        var matched = 0
        var noOped = 0
        sdk.methods
            .filter { (it.name == "start" || it.name == "logEvent") && it.returnType == "V" }
            .forEach { m ->
                matched++
                m.returnVoid()
                noOped++
            }
        requireProgress(matched, noOped, "AppsFlyer AFa1tSDK start()/logEvent()")
    }
}
