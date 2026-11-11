# Version support

The patches are fingerprinted against exact app versions. R8 reassigns every class and method name
on each release of YouTube VR, so a new version means the matchers have to be checked again — see
[FINGERPRINTS.md](FINGERPRINTS.md) for which ones anchor on stable facts and which do not.

## The rule that surprises people

A version that is **not** listed in
`patches/src/main/kotlin/app/ytvr/patches/shared/Constants.kt` is **skipped, not failed**. The
patcher prints a skip, exits 0, and produces an app with **none** of the fixes — it looks like a
successful run. So:

- Always check that the expected patches were *applied* (`Applied: Extension`, …), not just that
  the run did not error.
- `scripts/patch-and-install.ps1` does this for you: it asserts that the expected patches were
  applied (`-RequirePatches`, by default every patch that is on by default) and refuses to install a
  build where they were skipped.

## What the version list means

| declared as | meaning |
|---|---|
| `AppTarget(version = "X.Y.Z", description = "Verified: …")` | every fingerprint was re-derived against that build; the patches are expected to work. `SUPPORTED_APP_VERSION` (top of `Constants.kt`) is the single source the Spoof app version option default follows and must name the newest normal target |
| `AppTarget(version = "X", isExperimental = true, description = "Untested: …")` | nobody has re-derived the fingerprints for that build. The patches are *attempted*; some are expected to fail. This is the honest "try it, it is not guaranteed" channel, and it shows up in Morphe Manager |
| not listed at all | skipped silently — see above |

Never list an untested version as a normal target: that is how a user ends up with a silently
half-patched app.

## Which versions are supported, and for how long

The support policy is **the latest two normal targets**, each carrying a `// Kept: <reason>`
comment directly above its `AppTarget(` — the same discipline as the official Morphe bundle, which
keeps only the versions that still earn their place and annotates each with why. A version is kept
while the store can still serve it to headsets that have not updated (dropping it strands users who
cannot force-update); it is dropped when a third version is added, in the same change.

Two guards keep the policy honest instead of aspirational, and both fire on a violation:

- `SupportedVersionsPolicyTest` (run by every build) asserts the count, the `Kept:` comment above
  each normal target, and that `SUPPORTED_APP_VERSION` names the newest of them.
- `scripts/check-apk.ps1` patches every APK on the list, so a stale target that the fingerprints
  no longer match fails visibly instead of rotting.

The `Kept:` comment must sit **above** the `AppTarget(` line, never inside the parens: the upstream
checker's regex (`AppTarget\s*\(\s*version`) cannot cross a comment line, so a comment inside the
parens would hide the target from it — which is exactly why `SupportedVersionsPolicyTest` reads the
file the same way that checker does.

## Where users see the supported list

Three generated places, all fed from `Constants.kt` so they cannot drift from what the patcher
actually does:

| place | what carries it |
|---|---|
| the README | the "🎯 Supported versions" table (`generate_patches_readme.py` over `patches-list.json`) |
| Morphe Manager | each `AppTarget`'s description, compiled into the bundle |
| **every release's notes** | a trailing **"📱 Supported app versions"** section — "This release patches **YouTube VR 1.91.10** and **1.90.05** (Meta Quest)…" |

The release section is written by `.github/scripts/supported-versions-notes.mjs`, a
semantic-release `generateNotes` plugin, so it lands in the GitHub release body, `CHANGELOG.md`,
and `patches-bundle.json`'s description (which Morphe Desktop's "Patch notes" viewer renders) in
one stroke. It states the *state* of support; the *change* per release ("support X added, Y
dropped") still arrives the usual way, as a commit bullet. The parser it reads `Constants.kt` with
is the same module the upstream checker uses (`scripts/supported-versions.mjs`), mirrored by
`SupportedVersionsPolicyTest` — one reader, everywhere.

## Trying a version that is not listed

Two ways, both of which attempt the patches anyway:

**Morphe Manager** — enable the setting that allows selecting an un-suggested app version, and pick
the APK you have.

**CLI** — `-f/--force` skips the compatibility check, and `--continue-on-error` keeps whatever
applied instead of aborting at the first failure:

```bash
java -jar morphe-desktop-all.jar patch --patches patches-<version>.mpp \
  -f --continue-on-error --result-file out.json -o out.apk youtube-vr.apk
```

Read the result honestly: with `-f`, "it produced an APK" means nothing on its own. A partially
patched build can behave worse than an unpatched one, because our patches are coupled — the
streaming spoof expects the DataSpec normalisation and the ad-slot clear to be there too.

## Reporting a broken version

That is what makes re-fingerprinting cheap. Open an issue with the app version **and version code**,
the bundle version, and the `Applied:` / `Skipping` / `FAILED:` lines (the bug-report template asks
for exactly this). A report naming the failing patch is usually enough to turn the re-anchoring
into a lookup against FINGERPRINTS.md.

## How a new version is noticed

`.github/workflows/check-upstream-version.yml` runs daily at 06:00 UTC and opens an issue when the
store serves a version the repo does not list. It reads **two** sources, because one of them is not
what its field name suggests — measured 2026-10-15:

| source | `latest_supported_binary` for channel `LIVE` | what it is |
|---|---|---|
| `graph.oculus.com` with this app's own access token | **1.89.09** (binary `28727061943646433`, created 2026-09-29) | the newest binary **uploaded** to the channel |
| the public store page | **1.88.10** (binary `28655433784142583`) | the binary actually **released** to users |

Same channel id, different binary. Trusting the token's answer filed an issue (#40) for a version
nobody could download: the store page still offered 1.88.10, and step 1 of the checklist below is
"obtain the APK". The verdict therefore comes from the **storefront**, and the channel answer is
reported beside it as the early signal it is — *"uploaded but not released yet"*.

Three consequences worth knowing before reporting a bug in that workflow:

- **The store page needs Meta's crawler UA** (`facebookexternalhit/...`). A browser UA gets HTTP 400,
  and anything else gets the cookie-consent shell with no app data in it. If Meta ever stops honouring
  it, the script says so in the run summary and falls back to the channel answer, marked
  *unconfirmed* — it does not go quiet, because that would miss releases.
- **The page's rendered "Version + Release Notes" string can lag the payload it ships** — it is not the
  download decision, and neither is the version installed on your own headset (Quest updates roll out in
  waves). The checker reads `latest_supported_binary` out of the page payload. So when a report says
  "the store still shows the old version", re-read the payload and check the device's own update state
  before concluding the checker filed a false positive.
- **The issue title is the dedupe key.** The workflow skips creating an issue whose title already
  exists, so a false-positive issue left open *masks* the real detection of that same version later.
  Close a spurious one rather than leaving it.

A storefront version **older** than the newest supported one is a rollback, and is reported in the run
summary without filing anything.

## Adding support for a new version (maintainer checklist)

1. Get the APK of that exact version from your own headset (an on-device backup tool like Quest Games
   Optimizer, or `adb pull` — see [GETTING-THE-APK.md](GETTING-THE-APK.md)), or with DownQuest, which
   also lists builds your headset has not taken yet as well as older ones.
2. Add it to `Constants.kt`. While the fingerprints are unverified, add it as
   `isExperimental = true` with a description saying so.
3. Run the diagnostic probe — `scripts/patch-probe.ps1 -Apk apk/<new>.apk` (it resolves the
   newest Desktop CLI and the newest bundle itself, patches with diagnostics on and
   `--force --continue-on-error`, and prints the per-patch verdict). Every patch that no longer
   matches reports `FAILED: <patch>`. That is the work list.

   The patch run is the authority on which fingerprints broke. The scratch measurement
   harnesses (`apk/scratch/Probe19*.java`) only *measure* candidate anchors, and their
   predicates have drifted from the shipped fingerprints before — during the 1.91.10 pass two
   probe checks read 0 matches on versions the shipped fingerprints verified fine. A probe
   check that reads 0 while the patch applies is a stale probe; fix the probe, not the
   fingerprint.
4. Re-anchor those fingerprints — the anchors recorded in FINGERPRINTS.md and in
   the patch sources are the starting points. The scratch harnesses measure candidate anchors
   against the real dex; rebuild them from `apk/scratch/*.java` against the classpath in
   `apk/scratch/cp.txt` if they are gone.
5. Verify, in this order:
   - the bundle still applies with zero failures (the probe above, now with no `FAILED` lines);
   - **every extension injection site landed in the same app method as before** — `scripts/check-apk.ps1`
     enforces this automatically now: it patches every supported stock APK, reads the patched
     APK's version, and runs the audit's role check against
     `tools/dexaudit/roles/<version>.json` (the committed injection-site set of the verified
     build). A re-anchor that silently matches the wrong method produces a valid APK and a
     green patch run, and only the role check notices the hook moved house. The role file
     covers the *injected calls* only: a patch that rewrites an instruction in place (the
     User-Agent and version spoofs, playability, the settings label/wiring edits) leaves no
     extension reference to inventory, so for those the patch run plus the device check below
     is still the evidence. For a new version, generate its roles file from the verified build
     (the audit prints the inventory; annotate the roles against FINGERPRINTS.md's name map)
     and commit it with the flip;
   - on the device: install and launch (`scripts/device-log.ps1` wakes the headset, starts a
     watch URL and reads back the extension's lines, the crash buffer and the Guardian
     "launch is blocked" line), then play a video and confirm `ad slots: … none`/`cleared` in
     logcat, zero `skip-ad countdown` lines, and `onPlaying`.
6. Flip the target from experimental to a normal (verified) target, point `SUPPORTED_APP_VERSION`
   (`Constants.kt`) at it — the Spoof app version option default follows the constant — drop the
   oldest normal target **and its fingerprint branches** (the ad-slot accessor branches and the
   seek-bar id set are per-version), and cut a release.

## Notes

- `AppTarget.description` is compiled into the bundle (Morphe Manager can read it), but the
  release's generated `patches-list.json` does not carry target descriptions — that writer leaves
  the field empty. Do not rely on it appearing in third-party indexes.
- `./gradlew generatePatchesList` writes the patch list; the version field is stamped from
  `gradle.properties` by a `doLast` in `patches/build.gradle.kts`, and the release pipeline's `jq`
  step writes the same value. Before that stamp existed, running the task locally silently
  downgraded the published index.
- Version codes: this app ships arm64-v8a only, so a target can pin the exact code with
  `versionCodes = mapOf(SupportedAbi.ARM64_V8A to 18810000)`.
