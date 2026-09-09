# vantage-patches

Vantage-only [morphe](https://github.com/MorpheApp) patches, published as a
single `.mpp` bundle that [pmaxhogan/vantage](https://github.com/pmaxhogan/vantage)
**stacks on top of** whichever upstream bundle a variant already uses.
`morphe-cli patch` accepts repeated `--patches`, so this adds patches without
forking anddea, morphe or piko.

One bundle serves every app. Each patch declares its own `Compatibility`, and a
patch only applies to the app it names, but morphe-cli still offers every patch
in the bundle to every build - so **each consuming variant's options file must
explicitly disable the patches meant for other apps**, or they apply by default.

Everything here is deliberately small. Anything that belongs upstream should go
upstream instead; this repo is for patches that only Vantage wants.

## Patches

### Keep playback on activity destroy (YouTube Music)

Keeps background playback and its media foreground service alive when the system
destroys `MusicActivity` to reclaim memory. A user-initiated close still stops
playback.

Why the activity dies without the app finishing it: `ActivityThread` installs a
`BinderInternal` GC watcher at attach time. After a GC, if activities have
changed and the app's own ART heap sits above 3/4 of `Runtime.maxMemory()`, it
calls `ActivityTaskManager.getService().releaseSomeActivities(mAppThread)`. The
system then runs `WindowProcessController.releaseSomeActivities("low-mem")`,
which calls `ActivityRecord.destroyImmediately("low-mem")` on every activity of
that process that is non-visible, stopped and holds saved state. It is the only
path that destroys a **stopped, non-visible** activity without finishing it, so
`Activity.isFinishing()` is false there and true for every user-initiated close.
It is not the only destroy-without-finish in the framework, though: a
configuration-change relaunch also reports `isFinishing()` false, so the gate
checks `isChangingConfigurations()` too and suppresses nothing on a rotation.

YouTube Music reacts to that destroy by deactivating its media session, running
`MedialibPlayer.stopVideo` with `STOPPAGE_DIRECTOR_RESET_INTERNALLY`, dropping
the foreground service and going cached, even though the player itself lives in
an application-scoped component and had been playing happily with the activity
merely stopped.

The patch opens a short suppression window in `MusicActivity.onDestroy` when
`isFinishing()` is false, and swallows exactly two calls while it is open: the
player's `stopVideo`, and the media session's `setActive(false)`. It also closes
the window in `BackgroundPlayerService.onTaskRemoved`, so a swipe from recents
landing seconds after a system destroy still stops playback. Everything else
about the destroy proceeds untouched, so the activity is still released and its
memory still reclaimed.

### Clone with badge (Claude)

Turns the Claude app into an installable copy with its own package name so
several accounts can be signed in at once. Options: `packageName`, `appLabel`,
`badgeNumber` (1-9) and `iconColor` (`#RRGGBB`). The resource half renames the
package, every content-provider authority and custom permission, sets the label,
and swaps the adaptive icon for one on the chosen color with the number stamped
on it. The bytecode half merges `extensions/claude` and starts a small pill
overlay from `Application.onCreate` that pins the same number to the top corner
of every screen, so the copies can be told apart while in use.

`badgeNumber` is an integer on purpose: morphe-cli parses a bare digit passed
with `-O` as a number and silently ignores it for a string option.

## Layout

    patches/src/main/kotlin/app/vantage/patches/<app>/...   patch declarations (Kotlin)
    extensions/<leaf>/                                      code injected into the app (Java)

One `extensions/<leaf>` module per app that needs injected code. A module gets
its namespace from `defaultNamespace` plus its directory name, so
`extensions/music` becomes `app.vantage.extension.music`; do not set `namespace`
in the module itself. Two things every extension module needs and neither is
obvious: **no** `plugins` block (the settings plugin already applies AGP, and
declaring `com.android.library` fails because it applies
`com.android.application`), and a `src/main/AndroidManifest.xml` containing just
`<manifest/>` (AGP fails on the missing input otherwise).

Patches pull their extension in with `extendWith("extensions/<leaf>.mpe")`.
Deliberately not `sharedExtensionPatch`, which also demands an
`extensions/shared.mpe` and hooks `Application.onCreate` - a hook this bundle
does not need and which is untested alongside the upstream bundle's own.

The extension namespace must **not** be `app.morphe.extension.*`: this bundle is
merged into the same APK as the anddea bundle, which already ships classes under
that prefix.

## Build

    export GITHUB_ACTOR=<your github user>
    export GITHUB_TOKEN=<a token with read:packages>   # the morphe maven repo
    ./gradlew :patches:buildAndroid

The bundle lands at `patches/build/libs/patches-<version>.mpp`.

`.github/workflows/build-mpp.yml` builds it on every push to `main` and
publishes it as a release asset. The repository variable `MPP_PRERELEASE`
("true"/"false") gates whether the release is a prerelease; vantage reads
`/releases/latest`, which skips prereleases.

## Consuming it from vantage

`config/build.env`:

    VANTAGE_PATCHES_REPO=pmaxhogan/vantage-patches
    VANTAGE_PATCHES_CHANNEL=release

`scripts/build.sh` resolves the latest release the same way it resolves piko,
then passes a second `--patches` to the Music variant only.
