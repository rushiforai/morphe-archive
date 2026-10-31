/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class KeepTimedMediaTest {
    private static final KeepTimedMedia.Telegram REAL = KeepTimedMedia.telegram;
    private static final long CHAT = 5;
    private static final long SECRET = -8589934592L;

    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** A test message: whether it's received timed media, and whether it's in a secret chat. */
    private static final class Message {
        final boolean timed;
        final boolean secret;

        Message(boolean timed, boolean secret) {
            this.timed = timed;
            this.secret = secret;
        }
    }

    @Before public void fake() {
        restore();
        KeepTimedMedia.telegram = new KeepTimedMedia.Telegram() {
            @Override public boolean receivedTimedMedia(Object message) { return ((Message) message).timed; }
            @Override public boolean secretChat(Object message) { return ((Message) message).secret; }
            @Override public boolean secretDialog(long dialogId) { return dialogId == SECRET; }
        };
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.KEEP_TIMED_MEDIA);
        Settings.KEEP_TIMED_MEDIA.resetToDefault();
        KeepTimedMedia.telegram = REAL;
        HookStatus.clear();
    }

    @Test public void startsOffSoTimedMediaWorksAsUsual() {
        assertFalse(Settings.KEEP_TIMED_MEDIA.get());
        assertFalse(KeepTimedMedia.hold(new Message(true, false)));
        assertFalse(KeepTimedMedia.keepStored(CHAT));
    }

    @Test public void receivedTimedMediaInAnOrdinaryChatIsHeldAndCounted() {
        Settings.KEEP_TIMED_MEDIA.save(true);
        assertTrue(KeepTimedMedia.hold(new Message(true, false)));
        assertTrue(KeepTimedMedia.keepStored(CHAT));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("timed media kept"));
        assertTrue(report, report.contains("timed media left in storage"));
    }

    @Test public void secretChatsOtherMessagesAndNoMessageStayStock() {
        Settings.KEEP_TIMED_MEDIA.save(true);
        assertFalse("a secret chat's timed media", KeepTimedMedia.hold(new Message(true, true)));
        assertFalse("a message with no timer, or your own", KeepTimedMedia.hold(new Message(false, false)));
        assertFalse("no message", KeepTimedMedia.hold(null));
        assertFalse("a secret chat's storage", KeepTimedMedia.keepStored(SECRET));
    }

    @Test public void pausedHushTelegramLeavesItStock() {
        Settings.KEEP_TIMED_MEDIA.save(true);
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertFalse(KeepTimedMedia.hold(new Message(true, false)));
        assertFalse(KeepTimedMedia.keepStored(CHAT));
    }

    @Test public void aFailingQuestionLeavesItStockAndIsReported() {
        Settings.KEEP_TIMED_MEDIA.save(true);
        KeepTimedMedia.telegram = new KeepTimedMedia.Telegram() {
            @Override public boolean receivedTimedMedia(Object message) { throw new IllegalStateException("moved"); }
            @Override public boolean secretChat(Object message) { return false; }
            @Override public boolean secretDialog(long dialogId) { throw new IllegalStateException("moved"); }
        };
        assertFalse(KeepTimedMedia.hold(new Message(true, false)));
        assertFalse(KeepTimedMedia.keepStored(CHAT));
        assertTrue(HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString(),
                HookStatus.missing(FamilyNames.KEEP_DELETED_MESSAGES).toString().contains("timed media"));
    }

    @Test public void theUnpatchedStubsAnswerSafely() {
        assertFalse(KeepTimedMedia.receivedTimedMedia(new Object()));
        assertTrue(KeepTimedMedia.secretChat(new Object()));
        assertTrue(KeepTimedMedia.secretDialog(CHAT));
    }
}
