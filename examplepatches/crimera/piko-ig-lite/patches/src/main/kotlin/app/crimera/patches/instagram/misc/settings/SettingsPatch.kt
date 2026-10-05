/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.settings

import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.instagram.misc.extension.hooks.instagramInitHook
import app.crimera.patches.instagram.misc.extension.hooks.instagramInitInsertIndex
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.utils.Constants.SETTINGS_DESCRIPTOR
import app.crimera.patches.settings.SETTINGS_REGISTRY_DESCRIPTOR
import app.crimera.patches.settings.prepareSettingsRegistryLoad
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.addAppResources
import app.morphe.patches.all.misc.resources.addResourcesPatch

private const val SETTINGS_HOST_INSTALL = "$SETTINGS_DESCRIPTOR/InstagramSettingsHost;->install()V"
private const val SETTINGS_REGISTRY_LOAD = "$SETTINGS_REGISTRY_DESCRIPTOR->load()V"

/**
 * The base of the settings every feature patch contributes toggles to: it adds the settings activity,
 * the icon and the strings, loads the settings registry at startup, and puts the Piko settings icon on
 * the profile action bar. Feature patches never depend on it directly; declaring a setting with
 * `instagramToggle` does.
 */
internal val instagramSettingsPatch =
    bytecodePatch(default = false) {
        dependsOn(sharedExtensionPatch, settingsActivityPatch, addResourcesPatch)

        execute {
            addAppResources("instagram")
            prepareSettingsRegistryLoad()
            installSettingsAtStartup()
            addSettingsButtonToProfileActionBar()
        }
    }

/**
 * Installs the settings host and loads the registry as the application starts. The shared extension
 * patch finalizes after this one and inserts `Utils.setContext` at the same index, which puts the
 * context in place before the registry resolves its string resources.
 */
context(_: BytecodePatchContext)
private fun installSettingsAtStartup() {
    val initMethod = instagramInitHook.fingerprint.method
    initMethod.insertHook(
        index = instagramInitInsertIndex(initMethod),
        relocateBranchTargets = false,
    ) {
        invokeStatic(methodReference(SETTINGS_HOST_INSTALL))
        invokeStatic(methodReference(SETTINGS_REGISTRY_LOAD))
    }
}
