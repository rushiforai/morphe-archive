package app.hushmessenger.extension;

import android.view.View;
import android.widget.TextView;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class MessageActionsTest {
    /** Messenger's action kinds keep their names, MORE among them. */
    enum Kind { REPLY, FORWARD, PIN, COPY, MORE }
    /** An enum that isn't the action kind: no MORE. */
    enum Other { REPLY, FORWARD }

    /** A stand-in for Messenger's action: its kind, its title's string resource and a small count that isn't one. */
    static final class Action {
        final Kind kind;
        final int title;
        final int count = 1;

        Action(Kind kind, int title) {
            this.kind = kind;
            this.title = title;
        }

        // Messenger's actions can compare equal to each other, so nothing may lean on equals.
        @Override public boolean equals(Object other) { return other instanceof Action; }
        @Override public int hashCode() { return 1; }
    }

    static final class NotAnAction {
        final Other kind = Other.REPLY;
    }

    static final class TwoTitles {
        final Kind kind = Kind.PIN;
        final int title = android.R.string.ok;
        final int subtitle = android.R.string.cancel;
    }

    final Action reply = new Action(Kind.REPLY, android.R.string.copy);
    final Action forward = new Action(Kind.FORWARD, android.R.string.paste);
    final Action pin = new Action(Kind.PIN, android.R.string.cut);
    final Action copy = new Action(Kind.COPY, android.R.string.selectAll);
    final List<Object> items = List.of(reply, forward, pin, copy);

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(MessageActions.KEY, true).commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        MessageActions.resetForTests();
        Settings.hookErrors.clear();
    }

    @After public void clearFailures() {
        Settings.hookErrors.clear();
    }

    private static void assertOrder(List<?> got, Object... expected) {
        assertEquals(expected.length, got.size());
        for (int i = 0; i < expected.length; i++) assertSame("item " + i, expected[i], got.get(i));
    }

    @Test public void untilYouChangeSomethingMessengersOrderStandsAndItsActionsGetListed() {
        assertSame(items, MessageActions.arrange(items, 1));
        assertEquals(List.of("REPLY", "FORWARD", "PIN", "COPY"), MessageActions.seen(MessageActions.SENT));
        assertTrue("Only the side that was held", MessageActions.seen(MessageActions.GOT).isEmpty());
        assertEquals(RuntimeEnvironment.getApplication().getString(android.R.string.copy), MessageActions.label("REPLY"));
        assertEquals("An action that hasn't come by yet reads as its name", "Save video", MessageActions.label("SAVE_VIDEO"));
        assertFalse(MessageActions.customized(MessageActions.SENT));
    }

    @Test public void yourOrderPutsYourPicksFirstForThatSideOnly() {
        MessageActions.arrange(items, 1);
        MessageActions.arrange(items, 0);
        assertTrue(MessageActions.move(MessageActions.SENT, "PIN", -1));
        assertTrue(MessageActions.move(MessageActions.SENT, "PIN", -1));
        assertEquals(List.of("PIN", "REPLY", "FORWARD", "COPY"), MessageActions.order(MessageActions.SENT));
        assertOrder(MessageActions.arrange(items, 1), pin, reply, forward, copy);
        assertSame("Messages you got keep Messenger's order", items, MessageActions.arrange(items, 0));
    }

    @Test public void anOrderThatMatchesMessengersHandsBackTheSameList() {
        MessageActions.arrange(items, 1);
        MessageActions.move(MessageActions.SENT, "PIN", 1);
        MessageActions.move(MessageActions.SENT, "PIN", -1);
        assertTrue(MessageActions.customized(MessageActions.SENT));
        assertSame(items, MessageActions.arrange(items, 1));
    }

    @Test public void hiddenActionsLeaveTheMenuAndComeBackWhenShown() {
        MessageActions.arrange(items, 1);
        MessageActions.setHidden(MessageActions.SENT, "FORWARD", true);
        assertOrder(MessageActions.arrange(items, 1), reply, pin, copy);
        assertEquals("Still listed in settings", List.of("REPLY", "FORWARD", "PIN", "COPY"), MessageActions.shown(MessageActions.SENT));
        MessageActions.setHidden(MessageActions.SENT, "FORWARD", false);
        assertFalse(MessageActions.customized(MessageActions.SENT));
        assertSame(items, MessageActions.arrange(items, 1));
    }

    @Test public void moreAndItemsItCantReadAreNeverHiddenAndGoWithTheRest() {
        Action more = new Action(Kind.MORE, android.R.string.ok);
        NotAnAction unknown = new NotAnAction();
        List<Object> menu = List.of(reply, unknown, more, forward);
        MessageActions.arrange(menu, 1);
        assertEquals("Neither More nor what it can't read gets listed", List.of("REPLY", "FORWARD"), MessageActions.seen(MessageActions.SENT));
        MessageActions.move(MessageActions.SENT, "FORWARD", -1);
        MessageActions.setHidden(MessageActions.SENT, "MORE", true);
        assertOrder(MessageActions.arrange(menu, 1), forward, reply, unknown, more);
    }

    @Test public void aTitleIsOnlyTakenFromOneStringField() {
        TwoTitles two = new TwoTitles();
        MessageActions.arrange(List.of(two), 1);
        assertEquals(List.of("PIN"), MessageActions.seen(MessageActions.SENT));
        assertEquals("Pin", MessageActions.label("PIN"));
    }

    @Test public void aMenuItCantTellTheSideOfIsLeftAlone() {
        MessageActions.arrange(items, 1);
        MessageActions.move(MessageActions.SENT, "COPY", -1);
        assertSame(items, MessageActions.arrange(items, -1));
        List<Object> reordered = List.of(copy, pin);
        assertSame("The sheet can't know its side either", reordered, MessageActions.more(reordered, List.of(pin, copy)));
    }

    @Test public void theMoreSheetKeepsYourOrderForTheMenuItCameFrom() {
        MessageActions.arrange(items, 1);
        MessageActions.move(MessageActions.SENT, "COPY", -1);
        List<?> arranged = MessageActions.arrange(items, 1);
        assertOrder(arranged, reply, forward, copy, pin);
        List<Object> handed = List.of(copy, pin);
        List<Object> sorted = List.of(pin, copy);
        assertOrder(MessageActions.more(sorted, handed), copy, pin);
        assertSame("Already in your order", handed, MessageActions.more(handed, handed));

        List<Object> strangers = List.of(new Action(Kind.COPY, 0), new Action(Kind.PIN, 0));
        List<Object> sortedStrangers = List.of(strangers.get(1), strangers.get(0));
        assertSame("A sheet from another menu", sortedStrangers, MessageActions.more(sortedStrangers, strangers));

        MessageActions.arrange(items, 0);
        assertSame("Messages you got have no order of yours", sorted, MessageActions.more(sorted, handed));
    }

    @Test public void offPauseAndSafeModeHandTheListBackAndKeepYourOrder() {
        for (String state : new String[] {"off", "paused", "safe"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean(MessageActions.KEY, !state.equals("off"))
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe"))
                .putString("message_actions_order_sent", "PIN,REPLY").commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            MessageActions.resetForTests();
            assertSame(state, items, MessageActions.arrange(items, 1));
            List<Object> sorted = List.of(copy, pin);
            assertSame(state, sorted, MessageActions.more(sorted, List.of(pin, copy)));
            assertEquals(state, List.of("PIN", "REPLY"), MessageActions.order(MessageActions.SENT));
        }
        reset();
        Settings.preferences.edit().putString("message_actions_order_sent", "PIN,REPLY").commit();
        assertOrder(MessageActions.arrange(items, 1), pin, reply, forward, copy);
    }

    @Test public void resetGoesBackToMessengersOrderAndUndoBringsYoursBack() {
        MessageActions.arrange(items, 1);
        MessageActions.move(MessageActions.SENT, "COPY", -1);
        MessageActions.setHidden(MessageActions.SENT, "REPLY", true);
        String[] before = MessageActions.saved(MessageActions.SENT);
        MessageActions.reset(MessageActions.SENT);
        assertFalse(MessageActions.customized(MessageActions.SENT));
        assertEquals("The actions seen stay listed", List.of("REPLY", "FORWARD", "PIN", "COPY"), MessageActions.shown(MessageActions.SENT));
        assertSame(items, MessageActions.arrange(items, 1));
        MessageActions.restore(MessageActions.SENT, before);
        assertOrder(MessageActions.arrange(items, 1), forward, copy, pin);
    }

    @Test public void movesStopAtTheEnds() {
        MessageActions.arrange(items, 1);
        assertFalse(MessageActions.move(MessageActions.SENT, "REPLY", -1));
        assertFalse(MessageActions.move(MessageActions.SENT, "COPY", 1));
        assertFalse(MessageActions.move(MessageActions.SENT, "SAVE_VIDEO", 1));
        assertFalse(MessageActions.customized(MessageActions.SENT));
    }

    @Test public void aListThatBreaksIsHandedBackAsItWas() {
        List<Object> broken = new AbstractList<>() {
            @Override public Object get(int index) { throw new IllegalStateException("gone"); }
            @Override public int size() { return 2; }
        };
        assertSame(broken, MessageActions.arrange(broken, 1));
        List<Object> sorted = new ArrayList<>(items);
        MessageActions.arrange(items, 1);
        MessageActions.move(MessageActions.SENT, "COPY", -1);
        assertSame(sorted, MessageActions.more(sorted, broken));
        assertSame(Collections.emptyList(), MessageActions.arrange(Collections.emptyList(), 1));
        assertNull(MessageActions.arrange(null, 1));
    }

    @Test public void settingsListEachSidesActionsAndMoveHideAndResetThem() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNotNull(root.findViewWithTag("message_actions_empty_sent"));
            assertNotNull(root.findViewWithTag("message_actions_empty_got"));
        }
        MessageActions.arrange(items, 1);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertNull(root.findViewWithTag("message_actions_empty_sent"));
            assertNotNull("Messages you got are still waiting for a hold", root.findViewWithTag("message_actions_empty_got"));
            for (String name : Arrays.asList("REPLY", "FORWARD", "PIN", "COPY")) assertNotNull(name, root.findViewWithTag("message_actions_row_sent_" + name));
            assertFalse("The first can't go up", root.findViewWithTag("message_actions_up_sent_REPLY").isEnabled());
            assertFalse("The last can't go down", root.findViewWithTag("message_actions_down_sent_COPY").isEnabled());
            assertFalse("Nothing to reset yet", root.findViewWithTag("message_actions_reset_sent").isEnabled());

            root.findViewWithTag("message_actions_down_sent_REPLY").performClick();
            assertEquals(List.of("FORWARD", "REPLY", "PIN", "COPY"), MessageActions.shown(MessageActions.SENT));
            assertFalse(root.findViewWithTag("message_actions_up_sent_FORWARD").isEnabled());
            assertTrue(root.findViewWithTag("message_actions_reset_sent").isEnabled());

            root.findViewWithTag("message_actions_toggle_sent_PIN").performClick();
            assertTrue(MessageActions.hidden(MessageActions.SENT).contains("PIN"));
            View row = root.findViewWithTag("message_actions_row_sent_PIN");
            String label = MessageActions.label("PIN");
            assertEquals(label + " (hidden)", ((TextView) ((android.view.ViewGroup) row).getChildAt(0)).getText().toString());

            root.findViewWithTag("message_actions_reset_sent").performClick();
            assertFalse(MessageActions.customized(MessageActions.SENT));
            assertNotNull("The actions stay listed after a reset", root.findViewWithTag("message_actions_row_sent_PIN"));
        }
    }
}
