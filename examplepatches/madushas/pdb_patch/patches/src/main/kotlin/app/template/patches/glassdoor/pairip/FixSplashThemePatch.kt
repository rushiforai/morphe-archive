package app.template.patches.glassdoor.pairip

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.GLASSDOOR_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Gives the launcher activity a Theme.AppCompat theme.
 *
 * Glassdoor's launcher (`MainActivity`) declares `android:theme="@style/Theme.AppStarting"`,
 * whose parent chain is the **splash** theme (`Theme.SplashScreen` → `Base.Theme.SplashScreen`
 * → `@android:style/Theme.DeviceDefault.DayNight`) — *not* an AppCompat theme. In the original
 * app the theme is swapped at startup by the androidx splash-screen helper
 * (`heo.b()` → `activity.setTheme(postSplashScreenTheme)`), but that call site is one of the
 * methods PairIP moved into its VM (it does not exist in the dex at all — no `heo` instance is
 * ever constructed). With the VM neutralised the swap never happens and AppCompat throws
 * *"You need to use a Theme.AppCompat theme (or descendant) with this activity."*
 *
 * Since the splash is purely cosmetic and the app's `postSplashScreenTheme` is already
 * `@style/AppTheme` (a `Theme.MaterialComponents.DayNight.NoActionBar` descendant), pointing
 * the launcher straight at `@style/AppTheme` restores normal startup.
 */
@Suppress("unused")
val glassdoorFixSplashThemePatch = resourcePatch(
    name = "Fix launcher theme (PairIP VM)",
    description = "Points the launcher activity at the AppCompat @style/AppTheme instead of " +
        "the splash theme, whose runtime theme-swap lives in the removed PairIP VM.",
    default = false,
) {
    category("PairIP")
    compatibleWith(GLASSDOOR_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val activities = doc.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val el = activities.item(i) as? Element ?: continue
                if (el.getAttribute("android:name") ==
                    "com.glassdoor.app.presentation.ui.MainActivity"
                ) {
                    el.setAttribute("android:theme", "@style/AppTheme")
                }
            }
        }
    }
}
