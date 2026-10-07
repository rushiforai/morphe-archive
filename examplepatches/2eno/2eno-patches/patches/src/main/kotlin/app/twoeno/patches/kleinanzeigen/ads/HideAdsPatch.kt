package app.twoeno.patches.kleinanzeigen.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.twoeno.patches.shared.Constants.COMPATIBILITY_KLEINANZEIGEN
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private const val ADS_CONFIGURATION_CLASS = "Lde/kleinanzeigen/liberty/ads_configuration/AdsConfiguration;"
private const val PAGE_TYPE_CLASS = "Lde/kleinanzeigen/liberty/ads_configuration/LibertyPageType;"

/**
 * The ad configuration looks up the ad placements of a page with
 * `(LibertyPageType, position: Int, String, Boolean): AdPlacement?` or
 * `(LibertyPageType, String): Map<..., ...>`. Without a placement no ad is loaded.
 */
private fun Method.isAdLookup(): Boolean {
    if (AccessFlags.STATIC.isSet(accessFlags) || implementation == null) return false

    val parameters = parameterTypes.map { it.toString() }
    return (parameters == listOf(PAGE_TYPE_CLASS, "I", "Ljava/lang/String;", "Z") && returnType.startsWith("L")) ||
        (parameters == listOf(PAGE_TYPE_CLASS, "Ljava/lang/String;") &&
            returnType.startsWith("Ljava/util/") && returnType.endsWith("Map;"))
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides ads in the feed, search results and listings.",
) {
    compatibleWith(COMPATIBILITY_KLEINANZEIGEN)

    execute {
        val adsConfiguration = mutableClassDefByOrNull(ADS_CONFIGURATION_CLASS)
            ?: throw PatchException("Could not find $ADS_CONFIGURATION_CLASS")

        val adLookups = adsConfiguration.methods.filter { it.isAdLookup() }
        if (adLookups.isEmpty()) throw PatchException("Could not find the ad lookup methods")

        adLookups.forEach { it.returnEarly(null) }
    }
}
