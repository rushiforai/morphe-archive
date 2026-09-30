package app.template.patches.myntra.sortbyratingscount

import app.morphe.patcher.Fingerprint

private const val API_REQUEST = "Lcom/myntra/android/react/nativemodules/APIRequest;"

/** `APIRequest.request()` success path: builds the JS response from the OkHttp body. */
internal val ApiRequestResponseFingerprint = Fingerprint(
    definingClass = API_REQUEST,
    name = "response",
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
)

/** Prefetched pages (`DataManager`) handed to JS without a network call. */
internal val ApiRequestPrefetchedFingerprint = Fingerprint(
    definingClass = API_REQUEST,
    name = "responseBody",
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    parameters = listOf("Lcom/google/gson/JsonObject;"),
)

/** React Native `fetch` (NetworkingModule OkHttp callback, text responses). */
internal val ReactNetworkingCallbackFingerprint = Fingerprint(
    strings = listOf("didReceiveNetworkData"),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/facebook/react/modules/network/NetworkingModule$")
    },
)

/**
 * React Native's blob response handler. `fetch` / XHR with a blob response
 * type never expose the body as a String: the handler stores the raw bytes,
 * which is how Myntra's search / listing pages reach JS.
 */
internal val BlobResponseHandlerFingerprint = Fingerprint(
    returnType = "Lcom/facebook/react/bridge/WritableMap;",
    parameters = listOf("Lokhttp3/ResponseBody;"),
    strings = listOf("blobId"),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/facebook/react/modules/blob/BlobModule$")
    },
)

private const val LAYOUT_ENGINE = "Lcom/myntra/android/react/nativemodules/LayoutEngine/LayoutEngineModule;"

/**
 * The layout engine serves `/v3/layout/...` pages (search results, listings)
 * to JS. Both result builders put the page JSON, their first argument, into
 * the `"page"` field of the reply.
 */
internal val LayoutEngineBridgePageDataFingerprint = Fingerprint(
    definingClass = LAYOUT_ENGINE,
    name = "bridgePageData",
)

internal val LayoutEngineProcessSuccessFingerprint = Fingerprint(
    definingClass = LAYOUT_ENGINE,
    name = "processSuccessResponse",
)
