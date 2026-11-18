package app.afterglow.patches.settings

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Activity that hosts every Afterglow screen (settings, Control Center, studios). */
internal const val AFTERGLOW_ACTIVITY = "app.afterglow.extension.ui.AfterglowActivity"

/**
 * Action of the row's intent and of the activity's intent filter. The row names no package, so
 * it opens the activity under whatever package name the patched app ends up with (for example
 * after a GmsCore support patch renames it, which happens after this patch runs).
 */
internal const val AFTERGLOW_OPEN_SETTINGS_ACTION = "app.afterglow.extension.OPEN_SETTINGS"

/** Preference key of the Afterglow row added to YouTube's settings. */
internal const val AFTERGLOW_SETTINGS_ROW_KEY = "ytafterglow_settings"

/** Title of the row: iOS YTAGAfterglowSettingsDisplayTitle. */
internal const val AFTERGLOW_SETTINGS_ROW_TITLE = "Afterglow"

/** Row layout: YouTube's preference_with_icon with the glowing wordmark as its title. */
internal const val AFTERGLOW_SETTINGS_ROW_LAYOUT = "ytafterglow_settings_entry"

/** Row icon: the SF Symbol "sparkles" stand-in, tinted like YouTube's own settings icons. */
internal const val AFTERGLOW_SETTINGS_ROW_ICON = "ytafterglow_sparkles_24"

/** Extension view that draws the iOS wordmark and glow for android:id/title. */
internal const val AFTERGLOW_WORDMARK_VIEW = "app.afterglow.extension.ui.AfterglowWordmarkView"

/**
 * A copy of YouTube 21.43's layout/preference_with_icon (the layout of the icon rows in
 * settings_fragment_cairo: General, Languages, ...) whose title view is the extension's
 * wordmark view. Preference binding still fills android:id/title, android:id/summary and
 * android:id/icon, so no androidx.preference class is touched (their methods are
 * obfuscated in YouTube).
 */
private val ENTRY_LAYOUT = """
    <?xml version="1.0" encoding="utf-8"?>
    <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:minHeight="54dp"
        android:orientation="horizontal">
        <ImageView
            android:id="@android:id/icon"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center_vertical"
            android:layout_marginHorizontal="18dp"
            android:contentDescription="@null" />
        <LinearLayout
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_gravity="center_vertical"
            android:layout_weight="1"
            android:orientation="vertical">
            <$AFTERGLOW_WORDMARK_VIEW
                android:id="@android:id/title"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:textAlignment="viewStart"
                android:textColor="?attr/ytTextPrimary"
                android:textSize="@dimen/medium_font_size" />
            <TextView
                android:id="@android:id/summary"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:textAlignment="viewStart"
                android:textColor="?attr/ytTextSecondary"
                android:textSize="@dimen/small_font_size" />
        </LinearLayout>
    </LinearLayout>
""".trimIndent()

/**
 * Sparkles on a 24-unit grid: three four-point stars with concave sides, the same stars as
 * TabIconDrawable.sparklesPath() in the extension. Tinted ?attr/colorControlNormal like
 * YouTube's yt_outline_gear_vd_theme_24, which is how iOS tints the icon too (with the
 * color YouTube passes to iconImageWithColor:).
 */
private val SPARKLES_ICON = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="24dp"
        android:height="24dp"
        android:tint="?attr/colorControlNormal"
        android:viewportWidth="24"
        android:viewportHeight="24">
        <path
            android:fillColor="@android:color/white"
            android:pathData="M9.5,6Q10.78,12.72 17.5,14Q10.78,15.28 9.5,22Q8.22,15.28 1.5,14Q8.22,12.72 9.5,6ZM18,1.3Q18.67,4.83 22.2,5.5Q18.67,6.17 18,9.7Q17.33,6.17 13.8,5.5Q17.33,4.83 18,1.3ZM19.5,14.9Q19.92,17.08 22.1,17.5Q19.92,17.92 19.5,20.1Q19.08,17.92 16.9,17.5Q19.08,17.08 19.5,14.9Z" />
    </vector>
""".trimIndent()

/**
 * Declares the Afterglow activity and adds the "Afterglow" row at the top of YouTube's
 * settings that opens it, the Android counterpart of the iOS settings entry: sparkles
 * icon and the glowing two-tone wordmark (Settings.x:229-514, 1334-1384).
 */
internal val afterglowSettingsPatch = resourcePatch(
    description = "Adds the Afterglow settings to YouTube's settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(afterglowExtensionPatch)

    execute {
        val licenseDirectory = get("assets/afterglow/licenses")
        licenseDirectory.mkdirs()
        for (name in listOf("NOTICE", "LICENSE")) {
            val input = object {}.javaClass.getResourceAsStream("/afterglow/licenses/$name")
                ?: error("Missing bundled $name")
            input.use { source -> licenseDirectory.resolve(name).outputStream().use(source::copyTo) }
        }
        // The imported streaming engine keeps these exact JS assets. Preserve
        // their third-party notices even though the retired compatibility-only
        // resource patch is no longer part of the selected dependency graph.
        val engineLicenses = get("assets/afterglow-compatibility")
        engineLicenses.mkdirs()
        for (name in listOf("ASTRING_LICENSE.TXT", "MERIYAH_LICENSE.TXT", "YT_DLP_EJS_LICENSE.TXT")) {
            val input = object {}.javaClass.getResourceAsStream("/compat/morphe/license/$name")
                ?: error("Missing streaming engine license $name")
            input.use { source -> engineLicenses.resolve(name).outputStream().use(source::copyTo) }
        }
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            val providerName = "app.afterglow.extension.diagnostics.DebugLogProvider"
            val providers = document.getElementsByTagName("provider")
            if ((0 until providers.length).none {
                    (providers.item(it) as Element).getAttribute("android:name") == providerName
                }) {
                application.appendChild(document.createElement("provider").apply {
                    setAttribute("android:name", providerName)
                    setAttribute("android:authorities", document.documentElement.getAttribute("package") + ".afterglow.debuglog")
                    setAttribute("android:exported", "false")
                    setAttribute("android:grantUriPermissions", "true")
                })
            }

            val activities = document.getElementsByTagName("activity")
            val restartName = "app.afterglow.extension.ui.RestartActivity"
            if ((0 until activities.length).none {
                    (activities.item(it) as Element).getAttribute("android:name") == restartName
                }) {
                application.appendChild(document.createElement("activity").apply {
                    setAttribute("android:name", restartName)
                    setAttribute("android:exported", "false")
                    setAttribute("android:process", ":afterglow_restart")
                    setAttribute("android:taskAffinity", "")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                })
            }
            val activity = (0 until activities.length).map { activities.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == AFTERGLOW_ACTIVITY }
                ?: document.createElement("activity").apply {
                    setAttribute("android:name", AFTERGLOW_ACTIVITY)
                    // Exported, because the row starts it with an implicit intent: apps targeting
                    // Android 14+ (YouTube targets 37) deliver implicit intents only to exported
                    // components, even within the same app, so an unexported activity throws
                    // ActivityNotFoundException on tap. The activity reads only a page-name extra.
                    setAttribute("android:exported", "true")
                    setAttribute("android:theme", "@android:style/Theme.DeviceDefault.DayNight")
                    setAttribute(
                        "android:configChanges",
                        "orientation|screenSize|screenLayout|smallestScreenSize|keyboardHidden|uiMode",
                    )
                    application.appendChild(this)
                }

            // The row opens the activity by this action, so the row does not name a package and
            // keeps working when another patch (such as a GmsCore support patch) renames the app.
            val actions = activity.getElementsByTagName("action")
            val hasFilter = (0 until actions.length).any {
                (actions.item(it) as Element).getAttribute("android:name") == AFTERGLOW_OPEN_SETTINGS_ACTION
            }
            if (!hasFilter) {
                activity.appendChild(
                    document.createElement("intent-filter").apply {
                        appendChild(
                            document.createElement("action").apply {
                                setAttribute("android:name", AFTERGLOW_OPEN_SETTINGS_ACTION)
                            },
                        )
                        appendChild(
                            document.createElement("category").apply {
                                setAttribute("android:name", "android.intent.category.DEFAULT")
                            },
                        )
                    },
                )
            }
        }

        // The row's layout and icon are new resources in YouTube's resource table.
        get("res/layout/$AFTERGLOW_SETTINGS_ROW_LAYOUT.xml", false).writeText(ENTRY_LAYOUT)
        get("res/drawable/$AFTERGLOW_SETTINGS_ROW_ICON.xml", false).writeText(SPARKLES_ICON)

        // YouTube ships a classic and a "cairo" settings layout; add the row to both.
        val layouts = listOf("res/xml/settings_fragment.xml", "res/xml/settings_fragment_cairo.xml")
        var added = 0
        for (path in layouts) {
            if (!get(path, true).exists()) continue
            document(path).use { document ->
                val screen = document.documentElement
                val existing = document.getElementsByTagName("Preference")
                val alreadyAdded = (0 until existing.length).any {
                    (existing.item(it) as Element).getAttribute("android:key") == AFTERGLOW_SETTINGS_ROW_KEY
                }
                if (alreadyAdded) return@use

                val row = document.createElement("Preference").apply {
                    setAttribute("android:key", AFTERGLOW_SETTINGS_ROW_KEY)
                    setAttribute("android:title", AFTERGLOW_SETTINGS_ROW_TITLE)
                    setAttribute("android:layout", "@layout/$AFTERGLOW_SETTINGS_ROW_LAYOUT")
                    setAttribute("android:icon", "@drawable/$AFTERGLOW_SETTINGS_ROW_ICON")
                    setAttribute("android:persistent", "false")
                    appendChild(
                        document.createElement("intent").apply {
                            setAttribute("android:action", AFTERGLOW_OPEN_SETTINGS_ACTION)
                        },
                    )
                }
                screen.insertBefore(row, screen.firstChild)
                added++
            }
        }
        if (added == 0) {
            throw app.morphe.patcher.patch.PatchException("Could not find YouTube's settings layout")
        }
    }
}
