# Change TikTok share domain

Rewrites generated TikTok share links to `sticktock.kareem.one` without replacing every TikTok host in the app.

## Why this patch is narrow

Do **not** globally replace `tiktok.com` string literals in TikTok. A broad replacement makes the share domain change look simple, but it also rewrites internal product and service URLs used by login, comments, account status, commerce, webviews, security pages, and API clients. In testing, that kind of patch still let public feed browsing work, but broke login and comments.

The working approach keeps TikTok's normal networking intact and only rewrites values that are leaving the app as share text or clipboard content.

## Hook coverage

TikTok has multiple independent share/copy paths. The current patch covers all paths that were needed for TikTok `44.9.3`:

- `Intent.putExtra("android.intent.extra.TEXT", String)`
- `Intent.putExtra("android.intent.extra.TEXT", CharSequence)`
- legacy `android.text.ClipboardManager#setText(...)`
- `ClipData.newPlainText(...)`
- direct `android.content.ClipboardManager#setPrimaryClip(...)`
- TikTok/ByteDance clipboard wrapper `LX/0gX5;->LIZJ(ClipboardManager, ClipData, Cert)`
- selected share model string fields such as `shareUrl`, `shortUrl`, `shareLink`, and `shareLinkText`
- selected static short-host literals, currently `vt.tiktok.com` and `vm.tiktok.com`

The important final fix was patching the central ByteDance clipboard wrapper. Earlier versions removed static `vt.tiktok.com` and patched visible share model paths, but copied links still used `vt.tiktok.com` because the active copy flow passed through `LX/0gX5.LIZJ(...)` immediately before writing `ClipData` to the Android clipboard.

## Extension string-literal footgun

The extension is injected into the patched app. Any future global or class-level string-literal rewrite can also affect the extension dex.

Avoid putting full source host literals like `vt.tiktok.com`, `vm.tiktok.com`, `www.tiktok.com`, or `tiktok.com` directly in extension matching logic. Build them at runtime from smaller pieces, for example `"vt" + "." + "tiktok" + "." + "com"`. This prevents the patcher from accidentally rewriting the extension's own match strings before runtime.

## Verification checklist

After changing this patch, test all of the following before considering it done:

1. TikTok launches normally.
2. Login still works.
3. Comments open normally.
4. Public feed browsing still works.
5. Copy/share link returns `sticktock.kareem.one`, not `vt.tiktok.com` or `vm.tiktok.com`.
6. The patched APK no longer contains static `vt.tiktok.com` or `vm.tiktok.com` literals outside intentional non-share exceptions.
7. The installed dex for `LX/0gX5.LIZJ(...)` starts by rewriting its `ClipData` argument through `TikTokShareLinksPatch.rewriteClipData(...)`.

If sharing regresses while login/comments still work, first look for a new clipboard/share sink rather than broadening host replacement across the whole app.
