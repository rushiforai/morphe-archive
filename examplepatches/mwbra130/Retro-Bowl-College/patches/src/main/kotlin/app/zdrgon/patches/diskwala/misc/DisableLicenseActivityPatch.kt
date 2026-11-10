package app.zdrgon.patches.diskwala.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.diskwala.shared.Constants.COMPATIBILITY_DISKWALA
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * DiskWala — Disable PairIP license activity (manifest layer).
 *
 * The component-level backstop for the PairIP license work. The
 * bytecode patches kill the funnel's only live call site
 * ("Bypass PairIP application checks") and stub every dex route
 * into LicenseActivity ("Bypass PairIP license check": the
 * checkLicense funnel, the processResponse verdict handler, and the
 * two launcher methods). The full census behind that: the activity
 * is declared exported=false with no intent-filter,
 * LicenseContentProvider is not declared in the manifest at all
 * (its onCreate entry is inert), and no dex code outside the
 * LicenseClient stack references the license classes.
 *
 * This patch removes the LicenseActivity <activity> element from
 * the manifest entirely (the 27.3 manifest declares exactly one):
 * a component that does not exist cannot be started by any intent,
 * PendingIntent, or reflective lookup, in this process or any
 * other. Nothing else in the app resolves this component (its only
 * references are the stubbed launcher methods), so removing it
 * breaks no other flow.
 *
 * A missing target is a hard failure: if LicenseActivity is not
 * found in the manifest document, the patch throws PatchException
 * instead of silently shipping an unedited manifest. Defaults on:
 * required for the license bypass to be complete on re-signed
 * builds.
 */
@Suppress("unused")
val disableLicenseActivityPatch = resourcePatch(
    name = "Disable PairIP license activity",
    description = "Required for re-signed builds: removes PairIP's LicenseActivity from the manifest entirely, so the Play Store block page and license error dialog can never be shown, whatever tries to open them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

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
                throw PatchException("DiskWala: LicenseActivity not found in the manifest; refusing to ship an unedited manifest.")
            }
            logger.info("DiskWala: PairIP LicenseActivity removed from the manifest ($removed element(s)).")
        }
    }
}
