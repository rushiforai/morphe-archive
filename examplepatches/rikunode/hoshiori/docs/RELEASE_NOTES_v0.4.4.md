# v0.4.4 ? Preserve article-site preferences ON by default

**Hatena Bookmark 5.80 (58000) only.**

The `preserveArticleWebStorage` boolean option under **Preserve article WebView cookies and storage** is now **ON by default**. It was OFF by default in v0.4.3. The owner chose the new default to avoid a confusing extra opt-in.

When enabled, the existing patch suppresses two automatic cleanup calls: `WebViewActivity.onDestroy` clearing all WebView cookies, and `BookmarkApplication.onCreate` starting the WebStorage-clearing thread. The patch code, DEX guards, and behavior of manual data clearing and logout are **unchanged**. Setting the option to OFF restores the original automatic cleanup behavior.

**Privacy implication:** this applies to every article website, not only NHK. Cookies, site preferences, login sessions and tracking data can persist when the option is ON. Users preferring automatic cleanup should disable `preserveArticleWebStorage` explicitly.

Build-generated `patches-list.json` advertises `default: true`. Other patches (native PR hiding, ranking hiding, clone install and in-app ad blocking) are unchanged. NHK-specific end-to-end confirmation remains the owner's real-device validation; v0.4.3 already verified the underlying OFF/ON cookie and WebStorage behavior using an emulator test page.
