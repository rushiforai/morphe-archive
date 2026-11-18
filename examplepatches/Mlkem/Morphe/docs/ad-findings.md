# Ad patch findings

The inspected APK has a large mediation stack in `AndroidManifest.xml`, not a single ad provider.

Detected manifest components / metadata include:

- Google Mobile Ads / AdMob
- Unity Ads
- IronSource / LevelPlay
- InMobi
- Moloco
- Vungle
- Pangle / ByteDance OpenAds
- Facebook Audience Network
- MBridge / Mintegral
- Android Privacy Sandbox ad-services permissions
- Google Advertising ID permission

The Hermes bundle also contains AdMob app/ad unit IDs. The patch named `Neutralize bundled ad unit IDs` replaces the real and Google sample IDs with same-length non-serving placeholders so the Hermes bytecode string table is not resized.

Important limitation: this does not decompile and rewrite the JS logic. It prevents/neutralizes native ad SDK initialization paths and bundled ad unit IDs. If the app UI still shows a "watch ads" button, that text/logic is inside `assets/index.android.bundle` and would need a Hermes-level patch or a rebuilt app bundle from the original source.
