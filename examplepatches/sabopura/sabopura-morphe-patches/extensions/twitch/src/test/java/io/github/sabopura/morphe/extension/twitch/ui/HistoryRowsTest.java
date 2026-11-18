package io.github.sabopura.morphe.extension.twitch.ui;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.Test;

import io.github.sabopura.morphe.extension.twitch.chat.HistoryMessage;

public class HistoryRowsTest {
    private static HistoryRows.Row row(String user, String login, String text) {
        return new HistoryRows.Row(new HistoryMessage(user + text, "1", user, login, text, 1, ""), 0);
    }

    private static HistoryRows rows(HistoryRows.Row... rows) {
        HistoryRows result = new HistoryRows();
        result.set(new ArrayList<>(Arrays.asList(rows)));
        return result;
    }

    private static List<String> users(HistoryRows rows) {
        List<String> users = new ArrayList<>();
        for (int i = 0; i < rows.size(); i++) users.add(rows.get(i).message.user);
        return users;
    }

    @Test
    public void blankSearchKeepsEveryRowInOrder() {
        HistoryRows rows = rows(row("Ann", "ann", "hi"), row("Bob", "bob", "yo"));
        rows.filter("   ");
        assertEquals(Arrays.asList("Ann", "Bob"), users(rows));
        assertFalse(rows.searching());
    }

    @Test
    public void everyWordMustMatchSomewhereInTheRow() {
        HistoryRows rows = rows(row("Ann", "ann", "good game"), row("Bob", "bob", "good luck"));
        rows.filter("bob good");
        assertEquals(Collections.singletonList("Bob"), users(rows));
        assertEquals(2, rows.total());
    }

    @Test
    public void searchIgnoresCaseAndWidthAndFindsHiddenLogins() {
        HistoryRows rows = rows(row("あんこ", "anko_jp", "ｷﾀｰ"), row("Bob", "bob", "hello"));
        rows.filter("ANKO");
        assertEquals(Collections.singletonList("あんこ"), users(rows));
        rows.filter("キター");
        assertEquals(Collections.singletonList("あんこ"), users(rows));
    }

    @Test
    public void newRowsArriveFilteredByTheSearchAlreadyTyped() {
        HistoryRows rows = new HistoryRows();
        rows.filter("luck");
        rows.set(Arrays.asList(row("Ann", "ann", "good game"), row("Bob", "bob", "good luck")));
        assertEquals(Collections.singletonList("Bob"), users(rows));
    }

    @Test
    public void screenFollowsLoadingThenData() {
        assertEquals(HistoryRows.Screen.LOADING, HistoryRows.screen(HistoryRows.Fetch.LOADING, 0, 0));
        assertEquals(HistoryRows.Screen.NO_CHANNEL, HistoryRows.screen(HistoryRows.Fetch.NO_CHANNEL, 0, 0));
        assertEquals(HistoryRows.Screen.FAILED, HistoryRows.screen(HistoryRows.Fetch.FAILED, 0, 0));
        assertEquals(HistoryRows.Screen.BUSY, HistoryRows.screen(HistoryRows.Fetch.BUSY, 0, 0));
        assertEquals(HistoryRows.Screen.EMPTY, HistoryRows.screen(HistoryRows.Fetch.DONE, 0, 0));
        assertEquals(HistoryRows.Screen.NO_MATCH, HistoryRows.screen(HistoryRows.Fetch.DONE, 12, 0));
        assertEquals(HistoryRows.Screen.LIST, HistoryRows.screen(HistoryRows.Fetch.DONE, 12, 3));
    }

    @Test
    public void lineMarksMatchesInNameAndMessage() {
        HistoryRows.Line line = HistoryRows.line("Bob", "go bob go", SearchText.tokens("BOB"));
        assertEquals("Bob: go bob go", line.text);
        assertEquals(3, line.nameEnd);
        assertEquals("go bob go", line.body());
        assertEquals(2, line.marks.size());
        assertArrayEquals(new int[]{0, 3}, line.marks.get(0));
        assertArrayEquals(new int[]{8, 11}, line.marks.get(1));
    }

    @Test
    public void lineMarksPointAtTheOriginalHalfWidthText() {
        HistoryRows.Line line = HistoryRows.line("A", "xﾀｸﾞy", SearchText.tokens("グ"));
        assertArrayEquals(new int[]{5, 7}, line.marks.get(0));
        assertEquals("ｸﾞ", line.text.substring(5, 7));
    }

    @Test
    public void actionMessageReadsAsTheSenderDoingIt() {
        HistoryRows.Line line = HistoryRows.line("Ann", "/me waves", Collections.emptyList());
        assertTrue(line.action);
        assertEquals("Ann waves", line.text);
        assertEquals("waves", line.body());
        assertTrue(line.marks.isEmpty());
    }
}
