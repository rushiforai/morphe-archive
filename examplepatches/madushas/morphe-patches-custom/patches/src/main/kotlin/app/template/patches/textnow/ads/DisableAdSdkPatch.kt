package app.template.patches.textnow.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import app.template.patches.shared.requireProgress
import app.template.patches.shared.returnFalseSuspend

/**
 * TextNow 26.45.0.0 initialises **every partner ad SDK through one strategy list**:
 * `com.enflick.android.ads.utils.GAMInitializer.INITIALIZERS` holds seven objects —
 *
 *     GAMInitializer$Amazon          (Amazon APS / DTB)
 *     GAMInitializer$FacebookPreInit (Facebook Audience Network + app-events)
 *     GAMInitializer$FyberPreInit    (DT Exchange / Fyber)
 *     GAMInitializer$InMobiPreInit   (InMobi)
 *     GAMInitializer$NimbusInit      (Nimbus)
 *     GAMInitializer$LiveRampAts     (LiveRamp — identity)
 *     GAMInitializer$TradeDeskUID    (The Trade Desk — identity)
 *
 * The orchestrator asks each object `isEnabled(Context, AdsSDKConfigInterface, Continuation)`
 * and only calls `setup(…)` when it returns true. Forcing **`isEnabled` → false** on all
 * seven therefore disables the whole ad stack at its own gate — the same gate the app
 * itself uses for remote-config switches — without touching the shared strategy list.
 *
 * `isEnabled` is a Kotlin suspend fun (erased `(…)Ljava/lang/Object;`) returning Boolean,
 * so the completion value must be a boxed `Boolean`. See [returnFalseSuspend]: this is
 * safe, whereas returning `kotlin.Unit.INSTANCE` is not (R8 strips it — verified on device).
 *
 * Google Mobile Ads itself is never configured in this build (no `gms.ads.APPLICATION_ID`
 * meta-data), so AdMob cannot initialise regardless.
 */
private const val INITIALIZER_PREFIX = "Lcom/enflick/android/ads/utils/GAMInitializer$"

@Suppress("unused")
val textnowDisableAdSdkPatch = bytecodePatch(
    name = "Disable ad SDK",
    description = "Disables every partner ad-SDK initializer TextNow runs (Facebook " +
        "Audience Network, Amazon, Fyber/DT Exchange, InMobi, Nimbus, LiveRamp, The Trade " +
        "Desk) at its own isEnabled() gate, so no ad SDK ever initialises.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        var classes = 0
        var gated = 0
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(INITIALIZER_PREFIX)) return@classDefForEach
            classes++
            val mutable = mutableClassDefBy(classDef)
            mutable.methods
                .filter { it.name == "isEnabled" && it.returnType == "Ljava/lang/Object;" }
                .forEach { isEnabled ->
                    isEnabled.returnFalseSuspend()
                    gated++
                }
        }
        if (classes == 0) {
            throw PatchException(
                "TextNow ad SDK: no GAMInitializer$* classes found — the initializer strategy " +
                    "moved. Re-audit com.enflick.android.ads.utils.GAMInitializer.",
            )
        }
        requireProgress(classes, gated, "TextNow partner ad-SDK isEnabled() gates")
    }
}
