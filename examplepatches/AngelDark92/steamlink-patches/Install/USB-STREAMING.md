# Manual Galaxy XR USB streaming setup

This guide is a manual USB-network workaround. It does not reproduce Quest's automatic app-requested USB setup. See the [Quest-style feasibility investigation](../diagnostics/steamlink-usb/QUEST-PARITY-2026-09-16.md) for that separate requirement and the Galaxy XR NCM trial.

The separate automatic RNDIS patch was retired at the user's request on 2026-09-19 because it did not implement Quest-equivalent NCM. No automatic USB patch is provided. This manual setup and its rollback helpers remain available independently.

**Verified on 2026-09-16:** the existing installed Steam Link **2.0.23/5002363** streamed over USB with Wi-Fi disabled for a short test. The user confirmed that the image and head tracking continued working. No additional APK patch was needed. This does not establish long-session stability or cold discovery without Wi-Fi.

**Wait to connect Steam Link until Windows has a working USB network adapter.** Leave the USB 3 cable connected, unlock Galaxy XR, and allow USB debugging. Keep Wi-Fi on initially for Steam Link discovery.

Run from the repository root in PowerShell. The script uses `adb` from PATH or the toolkit's `../Tools/install/platform-tools/adb.exe`; pass `-AdbPath C:\path\to\adb.exe` to override:

```powershell
.\Install\Set-GalaxyXrUsbStreaming.ps1 -Mode Status
.\Install\Set-GalaxyXrUsbStreaming.ps1 -Mode Enable
```

Use `-Serial <USB-ADB-serial>` when more than 1 device is connected. The script accepts only Samsung SM-I610 devices reporting `xrvst2` or `xrvst2ue`. Status is read-only. Enable saves the original USB function state under ignored `build/usb-streaming/state/`, then requests Android RNDIS tethering. USB debugging briefly disconnects; a nonzero result from the switch itself is expected and is followed by bounded reconnection and state checks. Repeated Enable preserves the original restore record.

Check that Android reports an active tethered `usb0`/RNDIS interface and IPv4 address, and that the matching Windows USB network adapter has a usable address on the same subnet. The script matches the Windows RNDIS child through its parent USB serial and reports adapter names, driver identity, addressing, a route to the PC with the installed Steam Link UID when available, and USB byte counters. Restricted Android diagnostics may report unavailable; Windows adapter counters remain useful. The script does not install APKs, restart apps, change drivers/firewalls, or configure Windows Internet Connection Sharing.

The connected headset initially exposed `mtp` (`mtp,adb` in Android USB state). Enabling RNDIS exposed Samsung `VID_04E8&PID_6864&RNDIS`, but Windows incorrectly bound it to **USB Serial Device (COM5)** through `usbser.inf`. A serial port cannot carry this network connection. The status script diagnoses this condition and does not report the network as ready.

If the normal driver-selection wizard only offers serial/modem drivers, use the targeted repair helper. Its default Preview verifies the built-in Microsoft candidate without changing a driver:

```powershell
.\Install\Repair-GalaxyXrRndisDriver.ps1 -Mode Preview
```

After reviewing the exact device and candidate, run this in **64-bit PowerShell as Administrator** from the repository root:

```powershell
.\Install\Repair-GalaxyXrRndisDriver.ps1 -Mode Apply
```

The helper binds only the selected Samsung RNDIS child to Microsoft's existing `netrndis.inf / usbrndis6.ndi` driver. It requires exactly 1 matching child, or an explicit `-InstanceId` from Preview when there are several. It saves the previous driver information under `build/usb-streaming/`, leaves the ADB/composite devices alone, and never restarts Windows. It does not download a driver, modify an INF, or disable signature checks. The backup is an information record; driver rollback uses Device Manager's **Roll Back Driver**, if available, or selection of the recorded original driver on that same child. Rerun USB Status after repair and wait for a usable IP address.

### If Windows keeps a 169.254 address

The tested headset offered a DHCP lease but Windows did not accept it. If this occurs, the USB adapter needs an IPv4 address in the headset's USB subnet. `Set-GalaxyXrUsbHostAddress.ps1` supports a temporary, local-only address on that exact adapter. Preview checks the connected Galaxy XR, the adapter's identity, the actual headset `/24`, and existing Windows addresses. Choose an unused host address in that subnet; do not blindly reuse the example if the headset's address has changed.

For the recorded session, Android offered this PC `192.168.231.146` while the headset used `192.168.231.22/24`:

```powershell
.\Install\Set-GalaxyXrUsbHostAddress.ps1 -Mode Preview -Address 192.168.231.146
# Run Apply in Administrator PowerShell after checking Preview.
.\Install\Set-GalaxyXrUsbHostAddress.ps1 -Mode Apply -Address 192.168.231.146
```

The helper saves the prior DHCP mode and address snapshot, disables DHCP only on the USB adapter in ActiveStore, and adds the requested address without a gateway or DNS change. It checks Windows' duplicate-address result. Rebooting can discard this temporary configuration. Keep the saved state until restoration succeeds. To remove the owned address and restore the original DHCP mode, run **before disabling RNDIS** in Administrator PowerShell:

```powershell
.\Install\Set-GalaxyXrUsbHostAddress.ps1 -Mode Restore
```

After both ends are ready, open Steam Link and connect to the PC. Compare Status counters before and during streaming: substantial traffic should increase on Android's USB interface and the matching Windows adapter. Also confirm the actual streaming destination/route; background traffic alone is insufficient proof. If discovery or the stream uses the Wi-Fi/LAN address, record that result before assuming a USB route was selected. A cable carrying ADB is not evidence that the stream uses USB.

Steam Link 2.0.23/5002363 can enumerate an existing `usb0` IPv4 interface. Its stock automatic Quest USB setup/UI remains gated by Quest-specific checks. In the live test, both Wi-Fi and USB initially carried traffic; after headset Wi-Fi was disabled, USB traffic and the stream continued. Wi-Fi was restored afterward. The app's “Found primary link” messages mark the first decrypted receive, not a transport preference decision; see the [selection audit](../diagnostics/steamlink-usb/USB-SELECTION-PLAN.md). Keep Wi-Fi on for initial discovery; after connecting, disabling it can test USB-only continuation. Exclusive USB preference while Wi-Fi remains enabled has not been established. The stock Quest-only USB indicator may not represent this manually configured link. See the [exact native audit](../diagnostics/steamlink-usb/NATIVE-5002363.md) and [live validation record](../diagnostics/steamlink-usb/LIVE-2026-09-16.md).

Restore the saved USB function mode when finished:

```powershell
.\Install\Set-GalaxyXrUsbStreaming.ps1 -Mode Restore
```

Restore verifies reconnection with the saved mode before deleting its record. If the cable disconnects or a switch fails, reconnect it and rerun Status or Restore. Preserve the JSON record until restoration succeeds. If RNDIS was enabled manually before this script saved a record, Enable refuses to invent the original state; Status remains available.
