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
 * NativeTabsPatch composes the items and rows. The layout hook here keeps icon-only native
 * items and generated labelled items on the same native geometry, including avatar tabs.
 */
internal val tabBarHooksPatch = bytecodePatch(
    description = "Hooks YouTube's tab bar for the Afterglow Tab bar settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        TabLayoutFingerprint.let {
            val index = it.instructionMatches.first().index
            val inflate = it.method.instruction<FiveRegisterInstruction>(index)
            it.method.addInstructionsAtControlFlowLabel(
                index,
                """
                    ${invokeStatic(inflate.registerD, inflate.registerE, method = "$TAB_BAR_HOOKS->tabLayout(ILandroid/view/ViewGroup;)I")}
                    move-result v${inflate.registerD}
                """.trimIndent(),
            )
        }

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
