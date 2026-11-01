# NPO Start Android TV: collection paths and destination limits

Target: `nl.uitzendinggemist` **1.48.2-2405 / 245497937**, original Android TV APKS.
These notes describe method-level privacy guards and bounded playback tests.
The exact hostname/payload inventory
for the paths below has not been established here. Provider names and bundled
SDKs must not be presented as captured transfers to guessed domains.

| Receiver/path evidence | Purpose and data scope | Patch effect / remaining service |
| --- | --- | --- |
| NPO Tag/Topspin and inspected Govolte `mob-event` path — native call-path evidence; hostname unresolved | App/player events and context; complete field-level runtime payload remains unverified. | Disable tracking stops the inspected producers/SDK boundaries. The endpoint inventory did not establish a separate progress/history upload outside this path. |
| STER/player-session/DAM inputs — native request-construction evidence; hostname unresolved | Optional advertising/measurement context and targeting inputs. | Disable tracking removes the optional STER configuration before targeting construction/reflective serialization and guards the inspected measurement paths. Functional DASH/Widevine fields remain. |
| Sentry and Bitmovin analytics — SDK configuration/call-path evidence; project/collector hosts unresolved | Diagnostic and player measurement context; exact runtime payloads remain unverified. | Disable tracking stops the identified configuration/initialization boundaries and removes the inspected Sentry startup performance provider. |
| Google CCT/DataTransport — exact native ingress, sender and outcome evidence; final collector host unresolved | Optional queued telemetry and client metrics; the full historical batch contents were not captured. | Collection and the dedicated send method are stopped. The real uploader sees a typed local fatal outcome, discards the batch and completes its job. No successful network transfer is claimed. |
| Advertising-ID diagnostic `gen_204` path — dedicated method evidence; host unresolved | SDK diagnostic measurement. The original sampling threshold was already zero. | Guarded as defense in depth, without claiming an originally observed transfer. Advertising permissions are removed. Bundled PAL/AppSet classes alone do not establish activity. |
| Genuine account/profile/follow, recommendations/history, content/CDN, DRM and authentication services — functional paths | Real account operations, media/authorization requests and ordinary network information. Exact runtime receivers and fields remain outside this inventory. | Retained. AppAuth uses the real HTTPS token response and original validation/callback path. No token, subscription, media access or DRM license is forged. |

Both public ad/tracking controls default **off** for this TV target; select the
controls you want. The original build has no Firebase analytics/FCM runtime
provider, so its disabled Firebase metadata flags are precautionary. Recorded user
playback and token-request checks establish the documented functionality, not a
complete traffic capture. Cast, dynamic paths, server-inserted/broadcast ads,
fresh sign-in and long-duration playback retain separate acceptance limits.

[App guide](../../site/en/apps/npo-start-android-tv.md) ·
[Source guards](../../../patches/src/main/kotlin/patches/npostarttv/TrackingEgress.kt) ·
[All app READMEs](../README.md).
