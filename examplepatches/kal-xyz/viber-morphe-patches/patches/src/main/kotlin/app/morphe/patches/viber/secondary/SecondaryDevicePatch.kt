package app.morphe.patches.viber.secondary

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.viber.shared.Constants.COMPATIBILITY_VIBER

private const val EXTENSION_CLASS = "Lapp/morphe/extension/viber/SecondaryDeviceHook;"

@Suppress("unused")
val secondaryDevicePatch = bytecodePatch(
    name = "Secondary device mode",
    description = "Enables using Viber on 2 mobile phones simultaneously via QR code companion pairing without deactivating the primary phone."
) {
    compatibleWith(COMPATIBILITY_VIBER)

    execute {
        // 1. Intercept tablet form-factor detection to return true during registration
        IsTabletCheckFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $EXTENSION_CLASS->isTabletDevice()Z
            move-result v0
            return v0
            """
        )

        // 2. Intercept device type resolver in registration packets
        DeviceTypeResolverFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x1
            invoke-static {v0}, $EXTENSION_CLASS->getEffectiveDeviceType(I)I
            move-result v0
            return v0
            """
        )

        // 3. Ensure UI does not force split-pane tablet view on phones with small screens
        SplitLayoutDeciderFingerprint.method.addInstructions(
            0,
            """
            invoke-static {}, $EXTENSION_CLASS->shouldUseSplitTabletLayout()Z
            move-result v0
            return v0
            """
        )
    }
}