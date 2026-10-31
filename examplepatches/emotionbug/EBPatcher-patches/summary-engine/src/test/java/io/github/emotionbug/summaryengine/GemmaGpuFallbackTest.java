package io.github.emotionbug.summaryengine;

import org.junit.Test;
import static org.junit.Assert.*;

/** Tests real JNI failure classification; no native engine or fabricated inference. */
public class GemmaGpuFallbackTest {
    @Test public void permitsOnlyRecoverableEngineCreationStatuses() {
        for (String status : new String[]{"INTERNAL", "UNKNOWN", "UNIMPLEMENTED",
                "UNAVAILABLE", "RESOURCE_EXHAUSTED"}) {
            assertTrue(status, GemmaGpuFallback.isBackendFailure(
                    "Failed to create engine: " + status + ": backend initialization failed"));
        }
        // GPU delegate failures may be wrapped with no driver name left in the exception.
        assertTrue(GemmaGpuFallback.isBackendFailure("Failed to create engine: INTERNAL: ERROR: "
                + "[runtime/executor/llm_litert_compiled_model_executor.cc:1928]"));
    }

    @Test public void rejectsModelFailuresEvenWhenPathMentionsGpu() {
        for (String message : new String[]{
                "Model file not found: /models/GPU/model.litertlm",
                "Failed to create model assets: INTERNAL: /models/GPU/model.litertlm",
                "Failed to create engine settings: UNIMPLEMENTED: unsupported model",
                "Failed to create engine: INVALID_ARGUMENT: malformed flatbuffer",
                "Failed to create engine: DATA_LOSS: truncated model",
                "Failed to create engine: NOT_FOUND: tokenizer missing",
                "Failed to create engine: PERMISSION_DENIED: cannot read model",
                "Failed to create engine: FAILED_PRECONDITION: invalid configuration"}) {
            assertFalse(message, GemmaGpuFallback.isBackendFailure(message));
        }
    }

    @Test public void rejectsCancellationInferenceAndUnrecognizedFailures() {
        for (String message : new String[]{
                null, "", "Failed to create engine", "Failed to create engine: INTERNAL",
                "Failed to create engine: CANCELLED: cancelled",
                "Failed to create engine: DEADLINE_EXCEEDED: timed out",
                "Failed to create engine: internal: unknown casing",
                "Failed to create engine: NEW_STATUS: GPU failed",
                "Failed to create conversation: INTERNAL: GPU failed",
                "Failed to start nativeSendMessageAsync: INTERNAL: GPU failed",
                "Status Code: 13. Message: GPU failed",
                "Model reached its output token limit",
                "Invalid JSON from GPU"}) {
            assertFalse(String.valueOf(message), GemmaGpuFallback.isBackendFailure(message));
        }
    }
}
