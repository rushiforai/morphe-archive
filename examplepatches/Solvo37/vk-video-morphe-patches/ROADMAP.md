# Roadmap

## P0 — runtime confidence

- Reproduce and capture the authenticated Clips-entry crash from release 1.164.4; validate that removing raw-response mutation fixes it before promotion.
- Verify ordinary playback with PREROLL, MIDROLL and POSTROLL denied: no ad countdown and no ad-driven timeline jump.
- Add Android 13 (API 33) and Android 14 (API 34) Google Play profiles to the local release-gate matrix alongside Android 15.
- Run the signed candidate on at least one physical ARM64 device running Android 13 or newer.
- Extend the smoke test beyond process survival: verify Home, Clips, ordinary video, profile, background/foreground and rotation.
- Keep collecting full logcat and the exact signed APK digest for every tested candidate.

## P1 — ad removal correctness

- Validate the blocked legacy ordinary-video `VideoAdsDto` and instream gate against real signed-in playback sessions and future upstream versions.
- Validate Clips for long scrolling sessions after dedicated server and SDK-layer filtering; confirm there are no ads, crashes or empty feed positions.
- Recheck server-provided StaticAd, MarketAd, FloatingAd and MyTarget variants against every new upstream version.
- Add runtime assertions that ad filtering removes complete feed entries instead of leaving empty adapter positions.

## P2 — release engineering

- Split candidate creation from public publishing: build and sign a quarantined artifact, run the local matrix, then explicitly promote the tested digest.
- Record local runtime test results in machine-readable release metadata.
- Add a static DEX reference check for injected fields and methods so nonexistent references such as `VideoAdvertisementsComponent.INSTANCE` fail before runtime.
- Preserve the last known-good public release automatically when a newer candidate fails runtime validation.

## P3 — optional improvements

- Add an optional AMOLED theme patch instead of forcing pure black backgrounds for every user.
- Add automated screenshots for Home, Clips, video player and profile to catch blank surfaces and layout regressions.
- Add a documented physical-device test checklist for maintainers and trusted testers.
