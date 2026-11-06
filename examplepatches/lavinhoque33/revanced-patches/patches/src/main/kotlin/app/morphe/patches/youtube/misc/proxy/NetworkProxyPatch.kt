/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/1823
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.patches.youtube.misc.proxy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.mainactivity.getMainActivityMethod
import app.morphe.patches.shared.misc.proxy.EXTENSION_CLASS
import app.morphe.patches.shared.misc.proxy.hookCronetProxy
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.hooks.applicationInitHook
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.mainactivity.mainActivityResolvePatch
import app.morphe.patches.youtube.utils.patch.PatchList.NETWORK_PROXY
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.Utils.printWarn

@Suppress("unused")
val networkProxyPatch = bytecodePatch(
    NETWORK_PROXY.title,
    NETWORK_PROXY.summary,
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        mainActivityResolvePatch,
    )

    execute {
        // The Cronet proxy API first shipped in YouTube 20.47.
        if (!hookCronetProxy()) {
            printWarn("\"${NETWORK_PROXY.title}\" is not supported in this version. Use YouTube 20.47 or newer.")
            return@execute
        }

        // Extension requests made before the first Cronet engine is built also use the proxy.
        // The Application hook goes after the extension context hook, which is at index 0, because
        // the Spoof video streams hook inserted after it needs the context.
        applicationInitHook.fingerprint.method
            .addInstruction(1, "invoke-static { }, $EXTENSION_CLASS->initialize()V")
        getMainActivityMethod("onCreate")
            .addInstruction(0, "invoke-static { }, $EXTENSION_CLASS->initialize()V")

        addPreference(
            arrayOf("SETTINGS: NETWORK_PROXY"),
            NETWORK_PROXY
        )
    }
}
