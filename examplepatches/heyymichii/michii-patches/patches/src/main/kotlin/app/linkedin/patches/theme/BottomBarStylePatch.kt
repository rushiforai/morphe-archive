package app.linkedin.patches.theme

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

/** Material icon outlines (24dp): (selected, unselected) path data, from Google's Material Icons (Apache 2.0). */
private object MaterialIcons {
    const val HOME = "M10,20v-6h4v6h5v-8h3L12,3 2,12h3v8z"
    const val HOME_OUTLINE = "M12,5.69l5,4.5V18h-2v-6H9v6H7v-7.81l5,-4.5M12,3L2,12h3v8h6v-6h2v6h6v-8h3L12,3z"
    const val PEOPLE = "M16,11c1.66,0 2.99,-1.34 2.99,-3S17.66,5 16,5c-1.66,0 -3,1.34 -3,3s1.34,3 3,3zM8,11c1.66,0 " +
        "2.99,-1.34 2.99,-3S9.66,5 8,5C6.34,5 5,6.34 5,8s1.34,3 3,3zM8,13c-2.33,0 -7,1.17 -7,3.5L1,19h14v-2.5c0," +
        "-2.33 -4.67,-3.5 -7,-3.5zM16,13c-0.29,0 -0.62,0.02 -0.97,0.05 1.16,0.84 1.97,1.97 1.97,3.45L17,19h6v-2.5c0," +
        "-2.33 -4.67,-3.5 -7,-3.5z"
    const val PEOPLE_OUTLINE = "M9,13.75c-2.34,0 -7,1.17 -7,3.5L2,19h14v-1.75c0,-2.33 -4.66,-3.5 -7,-3.5zM4.34,17c0.84," +
        "-0.58 2.87,-1.25 4.66,-1.25s3.82,0.67 4.66,1.25L4.34,17zM9,12c1.93,0 3.5,-1.57 3.5,-3.5S10.93,5 9,5 5.5," +
        "6.57 5.5,8.5 7.07,12 9,12zM9,7c0.83,0 1.5,0.67 1.5,1.5S9.83,10 9,10s-1.5,-0.67 -1.5,-1.5S8.17,7 9,7zM16.04," +
        "13.81c1.16,0.84 1.96,1.96 1.96,3.44L18,19h4v-1.75c0,-2.02 -3.5,-3.17 -5.96,-3.44zM15,12c1.93,0 3.5,-1.57 " +
        "3.5,-3.5S16.93,5 15,5c-0.54,0 -1.04,0.13 -1.5,0.35 0.63,0.89 1,1.98 1,3.15s-0.37,2.26 -1,3.15c0.46,0.22 " +
        "0.96,0.35 1.5,0.35z"
    const val BELL = "M12,22c1.1,0 2,-0.9 2,-2h-4c0,1.1 0.89,2 2,2zM18,16v-5c0,-3.07 -1.64,-5.64 -4.5,-6.32L13.5,4c0," +
        "-0.83 -0.67,-1.5 -1.5,-1.5s-1.5,0.67 -1.5,1.5v0.68C7.63,5.36 6,7.92 6,11v5l-2,2v1h16v-1l-2,-2z"
    const val BELL_OUTLINE = "M12,22c1.1,0 2,-0.9 2,-2h-4c0,1.1 0.9,2 2,2zM18,16v-5c0,-3.07 -1.63,-5.64 -4.5,-6.32L13.5," +
        "4c0,-0.83 -0.67,-1.5 -1.5,-1.5s-1.5,0.67 -1.5,1.5v0.68C7.64,5.36 6,7.92 6,11v5l-2,2v1h16v-1l-2,-2zM16,17L8," +
        "17v-6c0,-2.48 1.51,-4.5 4,-4.5s4,2.02 4,4.5v6z"
    const val WORK = "M20,6h-4L16,4c0,-1.11 -0.89,-2 -2,-2h-4c-1.11,0 -2,0.89 -2,2v2L4,6c-1.11,0 -1.99,0.89 -1.99," +
        "2L2,19c0,1.11 0.89,2 2,2h16c1.11,0 2,-0.89 2,-2L22,8c0,-1.11 -0.89,-2 -2,-2zM14,6h-4L10,4h4v2z"
    const val WORK_OUTLINE = "M14,6V4h-4v2h4zM4,8v11h16V8H4zM20,6c1.11,0 2,0.89 2,2v11c0,1.11 -0.89,2 -2,2H4c-1.11," +
        "0 -2,-0.89 -2,-2l0.01,-11c0,-1.11 0.88,-2 1.99,-2h4V4c0,-1.11 0.89,-2 2,-2h4c1.11,0 2,0.89 2,2v2h4z"
    const val PLAY = "M12,2C6.48,2 2,6.48 2,12s4.48,10 10,10 10,-4.48 10,-10S17.52,2 12,2zM10,16.5v-9l6,4.5 -6,4.5z"
    const val PLAY_OUTLINE = "M10,16.5l6,-4.5 -6,-4.5v9zM12,2C6.48,2 2,6.48 2,12s4.48,10 10,10 10,-4.48 10,-10S17.52," +
        "2 12,2zM12,20c-4.41,0 -8,-3.59 -8,-8s3.59,-8 8,-8 8,3.59 8,8 -3.59,8 -8,8z"
}

/**
 * The bottom bar's tab icons: selector drawable (used only by the bottom bar's theme attributes) to the
 * (selected, unselected) Material icon. The bar tints the icons itself, so their color does not matter.
 */
private val TAB_ICONS = mapOf(
    "ic_nav_mercado_feed_selector_24dp" to (MaterialIcons.HOME to MaterialIcons.HOME_OUTLINE),
    "ic_nav_mercado_people_selector_24dp" to (MaterialIcons.PEOPLE to MaterialIcons.PEOPLE_OUTLINE),
    "ic_nav_mercado_notifications_selector_24dp" to (MaterialIcons.BELL to MaterialIcons.BELL_OUTLINE),
    "ic_nav_mercado_jobs_selector_24dp" to (MaterialIcons.WORK to MaterialIcons.WORK_OUTLINE),
    "ic_nav_mercado_video_tab_selector_24dp" to (MaterialIcons.PLAY to MaterialIcons.PLAY_OUTLINE),
)

private const val MATERIAL_ICONS_OPTION = "materialIcons"

/** A selector item with a 24dp vector drawable of [path] inline. */
private fun item(state: String, path: String) =
    "    <item$state>\n" +
        "        <vector android:width=\"24dp\" android:height=\"24dp\" android:viewportWidth=\"24\" " +
        "android:viewportHeight=\"24\">\n" +
        "            <path android:fillColor=\"#FFFFFFFF\" android:pathData=\"$path\"/>\n" +
        "        </vector>\n" +
        "    </item>\n"

/**
 * Rewrites the tab selectors with inline Material icons, so no new resource names are needed. Android inflates a
 * selector item's child drawable when the item has no android:drawable.
 */
private val materialTabIconsResourcePatch = resourcePatch {
    execute {
        if (bottomBarStylePatch.options[MATERIAL_ICONS_OPTION].value != true) return@execute
        TAB_ICONS.forEach { (name, icons) ->
            val file = get("res").resolve("drawable").resolve("$name.xml")
            if (!file.exists()) throw PatchException("Tab icon $name not found")
            file.writeText(
                "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                    "<selector xmlns:android=\"http://schemas.android.com/apk/res/android\">\n" +
                    item(" android:state_selected=\"true\"", icons.first) +
                    item("", icons.second) +
                    "</selector>\n"
            )
        }
    }
}

/** SlimNotificationBadge.setBadgeLabelText(String): sets the label under a bottom bar tab's icon. */
private object TabLabelFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimNotificationBadge;",
    name = "setBadgeLabelText",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private const val BAR_STYLE = "$EXTENSION_PACKAGE/BottomBarStyle;"

/** SlimBottomBar.resizeTabsToCorrectSizes(): gives every tab an equal width. */
private object ResizeTabsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomBar;",
    name = "resizeTabsToCorrectSizes",
    returnType = "V",
    parameters = listOf(),
)

/** BottomNavigationIndicatorView.setSelectedIndex(position, animate): moves the line under the selected tab. */
private object IndicatorIndexFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/BottomNavigationIndicatorView;",
    name = "setSelectedIndex",
    returnType = "V",
    parameters = listOf("I", "Z"),
)

/** SlimNotificationBadge.animateEnter(type, animate): shows a tab's count (type 2) or dot (type 1). */
private object BadgeEnterFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimNotificationBadge;",
    name = "animateEnter$1",
    returnType = "V",
    parameters = listOf("I", "Z"),
)

/** Inserts [instruction] before every return-void of the method. */
private fun MutableMethod.beforeReturns(instruction: String) {
    val returns = implementation!!.instructions.withIndex()
        .filter { (_, it) -> it.opcode == Opcode.RETURN_VOID }
        .map { it.index }
    if (returns.isEmpty()) throw PatchException("No return in $name")
    returns.reversed().forEach { addInstruction(it, instruction) }
}

@Suppress("unused")
val bottomBarStylePatch: BytecodePatch = bytecodePatch(
    name = "Bottom bar style",
    description = "Adds switches in Michii Patches to hide bottom bar tabs, their labels and their notification " +
        "badges, and optionally Material icons in the bottom bar (filled when selected, outlined otherwise).",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    dependsOn(settingsPatch, materialTabIconsResourcePatch)

    booleanOption(
        key = MATERIAL_ICONS_OPTION,
        default = false,
        title = "Material icons",
        description = "Replaces LinkedIn's Home, My Network, Notifications, Jobs and Video tab icons with Material " +
            "icons. Chosen when patching.",
    )

    execute {
        TabLabelFingerprint.method.beforeReturns(
            "invoke-static/range { p0 .. p0 }, $BAR_STYLE->onTabLabel(Landroid/view/View;)V"
        )
        ResizeTabsFingerprint.method.apply {
            // The method reuses p0 for other values before it returns, so the bar is passed at its start.
            beforeReturns("invoke-static { }, $BAR_STYLE->onTabsResized()V")
            addInstructions(0, "invoke-static/range { p0 .. p0 }, $BAR_STYLE->onTabsResize(Landroid/view/View;)V")
        }
        IndicatorIndexFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $BAR_STYLE->indicatorIndex(I)I
                move-result p1
            """
        )
        BadgeEnterFingerprint.method.apply {
            // At method entry every local register is free, so v0 can be used as scratch.
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $BAR_STYLE->hideBadge()Z
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", getInstruction(0))
            )
        }
        markIncluded("isBottomBarStyleIncluded")
    }
}
