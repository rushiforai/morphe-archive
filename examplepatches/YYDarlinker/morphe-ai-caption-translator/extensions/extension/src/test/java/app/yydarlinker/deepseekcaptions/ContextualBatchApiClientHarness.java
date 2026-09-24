package app.yydarlinker.deepseekcaptions;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;

/** JVM-style parser regression harness for conservative per-unit batch outcomes. */
public final class ContextualBatchApiClientHarness {
    public static void main(String[] args) throws Exception {
        List<TranslationUnitTimeline.Unit> units = Arrays.asList(
                unit(0, "u0"), unit(1, "u1"), unit(2, "u2")
        );

        ContextualBatchApiClient.Result complete = parse(
                "{\"translations\":[" +
                        "{\"id\":\"u0\",\"text\":\"零\"}," +
                        "{\"id\":\"u1\",\"text\":\"一\"}," +
                        "{\"id\":\"u2\",\"text\":\"二\"}]}" , units
        );
        assertEquals(3, complete.validCount(), "complete valid count");
        assertEquals(0, complete.missingIds.size(), "complete missing count");

        ContextualBatchApiClient.Result partial = parse(
                "{\"translations\":[" +
                        "{\"id\":\"u0\",\"text\":\"零\"}," +
                        "{\"id\":\"u2\",\"text\":\"二\"}]}" , units
        );
        assertEquals(2, partial.validCount(), "partial valid count");
        assertContains(partial.missingIds, "u1", "partial missing id");

        ContextualBatchApiClient.Result duplicate = parse(
                "{\"translations\":[" +
                        "{\"id\":\"u0\",\"text\":\"零\"}," +
                        "{\"id\":\"u0\",\"text\":\"重复\"}," +
                        "{\"id\":\"u2\",\"text\":\"二\"}]}" , units
        );
        assertEquals(1, duplicate.validCount(), "duplicate valid count");
        assertContains(duplicate.invalidIds, "u0", "duplicate invalid id");
        assertContains(duplicate.missingIds, "u0", "duplicate retry id");

        ContextualBatchApiClient.Result mixed = parse(
                "{\"translations\":[" +
                        "{\"id\":\"u0\",\"text\":\"零\"}," +
                        "{\"id\":\"u1\",\"text\":\"   \"}," +
                        "{\"id\":\"unknown\",\"text\":\"x\"}]}" , units
        );
        assertEquals(1, mixed.validCount(), "mixed valid count");
        assertContains(mixed.invalidIds, "u1", "empty text invalid id");
        assertContains(mixed.unknownIds, "unknown", "unknown response id");
        assertContains(mixed.missingIds, "u2", "missing response id");

        ContextualBatchApiClient.Result fenced = parse(
                "```json\n{\"translations\":[{\"id\":\"u0\",\"text\":\"零\"}]}\n```",
                Arrays.asList(unit(0, "u0"))
        );
        assertEquals(1, fenced.validCount(), "markdown fence");

        expectGlobalFailure("{\"translations\":[{\"text\":\"missing id\"}]}", units);
        expectGlobalFailure("not-json", units);
        expectGlobalFailure("{\"translations\":{}}", units);
        expectGlobalFailure(
                "{\"translations\":[{\"id\":\"dup\",\"text\":\"x\"}]}",
                Arrays.asList(unit(0, "dup"), unit(1, "dup"))
        );

        ContextualBatchApiClient.Result collapsed = parse(
                "{\"translations\":[{\"id\":\"lyric\",\"text\":\"热\"}]}",
                Arrays.asList(unit(0, "lyric", "give me something"))
        );
        assertEquals(0, collapsed.validCount(), "extreme under-translation rejected");
        assertContains(collapsed.invalidIds, "lyric", "under-translation invalid id");

        ContextualBatchApiClient.Result faithfulLyric = parse(
                "{\"translations\":[{\"id\":\"lyric\",\"text\":\"给我点什么\"}]}",
                Arrays.asList(unit(0, "lyric", "give me something"))
        );
        assertEquals(1, faithfulLyric.validCount(), "faithful short lyric accepted");

        ContextualBatchApiClient.Result annotationOnly = parse(
                "{\"translations\":[{\"id\":\"noise\",\"text\":\"[请喉咙] >>\"}]}",
                Arrays.asList(unit(0, "noise", "clears his throat"))
        );
        assertEquals(0, annotationOnly.validCount(), "annotation-only output rejected");

        ContextualBatchApiClient.Result shortValid = parse(
                "{\"translations\":[{\"id\":\"hot\",\"text\":\"热\"}]}",
                Arrays.asList(unit(0, "hot", "hot"))
        );
        assertEquals(1, shortValid.validCount(), "short source may translate to one character");

        assertEquals(
                ContextualUnitCorePolicy.FailureKind.TRANSIENT,
                ContextualBatchApiClient.failureKind(
                        new ContextualBatchApiClient.RetryableException("timeout", "timeout")
                ),
                "transient classification"
        );
        assertEquals(
                ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL,
                ContextualBatchApiClient.failureKind(
                        new ContextualBatchApiClient.BatchFormatException("protocol", "bad json")
                ),
                "protocol classification"
        );
        assertEquals(
                ContextualUnitCorePolicy.FailureKind.PERMANENT,
                ContextualBatchApiClient.failureKind(
                        new ContextualBatchApiClient.PermanentException("http_401", "unauthorized", "secret")
                ),
                "permanent classification"
        );
        assertEquals(
                "http_401",
                ContextualBatchApiClient.failureCategory(
                        new ContextualBatchApiClient.PermanentException("http_401", "unauthorized", "secret")
                ),
                "sanitized provider category"
        );
        ContextualBatchApiClient.ProviderRequestException rejectedBatch =
                new ContextualBatchApiClient.ProviderRequestException(
                        "http_400_invalid_parameter_response_format",
                        "API HTTP 400",
                        "{\"error\":{\"code\":\"invalid_parameter\",\"param\":\"response_format\"}}"
                );
        assertEquals(
                ContextualUnitCorePolicy.FailureKind.RETRYABLE_PROTOCOL,
                ContextualBatchApiClient.failureKind(rejectedBatch),
                "generic HTTP 400 must remain recoverable"
        );
        assertEquals(false, ContextualBatchApiClient.requiresBatchIsolation(rejectedBatch),
                "HTTP 400 batch rejection requests per-unit isolation");
        assertEquals(
                "http_400_invalid_parameter_response_format",
                ContextualBatchApiClient.failureCategory(rejectedBatch),
                "provider category contains only safe structured fields"
        );
        assertEquals(
                "http_400_invalid_parameter_response_format_response_format_unsupported",
                ContextualBatchApiClient.safeProviderCategory(
                        400,
                        "{\"error\":{\"code\":\"invalid parameter\",\"param\":\"response_format\"," +
                                "\"message\":\"sensitive provider detail must not persist\"}}"
                ),
                "safe provider category excludes response message"
        );
        assertEquals(true, ContextualBatchApiClient.providerRejectsParameter(
                        new ContextualBatchApiClient.ProviderRequestException(
                                "http_400_invalid_parameter_max_tokens",
                                "API HTTP 400",
                                "{\"error\":{\"code\":\"invalid_parameter\"," +
                                        "\"param\":\"max_tokens\"," +
                                        "\"message\":\"max_tokens is out of range\"}}"
                        ),
                        "max_tokens"
                ),
                "recognized max_tokens rejection enables provider-default fallback"
        );
        assertEquals(false, ContextualBatchApiClient.providerRejectsParameter(
                        rejectedBatch, "max_tokens"
                ),
                "fallback must not remove unrelated parameters"
        );
        System.out.println("ContextualBatchApiClientHarness: OK");
    }

    private static ContextualBatchApiClient.Result parse(
            String json,
            List<TranslationUnitTimeline.Unit> units
    ) throws Exception {
        Method method = ContextualBatchApiClient.class.getDeclaredMethod(
                "parse", String.class, List.class
        );
        method.setAccessible(true);
        try {
            return (ContextualBatchApiClient.Result) method.invoke(null, json, units);
        } catch (InvocationTargetException error) {
            Throwable cause = error.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw error;
        }
    }

    private static void expectGlobalFailure(String json, List<TranslationUnitTimeline.Unit> units)
            throws Exception {
        try {
            parse(json, units);
            throw new AssertionError("expected global protocol failure");
        } catch (ContextualBatchApiClient.BatchFormatException expected) {
            // Expected: mapping cannot be trusted.
        }
    }

    private static TranslationUnitTimeline.Unit unit(int index, String id) {
        return unit(index, id, "source" + index);
    }

    private static TranslationUnitTimeline.Unit unit(int index, String id, String source) {
        return new TranslationUnitTimeline.Unit(
                index, id, index, index, index, index,
                index * 1_000L, index * 1_000L + 900L,
                source,
                TranslationUnitTimeline.Confidence.HIGH,
                "harness"
        );
    }

    private static void assertContains(List<String> values, String expected, String label) {
        if (!values.contains(expected)) {
            throw new AssertionError(label + ": missing " + expected + " in " + values);
        }
    }

    private static void assertEquals(Object expected, Object actual, String label) {
        if (expected == null ? actual != null : !expected.equals(actual)) {
            throw new AssertionError(label + ": expected=" + expected + " actual=" + actual);
        }
    }
}
