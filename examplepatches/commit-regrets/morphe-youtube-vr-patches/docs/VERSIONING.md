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

Two consequences worth knowing before reporting a bug in that workflow:

- **The store page needs Meta's crawler UA** (`facebookexternalhit/...`). A browser UA gets HTTP 400,
  and anything else gets the cookie-consent shell with no app data in it. If Meta ever stops honouring
  it, the script says so in the run summary and falls back to the channel answer, marked
  *unconfirmed* — it does not go quiet, because that would miss releases.
- **The issue title is the dedupe key.** The workflow skips creating an issue whose title already
  exists, so a false-positive issue left open *masks* the real detection of that same version later.
  Close a spurious one rather than leaving it.

A storefront version **older** than the newest supported one is a rollback, and is reported in the run
summary without filing anything.

## Adding support for a new version (maintainer checklist)

1. Get the APK of that exact version from your own headset (using an on-device backup tool
   like Quest Games Optimizer or `adb pull`, see [GETTING-THE-APK.md](GETTING-THE-APK.md)) or with
   DownQuest for an older build.
2. Add it to `Constants.kt`. While the fingerprints are unverified, add it as
   `isExperimental = true` with a description saying so.
3. Apply with diagnostics on, so the diagnostics-gated fingerprints are exercised too:

   ```bash
   java -jar morphe-desktop-all.jar patch --patches patches-<version>.mpp \
     -OenableDiagnostics=true --force --continue-on-error \
     --result-file out.json -o out.apk youtube-vr-<version>.apk
   ```

   Every patch that no longer matches reports `FAILED: <patch>`. That is the work list.
4. Re-anchor those fingerprints — the anchors recorded in FINGERPRINTS.md and in
   the patch sources are the starting points.
5. Verify, in this order:
   - the bundle still applies with zero failures;
   - **the patcher modified the same methods as before** — apply the bundle, extract the last
     `classes*.dex` from the patched APK, decompile it and confirm the injected calls land in the
     expected classes/methods (`oqb` ctor, `axe.a()`, `pqy` ctor, `gtu.b(int)`, `fna.b(int)`, and
     with diagnostics on `oth` and `CronetUrlRequestContext`). A re-anchor that silently matches the
     wrong method still produces a valid APK, so this check is the one that catches it;
   - on the device: play a video and confirm `ad slots: cleared N entries` in logcat, zero
     `skip-ad countdown` lines, and `onPlaying`.
6. Flip the target from experimental to a normal (verified) target, point `SUPPORTED_APP_VERSION`
   (`Constants.kt`) at it — the Spoof app version option default follows the constant — and cut a
   release.

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
