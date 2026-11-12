/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.function.Supplier;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CallPeerTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stand-ins with TLRPC's field names. */
    @SuppressWarnings("unused")
    static class User {
        long id;
        String first_name;
        String last_name;

        User(long id, String first, String last) {
            this.id = id;
            first_name = first;
            last_name = last;
        }
    }

    @SuppressWarnings("unused")
    static class Chat {
        long id;
        String title;

        Chat(long id, String title) {
            this.id = id;
            this.title = title;
        }
    }

    /** VoIPService's fields as 13.2.2 declares them, some on the class and some on the one it extends. */
    @SuppressWarnings("unused")
    static class BaseService {
        private User user;
    }

    @SuppressWarnings("unused")
    static class Service extends BaseService {
        private Chat chat;
        private Object groupCall;
        private Object conference;
        private boolean isRtmpStream;

        Service with(User user) {
            ((BaseService) this).user = user;
            return this;
        }
    }

    private Supplier<CallPeer> realReader;

    @Before public void setUp() {
        realReader = CallPeer.reader;
        CallPeer.forget();
        HookStatus.clear();
    }

    @After public void tearDown() {
        CallPeer.reader = realReader;
        CallPeer.forget();
        HookStatus.clear();
    }

    @Test public void aPrivateCallIsThePersonByTheirIdAndFullName() {
        CallPeer peer = CallPeer.of(new Service().with(new User(7, " Alex ", "Kim")));
        assertEquals(CallPeer.PRIVATE, peer.kind);
        assertEquals(7, peer.dialog);
        assertEquals("Alex Kim", peer.name);
        assertEquals("Alex", CallPeer.of(new Service().with(new User(7, "Alex", " "))).name);
        assertEquals("Kim", CallPeer.of(new Service().with(new User(7, null, "Kim"))).name);
        assertNull(CallPeer.of(new Service().with(new User(7, "", null))).name);
    }

    @Test public void aGroupCallIsTheChatUnderItsDialogId() {
        Service service = new Service().with(new User(7, "Alex", "Kim"));
        service.chat = new Chat(9, "Band practice");
        CallPeer peer = CallPeer.of(service);
        assertEquals("the chat wins over the user who started it", CallPeer.GROUP, peer.kind);
        assertEquals(-9, peer.dialog);
        assertEquals("Band practice", peer.name);
    }

    @Test public void aConferenceOrStreamWithNoChatIsStillAGroup() {
        Service conference = new Service().with(new User(7, "Alex", "Kim"));
        conference.conference = new Object();
        assertEquals(CallPeer.GROUP, CallPeer.of(conference).kind);
        assertEquals(0, CallPeer.of(conference).dialog);
        assertNull(CallPeer.of(conference).name);

        Service stream = new Service();
        stream.isRtmpStream = true;
        assertEquals(CallPeer.GROUP, CallPeer.of(stream).kind);
        Service voiceChat = new Service();
        voiceChat.groupCall = new Object();
        assertEquals(CallPeer.GROUP, CallPeer.of(voiceChat).kind);
    }

    @Test public void noCallReadsAsNone() {
        assertSame(CallPeer.NONE, CallPeer.of(new Service()));
        assertSame(CallPeer.NONE, CallPeer.of(new Object()));
    }

    @Test public void aReadStandsForASecondSoTheAudioThreadsDontRepeatIt() {
        int[] reads = {0};
        CallPeer alex = new CallPeer(CallPeer.PRIVATE, 7, "Alex");
        CallPeer.reader = () -> {
            reads[0]++;
            return alex;
        };
        assertSame(alex, CallPeer.at(10_000));
        assertSame(alex, CallPeer.at(10_000 + CallPeer.FRESH_MS - 1));
        assertEquals(1, reads[0]);
        CallPeer.at(10_000 + CallPeer.FRESH_MS);
        assertEquals(2, reads[0]);
        // A clock that went back reads again rather than trusting a read from its future.
        CallPeer.at(5_000);
        assertEquals(3, reads[0]);
    }

    @Test public void aReadThatThrowsIsNoneAndSaysSo() {
        CallPeer.reader = () -> {
            throw new IllegalStateException("no service");
        };
        assertSame(CallPeer.NONE, CallPeer.at(1));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("call peer read"));
    }
}
