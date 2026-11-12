package app.sledgesune.patches.waze.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction

private const val CONFIG_MANAGER = "Lcom/waze/ConfigManager;"

/** Runs after the server's config has been loaded into the native core (every sync). */
internal object ConfigSyncedFromServerFingerprint : Fingerprint(
    definingClass = CONFIG_MANAGER,
    name = "onConfigSyncedFromServer",
    returnType = "V",
    parameters = listOf(),
)

/** Runs once per start, when the first config sync is complete. */
internal object ConfigSyncedToServerFingerprint : Fingerprint(
    definingClass = CONFIG_MANAGER,
    name = "onConfigSyncedToServer",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Calls `extensionClass.applyConfig()` after every config sync, so values the patch writes into Waze's config
 * store win over the server's. Several patches can each add their own call; the calls take no registers.
 */
internal fun applyConfigOnSync(extensionClass: String) {
    listOf(ConfigSyncedFromServerFingerprint, ConfigSyncedToServerFingerprint).forEach {
        it.method.addInstruction(0, "invoke-static { }, $extensionClass->applyConfig()V")
    }
}
