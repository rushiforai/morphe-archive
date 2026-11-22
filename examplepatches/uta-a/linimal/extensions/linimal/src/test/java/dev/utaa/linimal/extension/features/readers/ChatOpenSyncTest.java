package dev.utaa.linimal.extension.features.readers;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public final class ChatOpenSyncTest {
    @After
    public void reset() {
        ChatOpenSync.resetForTesting();
    }

    @Test
    public void syncsOnlyWhenTheSettingIsOnTheBridgeExistsAndTheChatHasMembers() {
        assertTrue(ChatOpenSync.shouldSync(true, true, "c1"));
        assertTrue(ChatOpenSync.shouldSync(true, true, "r1"));
        // 設定 OFF のときは通信しません。
        assertFalse(ChatOpenSync.shouldSync(false, true, "c1"));
        // 同期用の生成メソッドがない build では何もしません。
        assertFalse(ChatOpenSync.shouldSync(true, false, "c1"));
        assertFalse(ChatOpenSync.shouldSync(true, true, "u1"));
        assertFalse(ChatOpenSync.shouldSync(true, true, null));
    }

    @Test
    public void eachChatIsSyncedOnceWhileTheSameScreenStaysOpen() {
        Object screen = new Object();
        assertTrue(ChatOpenSync.markFirstOpen(screen, "c1", 0L));
        // 同じ画面での以降の bind（スクロールや新着）では同期しません。
        assertFalse(ChatOpenSync.markFirstOpen(screen, "c1", 0L));
        assertFalse(ChatOpenSync.markFirstOpen(screen, "c1", 0L));
        // 同じ画面で別のトークに切り替わったときは同期します。
        assertTrue(ChatOpenSync.markFirstOpen(screen, "c2", 0L));
    }

    @Test
    public void reopeningTheChatOnANewScreenSyncsAgain() {
        assertTrue(ChatOpenSync.markFirstOpen(new Object(), "c1", 0L));
        assertTrue(ChatOpenSync.markFirstOpen(new Object(), "c1", 0L));
    }

    @Test
    public void missingScreenOrChatIsNeverMarked() {
        assertFalse(ChatOpenSync.markFirstOpen(null, "c1", 0L));
        assertFalse(ChatOpenSync.markFirstOpen(new Object(), null, 0L));
    }

    @Test
    public void aFailedSyncIsRetriedOnALaterBindAfterTheRetryInterval() {
        Object screen = new Object();
        assertTrue(ChatOpenSync.markFirstOpen(screen, "c1", 1_000L));
        ChatOpenSync.markFailed(screen, "c1", 2_000L);
        // 失敗の直後に続く bind では、通信を繰り返しません。
        assertFalse(ChatOpenSync.markFirstOpen(screen, "c1", 2_000L));
        assertFalse(ChatOpenSync.markFirstOpen(screen, "c1", 2_000L + ChatOpenSync.RETRY_MILLIS - 1));
        // 間隔をあけた次の bind で 1 回だけ再試行します。
        assertTrue(ChatOpenSync.markFirstOpen(screen, "c1", 2_000L + ChatOpenSync.RETRY_MILLIS));
        assertFalse(ChatOpenSync.markFirstOpen(screen, "c1", 2_000L + ChatOpenSync.RETRY_MILLIS));
    }

    @Test
    public void failureOfAnUnknownScreenIsIgnored() {
        ChatOpenSync.markFailed(null, "c1", 0L);
        ChatOpenSync.markFailed(new Object(), null, 0L);
        Object screen = new Object();
        ChatOpenSync.markFailed(screen, "c1", 0L);
        // 記録のない組の失敗は、同期済みの扱いにも再試行待ちにもしません。
        assertTrue(ChatOpenSync.markFirstOpen(screen, "c1", 0L));
    }
}
