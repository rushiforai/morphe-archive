# Vela real FM zone data and speech startup

The owner approved the complete Vela layout from run92: the warning pill, current speed and maximum speed together. Preserve that presentation. Approval does not replace functional speech or route acceptance.

## Genuine provider data

Run94 exercised the normal FM15 background engine and Vela native Drive mode on the owned Android emulator through the real Android Auto DHU at the 1280×480 active viewport. Only GPS was simulated, along the retained northbound A4 road geometry at 100 km/h. No warning, limit, zone model or average was injected. The unchanged observer covered FM, Vela, AA and TTS before stimuli and retained coverage through the exercised window.

The actual frames show an FM average-speed warning, current speed 100 km/h, the native 130 km/h limit, and a zone panel with an observed partial average of 98 km/h, approximately 57% progress and 1.1 km remaining. These are Drive-mode frames, not active-guidance acceptance. The route was stopped after 121 seconds of its planned 214 seconds; full exit is unproved.

Unmodified review images and their qualification are in `~/Downloads/Android-Auto-Functional-Review/`. Exact hashes, APK identities, source decisions and GPS samples are retained privately in `.analysis/waze-native-warnings/fm-vela-natural94/receipt.json` and its adjacent evidence. The real data used FM55 and Vela56; it is not a release built from a later commit.

## Lease renewal correction

The first native announcement reached Vela's initialized system speaker. Its readiness checks and startup consumed enough time for the audio lease to expire. The trace records a granted attempt, speaker entry at elapsed 92510 ms, accepted return at 96002 ms, and cancellation at 96003 ms against lease expiry 95826 ms. No STARTED callback was accepted.

`WarningScheduler.pumpOne()` sampled elapsed time before potentially blocking native speaker preparation/readiness calls, then reused that timestamp to decide whether ownership needed renewal. Refreshing the clock after readiness restores the existing renewal policy. It does not extend the native announcement deadline or bypass ownership, eligibility or expiry.

The affected canonical Android checkpoint95 passes, including regressions for slow readiness followed by native startup and for readiness finishing after the original announcement expires. The rebuilt Vela and Maps receiver APKs patch, sign and align; both retain all 19 exact owner icon assets. Their provider APIs are unchanged. The original provider APK identities and their earlier input checks remain explicit in the private receipt.

## Remaining speech failure

Run96 used the corrected Vela receiver with the unchanged genuine FM producer. The owner lease remained valid: the failed attempt had lease expiry 114724 ms, while its original announcement deadline was 109633 ms. Speaker startup was accepted at 108723 ms, but the attempt expired at 110319 ms without STARTED. This closes the observed stale-clock lease cancellation, not speech acceptance.

The next investigation is the cold native voice preparation/dispatch delay. Its exact internal bottleneck is not yet proved; do not extend source deadlines or invent a successful playback result. All timings above include Frida overhead and establish no uninstrumented latency percentile.

## Runtime and cleanup qualifications

Run93's Mac emulator aborted in a gRPC callback before any drive samples. The owned guest state was recovered and restored. Run94 then stayed alive for 292 seconds with the SDK's existing `--no-shutdown` launch argument, but this does not prove the cause or a permanent host fix. No emulator binary, image, observer or runner was changed.

Both later functional runs retained observer coverage, restored prefs, temporary background-location permission, GPS and audio, stopped owned app/tracing processes, removed owned forwards/scratch and stopped the VM. Keep the original initialized snapshot, reusable userdata and compact evidence. No physical phone was touched. Waze integration, active guidance, complete zone exit, remaining lifecycle/mode/output and display/input gates are still open; nothing here authorizes main promotion or publication.
