# Galaxy MaxHz (com.tribalfs.gmh)

Patches for Galaxy MaxHz, the Samsung refresh-rate and display control app by
tribalfs. Premium is a per-device license: the user buys the separate
"Galaxy Max Hz Donation" app (com.tribalfs.gmh_donate) or donates via PayPal,
then activates with the Google Play order number or PayPal code.

Supported versions: 9.2.0x and 9.2.1x. 9.2.0x was an in-app rollout build; the
public GitHub release for that period is 9.2.1x, which is what most people
have.

## Unlock Premium

Unlocks premium fully offline. Every signed server request is answered
locally with a valid premium response, the startup APK self-check is
bypassed, and profile data comes from the app's own bundled device table.
No server connection is made or needed for licensing.

## How the license works

The app signs every license request with a digest of its signing
certificate folded in by the native `t0/c1` library, so a re-signed APK
cannot talk to the real server at all. The server responses carry
hex-named keys (`0x0` status, `0x10` licence type, `0x9` expiry date,
`0x4` order code, plus `0x24`/`0x12`/`0x36` URL bookkeeping) that the app
parses and stores in its DataStore. Three layers defend the premium
state: the native init dereferences null when the installed APK hash
does not match, a static gate keeps the loading state active when the
stored native hash differs from the runtime Adler-32 of the installed
dex, and the native `f`/`g`/`h` exports can exit the process on invalid
licence input.

## What Unlock Premium changes

- The hash-feeder wrapper returns the hash its caller passed in and
  stores it into the field read from the original body, so the native
  tamper init completes on any build. (The field moved between 9.2.0x
  and 9.2.1x; the patch reads it instead of hardcoding it.)
- The licence-info wrapper builds the licence object directly with the
  premium licence type (`xf/b.f * xf/b.h`, computed at runtime) and no
  expiry; the two verdict wrappers answer with true.
- The `SeslUtil` constructor forces its premium boolean before storing it.
- The profile-table call site reads the bundled `zV.json` with a
  `Scanner` against the same raw resource the original call passes to
  the native reader, so the app picks the profile entry matching the
  device on its own. Registers and the resource id are taken from the
  original instructions.
- The signed-request launcher — the single choke point for every signed
  request — returns a synchronously parsed premium response. The
  licence type is computed from `xf/b` at runtime and the update-check
  keys echo the installed package version read through the package
  manager, so nothing version-specific is baked into the patch.
- The profile-config fetcher is the one caller that must not see that
  response (it expects the server-tuned profile array); its call site
  now constructs a plain offline failure so the bundled-table fallback
  runs.
- The licence refresh skips an await on a pending-request flow that
  nothing feeds without the donate-app activation.
- The loading-state gate no longer compares the stored hash against the
  runtime Adler-32 of the installed dex, which is what kept a patched
  app loading forever.

The in-app update check always completes with "up to date", because the
licence server cannot validate a re-signed install. Watch upstream
releases yourself; when a new Galaxy MaxHz version ships, the patch is
bumped to it anyway.

## Random device ID

Replaces the device identity string the app sends with a random one,
baked per patch run so it stays stable for that install.

## Verify on device

1. Patch a stock 9.2.0x or 9.2.1x APK with Unlock Premium.
2. Install, open once, and tap through the Android permission-review
   dialog (the app targets an old SDK, so Android shows it once per
   install).
3. The splash clears, the brief loading indicator hides, and the About
   screen shows Premium.
4. Airplane mode changes nothing: every request path is answered locally.

## New app version

The fingerprints pin call structure, not R8 names where those moved
between 9.2.0x and 9.2.1x (`Lia/l9` -> `Lia/m9`, `Lia/sa` -> `Lia/ta`,
and the GmhApp hash fields swap). Re-run them against the new APK, add
the version to `COMPATIBILITY_GALAXYMAXHZ`, and fix whatever site the
patch-time error names — the patch itself carries no per-version data
beyond the pinned target list.
