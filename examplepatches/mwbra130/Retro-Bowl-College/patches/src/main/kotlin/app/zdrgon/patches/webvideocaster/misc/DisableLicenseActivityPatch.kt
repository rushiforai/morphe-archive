package app.zdrgon.patches.webvideocaster.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.webvideocaster.shared.Constants.COMPATIBILITY_WEB_VIDEO_CASTER
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Web Video Caster — Disable PairIP license activity (manifest layer).
 *
 * The component-level backstop for the PairIP license work. The
 * bytecode patches stub every dex route into PairIP's
 * LicenseActivity (the checkLicense funnel, the processResponse
 * verdict handler, and the two launcher methods), and the round-10
 * census re-verified that no other route exists: the activity is
 * declared exported=false with no intent-filter, LicenseContentProvider
 * is not declared in the manifest at all (its onCreate entry is
 * inert), no dex code outside the LicenseClient stack references
 * the license classes, and neither the PairIP VM modules nor
 * libpairipcore.so contain any LicenseActivity/paywall reference.
 *
 * Round 3 set android:enabled="false" on the component. Round 10
 * upgrades that to removing the <activity> element from the
 * manifest entirely: a component that does not exist cannot be
 * started by any intent, PendingIntent or reflective lookup, in
 * this process or any other, and there is no enabled-state left
 * for any other component to flip back. Nothing else in the app
 * resolves this component (its only references are the stubbed
 * launcher methods), so removing it breaks no other flow.
 *
 * Round 10 also makes a missing target a hard failure. The round-3
 * version only logged a warning when LicenseActivity was not found
 * in the manifest document — a patcher that handed this patch a
 * manifest in an unexpected shape would have silently shipped an
 * unedited manifest. Now the patch throws PatchException, so a run
 * that cannot find its target fails loudly instead of passing.
 * Defaults on: required for the license bypass to be complete on
 * re-signed builds.
 */
@Suppress("unused")
val disableLicenseActivityPatch = resourcePatch(
    name = "Disable PairIP license activity",
    description = "Required for re-signed builds: removes PairIP's LicenseActivity from the manifest entirely, so the Play Store block page and license error dialog can never be shown, whatever tries to open them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEB_VIDEO_CASTER)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            var removed = 0
            // Collect first: the NodeList is live, removing while
            // iterating by index would skip elements.
            val targets = mutableListOf<Element>()
            for (i in 0 until activities.length) {
                val element = activities.item(i) as Element
                if (element.getAttribute("android:name") == "com.pairip.licensecheck.LicenseActivity") {
                    targets.add(element)
                }
            }
            for (element in targets) {
                element.parentNode.removeChild(element)
                removed++
            }
            if (removed == 0) {
                throw PatchException("Web Video Caster: LicenseActivity not found in the manifest; refusing to ship an unedited manifest.")
            }
            logger.info("Web Video Caster: PairIP LicenseActivity removed from the manifest ($removed element(s)).")
        }
    }
}
