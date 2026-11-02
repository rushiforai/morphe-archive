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
}
