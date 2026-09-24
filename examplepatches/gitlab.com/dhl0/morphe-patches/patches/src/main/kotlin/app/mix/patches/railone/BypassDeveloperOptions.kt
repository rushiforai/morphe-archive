package app.mix.patches.railone

import app.mix.patches.railone.shared.Constants.COMPATIBILITY_RAILONE
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val bypassDeveloperOptionsPatch = bytecodePatch(
    name = "Bypass developer options",
    description = "Bypasses app usb debugging, wireless debugging and developer options checks.",
) {
    compatibleWith(COMPATIBILITY_RAILONE)

    dependsOn(bypassSignaturePatch)

    execute {
        setResultValue(IsUsbDebuggingEnabledFingerprint, "0x0")
        setResultValue(IsWifiDebuggingEnabledFingerprint, "0x0")
        setResultValue(IsDeveloperOptionsEnabledFingerprint, "0x0")
    }
}