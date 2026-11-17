package dev.hyzor.patches.sparkle.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import dev.hyzor.patches.sparkle.shared.Constants.MAIN_ACTIVITY

/**
 * The central capability gatekeeper: `static boolean (Context, int sync, int required,
 * String prompt)`.
 *
 * Every Plus gate in the app funnels through it (49 call sites in 37 classes in 2.4.0). Its body
 * is `if ((sync & required) == required) return true`, followed by a switch that only picks the
 * purchase-prompt string for the matching flag — so returning `true` at method entry opens all
 * of them, whatever the flag bits are.
 *
 * In 2.3.1 this lived in `ph.b0`; in 2.4.0 it moved to `kh.x`. The class name is obfuscated and
 * will move again, so it is found by shape: the signature alone is unique in the APK, and the
 * `and-int` is there to keep it that way. `kh.x.H(Context)Z` (the device check) has a different
 * signature and is matched separately.
 */
internal object GatekeeperFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "I", "I", "Ljava/lang/String;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { it.opcode == Opcode.AND_INT_2ADDR } == true
    },
)

/**
 * `static boolean (Context)` — `MainActivity.onStart` shows `IncompatibleDeviceActivity` and
 * `finish()`es when this returns false.
 *
 * True when the device reports TV UI mode (or DPAD navigation), or when the
 * `allow_incompatible` preference is set. On a real TV it already returns true; the bypass only
 * matters on emulators and non-TV hardware, and is optional for that reason.
 */
internal object DeviceCheckFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("allow_incompatible", "uimode"),
)

/**
 * `MainActivity.K(int)` — the sync-mask distributor.
 *
 * The billing wrapper (`lh/f`) computes the mask with `LibUtils.h(context, purchases)` and hands
 * it to `MainActivity$…u0(mask, purchases)`, which calls this method. It puts the value into the
 * intent extra `sync_internal`, into every fragment bundle it builds, and into the
 * `TaskReceiver` broadcast — and all of that is what the fragments and the gatekeeper read.
 *
 * 2.3.1 called this `H(int)`; 2.4.0 renamed it and reused `H()` for a navigation helper, so the
 * method is pinned by the one `sync_internal` literal in `MainActivity` rather than by name.
 * (It is also the only `(I)V` method in the class.)
 */
internal object SyncMaskFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("sync_internal"),
)

/**
 * `MainActivity.onCreate(Bundle)` — seeds `startup_time` before the background anti-tamper
 * checks read it. The method has a 7-register frame, so the four injected registers are safe.
 */
internal object OnCreateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * `se.hedekonsult.utils.LibUtils` — found by the `libutilsJNI` literal in its constructor, which
 * is the only class in the APK that loads that library. The class itself is not obfuscated, but
 * anchoring on the string survives a package move; the individual methods are picked by their
 * JNI-pinned names in the patch.
 */
internal object LibUtilsFingerprint : Fingerprint(
    strings = listOf("libutilsJNI"),
    custom = { method, _ -> method.name == "<init>" },
)
