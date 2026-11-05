package dev.utaa.linimal.extension.features.googleauth;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import dev.utaa.linimal.extension.features.googleauth.GoogleAuthFailureNotifier.Kind;
import org.junit.Test;

/** token 要求の失敗通知が、診断に要る情報だけを載せ、利用者が解決できる要求では出ないことを検証します。 */
public final class GoogleAuthFailureNotifierTest {

    @Test
    public void errorsFromMicrogAreReported() {
        assertTrue(GoogleAuthFailureNotifier.isReportableError("NetworkError"));
        assertTrue(GoogleAuthFailureNotifier.isReportableError("ServiceUnavailable"));
        assertTrue(GoogleAuthFailureNotifier.isReportableError("UNREGISTERED_ON_API_CONSOLE"));
        assertTrue(GoogleAuthFailureNotifier.isReportableError("BadAuthentication"));
    }

    /** アクセス許可の確認などは LINE が MicroG-RE の画面を開いて解決するので、失敗として扱いません。 */
    @Test
    public void userResolvableResponsesAreNotReported() {
        assertFalse(GoogleAuthFailureNotifier.isReportableError(null));
        assertFalse(GoogleAuthFailureNotifier.isReportableError(""));
        assertFalse(GoogleAuthFailureNotifier.isReportableError("OK"));
        assertFalse(GoogleAuthFailureNotifier.isReportableError("NeedPermission"));
        assertFalse(GoogleAuthFailureNotifier.isReportableError("NeedRemoteConsent"));
        assertFalse(GoogleAuthFailureNotifier.isReportableError("UserCancel"));
    }

    @Test
    public void sanitizeKeepsErrorCodesAndDropsOtherCharacters() {
        assertEquals("NetworkError", GoogleAuthFailureNotifier.sanitize("NetworkError"));
        assertEquals("Could not bind to service.", GoogleAuthFailureNotifier.sanitize("Could not bind to service."));
        assertEquals("userexample.com", GoogleAuthFailureNotifier.sanitize("user@example.com\n"));
        assertEquals("", GoogleAuthFailureNotifier.sanitize(null));
    }

    @Test
    public void sanitizeLimitsTheLength() {
        StringBuilder longError = new StringBuilder();
        for (int i = 0; i < 200; i++) {
            longError.append('A');
        }
        assertEquals(GoogleAuthFailureNotifier.MAX_ERROR_LENGTH,
                GoogleAuthFailureNotifier.sanitize(longError.toString()).length());
    }

    @Test
    public void bindFailureAsksToCheckThatMicrogCanRun() {
        String message = GoogleAuthFailureNotifier.message(Kind.BIND_FAILED, "Could not bind to service.");
        assertTrue(message.contains("MicroG-RE に接続できませんでした"));
        assertTrue(message.contains("Could not bind to service."));
        assertTrue(message.contains("バッテリー"));
    }

    @Test
    public void networkErrorExplainsThePossibleCauses() {
        String message = GoogleAuthFailureNotifier.message(Kind.MICROG_ERROR, "NetworkError");
        assertTrue(message.contains("「NetworkError」"));
        assertTrue(message.contains("MicroG-RE に無い"));
        assertTrue(message.contains("Google が要求を拒否"));
        assertTrue(message.contains("Google に接続できなかった"));
    }

    @Test
    public void otherErrorsShowTheErrorCode() {
        assertEquals("MicroG-RE がエラー「ServiceUnavailable」を返しました。",
                GoogleAuthFailureNotifier.message(Kind.MICROG_ERROR, "ServiceUnavailable"));
    }

    @Test
    public void environmentListsVersionsAndMarksUnknownValues() {
        assertEquals("MicroG-RE 7.3.0 / LINE 26.16.0 / Android 16 (SDK 36)",
                GoogleAuthFailureNotifier.environment("7.3.0", "26.16.0", "16", 36));
        assertEquals("MicroG-RE 不明 / LINE 26.16.0 / Android 16 (SDK 36)",
                GoogleAuthFailureNotifier.environment(null, "26.16.0", "16", 36));
    }

    @Test
    public void theSameFailureIsNotRepeatedWithinTheInterval() {
        long interval = GoogleAuthFailureNotifier.SAME_FAILURE_INTERVAL_MILLIS;
        assertTrue(GoogleAuthFailureNotifier.shouldNotify(null, Long.MIN_VALUE, "a", 0L));
        assertFalse(GoogleAuthFailureNotifier.shouldNotify("a", 1_000L, "a", 1_000L + interval - 1));
        assertTrue(GoogleAuthFailureNotifier.shouldNotify("a", 1_000L, "a", 1_000L + interval));
        assertTrue(GoogleAuthFailureNotifier.shouldNotify("a", 1_000L, "b", 1_001L));
        assertTrue(GoogleAuthFailureNotifier.shouldNotify("a", 5_000L, "a", 1_000L));
    }
}
