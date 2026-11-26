/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.navigation

import app.fakh.patches.linkedin.shared.Constants.ALWAYS_SHOW_NAVIGATION_BAR
import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.GLASS_NAVIGATION_BAR
import app.fakh.patches.linkedin.shared.Constants.HIDE_TAB_BADGES
import app.fakh.patches.linkedin.shared.Constants.HIDE_TAB_LABELS
import app.fakh.patches.linkedin.shared.Constants.LIQUID_GLASS
import app.fakh.patches.linkedin.shared.Constants.SWIPE_TABS
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/NavigationBar;"

/** HomeNavTabsManager.getHomeNavTabs(): the tabs of the bottom bar. */
private object HomeNavTabsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeNavTabsManager;",
    name = "getHomeNavTabs",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/** SlimBottomBar.resizeTabsToCorrectSizes(): gives the tabs of the bottom bar their widths. */
private object TabsSizedFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomBar;",
    name = "resizeTabsToCorrectSizes",
    returnType = "V",
    parameters = emptyList(),
)

/** SlimBottomBar.onClick(View): a tap on one of the tabs of the bottom bar. */
private object TabClickFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomBar;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)

/** MediaCachedLix.isVideoTabSduiScreenEnabled(): whether the Video tab opens the server-driven video screen. */
private object VideoTabScreenFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/media/framework/MediaCachedLix;",
    name = "isVideoTabSduiScreenEnabled",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * The only two hooks into the bottom bar, shared by every patch that changes it: the filter that decides which tabs
 * it has (the More tab is one of them) and the point where its tabs have been sized.
 */
internal val navigationHooksPatch = patch {
    dependsOn(settingsPatch)

    execute {
        // Each return is replaced in place (rather than code inserted before it) because branches
        // may jump straight to the return instruction and would skip inserted code.
        HomeNavTabsFingerprint.method.apply {
            returnIndices(Opcode.RETURN_OBJECT).forEach { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    "invoke-static/range { v$register .. v$register }, " +
                        "$EXTENSION_CLASS->filterTabs(Ljava/util/List;)Ljava/util/List;"
                )
                addInstructions(
                    index + 1,
                    """
                        move-result-object v$register
                        return-object v$register
                    """
                )
            }
        }

        // The Messaging tab is a screen of its own in LinkedIn, not a fragment of the home pager: a tap on it opens
        // that screen the way the button of the top bar does, and the selection stays where it was.
        TabClickFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION_CLASS->interceptTabClick(Landroid/view/View;Landroid/view/View;)Z
                move-result v0
                if-eqz v0, :click
                return-void
            """,
            ExternalLabel("click", TabClickFingerprint.method.getInstruction(0)),
        )

        // The method reuses the register of the bar before it returns, so the bar is taken at the start.
        TabsSizedFingerprint.method.apply {
            returnIndices(Opcode.RETURN_VOID).forEach { index ->
                replaceInstruction(index, "invoke-static { }, $EXTENSION_CLASS->onTabsSized()V")
                addInstruction(index + 1, "return-void")
            }
            addInstruction(0, "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->beforeTabsSized(Landroid/view/View;)V")
        }
    }
}

@Suppress("unused")
val navigationBarPatch = patch(
    name = "Navigation bar",
    description = "Lets you choose the navigation bar tabs, including Post, Video, News and Messaging, and hide its " +
        "count badges and labels. In Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feature")
    dependsOn(navigationHooksPatch)
    execute {
        register(HIDE_TAB_LABELS, HIDE_TAB_BADGES)
        VideoTabScreenFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->useServerVideoScreen()Z
                    move-result v0
                    if-eqz v0, :stock
                    return v0
                """,
                ExternalLabel("stock", getInstruction(0)),
            )
        }
    }
}

@Suppress("unused")
val swipeTabsPatch = patch(
    name = "Swipe between tabs",
    description = "Swipe sideways to switch tabs of the navigation bar.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feature")
    dependsOn(navigationHooksPatch)
    execute { register(SWIPE_TABS) }
}

@Suppress("unused")
val glassNavigationBarPatch = patch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. Slide a finger along it to switch tabs. Adds a Background blur switch in Fakh Patches.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")
    dependsOn(navigationHooksPatch)
    execute { register(GLASS_NAVIGATION_BAR, LIQUID_GLASS) }
}

/** SlimBottomNavigationBehavior.handleDirection(bar, direction): slides the bottom bar away or back as a screen scrolls. */
private object ScrollDirectionFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomNavigationBehavior;",
    name = "handleDirection",
    returnType = "V",
    parameters = listOf("Lcom/linkedin/android/home/bottomnav/SlimBottomBar;", "I"),
)

@Suppress("unused")
val alwaysShowNavigationBarPatch = patch(
    name = "Always show navigation bar",
    description = "Adds an option in Fakh Patches to keep the navigation bar on screen while you scroll.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feature")
    dependsOn(settingsPatch)
    execute {
        register(ALWAYS_SHOW_NAVIGATION_BAR)
        // The bar is only ever slid away from here, so skipping it keeps the bar where it is.
        ScrollDirectionFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_PACKAGE/Settings;->alwaysShowNavigationBar()Z
                    move-result v0
                    if-eqz v0, :scroll
                    return-void
                """,
                ExternalLabel("scroll", getInstruction(0)),
            )
        }
    }
}

/** Indices of all instructions with the opcode, last first so edits keep earlier indices valid. */
internal fun MutableMethod.returnIndices(opcode: Opcode) =
    implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed()
