# Deezer 9.0.27.3: restore 9.0.26.3 controls

The 9382fea7 port excluded `FullStreamingPatch.kt`, `RemovePaywallsPatch.kt`
and `CarHostPatch.kt` from compilation. Its advertising option was narrowed to
display placements. Protected startup at e29be587 restored launch but did not
restore these controls, allowing the no-freemium plans page to block sign-in.

Compared the supplied 9002603 APKM/decompilation and the supplied 9002703 APKM
(SHA-256 ca4c9662e18f49d11b234c1c21437767d7afe1551aa28abf9dbabdaa1be7d83e).

- Re-enable and port the three excluded controls to 27 symbols.
- No-freemium startup is now variant 8 of a merged rule class. Return null only
  for that variant; preserve consent, logout and other rule implementations.
  Keep the existing waiting-for-payment override and native paywall redirects.
- Restore the 26 feature-bit, ad-kind, streaming-limit, licence and per-track
  policy hooks using the 27 policy class, enums, fields and method signatures.
- Port the native car browser root/admission hook. The register layout and
  root-building branch were checked against the original DEX. API9 depends on
  that shared control so its native browser connection uses the same policy.
- Restore the ad configuration, audio/preroll continuation, audio payload,
  pending-ad and video activity guards alongside the existing display controls.
- Update microG regression assertions to current original method/type names.
  The optional microG control remains experimental and off by default.

The real 27 APKM patches/rebuilds successfully with all seven default controls.
The patch JVM suite passes with both original-input environment variables set
for 27, including the original-DEX no-freemium branch regression.

These are static/build results. Authenticated runtime, cold restart, playback,
Manager delivery and complete repository verification remain acceptance gates.
No phone application was installed during this investigation.

## Remaining playlist parity

The 27 port also turned the optional playlist control into validation only.
Restore the 26 behavior: replace only the result immediately after the native
playlist UI eligibility query with true, retaining the query itself, its branch,
loaded/owner checks, chart exclusion, callbacks and preferences. Original-input
regressions require every other instruction to retain its identity and reject
an already-mutated input before making any change.
