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
