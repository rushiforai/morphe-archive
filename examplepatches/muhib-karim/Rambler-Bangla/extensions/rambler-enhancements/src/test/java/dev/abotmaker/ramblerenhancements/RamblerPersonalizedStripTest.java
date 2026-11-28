package dev.abotmaker.ramblerenhancements;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

public final class RamblerPersonalizedStripTest {

    @Test
    public void typingSingleDigitImmediatelySuggestsLearnedFullEmailAndDigitId() {
        List<RamblerAtMentionStore.Entry> learned = Arrays.asList(
                new RamblerAtMentionStore.Entry("11muhib.karim@gmail.com", 4, 2000L),
                new RamblerAtMentionStore.Entry("11muhib", 2, 1500L),
                new RamblerAtMentionStore.Entry("@grok", 5, 3000L),
                new RamblerAtMentionStore.Entry("@gmail.com", 5, 3000L));

        RamblerAtMentionStore.ActivePrefix p1 = RamblerAtMentionStore.extractActivePrefix("1");
        assertNotNull(p1);
        assertEquals(RamblerAtMentionStore.PrefixKind.DIGIT_PREFIX, p1.kind);
        assertEquals(1, p1.deleteCount);
        List<String> s1 = RamblerAtMentionStore.suggest(learned, p1, 5);
        assertEquals(Arrays.asList("11muhib.karim@gmail.com", "11muhib"), s1);

        RamblerAtMentionStore.ActivePrefix p11m =
                RamblerAtMentionStore.extractActivePrefix("email: 11m");
        assertNotNull(p11m);
        assertEquals(3, p11m.deleteCount);
        assertEquals(
                Arrays.asList("11muhib.karim@gmail.com", "11muhib"),
                RamblerAtMentionStore.suggest(learned, p11m, 5));

        // Unmatched digit must yield empty so Gboard's native strip stays untouched.
        RamblerAtMentionStore.ActivePrefix p9 = RamblerAtMentionStore.extractActivePrefix("9");
        assertNotNull(p9);
        assertTrue(RamblerAtMentionStore.suggest(learned, p9, 5).isEmpty());
    }

    @Test
    public void completedTokensLearnFullEmailDomainAndDigitIdWhileBlockingBareNumbersAndUnits() {
        List<String> learned = RamblerAtMentionStore.extractCompletedTokens(
                "Contact 11muhib.karim@gmail.com or @grok id 24x7support at 5pm 10mb 2nd 2026 482910 ");
        assertTrue(learned.contains("11muhib.karim@gmail.com"));
        assertTrue(learned.contains("@gmail.com"));
        assertTrue(learned.contains("@grok"));
        assertTrue(learned.contains("24x7support"));
        assertFalse(learned.contains("5pm"));
        assertFalse(learned.contains("10mb"));
        assertFalse(learned.contains("2nd"));
        assertFalse(learned.contains("2026"));
        assertFalse(learned.contains("482910"));
    }

    @Test
    public void letterEmailLocalPrefixTriggersOnlyWithDotOrUnderscorePreservingNormalProse() {
        List<RamblerAtMentionStore.Entry> learned = Arrays.asList(
                new RamblerAtMentionStore.Entry("muhib.karim@gmail.com", 3, 2000L));
        // Normal word "muhib" must NOT hijack Gboard's native word suggestions.
        assertNull(RamblerAtMentionStore.extractActivePrefix("hello muhib"));
        // Dotted email local prefix triggers full email suggestion cleanly.
        RamblerAtMentionStore.ActivePrefix dotted =
                RamblerAtMentionStore.extractActivePrefix("send to muhib.k");
        assertNotNull(dotted);
        assertEquals(RamblerAtMentionStore.PrefixKind.EMAIL_LOCAL_PREFIX, dotted.kind);
        assertEquals(
                Arrays.asList("muhib.karim@gmail.com"),
                RamblerAtMentionStore.suggest(learned, dotted, 5));
    }

    @Test
    public void swiftKeyShortcutsMatchExactAndPrefixAndRoundTripSerialization() {
        List<RamblerSwiftKeyShortcutsStore.Shortcut> shortcuts = Arrays.asList(
                new RamblerSwiftKeyShortcutsStore.Shortcut("!email", "11muhib.karim@gmail.com"),
                new RamblerSwiftKeyShortcutsStore.Shortcut("@@", "muhib@example.com"),
                new RamblerSwiftKeyShortcutsStore.Shortcut("addr", "Dhaka, Bangladesh"));

        RamblerSwiftKeyShortcutsStore.ActiveMatch exact =
                RamblerSwiftKeyShortcutsStore.matchBeforeCursor(shortcuts, "my !email", 5);
        assertNotNull(exact);
        assertEquals(6, exact.deleteCount);
        assertEquals("11muhib.karim@gmail.com", exact.matches.get(0).expansion);

        RamblerSwiftKeyShortcutsStore.ActiveMatch prefix =
                RamblerSwiftKeyShortcutsStore.matchBeforeCursor(shortcuts, "send !em", 5);
        assertNotNull(prefix);
        assertEquals(3, prefix.deleteCount);
        assertEquals("11muhib.karim@gmail.com", prefix.matches.get(0).expansion);

        String serialized = RamblerSwiftKeyShortcutsStore.serialize(shortcuts);
        List<RamblerSwiftKeyShortcutsStore.Shortcut> restored =
                RamblerSwiftKeyShortcutsStore.deserialize(serialized);
        assertEquals(3, restored.size());
        assertEquals("11muhib.karim@gmail.com", restored.get(0).expansion);
    }
}
