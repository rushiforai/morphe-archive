package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Interruptive-promo targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Remove popup promos" patch:
 * - `popupwindow/x.i(a)` is the single funnel for all 4 in-house popup
 *   types (a$a-a$d `instance-of` chain); 6 call sites (MainActivity[$w],
 *   app/base/j[j$c]). Google SDK ads (AdMob/DFP classes) are untouched.
 * - `dialog/k.onNext` shows the fullscreen startup carousel
 *   ("Pay with mobile line" / "Get offer", layout dialog_screen_carousel).
 *   k is instantiated in exactly one place (dialog/g.c:814); no-op'ing
 *   onNext kills only the promo path, not the generic dialog builder g.
 * - `popupwindow/z.onAdLoaded` is the flyer/ad-callback entry.
 */

object PopupShowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/x;",
    name = "i",
    // NOTE: no accessFlags — 8.0.28 declares this `public final`; exact-int
    // flag matching is brittle. Class + name + signature already pin it.
    returnType = "V",
    parameters = listOf("Lcom/anghami/ui/popupwindow/a;"),
    filters = listOf(
        string("adType"),
    )
)

object FullscreenDialogFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/dialog/k;",
    name = "onNext",
    // NOTE: no accessFlags — 8.0.28 declares this `public final`.
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("FullScreenDialog:"),
    )
)

object FlyerOnAdLoadedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/z;",
    name = "onAdLoaded",
    // NOTE: no accessFlags — 8.0.28 declares this `public final` and exact-int
    // flag matching rejects unlisted flags. Class + name + signature are unique.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.CONST),
        opcode(Opcode.RETURN_VOID),
    )
)
