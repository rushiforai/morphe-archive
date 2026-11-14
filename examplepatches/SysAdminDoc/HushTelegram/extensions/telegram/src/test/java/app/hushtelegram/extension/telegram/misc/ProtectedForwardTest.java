/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.os.Looper;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class ProtectedForwardTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();
    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    private static final long CHANNEL = -1001234L;

    /** A message as the fake Telegram knows it. */
    private static final class Message {
        final int type;
        final boolean restricted;
        final String text;
        File file;
        String documentName;
        boolean document;

        Message(int type, boolean restricted, String text) {
            this.type = type;
            this.restricted = restricted;
            this.text = text;
        }
    }

    /** Telegram's side, recording every send in order. */
    private final class FakeTelegram implements ProtectedForward.Telegram {
        final List<String> sent = new ArrayList<>();
        final Set<Long> secretChats = new HashSet<>();
        final Map<Message, File> afterLoad = new HashMap<>();

        @Override public boolean secret(long dialog) { return secretChats.contains(dialog); }

        @Override public boolean restricted(Object message) { return ((Message) message).restricted; }

        @Override public int type(Object message) { return ((Message) message).type; }

        @Override public int account(Object message) { return 1; }

        @Override public String text(Object message) { return ((Message) message).text; }

        @Override public String documentName(Object message) { return ((Message) message).documentName; }

        @Override public File file(Object message) { return ((Message) message).file; }

        @Override public boolean load(Object message) {
            Message m = (Message) message;
            if (!m.document) return false;
            m.file = afterLoad.get(m);
            return true;
        }

        @Override public boolean sendText(int account, long dialog, String text) {
            sent.add("text " + account + " " + dialog + " " + text);
            return true;
        }

        @Override public boolean sendPhoto(int account, long dialog, String path, String caption) {
            sent.add("photo " + new File(path).getName() + " " + caption + " " + new File(path).isFile());
            return true;
        }

        @Override public boolean sendVideo(int account, long dialog, String path, String caption) {
            sent.add("video " + new File(path).getName() + " " + caption);
            return true;
        }

        @Override public boolean sendFile(int account, long dialog, String path, String mime, String caption) {
            sent.add("file " + new File(path).getName() + " " + mime + " " + caption);
            return true;
        }
    }

    private FakeTelegram telegram;
    private ProtectedForward.Telegram realTelegram;
    private Executor realWork;
    private long realWait;

    @Before public void setUp() {
        realTelegram = ProtectedForward.telegram;
        realWork = ProtectedForward.work;
        realWait = ProtectedForward.waitMs;
        telegram = new FakeTelegram();
        ProtectedForward.telegram = telegram;
        ProtectedForward.work = Runnable::run;
        Settings.BYPASS_CHANNEL_RESTRICTIONS.resetToDefault();
        HookStatus.clear();
    }

    @After public void tearDown() {
        ProtectedForward.telegram = realTelegram;
        ProtectedForward.work = realWork;
        ProtectedForward.waitMs = realWait;
        Settings.BYPASS_CHANNEL_RESTRICTIONS.resetToDefault();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private File file(String name) throws IOException {
        File file = folder.newFile(name);
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(new byte[] {1, 2, 3});
        }
        return file;
    }

    @Test public void switchOffLeavesEveryForwardToTelegram() {
        ArrayList<Object> messages = new ArrayList<>(Arrays.asList(new Message(0, true, "hello")));
        assertSame(messages, ProtectedForward.held(messages, CHANNEL));
        assertTrue(telegram.sent.isEmpty());
    }

    @Test public void protectedMessagesGoOutAsNewMessagesInOrderAndTheRestStayTelegrams() throws IOException {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        Message text = new Message(0, true, "first");
        Message photo = new Message(1, true, "a caption");
        photo.file = file("photo.jpg");
        Message open = new Message(0, false, "from an open chat");
        Message poll = new Message(17, true, null);
        Message video = new Message(3, true, null);
        video.file = file("clip.mp4");
        ArrayList<Object> messages = new ArrayList<>(Arrays.asList(text, photo, open, poll, video));

        ArrayList<?> rest = ProtectedForward.held(messages, CHANNEL);

        assertEquals("only what Telegram can still forward is left", Arrays.asList(open, poll), rest);
        assertEquals(Arrays.asList("text 1 " + CHANNEL + " first", "photo photo.jpg a caption true", "video clip.mp4 null"), telegram.sent);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("protected forward sent as new messages 1"));
    }

    @Test public void nothingLeftAnswersNullSoTelegramSendsNothingItself() {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        ArrayList<Object> messages = new ArrayList<>(Arrays.asList(new Message(0, true, "only")));
        assertNull(ProtectedForward.held(messages, CHANNEL));
        assertEquals(1, telegram.sent.size());
    }

    @Test public void unrestrictedForwardsAndSecretChatsAreLeftAlone() {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        ArrayList<Object> open = new ArrayList<>(Arrays.asList(new Message(0, false, "open")));
        assertSame(open, ProtectedForward.held(open, CHANNEL));
        telegram.secretChats.add(42L);
        ArrayList<Object> toSecret = new ArrayList<>(Arrays.asList(new Message(0, true, "protected")));
        assertSame(toSecret, ProtectedForward.held(toSecret, 42L));
        assertTrue(telegram.sent.isEmpty());
    }

    @Test public void aFileNotOnThePhoneIsDownloadedThenSentUnderItsOwnName() throws IOException {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        Message voice = new Message(2, true, null);
        voice.document = true;
        telegram.afterLoad.put(voice, file("123_456.ogg"));
        Message pdf = new Message(9, true, "notes");
        pdf.document = true;
        pdf.documentName = "Report.pdf";
        telegram.afterLoad.put(pdf, file("5_6.pdf"));

        assertNull(ProtectedForward.held(new ArrayList<>(Arrays.asList(voice, pdf)), CHANNEL));

        assertEquals(Arrays.asList("file 123_456.ogg " + MessageMenu.mimeOf("123_456.ogg") + " null",
                "file Report.pdf application/pdf notes"), telegram.sent);
    }

    @Test public void aPhotoNotOnThePhoneAsksToOpenItFirst() {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        ProtectedForward.waitMs = 0;
        Message photo = new Message(1, true, null);

        assertNull(ProtectedForward.held(new ArrayList<>(Arrays.asList(photo)), CHANNEL));

        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(telegram.sent.isEmpty());
        assertEquals("Open it first to download it", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theStockAnswerModeGivesTelegramsOwnAnswerOnlyWhileOn() {
        Settings.BYPASS_CHANNEL_RESTRICTIONS.save(true);
        assertEquals(0, ChannelRestrictions.noForwards(1));
        ChannelRestrictions.stockAnswers(true);
        try {
            assertEquals(1, ChannelRestrictions.noForwards(1));
            assertEquals(1, ChannelRestrictions.isChatNoForwards(1));
        } finally {
            ChannelRestrictions.stockAnswers(false);
        }
        assertEquals(0, ChannelRestrictions.isChatNoForwards(1));
    }
}
