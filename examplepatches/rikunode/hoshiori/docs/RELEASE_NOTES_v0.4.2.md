# v0.4.2 — Fix article WebView crash caused by wrong register type

**Fixed:** Morphe patch v0.4.1 injected `AdBlockHelper.injectCss(WebView, boolean)` directly before `onPageFinished`'s return. But the original method had overwritten its `p1` register (physical `v8`) with a `SimpleUriIdlingResource` before that point. Passing it as a WebView violates DEX verifier types and is consistent with the owner-reported freeze/crash when opening articles.

**Minimal fix:** move the two injected code instructions to immediately after the existing `invoke-super WebViewClient.onPageFinished(WebView, String)`, before the first overwrite of `p1/v8`. A new guard checks that the fifth original instruction is the expected superclass call. The original method register count remains 10; the added `shouldInterceptRequest` method and Java helper behavior are unchanged. Neither existing PR filtering, cloning nor ranking suppression was modified.

**Verified:** v0.4.1 APK DEX: `004d: move-result-object v8` from `getWebViewIdlingResource`, `0052: invoke-static {v8,v0}, AdBlockHelper.injectCss(WebView;Z)`. The changed APK should place the call after `000c: invoke-super {v7,v8,v9}` and before original `000f: iget-object v8`. The caller's original local variables and exception handling are otherwise preserved.

Hatena Bookmark **5.80 / versionCode 58000 only**. **Emulator validation (Android API 36):** v0.4.1 and v0.4.2 both installed and launched to MainActivity; v0.4.2 emitted no VerifyError/FATAL EXCEPTION in the startup logcat capture. However the emulator's article feed did not load (UI displayed a load error), and WebViewActivity is not exported, so actual article-opening reproduction and fix confirmation **could not be completed**. This release is backed by concrete before/after DEX instructions and a successful four-patch APK build, not an end-to-end article test.

The existing [v0.4.1 release notes](RELEASE_NOTES_v0.4.1.md) describe the unchanged filter converter and seed-merging behavior.
