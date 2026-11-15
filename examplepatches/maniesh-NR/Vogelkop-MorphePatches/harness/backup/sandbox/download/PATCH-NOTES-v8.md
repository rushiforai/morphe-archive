# PATCH NOTES — v8 universal
**Opera Beta 104.0.5262.91143 custom build — "Free VPN, system-wide"**

- APK: `OperaBeta-104.0.5262.91143-custom-v8-universal.apk` (154,436,314 bytes)
- sha256: `cce194fecd22e1696afe0ca1b6099842f21b74bcea1e9d17897a6e64c09c947c`
- Signature: morphe.keystore (v1+v2+v3) — same key as v4-v7, installs as an
  **update over v7** (no data loss).
- Base: v6 universal APK (byte-identical substrate, hash-verified
  `15cc03fc…`) → all v6 + v7 patches inherited or re-applied.

## What is new in v8

### 1. System-wide FREE VPN (the headline)
v7 concluded "system-level VPN with free servers: not feasible". That was
wrong — the community ports (opera-proxy + tun2socks wrappers) prove the
free SurfEasy infrastructure can serve a real Android VpnService. v8 embeds
that stack into the browser itself:

```
[other apps] ──► tun0 (VpnService, 0.0.0.0/0 + ::/0, browser excluded)
                   │ fd via JNI
                   ▼
     hev-socks5-tunnel 2.20.0  (libhev-socks5-tunnel.so, in-process)
                   │ SOCKS5 127.0.0.1:18080 (loopback — never enters the tun)
                   ▼
     opera-proxy v1.15.0-fork  (liboprx.so, exec'd from nativeLibraryDir)
                   │ self-registers a free device with the SurfEasy API
                   │ (built-in se0316 credentials, 4h login refresh)
                   ▼
     *.sec-tunnel.com free servers (EU / Asia / Americas)
```

- **Controls**: the old VPN Pro surfaces are repurposed —
  - quick-settings tile "VPN" (toggle),
  - home-screen widget "VPN" (tap row to toggle, shows state + region),
  - the status notification (tap = toggle; buttons Europe/Asia/Americas
    switch region and reconnect).
- **First enable** (one time): tap the tile → a notification appears →
  tap it → Android's "Connection request" dialog → Allow → tap the tile
  again. The system remembers the consent afterwards.
- **Region**: EU / AS / AM, default Europe, `-server-selection first`
  (instant connect, no benchmark delay). Region survives reboots.
- **DNS**: hev mapdns (fake-IP, 198.18.0.2, cache 10000) — domains are
  resolved **server-side** through the SOCKS tunnel, no local DNS leak.
- **Loop prevention**: the browser package itself is disallowed from the
  tun (`addDisallowedApplication`), so opera-proxy's upstream can never
  re-enter the VPN. The browser keeps using its own in-browser VPN.
- Orphaned opera-proxy children from a crashed app process are killed on
  the next start (pidfile + cmdline check).

Implementation notes:
- The service rides the **manifest entry Opera already declares** for its
  VPN Pro partner: `com.kape.vpnservicemanager.data.externals.Service`
  (BIND_VPN_SERVICE + android.net.VpnService intent-filter +
  systemExempted foreground type). The Kape client classes never ship in
  sideloaded builds, so the name was free. My implementation lives in the
  previously-empty `classes5.dex` (14,860 bytes) together with
  `hev.htproxy.TProxyService` and `com.zai.sysvpn.VpnController`.
- The three Opera-declared components (`VpnProQuickSettingsTileService`,
  `VpnProAppWidget`, `VpnReceiver`) **do** ship in classes3 — their method
  bodies were surgically replaced to drive the embedded VPN (tile onClick/
  onStartListening; widget c()/b()/onEnabled; receiver onReceive). The
  receiver also translates the legacy `VPN_PRO_ENABLE/DISABLE/RESUME`
  broadcasts, so every existing sender now controls the free VPN.
- Manifest binary edits (size-preserving, verified by re-parse):
  `extractNativeLibs false→true` (so liboprx.so can be exec'd from
  nativeLibraryDir) and the two component labels `VPN Pro`→`VPN`.
- Native payload added: `lib/armeabi-v7a/liboprx.so` (7.5 MB, from
  snawoot-proxies-forks/opera-proxy v1.15.0-fork, arm) and
  `lib/armeabi-v7a/libhev-socks5-tunnel.so` (170 KB, from
  heiher/hev-socks5-tunnel 2.20.0 AAR, armeabi-v7a). Both deflated; the
  installer extracts them (extractNativeLibs=true).

### 2. Fixes for the v7 leftovers
| ID | fixes | what v7 did wrong / what v8 does |
|---|---|---|
| V8a | "Protect more devices" (VPN settings screen) | v7 only removed menu id 0xa7f8 (xoj `yoj` branch). v8 additionally forces row 7 of the VPN settings screen (xoj `egn` branch) to stay hidden. |
| V7b2 | VPN components disabled for free users | v7 flipped only the widget site; v8 also flips the quick-settings tile site (`yen.l`), so both components are enabled. |
| N8 | orphan "In-app notifications" header | v7's N7 hid the 7 toggle rows but left the section header + the separator above it. v8 hides both in `rqd.k()` (separator by handle, header via `getChildAt(4)` of its parent). |
| RS8 | Rewards settings row | the v6 "bo3" patch never applied (wrong anchor) — the row is hidden properly now (k9: the `iwk` state branch that showed it is forced to GONE). |
| C7 | cookies default | re-applied on the corrected anchor (default 1 → 2, block third-party cookies). |

### 3. Re-applied v7 set (unchanged semantics)
V7a (menu "Protect more devices"), V7b (component enabling, now both
sites), C7, N7 (7 notification rows), SD1 (partner tables
provider_info/partner_data/partner_tree → `WHERE 0`), SD2
(PushedSpeedDialSuggestionProvider → empty), M3c (REWARDS main-menu item),
R5a/R5b (appearance routing gate).

**Regression**: the full v4+v5+v6 marker suite passes on the rebuilt dexes
(ad-blocker CUSTOM mode + 39-list seed, opera_fixes removal, Minipay/Wallet/
Rewards surfaces, notifications Push-only, premium layout, protocol picker,
wallpaper/icon un-gating — all inherited from the v6 substrate).

## Entry-level diff vs the v6 APK
- changed: `AndroidManifest.xml`, `classes.dex`, `classes3.dex`,
  `classes5.dex`, re-signed `META-INF/{MANIFEST.MF,MORPHE.SF,MORPHE.RSA}`
- added: `lib/armeabi-v7a/{liboprx.so,libhev-socks5-tunnel.so}`
- removed: nothing.

## Known limitations (by design of the free upstream)
- **TCP only.** Opera's free proxy upstream has no UDP relay. DNS is
  handled in-tunnel (mapdns); QUIC in other apps degrades to TCP.
- IPv6 literals routed into the tun cannot be proxied upstream (v4
  infrastructure) — such connections fail fast; name-based connections
  are unaffected (server-side resolution returns v4).
- First connection after enable takes ~1-3 s (SurfEasy device
  registration is fetched/refreshed by the child process).
- The browser itself is excluded from the system VPN (loop prevention);
  use the in-browser VPN for the browser's own traffic.
- Region list is the free tier's EU/AS/AM (matches Opera's
  Europe/Asia/Americas), no city picker.

## Install & first-run test checklist
1. Install as an update over v7 (same signing key): `adb install -r <apk>`.
2. Add the "VPN" quick-settings tile (tile picker → VPN).
3. Tap the tile → tap the notification → Allow → tap the tile again.
4. Verify in another app (e.g. a browser IP-check site) that the public IP
   is a SurfEasy/Opera VPN address; check `adb shell ifconfig tun0`.
5. Toggle via the home-screen widget; switch region via the notification
   buttons; confirm the tile/widget state follows.
6. Confirm the v8 fixes: no "Protect more devices" row in VPN settings,
   no orphan "In-app notifications" header, no Rewards settings row.
7. Reboot with VPN on — the VPN intentionally does NOT auto-restart
   (manual control only); the tile should show OFF.

## Build provenance
- scripts: `scripts/apply_v8_patches.py` (21 patches, fail-loud),
  `scripts/build_v8_universal.sh`, `scripts/v8_splice.py` (AXML editor +
  payload splice), `scripts/verify_v8_markers.py`, sources
  `scripts/v8src/**`.
- toolchain: apktool 3.0.3, build-tools r34 (zipalign -p 4, apksigner,
  d8), ecj 3.36.0, android-34 platform jar.
- keystore: morphe.keystore (sha256 `1fb06b11…`, alias morphe, cert
  SHA-256 `28f79a44…`), re-fetched from the sandbox-storage release.
