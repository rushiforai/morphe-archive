/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.returnEarlyWhen
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.MAIN_ACTIVITY
import app.morphe.patches.telegram.misc.settings.settingsPatch

private const val PATCH = "Disable update checks"

/**
 * The launcher activity's update check, `checkAppUpdate(boolean force)` in Telegram's source and
 * renamed in the APK. Only telegram.org's build and the beta run it: it asks
 * `ApplicationLoader.isStandaloneBuild()`, waits out `SharedConfig.lastUpdateCheckTime` and then
 * sends `help.getAppUpdate`. Each of those keeps its name.
 */
internal object CheckAppUpdateFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = "Lorg/telegram/messenger/ApplicationLoader;", name = "isStandaloneBuild"),
        fieldAccess(definingClass = "Lorg/telegram/messenger/SharedConfig;", name = "lastUpdateCheckTime", type = "J"),
        newInstance("Lorg/telegram/tgnet/TLRPC\$TL_help_getAppUpdate;"),
    ),
)

/**
 * Stops telegram.org's build checking for its own updates.
 *
 * That build downloads and offers the next version itself, but the APK it gets is signed with
 * Telegram's key and Android won't install it over a patched build. The check asks the extension
 * first and returns before reaching the server while the switch is on.
 *
 * Found by reading 12.10.6 (2026-09-30).
 */
@Suppress("unused")
val disableUpdateChecksPatch = bytecodePatch(
    name = PATCH,
    description = "Stops telegram.org's Telegram offering its own updates, which can't install over a " +
        "patched build. Patch the new version in Morphe Manager instead.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("disableUpdateChecks")

        val method = CheckAppUpdateFingerprint.methodOrNull
            ?: throw PatchException("$PATCH: the launcher activity has no (boolean) method that checks the build and sends help.getAppUpdate")
        method.returnEarlyWhen(PATCH, "$EXTENSION_PACKAGE/misc/UpdateChecks;->skipUpdateCheck()Z", "return-void")

        enableStatus("disableUpdateChecks")
    }
}
