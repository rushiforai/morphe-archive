package tw.maps

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.ungoogled.patches.maps.car.nativeCarNavigationPatch
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import org.w3c.dom.Element

private const val ANDROID = "http://schemas.android.com/apk/res/android"

/**
 * Maps' Android Auto descriptor (`res/xml/automotive_description`) declares three capabilities:
 *
 *  - `projection` -- Google's private projection path, served only to Google-signed callers;
 *  - `notification` -- the messaging/notification surface;
 *  - `template` -- the CAL navigation surface added by
 *    "Native navigation for Gearslip and Android Auto".
 *
 * On a Pernis MS700CL with Android Auto 18, the re-signed Maps package is rejected by
 * `CAR.VALIDATOR` (`Package DENIED; failed all other checks`) after a PlayGearheadService
 * owner lookup returns empty. It then fails to load the CAL navigation service and the
 * launcher opens the messaging surface ("No new messages during this drive"). The evidence
 * does not establish that the empty owner result alone causes the denial: another sideloaded
 * Morphe app also returns empty without a following denial. Unknown sources and spoofing the
 * installer package as Play did not change the Maps denial. Removing legacy projection
 * declarations stopped the messaging fallback but did not resolve the validator denial.
 *
 * Declaring only `template` makes the patched app a plain navigation app. The projection
 * services stay in the manifest but lose their Android Auto intent filters; the native adapter
 * binds them explicitly inside the app, which needs neither a filter nor export. This removes
 * the messaging fallback path but is not known to make the real head unit accept the package.
 */
@Suppress("unused")
val hideLegacyProjectionEntry = resourcePatch(
    name = "Android Auto template-only app",
    description = "26.44.06.1006895251 only. Declares the patched Maps as a navigation (template) app only " +
        "and removes legacy projection entry points that caused the real head unit to fall back to messaging. " +
        "This does not bypass the observed package validator denial.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    // Runs after the native adapter has added the template capability this patch leaves behind.
    dependsOn(nativeCarNavigationPatch)
    execute {
        var descriptor: String? = null

        document("AndroidManifest.xml").use { doc ->
            fun elements(tag: String) = doc.getElementsByTagName(tag).let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }
            }
            val application = doc.getElementsByTagName("application").item(0) as Element
            descriptor = elements("meta-data").singleOrNull {
                it.parentNode == application &&
                    it.getAttributeNS(ANDROID, "name") == "com.google.android.gms.car.application"
            }?.getAttributeNS(ANDROID, "resource")
                ?.takeIf { it.startsWith("@xml/") }?.removePrefix("@xml/")
                ?: throw PatchException("Maps' Android Auto descriptor changed")

            // Every projection service is Google-only; strip the filters that advertise them.
            for (service in elements("service")) {
                val filters = service.getElementsByTagName("intent-filter").let { nodes ->
                    (0 until nodes.length).map { nodes.item(it) as Element }
                }
                for (filter in filters) {
                    val categories = filter.getElementsByTagName("category")
                    val isProjection = (0 until categories.length).any {
                        (categories.item(it) as Element).getAttributeNS(ANDROID, "name")
                            .startsWith("com.google.android.gms.car.category.CATEGORY_PROJECTION")
                    }
                    if (isProjection) service.removeChild(filter)
                }
            }
        }

        document("res/xml/$descriptor.xml").use { doc ->
            val root = doc.documentElement
            val uses = doc.getElementsByTagName("uses").let { nodes ->
                (0 until nodes.length).map { nodes.item(it) as Element }
            }
            if (uses.isEmpty()) throw PatchException("Maps' Android Auto descriptor has no capabilities")
            val removed = uses.filter { it.getAttribute("name") != "template" }
            if (removed.size == uses.size) {
                // "Native navigation for Gearslip and Android Auto" adds the template capability;
                // without it this patch would leave the app with no Android Auto surface at all.
                throw PatchException("Maps declares no template capability; select \"Native navigation for Gearslip and Android Auto\"")
            }
            removed.forEach(root::removeChild)
        }
    }
}
