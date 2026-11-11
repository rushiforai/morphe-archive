/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.premium

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

private const val PATCH = "Unlock Premium features"
private const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"

private const val PREMIUM_UNLOCK = "$EXTENSION_PACKAGE/misc/PremiumUnlock;"
private const val IS_PREMIUM_HOOK = "$PREMIUM_UNLOCK->isPremium(I)I"

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = PATCH,
    description = "Makes Telegram on your phone treat your account as Premium, so the parts the app itself " +
        "locks behind Premium open up. Telegram's servers still know your real plan, so their limits, like " +
        "upload size, stay the same. Starts off. Turn it on in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("unlockPremium")

        val owner = tgMutableClassDefByOrNull(USER_CONFIG)
        if (owner == null) {
            patchLog.warning("$PATCH: UserConfig is missing. The patch is left out.")
            return@execute
        }

        val isPremium = owner.methods.singleOrNull { m ->
            m.origName == "isPremium" && m.origReturnType == "Z" &&
                m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags)
        }
        if (isPremium == null) {
            patchLog.warning("$PATCH: UserConfig.isPremium() is missing or ambiguous. The patch is left out.")
            return@execute
        }

        if (isPremium.implementation == null) {
            patchLog.warning("$PATCH: UserConfig.isPremium() has no body. The patch is left out.")
            return@execute
        }

        isPremium.addInstructionsWithLabels(0, """
            const/4 v0, 0x1
            invoke-static {v0}, $IS_PREMIUM_HOOK
            move-result v0
            if-eqz v0, :stock
            return v0
        """, ExternalLabel("stock", isPremium.getInstruction(0)))

        enableStatus("unlockPremium")
    }
}
