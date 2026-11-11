/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.integrity

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

private const val PATCH = "Bypass integrity check"

private const val INTEGRITY_BYPASS = "$EXTENSION_PACKAGE/misc/IntegrityBypass;"
private const val SKIP_INTEGRITY_HOOK = "$INTEGRITY_BYPASS->skipIntegrityCheck(I)Z"

private const val EMU_DETECTOR = "Lorg/telegram/messenger/EmuDetector;"
private const val EMU_INPUT_DETECTOR = "Lorg/telegram/messenger/EmuInputDevicesDetector;"

@Suppress("unused")
val bypassIntegrityCheckPatch = bytecodePatch(
    name = PATCH,
    description = "Makes Telegram's two emulator checks always say your phone isn't an emulator. " +
        "Starts off. Turn it on in HushTelegram settings > Privacy.",
    default = true,
) {
    category("Privacy")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("bypassIntegrityCheck")

        var hooked = 0

        for (detectorType in listOf(EMU_DETECTOR, EMU_INPUT_DETECTOR)) {
            val detector = tgMutableClassDefByOrNull(detectorType) ?: continue
            val detect = detector.methods.singleOrNull { m ->
                m.origName == "detect" && m.origReturnType == "Z" &&
                    m.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(m.accessFlags)
            }
            if (detect?.implementation == null) continue

            detect.addInstructionsWithLabels(0, """
                const/4 v0, 0x1
                invoke-static {v0}, $SKIP_INTEGRITY_HOOK
                move-result v0
                if-eqz v0, :stock
                const/4 v0, 0x0
                return v0
            """, ExternalLabel("stock", detect.getInstruction(0)))
            hooked++
        }

        if (hooked > 0) {
            enableStatus("bypassIntegrityCheck")
        } else {
            patchLog.warning("$PATCH: no detector methods found. The patch is left out.")
        }
    }
}
