/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.smartlife

import app.fakh.patches.smartlife.shared.Constants.COMPATIBILITY_KRISBOW
import app.fakh.patches.smartlife.shared.Constants.HIDE_BACKGROUND
import app.fakh.patches.smartlife.shared.Constants.HIDE_DISCOVERY
import app.fakh.patches.smartlife.shared.Constants.HIDE_DISCOVERY_TAB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** The adapter of the mini-app card that the Tuya cloud fills with a section of the home list; 0 items hides it. */
private object MiniAppCardCountFingerprint : Fingerprint(
    definingClass = "Lcom/gzl/smart/gzlminiapp/widget/dpc/MiniAppDPCProvider\$EmptyAdapter;",
    name = "getItemCount",
    returnType = "I",
    parameters = emptyList(),
)

/** The same for the widget provider, the other way the home list hosts a mini-app card. */
private object WidgetCardCountFingerprint : Fingerprint(
    definingClass = "Lcom/gzl/smart/gzlminiapp/widget/dpc/GZLWidgetDPCProvider\$GZLWidgetDPCAdapter;",
    name = "getItemCount",
    returnType = "I",
    parameters = emptyList(),
)

/** The home theme's root transformer: for the background styles it wraps the original drawable with the image. */
private object RootBackgroundFingerprint : Fingerprint(
    definingClass = "Lcom/thingclips/smart/home/theme/transformer/HomeRootViewTransformer;",
    name = "transform",
    returnType = "Landroid/graphics/drawable/Drawable;",
)

@Suppress("unused")
val hideDiscoveryTabPatch = patch(
    name = "Hide Discovery tab",
    description = "Removes the Discovery tab from the navigation bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KRISBOW)
    category("Layout")
    dependsOn(tabFilterPatch, switchRow(HIDE_DISCOVERY_TAB), settingsSwitchesPatch)
}

@Suppress("unused")
val hideDiscoveryPatch = patch(
    name = "Hide Discovery",
    description = "Removes the \"Discovery\" article cards from the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KRISBOW)
    category("Layout")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow(HIDE_DISCOVERY), settingsSwitchesPatch)

    execute {
        listOf(MiniAppCardCountFingerprint, WidgetCardCountFingerprint).forEach {
            it.method.whenSwitchOn("fakh_hide_discovery", "const/4 v0, 0x0\nreturn v0")
        }
    }
}

@Suppress("unused")
val hideBackgroundPatch = patch(
    name = "Hide background image",
    description = "Removes the picture behind the Home and Scene tabs and leaves the plain theme color.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KRISBOW)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(switchRow(HIDE_BACKGROUND), settingsSwitchesPatch)

    execute {
        RootBackgroundFingerprint.method.apply {
            val returns = implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            if (returns.isEmpty()) throw PatchException("Smart Life: HomeRootViewTransformer.transform has no return")
            // transform(theme, style, dark, data): p4 is the plain drawable. The returned register is only read, so
            // it can take the answer of the extension, which is p4 while the switch is on.
            returns.reversed().forEach {
                val register = (it.value as OneRegisterInstruction).registerA
                addInstructions(
                    it.index,
                    """
                        invoke-static { v$register, p4 }, Lapp/fakh/extension/smartlife/Switches;->background(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, Landroid/graphics/drawable/Drawable;
                    """,
                )
            }
        }
    }
}
