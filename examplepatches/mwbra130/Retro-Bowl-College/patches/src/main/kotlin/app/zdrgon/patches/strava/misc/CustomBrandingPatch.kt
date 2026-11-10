package app.zdrgon.patches.strava.misc

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.zdrgon.patches.strava.shared.Constants.COMPATIBILITY_STRAVA
import org.w3c.dom.Element

private const val SPLASH_ACTIVITY = "com.strava.SplashActivity"
private const val CUSTOM_NAME_STRING = "app_name_custom"
private const val ACCENT_ICON_MIPMAP = "@mipmap/ic_launcher_accent"
private const val DEFAULT_ICON_MIPMAP = "@mipmap/ic_launcher_default"

// Launcher icon keys in picker order. All except "Original" and
// "Accent" are Strava's own built-in alternate icons (activity-aliases
// whose names are SplashActivity<key>Icon).
private val ICON_KEYS = listOf(
    "Original", "Accent", "LocalLegend", "Xom", "Trophy", "Medal", "Hiking",
    "Cycling", "Running", "Kudos", "Sticker", "Pride", "Road", "Gravel",
    "Teal", "Red", "Black",
)

// The mipmap each built-in alias points at in 486.9, used when the
// alias's own icon attribute cannot be read from the manifest.
private val STOCK_ICON_MIPMAPS = mapOf(
    "LocalLegend" to "@mipmap/ic_launcher_locallegend",
    "Xom" to "@mipmap/ic_launcher_xom",
    "Trophy" to "@mipmap/ic_launcher_trophy",
    "Medal" to "@mipmap/ic_launcher_medal",
    "Hiking" to "@mipmap/ic_launcher_hike",
    "Cycling" to "@mipmap/ic_launcher_ride",
    "Running" to "@mipmap/ic_launcher_run",
    "Kudos" to "@mipmap/ic_launcher_kudos",
    "Sticker" to "@mipmap/ic_launcher_sticker",
    "Pride" to "@mipmap/ic_launcher_pride",
    "Road" to "@mipmap/ic_launcher_road",
    "Gravel" to "@mipmap/ic_launcher_gravel",
    "Teal" to "@mipmap/ic_launcher_teal",
    "Red" to "@mipmap/ic_launcher_red",
    "Black" to "@mipmap/ic_launcher_black",
)

/** The launcher component for a (name, icon) combination. Must match
 * app.template.extension.strava.LauncherSwitcher's table. */
private fun componentFor(customName: Boolean, iconKey: String): String = when (iconKey) {
    "Original" -> if (customName) "${SPLASH_ACTIVITY}DefaultIconCustomName" else SPLASH_ACTIVITY
    "Accent" -> "${SPLASH_ACTIVITY}AccentIcon" + if (customName) "CustomName" else ""
    else -> "${SPLASH_ACTIVITY}${iconKey}Icon" + if (customName) "CustomName" else ""
}

// The custom name lives in its own string resource so the original
// @string/app_name (and every component that references it) keeps
// working unchanged.
private fun ResourcePatchContext.writeCustomNameString(customName: String) {
    fun writeTo(path: String) {
        document(path).use { doc ->
            val strings = doc.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val element = strings.item(i) as Element
                if (element.getAttribute("name") == CUSTOM_NAME_STRING) {
                    element.textContent = customName
                    return@use
                }
            }
            val element = doc.createElement("string")
            element.setAttribute("name", CUSTOM_NAME_STRING)
            element.textContent = customName
            doc.getElementsByTagName("resources").item(0).appendChild(element)
        }
    }

    writeTo("res/values/strings.xml")

    // The XAPK's config.en split can override the default strings on
    // English devices, so write there too when present.
    try {
        writeTo("res/values-en/strings.xml")
    } catch (e: Exception) {
        // File not present in this APK.
    }
}

// The Accent icon: the stock launcher glyph (both pathData strings
// copied verbatim from res/drawable/ic_launcher_foreground.xml in
// 486.9) filled with @color/core_o3 instead of @color/global_light,
// on a @color/global_light background (the inverse of the default
// icon, whose background is the brand color and glyph is light).
private fun ResourcePatchContext.writeAccentIconResources() {
    val foreground = """
        <?xml version="1.0" encoding="utf-8"?>
        <vector xmlns:android="http://schemas.android.com/apk/res/android"
            android:width="108dp"
            android:height="108dp"
            android:viewportWidth="108"
            android:viewportHeight="108">
            <path
                android:fillColor="@color/core_o3"
                android:pathData="M51.01,46.47L56.69,57.67H65.03L51.01,30L37,57.67H45.34L51.01,46.47Z" />
            <path
                android:fillColor="@color/core_o3"
                android:pathData="M60.86,65.89L56.69,57.66H50.56L60.86,78L71.15,57.66H65.02L60.86,65.89Z" />
        </vector>
    """.trimIndent()

    val adaptiveIcon = """
        <?xml version="1.0" encoding="utf-8"?>
        <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
            <background android:drawable="@color/global_light" />
            <foreground android:drawable="@drawable/ic_launcher_foreground_accent" />
            <monochrome android:drawable="@drawable/ic_launcher_foreground_accent" />
        </adaptive-icon>
    """.trimIndent()

    val foregroundFile = this["res/drawable/ic_launcher_foreground_accent.xml", false]
    foregroundFile.parentFile?.mkdirs()
    foregroundFile.writeText(foreground)

    val iconFile = this["res/mipmap-anydpi-v26/ic_launcher_accent.xml", false]
    iconFile.parentFile?.mkdirs()
    iconFile.writeText(adaptiveIcon)
}

private fun ResourcePatchContext.prepareLauncherManifest(chosenComponent: String) {
    document("AndroidManifest.xml").use { doc ->
        val application = doc.getElementsByTagName("application").item(0) as Element

        // Icon reference per key: read the stock aliases' own icon
        // attributes where possible so the custom-name copies point at
        // exactly the same mipmaps.
        val iconRefs = mutableMapOf(
            "Original" to DEFAULT_ICON_MIPMAP,
            "Accent" to ACCENT_ICON_MIPMAP,
        )
        iconRefs.putAll(STOCK_ICON_MIPMAPS)

        var appLabel = "@string/app_name"
        val aliases = doc.getElementsByTagName("activity-alias")
        val stockAliases = ArrayList<Element>()
        for (i in 0 until aliases.length) {
            val element = aliases.item(i) as Element
            stockAliases += element
            if (element.hasAttribute("android:label")) {
                appLabel = element.getAttribute("android:label")
            }
            val name = element.getAttribute("android:name")
            for (key in STOCK_ICON_MIPMAPS.keys) {
                if (name == "${SPLASH_ACTIVITY}${key}Icon" &&
                    element.hasAttribute("android:icon")
                ) {
                    iconRefs[key] = element.getAttribute("android:icon")
                }
            }
        }

        fun createAlias(
            name: String,
            label: String,
            icon: String,
        ): Element {
            val alias = doc.createElement("activity-alias")
            alias.setAttribute("android:name", name)
            alias.setAttribute("android:label", label)
            alias.setAttribute("android:icon", icon)
            alias.setAttribute("android:enabled", "false")
            alias.setAttribute("android:exported", "true")
            alias.setAttribute("android:targetActivity", SPLASH_ACTIVITY)
            val filter = doc.createElement("intent-filter")
            val action = doc.createElement("action")
            action.setAttribute("android:name", "android.intent.action.MAIN")
            val category = doc.createElement("category")
            category.setAttribute("android:name", "android.intent.category.LAUNCHER")
            filter.appendChild(action)
            filter.appendChild(category)
            alias.appendChild(filter)
            application.appendChild(alias)
            return alias
        }

        val allAliases = ArrayList<Element>(stockAliases)

        // The Accent combination for the original name; the 15 stock
        // aliases already cover the other original-name icons.
        allAliases += createAlias(
            componentFor(false, "Accent"),
            appLabel,
            iconRefs.getValue("Accent"),
        )

        // Every custom-name combination.
        for (key in ICON_KEYS) {
            allAliases += createAlias(
                componentFor(true, key),
                "@string/$CUSTOM_NAME_STRING",
                iconRefs.getValue(key),
            )
        }

        // Enable exactly the chosen combination.
        val activities = doc.getElementsByTagName("activity")
        for (i in 0 until activities.length) {
            val element = activities.item(i) as Element
            if (element.getAttribute("android:name") == SPLASH_ACTIVITY) {
                element.setAttribute(
                    "android:enabled",
                    (chosenComponent == SPLASH_ACTIVITY).toString(),
                )
            }
        }
        for (alias in allAliases) {
            alias.setAttribute(
                "android:enabled",
                (alias.getAttribute("android:name") == chosenComponent).toString(),
            )
        }
    }
}

/**
 * Prepares the launcher name/icon combinations that the in-app
 * settings screen can switch between at runtime.
 *
 * Android shows a launcher name/icon per enabled launcher component,
 * so each (name, icon) combination needs its own activity-alias:
 *
 * - Names: the original (@string/app_name, untouched) and a custom
 *   name stored in a new @string/app_name_custom resource (the appName
 *   option). Runtime switching never rewrites strings.
 * - Icons: the app icon, Strava's 15 built-in alternate icons, and an
 *   "Accent" icon added by this patch: an adaptive icon whose glyph is
 *   the stock launcher vector recolored to @color/core_o3 (so it
 *   follows the Custom theme colors accent, or stock orange without
 *   that patch) on a light background.
 *
 * Strava already ships the 15 aliases for the original name. This patch
 * adds the missing combinations (the Accent alias and every custom-name
 * alias), then enables exactly the combination chosen by the patch
 * options and disables all the others. Afterwards the settings screen
 * flips the enabled component via PackageManager
 * (LauncherSwitcher in the extension).
 */
@Suppress("unused")
val customBrandingPatch = resourcePatch(
    name = "Custom app name and icon",
    description = "Changes the app's displayed name and launcher icon. The icon choices are " +
        "Strava's own built-in alternate icons, plus an accent-colored one. Name and icon " +
        "can later be switched at runtime from the patch settings screen.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_STRAVA)

    val appNameOption = stringOption(
        key = "appName",
        default = "Strava Custom",
        title = "App name",
        description = "The custom name the launcher can show. The original name stays " +
            "available in the patch settings screen.",
        required = true,
    )

    val appIconOption = stringOption(
        key = "appIcon",
        default = "default",
        values = mapOf(
            "Default" to "default",
            "Accent" to "Accent",
            "Local Legend" to "LocalLegend",
            "XOM" to "Xom",
            "Trophy" to "Trophy",
            "Medal" to "Medal",
            "Hiking" to "Hiking",
            "Cycling" to "Cycling",
            "Running" to "Running",
            "Kudos" to "Kudos",
            "Sticker" to "Sticker",
            "Pride" to "Pride",
            "Road" to "Road",
            "Gravel" to "Gravel",
            "Teal" to "Teal",
            "Red" to "Red",
            "Black" to "Black",
        ),
        title = "App icon",
        description = "The launcher icon. Uses Strava's own built-in alternate icons, " +
            "plus an accent-colored one.",
        required = true,
    )

    execute {
        val customName = appNameOption.value!!.ifBlank { "Strava Custom" }
        val chosenIconKey = when (val icon = appIconOption.value!!) {
            "default" -> "Original"
            else -> icon
        }
        val chosenComponent = componentFor(customName != "Strava", chosenIconKey)

        writeCustomNameString(customName)
        writeAccentIconResources()
        prepareLauncherManifest(chosenComponent)
    }
}
