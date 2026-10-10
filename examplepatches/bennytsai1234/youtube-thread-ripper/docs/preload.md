# Video buffer preload and stall recovery

Both patches hook the app's media3 LoadControl.

## Preload (LoadControl.shouldContinueLoading)

`Video buffer preload` hooks the end of the app's LoadControl.shouldContinueLoading (`alkg.f(cus)` in 21.16.256; fingerprint string `scl.`), just before `this.o = decision; return decision`. `Preload.shouldContinueLoading` gets the app's decision, allocator bytes, the byte limit, bufferedDurationUs and speed; it turns "stop" into "continue" while buffered < `preload_s` and allocator < `preload_mib`. It never turns "continue" into "stop" (`docs/adr/0004-preload-only-extends-the-apps-decision.md`).

- The app is byte-limited, not time-limited: limit `l = (389+38) × 50 KiB ≈ 20.8 MiB` (server-overridable); the 60 s / 120 s time limits never apply.
- Official Morphe "Playback buffer size" (`PlaybackBufferPatch`, same method) divides buffered duration by 1/2/4/8 and multiplies the byte limit, capped at max(limit, 128 MiB). Our hook runs after it and logs the scaled limit, so `limit=` in the log shows the user's setting.
- Defaults 900 s / 250 MiB: `docs/adr/0003-preload-defaults-900s-250mib.md`. Measurements: `docs/measurements.md`.

## Stall recovery (LoadControl.shouldStartPlayback)

`Stall recovery` hooks LoadControl.shouldStartPlayback (`alkg.g(cus)`, fingerprint string `ssp.`). The app starts the first playback at 1.6 s buffered and resumes after a stall at 5 s (server defaults `ahpq.o()`/`q()`, 1600/5000 ms); playback speed is not used. The option lowers only the resume threshold; the first start is left unchanged (`docs/adr/0007-first-start-threshold-unchanged.md`).

The parameter register is reused as a local inside the method (reading p1 at the returns failed verification), so the parameters are read at the method start into a ThreadLocal and the returns only pass the decision.
