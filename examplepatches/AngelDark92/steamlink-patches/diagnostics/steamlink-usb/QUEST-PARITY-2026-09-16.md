# Quest-style USB setup feasibility on Galaxy XR

## Decision

The earlier RNDIS trial proved USB transport, **not Quest-equivalent automatic setup**. No APK change was needed for that manually prepared link; that does not complete the user's automatic-setup requirement.

For exact Steam Link **2.0.23/5002363**, removing the Quest checks is insufficient. The tested Galaxy XR firmware did not provide a working NCM network during a bounded shell-authorized test. Full parity is not established, and an APK-only solution is not yet proven impossible.

**2026-09-19 retirement:** the later automatic RNDIS implementation was removed at the user's request because the requirement was Quest-equivalent NCM adapted to Galaxy XR, not RNDIS automation. Its patch, helper, native badge modification, probe, build tooling and trial bundle are retired. No automatic USB patch is currently provided. This file consolidates the relevant historical Quest/app feasibility findings; the separate proposal documents were removed. See the [retirement record](../../WORKSPACE_CLEANUP.md#samsung-automatic-usb-retirement-2026-09-19).

## What Quest actually supplies

Quest Steam Link also streams over an IP network carried by USB. Its distinctive behavior is the OS-managed setup: a foreground app requests `TRANSPORT_USB`, Horizon OS obtains user consent, and the app receives an NCM network. Meta documents IPv6 link-local addressing, socket binding, mDNS discovery, bandwidth reporting and releasing the request. This is separate from the Meta Quest Link product. [Meta's current networking contract](https://developers.meta.com/horizon/documentation/android-apps/features-overview/).

The exact APK additionally has Quest-only native setup/status checks and a Horizon-specific IPv4 configuration broadcast. It already enumerates ordinary USB IP interfaces for streaming. See the [native audit](NATIVE-5002363.md).

The native `BTrySetupUSBNetwork` at VA `0x1025a00`, called from `BInit` at `0x10248c8`, checks the real OS manufacturer for Oculus, invokes `svc usb setFunctions ncm`, then calls Java `trySetupUsbNetwork()`. Java requests USB transport `8` on SDK >31, removing Internet/trusted capabilities `12`/`14`, and sends `horizonos.net.ethernet.SET_LOCAL_IP` to package `android` with `10.86.13.37/29`. The broadcast is Horizon-specific; dispatch does not establish acknowledgement on Samsung. The USB capability/status checks control the shell badge, not the scene's interface enumeration or transport selection.

The APK targets SDK 32 and runs as an ordinary app. Calling `svc` from it does not acquire ADB-shell identity; Android's USB service requires signature/privileged `MANAGE_USB`. Android 14's hidden `ConnectivityManager.setUsbTethering` wrapper can conditionally use approved `WRITE_SETTINGS` when provisioning is absent. Its AOSP hidden-API entry is `unsupported` without a max-target block; Samsung acceptance remained untested. Crucially, this alternative selects Samsung RNDIS, not Quest's NCM service, and was the retired implementation. See [AOSP USB service](https://github.com/aosp-mirror/platform_frameworks_base/blob/android-14.0.0_r1/services/usb/java/com/android/server/usb/UsbService.java) and [Android 14 tethering permission policy](https://android.googlesource.com/platform/packages/modules/Connectivity/+/refs/heads/android14-release/Tethering/src/com/android/networkstack/tethering/TetheringService.java).

## Fresh connected-device evidence

- Samsung `SM-I610`, Android 14 / SDK 34, fingerprint `samsung/xrvst2ue/xrvst2:14/UML2.260301.001/I610UEU2AZF3:user/release-keys`. Installed Steam Link still reports `2.0.23/5002363`, ordinary app UID `10253`, target SDK 32. It was not running.
- Initial USB mode was already back to `mtp,adb`; no USB network interface existed. Earlier successful RNDIS setup must not be described as currently active.
- Vendor init includes NCM function/configuration entries. This is evidence of firmware configuration, not a working app-facing network service. The gadget HAL query reports `unknown`; that value alone is not proof of hardware incompatibility.
- A bounded `svc usb setFunctions ncm` trial reached `sys.usb.config=ncm,adb` and `sys.usb.state=ncm,adb`, and ADB reconnected. **No USB/NCM network interface appeared** in the sampled interface list.
- At `17:20:56.411`, Android Tethering logged: `ERROR could not enable IpServer for function NCM`. Its configuration has `tetherableNcmRegexs: []`; ordinary USB tethering selects RNDIS. Ethernet tracks `eth\d`, with no active interface. These findings show the tested NCM setup path is not operational, not that all possible vendor/kernel NCM implementations are impossible.
- No matching manifest receiver or registered-broadcast dump entry was found for `horizonos.net.ethernet.SET_LOCAL_IP`. These bounded queries do not prove absence of every dynamically registered service implementation.
- `MANAGE_USB` and `TETHER_PRIVILEGED` are `signature|privileged` on this device. An ordinary patched app cannot acquire ADB-shell privileges by executing `svc`. A manifest addition cannot grant these permissions.
- A possible alternative exists: Android 14's framework USB tethering operation can accept an approved `WRITE_SETTINGS` app-op when provisioning is not required. This headset reports empty provisioning-app configuration, and its special-settings activity resolves. Actual Samsung hidden-API access, consent and successful app-UID invocation remain untested; source behavior alone is insufficient.

Raw bounded receipts are retained in ignored `build/usb-streaming/quest-parity-readonly.json` and `ncm-feasibility-trial.json`. The latter includes the decisive Tethering log and restoration readback.

## Remaining boundary

There is no implemented Galaxy XR NCM activation, permission, network configuration or Windows addressing path equivalent to Quest's setup. Any future work must establish those contracts on Android XR rather than substitute the retired RNDIS route. The recorded NCM failure is evidence about the tested firmware/path, not hardware impossibility. USB preference, discovery, reconnect/lifecycle behavior and sustained streaming would also require separate validation. No device or host changes were made during retirement.

## Device state and scope

The NCM trial scheduled a 15-second device-side restoration and explicitly restored `mtp`; final readback confirmed `mtp,adb`. Wi-Fi was not changed. Steam Link remained closed and no SteamVR connection was requested. No APK was built/installed, permissions granted, firmware altered or Windows driver/address changed during this feasibility phase. Existing rollback records were preserved.

The Status helper's package matcher was corrected to `com.valvesoftware.steamlinkvr`; read-only verification returned UID `10253`, and PowerShell parsing passed. This is a diagnostic correction, not the proposed automatic-setup patch.
