package app.zonghome.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringsOption
import com.android.tools.smali.dexlib2.Opcode

private const val STYLE = "Lapp/zonghome/extension/NavigationStyle;"
internal val navigationStyleHook = bytecodePatch {
    dependsOn(sharedExtensionPatch)
    execute {
        val method = Fingerprint(
            definingClass = "Lcom/zong/customercare/HomeActivity;", name = "onCreate",
            returnType = "V", parameters = listOf("Landroid/os/Bundle;")
        ).method
        val exits = method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
        check(exits.isNotEmpty()) { "Missing HomeActivity normal return" }
        for (index in exits.reversed()) method.addInstruction(index,
            "invoke-static/range {p0 .. p0}, $STYLE->install(Landroid/app/Activity;)V")
        method.addInstruction(0, "invoke-static/range {p0 .. p1}, $STYLE->prepareStartup(Landroid/app/Activity;Landroid/os/Bundle;)V")
    }
}

private fun styleSwitch(title: String, detail: String, config: String, enabledByDefault: Boolean = true) = bytecodePatch(
    name = title, description = detail, default = enabledByDefault
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook)
    execute {
        Fingerprint(definingClass = STYLE, name = config, returnType = "Z", parameters = emptyList())
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

val iconOnlyBottomNavigationPatch = styleSwitch(
    "Hide bottom navigation labels", "Show only icons in bottom navigation.", "iconOnly"
)
val materialAllowanceIconsPatch = styleSwitch(
    "Material allowance icons", "Use Material accent colors on Home and Usage allowance icons.", "coloredAllowances"
)
val customizeHeaderPatch = bytecodePatch(
    name = "Customize header", description = "Choose header items to hide.", default = true
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook)
    val choices = listOf("Notifications", "Menu", "Refresh", "Search", "Greeting")
    val hidden by stringsOption(
        key = "headerItemsToHide", title = "Header items to hide", default = choices,
        description = "Available names: Notifications, Menu, Refresh, Search, Greeting. An empty list keeps all items.",
        required = true, validator = { values -> values != null && values.all { it in choices } }
    )
    execute {
        val value = requireNotNull(hidden).distinct().joinToString("|")
        Fingerprint(definingClass = STYLE, name = "hiddenHeaderItems", returnType = "Ljava/lang/String;", parameters = emptyList())
            .method.addInstructions(0, "const-string v0, \"$value\"\nreturn-object v0")
    }
}

val materialShapesPatch = bytecodePatch(
    name = "Material shapes", description = "Rounded Home and Usage cards, pill primary buttons and softer dialogs.", default = true
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook, dialogWindowThemePatch, rowStylingPatch)
    execute {
        Fingerprint(definingClass = STYLE, name = "shapes", returnType = "Z", parameters = emptyList())
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
val hideUsageTabPatch = styleSwitch("Hide Usage bottom tab", "Hide Usage from bottom navigation.", "hideUsage", false)
val hideBundlesTabPatch = styleSwitch("Hide Bundles bottom tab", "Hide Bundles from bottom navigation.", "hideBundles", false)
val hideBottomNavigationPatch = styleSwitch("Hide bottom navigation", "Hide the entire bottom navigation bar.", "hideNavigation", false)
val leftHeaderTitlesPatch = styleSwitch("Left align header titles", "Align header titles to the start edge.", "leftTitles", false)
val homeHeaderTitlePatch = styleSwitch("Show Home header title", "Show Home when the greeting is hidden.", "homeTitle")
val homeBundlesShortcutPatch = styleSwitch("Home header Bundles shortcut", "Show a Bundles icon on Home when its bottom tab or the entire bottom bar is hidden.", "bundlesShortcut")
val homeFreeMbsShortcutPatch = styleSwitch("Home header Free MBs shortcut", "Open daily rewards from a Home header icon.", "freeMbsShortcut", false)
val hideHomeShortcutsCardPatch = bytecodePatch(
    name = "Hide home shortcuts card", description = "Hide the entire Home shortcuts card.", default = false
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook, initialHomeVisibility("hideShortcutCard"))
    execute {
        Fingerprint(definingClass = STYLE, name = "hideShortcutCard", returnType = "Z", parameters = emptyList())
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

private fun homeControl(title: String, detail: String, config: String, selected: Boolean) = bytecodePatch(
    name = title, description = detail, default = selected
) {
    compatibleWith(myZongCompatibility)
    dependsOn(navigationStyleHook, initialHomeVisibility(config))
    execute {
        Fingerprint(definingClass = STYLE, name = config, returnType = "Z", parameters = emptyList())
            .method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}
val hideHomeSmsCardPatch = homeControl("Hide Home SMS card", "Let remaining MB and minutes cards share the row.", "hideSmsCard", true)
val hideHomeTariffPatch = homeControl("Hide Home tariff line", "Hide the package name below the balance expiry line.", "hideTariff", false)
val hideHomeLoanButtonPatch = homeControl("Hide Home loan button", "Hide the Home loan button while keeping the header shortcut available.", "hideLoanButton", false)
val homeLoanShortcutPatch = styleSwitch("Home header loan shortcut", "Use the existing take/pay loan action from a Home header icon.", "loanShortcut")

val startOnUsagePatch = styleSwitch("Start on Usage", "Open Usage on a fresh launch after sign-in, retaining Back navigation to Home.", "startOnUsage", false)