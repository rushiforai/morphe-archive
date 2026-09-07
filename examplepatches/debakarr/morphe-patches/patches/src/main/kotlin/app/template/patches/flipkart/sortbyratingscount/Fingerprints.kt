package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.Fingerprint

// TODO: Flipkart (com.flipkart.android) is a native app — these are
// PLACEHOLDERS. Confirm with jadx/apktool on your target APK version:
//
// 1. If search results render in a WebView, find the WebViewClient
//    subclass (search smali for 'Landroid/webkit/WebViewClient' implementors,
//    then its onPageFinished(WebView, String)) and point the fingerprint below
//    at it. The helper call in SortByRatingsCountPatch.kt then works as-is.
// 2. If results are native RecyclerViews (most likely), WebView injection
//    cannot reach them. Instead find the sort comparator / API sort-param
//    builder (search for strings like 'sort', 'popularity', 'numberOfRatings')
//    and hook that. Until then, leave this patch disabled.

// Placeholder: replace definingClass/name/strings after APK analysis.
internal val FlipkartWebViewClientOnPageFinishedFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/android/web/WebViewClient;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)
