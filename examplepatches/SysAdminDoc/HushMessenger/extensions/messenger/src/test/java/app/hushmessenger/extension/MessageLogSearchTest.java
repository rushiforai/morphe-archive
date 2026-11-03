package app.hushmessenger.extension;

import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class MessageLogSearchTest {
    private static final MessageLog.Entry
        FIRST = new MessageLog.Entry(1000, "t1", "Hẹn gặp ở đường Lê Lợi", "Ana Nguyễn", "", "mid.1", false),
        SECOND = new MessageLog.Entry(2000, "t2", "Dinner on Friday", "Ben", "Trip Crew", "mid.2", true),
        THIRD = new MessageLog.Entry(3000, "t1", "See you at dinner", "Ana Nguyễn", "", "mid.3", false);
    private static final List<MessageLog.Entry> NEWEST_FIRST = List.of(THIRD, SECOND, FIRST);

    private static MessageLogSearch.Index index() {
        return new MessageLogSearch.Index(NEWEST_FIRST);
    }

    @Test public void foldingDropsCaseAndAccentsIncludingTheStrokedD() {
        assertEquals("duong le loi", MessageLogSearch.fold("ĐƯỜNG Lê Lợi"));
        assertEquals("cafe", MessageLogSearch.fold("Café"));
        // Nothing to fold in these, and they have to stay findable.
        assertEquals("訊息 123", MessageLogSearch.fold("訊息 123"));
    }

    @Test public void everyWordHasToMatchInAnyOrderAcrossTheMessageAndItsNames() {
        assertEquals(List.of(FIRST), index().find("duong nguyen", null, false));
        assertEquals(List.of(FIRST), index().find("  nguyen   DUONG ", null, false));
        assertEquals(List.of(SECOND), index().find("crew dinner", null, false));
        assertEquals(List.of(THIRD, SECOND), index().find("dinner", null, false));
        assertTrue(index().find("dinner breakfast", null, false).isEmpty());
    }

    @Test public void aChatAndTheUnsentFilterNarrowFurther() {
        assertEquals(List.of(THIRD), index().find("dinner", "t1", false));
        assertEquals(List.of(SECOND), index().find("dinner", null, true));
        assertTrue(index().find("dinner", "t1", true).isEmpty());
    }

    @Test public void anEmptySearchKeepsEverythingInOrder() {
        assertEquals(NEWEST_FIRST, index().find("", null, false));
        assertEquals(NEWEST_FIRST, index().find("   ", null, false));
        assertEquals(List.of(THIRD, FIRST), index().find("", "t1", false));
    }

    @Test public void theIndexKnowsWhetherAnythingWasUnsent() {
        assertTrue(index().hasUnsent);
        assertFalse(new MessageLogSearch.Index(List.of(FIRST, THIRD)).hasUnsent);
    }

    @Test public void chatsComeNewestFirstWithTheirCounts() {
        List<MessageLogSearch.Chat> chats = MessageLogSearch.chats(NEWEST_FIRST);
        assertEquals(2, chats.size());
        assertEquals("t1", chats.get(0).thread);
        assertEquals("Ana Nguyễn", chats.get(0).name);
        assertEquals(2, chats.get(0).count);
        assertEquals(3000, chats.get(0).latest);
        assertEquals("Trip Crew", chats.get(1).name);
        assertEquals(1, chats.get(1).count);
    }

    @Test public void aGroupsNameBeatsTheSenderEvenWhenOnlyAnOlderMessageCarriesIt() {
        List<MessageLogSearch.Chat> chats = MessageLogSearch.chats(List.of(
            new MessageLog.Entry(2000, "g", "newer", "Ben", "", "mid.2", false),
            new MessageLog.Entry(1000, "g", "older", "Ana", "Trip Crew", "mid.1", false)));
        assertEquals("Trip Crew", chats.get(0).name);
    }

    @Test public void aChatNobodyNamedStaysEmpty() {
        assertEquals("", MessageLogSearch.chats(List.of(new MessageLog.Entry(1000, "t", "hello"))).get(0).name);
    }

    @Test public void directMessagesAndGroupChatsSplitByTheChatsKind() {
        MessageLog.Entry direct = new MessageLog.Entry(3000, "ONE_TO_ONE:3:4", "hi", "Ana", "", "mid.3", false);
        MessageLog.Entry encrypted = new MessageLog.Entry(2000, "ADVANCED_CRYPTO_ONE_TO_ONE:9", "hey", "Bo", "", "mid.2", false);
        MessageLog.Entry group = new MessageLog.Entry(1000, "GROUP:7", "hello all", "Ben", "Trip Crew", "mid.1", false);
        MessageLog.Entry unknown = new MessageLog.Entry(500, "", "lost", "", "", "mid.0", false);
        MessageLogSearch.Index index = new MessageLogSearch.Index(List.of(direct, encrypted, group, unknown));
        assertEquals(List.of(direct, encrypted), index.find("", null, false, MessageLogSearch.DIRECT));
        assertEquals(List.of(group), index.find("", null, false, MessageLogSearch.GROUPS));
        // A message with no chat key isn't either kind, but every chat still shows it.
        assertEquals(List.of(direct, encrypted, group, unknown), index.find("", null, false, MessageLogSearch.ALL));
    }

    @Test public void aPickedNameShowsForTheChatAndFindsItsMessages() {
        MessageLog.Entry nameless = new MessageLog.Entry(2000, "GROUP:7", "see you there", "", "", "mid.2", false);
        MessageLog.Entry named = new MessageLog.Entry(1000, "t1", "lunch?", "Ana", "", "mid.1", false);
        java.util.Map<String, String> names = java.util.Map.of("GROUP:7", "Climbing Crew");
        assertEquals("Climbing Crew", MessageLogSearch.chats(List.of(nameless, named), names).get(0).name);
        assertEquals("Ana", MessageLogSearch.chats(List.of(nameless, named), names).get(1).name);

        MessageLogSearch.Index index = new MessageLogSearch.Index(List.of(nameless, named), names);
        assertEquals(List.of(nameless), index.find("climbing there", null, false));
        assertEquals("Climbing Crew", index.chatName("GROUP:7"));
        assertEquals("Ana", index.chatName("t1"));
        // A rename on the log's screen takes effect in the open index, and an empty one takes the name away.
        index.rename("t1", "Ana from work");
        assertEquals(List.of(named), index.find("work", null, false));
        index.rename("GROUP:7", "");
        assertEquals("", index.chatName("GROUP:7"));
        assertTrue(index.find("climbing", null, false).isEmpty());
    }
}
