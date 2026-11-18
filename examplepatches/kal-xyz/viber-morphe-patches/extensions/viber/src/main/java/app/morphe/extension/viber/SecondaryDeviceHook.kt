package app.morphe.extension.viber

/**
 * Runtime interception hooks for enabling Viber on multiple mobile devices simultaneously.
 *
 * How it works:
 * Viber strictly forbids two "primary phones" on the same number (registering phone #2 immediately
 * logs out phone #1). However, Viber officially supports secondary/companion devices (Android tablets and iPads).
 *
 * By intercepting Viber's device type check, this hook causes the secondary mobile device to report
 * as a tablet during registration. This activates the official QR-code pairing flow, allowing the
 * second phone to link to the primary phone without deactivating it. Both phones then receive messages
 * and calls in real time.
 */
object SecondaryDeviceHook {

    // Viber internal device types (typically 1 = Phone, 2 = Tablet, 3 = Desktop)
    const val DEVICE_TYPE_PHONE = 1
    const val DEVICE_TYPE_TABLET = 2

    /**
     * Intercepts Viber's tablet / device form-factor detection.
     * @return true to tell Viber this device is a tablet eligible for secondary QR linking.
     */
    @JvmStatic
    fun isTabletDevice(): Boolean {
        if (!ViberModPreferences.isSecondaryDeviceModeEnabled()) {
            return false
        }
        return true
    }

    /**
     * Intercepts device type reported in registration and sync payloads.
     * @param originalType Original device type detected by Viber.
     * @return DEVICE_TYPE_TABLET (2) if secondary mode is enabled, or the original type.
     */
    @JvmStatic
    fun getEffectiveDeviceType(originalType: Int): Int {
        if (ViberModPreferences.isSecondaryDeviceModeEnabled()) {
            return DEVICE_TYPE_TABLET
        }
        return originalType
    }

    /**
     * Prevents small phone screens from forcing split two-column tablet layouts
     * while retaining secondary device functionality.
     * @return false to force single-column smartphone layout, or true if tablet layout is preferred.
     */
    @JvmStatic
    fun shouldUseSplitTabletLayout(): Boolean {
        if (ViberModPreferences.isForcePhoneLayoutEnabled()) {
            return false
        }
        return isTabletDevice()
    }
}
