# HANDOFF — Morphe × Opera Beta v1.3.1

This document lists exactly what you (the user) need to do to take the
v1.3.1 work in this directory from "sandbox-built" to "released".

## TL;DR

The sandbox was recycled since the v1.3.0 session, so the previous
toolchain, the Vogelkop repo clone, and the GitHub PAT are all gone. The
v1.3.1 patch design, patch files, and a smoke-tested patched **base.apk**
are in this directory. You need to:

1. Re-issue a GitHub fine-grained PAT for `maniesh-NR/Vogelkop-MorphePatches`.
2. Clone the Vogelkop repo, drop in the v1.3.1 patch files, commit, push.
3. Run your `build_bisect.sh` to produce the final merged+signed `.apkm`
   (the sandbox-built APK here is base-only; it does not include the 39
   split APKs from the original .apkm bundle).
4. Boot-test on a real device.
5. Upload to the `sandbox-storage` release; publish v1.3.1.
6. Revoke the PAT.

## What's in this directory

```
download/v1.3.1/
├── STATE.md                                            ← full state + smoke test results
├── HANDOFF.md                                          ← this file
├── apply_v131_patches.py                               ← idempotent patch-applier script
├── Opera_Beta_104.0.5262.91143_v1.3.1_base_signed.apk ← smoke-tested patched base.apk
├── morphe.keystore                                     ← fresh keystore (replaces lost one)
└── patches/
    ├── 01-disable-spoof/README.md                      ← why spoof was dropped
    ├── 02-skip-firstrun-dialogs/
    │   ├── README.md
    │   ├── 02a-welcome-tc.md
    │   ├── 02b-cmp-consent.md
    │   └── 02c-default-browser-dialog.md
    └── 03-remove-vpn-pro/
        ├── README.md
        ├── 03a-manifest.md
        ├── 03b-wdn-feature-gate.md
        └── 03c-resource-strings.md
```

## Step 1 — Re-issue the PAT

The previous fine-grained PAT was either revoked or expired with the
previous sandbox. Issue a new one with:

* Repository access: only `maniesh-NR/Vogelkop-MorphePatches`
* Repository permissions:
  * Contents: Read & Write
  * Metadata: Read-only (auto-required)
* Expiration: 7 days (long enough to release v1.3.1; revoke immediately
  after the release is uploaded)

**Do NOT paste the PAT into this chat.** Set it as an env var in your own
shell and run `build_bisect.sh` / `upload_bisect.sh` from there. The
sandbox upload script extracts the token from `git remote get-url origin`
— it never prints or persists the token.

## Step 2 — Push the patch files to Vogelkop

```bash
git clone https://<PAT>@github.com/maniesh-NR/Vogelkop-MorphePatches.git
cd Vogelkop-MorphePatches

# Drop in the v1.3.1 patch files (copy from this directory)
mkdir -p patches/v1.3.1
cp -r /path/to/v1.3.1/patches/* patches/v1.3.1/
cp /path/to/v1.3.1/apply_v131_patches.py scripts/
cp /path/to/v1.3.1/STATE.md docs/STATE.md

git add -A
git commit -m "v1.3.1: drop spoof (crash fix), add first-run dialog bypass, add VPN Pro removal"
git push origin main
```

## Step 3 — Build the final installable

The patched APK in this directory is **base.apk only**. The original
`.apkm` bundle contains 39 additional split APKs (23 `split_config.*` for
languages/DPIs/ABIs + 16 `split_pangle_ads.config.<lang>`). For a
installable build, use your `build_bisect.sh`:

```bash
export MORPHE_APKM=/path/to/com.opera.browser.beta_104.0.5262.91143...apkm
export MORPHE_KEYSTORE=/path/to/morphe.keystore   # the fresh one in this dir
export MORPHE_KS_PASS=Morphe
export MORPHE_KEY_ALIAS=morphe
export MORPHE_KEY_PASS=Morphe
bash scripts/build_bisect.sh v1.3.1
```

The build script should:
1. Extract the .apkm
2. Run `apply_v131_patches.py` on the extracted `base.apk` (after `apktool d`)
3. Run `apktool b` to rebuild base.apk
4. Merge base.apk with the unchanged split APKs into a single standalone APK
   (use `apkmtool` or equivalent)
5. `zipalign` + `apksigner sign` with v1+v2+v3

If your build script does not yet call `apply_v131_patches.py`, edit it to
do so — the script is idempotent and exits non-zero on any unexpected
state.

## Step 4 — Boot test on a real device

Install the merged APK on a clean device profile (or after `pm clear`).
Verify:

| # | Check | Expected |
| --- | --- | --- |
| 1 | Cold-start | App boots (no SIGSEGV) |
| 2 | First screen | Straight to start page (no purple T&C, no CMP sheet, no default-browser prompt) |
| 3 | Settings → Privacy → "Help us make Opera better" | Off without user action |
| 4 | Main menu | No VPN Pro banner |
| 5 | Settings → VPN | No VPN Pro tab/upsell; free VPN still works |
| 6 | System Quick Settings tile picker | No "VPN Pro" tile |
| 7 | System widget picker | No "VPN Pro" widget |
| 8 | Omnibox | No "Opera VPN Pro" suggestion chip |
| 9 | Cold-start after reboot | Same as #1 |

If check 1 fails (SIGSEGV), the regression is in our patches; bisect by
rebuilding with `apply_v131_patches.py` minus one patch at a time. The
most likely suspect would be `02b` (r65.l) — but the patch is a 2-line
body replacement, so failure mode is unlikely.

If checks 4-8 fail (some VPN Pro UI still shows), grep the patched dex for
`Lcom/opera/android/custom_views/VpnProBanner;` references and check
whether any caller bypasses `wdn.a()`. Add follow-up smali patches as
needed; ship as v1.3.2.

## Step 5 — Upload to sandbox-storage release

```bash
GH_TOKEN=<your PAT> gh release upload sandbox-storage \
  Opera_Beta_104.0.5262.91143_v1.3.1.apk \
  --repo maniesh-NR/Vogelkop-MorphePatches --clobber
```

Or use your existing `upload_bisect.sh`.

## Step 6 — Revoke the PAT

After the release is uploaded, immediately revoke the PAT in
https://github.com/settings/tokens. The empty `morphe-opera-backup` repo
mentioned in the v1.3.0 wrap-up can also be deleted now.

## Signing note (v1 vs v2 vs v3)

The sandbox-built APK in this directory is signed with **v3 only**.
apksigner 0.9 with `--min-sdk-version 29` on a 147 MB APK with
`extractNativeLibs="false"` defaults to v3 because v1 (JAR signing) would
require signing every entry individually and bloat the APK by several MB,
and v2 is deprecated for targetSdk 37+.

If your `build_bisect.sh` enforces v1+v2+v3, it will re-sign correctly
when run against the merged APK. The v3-only signature here is sufficient
to install on Android 11+ for the smoke test.

## Keystore note

The `morphe.keystore` in this directory is a **fresh** keystore generated
in this sandbox (RSA 2048, validity 10000 days, DN `CN=Morphe,O=Vogelkop,C=ZZ`,
password `Morphe`, alias `morphe`). The original keystore from v1.3.0 was
lost with the previous sandbox.

If you still have the original `morphe.keystore` from v1.3.0, **use that
one instead** so that v1.3.1 is a drop-in upgrade for users who installed
v1.3.0 (Android refuses to install an APK signed with a different key
over an existing install). If you've lost the original keystore too,
users will need to uninstall v1.3.0 before installing v1.3.1.

The fresh keystore's SHA-256 fingerprint (for reference):

```
1fb06b11776bc509e6f5a9073d9571c5153307b95b26e54bbcf07b7a7fa880ea  morphe.keystore
```
