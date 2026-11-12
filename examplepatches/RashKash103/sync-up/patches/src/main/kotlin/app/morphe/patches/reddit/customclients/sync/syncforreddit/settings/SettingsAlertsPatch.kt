package app.morphe.patches.reddit.customclients.sync.syncforreddit.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patches.util.drawableNamed
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

private const val PREFERENCES = "com.laurencedawson.reddit_sync.ui.preferences"

private const val CATEGORY = "$PREFERENCES.defaults.CategoryHeaderPreference"
private const val ROW = "$PREFERENCES.defaults.SyncPreference"

private const val ALERTS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/settings/SettingsAlerts;"

private const val SETTLE_METHOD = "settle(Lpa/d;)V"

private const val DRAW_ROW_METHOD =
    "drawRow(Landroidx/preference/Preference;Landroidx/preference/h;)V"

private const val SETTINGS_SCREEN = "Lpa/d;"

/** The category the rows sit in, and the rows, named here and in the extension. */
private const val ALERTS_CATEGORY = "sync_up_alerts"

private const val ALERT_ROW = "sync_up_alert_"

/** How many rows there are to say something with. The extension counts on exactly this many. */
private const val ROWS = 4

/** The row that opens what has been put away, which the extension hides while nothing is. */
private const val PUT_AWAY_ROW = "sync_up_alerts_dismissed_row"

/** What sits in a row's widget frame: the sign that it leads somewhere, and the way out. */
private const val CHEVRON_ID = "sync_up_alert_go"

private const val DISMISS_ID = "sync_up_alert_dismiss"

private const val WIDGET_LAYOUT = "sync_up_alert_widget"

/**
 * The chevron. No themed one survived the shrinker — the arrows under the names an icon of
 * this kind would have are all stubs — so this is a real drawing with a black fill, and the
 * extension tints it with the colour the row's own title has just been given.
 */
private const val CHEVRON_DRAWABLE = "material_ic_keyboard_arrow_right_black_24dp"

private const val DISMISS_DRAWABLE = "outline_close_24"

/**
 * The icons the rows are given, one per level. Checked rather than assumed: most of the
 * drawables the app names are stubs the shrinker left behind, and a row given one takes its
 * whole screen down the moment it is drawn.
 */
private val icons = listOf("outline_report_24", "outline_info_24")

/**
 * Whether every one of them turned out to be a real drawing.
 *
 * <p>Worked out while the resources are being written, because that is where a drawable can be
 * read, and used while the code is being written, which happens afterwards: a patch's
 * dependencies run before it does, so by then this has been answered.
 */
private var iconsAreReal = false

/** The same question for the two views a row carries, answered in the same place. */
private var widgetsAreReal = false

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

/**
 * Writes the rows an alert is shown in onto the front page of the settings.
 *
 * <p>Hidden until something has to be said: the extension turns the whole section on only where
 * there is an alert, so a copy with nothing wrong looks exactly as it did.
 */
internal val settingsAlertsRowsPatch = resourcePatch(
    description = "Adds the rows an alert is shown in to the front page of the settings.",
) {
    execute {
        // The views a row carries of its own, written first so that a row is only given a
        // layout that is actually there. Nothing cosmetic should be able to fail a patch or
        // take a screen down: where either drawing turns out to be one of the stubs the
        // shrinker left behind, the rows simply go without.
        val chevron = drawableNamed(CHEVRON_DRAWABLE)
        val dismiss = drawableNamed(DISMISS_DRAWABLE)
        if (chevron != null && dismiss != null) {
            // The ids are declared where they are used, with @+id, rather than in a values
            // file of their own: a file holding nothing but <item type="id"> is refused by
            // what encodes the resource table back, and the table is then rebuilt whole.
            // Built line by line rather than from a template: trimming the indent off a
            // template happens after what goes into it has been put in, which has already put
            // four spaces in front of an XML declaration once in this bundle.
            get("res/layout/$WIDGET_LAYOUT.xml").writeText(
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                        "<LinearLayout xmlns:android=\"$ANDROID_NAMESPACE\"\n" +
                        "    android:layout_width=\"wrap_content\"\n" +
                        "    android:layout_height=\"wrap_content\"\n" +
                        "    android:gravity=\"center_vertical\"\n" +
                        "    android:orientation=\"horizontal\">\n" +
                        "    <ImageView\n" +
                        "        android:id=\"@+id/$CHEVRON_ID\"\n" +
                        "        android:layout_width=\"24dp\"\n" +
                        "        android:layout_height=\"24dp\"\n" +
                        "        android:contentDescription=\"Open\"\n" +
                        "        android:src=\"$chevron\" />\n" +
                        "    <ImageView\n" +
                        "        android:id=\"@+id/$DISMISS_ID\"\n" +
                        "        android:layout_width=\"40dp\"\n" +
                        "        android:layout_height=\"40dp\"\n" +
                        "        android:background=\"?android:attr/selectableItemBackground\"\n" +
                        "        android:contentDescription=\"Dismiss\"\n" +
                        "        android:padding=\"8dp\"\n" +
                        "        android:src=\"$dismiss\" />\n" +
                        "</LinearLayout>\n",
            )
            widgetsAreReal = true
        }

        document("res/xml/cat_root.xml").use { document ->
            val screen = document.documentElement

            val category = document.createElement("PreferenceCategory")
            category.setAttribute("android:key", ALERTS_CATEGORY)
            // Off until the extension turns it on, so that nothing flashes up on a screen
            // where there is nothing wrong.
            category.setAttribute("app:isPreferenceVisible", "false")

            val heading = document.createElement(CATEGORY)
            heading.setAttribute("app:categoryTitle", "Needs attention")
            category.appendChild(heading)

            fun row(key: String, carryingWidgets: Boolean): Element {
                val row = document.createElement(ROW)
                row.setAttribute("android:key", key)
                row.setAttribute("android:title", " ")
                row.setAttribute("app:isPreferenceVisible", "false")
                if (carryingWidgets && widgetsAreReal) {
                    row.setAttribute("android:widgetLayout", "@layout/$WIDGET_LAYOUT")
                }
                return row
            }

            repeat(ROWS) { at -> category.appendChild(row("$ALERT_ROW$at", true)) }

            // The way back to anything that was put away. Hidden until something has been,
            // and inside the same section so that it is still reachable when every alert
            // there is has been dismissed.
            category.appendChild(row(PUT_AWAY_ROW, false))

            // At the very top, above Sync's own first section: an alert that has to be
            // scrolled to is one nobody reads.
            val sections = document.getElementsByTagName("PreferenceCategory")
            val first = (0 until sections.length)
                .map { sections.item(it) as Element }
                .firstOrNull { it.parentNode === screen }
                ?: throw PatchException("No section on the front page to put the alerts above")
            screen.insertBefore(category, first)
        }

        iconsAreReal = icons.all { drawableNamed(it) != null }
    }
}

/**
 * Says at the top of the settings what is wrong, where anything is.
 *
 * <p>Has no name, so it is not offered as a patch to choose. Anything that wants to be able to
 * say something depends on it, and Morphe applies it once however many of them do — so the rows
 * are written once, the hook is injected once, and a patch that needs alerts does not have to
 * carry a copy of any of it.
 *
 * <p>What is said comes from the extension, which asks each source in turn; a source answers
 * for itself whether its own patch is in this copy, so a build without it has nothing to say
 * and the section never appears.
 */
internal val settingsAlertsPatch = bytecodePatch(
    description = "Says at the top of the settings what needs attention.",
) {
    dependsOn(sharedExtensionPatch, settingsAlertsRowsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // Reached from whatever app package the call is injected into, so a class that is not
        // public throws the first time a settings screen is opened rather than at patch time.
        val alerts = classDefByOrNull(ALERTS_CLASS_DESCRIPTOR)
            ?: throw PatchException("$ALERTS_CLASS_DESCRIPTOR is not in the app to be called")
        if (alerts.accessFlags and AccessFlags.PUBLIC.value == 0) {
            throw PatchException("$ALERTS_CLASS_DESCRIPTOR is not public, so it cannot be called")
        }

        Fingerprint(definingClass = ALERTS_CLASS_DESCRIPTOR, name = "isPatchIncluded")
            .method.returnEarly(true)

        // Only where every icon is a real drawing. Nothing cosmetic should be able to take a
        // screen down, and the front page of the settings is the worst one to lose.
        if (iconsAreReal) {
            Fingerprint(definingClass = ALERTS_CLASS_DESCRIPTOR, name = "iconsAreThere")
                .method.returnEarly(true)
        }

        // The chevron and the cross live in a layout the row is given, and that layout only
        // exists while the row is being bound to a view — which happens later than the screen
        // loading, and happens again every time the row scrolls back into sight. So this is
        // called as the row draws, for every row of this kind there is; anything that is not
        // one of ours is left alone at the first line.
        //
        // Injected at the start, where the two parameters are certainly still the two
        // parameters. Putting it before the final return instead is what the colouring would
        // want — the colour these are tinted with is the one Sync gives the title, and it
        // gives it in this method — and it does not work: the holder's register is reused for
        // its own itemView two instructions from the end, so the call is handed a View where
        // a holder is declared and the class fails to verify the moment the settings open.
        // The extension waits for the row to be laid out before it reads that colour instead.
        if (widgetsAreReal) {
            Fingerprint(
                parameters = listOf("Landroidx/preference/h;"),
                returnType = "V",
                custom = { method, classDef ->
                    classDef.type.endsWith("SyncPreference;") && method.name == "S"
                },
            ).method.apply {
                addInstructions(
                    0,
                    "invoke-static { p0, p1 }, $ALERTS_CLASS_DESCRIPTOR->$DRAW_ROW_METHOD",
                )
            }
        }

        // Sync's settings screens are its own fragments, so there is nowhere of ours to run
        // from. Done as a screen finishes loading its rows, which every screen passes through;
        // a screen without these rows is left alone.
        Fingerprint(
            definingClass = SETTINGS_SCREEN,
            name = "t3",
            parameters = listOf("I"),
            returnType = "V",
        ).method.apply {
            addInstructions(
                instructions.count() - 1,
                "invoke-static { p0 }, $ALERTS_CLASS_DESCRIPTOR->$SETTLE_METHOD",
            )
        }
    }
}
