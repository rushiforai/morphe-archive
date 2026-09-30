package app.template.patches.flipkart.sortbyratingscount

import app.morphe.patcher.Fingerprint

/**
 * Hooks the React Native NetworkCaller bridge callbacks.
 *
 * Flipkart 9.13+ renders search/browse results in a React Native "multiWidget"
 * container.  The JS bundle fetches the raw JSON via the `NetworkCaller` native
 * module (`com.flipkart.reacthelpersdk.modules.network.CrossPlatformNetworkCaller`).
 *
 * There is one callback implementation per public module method:
 *
 *   getNetworkResponseAsync        -> network.a
 *   getAsyncNetworkResponse        -> network.b
 *   getNetworkResponseAndCacheAsync-> network.d
 *   getAsyncNetworkResponseAndCache-> network.f
 *
 * All four receive the raw response string in `OnSuccess(String)` and resolve
 * the JS Promise with it, so we hook every variant: the search page does not
 * necessarily use the "plain" method.
 */
internal val NetworkCallerResponseFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/reacthelpersdk/modules/network/a;",
    name = "OnSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal val NetworkCallerAsyncResponseFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/reacthelpersdk/modules/network/b;",
    name = "OnSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal val NetworkCallerResponseCacheFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/reacthelpersdk/modules/network/d;",
    name = "OnSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal val NetworkCallerAsyncResponseCacheFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/reacthelpersdk/modules/network/f;",
    name = "OnSuccess",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * `com.flipkart.mapi.client.converter.f` is the only converter that attaches
 * the raw HTTP response body to `com.flipkart.mapi.model.o.m` (the field read
 * exclusively by the NetworkCaller resolver).  Sorting `o.m` here guarantees
 * every consumer downstream (the resolver, and hence every callback variant)
 * sees the re-ordered JSON.
 */
internal val MapiRawResponseConverterFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/mapi/client/converter/f;",
    name = "convert",
    returnType = "Lcom/flipkart/mapi/model/o;",
    parameters = listOf("Lokhttp3/d0;"),
)

/**
 * Base Gson converter shared by every mapi response.  All converter
 * subclasses route through `convert(ResponseBody, Reader)`, so wrapping the
 * reader here intercepts every mapi page (search, category, browse, ...)
 * before Gson parses it.
 */
internal val MapiGsonConvertFingerprint = Fingerprint(
    definingClass = "Lcom/flipkart/mapi/client/converter/h;",
    name = "convert",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lokhttp3/d0;", "Ljava/io/Reader;"),
)
