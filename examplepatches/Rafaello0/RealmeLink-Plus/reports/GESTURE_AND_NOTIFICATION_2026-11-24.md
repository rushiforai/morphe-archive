# Gesture and notification audit
APK SHA-256 verified: d1f2a5d8f8fc0d6c4098fb8aff6ec830af42e92ffd9822563f5c8660a650a2ce.
In assets/headsetRusConfig the built-in configs for model IDs 050C12, 051412, 051812, 051C52, 052052 contain explicit ITEM_ACTION_SINGLE_CLICK rows with VALUE_PLAY_PAUSE and VALUE_OFF. Other configurations omit single tap. The shared ItemFactory.N(HeadsetViewItem) builds groups using ItemFactory.M(String,KeyAction), and e(String) maps single click. KeyAction(String,List) and HeadsetViewItem(String,KeyAction) constructors and setSubItems(List) are verified in classes37.dex. Optional experimental patch exposes the existing generic action through these contracts; no direct BLE writes, no changes to firmware. Exact hardware support of Buds Air 7 and 8 Pro remains unverified.
No confirmed low-charge notification channel or user-facing discharge hook was established in DEX. HeadsetDevicePresenter.x0 dispatches battery UI changes; low-energy OTA checks remain intact. Added system channel management UI (app-owned notification channels only); not a fix for acoustic firmware warnings. No blanket notification suppression.


## 2026-11-24: Air7 single-tap, friendly headset labels, higher action button
- Official realme Buds Air7 user guide and detailed model review document double tap, triple tap and long press; **not** single tap. This makes firmware/gesture recognizer limitation likely; app-side controls do not create a new hardware event.
- Previous optional `Expose single tap (experimental)` created a synthetic gesture row even when the current device did not declare one; user observed that single tap does not act. **Removed** this injection from packaged patches, leaving original vendor gesture controls untouched.
- Vendor `Device` methods confirmed in target APK DEX: `getShowName`, `getAliaBluetoothName`, `getBluetoothName`, `getName`. Capture a safe displayed name alongside each saved MAC. Use Android Bluetooth alias/name first, with cached vendor name fallback.
- Dialog labels for duplicate devices are disambiguated by indexed suffixes, not raw MAC. Button moves from bottom-right to upper-right below the headset toolbar. Test covers names and fails closed on MAC-like strings.
- No changes to headphone firmware, no unverified BLE command or promise of one-tap action on a model that does not advertise the capability.
