/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1823
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.music.misc.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.music.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.utils.extension.hooks.applicationInitHook
import app.morphe.patches.music.utils.extension.sharedExtensionPatch
import app.morphe.patches.music.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.music.utils.patch.PatchList.NETWORK_PROXY
import app.morphe.patches.music.utils.settings.CategoryType
import app.morphe.patches.music.utils.settings.ResourceUtils
import app.morphe.patches.music.utils.settings.ResourceUtils.updatePatchStatus
import app.morphe.patches.music.utils.settings.settingsPatch
import app.morphe.patches.shared.mainactivity.getMainActivityMethod
import app.morphe.patches.shared.misc.proxy.EXTENSION_CLASS
import app.morphe.patches.shared.misc.proxy.hookCronetProxy
import app.morphe.patches.shared.misc.settings.preference.InputType
import app.morphe.util.Utils.printWarn
import app.morphe.util.adoptChild
import org.w3c.dom.Element

@Suppress("unused")
val networkProxyPatch = bytecodePatch(
    NETWORK_PROXY.title,
    NETWORK_PROXY.summary,
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        mainActivityResolvePatch,
    )

    execute {
        // 8.x has no Cronet proxy API. 9.15 is the oldest supported version that has it.
        if (!hookCronetProxy()) {
            printWarn(
                "\"${NETWORK_PROXY.title}\" is not supported in this version. Use YouTube Music 9.15 or newer."
            )
            return@execute
        }

        // Extension requests made before the first Cronet engine is built also use the proxy.
        // The Application hook goes after the extension context hook, which is at index 0, because
        // the Spoof video streams hook inserted after it needs the context.
        applicationInitHook.fingerprint.method
            .addInstruction(1, "invoke-static { }, $EXTENSION_CLASS->initialize()V")
        getMainActivityMethod("onCreate")
            .addInstruction(0, "invoke-static { }, $EXTENSION_CLASS->initialize()V")

        addProxyPreferenceScreen()
        updatePatchStatus(NETWORK_PROXY)
    }
}

private fun addProxyPreferenceScreen() {
    ResourceUtils.addPreferenceCategory(CategoryType.MISC.value)
    ResourceUtils.editPreferenceCategory(CategoryType.MISC.value) {
        adoptChild(ResourceUtils.PREFERENCE_SCREEN_TAG_NAME) {
            setAttribute("android:key", "morphe_proxy_screen")
            setAttribute("android:title", "@string/morphe_proxy_screen_title")
            setAttribute("android:summary", "@string/morphe_proxy_screen_summary")

            addProxySwitch("morphe_proxy_enabled")
            addProxyText("morphe_proxy_host")
            addProxyText("morphe_proxy_port", InputType.NUMBER)
            addProxySwitch("morphe_proxy_https")
            addProxySwitch("morphe_proxy_auth_enabled")
            addProxyText("morphe_proxy_auth_username")
            addProxyText("morphe_proxy_auth_password", InputType.TEXT_PASSWORD)
            addProxySwitch("morphe_proxy_allow_direct_fallback")
        }
    }
}

private fun Element.addProxySwitch(key: String) = adoptChild(ResourceUtils.SWITCH_PREFERENCE_TAG_NAME) {
    setAttribute("android:key", key)
    setAttribute("android:title", "@string/${key}_title")
    setAttribute("android:summary", "@string/${key}_summary")
    setAttribute("android:defaultValue", "false")
}

private fun Element.addProxyText(key: String, inputType: InputType = InputType.TEXT) =
    adoptChild(ResourceUtils.TEXT_PREFERENCE_TAG_NAME) {
        setAttribute("android:key", key)
        setAttribute("android:title", "@string/${key}_title")
        setAttribute("android:summary", "@string/${key}_summary")
        setAttribute("android:inputType", inputType.type)
    }
