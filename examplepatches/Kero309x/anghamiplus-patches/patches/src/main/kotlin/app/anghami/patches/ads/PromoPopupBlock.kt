package app.anghami.patches.ads

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceVoid
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Suppresses the promotional popups the app raises on its own behalf.
 *
 * Three entry points are turned into empty methods, which leaves the whole
 * campaign pipeline reachable but inert:
 *
 * - the single dispatcher behind every popup kind is cut off before it can
 *   display anything,
 * - the fullscreen startup dialog flow is stopped at its advance step, so the
 *   carousel never gets built or shown,
 * - the flyer ad load callback simply returns, so a loaded flyer is never
 *   presented.
 *
 * Only the in-house promotional surfaces are affected; third-party ad SDK
 * behaviour is left untouched.
 */
@Suppress("unused")
val promoPopupBlockPatch = bytecodePatch(
    name = "Block Promotional Popups",
    description = "Blocks startup popup offers, promotional flyers, and marketing dialogs.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        PopupShowSignature.method.forceVoid()
        FullscreenDialogSignature.method.forceVoid()
        FlyerOnAdLoadedSignature.method.forceVoid()
    }
}

/** Common display path of the in-house popup window types. */
object PopupShowSignature : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/x;",
    name = "i",
    returnType = "V",
    parameters = listOf("Lcom/anghami/ui/popupwindow/a;"),
    filters = listOf(
        string("adType"),
    )
)

/** Advance step of the fullscreen startup dialog. */
object FullscreenDialogSignature : Fingerprint(
    definingClass = "Lcom/anghami/ui/dialog/k;",
    name = "onNext",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("FullScreenDialog:"),
    )
)

/** Callback fired once a promotional flyer has finished loading. */
object FlyerOnAdLoadedSignature : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/z;",
    name = "onAdLoaded",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.CONST),
        opcode(Opcode.RETURN_VOID),
    )
)
