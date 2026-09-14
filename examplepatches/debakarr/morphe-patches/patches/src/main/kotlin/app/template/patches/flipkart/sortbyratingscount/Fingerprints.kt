package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.Fingerprint

/**
 * Hooks the React Native NetworkCaller bridge callback.
 *
 * Flipkart 9.13+ is a React Native app — search results are rendered by RN,
 * not in a WebView.  The JS bundle calls `NetworkCaller.getNetworkResponseAsync()`
 * which creates a `com.flipkart.reacthelpersdk.modules.network.a` callback that
 * resolves the Promise with the raw JSON response string.
 *
 * We hook `OnSuccess(String)` to intercept the JSON, parse it, sort products
 * by `ratingCount` descending, and pass the sorted JSON back to JS.
 */
internal val NetworkCallerOnSuccessFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/reacthelpersdk/modules/network/b;",
    name = "OnSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)
