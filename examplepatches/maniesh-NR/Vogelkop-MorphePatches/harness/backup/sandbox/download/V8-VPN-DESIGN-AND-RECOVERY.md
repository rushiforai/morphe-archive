# V8 Design — System-wide Free VPN + Sandbox Recovery Log

Date: 2026-11-15. Trigger: user's correction — community ports prove the free
servers CAN be used system-wide (opera-proxy + Android wrappers).

## 1. Corrected verdict

**v7 said:** "system-level VPN with free servers: not feasible — the free VPN is
a browser-level proxy, not a VpnService."

**Corrected:** Unlocking the app's own VPN Pro path is impossible, but embedding
a standalone free-VPN client IS feasible — exactly what the community ports do.
v8 will embed that stack into the custom Opera build itself.

### Evidence gathered this session

1. **Free VPN transport confirmed in `libopera.so`** (strings, armeabi-v7a):
   `api2.sec-tunnel.com`, `https://api2.sec-tunnel.com/v4/`, `*.sec-tunnel.com`,
   `@se0309.surfeasy.vpn`. The in-browser free VPN registers a SurfEasy device
   against the SurfEasy API and uses upstream `*.sec-tunnel.com:443` — an
   HTTP-CONNECT proxy over TLS with Basic auth (login + JWT-like password).
   This is the *same* infrastructure the community `opera-proxy` implements.
2. **A real system VpnService exists in the manifest**:
   `com.kape.vpnservicemanager.data.externals.Service` with
   `android.permission.BIND_VPN_SERVICE`, `SUPPORTS_ALWAYS_ON=false`,
   `foregroundServiceType=systemExempted`, plus `VpnReceiver`, `VpnProReceiver`,
   `VpnFailedToConnectService`, `VpnProQuickSettingsTileService` (quick-settings
   tile) and `VpnProAppWidget` (home-screen widget). Kape Technologies is
   Opera's VPN Pro infrastructure partner.
3. **But the Kape client classes are NOT in the app**: zero `Lcom/kape/*`
   references in all 7 dex files of base.apk; only
   `META-INF/vpnservicemanager_release.kotlin_module` remains. The APKM's only
   feature module is pangle_ads. Conclusion: the VPN Pro client ships as a Play
   on-demand module that sideloaded builds never receive — and Pro also needs
   server-side entitlement. **"Unlock Pro for free servers" is a dead end.**
4. **Community references (user-provided), analyzed:**
   - `snawoot-proxies-forks/opera-proxy` v1.15.0-fork (2026-03, active): Go
     client; self-registers a device with the SurfEasy API using built-in
     `se0316` credentials (zero config); local HTTP or SOCKS5 proxy on
     `127.0.0.1:18080`; regions EU/AS/AM; fastest-server selection; 4h
     credential refresh; prebuilt `android-arm` / `android-arm64` binaries.
   - `SLY-F0X/opera-proxy-android-wrapper` (archived 2026-04): Kotlin app;
     VpnService + tun handler (tun2proxy); **TCP-only** (Opera upstream has no
     UDP); DNS via fake-IP / DNS-over-TCP / direct.
   - `MYSOREZ/portal-connect-opera-proxy` v1.0.5 (2026-03): same architecture,
     whitelist/blacklist split tunneling, still maintained.

## 2. v8 architecture (embedded stack)

```
[other apps] ──► tun0 (VpnService, route 0.0.0.0/0, self-disallowed)
                    │ fd passed via JNI
                    ▼
        hev-socks5-tunnel 2.20.0  (libhev-socks5-tunnel.so, in-process)
                    │ SOCKS5 127.0.0.1:18080  (loopback — never enters tun)
                    ▼
        opera-proxy v1.15.0-fork  (child process: liboprx.so, exec'd
                    │              from nativeLibraryDir)
                    │ TLS :443, HTTP-CONNECT + Basic auth
                    ▼
        *.sec-tunnel.com  (free EU/AS/AM servers)
```

- **New Java class** `com.zai.sysvpn.SysVpnService` (spliced into a dex):
  Builder → address/mTU/routes → `addDisallowedApplication(own package)` →
  `establish()` → write hev config to filesDir → JNI
  `hev.htproxy.TProxyService.TProxyStartService(configPath, tunFd)` → spawn
  `liboprx.so -bind-address 127.0.0.1:18080 -socks-mode -country {EU|AS,AM}`.
  Stop = kill child + `TProxyStopService()` + close tun. Foreground
  notification (systemExempted, mirroring Opera's own service type).
- **hev JNI API (verified from AAR classes.jar):**
  `TProxyStartService(String, int)Z`, `TProxyStopService()Z`,
  `TProxyIsRunning()Z`, `TProxyGetStats()[J`; library name `hev-socks5-tunnel`.
- **Loop prevention:** opera-proxy's upstream socket cannot be
  `VpnService.protect()`-ed from Java (the fd lives in the child process).
  Cleanest robust fix: `addDisallowedApplication(own package)` — the browser
  itself keeps the in-browser free VPN enabled (still protected), all other
  apps go through the tun. (Alternative rejected: CIDR route-exclusion of
  server IPs — fragile; the server set rotates on the 4h refresh.)
- **DNS:** hev `mapdns` section (mapped DNS with cache). Other UDP is dropped —
  Opera's upstream is TCP-only; QUIC in third-party apps falls back to TCP.
- **UI hooks (reuse the otherwise-dead VPN Pro surfaces):**
  `VpnProAppWidget` + `VpnProQuickSettingsTileService` (classes3) patched to
  toggle our service; widget title re-stringed to plain "VPN". Region pref
  EU/AS/AM stored locally; default = current in-browser VPN region.
- **Manifest addition** (adding, NOT removing — the S2/03a conviction only
  applies to removals):
  `<service android:name="com.zai.sysvpn.SysVpnService"
     android:exported="false"
     android:permission="android.permission.BIND_VPN_SERVICE">
     <intent-filter><action android:name="android.net.VpnService"/></intent-filter>
  </service>`
  Apply via APKEditor (`work/APKEditor.jar`) or targeted AXML splice; fallback =
  full apktool rebuild of `beta_base_patched`.
- **`extractNativeLibs` must be true** so children can be exec'd from
  `nativeLibraryDir` (exec from filesDir is blocked on API 29+). Verify the
  built manifest's current value during Phase C; flip + re-align if false.
- **Size impact:** +7.7 MB (armeabi-v7a only — matches the current 32-bit
  universal build) or +15.3 MB if an arm64 variant lands later.

## 3. Component inventory (downloaded + verified → `download/v8-vpnkit/`)

| file | bytes | sha256 | verification |
|---|---|---|---|
| opera-proxy.android-arm | 7,505,536 | `fa063c29c80aff3df515ba2863e190fa4c92adc99a298feb3079b000f62f3f7e` | ELF 32-bit LSB PIE ARM EABI5, `/system/bin/linker`, Android 21+, NDK r27d, Go, stripped |
| opera-proxy.android-arm64 | 7,569,888 | `9502b761c9163827d14c68a73fd20f21a39535dba285791c7bd21e1ac14b685f` | ELF aarch64, Android 21+ |
| hev-socks5-tunnel-android-armeabi-v7a | 170,596 | `230da9afae932982c394489e414baa3a7c24d61d47b80c4834f0c9e02d960b28` | ELF ARM EABI5, **for Android 29** (matches minSdk 29), NDK r27d |
| hev-socks5-tunnel.aar | 617,551 | `ae8a2e96b80b4eccccd037805a4bb4a278090c89dbcae8bc6fcb7634e9a255b9` | jni/{armeabi-v7a,arm64-v8a,x86,x86_64}/libhev-socks5-tunnel.so + classes.jar (hev.htproxy.TProxyService) |

Sources: snawoot-proxies-forks/opera-proxy v1.15.0-fork (2026-03-25);
heiher/hev-socks5-tunnel 2.20.0 (2026-11-13).

## 4. Sandbox recovery status (recycle wiped /tmp/v7 + download/ + scripts/)

Recovered (persistent, GitHub `maniesh-NR/Vogelkop-MorphePatches`, public):
- Full repo tarball (pushed 2026-11-14T10:32Z): patch bundles v1.0.0–v1.3.0,
  scripts (`apply_v4/v5/v6_patches.py`, `build_v4/v5/v6_universal.sh`,
  `v6_bootstrap.sh`), harness state + session notes, recon docs
  (adblock-defaults, firstrun-dialogs, vpn-pro), jadx source backups.
- `sandbox-storage` release: **v6 universal APK** (+ nonews variant),
  PATCH-NOTES v2–v6, morphe.keystore, X/W-rung history, original .apkm inputs.
- `/tmp/my-project` (survived): apktool 3.0.3, build-tools r34 (android-14),
  jadx, `opera6/jdx{1,3}` jadx trees, `beta_decoded` + `beta_base` +
  `beta_base_patched` apktool trees.

Lost:
- **v7 build scripts** (`apply_v7_patches.py`, `build_v7_universal.sh`,
  `verify_v7_markers.py`) — the last backup ran during the v6 session. The
  complete 11-patch spec is preserved in §6 (sole surviving copy).
- v7 APK (user still has it installed — `adb pull` for byte-diff verification).
- PATCH-NOTES-v7.md (reconstructed in §6).

In flight: v6 APK → `/home/z/my-project/build-cache/`; harness clone →
`/home/z/my-project/.harness/vogelkop`. Next session MUST end with
`bash harness/bin/backup.sh` (project convention; v7 was lost by skipping it).

## 5. v8 build plan

- **Phase A — substrate:** confirm `.harness/vogelkop` clone; verify v6 APK
  sha256 `15cc03fc…` (per V6-SHA256SUMS.txt; full hash on the storage release).
- **Phase B — v7 re-derivation:** baksmali classes.dex + classes3.dex from the
  v6 APK; apply the 11 patches (§6); rebuild + splice → v7-equivalent; run
  marker verification.
- **Phase C — VPN feature:**
  1. `SysVpnService.java` (~200 lines) → javac (needs an android.jar — fetch
     platforms;android-34 or reuse build-tools) → d8 → merge into classes7.dex
     (smallest) → splice.
  2. Add `lib/armeabi-v7a/liboprx.so` (renamed opera-proxy.android-arm) +
     `lib/armeabi-v7a/libhev-socks5-tunnel.so` (from AAR).
  3. Manifest: add the service element; check/flip `extractNativeLibs`.
  4. Smali-patch `VpnProAppWidget` / `VpnProQuickSettingsTileService` click
     paths to toggle the service; retitle strings.
  5. zipalign -p 4 → apksigner (morphe.keystore, v1+v2+v3) → markers verify.
- **Phase D — remaining v8 items (§7)**, then the device test checklist.

## 6. v7 patch spec (preserved — sole surviving copy)

Pipeline: v6 APK base → baksmali classes1(classes.dex)+classes3 → apply patches
→ apktool/smali rebuild those dex → Python splice replaces entries → zipalign
-p 4 → apksigner (morphe.keystore v1+v2+v3).

| ID | file | change |
|---|---|---|
| V7a | `xoj.smali` | remove "Protect more devices" button (if-nez → nop) |
| V7b | `OperaApplication.smali` | VPN Pro widget available to free users (const/4 v8, 0x0 → 0x1) |
| C7 | `SettingsManager.smali` | cookies default 1 → 2 (block third-party) |
| N7 | `i06.smali` `b()` | all 7 notification-toggle rows always GONE |
| SD1 | `r4k.smali` | 3 SQL SELECTs get `WHERE 0` (speed-dial partner data) |
| SD2 | `PushedSpeedDialSuggestionProvider` | `getEntries` returns empty array |
| M3c | `d37.smali` | skip `wol.m` (REWARDS) menu item |
| R5a/R5b | `lk6.smali` | appearance routing `k3i.b()` gate removed (nop) |

v7 key findings carried forward:
- Acceptable Ads whitelist confirmed removed (tier1/tier2 allow rules →
  fixed bitmask 8).
- N1 (bo3) never applied — v6 script marker check was flawed (marker was the
  code AFTER the deleted block → always present → silent skip).
- N2 (rqd) was overridden: `i06.b()` re-called VISIBLE by a `d8d` observer.
- C7 was never applied in v5/v6 (wrong anchor); v7 used a corrected anchor.
- 3s black screen at first start = 84 MB libopera.so (32-bit) + Chromium init;
  a real fix needs arm64 libs.
- Free VPN path: `J.N.M3qiiNOP()` browser proxy (classes3/classes4 refs).

## 7. v8 requirements (from v7 device feedback — preserved)

1. NTP freeze 3–7 s at first paint (make immediate).
2. Preseeded Speed Dial links still present (facebook/google/instagram/booking/
   temu/live scores/wikipedia) — SD1/SD2 insufficient; hunt a third source
   (speeddial_bookmarks defaults? native seed?).
3. Adblock 78 % → 90 %+: lists are CDN-fetched (`https://blocklists.operacdn.com/`)
   — consider seeding/pinning (see repo `evidence/adblock-defaults-recon.md`,
   v1.3.2 recon already complete: 39-list default-on + opera_fixes removal).
4. Custom filter-list UI ("Add custom list" row does not exist in code —
   `ak`/`zj` constructors never called) → smali/XML injection needed.
5. Remove ad banners in the NTP news section.
6. "Protect more devices" still visible — V7a wrong class? Find the real VPN
   settings fragment.
7. VPN location menu (optimal/Americas/Asia/Europe) takes 5–8 s — make
   instant (region list fetch from SurfEasy API).
8. VPN Pro widget: with the embedded system VPN (this doc) the widget gets
   REPURPOSED as the free system-VPN toggle; otherwise remove it.
9. System-wide free VPN — this document.
10. Rewards-unlocked icons/wallpapers still invisible — R5a/R5b wrong class?
    (reference reddit.com/r/operabrowser/comments/1t1kinr).
11. "Rewards / earn rewards while you browse" settings row still present —
    M3c hit the main-menu item, not the settings row; find the settings-row
    class.
12. "In-app notifications" orphan header + separator must go (after N7 removed
    the 7 toggles).
13. Optional Morphe variant: full news / match-center / live-scores removal
    (nonews variant already exists for v6).

## 8. Risks & open questions

- `extractNativeLibs` current value in the built manifest (Phase C check).
- Region mapping: in-browser VPN shows optimal/Americas/Asia/Europe; opera-proxy
  offers EU/AS/AM + "fastest" — map optimal→fastest, Americas→AM, Asia→AS,
  Europe→EU.
- SurfEasy API reachability from the user's region (opera-proxy has
  bootstrap-dns fallbacks over DoH).
- If Opera ever blocks standalone device registrations: fallback = extract the
  browser's own registered device key from its storage and feed it to
  opera-proxy.
- TCP-only: document it in patch notes (UDP/QUIC apps degrade to TCP).
- Opera ToS: standalone use of the free tier mirrors the community ports;
  user's own device and free-tier credentials.

## 9. AS BUILT (2026-11-15, later session) — SHIPPED

The design above was executed with these corrections discovered on the way:

1. **The three `com.opera.android.vpn.*` components DO ship in classes3**
   (only the `com.kape.*` classes are absent). Adding duplicate classes was
   impossible, so their method bodies were surgically replaced instead:
   tile `onClick`/`onStartListening`, widget `c()`/`b()`/`onEnabled`,
   receiver `onReceive` (which also translates the legacy
   VPN_PRO_ENABLE/DISABLE/RESUME broadcasts). Service class still squats
   the free `com.kape.vpnservicemanager.data.externals.Service` manifest
   name in the new classes5.dex.
2. **Widget layout is `res/layout/vpn_pro_widget.xml`** (NOT
   widget_browser_one): container 0x7f0a08b7, status chip 0x7f0a08bc,
   location label 0x7f0a08bb, hint 0x7f0a08ba, bg on/off
   0x7f0806f4/0x7f0806f3. `Leif.onUpdate` routes widget adds to `c()`.
3. **`-server-selection first`** (not fastest) for instant connects.
4. Consent flow = notification tap (service cannot start the system dialog
   by itself from background; no activity in the manifest to borrow).
5. Region switching via notification action buttons (EU/AS/AM) through the
   patched VpnReceiver.
6. Added beyond the plan: V8a (VPN-settings "Protect more devices" row),
   V7b2 (tile enable site), N8 (orphan in-app-notifications header +
   separator via getChildAt(4)), RS8 (Rewards settings row — the real fix
   for the never-applied v6 bo3).

Result: `download/OperaBeta-104.0.5262.91143-custom-v8-universal.apk`
sha256 `cce194fecd22e1696afe0ca1b6099842f21b74bcea1e9d17897a6e64c09c947c`
(154,436,314 bytes). ALL v8 markers OK; full v4+v5+v6 regression OK;
entry-diff vs v6 = manifest + 3 dexes + 2 new libs + re-sign only.
See PATCH-NOTES-v8.md for install/test instructions and limitations.
