package patches.eclipse

import patches.shared.CAR_APP_ANDROID_NS
import patches.shared.CarAppResources

internal const val AUTO_PREFIX = "morphe_eclipse_auto_"
internal const val AUTO_ANDROID = CAR_APP_ANDROID_NS

/** Style name the manifest's `androidx.car.app.theme` points at. */
internal const val AUTO_THEME = "@style/${AUTO_PREFIX}EclipseCarTheme"

/**
 * Links the Car App Library resources into Eclipse Music beside its own, with the shared
 * linker Deezer uses. The theme colours are the app's own default accent, "cyan" (0xFF06B6D4).
 */
internal fun eclipseResources() = CarAppResources(
    label = "Eclipse Music",
    prefix = AUTO_PREFIX,
    archive = "/eclipse-auto/resources.zip",
    themeStyle = "${AUTO_PREFIX}EclipseCarTheme",
    themeColors = linkedMapOf("carColorPrimary" to "#FF06B6D4", "carColorPrimaryDark" to "#FF06B6D4",
        "carColorSecondary" to "#FFFFFFFF", "carColorSecondaryDark" to "#FFFFFFFF"),
)
