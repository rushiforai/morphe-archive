# Tadikwa Google Clock Morphe patches

Small third-party Morphe patch bundle for Google Clock.

## Patch

**Use Morphe YouTube Music for alarms**

Google Clock 9.0 expects the stock YouTube Music package:

`com.google.android.apps.youtube.music`

The non-root Morphe build is installed as:

`app.morphe.android.apps.youtube.music`

This patch redirects Google Clock's YouTube Music provider lookup to the Morphe package. The fingerprint is scoped to Clock's music-provider resolver instead of globally replacing every occurrence.

Target currently validated statically:

- Google Clock: `com.google.android.deskclock`
- Version: `9.0 (943154005)` / versionCode `76073630`
- YT Music Morphe inspected: `9.15.51`

The target stays marked experimental until it is confirmed on-device.

## Add to Morphe Manager

One-click source URL:

`https://morphe.software/add-source?github=tadikwa/google-clock-morphe-patches`

Manual source URL:

`https://github.com/tadikwa/google-clock-morphe-patches`

## Publishing

The `publish.yml` GitHub Actions workflow builds the `.mpp` with Java 21 / Gradle 9.6.1 and publishes `patches-1.0.0.mpp` in release `v1.0.0`.

`patches-bundle.json` already points at that release asset, so after the first successful workflow the repository can be used directly as a Morphe Manager patch source.

## Diagnostic notes

See [`analysis/FINDINGS.md`](analysis/FINDINGS.md).
