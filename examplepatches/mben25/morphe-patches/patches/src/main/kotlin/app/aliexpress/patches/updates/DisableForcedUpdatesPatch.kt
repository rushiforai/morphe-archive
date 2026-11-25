package app.aliexpress.patches.updates

import app.aliexpress.patches.shared.Constants.COMPATIBILITY_ALIEXPRESS
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * `IUpdateService` implementation (class name not obfuscated). Home (`home/ui/l0`) calls
 * `checkUpdate(...)` on start; it requests the latest version over mtop and shows the
 * "new version" / forced-update dialog (`py0/c.g(Context, UpdateInfoResult, Z)`) from the
 * callback. Stubbing both overloads skips the request and the dialog.
 *
 * Left alone on purpose: Settings > "Check for updates" (`nt0/b.h`, user-initiated) and the
 * Taobao update SDK `io1/i` ("usdk use old mtop update"), which only drives hotfix patches.
 *
 * The original patch matched any `void` method containing "checkUpdate" and hit the ADC page
 * snapshot updater ("checkUpdateSnapshot data = ") instead, breaking cached page refreshes.
 */
private const val UPDATE_SERVICE_IMPL = "Lcom/aliexpress/module/update/UpdateServiceImpl;"

@Suppress("unused")
val disableForcedUpdatesPatch = bytecodePatch(
    name = "Disable forced updates",
    description = "Stops the automatic \"new version available\" and forced update dialogs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ALIEXPRESS)

    execute {
        val checkUpdateMethods = mutableClassDefBy(UPDATE_SERVICE_IMPL).methods
            .filter { it.name == "checkUpdate" && it.returnType == "V" }
        if (checkUpdateMethods.isEmpty()) {
            throw PatchException("AliExpress: UpdateServiceImpl.checkUpdate not found.")
        }
        checkUpdateMethods.forEach { it.addInstructions(0, "return-void") }
    }
}
