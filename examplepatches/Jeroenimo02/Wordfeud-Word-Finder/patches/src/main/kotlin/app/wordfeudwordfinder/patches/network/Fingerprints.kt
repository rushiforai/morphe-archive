package app.wordfeudwordfinder.patches.network

import app.morphe.patcher.Fingerprint

private const val CALLBACK = "Lio/flutter/plugins/cronet_http/UrlRequestCallbackProxy;"
private const val REQUEST = "Lorg/chromium/net/UrlRequest;"
private const val INFO = "Lorg/chromium/net/UrlResponseInfo;"

internal object OnResponseStartedFingerprint : Fingerprint(
    definingClass = CALLBACK,
    name = "onResponseStarted",
    returnType = "V",
    parameters = listOf(REQUEST, INFO)
)

internal object OnReadCompletedFingerprint : Fingerprint(
    definingClass = CALLBACK,
    name = "onReadCompleted",
    returnType = "V",
    parameters = listOf(REQUEST, INFO, "Ljava/nio/ByteBuffer;")
)

internal object OnSucceededFingerprint : Fingerprint(
    definingClass = CALLBACK,
    name = "onSucceeded",
    returnType = "V",
    parameters = listOf(REQUEST, INFO)
)

internal object OnFailedFingerprint : Fingerprint(
    definingClass = CALLBACK,
    name = "onFailed",
    returnType = "V",
    parameters = listOf(REQUEST, INFO, "Lorg/chromium/net/CronetException;")
)

internal object OnCanceledFingerprint : Fingerprint(
    definingClass = CALLBACK,
    name = "onCanceled",
    returnType = "V",
    parameters = listOf(REQUEST, INFO)
)
