> **Historical release (v0.4.3):** The OFF-by-default behavior described below applies only to v0.4.3. Since v0.4.4, this option is **ON by default**. See [v0.4.4 notes](RELEASE_NOTES_v0.4.4.md).

# v0.4.3 — Opt-in preservation of article-site preferences

Hatena Bookmark **5.80 / versionCode 58000 only**.

Adds a fifth Morphe patch, **Preserve article WebView cookies and storage**. Its `preserveArticleWebStorage` boolean option is **OFF by default**. Enabling it stops the original app from automatically erasing all WebView cookies on article `WebViewActivity.onDestroy()` and from starting the one-purpose WebStorage-clearing thread in `BookmarkApplication.onCreate()`.

This retains **all article sites' cookies and JavaScript storage**, not NHK alone. Login sessions and tracking data may persist longer. Explicit logout and manually requested data clearing are not intercepted or altered. Existing native PR hiding, ranking suppression, side-by-side clone, and article advertising rules are unchanged.

## Why

The owner reproduced this on a real device: after completing the NHK ONE usage and region selection and displaying an article, closing and reopening the article displays the selection again. Original Hatena 5.80 DEX confirms an unconditional `removeAllCookies(null)` on article close and `WebStorage.deleteAllData()` at app startup. This patch does not click, submit, or synthesize any NHK preference or consent value.

## Scope and safety

Two guarded DEX call-site changes only, performed **when the option is true**:
- `WebViewActivity.onDestroy()`: original `registerCount=4`, `insns_size=39`, expected `WebViewViewModel.clearWebViewCookie()V` at code-unit offset `0x23`.
- `BookmarkApplication.onCreate()`: original `registerCount=5`, `insns_size=170`, expected `Thread.start()V` at `0x60`, where the thread's sole runnable calls `WebStorage.deleteAllData()`.

Each target instruction is replaced with `nop`; all other original instructions remain. The patch refuses changed call sites or method layouts. With the option OFF, neither method is touched. The pre-existing regular cache cleanup in `onDestroy` stays intact, as do all direct logout and data-clear APIs.

## Testing and remaining confirmation

- Android DEX bundle **built successfully** and all **five patches applied successfully** to the original 5.80 APK for both OFF and ON. Signed test APKs passed v2/v3 signature verification. DEX inspection confirmed that ON replaces only the two expected destructive invokes with `nop` (`onDestroy` 39→37 code units, `onCreate` 170→168); OFF retains the original calls.
- API 36 / WebView 133 emulator, ordinary HTTP test page with persistent cookie and localStorage: the initial seed reported `SEED_COOKIE_OK_STORAGE_OK` for both options. On article close/reopen, OFF displayed `CHECK_COOKIE_MISSING_STORAGE_PRESENT`, ON displayed `CHECK_COOKIE_PRESENT_STORAGE_PRESENT`.
- Following app process force-stop/restart without closing the article, OFF displayed `CHECK_COOKIE_PRESENT_STORAGE_MISSING`, ON displayed `CHECK_COOKIE_PRESENT_STORAGE_PRESENT`. This independently verifies the startup WebStorage deletion toggle. The OFF cookie can survive force-stop when the article's onDestroy has not run; that is expected and does not contradict the close test.
- Existing ad-block, ranking and native PR patches applied with no failures. Focused regression suite and release validator passed.
- **Final NHK ONE selection preservation must be confirmed by the owner on a real device**; a full NHK selection flow could not be reproduced in the emulator.
- See [investigation and design](NHK_ONE_CONSENT_PERSISTENCE_RESEARCH_DESIGN.md).

Do not enable this option if you expect all sites' cookies and web storage to be removed automatically when the article closes.
