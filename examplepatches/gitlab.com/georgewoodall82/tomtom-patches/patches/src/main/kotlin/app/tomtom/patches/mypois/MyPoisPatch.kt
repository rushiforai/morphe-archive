package app.tomtom.patches.mypois

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.tomtom.patches.mypois.Constants.COMPATIBILITY_TOMTOM_GO
import com.android.tools.smali.dexlib2.Opcode

private const val HOOKS_CLASS = "Lapp/mypois/extension/MyPoisHooks;"
private const val ACTIVITY_CLASS = "app.mypois.extension.MyPoisActivity"

private const val MENU_ITEM_ID = "com.tomtom.navui.stocknavapp/mypois"
private const val MENU_LABEL_RESOURCE = "mypois_menu_label"

/**
 * The app copies the menu into a database on first run and only rebuilds it when the menu definition
 * version changes (in either direction). Raising it makes an install over an earlier build, or any
 * install whose database was already created, pick up the new item. Increase this when the item changes.
 */
private const val MENU_VERSION_OFFSET = 102

/**
 * Adds the "My POIs" entry to the main menu, under "My Places", and registers the screen it opens.
 *
 * The menu is declared in res/xml/main_menu.xml (and default_main_menu.xml). The entry uses the app's
 * "LaunchExternal" action with a marker link, which the bytecode patch below intercepts.
 */
private val myPoisResourcePatch = resourcePatch {
    execute {
        // 1. Label.
        val strings = get("res/values/strings.xml")
        strings.writeText(
            strings.readText().replace(
                "</resources>",
                "    <string name=\"$MENU_LABEL_RESOURCE\">My POIs</string>\n</resources>"
            )
        )

        // 2. Menu item, placed right under "My Places" in the main menu. The existing item is cloned
        //    so it keeps every attribute the menu expects (including its icons), then the identifying
        //    ones are replaced. The app falls back to default_main_menu.xml when no external menu
        //    package is configured, so both menu definitions get the item.
        for (menuFile in listOf("res/xml/main_menu.xml", "res/xml/default_main_menu.xml")) {
            document(menuFile).use { document ->
                val menuRoot = document.documentElement
                val version = menuRoot.getAttribute("tomtom:navui_menuDefinitionVersion").toInt()
                menuRoot.setAttribute("tomtom:navui_menuDefinitionVersion", (version + MENU_VERSION_OFFSET).toString())

                val items = document.getElementsByTagName("item")
                var myPlaces: org.w3c.dom.Element? = null
                for (i in 0 until items.length) {
                    val element = items.item(i) as org.w3c.dom.Element
                    if (myPlaces == null && element.getAttribute("tomtom:navui_menuItemId").endsWith("stocknavapp/myplaces")) {
                        myPlaces = element
                    }
                }
                requireNotNull(myPlaces) { "Main menu item 'myplaces' not found in $menuFile" }

                val item = myPlaces.cloneNode(true) as org.w3c.dom.Element
                // "\\@" is how the decoded XML spells a literal "@" at the start of a string value.
                item.setAttribute("tomtom:navui_label", "\\@string/$MENU_LABEL_RESOURCE")
                // Marker link; LaunchExternal is intercepted below and opens the screen directly.
                item.setAttribute("tomtom:navui_menuActionUri", "action://LaunchExternal/mypois")
                item.setAttribute("tomtom:navui_menuHumanReadableName", "My POIs")
                item.setAttribute("tomtom:navui_menuItemId", MENU_ITEM_ID)
                myPlaces.parentNode.insertBefore(item, myPlaces.nextSibling)
            }
        }

        // 3. The activity.
        document("AndroidManifest.xml").use { document ->
            val activity = document.createElement("activity").apply {
                setAttribute("android:name", ACTIVITY_CLASS)
                setAttribute("android:exported", "false")
                setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
                setAttribute("android:windowSoftInputMode", "adjustResize")
            }
            document.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }
}

@Suppress("unused")
val myPoisPatch = bytecodePatch(
    name = "My POIs",
    description = "Adds a \"My POIs\" screen to the main menu, under My Places: named folders of saved places, kept separate " +
        "from My Places. Places can be added from My Places or from any point on the map " +
        "(\"Add to My POIs\" button).",
    default = true
) {
    compatibleWith(COMPATIBILITY_TOMTOM_GO)

    dependsOn(myPoisResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // Main menu entry: open the My POIs screen instead of parsing the link as an intent URI.
        LaunchExternalFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $HOOKS_CLASS->interceptLaunchExternal(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :mypois_continue
                return v0
                :mypois_continue
                nop
            """
        )

        // Read-only copy of My Places for the "Add from My Places" picker.
        MyPlacesLoadedFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $HOOKS_CLASS->onMyPlaces(Ljava/util/List;)V"
        )

        // "Add to My POIs" button next to "Add to My Places" on the map popup (home screen) and on the
        // location preview screen. The directive bar is remembered at the start (its register is reused
        // by the app later in the method), and the button is added just before the method returns.
        // The /range form is needed because on the home screen "this" is above register v15.
        listOf(HomeScreenDirectivesFingerprint, PreviewScreenDirectivesFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                val lastReturn = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
                require(lastReturn >= 0) { "No return-void in $name directive setup" }
                addInstructionsAtControlFlowLabel(lastReturn, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->addDirective(Ljava/lang/Object;)V")
                addInstructions(0, "invoke-static/range { p0 .. p1 }, $HOOKS_CLASS->beginDirectives(Ljava/lang/Object;Ljava/lang/Object;)V")
            }
        }
    }
}
