package app.anghami.patches.system

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceVoid
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Silences the in-app store-rating request.
 *
 * The app's rating helper decides on its own whether the "Love us? Rate us!"
 * dialog and the review sheet should be shown. Three of its entry points are
 * forced into a harmless answer so no prompt is ever raised:
 *
 * - the visibility query always reports that the dialog should not be shown,
 * - the launch hook becomes a no-op,
 * - the user-event hook becomes a no-op as well.
 *
 * Nothing else about the rating helper is altered, so any unrelated bookkeeping
 * it performs elsewhere is left untouched.
 */
@Suppress("unused")
val ratingPromptBlockPatch = bytecodePatch(
    name = "Disable In-App Rating",
    description = "Disables the in-app review dialogs and 'Love us? Rate us!' rating prompts.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        AppRaterShouldShowDialogSignature.method.forceFalse()
        AppRaterUpdateOnLaunchSignature.method.forceVoid()
        AppRaterOnUserEventSignature.method.forceVoid()
    }
}

/** `AppRater.getShouldShowDialog()` — decides whether the rating dialog is due. */
object AppRaterShouldShowDialogSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/rating/AppRater;",
    name = "getShouldShowDialog",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN),
    )
)

/** `AppRater.updateOnLaunch()` — per-launch bookkeeping feeding the rating prompt. */
object AppRaterUpdateOnLaunchSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/rating/AppRater;",
    name = "updateOnLaunch",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

/** `AppRater.onUserEvent(Events)` — per-event bookkeeping feeding the rating prompt. */
object AppRaterOnUserEventSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/rating/AppRater;",
    name = "onUserEvent",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/rating/AppRater\$Events;"),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)
