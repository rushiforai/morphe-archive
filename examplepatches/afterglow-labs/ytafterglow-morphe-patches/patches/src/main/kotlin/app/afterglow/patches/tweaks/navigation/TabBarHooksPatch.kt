/*
 * YTAfterglow for Android.
 *
 * Hooks adapted from Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3),
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3): the Navigation bar patch (labels, new content dot, translucent bar flags).
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube 21.43.523 and driven by the
 * iOS settings. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction

internal const val TAB_BAR_HOOKS = "$EXTENSION_PACKAGE/navigation/TabBarHooks;"

/**
 * Hooks of the iOS "Tab bar" settings on YouTube's bottom bar: removeLabels, removeIndicators
 * and frostedPivot. Used by the named "Tab bar" patch.
 *
 * Not ported yet, for a later batch: composing the bar from Afterglow's tab list (activeTabs,
 * with the History, Library, Posts, Explore/Hype, Messages and Afterglow tabs), twoRowTabBar and
 * the side anchors. Composition needs the pivot bar list hook (`Lnav`/`PivotBarRendererList`:
 * the list of tab items, whose renderers are protobuf messages read through
 * `MessageLite.toByteArray()`), a small protobuf reader/writer in the extension to read each
 * tab's pivot identifier and to clone Home's item with another browse id, title and icon, YouTube's
 * item factory (`Lj$/util/Optional;`-returning, literal 117501096) to build them, and a click
 * listener on the Afterglow tab's view (the image-resource tab hook of 21.43) that starts
 * AfterglowActivity. The bonus row and anchors need a second row view laid out inside
 * `bottom_bar_container` (`InitializeBottomBarContainerFingerprint`), and their taps a command router.
 */
internal val tabBarHooksPatch = bytecodePatch(
    description = "Hooks YouTube's tab bar for the Afterglow Tab bar settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        TabLabelFingerprint.let {
            val index = it.instructionMatches.first().index
            val label = it.method.instruction<FiveRegisterInstruction>(index).registerC
            it.method.addInstructionsAtControlFlowLabel(
                index,
                invokeStatic(label, method = "$TAB_BAR_HOOKS->tabLabel(Landroid/widget/TextView;)V"),
            )
        }

        TabViewFingerprint.let {
            val index = it.instructionMatches[0].index
            val tab = it.method.instruction<FiveRegisterInstruction>(it.instructionMatches[1].index).registerC
            it.method.addInstructionsAtControlFlowLabel(
                index,
                invokeStatic(tab, method = "$TAB_BAR_HOOKS->tabCreated(Landroid/view/View;)V"),
            )
        }

        FrostedTabBarFlagFingerprint.matchAll().forEach { match ->
            literalLoads(match.method, 45630927L).reversed().forEach { index ->
                match.method.overrideFlagRead(index, "$TAB_BAR_HOOKS->frostedBar(Z)Z")
            }
        }
    }
}
