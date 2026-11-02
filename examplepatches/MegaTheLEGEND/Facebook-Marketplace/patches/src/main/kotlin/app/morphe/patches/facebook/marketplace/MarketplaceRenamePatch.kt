package app.morphe.patches.facebook.marketplace

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.all.misc.clone.cloneAppPatch
import app.morphe.patches.all.misc.clone.setOrGetFallbackPackageName
import app.morphe.util.ResourceGroup
import app.morphe.util.asSequence
import app.morphe.util.copyResources
import org.w3c.dom.Element

private const val DEFAULT_PACKAGE_NAME = "io.focalpoint.prism"
private const val DEFAULT_APP_NAME = "Marketplace"

private const val ANDROID_LABEL = "android:label"
private const val ANDROID_ICON = "android:icon"
private const val ANDROID_ROUND_ICON = "android:roundIcon"

/** Folder under patches/src/main/resources holding the generated icon (see tools/icon/make_icon.py). */
private const val ICON_RESOURCE_FOLDER = "marketplace-icon"
private const val ICON_REFERENCE = "@mipmap/marketplace_launcher"
private const val ICON_FOREGROUND = "marketplace_adaptive_foreground.png"
private val ICON_DENSITIES = listOf("mdpi", "hdpi", "xhdpi", "xxhdpi", "xxxhdpi")

/**
 * True for an <activity> / <activity-alias> that has a LAUNCHER intent-filter category, i.e. the
 * entries a launcher lists. A launcher shows the label of such an entry and only falls back to
 * the <application> label when the entry has none, so both have to be set.
 */
private fun Element.isLauncherEntry(): Boolean =
    getElementsByTagName("category").asSequence()
        .filterIsInstance<Element>()
        .any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }

private fun setIcon(element: Element) {
    element.setAttribute(ANDROID_ICON, ICON_REFERENCE)
    element.removeAttribute(ANDROID_ROUND_ICON)
}

/**
 * Renames the patched Facebook app to [DEFAULT_PACKAGE_NAME] with the display name
 * [DEFAULT_APP_NAME].
 *
 * Package name: this patch does not rewrite the manifest itself. It depends on Morphe's own
 * "Clone app" patch and hands it the package name through [setOrGetFallbackPackageName] (the same
 * hook GmsCore support uses). Clone app's finalize step then sets the manifest `package`
 * attribute and renames the app's custom permissions and provider authorities that start with
 * `com.facebook.katana.`, so the renamed app installs next to the stock one without
 * INSTALL_FAILED_CONFLICTING_PROVIDER. If the user passes Clone app's own `packageName` option
 * explicitly, that value wins (that is how setOrGetFallbackPackageName works).
 *
 * Display name: a literal `android:label` is written on `<application>` (also what the system
 * app-info screen shows) and on every launcher activity / activity-alias. A literal is used
 * instead of editing `@string/app_name` because Facebook's resource names are stripped in this
 * build (see agent-tools/arsc.py: "name removed"), and a literal cannot be overridden by a
 * localized `values-xx/strings.xml`.
 *
 * Launcher icon (option `changeIcon`, on): a bundled adaptive icon (white storefront on #1A1A1A,
 * with a monochrome layer for Android 13+ themed icons) is copied into the app as
 * `@mipmap/marketplace_launcher`, and `android:icon` on `<application>` and on every launcher
 * entry is pointed at it. `android:roundIcon` is removed from those elements, because a launcher
 * that prefers the round icon would otherwise keep showing Facebook's. The `<application>` icon
 * matters too: it is what the system app list, Android Auto and some notification UIs show. Only
 * adaptive icons are shipped (`mipmap-anydpi`); the app needs Android 8+ anyway. The names are
 * `marketplace_*`, so they cannot collide with Facebook's own resources.
 *
 * Not verified (no APK was available when this was written, so nothing here was run):
 *  - Facebook's own code may compare against or build strings from "com.facebook.katana" in
 *    places Clone app can't see (provider authority constants, family-app / trusted-caller
 *    checks, intents to its own components). If the renamed app crashes on launch or a feature
 *    breaks, `adb logcat | findstr /i "AndroidRuntime katana"` and send the output.
 *  - Adding a resource patch makes Morphe decode the APK's resources, which the bytecode-only
 *    "Marketplace only" patch never needed. If decoding fails on this APK, that is the cause.
 *
 * Checked against Facebook 582.0.0.50.54 (com.facebook.katana) only by reading the Morphe
 * sources (CloneAppPatch.kt, GmsCoreSupportPatch.kt, BaseCustomBrandingPatch.kt) it is modeled on.
 */
@Suppress("unused")
val marketplaceRenamePatch = resourcePatch(
    name = "Marketplace rename",
    description = "Changes the package name to $DEFAULT_PACKAGE_NAME, the app name to " +
        "$DEFAULT_APP_NAME and the launcher icon to a storefront (all configurable), so the patched app installs next to the stock " +
        "Facebook app. Uses the \"Clone app\" patch for the package name.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)
    dependsOn(cloneAppPatch)

    val newPackageNameOption = stringOption(
        key = "newPackageName",
        default = DEFAULT_PACKAGE_NAME,
        title = "Package name",
        description = "Package name of the patched app. Must be unique on the device.",
        required = true
    ) {
        it != null && it.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val appNameOption = stringOption(
        key = "appName",
        default = DEFAULT_APP_NAME,
        title = "App name",
        description = "Name shown under the launcher icon and in the system app list.",
        required = true
    ) {
        !it.isNullOrBlank()
    }

    val changeIconOption = booleanOption(
        key = "changeIcon",
        default = true,
        title = "Change launcher icon",
        description = "Replaces the launcher icon with the bundled Marketplace storefront icon."
    )

    execute {
        // Must run before Clone app's finalize step, which reads the option. It does: finalize
        // steps run after every execute block.
        setOrGetFallbackPackageName(newPackageNameOption.value!!)

        val appName = appNameOption.value!!
        val changeIcon = changeIconOption.value == true

        if (changeIcon) {
            copyResources(
                ICON_RESOURCE_FOLDER,
                ResourceGroup("mipmap-anydpi", "marketplace_launcher.xml"),
                ResourceGroup("drawable", "marketplace_adaptive_background.xml"),
                *ICON_DENSITIES.map { ResourceGroup("mipmap-$it", ICON_FOREGROUND) }.toTypedArray()
            )
        }

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            application.setAttribute(ANDROID_LABEL, appName)
            if (changeIcon) setIcon(application)

            arrayOf("activity", "activity-alias").forEach { tagName ->
                val elements = document.getElementsByTagName(tagName)

                for (index in 0 until elements.length) {
                    val element = elements.item(index) as Element
                    if (element.isLauncherEntry()) {
                        element.setAttribute(ANDROID_LABEL, appName)
                        if (changeIcon) setIcon(element)
                    }
                }
            }
        }
    }
}
