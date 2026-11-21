# Attribution

- Project scaffold: [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template), GPL-3.0 with the additional naming notice retained in `NOTICE`. Original template revision: `1c818c1cc78bacf57051cdad487d32d6d464dfeb`.
- `patches/.../settings/{SettingsPatch,Fingerprints}.kt` and `patches/.../push/{PushPatch,Fingerprints}.kt` adapt [Andrew Liang's patches](https://github.com/andrewliang25/morphe-patches), GPL-3.0, revision `55d6a600f33b286a403b077daaf570c87da56dc7`. Modifications: independent notification settings, Korean title and chat-menu label, different extension package, switches initially off; Firebase repair limited to Installations registration, excluding Remote Config changes.
- The shared extension/inclusion helper in `patches/.../shared/Shared.kt` also adapts Andrew Liang's `line/shared/LineSettings.kt`. `extensions/.../SettingsClick.java` simplifies the `LineSettingsClick.java` binding. His `LineSettings.java` / `LineSettingsScreen.java` were settings integration references; the current notification settings state and native full-page renderer have different implementations. These attributions supplement, rather than replace, the original notices.
- [Knot](https://github.com/2b-zipper/Knot), GPL-3.0, was used as a research reference for LINE notification metadata and the existing local database tables. No Xposed/LSPosed runtime is included.

Changes to the adapted integration and the notification implementation were made during 2026-11-06 through 2026-11-20. This expanded provenance notice was reviewed on 2026-11-20. The inspected Knot checkout is `d28174ea1414762c14df170c49138fa10d4b498b`.

KakaoTalk 26.9.2 was inspected locally as a behavior/API reference for Android `Notification.MessagingStyle`. Its code, images and resources are not included in this patch bundle. See `docs/KAKAO_NOTIFICATION_REFERENCE.md` for the inspection scope. References to LINE's class names, method signatures and resource names bind to the user's own app at patch/runtime; LINE's gear path is read from that app while applying the patch, rather than shipped as an asset here.

This independent project is not authored or endorsed by LINE, LY Corporation, Morphe, or these reference projects. The original LINE application and decompiled sources are not part of the source distribution.

The public Morphe Desktop JAR and Kotlin compiler used by the optional standalone build are development dependencies kept outside the bundle. Their own license notices remain in their distributions.

Redistribution of this GPL-covered patch work must retain `LICENSE`, `NOTICE`, attribution and modification notices, and provide the corresponding modified source and build instructions. The GPL does not grant rights to redistribute LINE or KakaoTalk. Distribute the patch and its corresponding source; the locally signed full LINE test APK is not a public release asset.
