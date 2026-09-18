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

private const val EXTENSION = "Lapp/morphe/extension/tiktok/privacy/BrowserPrivacyGuard;"
private const val WEB_VIEW = "Landroid/webkit/WebView;"
private const val ADD_INTERFACE = "->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V"

@Suppress("unused")
val browserPrivacyGuardPatch = bytecodePatch(
    name = "In-app browser privacy guard",
    description = "Can stop TikTok's in-app browser handing its JavaScript bridge to the pages it loads. Most of TikTok's own web pages need that bridge, including the shop checkout and the CAPTCHA page, so the switch is off until you turn it on. Switch: Hushfeed settings > Privacy.",
    default = false,
) {
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4623())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableBrowserPrivacyGuard()V",
        )

        // TikTok wraps WebView in a subclass of its own that overrides addJavascriptInterface
        // and calls super, and three of the sites call the override by the subclass's name. The
        // subclass is found rather than named, because its name changes with every build. The
        // invoke-super inside the override is left alone: it is the pass-through path, and
        // rewriting it to a static that dispatches virtually again would recurse.
        val webViewTypes = mutableSetOf(WEB_VIEW)
        var grew = true
        while (grew) {
            grew = false
            classDefForEach { classDef ->
                if (classDef.superclass in webViewTypes && webViewTypes.add(classDef.type)) grew = true
            }
        }
        val replacement = "$EXTENSION->filterJsInterface(${WEB_VIEW}Ljava/lang/Object;Ljava/lang/String;)V"
        val replacements = webViewTypes.associate { type -> "$type$ADD_INTERFACE" to replacement }
        val sites = invokeSitesOf(replacements.keys)
        if (sites.isEmpty()) {
            throw PatchException("In-app browser privacy guard: no addJavascriptInterface call site was found.")
        }
        replaceSites(sites, replacements)
        println("[Browser privacy guard] Intercepted ${sites.size} WebView JS interface sites across ${webViewTypes.size} WebView types.")
    }
}
