# Runtime regression and revised patch candidate (2026-10-23)

## Real-device evidence

- The original **Force English UI** patch caused a black home screen, unresponsive Account tab and an English network error at login, with some English bottom-navigation labels in a screenshot, **without an unpatched baseline comparison**. The user subsequently confirmed **zero actual UI localization**; English error/recovery messages and the Terms `Agree` button already exist in the original app.
- The cause has **not** been isolated conclusively. Forcing network/edition locale and re-signing are independent suspects.

## Offline investigation

Original Taobao 10.66.30 call-site scan: 595,518 methods, 70 calls to `Localization.h()`, and 6 calls to `LocalizationManager.d()`. Notable users are `UtilityImpl.getLanguageTag()` (ACCS networking) and `EditionApi.g()` (sends `currLang` / `originLang` in a `mtop.tmw.site.change.notify` request).

In Taobao 10.66.30, `LocalizationManager.i(Context, Language)` updates `android.content.res.Resources` locale via `Configuration.setLocale` and `Resources.updateConfiguration`. The activity lifecycle calls `LocalizationManager.a(...)` which invokes `i(...)`. This is a narrower screen-resources hook.

## Two offline test artifacts (NOT hosted in GitHub)

**1. Control / zero-patch APK:** Morphe Desktop 1.18.1 with `--exclusive`, 0 applied patches; APK signer changed to the test key `ef17c8e9721d95256d980d3f79c4ae04a85bf5a4ba98bff768959947df56028c`; ordinary resource/DEX content unchanged (excluding signature metadata).

**2. Experimental UI-only APK:** Morphe Desktop 1.18.1 patch `TaobaoLingo: English UI resources only`, source commit `0bbd3a4333c07f014a25385ca3aec24f148af2fb`. Successful Morphe rebuild/sign. Independent DEX comparison confirms **exactly one inserted `sget-object p2, Language.ENGLISH`** at the beginning of `LocalizationManager.i(Context,Language)`, with original `Localization.h()` and `LocalizationManager.d()` bytecode intact. Signed APK SHA-256 `d27649aa087e31cd14667ef923f437302dfab0da006a0f11986b5c0656a673c0`; same signing certificate as control.

### Device decision tree

1. Install the zero-patch control APK. If home/login fails, prioritize APK re-signing, anti-tampering, native security SDK or account/network integrity issues. UI-language patch changes cannot explain the failure in a zero-patch control.
2. **Only if zero-patch control works**, install the UI-resources-only APK. Compare UI and network behavior. If network recovers but most dynamic Chinese text remains, a more surgical presentation-layer translation mechanism is needed.
3. Do not re-enable the old global locale patch; it is a confirmed regression.

**User correction (2026-10-23): no UI translation is verified at all; do not infer translation from English errors, Agree, or bottom navigation without unpatched baseline comparison. There is no verified working English translation yet.** Neither APK has been runtime-tested as of this report. Do not commit or redistribute Taobao proprietary APKs.
