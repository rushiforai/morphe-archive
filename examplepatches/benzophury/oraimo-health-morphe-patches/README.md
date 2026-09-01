# Oraimo Health Offline Morphe Patches

Privacy-preserving offline patches for the Oraimo Health companion Android app (`com.transsion.oraimohealth`).

## About

This patch suite converts the Oraimo Health application into a clean, dedicated, offline Device Manager while strictly preserving the entire Bluetooth Low Energy (BLE) peripheral binding and synchronization stack.

### Key Highlights

- **100% Offline Architecture**: Transsion's BLE stack (MoYoung / CRREPA protocol) operates completely locally without requiring cloud servers.
- **DNS Hardcoding**: Hardcodes OkHttp's internal DNS resolver to fail locally with `UnknownHostException` in 0ms, eliminating any background telemetry, analytics, or remote API queries.
- **Offline Network Mode**: Spoofs `NetworkUtil.isConnected()` to return `false`, causing the app to seamlessly enter its native offline guest mode without requiring cloud login or synthetic database seeding.
- **Declarative UI Layout Pruning**: Statically collapses Mall, Sport, and Mine tabs to `0dp` in `activity_main.xml`, leaving a clean interface with only Data (Dashboard) and Device Management.
- **Manifest Debloating**: Prunes background cloud upload services, aggressive keepalive daemons, and cloud activities from `AndroidManifest.xml`.
- **Native Architecture Stripping**: Supports stripping 32-bit `armeabi-v7a` native libraries (`--striplibs=arm64-v8a`), reducing APK size by **~24%** (-23 MB) without impacting 64-bit performance.
- **Bluetooth Stack Preservation**: Full BLE GATT connectivity, device pairing handshake (`MoyConnectBindManagement`), notification filtering, alarm management, and local DIY watchface streaming operate with 100% stability.

---

## Patches List

<!-- PATCHES_START EXPANDED -->
> **[v1.9.0](https://github.com/benzophury/oraimo-health-morphe-patches/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 oraimo health&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [DNS Hardcoding](#dns-hardcoding) | Hardcodes DNS lookup in OkHttp to fail locally with UnknownHostException, preventing any remote DNS or HTTP traffic. |  |
| [Hide Navigation Tabs (Layout)](#hide-navigation-tabs-layout) | Statically collapses Mall, Sport, and Mine tabs to 0dp in activity_main.xml, keeping Data and Device tabs. |  |
| [Manifest Debloat](#manifest-debloat) | Prunes background telemetry upload services, aggressive keepalive daemons, and cloud activities from AndroidManifest.xml. |  |
| [Offline Network Mode](#offline-network-mode) | Forces network utilities to report disconnected and disables network change listeners. |  |

</details>

<!-- PATCHES_END -->

---

## Supported Versions

| Package Name | Supported App Version |
| :--- | :--- |
| `com.transsion.oraimohealth` | `2.0.4` |

---

## Building & Installation

### Using Morphe Manager (Android)
1. Open **Morphe Manager** on your Android device.
2. Add this repository under **Sources**: `https://github.com/benzophury/oraimo-health-morphe-patches`
3. Select `oraimo_Health.apk` (v2.0.4).
4. Verify all 4 patches are selected.
5. Tap **Patch** and install.

### Using Morphe CLI / Morphe Desktop (with ABI Stripping)
```bash
java -jar morphe-desktop.jar patch \
  --striplibs=arm64-v8a \
  --patches=patches-*.mpp \
  --out=oraimo_Health_patched.apk \
  oraimo_Health.apk
```

---

## License

GNU General Public License v3.0
