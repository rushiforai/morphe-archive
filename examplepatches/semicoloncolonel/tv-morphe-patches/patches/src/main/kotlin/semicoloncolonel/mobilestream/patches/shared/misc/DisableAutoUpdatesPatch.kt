/*
 * Ported from ajstrick81's "Disable auto-updates" Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/pluto/misc/security
 * ALL CREDIT FOR THE APPROACH GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants as AppleTv
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch

// There is no manifest switch for Play Store auto-updates: the Store pushes an
// update whenever its listed versionCode is higher than the installed one. So
// this raises the patched app's versionCode far past the real one, and the
// Store treats it as already up to date. It does not stop the user from
// updating on purpose by patching a newer APK.
//
// Side effect: Android refuses to install a lower versionCode over a higher
// one, so a later re-patch of a newer version without this patch needs the
// app uninstalled first. With this patch on again, the bumped value is still
// higher, so updates install over it normally.
private const val VERSION_BUMP = 10_000_000L

@Suppress("unused")
val disableAutoUpdatesPatch = resourcePatch(
    name = "Disable auto-updates",
    description = "Stops the Play Store from replacing the patched app with the official version.",
    default = false,
) {
    compatibleWith(
        Tubi.COMPATIBILITY,
        Disney.COMPATIBILITY,
        Pluto.COMPATIBILITY,
        HboMax.COMPATIBILITY,
        HboMax.STREAM_COMPATIBILITY,
        Peacock.COMPATIBILITY,
        Mgm.COMPATIBILITY,
        FoxOne.COMPATIBILITY,
        Starz.COMPATIBILITY,
        Pbs.COMPATIBILITY,
        Espn.COMPATIBILITY,
        Nfl.COMPATIBILITY,
        Nba.COMPATIBILITY,
        JustWatch.COMPATIBILITY,
        Mlb.COMPATIBILITY,
        NewsNation.COMPATIBILITY,
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0)
            val versionCode = manifest.attributes.getNamedItem("android:versionCode")
                ?: return@use
            versionCode.nodeValue = (versionCode.nodeValue.toLong() + VERSION_BUMP)
                .coerceAtMost(Int.MAX_VALUE.toLong())
                .toString()
        }
    }
}
