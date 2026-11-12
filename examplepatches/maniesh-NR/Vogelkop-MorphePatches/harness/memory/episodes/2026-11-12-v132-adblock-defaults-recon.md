# Episode: v1.3.2 adblock defaults recon (2026-11-12)

## Context

- Roadmap next step after the harness/backup-policy session: v1.3.2 #8
  (adblock defaults + Secure DNS), blocked on recon (settings storage,
  list seeding, DoH location). W1/W2 still awaiting device results.

## What happened

- Fresh sandbox (recycle #3 wiped jadx/baksmali/apktool): re-provisioned
  jadx 1.5.2 + baksmali 3.0.10 into `/home/z/my-project/.tools/` (added
  `/.tools` to backup.sh rsync exclusions; knowledge updated).
- Learned: background processes are reaped between tool calls — full-APK
  jadx run died twice; switched to per-dex foreground runs
  (classes.dex → jadx-c1, classes3.dex → jadx-c3, baksmali both).
- Decoded `assets/op/abp.manifest` (binary format per `z4o.l0` + `izd`):
  base URL + 4 kind sets (ADBLOCK_URL/CDB_URL/TRACKER_URL/ADBLOCK_CSS) +
  per-list metadata with a MODE BITMASK (bit0=BALANCED, bit1=ENHANCED).
  Stock map: regionals + adguard_ads are CUSTOM-only (bitmask 0);
  opera_fixes + tier1/tier2 are on in both stock modes.
- Traced the apply chain: SettingsManager defaults → us4/qs4 combine with
  manifest bitmask → pi3 → Room DB active_block_lists → n9d asset copier /
  lj3 updater / engine. Custom-list add UI already ships in 103/104
  (lk screen, ak rows with Uri; selected_custom_lists JSON).
- Found the revert threat: server-pushed manifests (no7.a → zi3.q) persist
  via ko7 cache and would silently restore stock defaults.
- Wrote + tested `scripts/abp_manifest_patch.py`: byte-exact round-trip on
  stock (sha256 d75fb685…), removes opera_fixes everywhere, promotes 39
  lists to BE; verified output re-parses. Stable 103 + beta 104 manifests
  are byte-identical → one patch covers both; GX has no abp manifest.
- Designed the 4-part patch (A manifest / B empty opera_fixes assets /
  C SettingsManager defaults incl. DoH=Cloudflare / D zi3.k+q → h()),
  with exact smali targets captured (SettingsManager.smali lines 132/608/
  612 context; zi3.smali in classes.dex). All documented in
  `evidence/adblock-defaults-recon.md`; ROADMAP #8 + STATE.md updated.

## Outcome / handoff

- v1.3.2 #8 recon COMPLETE; implementation is fully specified and blocked
  only on the W2 device verdict (target substrate).
- DoH confirmed: l7j CLOUDFLARE = ordinal 1, endpoint
  https://opera.cloudflare-dns.com/dns-query (via SettingsManager
  dns_over_https_enabled/mode defaults).
- Note for build: zi3 is in classes.dex (W2 pipeline rebuilds classes3
  only — extend or use the binary patcher for D).
