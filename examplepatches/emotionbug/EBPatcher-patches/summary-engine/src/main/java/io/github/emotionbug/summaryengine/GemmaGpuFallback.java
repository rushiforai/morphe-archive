package io.github.emotionbug.summaryengine;

/** Failure boundary for the pinned LiteRT-LM 0.18.1 JNI, not an inference retry policy. */
final class GemmaGpuFallback {
    private static final String ENGINE_FAILURE = "Failed to create engine: ";

    private GemmaGpuFallback() {}

    static boolean isBackendFailure(String message) {
        // JNI exposes no structured status for initialize(). Match its exact stage and
        // ABSEIL status, not arbitrary 'GPU' text (which could occur in a model path).
        // Model assets/settings, malformed data, missing files and cancellation fail closed.
        if (message == null || !message.startsWith(ENGINE_FAILURE)) return false;
        int statusEnd = message.indexOf(':', ENGINE_FAILURE.length());
        if (statusEnd < 0) return false;
        String status = message.substring(ENGINE_FAILURE.length(), statusEnd);
        switch (status) {
            case "INTERNAL":
            case "UNKNOWN":
            case "UNIMPLEMENTED":
            case "UNAVAILABLE":
            case "RESOURCE_EXHAUSTED":
                // GPU delegate failures can lose their underlying cause and reach JNI
                // only as INTERNAL. Permit one CPU initialization, never an inference
                // replay. An opaque SDK status cannot prove a particular driver cause.
                return true;
            default:
                return false;
        }
    }
}
