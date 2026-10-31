# Automatic additional lyric sources - 0.2.9-beta.1

Canonical development stays in C:/Morphe/App's/YT-Music/Personal-Patches. Shared Toolkit runs in place; no globals are copied. MuMu and all devices remain untouched.

## Source behavior

The pinned Better Lyrics v3.0.1 source, commit7a6a6a104d0667baac6df9f3e126385e3822f179, src/modules/lyrics/providers/unified.ts, prewarms normal verification through a zero-sized iframe, exchanges its result at verify-turnstile, stores the JWT and renews with3600 seconds left while retaining the valid token. Both challenge and API origins are https://lyrics.api.dacubeking.com/ (src/core/constants.ts lines123/125). No extension private credentials are borrowed.

Our automatic path is now started by LyricsEntryCoordinator during active foreground playback UI, independent of opening Lyrics. SourceVerification owns one unprivileged attached1x1 transparent WebView. It loads the same public challenge; it exposes no native JavaScript bridge. The ordinary verify-turnstile exchange runs as same-origin browser fetch with credentials included, keeping the challenge's browser identity and cookies. It polls only that trusted challenge origin for the fixed result. about:blank/srcdoc subframes required by ordinary Turnstile are allowed; unrelated main-frame navigation is blocked. No core browser behavior or service verification is bypassed.

Missing/invalid/expired JWTs trigger normal verification. Valid JWTs renew with one hour left and stay in storage until a verified replacement is available. Verification is single-flight, has a120-second deadline and five-minute automatic attempt cooldown; temporary exchange failures reload a fresh challenge at most three times. Server rejection/rate limiting does not loop. The optional Connect sources action reveals the same pending challenge, including through a themed ContextWrapper. No surprise dialog is opened automatically. Disable cancels verification; activity destruction and renderer loss clean up. This is background work inside the active app, not a persistent Android background service. Verification that needs interaction can still require the button.

Renewal no longer refreshes the whole repository or renderer. The existing catalog adds one broker stream for the new token, retaining public/native results, manual selection, visible lyrics and native action availability. The same token does not start duplicate streams. Stale broker403 cannot remove a newer token. Expired data is retained privately until replacement; it is not sent as valid access.

## Retrieval resilience

Each source task has up to three total attempts for temporary I/O or HTTP408/429/500/502/503/504, with750ms and2000ms backoff. Retry-After numeric/date hints are respected; hints over15 seconds defer rather than retry early.401/403/404, TLS, protocol, response limits and parsing failures do not retry. Closing a track interrupts backoff and closes transport. Existing metadata matching rules remain.

Provider error events are collected without aborting later providers; transient failures can retry the broker after the stream finishes. Malformed JSON events are skipped with bounded diagnostics, preserving later valid results. The extension's [DONE] sentinel is honored. Repeated payloads are deduplicated with bounded SHA256 fingerprints, avoiding redundant re-parsing/re-rendering after stream retries. Existing16 variant decoding/default priorities are unchanged. Connecting and retrying cannot guarantee a recording exists at every provider.

## Evidence and limits

Verification/check_revision29_connection.py executes actual TokenExpiry/ServiceConnection/SourceVerification/LyricsNetwork/LyricsRetry with explicit Android/browser stubs:40 checks. check_revision29_probe.js executes the actual verification probe in Node VM:11 checks. check_revision29_catalog.py executes actual catalog/lookup/retry with simulated responses:50 checks. check_revision29_lifecycle.py executes actual coordinator/repository:24 checks. Fresh real Java HTTP retrieval: Wake Up Better Lyrics18125 chars, Love Me Dead exact-recording Unison23376 chars, Man Areas LRCLib3700 chars. No live service verification acceptance is claimed; a plain Python challenge read returned403 and no workaround was attempted.

Final exact bundle, APK combinations, compiled hook/isolation audits, JVM/lint and source hash receipts are bound by Personal-Patches/dist/0.2.9-beta.1/verification.json when staging completes. The original9.42.52/94252240 arm64 APK and official1.48.0 bundle remain exact targets. Original renderer assets and source remain byte-identical to0.2.8, whose browser evidence is inherited explicitly; native-host/navigation simulations are reused only after exact source hashes match.

User reports screen recording suppresses the line-transition stutter. That can be consistent with different display refresh/frame pacing, but no cause is established and no stutter fix is claimed. A recording cannot reliably capture this symptom according to the user. No phone performance measurement, installation, signing, emulator/MuMu access, Shaders or alternate recording-timeline mapping.

Next phone checks: silent initial verification; one-hour renewal; manual interactive fallback; retained lyrics/selection during renewal; network interruption/cancellation; provider recovery; large-window lifecycle; stutter without recording, with refresh-rate/frame-pacing evidence if available.
