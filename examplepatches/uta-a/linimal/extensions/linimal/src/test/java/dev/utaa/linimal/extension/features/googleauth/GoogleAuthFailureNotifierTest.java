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
    public void errorCodesAreShownAsIs() {
        assertEquals("NetworkError", GoogleAuthFailureNotifier.displayableErrorCode("NetworkError"));
        assertEquals("UNREGISTERED_ON_API_CONSOLE",
                GoogleAuthFailureNotifier.displayableErrorCode("UNREGISTERED_ON_API_CONSOLE"));
    }

    /** 文字を削って残すと、メールアドレスや token の一部が通知に残るので、値ごと伏せます。 */
    @Test
    public void valuesThatAreNotErrorCodesAreHiddenEntirely() {
        String unknown = GoogleAuthFailureNotifier.UNKNOWN_ERROR;
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode("user@example.com"));
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode("ya29.a0AfB_byC1x2"));
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode("Bad Authentication for user"));
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode("NetworkError\n"));
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode(null));
        assertEquals(unknown, GoogleAuthFailureNotifier.displayableErrorCode(""));
    }

    @Test
    public void overlongValuesAreHidden() {
        StringBuilder longError = new StringBuilder();
        for (int i = 0; i <= GoogleAuthFailureNotifier.MAX_ERROR_CODE_LENGTH; i++) {
            longError.append('A');
        }
        assertEquals(GoogleAuthFailureNotifier.UNKNOWN_ERROR,
                GoogleAuthFailureNotifier.displayableErrorCode(longError.toString()));
        assertEquals(longError.substring(1),
                GoogleAuthFailureNotifier.displayableErrorCode(longError.substring(1)));
    }

    @Test
    public void bindFailureAsksToCheckThatMicrogCanRun() {
        String message = GoogleAuthFailureNotifier.message(Kind.BIND_FAILED, "");
        assertTrue(message.contains("MicroG-RE に接続できませんでした"));
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
        assertTrue(GoogleAuthFailureNotifier.shouldNotify(null, 0L));
        assertFalse(GoogleAuthFailureNotifier.shouldNotify(1_000L, 1_000L + interval - 1));
        assertTrue(GoogleAuthFailureNotifier.shouldNotify(1_000L, 1_000L + interval));
        // 端末の時計が戻った場合は通知します。
        assertTrue(GoogleAuthFailureNotifier.shouldNotify(5_000L, 1_000L));
    }

    /** 間に別の失敗を挟んでも、同じ失敗は間隔の間は出し直しません。 */
    @Test
    public void anotherFailureInBetweenDoesNotResetTheInterval() {
        GoogleAuthFailureNotifier.History history = new GoogleAuthFailureNotifier.History();
        assertTrue(history.record("MICROG_ERROR:NetworkError", 0L));
        assertTrue(history.record("BIND_FAILED:", 1_000L));
        assertFalse(history.record("MICROG_ERROR:NetworkError", 2_000L));
        assertTrue(history.record("MICROG_ERROR:NetworkError", GoogleAuthFailureNotifier.SAME_FAILURE_INTERVAL_MILLIS));
    }

    @Test
    public void onlyARecentNumberOfFailuresIsRemembered() {
        GoogleAuthFailureNotifier.History history = new GoogleAuthFailureNotifier.History();
        assertTrue(history.record("first", 0L));
        for (int i = 0; i < GoogleAuthFailureNotifier.MAX_REMEMBERED_FAILURES; i++) {
            assertTrue(history.record("other" + i, 1L));
        }
        // 最も古い "first" は捨てられているので、間隔内でも通知します。
        assertTrue(history.record("first", 2L));
    }
}
