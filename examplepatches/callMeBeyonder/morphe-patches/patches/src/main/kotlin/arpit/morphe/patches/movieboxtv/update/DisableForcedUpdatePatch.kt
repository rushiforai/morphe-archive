package arpit.morphe.patches.movieboxtv.update

import app.morphe.patcher.patch.bytecodePatch
import arpit.morphe.patches.movieboxtv.premium.ForceUpdateFingerprint
import arpit.morphe.patches.movieboxtv.premium.HasUpdateFingerprint
import arpit.morphe.patches.movieboxtv.shared.Constants.COMPATIBILITY_MOVIEBOX_TV
import app.morphe.patcher.util.returnEarly

/**
 * Removes the update gate of `com.transsion.version.update.RemoteVersionInfo`.
 *
 * `getForceUpdate()` opens the non-dismissible "update required" dialog, `getHasUpdate()` the
 * prompt on launch; both read plain fields of the version-check response, so answering `false`
 * keeps the installed build running without touching the version endpoint.
 */
@Suppress("unused")
val disableForcedUpdatePatch = bytecodePatch(
    name = "Disable forced update",
    description = "Hides the blocking update dialog and the update prompt.",
) {
    compatibleWith(COMPATIBILITY_MOVIEBOX_TV)

    execute {
        ForceUpdateFingerprint.method.returnEarly(false)
        HasUpdateFingerprint.method.returnEarly(false)
    }
}
