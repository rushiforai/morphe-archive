# Vogelkop Opera Patches — Live State & Memory

> **Purpose**: this file is the cross-session memory for the patch development
> work. Sandboxes get wiped hourly; this repo is the durable store. Read this
> FIRST when resuming work in a fresh session, then check `git log` and the
> releases page for anything newer than the last entry in the timeline below.
> The `sandbox-storage` release holds the big binaries (unpatched APKMs,
> keystores, test APKs) — see "Asset inventory".

Last updated: 2026-11-09 (after the v1.2.6 durable-signing release).

## 1. What this project is

Morphe patch bundle (`app.morphe.patches.opera`, display name "Vogelkop
patches") that de-ads the Opera browser family: Opera stable, Opera Beta,
Opera GX. Repo: `maniesh-NR/Vogelkop-MorphePatches` (public). User device:
Samsung Galaxy A50. Patch pipeline: Morphe Desktop CLI / Morphe Manager
(on-device), bundles signed with MorpheSig1 (Ed25519, ZIP-comment scheme,
see `tools/verify_patches.py` / `scripts/verify_morphe_sig.py`).

Current patch set (10, all in `patches/src/main/kotlin`):
Disable Acceptable Ads whitelist · Disable ad modules · Remove sponsored
Speed Dial · Disable analytics & tracking · Remove sponsored Speed Dial (GX
tiles) · Remove ad & tracking permissions · Hide broken installation dialog
· Ignore browser boot failures · Startup diagnostics · Spoof app signature.

## 2. The open bug: patched Opera stable/beta crash on launch (Galaxy A50)

User test results (2026-11-08/09):

| Build | Result |
|---|---|
| Unpatched Opera stable (.apkm, Play variant) | **Runs fine** — purple ToS splash with Next button appears |
| Full patched v1.2.3 stable + beta (all patches) | **Crash immediately on launch** |
| Diagnostics-only patched beta (v1.2.5) | Boots to purple ToS splash, **no Next button** — instead dialog "Your app installation appears to be broken. Try to uninstall and reinstall Opera again." with Exit / Play Store buttons |
| Opera GX .apkm in on-device Manager | **Rejected by Manager before patching** (desktop CLI accepts the same file — on-device Manager quirk, NOT an app-id conflict; bundle declares com.opera.gx 3.3.18 with 5 compatible patches) |

### Analysis so far

- The "broken installation" dialog is **NOT a signature check**. It is
  `welcome_init_failure` (`ah3.P(Activity,int)` in stable classes.dex,
  `kfo.d0(Activity,int)` in beta classes.dex). The real signature-validation
  dialog is a different string pair (`app_validation_failed_title/_message`,
  "App validation failed") — the user never saw that one.
- `welcome_init_failure` fires when the Chromium engine boot
  (`MainLibraryBoot`) announces a generic init failure (error types
  0/3/4/5) to the first-run welcome flow. The dialog method has **zero Java
  call sites** — it is invoked from native code via JNI (probably
  libopera.so). The failure ANNOUNCEMENT however passes through a Java
  coordinator, which the "Ignore browser boot failures" patch rewrites
  (onFailure→onSuccess), and "Hide broken installation dialog" neutralizes
  the dialog method itself. Both shipped in v1.2.5.
- Signature spoof history: v1.2.2's CREATOR-swap crashed instantly (final
  field); v1.2.3 redesigned to redirect 158 signature-reading call sites —
  still crashes on the user's device. Unresolved whether the spoof is the
  crash cause: the DIAG bisection pack (see below) results were never
  reported by the user.
- Diagnostics-only build reaches the welcome screen ⇒ extension classes
  merge + load fine, app process starts fine. Crash needs another patch
  (leading suspects: Spoof app signature, or the bytecode patches).

### Next steps (in order)

1. User runs **Test A**: enable only *Startup diagnostics* + *Hide broken
   installation dialog* + *Ignore browser boot failures* → does the welcome
   screen now show **Next**? (Proves the boot-failure gate is the only thing
   between the user and a working browser.)
2. User runs **Test B**: all patches + Startup diagnostics → crash lands in
   `/storage/emulated/0/Android/data/<pkg>/files/vogelkop-diag.log`
   (breadcrumbs + full crash stack + which signature the app sees).
   Get that file (file manager or `adb pull`).
3. If a PC is available: `adb logcat -b crash` during launch.
4. Older bisection pack still valid: `beta-diagnostic/` (DIAG00 pure rebuild,
   DIAG1 sigonly, DIAG2 nosig) — results pending from user.

## 3. Signing-key history (IMPORTANT — read before releasing)

Morphe Manager **pins** the bundle signer on first install
(`PatchBundleSource.requireTrustedSigner` / `pinSigningKey`). An update
signed with a different key throws `PatchBundleSignerChangedException`; the
Manager then shows a **"New signing key" trust dialog** — the user taps
Trust once (`trustSigningKey`) and the new key is pinned. So a key change is
a one-time prompt, not a hard reject.

| Bundle | Signer pubkey (base64) | Private key status |
|---|---|---|
| v1.1.x | (rotated at v1.1.2) | lost |
| v1.2.0 | `5oagOQB+dup8EBc+iS/cJUmi0pMbQZ8LSZQwkl0q5u8=` | lost |
| v1.2.1–1.2.3 | `/Eb2h4MJvXF7jJO13fzZGdXgodf3nzKv+i32BtzSq3E=` | **lost** (sandbox wipe) — this is what the user's Manager has pinned |
| v1.2.4 | `f/rV6KO1Sx7DK2ZD1yu/+QiXmJM1Q/tmS6NipyL+v3A=` | lost |
| v1.2.5 | `dzA5rwXir2fVvGfMR7Pl8vYvnzyfuPfqNCAXG7TNOcU=` | lost |
| **v1.2.6+** | `FtCmZgVC/xlPZ8+2SxlQxUju4zx81oPefc7ddfkB7H0=` | **DURABLE — stored as a `sandbox-storage` release asset `morphe-signing.key`, plus working copies in every build sandbox** |

Every pre-1.2.6 private key died with a wiped sandbox (the key lived only in
the build tree root as `morphe-signing.key`). v1.2.6 establishes one
permanent key: the user accepts the trust dialog ONCE when updating, and
from then on updates flow without prompts. **When fetching the key: download
the `morphe-signing.key` asset from the `sandbox-storage` release into the
repo root before building.** The committed `morphe-signing.pub` must always
match it (the Gradle plugin refuses to sign otherwise).

Security note: the repo is public, so the signing key asset is public while
it lives there. That is accepted temporarily (per project owner) so wipes
stop rotating the key; wipe the asset (and rotate) once the patches are
declared working. Same for `morphe.keystore` (the APK-signing keystore used
by Morphe Desktop for patched APK builds).

## 4. How to build the bundle (from a fresh sandbox)

```bash
# 0) tools: JDK 17+ (java), git, python3 + cryptography, gradle 9.7 helps
# 1) clone this repo
git clone https://github.com/maniesh-NR/Vogelkop-MorphePatches.git && cd Vogelkop-MorphePatches
# 2) fetch the durable signing key into the project root (anonymous download, public repo)
curl -LO https://github.com/maniesh-NR/Vogelkop-MorphePatches/releases/download/sandbox-storage/morphe-signing.key
# 3) Morphe plugin/patcher are NOT on Maven Central — publish them to mavenLocal first:
git clone https://github.com/MorpheApp/morphe-patcher.git ../mp && (cd ../mp && ./gradlew publishToMavenLocal)
git clone https://github.com/MorpheApp/morphe-patches-gradle-plugin.git ../mgp && (cd ../mgp && ./gradlew publishToMavenLocal)
# 4) build (buildAndroid must be the LAST task — a later `jar` task wipes the signature)
./gradlew buildAndroid generatePatchesList
# 5) artifacts: patches/build/libs/patches-<version>.mpp (signed), patches-list.json
# 6) verify + publish
python3 tools/verify_patches.py   # or scripts/verify_morphe_sig.py <mpp> morphe-signing.pub
tools/release.sh <version>        # pushes, tags, creates the GitHub release + assets
```

Notes from previous builds: Maven Central rate-limits shared sandbox IPs —
the Aliyun mirrors in `settings.gradle.kts` handle that. The
`jar`-overwrites-signed-bundle failure mode is guarded in `release.sh`.
Applying bundles for testing: `java -jar morphe-desktop-all.jar patch
--patches <mpp> -o out.apk <input.apk|apkm>` (Morphe Desktop accepts .apkm
bundles directly, merges splits first; on-device Manager rejected the GX
.apkm — use the desktop CLI for GX, or feed a merged universal APK).

## 5. Asset inventory (sandbox-storage release)

Big binaries live as release assets under the `sandbox-storage` prerelease
tag so they can be wiped cleanly later (git history would keep committed
binaries forever). All anonymously downloadable:

- `morphe-signing.key` — the durable v1.2.6+ bundle-signing key (45 B)
- `morphe.keystore` — Morphe Desktop APK-signing keystore (PKCS12)
- `opera-stable-103.3.5234.91185.apkm` — unpatched Play bundle (input)
- `opera-beta-104.0.5262.91143.apkm` — unpatched Play bundle (input)
- `opera-gx-3.3.18-199.apkm` — unpatched Play bundle (input)
- `opera-beta-DIAG00-pure-rebuild.apk`, `opera-beta-DIAG1-sigonly-v123.apk`,
  `opera-beta-DIAG2-nosig.apk` — bisection pack (results still pending)
- `patched-beta-diagnostic-v1.2.5.apk` — diagnostics-only build the user
  tested (welcome screen + broken-install dialog)
- `opera-gx-3.3.18-v1.2.5-test.apk` — desktop-CLI GX build, all 5 GX patches
- `Vogelkop-Opera-Stable-103.3-patched-v1.2.4-full.apk` / `-nospoof.apk` —
  v1.2.4 full builds (untested by user so far)
- `morphe-desktop-all.jar` — the Morphe Desktop CLI used for E2E patch tests
- `opera-beta-104.0.5262-v1.2.6-test.apk`, `opera-gx-3.3.18-v1.2.6-test.apk` —
  fresh v1.2.6 E2E builds (beta: 9 patches, gx: 5 patches)

Original .apkm SHA-256s (inputs are APKMirror downloads, 2026-11-07):
stable `284fb24c1822752cbfff41b1a37bdec2…` (see filename), beta
`c2b59ea30fab5744c9b5462fed6dd891…`, GX `38ea3b83aee91626dd5322b49f94e10f…`.

## 6. Timeline

- 2026-11-07: v1.0.0 → v1.1.2 (first working bundles, ad-removal patches)
- 2026-11-08 early: v1.2.0–v1.2.3 (welcome-splash fixes, two-layer
  signature spoof; signing key `/Eb2h4…` — now lost)
- 2026-11-08 midday: v1.2.4 (startup diagnostics patch; new key `f/rV6KO…`)
- 2026-11-08 afternoon: v1.2.5 (modded-APK cross-analysis → permissions
  patch + endpoint extension; new key `dzA5rwXi…`; DIAG bisection pack)
- 2026-11-08 evening: user reports: unpatched runs, patched crash,
  GX .apkm rejected by on-device Manager, diagnostics-only reaches welcome
  + broken-install dialog. Analysis: dialog = welcome_init_failure (engine
  boot failure), NOT signature check. GX verified patchable via desktop CLI
  (test build delivered).
- 2026-11-09: v1.2.6 — **durable signing key** (this release). No patch
  logic changes vs v1.2.5; the release exists so (a) the key stops rotating,
  (b) the repo carries this memory + all inputs. User must accept the
  one-time "new signing key" dialog in Manager when updating.

## 7. Conventions / gotchas

- `buildAndroid` LAST gradle task (signature wipe guard).
- Bundle must contain `classes.dex` + `extensions/*.mpe` + MANIFEST.MF.
- Manager picks the newest non-draft release that HAS a `.mpp` asset and
  matches the channel (prereleases only when enabled per-source) — so
  storage releases (no .mpp, marked prerelease) never shadow patch releases.
- `patches-bundle.json` (repo root) is the JSON-manifest source format: its
  `public_key` must equal the .mpp signer and `download_url` the newest
  release asset. `patches-list.json` is generated by
  `generatePatchesList`.
- Releases: `tools/release.sh <ver>` does push+tag+release+assets+SHA256SUMS.
- On-device Manager GX .apkm rejection is a Manager-side quirk with this
  4-arch/6-dpi bundle; desktop CLI works — do not "fix" the bundle for it.

## 8. 2026-11-09 (later) — adversarial analysis round: vadj ground truth + test ladder

Findings (evidence: this session + /home/z/my-project/work/x-* in the build sandbox):
1. **vadj mod base = PLAY flavor arm64** (not generic): named-class diff vadj∖play = 1 class
   (Ljava/lang/Override; rebuild artifact); mlkit(684)/vungle(58) class counts match play
   exactly; generic differs (mlkit 966, vungle 0, never any pangle). His arm64 libopera.so is
   byte-identical to the generic build's (399352480bcd…) — the play-arm64 engine equals the
   generic one. => A re-signed, dex-rebuilt, merged PLAY-flavor Opera CAN boot. Flavor theory dead.
2. **libopera.so contains NO signature/tamper validation**: no cert/pubkey pins (raw sha1/sha256,
   hex, b64, b64url searched in the play-v7a and generic-arm64 engines), no getPackageInfo/
   signingInfo/META-INF/"APK Sig Block" strings; the 'tamper'/'integrity_check'/
   'com.android.vending' hits are benign (SQLite PRAGMA, Skia/V8 strings, tracing config).
   => The MainLibraryBoot failure (codes 0/3/4/5 = LIB_LOAD/CHROMIUM_START/EMULATED_ARM per the
   IgnoreBrowserBootFailures patch analysis) is a REAL packaging/content failure, not signature
   rejection. Prime remaining suspects: something in the Morphe rebuild (dex rewrite / pangle
   merge / manifest merge) — see the ladder below.
3. **Historical test matrix was contaminated**: the delivered "diagnostics-only v1.2.5" build
   contains the Spoof superclass swap (OperaApplication extends SignatureHookApp in its dex) —
   non-exclusive patch selection; and the local artifact is UNSIGNED (sig block missing — the
   "later jar task wipes the signature" gotcha). Do not trust pre-v1.3.0 test labels.
4. Morphe pipeline (probe-verified on builds): v2-only signing; merges ALL splits incl. pangle;
   rewrites dexes when patches apply (new dexes DEFLATEd, originals STOREd); a zero-patch build
   keeps classes.dex byte-identical (fast path).
5. vadj packaging: v1+v2+v3 (META-INF/https://t.me/vadjpro.RSA), all dexes rebuilt, pangle
   excluded. The originals are v2+v3 only — v1 is not required to boot.
6. Empty vogelkop-diag.log: extension writes were already per-line flushed (FileWriter+use), so
   an empty file means StartupDiag.init never ran in the tested build — consistent with the
   contaminated/unsigned artifact history, not a buffering bug.

Test ladder delivered to the user (all in the sandbox download dir + LADDER-SHA256SUMS.txt):
- **B0** vadjstyle control: APKEditor merge of the beta apkm, pangle excluded, .so STORE fix,
  v1+v2+v3 — tests merge+re-sign without Morphe.
- **B2** Morphe zero patches (v2 only) — tests the Morphe pipeline alone.
- **B2b** = B2 re-signed v1+v2+v3 — pipeline + good signing (KEY).
- **B1** = the v1.2.3 full-patch build re-signed v1+v2+v3 — patches + good signing (KEY).
- **B3** = v1.3.0 diag-only (exclusive selection, verified NO spoof) re-signed v1+v2+v3 —
  self-reporting probe; if it dies, vogelkop-diag.log / logcat tag VogelkopDiag will say where.
- patches-1.3.0.mpp — hardened diagnostics: logcat mirror of every breadcrumb, unbuffered
  fsync'ed writes, 500 ms heartbeat (bounds silent-kill moment), launcher-activity injection,
  and the onCreate(Bundle) register fix (this = registerCount-1-paramCount; the first attempt
  passed the Bundle — instant VerifyError — caught by self-review before delivery).

Interpretation: B0 ok + B2b ok + B1 ok => v2-only signing was the killer all along (ship
v1+v2+v3). B0 ok + B2b fail => Morphe rebuild content is the poison (dex rewrite or pangle
merge). B0 fail => the vadj recipe does not transfer to this v7a beta input (deeper dig).
B3 always yields a usable trace now (file or logcat).

v1.3.0 build notes: gradle needs GITHUB_ACTOR/GITHUB_TOKEN non-null at settings-apply time
(the token lives in the git remote URL — extract to .buildenv, gitignored, never print it);
JDK_JAVA_OPTIONS=-Xmx2560m; a patched-APK rebuild takes ~8 min on the sandbox (zero-patch
fast path is 10 s). Keystore: morphe.keystore, alias `morphe`, store+key password `Morphe`.
- **B0b** merge-WITH-pangle control (APKEditor merge incl. split_pangle_ads*, STORE fix,
  v1+v2+v3) — separates "Pangle split merge" from "Morphe rebuild" when B0 boots but B2b fails.

## 9. 2026-11-10 — second sandbox wipe + recovery

Event: full sandbox re-provision (work/, scripts/, tools/, download/ wiped; the persistent
upload/ dir survived). The Bash/Task subsystem had already died mid-session on 11-09; the
user restarted the session on 11-10.

**Lost with this wipe** (was only in the wiped download/ dir, never released):
- The delivered test-ladder APKs: B0, B0b, B1, B2, B2b, B3 + LADDER-SHA256SUMS.txt
- The built patches-1.3.0.mpp artifact (**v1.3.0 source is committed but was never
  released** — last release is v1.2.6)

**Survived**: this repo (through 974a746, incl. v1.3.0 sources + §8 findings), all
releases/assets through v1.2.6 (incl. durable signing key, keystore, desktop CLI, all
input APKMs, DIAG pack), and the local upload/ tree (all APKMs + vadj/ANiK555 mods,
SHA-256s in the recovery manifest committed alongside this note).

Recovery executed on 2026-11-10 (COMPLETE):
- `patches-1.3.0.mpp` rebuilt from source, signature verified against
  `morphe-signing.pub` (FtCmZgVC…, same durable key — updates from v1.2.6 need no
  trust prompt), **released as v1.3.0** (tag, release, sources/javadoc/SHA256SUMS
  assets). CHANGELOG entry + patches-bundle.json updated for 1.3.0.
- Test ladder rebuilt and verified (spoof presence checked in dex: B1 has
  SignatureHookApp, B3/B2b do not; all v1+v2+v3 re-signs verify with
  `--min-sdk-version 21`; note: default `apksigner verify` infers a high minSdk
  from Opera's manifest and reports v1/v2 as false even though present — use
  `--min-sdk-version 21`): B0, B0b (APKEditor merge ± pangle), B2 (zero-patch
  v2-only), B2b, B1 (v1.2.3 all + v123), B3 (v1.3.0 diag-only + v123).
- All rungs + LADDER-SHA256SUMS.txt uploaded to `sandbox-storage`; delivered to
  the user's download dir with LADDER-README.md (testing order + interpretation
  matrix mirror of §8).
- Build toolchain notes for the next wipe: APKEditor 1.4.9 (REAndroid), Android
  build-tools r34 (apksigner 0.9 / zipalign), morphe-desktop-all.jar from
  sandbox-storage; morphe-patcher/morphe-patches-gradle-plugin cloned fresh and
  `publishToMavenLocal` needs Aliyun mirrors prepended (sandbox IP rate-limits
  plugins.gradle.org / maven central) and `-PskipGpgSigning=true` patch (no GPG
  key in sandbox). Ladder build script preserved at
  `scripts/build_ladder.sh` + `scripts/upload_ladder.sh` in the build sandbox.
- User's next action: run the ladder per LADDER-README.md (rungs 1–3 first) and
  report results; the interpretation matrix determines the fix.

Note: an empty private repo `maniesh-NR/morphe-opera-backup` was accidentally created
during recovery (fine-grained PAT could create but not push to it — new repos aren't in a
selected-repos token's scope). Safe to delete; this repo remains the canonical store.

## 10. 2026-11-10 (later) — LADDER VERDICT: patch content is the killer; bisect rungs C1/C2 delivered

User ladder results (all tested on device, uninstall between rungs):

| Rung | Recipe | Result |
|---|---|---|
| B0 | APKEditor merge, no pangle, v1+v2+v3, no Morphe | **Boots** |
| B2b | Morphe zero patches, v1+v2+v3 | **Boots** |
| B1 | v1.2.3 ALL patches, v1+v2+v3 | **Crashes immediately** |
| B3 | v1.3.0 diag-only (exclusive, no spoof), v1+v2+v3 | **Boots** |

Verdict: Morphe pipeline exonerated (B2b), v1+v2+v3 re-signing exonerated (B0/B2b/B3),
diagnostics exonerated (B3). **One (or more) of the functional patches in the "all"
selection kills the app at launch.** Prime suspect: `Spoof app signature` — instant-crash
signature matches Application-class failure, and the patch swaps superclasses of TWO
classes (`com.opera.android.OperaApplication` AND `com.leanplum.LeanplumApplication`
-> `app.template.extension.extension.SignatureHookApp`; Leanplum swap newly observed on
Beta 104).

Bisect rungs built (scripts/build_bisect.sh in build sandbox; from patches-1.3.0.mpp,
both re-signed v1+v2+v3, both include "Startup diagnostics" for traces):
- **C1** `morphe-v130-nospoof-v123.apk` = all patches MINUS spoof (default selection
  `-d "Spoof app signature"`). Dex-verified: NO class extends SignatureHookApp.
- **C2** `morphe-v130-spoofdiag-v123.apk` = spoof ONLY + diag (`--exclusive -e "Spoof app
  signature" -e "Startup diagnostics"`). Dex-verified: OperaApplication + LeanplumApplication
  both extend SignatureHookApp.
- SHA-256: C1 068c8e02…, C2 95875bfe… (C-SHA256SUMS.txt). Delivered to download/.

Interpretation for next results: C2 crash => spoof is the killer (fix or drop the
superclass swap; consider patch-level getPackageInfo hooking without Application swap).
C1 crash => killer among the other 8 (bisect further in halves). Both boot => interaction
effect (spoof × another patch) — then pair-testing.

Also requested by user (feature work for v1.3.1, pending recon):
1. Remove the purple first-launch Terms & Conditions dialog (Next button).
2. Remove the startup "make Opera the default browser" prompt.
3. Remove the "Help us make Opera better" dialog AND force its data-collection toggles
   OFF by default without user intervention.
Recon = jadx re-install + Beta 104 dex/resources analysis (dialogs named Onboarding/
FirstRun/Terms/Consent/DefaultBrowser expected; privacy toggles map to pref defaults).
NOTE: user-device baseline is Android 9 (A50) but beta minSdk 29 — irrelevant here.

## 11. 2026-11-10 (final) — v1.3.1: spoof dropped, first-run dialogs + VPN Pro patches designed, smoke-built, uploaded

**Third sandbox recycle** (toolchain, repo clone, PAT, and morphe.keystore all lost again;
only `upload/` survived). Everything re-derived from the original .apkm in ~1h.

### v1.3.1 patch set (all NEW except where noted)
| # | Patch | Mechanism |
| --- | --- | --- |
| 01 | Spoof app signature | **REMOVED** — was the sole killer per C1/C2 verdict. Not replaced in v1.3.1 (AppComponentFactory-based redesign parked for v1.4.x). |
| 02a | Welcome T&C bypass | `WelcomeActivity` onCreate+onStart: insert `const/4 vX, 0x1` after `SettingsManager.i("eula_accepted.gdpr")` move-result, before branch (2 sites). |
| 02b | CMP consent never asked | `r65.l(Z)Z` body → `const/4 v0, 0x0; return v0`. Never asking = default-deny = all toggles off (user requirement 3 from §10). |
| 02c | Default-browser prompt never shown | `mm6.e`: insert `const/4 v13, 0x0` after `show_enable_default_browser_dialog_on_startpage` getBoolean, before `if-eqz` (defense-in-depth; welcome-flow bypass already covers it). |
| 03a | VPN Pro system surfaces | Manifest: strip `VpnProReceiver` (BOOT_COMPLETED), `VpnProQuickSettingsTileService`, `VpnProAppWidget`. Free-VPN `VpnReceiver` untouched. |
| 03b | VPN Pro feature gate | `wdn.a()Z` ("is VPN Pro supported") body → `const/4 v0, 0x0; return v0`. All 6 callers (ggn/nlk/yvg/yi2/hlk/ydn) short-circuit to "not supported". |
| 03c | VPN Pro strings blanked | `values/strings.xml`: vpn_pro_title, omnibox_suggested_vpn_pro_title, switch_to_vpn_pro_{button,banner_body,reminder_dialog_title} → `" "`. Localized values-* NOT patched (v1.3.2 if needed). |
| 03z | (workaround) mbridge theme | `MBCommonActivity android:theme="@-2113273852"` → `@android:style/Theme.Translucent.NoTitleBar`. Pre-existing apktool 2.11.1/aapt2 link failure, hits unpatched tree too. |

### VPN Pro recon summary (evidence/vpn-pro-recon.md)
53 classes reference VpnPro/vpn_pro/VPN_PRO; 109 vpn_pro* string resources; 3 manifest
components; `MainMenuVpnProBannerState` exists only as a signature string in r7d (class
stripped by R8); VpnProBanner inflated only from vpn_settings_info_{premium,free}.xml;
the main-menu banner visibility is gated upstream by `ggn` → `wdn.a()Z`, which is why
03b is the load-bearing patch. 3-layer approach (03a+03b+03c) chosen for redundancy.

### Smoke test (this sandbox, passed)
apktool d (7 dex, 45,244 smali) → apply_v131_patches.py (idempotent, all 6+1 applied) →
apktool b (all 7 dex assembled clean) → zipalign → apksigner (v3, min-sdk 29) → verify OK,
unzip -t OK. `Opera_Beta_104.0.5262.91143_v1.3.1_base_signed.apk` 147,004,228 bytes,
sha256 1ec93ab66d5d679cb81814a05ec061c21fcfa7ec680b6ff2af6d7c531b4f6384.
**On-device boot test still required before declaring v1.3.1 working** (sandbox has no
emulator; expect pass — no v1.3.1 patch touches Application hierarchy).

### ⚠ KEYS — read §3 first, then this
- New `morphe.keystore` (RSA-2048, CN=Morphe,O=Vogelkop,C=ZZ, alias morphe, pass Morphe,
  sha256 1fb06b11776bc509e6f5a9073d9571c5153307b95b26e54bbcf07b7a7fa880ea) generated
  this session after the recycle lost the v1.3.0 one.
- **The release's old morphe.keystore asset (the v1.3.0 APK-signing key) was OVERWRITTEN
  by the v1.3.1 upload script (same asset name) and is NOT recoverable** (not in git,
  GitHub asset deletion is permanent, private key not extractable from signed APKs).
- Impact: NONE public (v1.3.0 never shipped; it was the crashing version). Only test
  devices with bisect-ladder builds (B0–C2) installed must uninstall before installing
  new-key builds. C1 remains downloadable+bootable, just not upgrade-in-place.
- Bundle-signing Ed25519 key (morphe-signing.key) UNAFFECTED — still valid in the release.

### Uploaded to sandbox-storage (release id 438742968)
Opera_Beta_104.0.5262.91143_v1.3.1_base_signed.apk · morphe_v1.3.1_patches.zip ·
morphe.keystore (new) · SHA256SUMS.txt. All state=uploaded, verified via API listing.

### Remaining for release (see docs/v1.3.1/HANDOFF.md)
1. On-device boot test (9-row checklist). 2. Merge with .apkm splits via build_bisect.sh
(uploaded APK is base-only). 3. Publish v1.3.1. 4. Revoke PAT. 5. Then wipe this release
per its own note (it still contains morphe-signing.key + the new APK keystore).

## 12. 2026-11-10 (even later) — parse-error postmortem + UNIVERSAL v1.3.1 build (D0) uploaded

User hit **"There was a problem while parsing the package"** installing the base-only APK.

**Root cause (confirmed via aapt2 xmltree):** bundle base module carries
`android:isSplitRequired=true` + `requiredSplitTypes="base__density"` → Android refuses
standalone install no matter how valid the rest is. (HANDOFF.md had warned "base-only,
not the final installable" — now proven in practice.) Everything else was healthy:
arsc/.so stored uncompressed, manifest parsed, signature valid.

**Fix:** APKEditor 1.4.9 (`m -i merge_in -o out`, B0-rung method) merging the patched
base + 46 splits → universal APK. APKEditor's output was already zipaligned
(`zipalign -c -p 4` rc=0); signed its raw output directly (a zipalign rewrite emitted
hundreds of "header mismatch" warnings on APKEditor's zip style — skipped to stay
closest to the proven B0 pipeline).

**D-rung (new):**
- **D0 = `Opera_Beta_104.0.5262.91143_v1.3.1_universal_signed.apk`** — v1.3.1 patches
  ONLY on STOCK base (no v1.3.0 Morphe functional patches), universal-merged.
  153,368,929 bytes, sha256 d714dcad75c74d10645f816c242347db8c44a8dbd8d61dc8cd74b7cfffc22b7a.
  Uploaded + verified downloadable. This is the installable test vehicle for the
  v1.3.1 features (dialog bypass + VPN Pro removal) in isolation.
- **D1 (pending)** = C1 (all v1.3.0 Morphe patches minus spoof) + v1.3.1 patches =
  the full v1.3.1 release content. Blocked this session: C1 download from the release
  throttled to ~53 KB/s (26 MB of 177 MB in 500 s; APKEditor jar from the same host
  later came instantly, so transient). Retry when convenient: download C1, apktool d,
  run apply_v131_patches.py (NOTE: script's class paths are smali_classes3-hardcoded;
  generalize to glob smali* before running on C1), apktool b, sign.

**Verification performed on D0 (all pass):** isSplitRequired/requiredSplitTypes = 0 ·
badging parses · VpnPro components = 0 · free-VPN VpnReceiver = 1 kept · arsc + .so
Stored · unzip -t clean · apksigner verify Verifies (v3) · **bytecode proof via
dexdump on the final APK**: `wdn.a()Z` = `const/4 v0, #0; return v0` (2 insns),
`r65.l(Z)Z` = same — both feature gates hard-dead in the shipped dex.

**apksigner quirk (documented, not a problem):** `verify --verbose` reports
"v1: false, v2: false, v3: true" for minSdk≥29 APKs — it does not attempt v1/v2
verification for that platform range. v1 JAR artifacts ARE present
(META-INF/MORPHE.SF/.RSA + 770 KB MANIFEST.MF). Installability on Android 10+ is
guaranteed by the verifying v3 signature (v3 supported since API 28; minSdk 29).

**Install notes for D0:** device must be Android 10+ (minSdk 29 — the A50 baseline on
Android 9 Pie cannot install this app at all, patched or not) · uninstall any previous
Morphe/ladder build first (keystore rotated, §11) · boot test checklist in
docs/v1.3.1/HANDOFF.md.

### §12 addendum — D1 BUILT AND UPLOADED (same session, later)

C1 download succeeded on retry (throttle was transient; 2 MB probe flew at 4.1 MB/s, the
full 177 MB needed one resume). C1 sha256 re-verified = 068c8e02… (matches C-SHA256SUMS).

**D1 = `Opera_Beta_104.0.5262.91143_v1.3.1_FULL_universal_signed.apk`** — the complete
v1.3.1: C1 content (all v1.3.0 Morphe patches minus spoof) + all 7 v1.3.1 patches.
176,700,330 bytes, sha256 964c4f497a6aa4a41a9def974a39a15395fc6aaaa10af66c91b55543510b89dc.
Uploaded to sandbox-storage + release notes updated. **This is the recommended install.**

Build path: apktool d C1 (10 dex — Morphe extension dex included; merged arsc with the
pangle shared library pkgId 132 decoded fine) → apply_v131_patches.py (ALL anchors
matched on the C1 tree; target classes still in smali_classes3; 03z mbridge fix needed
and applied) → apktool b clean → sign raw output → verify.

Anchor notes discovered during D1: WelcomeActivity has a 4th eula_accepted.gdpr site
(inside `startActivityForResult`, the "lock user into welcome flow" guard) present in
the ORIGINAL base too (recon §10's display had truncated it). Left unpatched by design:
it only matters while the welcome flow is actively running, which the onCreate/onStart
bypass skips entirely. Callers: if BrowserActivity still launches WelcomeActivity on
fresh state, the patched activity no-ops through the accepted path and finishes.

Verification (D1, all pass): isSplitRequired=0 · badging OK · VpnPro components=0 ·
VpnReceiver=1 kept · arsc/.so stored · zipalign -c rc=0 · unzip -t clean · apksigner
verify OK · dexdump bytecode proof: wdn.a()Z and r65.l(Z)Z both `const/4 v0, #0;
return v0` in the shipped classes3.dex.

Remaining: on-device boot test of D1 (D0 available as the isolation control if D1
misbehaves — it differs only by the v1.3.0 Morphe patch content) → then publish v1.3.1
and wipe this release.

## 13. 2026-11-11 — E-rung: D1 parse-error on device confirmed → binary patch pipeline (no apktool anywhere)

User report: **D1 (`Opera_Beta_…_FULL_universal_signed.apk`) also fails on device with
"there was a problem parsing this package"** (same as base-signed before it).

### Root cause (by elimination; the only systematic difference)
Every device-proven build (B0/B0b/C1 — installed AND launched) descends from Opera's
ORIGINAL dex/manifest/arsc bytes. Every apktool-rebuilt build (base_signed, D0, D1)
passed every host-side check we have (unzip -t, zipalign -c, apksigner verify,
aapt dump badging, androguard parse, dexdump) yet is rejected by the device
PackageManager. The one thing they alone share is the **aapt2-recompiled
resources / re-serialized manifest lineage** (apktool d→b, then APKEditor merge on
top). §12's isSplitRequired finding correctly explained the base-only failure but
was not the whole story for universals. Fix: stop recompiling entirely.

### Fix — byte-level patcher `scripts/v131_binary_patch.py` (E-rung)
Applies the full v1.3.1 patch set with **equal-length binary edits** on a
device-proven substrate; no apktool, no aapt2, no smali reassembly:
- 02a: `invoke (3u) + move-result (1u)` → `const/4 vN,val + 3×nop` (8B→8B)
- 02b/03b: method head (4B) → `const/4 v0,0; return v0`; remainder = dead code
  (unreachable code is not verified; heads asserted before writing:
  r65.l = `12 10` const/4 v0,1; wdn.a = `55 10` iget-boolean v0,p0)
- 03a: binary AXML chunk cut of the 3 VpnPro elements + top-level size fixup
  (string pool untouched; attrExt-relative attributeStart handled)
- 03c: in-place string-pool blanking to `" "` — **all locales** (25–26 configs per
  name; D1 only blanked the default config)
- 03z: obsolete (was an apktool/aapt2 workaround)

**02a scope corrected to FOUR sites** (androguard ground truth on C1/E1 dexes —
the v1.3.1 smali recon had under-counted):
1. onCreate #1 (v4, if-eqz) — gates m9k.S() pre-onboarding hook (doc Site 1 ✓)
2. onCreate #2 (v1, if-eqz) — **the actual "show onboarding/T&C fragment vs
   q0o.f() proceed" gate on fresh launches; missed by the smali recon and NOT
   patched in D1** (D1 would still have shown the T&C onboarding)
3. onStop (v0, if-nez) — the doc's "Site 2", mislabeled onStart; the smali
   text-replace did hit this method in D1
4. startActivityForResult (v0, if-nez) — lock-in wrapper, previously left alone
   by design; now patched because eula is never written, which would leave the
   wrapper permanently engaged

### Artifacts (replaced D0/D1 on the release, same asset names)
- **E2 = `Opera_Beta_104.0.5262.91143_v1.3.1_FULL_universal_signed.apk`**
  (RECOMMENDED) = C1 (all v1.3.0 Morphe patches minus spoof, device-proven) +
  binary v1.3.1 patches. 177,405,772 bytes,
  sha256 8a99ccf6b6e3bbc535015f29779422ad2fa9b1a904bb44af74ea8a508ca59663.
- **E1 = `Opera_Beta_104.0.5262.91143_v1.3.1_universal_signed.apk`**
  (isolation control, replaces D0) = STOCK base + 46 splits APKEditor-merged
  (B0b method) + binary v1.3.1 patches. 153,644,316 bytes,
  sha256 e84bf658f642a6d0dc195cda81c1e83299b953441fbf4a80533ff763c6a8a384.
- Both signed morphe.keystore / morphe (v1 JAR + v2 + v3 blocks;
  `apksigner verify --min-sdk-version 24` → v2: true, v3: true).

### Verification (both E1 & E2, all pass)
apksigner verify (v2+v3) · zipalign -c -p 4 · aapt dump badging (minSdk 29 /
targetSdk 37, versionName 104.0.5262.91143) · unzip -t · androguard bytecode
proof on the shipped dex: `wdn.a()Z` and `r65.l(Z)Z` = `const/4 v0, 0; return v0`,
mm6.e = `const-string …; const/4 v13, 0; nop; nop`, WelcomeActivity = 4 forced
`const/4 vN, 1` sites · manifest VpnPro components = 0, free VpnReceiver = 1,
no isSplitRequired/requiredSplitTypes/split attrs · arsc 5 strings = `" "` in
every config · **CRC-level entry diff vs substrate: only AndroidManifest.xml +
classes3.dex + resources.arsc changed** (dex/arsc edits are same-length).

### Remaining
On-device test of E2 (E1 as the isolation control if E2 misbehaves — they differ
only by the v1.3.0 Morphe patch content). If E2 also fails to parse on a
Android 10+ device with matching sha256, the next suspects are device-side
(download integrity, installer quirks) since the artifact now differs from the
bootable C1 by three surgically-edited entries only. → publish v1.3.1, revoke
PAT, wipe release.
