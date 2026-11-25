package app.hushmessenger.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowAlertDialog;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class ChatJumpTest {
    /** A chat as the pager sees it: one time per message, oldest first, a page loading each time it's pulled at the top. */
    static final class Chat implements ChatJump.Source {
        static final int SCREEN = 5;
        final long[] times;
        int first, top, olders, newers;
        boolean countless;
        long scrolledTo = -1;

        Chat(long... times) {
            this.times = times;
            first = Math.max(0, times.length - 10);
            top = Math.max(0, times.length - SCREEN);
        }

        @Override public int count() { return countless ? -1 : times.length - first; }
        @Override public boolean atStart() { return top == first; }
        @Override public boolean atEnd() { return top + SCREEN >= times.length; }

        @Override public void older() {
            olders++;
            if (top > first) top = Math.max(first, top - 15);
            else first = Math.max(0, first - 10);
        }

        @Override public void newer() {
            newers++;
            top = Math.min(Math.max(0, times.length - SCREEN), top + 2);
        }

        @Override public List<ChatJump.Row> rows() {
            List<ChatJump.Row> rows = new ArrayList<>();
            for (int i = top; i < Math.min(times.length, top + SCREEN); i++) rows.add(new ChatJump.Row((i - top) * 100, times[i]));
            return rows;
        }

        @Override public void scrollTo(ChatJump.Row row) {
            scrolledTo = row.time;
            top += row.top / 100;
        }
    }

    /** Three messages a day, at midnight, 3 AM and 6 AM, for [days] days from Jan 1 2025, skipping [missing]. */
    private static long[] days(int days, int... missing) {
        List<Long> times = new ArrayList<>();
        for (int day = 1; day <= days; day++) {
            final int today = day;
            if (Arrays.stream(missing).anyMatch(gap -> gap == today)) continue;
            for (int hour = 0; hour < 9; hour += 3) times.add(ChatJump.midnight(2025, 0, day) + hour * 3_600_000L);
        }
        return times.stream().mapToLong(Long::longValue).toArray();
    }

    private static ChatJump.Outcome run(ChatJump.Loader loader) {
        for (int look = 0; look < 1000; look++) {
            ChatJump.Outcome outcome = loader.tick();
            if (outcome != null) return outcome;
        }
        throw new AssertionError("The jump never ended");
    }

    @Test public void theFirstMessageWaitsUntilOlderMessagesStopComing() {
        Chat chat = new Chat(days(20));
        assertEquals(ChatJump.Outcome.START, run(new ChatJump.Loader(chat, 0)));
        assertEquals(0, chat.first);
        assertEquals(0, chat.top);
        // Pulled at the very top for every look it waited, since that's what makes Messenger load the next page.
        assertTrue(chat.olders > ChatJump.STALL_LOOKS);
        assertEquals(0, chat.newers);
        assertEquals(-1, chat.scrolledTo);

        Chat silent = new Chat(days(20));
        silent.countless = true;
        assertEquals(ChatJump.Outcome.START, run(new ChatJump.Loader(silent, 0)));
        assertEquals(0, silent.top);
    }

    @Test public void aDateLandsOnThatDaysFirstMessage() {
        long[] times = days(20);
        Chat chat = new Chat(times);
        assertEquals(ChatJump.Outcome.FOUND, run(new ChatJump.Loader(chat, ChatJump.midnight(2025, 0, 10))));
        assertEquals(times[27], chat.scrolledTo);
        assertTrue("it stopped paging once it was past the day", chat.first > 0);
    }

    @Test public void aDayWithNothingLandsOnTheNextMessage() {
        long[] times = days(20, 15);
        Chat chat = new Chat(times);
        assertEquals(ChatJump.Outcome.NEXT_DAY, run(new ChatJump.Loader(chat, ChatJump.midnight(2025, 0, 15))));
        assertEquals(ChatJump.midnight(2025, 0, 16), chat.scrolledTo);

        Chat older = new Chat(times);
        assertEquals(ChatJump.Outcome.NEXT_DAY, run(new ChatJump.Loader(older, ChatJump.midnight(2024, 11, 25))));
        assertEquals(times[0], older.scrolledTo);
        assertEquals(0, older.first);
    }

    @Test public void aDayAfterTheLastMessageSaysSo() {
        Chat chat = new Chat(days(20));
        assertEquals(ChatJump.Outcome.NOTHING_AFTER, run(new ChatJump.Loader(chat, ChatJump.midnight(2025, 1, 1))));
        assertEquals(-1, chat.scrolledTo);
        assertEquals(0, chat.olders);
    }

    @Test public void aChatWithNoReadableDatesStopsSoon() {
        Chat chat = new Chat(new long[40]);
        ChatJump.Loader loader = new ChatJump.Loader(chat, ChatJump.midnight(2025, 0, 10));
        assertEquals(ChatJump.Outcome.NO_DATES, run(loader));
        assertEquals(ChatJump.DATELESS_LOOKS - 1, chat.olders);
    }

    /** A message row the way a list keeps one: the row view holds its bound message. */
    static final class Bubble extends FrameLayout {
        Object message;
        View neighbor;

        Bubble(Context context, Object message) {
            super(context);
            this.message = message;
        }
    }

    static final class Message {
        final String text = "hi";
        final long sentAt;
        final Long seenAt;
        final long chatUpdatedAt;

        Message(long sentAt, Long seenAt, long chatUpdatedAt) {
            this.sentAt = sentAt;
            this.seenAt = seenAt;
            this.chatUpdatedAt = chatUpdatedAt;
        }
    }

    static final class Holder {
        final Object[] parts;

        Holder(Object... parts) {
            this.parts = parts;
        }
    }

    @Test public void eachRowGivesWhenItsMessageWasSent() {
        Context context = RuntimeEnvironment.getApplication();
        long now = ChatJump.midnight(2025, 5, 1);
        long updated = now - 3_600_000L;
        List<View> rows = new ArrayList<>();
        long[] sent = new long[5];
        for (int i = 0; i < 4; i++) {
            sent[i] = ChatJump.midnight(2025, 0, 10 + i);
            rows.add(new Bubble(context, new Message(sent[i], sent[i] + 60_000L, updated)));
        }
        // Behind the tag, a few objects down, as a recycled row keeps it.
        FrameLayout tagged = new FrameLayout(context);
        sent[4] = ChatJump.midnight(2025, 0, 20);
        tagged.setTag(new Holder("x", new Holder(new Message(sent[4], null, updated))));
        rows.add(tagged);

        long[] times = ChatJump.times(rows, now, new HashMap<>());
        // The chat's own time is on every row, so it's nobody's send time.
        assertArrayEquals(sent, times);
    }

    @Test public void aRowWithoutATimeOrWithOnlyOddOnesGivesNothing() {
        Context context = RuntimeEnvironment.getApplication();
        long now = ChatJump.midnight(2025, 5, 1);
        Bubble before = new Bubble(context, new Message(ChatJump.midnight(1999, 0, 1), null, 7));
        Bubble ahead = new Bubble(context, new Message(now + 2 * ChatJump.DAY, null, 0));
        Bubble divider = new Bubble(context, "Today");
        Bubble linked = new Bubble(context, null);
        // A row that points at another row never takes the other row's time.
        linked.neighbor = new Bubble(context, new Message(ChatJump.midnight(2025, 0, 5), null, 0));
        long[] times = ChatJump.times(Arrays.asList(before, ahead, divider, linked), now, new HashMap<>());
        assertArrayEquals(new long[4], times);
    }

    @Test public void theNearestTimeWins() {
        Context context = RuntimeEnvironment.getApplication();
        long now = ChatJump.midnight(2025, 5, 1);
        long sent = ChatJump.midnight(2025, 1, 3);
        Bubble row = new Bubble(context, new Message(sent, null, 0));
        // Deeper in, an older time from something else the row can reach.
        FrameLayout inner = new FrameLayout(context);
        inner.setTag(new Holder(new Holder(new Message(ChatJump.midnight(2024, 0, 1), null, 0))));
        row.addView(inner);
        assertEquals(sent, ChatJump.times(Arrays.asList(row), now, new HashMap<>())[0]);
    }

    /** Messenger's list as the window sees it: [older] pages above, a page more each time it's pulled. */
    public static final class Messages extends RecyclerView {
        int older = 3, newer, rows = 20, pulls, moved, total;

        public Messages(Context context) {
            super(context);
        }

        @Override public boolean canScrollVertically(int direction) {
            return direction < 0 ? older > 0 : newer > 0;
        }

        @Override public void scrollBy(int x, int y) {
            pulls++;
            moved = y;
            total += y;
            if (y < 0 && older > 0) {
                older--;
                rows += 20;
            }
        }

        @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setCollectionInfo(AccessibilityNodeInfo.CollectionInfo.obtain(rows, 1, false));
        }
    }

    private final List<ChatJump.Target> asked = new ArrayList<>();
    /** The day each ask for a date started on. */
    private final List<Long> opened = new ArrayList<>();
    private final ChatJump.Chooser shown = ChatJump.chooser;
    private final ChatJump.Picker picks = ChatJump.picker;
    private ActivityController<Activity> controller;
    private Activity activity;
    private FrameLayout chat;
    private Button back, name, message;
    private Messages list;
    private int taps, longPresses;

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        ChatJump.chooser = (where, target) -> asked.add(target);
        ChatJump.picker = (where, day, target) -> {
            opened.add(day);
            asked.add(target);
        };
    }

    @After public void restore() {
        ChatJump.chooser = shown;
        ChatJump.picker = picks;
        if (ChatJump.running != null) ChatJump.running.stop(ChatJump.Outcome.CANCELLED);
        if (controller != null) controller.pause().stop().destroy();
    }

    private static void on(boolean jump) {
        Settings.preferences.edit().putBoolean(ChatJump.KEY, jump).commit();
    }

    /** A chat screen like 585's: a top bar with back, the chat's name and details, then the message list. */
    private void openChat() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        chat = new FrameLayout(activity);
        chat.setClickable(true);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        LinearLayout bar = new LinearLayout(activity);
        back = button("Back", 60);
        name = button("Pat, Thread details", 150);
        name.setOnClickListener(tapped -> taps++);
        name.setOnLongClickListener(held -> ++longPresses > 0);
        bar.addView(back, new LinearLayout.LayoutParams(60, 60));
        bar.addView(name, new LinearLayout.LayoutParams(150, 60));
        bar.addView(button("Thread details", 60), new LinearLayout.LayoutParams(60, 60));
        column.addView(bar, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60));
        list = new Messages(activity);
        message = button("You sent a message", 200);
        list.addView(message, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60));
        column.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        chat.addView(column);
        activity.setContentView(chat);
        idle(0);
        ChatJump.chatShown(new Object(), chat);
        idle(0);
    }

    private Button button(String said, int width) {
        Button button = new Button(activity);
        button.setContentDescription(said);
        button.setMinWidth(0);
        button.setMinHeight(0);
        button.setMinimumWidth(0);
        button.setMinimumHeight(0);
        button.setPadding(0, 0, 0, 0);
        return button;
    }

    private static void idle(long millis) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(millis));
    }

    private boolean touch(int action, View on) {
        int[] at = new int[2];
        on.getLocationOnScreen(at);
        long time = SystemClock.uptimeMillis();
        MotionEvent event = MotionEvent.obtain(time, time, action, at[0] + on.getWidth() / 2f, at[1] + on.getHeight() / 2f, 0);
        try {
            return activity.getWindow().getCallback().dispatchTouchEvent(event);
        } finally {
            event.recycle();
        }
    }

    private void hold(View on) {
        touch(MotionEvent.ACTION_DOWN, on);
        idle(android.view.ViewConfiguration.getLongPressTimeout() + 100);
        touch(MotionEvent.ACTION_UP, on);
        idle(100);
    }

    @Test public void aLongPressOnTheChatsNameAsksAndMessengerSeesATapThatNeverHappened() {
        on(true);
        openChat();
        Window.Callback callback = activity.getWindow().getCallback();
        assertNotNull(ChatJump.watching(callback));
        assertSame(activity, ChatJump.watching(callback).original);
        hold(name);
        assertEquals(1, asked.size());
        assertEquals(0, taps);
        assertEquals(0, longPresses);
        // Opening the chat again doesn't stack a second watcher.
        ChatJump.chatShown(new Object(), chat);
        assertSame(callback, activity.getWindow().getCallback());
        assertTrue(Settings.lastActive(ChatJump.KEY) > 0);
    }

    @Test public void aTapAndOtherLongPressesStayMessengers() {
        on(true);
        openChat();
        touch(MotionEvent.ACTION_DOWN, name);
        idle(100);
        touch(MotionEvent.ACTION_UP, name);
        idle(android.view.ViewConfiguration.getLongPressTimeout() + 100);
        assertEquals(1, taps);
        hold(back);
        // A message near the top of the chat keeps Messenger's own long press.
        hold(message);
        assertTrue(asked.isEmpty());
    }

    private void tap(View on) {
        touch(MotionEvent.ACTION_DOWN, on);
        idle(50);
        touch(MotionEvent.ACTION_UP, on);
        idle(0);
    }

    /**
     * A date row the way the list keeps one: nothing in it answers a tap, and the day it names sits behind it. A list
     * with no layout manager lays none of its rows out, so the row is given its place by hand.
     */
    private View dateRow(long when, int top, int height) {
        Bubble row = new Bubble(activity, when);
        list.addView(row, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        idle(0);
        row.layout(0, top, list.getWidth(), top + height);
        return row;
    }

    /** #177: tapping one of the dates between the messages opens the day picker on that day. */
    @Test public void aTapOnADateBetweenTheMessagesAsksFromThatDay() {
        on(true);
        openChat();
        long when = ChatJump.midnight(2025, 2, 14) + 9 * 3_600_000L;
        View date = dateRow(when, 80, 40);
        assertEquals(when, ChatJump.dateAt(chat, screenX(date), screenY(date)));
        tap(date);
        assertEquals(List.of(when), opened);
        assertEquals(1, asked.size());
        // The day left on the picker pages the chat back, the same as the menu's own Jump to a date.
        asked.get(0).jump(ChatJump.midnight(2025, 2, 14));
        assertNotNull(ChatJump.running);
        assertEquals(0, taps);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** A message, and a row with no date behind it, stay Messenger's. */
    @Test public void aTapOnAMessageOrARowWithoutADateAsksNothing() {
        on(true);
        openChat();
        // Messenger's own message row answers taps, so whatever time it keeps is never read off it.
        message.layout(0, 0, list.getWidth(), 60);
        tap(message);
        View plain = new View(activity);
        list.addView(plain, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 40));
        idle(0);
        plain.layout(0, 200, list.getWidth(), 240);
        tap(plain);
        // A date in a chat that's off keeps the tap as well.
        on(false);
        tap(dateRow(ChatJump.midnight(2025, 2, 14), 300, 40));
        assertTrue(opened.isEmpty());
        assertTrue(asked.isEmpty());
        assertNull(ChatJump.running);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    private static int screenX(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return at[0] + view.getWidth() / 2;
    }

    private static int screenY(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return at[1] + view.getHeight() / 2;
    }

    /** The picker opens on the day it's given, on today without one, and never past today. */
    @Test public void theDayPickerOpensOnTheDayItWasGiven() {
        on(true);
        openChat();
        List<Long> jumped = new ArrayList<>();
        ChatJump.pickDay(activity, ChatJump.midnight(2025, 2, 14) + 3_600_000L, jumped::add);
        DatePickerDialog tapped = (DatePickerDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertEquals(2025, tapped.getDatePicker().getYear());
        assertEquals(2, tapped.getDatePicker().getMonth());
        assertEquals(14, tapped.getDatePicker().getDayOfMonth());
        tapped.dismiss();
        Calendar today = Calendar.getInstance();
        for (long day : new long[] {0, today.getTimeInMillis() + 30 * ChatJump.DAY}) {
            ChatJump.pickDay(activity, day, jumped::add);
            DatePickerDialog open = (DatePickerDialog) org.robolectric.shadows.ShadowDialog.getLatestDialog();
            assertEquals(today.get(Calendar.YEAR), open.getDatePicker().getYear());
            assertEquals(today.get(Calendar.DAY_OF_MONTH), open.getDatePicker().getDayOfMonth());
            open.dismiss();
        }
        assertTrue(jumped.isEmpty());
    }

    @Test public void offTheChatIsLeftAlone() {
        on(false);
        openChat();
        assertSame(activity, activity.getWindow().getCallback());
        on(true);
        ChatJump.chatShown(new Object(), chat);
        on(false);
        hold(name);
        assertTrue(asked.isEmpty());
        assertEquals(1, longPresses);
    }

    @Test public void theFirstMessageScrollsBackWithACountUntilTheStart() {
        on(true);
        openChat();
        ChatJump.chooser = shown;
        hold(name);
        AlertDialog menu = ShadowAlertDialog.getLatestAlertDialog();
        assertNotNull(menu);
        assertEquals(2, menu.getListView().getAdapter().getCount());
        shadowOf(menu).clickOnItem(0);
        ChatJump.Jump jump = ChatJump.running;
        assertNotNull(jump);
        assertNotNull(jump.bar.bar);
        assertSame(activity.findViewById(android.R.id.content), jump.bar.bar.getParent());
        idle(3 * ChatJump.TICK_MS);
        assertTrue(jump.bar.status.getText().toString().startsWith("Loading older messages"));
        idle(30 * ChatJump.TICK_MS);
        assertTrue(jump.done());
        assertNull(ChatJump.running);
        assertNull(jump.bar.bar);
        assertEquals(0, list.older);
        assertEquals(80, jump.loader.count());
        assertEquals("This is the start of the chat", ShadowToast.getTextOfLatestToast());
    }

    @Test public void theBarHasAnEdgeTakesTapsBesideCancelAndIsNamedForTalkBack() {
        on(true);
        openChat();
        ChatJump.chooser = shown;
        hold(name);
        shadowOf(ShadowAlertDialog.getLatestAlertDialog()).clickOnItem(0);
        ChatJump.Bar bar = ChatJump.running.bar;
        assertTrue(bar.bar.getBackground() instanceof android.graphics.drawable.LayerDrawable);
        assertTrue(bar.bar.getAccessibilityPaneTitle().toString().startsWith("Loading older messages"));
        // Not a button to TalkBack, but a touch on the count never reaches the chat box under the bar.
        assertFalse(bar.bar.isClickable());
        MotionEvent down = MotionEvent.obtain(0, 0, MotionEvent.ACTION_DOWN, 4, 4, 0);
        assertTrue(bar.bar.dispatchTouchEvent(down));
        down.recycle();
        assertSame(bar, ChatJump.running.bar);
        bar.cancel.performClick();
        assertNull(ChatJump.running);
        assertNull(bar.bar);
    }

    /**
     * #172: a chat head has no activity for a dialog to hang a window on, so Jump to a date's menu and its date
     * picker went up as nothing there. They go up over other apps instead, the way the chat head itself does.
     */
    @Test public void aDialogOverAChatHeadGoesUpInAWindowOfItsOwn() {
        Context head = RuntimeEnvironment.getApplication();
        assertNull(ChatJump.activity(head));
        AlertDialog overChatHead = new AlertDialog.Builder(head, MaterialYouTheme.chatDialogTheme())
            .setTitle("Jump to").create();
        ChatJump.showOverChat(overChatHead, head);
        assertTrue(overChatHead.isShowing());
        assertEquals(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, overChatHead.getWindow().getAttributes().type);
        overChatHead.dismiss();
        // In a chat it stays an ordinary dialog on the chat's own window.
        openChat();
        AlertDialog overChat = new AlertDialog.Builder(activity, MaterialYouTheme.chatDialogTheme())
            .setTitle("Jump to").create();
        ChatJump.showOverChat(overChat, activity);
        assertTrue(overChat.isShowing());
        assertEquals(WindowManager.LayoutParams.TYPE_APPLICATION, overChat.getWindow().getAttributes().type);
    }

    /** Whether the menu's title is drawn in a dark color, as it is on a light sheet. */
    private static boolean darkTitle(AlertDialog menu) {
        int id = menu.getContext().getResources().getIdentifier("alertTitle", "id", "android");
        int color = ((android.widget.TextView) menu.findViewById(id)).getCurrentTextColor();
        return android.graphics.Color.red(color) + android.graphics.Color.green(color) + android.graphics.Color.blue(color) < 384;
    }

    @Test public void theMenuIsLightOrDarkWithTheChat() {
        on(true);
        openChat();
        ChatJump.chooser = shown;
        MaterialYouTheme.darkModeAnswer(false);
        hold(name);
        AlertDialog light = ShadowAlertDialog.getLatestAlertDialog();
        assertTrue("a light chat gets a light menu", darkTitle(light));
        light.dismiss();
        MaterialYouTheme.darkModeAnswer(true);
        hold(name);
        AlertDialog dark = ShadowAlertDialog.getLatestAlertDialog();
        assertNotSame(light, dark);
        assertFalse("a dark chat gets a dark menu", darkTitle(dark));
    }

    private ViewGroup content() {
        return activity.findViewById(android.R.id.content);
    }

    private ImageView arrow() {
        ChatJump.Arrow on = ChatJump.arrowOn(chat);
        assertNotNull("no arrow on the chat", on);
        return on.button;
    }

    /** The list moved up off the newest messages, as the window's own observer reports it. */
    private void scrolledUp() {
        list.newer = 1;
        ChatJump.arrowOn(chat).onScrollChanged();
    }

    /** #177: at the newest messages the arrow only covers the chat, so it waits for a scroll up. */
    @Test public void theArrowWaitsUntilYouveScrolledUp() {
        on(true);
        openChat();
        assertEquals(View.GONE, arrow().getVisibility());
        scrolledUp();
        assertEquals(View.VISIBLE, arrow().getVisibility());
        list.newer = 0;
        ChatJump.arrowOn(chat).onScrollChanged();
        assertEquals(View.GONE, arrow().getVisibility());
    }

    /** #177: the long press on the chat's name is easy to miss, so the arrow makes the same jump with one tap. */
    @Test public void theArrowGoesToTheFirstMessage() {
        on(true);
        openChat();
        list.older = 1000;
        scrolledUp();
        ImageView arrow = arrow();
        assertSame(content(), arrow.getParent());
        assertEquals(View.VISIBLE, arrow.getVisibility());
        arrow.performClick();
        assertNotNull(ChatJump.running);
        idle(3 * ChatJump.TICK_MS);
        assertTrue(list.pulls > 0);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aLongPressOnTheArrowAsksWhereToGo() {
        on(true);
        openChat();
        assertTrue(arrow().performLongClick());
        assertEquals(1, asked.size());
        assertNull(ChatJump.running);
        asked.get(0).jump(0);
        assertNotNull(ChatJump.running);
    }

    @Test public void theArrowStaysOffWithNothingOlderToGoTo() {
        on(true);
        openChat();
        scrolledUp();
        assertEquals(View.VISIBLE, arrow().getVisibility());
        list.older = 0;
        // What the window's own observer calls as the list scrolls.
        ChatJump.arrowOn(chat).onScrollChanged();
        assertEquals(View.GONE, arrow().getVisibility());
    }

    @Test public void theArrowStandsDownWhileTheCountBarIsUp() {
        on(true);
        openChat();
        list.older = 1000;
        scrolledUp();
        arrow().performClick();
        assertNotNull(ChatJump.running);
        assertEquals(View.GONE, arrow().getVisibility());
        ChatJump.running.bar.cancel.performClick();
        assertNull(ChatJump.running);
        assertEquals(View.VISIBLE, arrow().getVisibility());
    }

    /** It sits above the chat's own views, so it would stay sharp on top of the blur behind a message's menu. */
    @Test public void theArrowStandsDownWhileAMessagesMenuIsUp() {
        on(true);
        openChat();
        list.older = 1000;
        scrolledUp();
        ImageView arrow = arrow();
        assertEquals(View.VISIBLE, arrow.getVisibility());

        InChatMenu.up.add(content());
        ChatJump.arrowOn(chat).update();
        assertEquals(View.GONE, arrow.getVisibility());

        InChatMenu.up.remove(content());
        ChatJump.arrowOn(chat).update();
        assertEquals(View.VISIBLE, arrow.getVisibility());
    }

    private ChatJump.Arrow arrowWithPages() {
        on(true);
        Settings.preferences.edit().putBoolean(ChatJump.PAGES, true).commit();
        openChat();
        ChatJump.Arrow arrow = ChatJump.arrowOn(chat);
        assertNotNull("no arrow on the chat", arrow);
        return arrow;
    }

    /** #207: with their switch on, page buttons sit over the arrow, each up while its way has more to show. */
    @Test public void thePageButtonsShowWhereThereIsMoreToRead() {
        ChatJump.Arrow arrow = arrowWithPages();
        assertSame(content(), arrow.pageUp.getParent());
        assertSame(content(), arrow.pageDown.getParent());
        assertEquals("Page up", arrow.pageUp.getContentDescription());
        assertEquals("Page down", arrow.pageDown.getContentDescription());
        assertTrue(((ChatJump.Chevron) arrow.pageUp.getDrawable()).up);
        assertFalse(((ChatJump.Chevron) arrow.pageDown.getDrawable()).up);
        // At the newest message there's older to go back to and nothing newer.
        assertEquals(View.VISIBLE, arrow.pageUp.getVisibility());
        assertEquals(View.GONE, arrow.pageDown.getVisibility());
        assertEquals(View.GONE, arrow.button.getVisibility());
        scrolledUp();
        assertEquals(View.VISIBLE, arrow.pageDown.getVisibility());
        int first = ((FrameLayout.LayoutParams) arrow.button.getLayoutParams()).bottomMargin;
        int down = ((FrameLayout.LayoutParams) arrow.pageDown.getLayoutParams()).bottomMargin;
        int up = ((FrameLayout.LayoutParams) arrow.pageUp.getLayoutParams()).bottomMargin;
        assertTrue("stacked over the arrow, page up on top", first < down && down < up);
        list.older = 0;
        arrow.onScrollChanged();
        assertEquals(View.GONE, arrow.pageUp.getVisibility());
    }

    /** #207: a page moves most of a screen in one short slide, so the last lines read stay in sight. */
    @Test public void aPageButtonMovesTheChatMostOfAScreen() {
        ChatJump.Arrow arrow = arrowWithPages();
        list.older = 1000;
        scrolledUp();
        int page = Math.round(list.getHeight() * ChatJump.PAGE_SHARE);
        assertTrue(page > 1);
        arrow.pageDown.performClick();
        idle(2 * ChatJump.PAGE_MS);
        assertEquals(page, list.total);
        assertTrue("a slide, not one jump", list.pulls > 2);
        list.total = 0;
        arrow.pageUp.performClick();
        idle(2 * ChatJump.PAGE_MS);
        assertEquals(-page, list.total);
        assertNull("a page isn't a jump", ChatJump.running);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void noPageButtonsWithTheirSwitchOff() {
        on(true);
        openChat();
        assertNull(ChatJump.arrowOn(chat).pageUp);
        assertNull(ChatJump.arrowOn(chat).pageDown);
        assertEquals(2, content().getChildCount());
        assertEquals(ChatJump.KEY, Settings.SUB_SWITCHES.get(ChatJump.PAGES));
    }

    @Test public void thePageSwitchAloneAddsNothing() {
        Settings.preferences.edit().putBoolean(ChatJump.PAGES, true).commit();
        on(false);
        openChat();
        assertNull(ChatJump.arrowOn(chat));
        assertEquals(1, content().getChildCount());
    }

    @Test public void noArrowGoesUpWithTheSwitchOff() {
        on(false);
        openChat();
        assertNull(ChatJump.arrowOn(chat));
        assertEquals(1, content().getChildCount());
    }

    /** The arrow floats over the messages, where a tap used to open the day picker off the same touch. */
    @Test public void aTapOnTheArrowIsNotATapOnADateUnderIt() {
        on(true);
        openChat();
        long when = ChatJump.midnight(2025, 2, 14) + 9 * 3_600_000L;
        View date = dateRow(when, 80, 120);
        scrolledUp();
        ImageView arrow = arrow();
        int[] row = new int[2], host = new int[2];
        date.getLocationOnScreen(row);
        content().getLocationOnScreen(host);
        int x = row[0] - host[0] + date.getWidth() / 2, y = row[1] - host[1] + date.getHeight() / 2;
        arrow.layout(x - 20, y - 20, x + 20, y + 20);
        assertEquals(0, ChatJump.dateAt(chat, screenX(arrow), screenY(arrow)));
        // With the arrow down, the row under it is a date again, so the arrow is what held that touch back.
        arrow.setVisibility(View.GONE);
        assertEquals(when, ChatJump.dateAt(chat, screenX(arrow), screenY(arrow)));
    }

    @Test public void cancelStopsTheJumpWhereItIs() {
        on(true);
        openChat();
        list.older = 1000;
        hold(name);
        asked.get(0).jump(0);
        ChatJump.Jump jump = ChatJump.running;
        idle(3 * ChatJump.TICK_MS);
        int pulls = list.pulls;
        assertTrue(pulls > 0);
        jump.bar.cancel.performClick();
        idle(10 * ChatJump.TICK_MS);
        assertTrue(jump.done());
        assertEquals(pulls, list.pulls);
        // The chat and the arrow stay, the bar goes.
        assertEquals(2, content().getChildCount());
        assertSame(chat, content().getChildAt(0));
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void leavingTheChatStopsTheJump() {
        on(true);
        openChat();
        list.older = 1000;
        hold(name);
        asked.get(0).jump(ChatJump.midnight(2025, 0, 1));
        ChatJump.Jump jump = ChatJump.running;
        idle(2 * ChatJump.TICK_MS);
        ((ViewGroup) chat.getParent()).removeView(chat);
        idle(2 * ChatJump.TICK_MS);
        assertTrue(jump.done());
        assertNull(ChatJump.running);
    }

    @Test public void aBarThatCantShowLeavesNothingRunningAndTheNextJumpWorks() {
        on(true);
        openChat();
        list.older = 1000;
        hold(name);
        // The bar reads the Light theme switch, so with no preferences its show() throws.
        android.content.SharedPreferences prefs = Settings.preferences;
        Settings.preferences = null;
        try {
            asked.get(0).jump(0);
            fail("the bar showed without preferences");
        } catch (NullPointerException expected) {
        } finally {
            Settings.preferences = prefs;
        }
        assertNull(ChatJump.running);
        assertEquals(2, content().getChildCount());
        assertSame(chat, content().getChildAt(0));
        asked.get(0).jump(0);
        assertNotNull(ChatJump.running);
        assertNotNull(ChatJump.running.bar.bar);
    }

    @Test public void theDaysFirstMessageLandsBelowCardsLaidOverTheChat() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        FrameLayout screen = new FrameLayout(activity);
        list = new Messages(activity);
        screen.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 400));
        // Like 585's "A reminder about deleted messages", with a second card stacked right under it.
        View reminder = new View(activity);
        screen.addView(reminder, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 100));
        View pinned = new View(activity);
        FrameLayout.LayoutParams under = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 40);
        under.topMargin = 100;
        screen.addView(pinned, under);
        // A full-size layer counts only through what's in it, and the jump's own bar sits at the bottom of one.
        FrameLayout layer = new FrameLayout(activity);
        screen.addView(layer, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 400));
        activity.setContentView(screen);
        idle(0);
        ChatJump.ListSource source = new ChatJump.ListSource(list);
        source.scrollTo(new ChatJump.Row(250, 1));
        assertEquals(110, list.moved);
        pinned.setVisibility(View.GONE);
        source.scrollTo(new ChatJump.Row(250, 1));
        assertEquals(150, list.moved);
        reminder.setVisibility(View.GONE);
        source.scrollTo(new ChatJump.Row(250, 1));
        assertEquals(250, list.moved);
    }

    @Test public void aCardAddedBeforeTheListCountsOnlyWhenItsRaisedOverIt() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        activity = controller.get();
        FrameLayout screen = new FrameLayout(activity);
        // 585's real layout: the reminder card comes first, the list's frame second, and elevation puts the card on top.
        View reminder = new View(activity);
        screen.addView(reminder, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 100));
        FrameLayout frame = new FrameLayout(activity);
        list = new Messages(activity);
        frame.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 400));
        screen.addView(frame, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 400));
        activity.setContentView(screen);
        idle(0);
        ChatJump.ListSource source = new ChatJump.ListSource(list);
        source.scrollTo(new ChatJump.Row(250, 1));
        assertEquals(250, list.moved);
        reminder.setElevation(4);
        source.scrollTo(new ChatJump.Row(250, 1));
        assertEquals(150, list.moved);
    }
}
