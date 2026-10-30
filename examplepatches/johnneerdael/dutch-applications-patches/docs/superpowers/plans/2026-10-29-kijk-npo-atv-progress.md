# ATV implementation progress

- Worktree created on `codex/kijk-npo-atv` from `7c4b886`.
- Baseline: 123 Python tests pass.
- Ruling: use the existing APFS research worktree directory because the native worktree tool cannot select this nested repository; the original clone remains unchanged apart from removal of proven AppleDouble Git-pack sidecars.
- Ruling: execute the accepted feasibility direction inline as requested; produce reviewable candidates before replacement testing. The user explicitly authorized rooted-device capture and replacement of NPO on the API 34 TV after the backed-up split set was verified.
- Implemented separate exact-input KIJK/NPO TV controls, scoped KIJK extension, NPO TV startup restoration, independent output verifiers and synthetic policy/graph tests.
- Gradle `buildAndroid` passes. Final Python suite: 126 tests pass. All individual and combined outputs passed signature checks and independent original-method preservation checks: 12,807 KIJK methods and 107,858 NPO methods. The same-version-name phone NPO input is rejected by its TV version-code guard.
- Independent whole-branch review found an important missing semicolon before the injected IIFE. A no-semicolon publisher HTML fixture reproduced it; fixed and retested, including the captured actual HTML. No remaining critical/important source findings were reported before device tests.
- KIJK device testing exposed a service-worker cache bypass. Added exact-worker registration prevention and scoped unregistering; regression tests cover query variants, waiting workers and unrelated-worker delegation. Focused review requires an explicit clean-install/new-uncontrolled-document acceptance boundary. Current workers are not detached merely by unregistering.
- KIJK free VOD with Widevine, pause/resume, intercepted FreeWheel and early privacy controls observed on rooted API 28. Final cache fix observed with no controller/registrations, actual hosted adapter guard removed and free VOD playing. Direct DOM seeking outside its buffered range stalled; returning inside the buffer resumed. Do not claim remote-seek acceptance or a complete traffic audit.
- NPO ART startup-data capture and candidate reflection agree on all 1,437 immutable strings and nine method mappings. Original nine embedded lifecycle helper graphs and all unrelated VM callers remain intact. Neither a stock capture nor these static checks proves installed startup.
- NPO installed candidate reproduces native `SEGV_ACCERR` at PairIP `+0x3cb28` on API 34. Identical libraries, aligned ZIP loading, isolated native probes, uncompressed DEX repacking and original-phase initialization timing did not resolve it. The timing diagnostic was reverted. No plain helper DEX was found in the 20 functional VM assets. NPO defaults remain off and its startup description explicitly reports the failure.
- The publisher-signed NPO split set was restored after each failed candidate series. Final stock launch and process presence verified. No stock KIJK was present on the rooted box before testing.
- Delivery status: KIJK experimental candidates are usable for further acceptance testing. NPO remains an unfinished native-runtime investigation. No paid-media access or universal tracking-removal claim is made. See `docs/research/2026-10-29-atv.md` for reproducible checks and boundaries.

## Handover continuation

- User-confirmed startup/live TV from the handed-over AppAuth diagnostic was independently pinned by installed APK hash. This supersedes the first-delivery NPO failure status above.
- Restored both real player receiver variants and integrated AppAuth discovery into startup compatibility; removed the compiled diagnostic/no-op chain after preserving its source privately.
- Actual APK inspection caught omitted exception metadata from `addInstructions`; explicit catch registration fixed it. Actual emitted methods now pass 12 ART cases, including unexpected failures and cleanup, after a reproduced network-error regression. Host suite: 129 pass.
- FULL-mode startup/ads/tracking/combined outputs pass original method, startup data, helper, callback flow/exception and signer checks.
- The user approved the stability restart. Receiver-restored startup-only APK updated `.12` with `install -r`; app UID and profile/account data survived; cold launch and home screen observed. No stock restoration.
- Remaining stability scope includes fresh authentication/token refresh, lifecycle and physical route/network events. Privacy/ad audit follows stability, with a free account to avoid Plus masking free-tier ad paths.

## Free-account playback and privacy continuation

- Free-account playback entry exposed native `+0x687d4`; adding the optional IMA loader gate to Hide ads uses the existing Media3 content-only branch. The user confirmed playback; installed ad-only APK identity is recorded in `npo/free-account-playback-accepted.json`.
- Audited STER reflective serialization/construction, Cast/TV-ad diagnostics, Google DataTransport producers/persisted queues/alarm, Sentry startup provider and advertising-ID diagnostics. Added exact optional boundaries while retaining functional components and uploader completion.
- New combined candidate passes Gradle build, 134 host tests, all 107,858 original-method/startup/helper/manifest contracts, 12 emitted-callback ART cases and six actual-APK privacy cases on `.89`. The old CCT output fails the privacy probe. Focused independent review found no critical/important issues.
- Combined `privacy-v4/all.apk` updated `.12` with the matching signer, preserving account/app UID and matching the installed hash. Cold launch succeeded. User free-account playback recheck is pending; no stock restoration occurred.
- Full physical route/network/lifecycle, fresh token refresh and dynamic traffic coverage remain explicit acceptance limits.
- Copied the combined NPO experimental installer to the external SSD and refreshed the private delivery bundle/research/checksums. The ad-only accepted APK remains preserved for same-signer rollback.

The refreshed tracking-only selection also passes all 107,858 original-method/startup/helper/manifest checks and the matching-signer check; this is output verification, without a separate free-playback acceptance claim.

## Token-request regression

- The user reported that NPO no longer boots. The installed combined APK hash matched the earlier candidate. Native tombstone: AsyncTask #1, PairIP +0x66924.
- Shizuku/rish + same-signer Frida Gadget on `.12` captured the failure inside UID 10251. VM logging names asset UeibxlO3N5eP2BBY and zt/i.doInBackground. No token values or account payloads were captured.
- Added genuine AppAuth token-request restoration with the shipped encoder/Accept helpers and original response callback. Old emitted method RED; source and emitted method GREEN across 17 ART cases. Host145 and full107858-method preservation checks pass; review has no critical/important findings.
- Updated `.12` without Gadget using the same signer. Account data survived. Three forced-stop cold starts passed, then Media3 content playback progressed beyond81seconds with no error. Leave playback running while publishing the dev fix.

## Stable TV promotion

- The user confirmed the repaired NPO build and authorized main publication once the guides were complete.
- The stable candidate adds only KIJK/NPO Android TV. Marktplaats and 9292 remain on dev. All 17 existing phone compatibility entries are unchanged; the candidate has 19 apps and six new TV patch entries.
- The isolated candidate passes 138 host tests, the Android build and bilingual site checks. TV classes and extension matched the device-validated bundle before the publication descriptions were refined. Mobile layouts fit 390 pixels in light and dark themes.
