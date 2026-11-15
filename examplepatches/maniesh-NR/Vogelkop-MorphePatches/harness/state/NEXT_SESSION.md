# NEXT_SESSION.md — working memory / handoff

Updated: 2026-11-15 (v8 session: embedded system-wide free VPN, UTC)

## Current state

- **v8 SHIPPED**: `download/OperaBeta-104.0.5262.91143-custom-v8-universal.apk`
  sha256 `cce194fe…` (154.4 MB), signed with morphe.keystore (same key as
  v4-v7, updates over v7). ALL v8 markers verified; v4+v5+v6 regression
  suite passes; entry-diff vs v6 = manifest + 3 dexes + 2 libs + re-sign.
- v8 content = v7-equivalent patch set (re-derived after the recycle) +
  embedded system-wide free VPN (tun -> hev-socks5-tunnel ->
  127.0.0.1:18080 -> opera-proxy child -> sec-tunnel free servers) +
  fixes: V8a (Protect more devices, VPN settings row), V7b2 (tile enable),
  N8 (orphan in-app-notifications header + separator), RS8 (Rewards
  settings row - real fix for the never-applied v6 bo3).
- Build pipeline: `scripts/build_v8_universal.sh` (substrate v6 ->
  baksmali 1+3 -> apply_v8_patches.py (21 patches) -> apktool b ->
  ecj+d8 classes5 -> v8_splice.py (AXML extractNativeLibs/labels + payload)
  -> zipalign -p 4 -> apksigner). Sources: `scripts/v8src/**`.
- Toolchain re-provisioned this session: ecj 3.36.0 (Aliyun mirror),
  android-34 platform jar (dl.google.com), d8/zipalign/apksigner r34
  (/tmp/my-project/tools/android-14). Keystore re-fetched from the
  sandbox-storage release into /tmp + build-cache/.
- KEY LESSON (hit twice): when several smali method-body patches target
  the SAME file, they must be applied CUMULATIVELY (plan phase must chain
  the edited text, not re-read the original) - the first version silently
  clobbered earlier patches with later ones (T8a lost to T8b etc.).
- Opera component discovery: VpnProQuickSettingsTileService /
  VpnProAppWidget / VpnReceiver DO exist in classes3 (v7's belief "classes
  missing" only holds for com.kape.*). ien.l / yen.l disable both
  components for free users at startup (both sites now flipped to enable).

## Open threads (v8 device verdict pending)

1. First-enable flow: tile -> notification -> Allow -> tile again. Watch
   for: tun0 up, other-app IP change, region buttons, widget state,
   orphan-child cleanup after force-stop, boot (no auto-restart by design).
2. If tun establishes but no traffic: check `files/sysvpn/opera-proxy.log`
   (SurfEasy registration), hev config at `files/sysvpn/hev.yml`, and
   `adb logcat -s VpnService,ConnectivityService`.
3. Remaining v7 feedback items NOT yet addressed (design doc §7):
   NTP first-paint freeze (1), preseeded speed dial third source (2),
   adblock 78->90 (3), custom filter-list UI (4), news ad banners (5),
   VPN location menu latency (7), rewards icon/wallpaper visibility (10),
   optional news/match-center strip (13).
4. arm64-v8a variant still wanted for real 64-bit libopera.so.

## Next session should

1. `git -C /home/z/my-project/.harness/vogelkop pull --rebase --autostash origin HEAD`
2. Read `memory/MEMORY.md` -> this file -> the v8 episode.
3. Collect the v8 device verdict; iterate on the open threads above.
4. End every reply with `bash harness/bin/backup.sh`.
