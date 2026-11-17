package semicoloncolonel.mobilestream.patches.netflix.categories

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.netflix.shared.Constants

// "Browse hidden categories" (+ "Surprise me").
//
// Netflix's thousands of hidden genre codes (netflix.com/browse/genre/ID) are
// not exposed in the phone app, but the app already registers a deep-link
// handler for that path. This bundles the content-verified list of codes as an
// asset and adds a small self-contained screen (HiddenCategoriesActivity) that
// lists and filters them; tapping one opens that category inside Netflix
// through its own deep link. A second, screenless activity (SurpriseMeActivity)
// opens a random category from the same list. None of Netflix's own UI is
// touched.
//
// Three optional entry points: the browser's own launcher icon ("Hidden
// Categories"), a "Browse hidden categories" long-press shortcut on the Netflix
// icon, and a "Surprise me" long-press shortcut. The shortcuts share one
// shortcuts resource (Android allows only one per launcher activity).

private const val EXTENSION_CLASSES = "semicoloncolonel.mobilestream.extension.netflix.categories"
private const val ACTIVITY = "$EXTENSION_CLASSES.HiddenCategoriesActivity"
private const val SURPRISE_ACTIVITY = "$EXTENSION_CLASSES.SurpriseMeActivity"
private const val SHORTCUTS = "msp_netflix_categories_shortcuts"
private const val ASSET = "assets/netflix_hidden_genres.tsv"

// Declared on the patch, read by its resource dependency (option values are
// set before either patch executes).
private lateinit var launcherIcon: Option<Boolean>
private lateinit var appShortcut: Option<Boolean>
private lateinit var surpriseShortcut: Option<Boolean>

private val bundleHiddenCategoriesPatch = resourcePatch {
    execute {
        val wantIcon = launcherIcon.value == true
        val wantShortcut = appShortcut.value == true
        val wantSurprise = surpriseShortcut.value == true
        if (!wantIcon && !wantShortcut && !wantSurprise) {
            throw PatchException(
                "Enable at least one entry point for Browse hidden categories " +
                    "(launcher icon, categories shortcut, and/or Surprise me shortcut).",
            )
        }

        // 1. The bundled genre list, copied in as an app asset.
        val bytes = object {}.javaClass.getResourceAsStream("/netflix/hidden_genres.tsv")
            ?.use { it.readBytes() }
            ?: throw IllegalStateException("bundled /netflix/hidden_genres.tsv missing")
        val asset = get(ASSET)
        asset.parentFile?.mkdirs()
        asset.writeBytes(bytes)

        // 2. Labels for the launcher entry and the shortcuts.
        document("res/values/strings.xml").use { document ->
            val resources = document.documentElement
            mapOf(
                "msp_hidden_categories" to "Hidden Categories",
                "msp_hidden_categories_short" to "Categories",
                "msp_hidden_categories_long" to "Browse hidden categories",
                "msp_surprise_me_short" to "Surprise me",
                "msp_surprise_me_long" to "Surprise me",
            ).forEach { (name, text) ->
                val string = document.createElement("string")
                string.setAttribute("name", name)
                string.textContent = text
                resources.appendChild(string)
            }
        }

        // 3. The long-press shortcuts (categories and/or Surprise me), in one
        //    shortcuts resource.
        if (wantShortcut || wantSurprise) {
            val entries = buildList {
                if (wantShortcut) {
                    add(
                        shortcut(
                            id = "msp_hidden_categories",
                            icon = "@android:drawable/ic_menu_search",
                            shortLabel = "msp_hidden_categories_short",
                            longLabel = "msp_hidden_categories_long",
                            target = ACTIVITY,
                        ),
                    )
                }
                if (wantSurprise) {
                    add(
                        shortcut(
                            id = "msp_surprise_me",
                            icon = "@android:drawable/ic_menu_slideshow",
                            shortLabel = "msp_surprise_me_short",
                            longLabel = "msp_surprise_me_long",
                            target = SURPRISE_ACTIVITY,
                        ),
                    )
                }
            }
            val shortcuts = get("res/xml/$SHORTCUTS.xml")
            shortcuts.parentFile.mkdirs()
            shortcuts.writeText(
                (
                    listOf(
                        "<?xml version=\"1.0\" encoding=\"utf-8\"?>",
                        "<shortcuts xmlns:android=\"http://schemas.android.com/apk/res/android\">",
                    ) + entries + listOf("</shortcuts>")
                    ).joinToString("\n"),
            )
        }

        // 4. Register the activities and wire the chosen entry points.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            // The categories screen: launcher icon added only when wanted.
            val activity = document.createElement("activity")
            activity.setAttribute("android:name", ACTIVITY)
            activity.setAttribute("android:exported", "true")
            activity.setAttribute("android:label", "@string/msp_hidden_categories")
            activity.setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
            activity.setAttribute("android:taskAffinity", "")
            if (wantIcon) {
                val filter = document.createElement("intent-filter")
                val action = document.createElement("action")
                action.setAttribute("android:name", "android.intent.action.MAIN")
                filter.appendChild(action)
                val category = document.createElement("category")
                category.setAttribute("android:name", "android.intent.category.LAUNCHER")
                filter.appendChild(category)
                activity.appendChild(filter)
            }
            application.appendChild(activity)

            // The screenless Surprise me target (reached from its shortcut).
            val surprise = document.createElement("activity")
            surprise.setAttribute("android:name", SURPRISE_ACTIVITY)
            surprise.setAttribute("android:exported", "true")
            surprise.setAttribute("android:excludeFromRecents", "true")
            surprise.setAttribute("android:noHistory", "true")
            surprise.setAttribute("android:taskAffinity", "")
            surprise.setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            application.appendChild(surprise)

            // Attach the shortcut resource to the app's own launcher entry.
            if (wantShortcut || wantSurprise) {
                fun Element.hasLauncherCategory(): Boolean {
                    val categories = getElementsByTagName("category")
                    return (0 until categories.length).any {
                        (categories.item(it) as Element).getAttribute("android:name") ==
                            "android.intent.category.LAUNCHER"
                    }
                }
                val ours = setOf(ACTIVITY, SURPRISE_ACTIVITY)
                val launcherEntries = listOf("activity", "activity-alias").flatMap { tag ->
                    val nodes = application.getElementsByTagName(tag)
                    (0 until nodes.length).map { nodes.item(it) as Element }
                }
                val launcher = launcherEntries.firstOrNull {
                    it.getAttribute("android:name") !in ours && it.hasLauncherCategory()
                } ?: throw PatchException("Launcher activity not found")
                val metaData = document.createElement("meta-data")
                metaData.setAttribute("android:name", "android.app.shortcuts")
                metaData.setAttribute("android:resource", "@xml/$SHORTCUTS")
                launcher.appendChild(metaData)
            }
        }
    }
}

private fun shortcut(id: String, icon: String, shortLabel: String, longLabel: String, target: String) =
    "  <shortcut android:shortcutId=\"$id\" android:enabled=\"true\" android:icon=\"$icon\" " +
        "android:shortcutShortLabel=\"@string/$shortLabel\" " +
        "android:shortcutLongLabel=\"@string/$longLabel\">\n" +
        "    <intent android:action=\"android.intent.action.MAIN\" " +
        "android:targetPackage=\"${Constants.COMPATIBILITY.packageName}\" " +
        "android:targetClass=\"$target\" />\n" +
        "  </shortcut>"

@Suppress("unused")
val hiddenCategoriesPatch = bytecodePatch(
    name = "Browse hidden categories",
    description = "Adds a searchable list of Netflix's hidden genre categories (the " +
        "netflix.com/browse/genre codes) and opens any of them inside the app, plus an optional " +
        "\"Surprise me\" that opens a random one. Choose the entry points: a \"Hidden " +
        "Categories\" launcher icon, a categories shortcut, and/or a Surprise me shortcut on the " +
        "Netflix icon.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    launcherIcon = booleanOption(
        key = "launcherIcon",
        default = true,
        title = "Add launcher icon",
        description = "Adds a separate \"Hidden Categories\" icon to your app drawer.",
        required = true,
    )
    appShortcut = booleanOption(
        key = "appShortcut",
        default = true,
        title = "Add categories shortcut",
        description = "Adds a \"Browse hidden categories\" shortcut to the Netflix icon's " +
            "long-press menu.",
        required = true,
    )
    surpriseShortcut = booleanOption(
        key = "surpriseShortcut",
        default = true,
        title = "Add Surprise me shortcut",
        description = "Adds a \"Surprise me\" shortcut to the Netflix icon's long-press menu " +
            "that opens a random category.",
        required = true,
    )

    dependsOn(bundleHiddenCategoriesPatch)

    extendWith("extensions/extension.mpe")

    // The screens are bundled extension activities, wired through the manifest,
    // so there is no bytecode to change here.
    execute {}
}
