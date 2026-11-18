package io.github.sabopura.morphe.extension.twitch.chat;

import org.junit.Test;
import static org.junit.Assert.*;

public class ChatRulesTest {
    @Test public void mentionsMatchTheWholeLoginOnly() {
        assertTrue(ChatRules.mentions("hello @Sabopura!", "sabopura"));
        assertTrue(ChatRules.mentions("sabopura", "sabopura"));
        assertTrue(ChatRules.mentions("yo sabopura, hi", "sabopura"));
        assertFalse(ChatRules.mentions("xsabopura", "sabopura"));
        assertFalse(ChatRules.mentions("sabopura2 said", "sabopura"));
        assertFalse(ChatRules.mentions("sabopura_x", "sabopura"));
        assertFalse(ChatRules.mentions("hi", null));
    }

    @Test public void matchesWidthAndCaseButDoesNotTreatInputAsRegex() {
        ChatRules rules = new ChatRules("ＳＰＡＭ\na.*b", "", "GOOD", "");
        assertTrue(rules.blocks("some spam here", "user", "42"));
        assertFalse(rules.blocks("axxb", "user", "42"));
        assertTrue(rules.blocks("literal a.*b", "user", "42"));
        assertTrue(rules.highlights("good news"));
    }
    @Test public void userRulesAreExactAndSupportIdsAndAtPrefix() {
        ChatRules rules = new ChatRules("", "@Alice\n123", "", "");
        assertTrue(rules.blocks("message", "ALICE", "999"));
        assertTrue(rules.blocks("message", "someone", "123"));
        assertFalse(rules.blocks("Alice said hello", "alice2", "1234"));
    }
    @Test public void highlightedUsersMatchTheLoginOrIdExactly() {
        ChatRules rules = new ChatRules("", "", "", "@Streamer\n42");
        assertTrue(rules.highlightsUser("STREAMER", "7"));
        assertTrue(rules.highlightsUser("someone", "42"));
        assertFalse(rules.highlightsUser("streamer2", "420"));
        assertFalse(new ChatRules("", "streamer", "", "").highlightsUser("streamer", "1"));
    }
    @Test public void blankRulesAndNullFieldsAreHarmless() {
        ChatRules rules = new ChatRules("\n\n", null, "\n", "");
        assertFalse(rules.blocks(null, null, null));
        assertFalse(rules.highlights("anything"));
    }
    @Test public void rulesSeeTheMessageNotTheSender() {
        // Rendered rows read "badges Name: message"; a word rule must not hide "botfan"'s messages.
        assertEquals("hello: there", ChatRules.body("botfan: hello: there"));
        assertEquals("a notice without a sender", ChatRules.body("a notice without a sender"));
        ChatRules rules = new ChatRules("bot", "", "sabopura", "");
        assertFalse(rules.blocks(ChatRules.body("botfan: hi all"), "botfan", "1"));
        assertTrue(rules.blocks(ChatRules.body("someone: the bot is down"), "someone", "2"));
        assertFalse(rules.highlights(ChatRules.body("Sabopura: hi")));
        assertTrue(rules.highlights(ChatRules.body("viewer: hi sabopura")));
    }
    @Test public void foldingCoversKanaWidthAndSpaces() {
        ChatRules rules = new ChatRules("ネタバレ", "", "", "");
        assertTrue(rules.blocks("これはねたばれです", "user", "1"));
        assertTrue(rules.blocks("ネ タ バ レ", "user", "1"));
        assertEquals(ChatRules.normalize("ﾊﾛｰ"), ChatRules.normalize("はろー"));
    }

    /** Folding is the costly part of a row's rules; a row is only folded when a word rule reads it. */
    @Test public void aRowIsNotFoldedWhenNoWordRuleReadsIt() {
        java.util.function.Supplier<String> unused = () -> {
            throw new AssertionError("folded without a word rule");
        };
        assertFalse(new ChatRules("", "", "", "").blocksFolded(unused, "user", "1"));
        assertFalse(new ChatRules("", "", "", "").highlightsFolded(unused));
        assertTrue(new ChatRules("", "alice", "", "").blocksFolded(unused, "Alice", "1"));
        assertTrue(new ChatRules("spam", "", "", "").blocksFolded(() -> "spamhere", "user", "1"));
    }
}
