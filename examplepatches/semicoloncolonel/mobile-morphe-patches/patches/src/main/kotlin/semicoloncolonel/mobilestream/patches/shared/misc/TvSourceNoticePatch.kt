package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants as AppleTv
import semicoloncolonel.mobilestream.patches.disney.shared.Constants as Disney
import semicoloncolonel.mobilestream.patches.espn.shared.Constants as Espn
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants as FoxOne
import semicoloncolonel.mobilestream.patches.hbomax.shared.Constants as HboMax
import semicoloncolonel.mobilestream.patches.hulutv.shared.Constants as HuluTv
import semicoloncolonel.mobilestream.patches.justwatch.shared.Constants as JustWatch
import semicoloncolonel.mobilestream.patches.mgm.shared.Constants as Mgm
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants as Mlb
import semicoloncolonel.mobilestream.patches.nba.shared.Constants as Nba
import semicoloncolonel.mobilestream.patches.newsnation.shared.Constants as NewsNation
import semicoloncolonel.mobilestream.patches.nfl.shared.Constants as Nfl
import semicoloncolonel.mobilestream.patches.pbs.shared.Constants as Pbs
import semicoloncolonel.mobilestream.patches.peacock.shared.Constants as Peacock
import semicoloncolonel.mobilestream.patches.plex.shared.Constants as Plex
import semicoloncolonel.mobilestream.patches.pluto.shared.Constants as Pluto
import semicoloncolonel.mobilestream.patches.primevideotv.shared.Constants as PrimeVideoTv
import semicoloncolonel.mobilestream.patches.starz.shared.Constants as Starz
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants as Tubi
import semicoloncolonel.mobilestream.patches.yttvshell.shared.Constants as YouTubeTv

// ─────────────────────────────────────────────────────────────────────────────
// Android TV source notice. In the combined bundle only (-Pflavor=all); the
// phone and tv flavors leave this file out in patches/build.gradle.kts.
//
// From 1.2.0 the phone source drops the Android TV apps, and they are released
// only from tv-morphe-patches. This adds the extension's TvSourceNotice to the
// manifest as a provider, so it starts with the app without a hook in the
// app's own code. On a TV it shows a dialog that says where future Android TV
// patches come from, until the viewer confirms it. On a phone it does nothing,
// so it is safe for apps whose phone and Android TV builds share a package.
//
// The list is the apps the TV bundle carries (tvBundleApps in
// patches/build.gradle.kts). Where an app has a separate Android TV entry, only
// that entry is listed.
// ─────────────────────────────────────────────────────────────────────────────

private const val NOTICE = "semicoloncolonel.mobilestream.extension.shared.misc.TvSourceNotice"

private val tvSourceNoticeManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            val providers = application.getElementsByTagName("provider")
            val present = (0 until providers.length).any {
                (providers.item(it) as Element).getAttribute("android:name") == NOTICE
            }
            if (!present) {
                val provider = document.createElement("provider")
                provider.setAttribute("android:name", NOTICE)
                provider.setAttribute("android:authorities", "${manifest.getAttribute("package")}.msp.tvsourcenotice")
                provider.setAttribute("android:exported", "false")
                application.appendChild(provider)
            }
        }
    }
}

@Suppress("unused")
val tvSourceNoticePatch = bytecodePatch(
    name = "Android TV source notice",
    description = "On Android TV, shows a one-time message that future Android TV patches come from " +
        "the tv-morphe-patches source. It does nothing on a phone.",
) {
    compatibleWith(
        AppleTv.TV_COMPATIBILITY,
        Disney.COMPATIBILITY,
        Espn.TV_COMPATIBILITY,
        FoxOne.COMPATIBILITY,
        HboMax.COMPATIBILITY,
        HboMax.STREAM_COMPATIBILITY,
        HuluTv.COMPATIBILITY,
        JustWatch.COMPATIBILITY,
        Mgm.COMPATIBILITY,
        Mlb.COMPATIBILITY,
        Nba.TV_COMPATIBILITY,
        NewsNation.TV_COMPATIBILITY,
        Nfl.COMPATIBILITY,
        Pbs.COMPATIBILITY,
        Peacock.COMPATIBILITY,
        Plex.COMPATIBILITY,
        Pluto.COMPATIBILITY,
        PrimeVideoTv.COMPATIBILITY,
        Starz.COMPATIBILITY,
        Tubi.COMPATIBILITY,
        YouTubeTv.COMPATIBILITY,
    )

    dependsOn(tvSourceNoticeManifestPatch)

    extendWith("extensions/extension.mpe")
}
