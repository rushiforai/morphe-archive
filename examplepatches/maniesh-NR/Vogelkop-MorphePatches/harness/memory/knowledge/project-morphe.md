# Project: Vogelkop-MorphePatches (Opera de-ads)

## What

Morphe (ReVanced-style) patches that de-ad Opera stable / Beta / GX for
Android: remove sponsored Speed Dial, the third-party ad modules (Pangle,
Mintegral, Liftoff), the hidden Acceptable-Ads partner whitelists and
analytics endpoints; expose the extra filter lists Opera ships but disables
(uBO, AdGuard, Peter Lowe, Fanboy, 36 regional lists). Released as `.mpp`
bundles (latest release: v1.3.0); this repo is a first-class Morphe patch
source.

## Where things are

- Root `STATE.md` — release/ladder state (device verdicts, convictions)
- `PATCHES.md`, `CHANGELOG.md` — patch catalog / release history
- `patches/` — Gradle patch source (app.morphe plugin; builds need
  GITHUB_ACTOR + GITHUB_TOKEN with read:packages for GitHub Packages)
- `scripts/`, `tools/` — build/verify pipelines; hybrid smali pipeline is
  decode → edit → rebuild → splice → binary-patch → sign
- `docs/` — per-version rungs, HANDOFF files, `v1.3.2-ROADMAP.md`
- `evidence/` — APK reverse-engineering findings incl. decoded whitelists
- `extensions/` — runtime hook extension (`.mpe`), audited by AuditExtDex
- GitHub prerelease `sandbox-storage` — big binaries (inputs, keystokes,
  B/C/E/G/S/W rung builds). Wipe when patches are declared working (it
  contains the signing keys; the repo is public).

## State as of 2026-11-12

- v1.3.0 released. v1.3.1 W-rung: W1/W2 built + host-verified, AWAITING
  device test results (root STATE.md §W-rung: W1 = four innocent patches;
  W2 = W1 + smali-rebuilt classes3.dex with 02a' auto-accept, 02d/02e
  onboarding kills, 03d nt8 emptied).
- v1.3.2 roadmap drafted (docs/v1.3.2-ROADMAP.md): splash removal, Rewards
  removal, icons/wallpapers unlock, eSIM removal, default-browser notice,
  trending searches, VPN premium locations, adblock defaults (#8).

## v1.3.2 adblock patch — user-confirmed requirements (from the 2026-11-12 chat)

These answer the ROADMAP's open question "which list set reached 100%?":

- The list that reached **100%** on the user's test site was the **AdGuard**
  filter list (the built-in "enhanced" mode alone scored 35%).
- Enable **all regional lists** by default.
- **Disable and remove the "Opera site fixes" list** — it is enabled by
  default and whitelists certain domains and elements. Hypothesis to verify:
  it is another pure-whitelist list in `assets/abp_files/op/`, so the same
  neutralization used for the Acceptable-Ads whitelists (detect lists that
  contain only allow directives, replace with an empty compiled list under
  the same file name) should kill it.
- Add **all block lists that ship with uBlock Origin**.
- Add **custom blocklist support** (user can add their own lists).
- **Secure DNS on by default, provider Cloudflare (1.1.1.1)**.

Recon COMPLETE 2026-11-12 (see `evidence/adblock-defaults-recon.md` +
`docs/v1.3.2-ROADMAP.md` #8): catalog + mode bitmasks live in
`assets/op/abp.manifest` (binary format reverse-engineered, rewriter at
`scripts/abp_manifest_patch.py`); defaults live in SettingsManager.<init>
(classes3); the catalog can be replaced by server pushes (zi3/no7/ko7) so
the patch also pins zi3.k/q to assets. Implementation awaits the W2
device verdict.

## Gotchas

- `scripts/upload_storage.py` (repo root scripts/) has STALE paths from the
  old `/tmp/my-project` layout — use `harness/bin/storage_upload.py`.
- Sandbox toolchain is volatile: jadx/baksmali/apktool were wiped by recycle
  #3 (2026-11-12) and re-provisioned under `/home/z/my-project/.tools/`
  (jadx 1.5.2, baksmali 3.0.10; dir excluded from the backup mirror).
  Background processes are reaped between tool calls — run long decompiles
  in the FOREGROUND with a ≤10-min timeout, one dex at a time.
- Opera Beta inputs are `base.apk` + 39 splits inside the `.apkm`; GX is a
  WebView app (66 MB). Full input matrix: README "Which APK to patch".
- Play Protect prompts for every sideloaded APK — installer property, not
  patchable; release assets carry an Ed25519 signature instead.
