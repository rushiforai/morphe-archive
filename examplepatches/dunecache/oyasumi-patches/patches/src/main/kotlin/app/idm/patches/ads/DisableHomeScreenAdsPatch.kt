package app.idm.patches.ads

import app.idm.patches.shared.Constants.COMPATIBILITY_1DM
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/**
 * `BannerView.setAd` holds `this` in `v5` and its two arguments in `v6` and `v7`, so
 * `v0` is an int scratch local that is only ever read after the method has returned.
 * `const/4` cannot encode `View.GONE` (8), so the constant is written with `const/16`,
 * the same width the app itself uses to load it.
 */
private const val VISIBILITY_REGISTER = "v0"

private const val GONE = "0x8"

@Suppress("unused")
val disableHomeScreenAdsPatch = bytecodePatch(
    name = "Disable home screen ads",
    description = "Keep 1DM's home screen banner from loading, rotating, or rendering.",
    default = true
) {
    compatibleWith(COMPATIBILITY_1DM)

    execute {
        // The app already has a no-ads state: `BrowserApp` calls `disable()` instead of
        // `load()` when the ad configuration says the banner is off, and `disable()` sets
        // `mDisabled`, empties `bannerInfoList`, drops the current ad, and cancels the
        // rotation timer. `load()` is redirected to that same state, so the banner is
        // never populated and `resume()` never starts the timer, while every other entry
        // point keeps working normally. The receiver register is read from the
        // `monitor-enter` that opens the method rather than hardcoded, because the method
        // is `synchronized` and the inserted call runs before the lock is taken.
        //
        // The braces around the register are mandatory, and so is the register's `v`
        // prefix: smali's grammar requires
        // `OPEN_BRACE register_list CLOSE_BRACE` for a 35c invoke, and a register list
        // holds register names, not bare numbers. So this renders `{v1}` and not `{1}`.
        // `addInstructions` builds the dummy method from the matched method's own
        // parameters and register count, so the register numbers written here are the
        // ones the target method already uses.
        BannerManagerLoadFingerprint.let { fingerprint ->
            val entry = fingerprint.instructionMatches[0]
            val receiver = entry.getInstruction<OneRegisterInstruction>().getRegisterA()

            fingerprint.method.addInstructions(
                0,
                "invoke-virtual {v$receiver}, Lacr/browser/lightning/view/BannerManager;->disable()V\n" +
                    "return-void"
            )
        }

        // `setAd` is the only renderer for the banner: it is called once from
        // `onFinishInflate()` and once per bus event that `postAd()` publishes, and the
        // app's own "a network ad is on screen" branch is exactly this call with `GONE`.
        // Replacing the body with that call also covers a banner event that arrives from
        // a path outside the banner manager.
        BannerViewSetAdFingerprint.let { fingerprint ->
            // A 22c field read names its registers A (destination) and B (object), and
            // the object here is the view itself.
            val firstFieldRead = fingerprint.instructionMatches[0]
            val receiver = firstFieldRead.getInstruction<TwoRegisterInstruction>().getRegisterB()

            fingerprint.method.addInstructions(
                0,
                "const/16 $VISIBILITY_REGISTER, $GONE\n" +
                    "invoke-virtual {v$receiver}, Landroid/view/View;->setVisibility(I)V\n" +
                    "return-void"
            )
        }
    }
}
