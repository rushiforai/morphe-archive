# Diagnose Spotify content and playback failures

`Diagnose Spotify client` is an opt-in diagnostic for Spotify **9.1.94.1929**.
It does not fix playback, change signature values, or bypass integrity checks.

## Run

1. Build with `./gradlew :extensions:pablobaro:testDebugUnitTest buildAndroid`.
2. Apply only `Diagnose Spotify client` to the original APK. For a controlled
   experiment, use full bytecode rebuilding and fingerprint validation.
3. Before updating an installed app, verify that the output APK uses the same
   signing certificate. Never uninstall or clear app data just to resolve a
   signature conflict without the user's approval.
4. Cold-start Spotify, retry Home, and collect:

   ```sh
   adb logcat -d -v threadtime -s SpotifyClientDiag:I '*:S'
   ```

The diagnostic records the running package name (resolved from the process name
before startup, also when "Change package name"
is applied), its installer, public signing-certificate hashes,
client-token acquisition outcomes, allowlisted HTTP categories/statuses, and
whether the observed integrity request returns or throws. It never records
request bodies, headers, raw URLs, token values, account details, or exception messages. A response
being received does **not** establish that the server accepted the client.
No integrity log means that this instrumented route was not observed, not that
all integrity checks passed. Native or remote checks may be outside these hooks.

## Device experiments: 2026-11-06

Nothing A059, Android 16, Spotify 9.1.94.1929. Android Auto was not running.
All updates preserved the existing session and app data.

| Experiment | Verified observation | Result after cold start |
|---|---|---|
| Diagnostics only | Modern, history, and legacy queries returned the actual Morphe certificate. | Home error; no recovery. |
| Shared signature override plus diagnostics | All three observed query types returned the original Spotify certificate. | Home error; no recovery. |
| Same override APK, installer set during update to `com.android.vending` | Runtime confirmed the installer and overridden certificate. | Home error; no recovery. |
| Mormislaw `DHU adapter` v1.0.0, `display=false`, `mediaBridge=false`, `copySign=true`, `debug=true` | Pine loaded and signature hooks were installed before application startup. | Home error; no recovery. |

The upstream runtime-hook experiment was not a clean signature-only control:
despite logging `automotiveFix=false`, it also installed automotive framework
hooks. Its logs did not establish that a signature getter was actually used.
It was removed from the phone afterwards.

The pre-experiment APK and its original installer metadata were restored with a
same-certificate update. The failed override experiment is not a published patch.

### Fresh login and signing controls

After explicit approval, the user signed out and authenticated again on the
shared-signature experiment. Home still failed. This refresh does not guarantee
that all native client-token cache was cleared.

Diagnostic v3 then observed `client token acquired`, HTTP 200 from the login
service, and HTTP 200 for several playlist and extended-metadata requests while
Home still failed. Some unclassified service requests returned 404. This is not
evidence of blanket network rejection; HTTP 200 also does not establish that
the application-level payload is usable. Token acquisition can reuse cached data.

Two controls were created directly with the signing library, **without running
the patcher**:

- V2 re-signing: every ZIP entry matched the stock APK byte-for-byte; only the
  signing block changed. Home still failed.
- V2+V3 re-signing: no code/resource entries changed. The signing library also
  removed `stamp-cert-sha256`. V3 verification passed; Home still failed.

Both controls used the same Morphe signer as the installed app, preserving the
fresh session. Neither retained a valid Google SourceStamp. These results narrow
the investigation toward signing/client identity or associated persisted state,
but do **not** identify the exact rejecting function or server policy.

## Verification and rollback

- Fifteen unit tests pass, covering redacted exceptions, acquisition-result
  handling, token confidentiality, and URL redaction. Build and
  patch application with `FULL` and `--validate` passed.
- Device startup exercised the diagnostic, certificate-query wrappers,
  client-token parser observation, and native HTTP response constructor hook. The
  integrity response/exception hooks were applied but were not observed running.
- Remove `DiagnoseClientPatch.kt`, `DiagnoseClientPatch.java`, their test, and the
  JUnit test dependency to remove this diagnostic independently of existing
  Spotify patches. On-device rollback is a same-certificate update from a known
  pre-experiment APK; no app-data reset is required.
