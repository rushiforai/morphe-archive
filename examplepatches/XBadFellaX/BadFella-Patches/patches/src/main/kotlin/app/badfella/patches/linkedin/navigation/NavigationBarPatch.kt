package app.badfella.patches.linkedin.navigation

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.badfella.patches.linkedin.shared.settingsPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/NavigationBar;"
private const val SETTINGS_CLASS = "$EXTENSION_PACKAGE/Settings;"

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

/**
 * The hooks into the bottom bar shared by every patch that changes it: the filter that decides which tabs it has
 * (the More tab is one of them, and the in-app toggles and the Morphe preset both run through it), the same filter
 * at SlimBottomBar.setItems so the bar never builds views for a removed tab, and the point where its tabs are sized.
 */
internal val navigationHooksPatch = bytecodePatch {
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

        // Second guard: a caller that builds its own tab list still gets the same tabs, and the bar's views
        // always match the tabs it shows, so no empty slot is left behind. Optional, so a build that renames or
        // moves setItems still gets the getHomeNavTabs hook above.
        classDefForEach { classDef ->
            if (classDef.type != "Lcom/linkedin/android/home/bottomnav/SlimBottomBar;") return@classDefForEach
            mutableClassDefBy(classDef).methods
                .firstOrNull {
                    it.name == "setItems" && it.returnType == "V" &&
                        it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/util/List;")
                }
                ?.addInstructions(
                    0,
                    """
                        invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->filterTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object p1
                    """
                )
        }

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

/** SlimBottomNavigationBehavior.handleDirection(bar, direction): slides the bottom bar away or back as a screen scrolls. */
private object ScrollDirectionFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomNavigationBehavior;",
    name = "handleDirection",
    returnType = "V",
    parameters = listOf("Lcom/linkedin/android/home/bottomnav/SlimBottomBar;", "I"),
)

/** SlimBottomNavigationBehavior.animateOffset(bar, offset): translates the bottom bar by the offset it is given. */
private object AnimateOffsetFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/bottomnav/SlimBottomNavigationBehavior;",
    name = "animateOffset",
    returnType = "V",
    parameters = listOf("Lcom/linkedin/android/home/bottomnav/SlimBottomBar;", "I"),
)

@Suppress("unused")
val alwaysShowNavigationBarPatch = bytecodePatch(
    name = "Always show navigation bar",
    description = "Adds an option in BadFella Patches to keep the navigation bar on screen while you scroll.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation")
    dependsOn(settingsPatch)
    execute {
        markIncluded("isAlwaysShowNavigationBarIncluded")
        // The bar is only ever slid away from here, so skipping it keeps the bar where it is.
        ScrollDirectionFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $SETTINGS_CLASS->alwaysShowNavigationBar()Z
                    move-result v0
                    if-eqz v0, :scroll
                    return-void
                """,
                ExternalLabel("scroll", getInstruction(0))
            )
        }
    }
}

@Suppress("unused")
val navigationBarPatch = bytecodePatch(
    name = "Navigation bar",
    description = "Adds options (turned on in BadFella Patches) to hide the More, Jobs, Network and Notifications " +
        "tabs of the navigation bar, its count badges and its labels.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation")
    dependsOn(navigationHooksPatch)
    execute { markIncluded("isNavigationBarIncluded") }
}

@Suppress("unused")
val swipeTabsPatch = bytecodePatch(
    name = "Swipe between tabs",
    description = "Swipe sideways to go to the next or previous tab of the navigation bar.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation")
    dependsOn(navigationHooksPatch)
    execute { markIncluded("isSwipeTabsIncluded") }
}

@Suppress("unused")
val glassNavigationBarPatch = bytecodePatch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a spring selection pill and no press ripple.",
    default = false
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Theme")
    dependsOn(navigationHooksPatch)
    execute {
        markIncluded("isGlassNavigationBarIncluded")
        // The padding that floats the capsule makes the bar taller than its tab row, so the stock
        // offset would leave the lower half of the bar on screen when a scroll hides it.
        AnimateOffsetFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1, p2 }, $EXTENSION_CLASS->slideOffset(Landroid/view/View;I)I
                move-result p2
            """
        )
    }
}

/** Indices of all instructions with the opcode, last first so edits keep earlier indices valid. */
internal fun MutableMethod.returnIndices(opcode: Opcode) =
    implementation!!.instructions.withIndex().filter { it.value.opcode == opcode }.map { it.index }.reversed()
