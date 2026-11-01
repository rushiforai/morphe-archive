package patches.bright

import app.morphe.patcher.patch.resourcePatch

/**
 * Startup and manual UMP consent suppression. Every edited call site in the
 * audited build discards the SDK call's result and continues into its own
 * `ReturnAsyncNotFuture`/return tail, so each Dart closure still completes
 * exactly once with its original value while no consent form is requested,
 * loaded or shown, and no consent/age choice is ever written:
 *  - `main`'s `requestConsentInfoUpdate` (startup network request),
 *  - the `isConsentFormAvailable` listener's `loadConsentForm`,
 *  - the form-loaded listener's `ConsentFormImpl.show`,
 *  - the error/retry closure's `loadConsentForm`,
 *  - the standalone `loadForm` closure's `loadConsentForm`.
 */
internal val consentNative = resourcePatch {
    dependsOn(originalInput, adNative)
    execute { applyNativePolicy(NativePolicy.CONSENT) }
}

internal val nativeConsentEdits = mapOf(
    "arm64-v8a" to listOf(
        NativeEdit(NativeRange("main", 0x6db338, 0x424,
            "ac4bd76360e1d439b00830fef0cc9fd2701ec496dd8c7af4dfe32860c13280ee"), 0x6db640,
            nativeBytes("8a030094"), nativeBytes("1f2003d5")),
        NativeEdit(NativeRange("consentAvailableListener", 0x6e7d24, 0xcc,
            "270004373c8abaad61563cf0391b56e70cf34a80b0b9868394aaa1c141f3ab3d"), 0x6e7ddc,
            nativeBytes("05000094"), nativeBytes("1f2003d5")),
        NativeEdit(NativeRange("consentShowListener", 0x6e8024, 0xb8,
            "f732d4d73f850b5da7ed4f3e8c78f26e37c5c6179dcc4a6042d40f3b907259c7"), 0x6e80c8,
            nativeBytes("05000094"), nativeBytes("1f2003d5")),
        NativeEdit(NativeRange("consentErrorRetry", 0x6e83f4, 0x78,
            "9b1f508f4ce70bb6f1ea514547a2732f20981d6121bb1b96ee5222456c42542c"), 0x6e8450,
            nativeBytes("68feff97"), nativeBytes("1f2003d5")),
        NativeEdit(NativeRange("consentLoadForm", 0x6e8490, 0x68,
            "d93c6e9a5550e8384f506a6b5943e657f28f30ac5b40e540a3379ef5b4e47602"), 0x6e84dc,
            nativeBytes("45feff97"), nativeBytes("1f2003d5")),
    ),
)
