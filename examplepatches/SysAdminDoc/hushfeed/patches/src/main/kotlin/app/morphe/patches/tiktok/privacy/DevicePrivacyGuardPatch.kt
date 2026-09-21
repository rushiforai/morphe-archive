/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/DevicePrivacyGuard;"
private const val CLIPBOARD = "Landroid/content/ClipboardManager;"

@Suppress("unused")
val devicePrivacyGuardPatch = bytecodePatch(
    name = "Device privacy guard",
    description = "Blocks TikTok from reading your clipboard. Copying a link you asked for still works. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableDevicePrivacyGuard()V",
        )

        // One replacement per signature. A single intercept returning ClipData for all three
        // put a ClipData where getText's CharSequence and hasPrimaryClip's boolean were
        // expected, which the verifier rejects as soon as the class loads.
        val replacements = mapOf(
            "$CLIPBOARD->getPrimaryClip()Landroid/content/ClipData;" to
                "$EXTENSION->interceptPrimaryClip($CLIPBOARD)Landroid/content/ClipData;",
            "$CLIPBOARD->getText()Ljava/lang/CharSequence;" to
                "$EXTENSION->interceptClipboardText($CLIPBOARD)Ljava/lang/CharSequence;",
            "$CLIPBOARD->hasPrimaryClip()Z" to
                "$EXTENSION->interceptHasPrimaryClip($CLIPBOARD)Z",
        )
        val sites = invokeSitesOf(replacements.keys)
        if (sites.isEmpty()) {
            throw PatchException("Device privacy guard: no clipboard read call site was found.")
        }
        replaceSites(sites, replacements)
        println("[Device privacy guard] Intercepted ${sites.size} clipboard read sites.")
    }
}
