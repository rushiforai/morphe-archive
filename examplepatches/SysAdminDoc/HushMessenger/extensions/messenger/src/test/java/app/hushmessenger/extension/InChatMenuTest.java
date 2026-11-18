package app.hushmessenger.extension;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Build;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;
import static org.junit.Assume.assumeTrue;
import static org.robolectric.Shadows.shadowOf;

/**
 * The menu a long press on a message opens inside the chat on 587 (#162, #176). Laid out the way the S22 showed it:
 * the menu covers the chat's own frame, the emoji row sits just over the pressed message, and Reply, Copy, Delete and
 * More are a bar across the bottom. Messenger hands the menu over while Litho still has it empty.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "w360dp-h800dp-mdpi")
@LooperMode(LooperMode.Mode.PAUSED)
public class InChatMenuTest {
    private static final String[] LABELS = {"Reply", "Copy", "Delete", "More"};
    private final BiConsumer<View, Float> effect = MenuBlur.screenEffect;
    /** Every blur radius put on each view, 0 for a cleared one. */
    private final Map<View, List<Float>> effects = new HashMap<>();
    private Activity activity;
    private FrameLayout chat, menu, panel;
    private LinearLayout column, actions;
    private View message;

    @Before public void chat() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        Settings.hookErrors.clear();
        MenuBlur.resetForTests();
        FloatingMenu.resetForTests();
        ChatDialogs.blur = context -> false;
        MenuBlur.screenEffect = (view, radius) -> effects.computeIfAbsent(view, v -> new ArrayList<>()).add(radius);
        activity = Robolectric.buildActivity(Activity.class).setup().get();

        chat = new FrameLayout(activity);
        column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.addView(new View(activity), new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 200));
        // 587's bubbles take their long press through Litho, so they only say they take a tap.
        message = new View(activity);
        message.setClickable(true);
        column.addView(message, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60));
        View older = new View(activity);
        older.setClickable(true);
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60);
        gap.topMargin = 120;
        column.addView(older, gap);
        chat.addView(column, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        activity.setContentView(chat);
        idle();
    }

    @After public void restore() {
        MenuBlur.screenEffect = effect;
        MenuBlur.resetForTests();
        FloatingMenu.resetForTests();
        ChatDialogs.blur = ChatDialogs::defaultBlur;
        MaterialYouTheme.forgetDarkModeAnswer();
        Settings.hookErrors.clear();
        Settings.hookErrorLogged.clear();
    }

    /** A few frames. Robolectric draws nothing, so each one is a layout pass, which is what brings a pre-draw. */
    private void idle() {
        for (int i = 0; i < 6; i++) frame();
    }

    private void frame() {
        chat.requestLayout();
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(20));
    }

    /** The menu as ReactionsBarFragment's onViewCreated gets it: already in the chat, its bar not filled in yet. */
    private void open() {
        open(140);
    }

    /** The same, with the emoji row this far down the chat, ending 10 px over the pressed message. */
    private void open(int rowTop) {
        menu = new FrameLayout(activity);
        panel = new FrameLayout(activity);
        FrameLayout.LayoutParams row = new FrameLayout.LayoutParams(300, 50, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        row.topMargin = rowTop;
        menu.addView(panel, row);
        actions = new LinearLayout(activity);
        menu.addView(actions, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 60, Gravity.BOTTOM));
        chat.addView(menu, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        MenuBlur.inChat(menu);
    }

    /** Litho mounting the bar's buttons a frame or more later. */
    private void fillIn() {
        for (String label : LABELS) {
            Button action = new Button(activity);
            action.setText(label);
            action.setClickable(true);
            actions.addView(action, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.MATCH_PARENT, 1f));
        }
    }

    private void openFilledIn() {
        open();
        idle();
        fillIn();
        idle();
    }

    private InChatMenu.Lift lift() {
        for (int i = 0; i < chat.getChildCount(); i++) {
            if (chat.getChildAt(i) instanceof InChatMenu.Lift) return (InChatMenu.Lift) chat.getChildAt(i);
        }
        return null;
    }

    private LinearLayout card() {
        for (int i = 0; i < chat.getChildCount(); i++) {
            View child = chat.getChildAt(i);
            if (child instanceof LinearLayout && child != column) return (LinearLayout) child;
        }
        return null;
    }

    private void on(String... keys) {
        android.content.SharedPreferences.Editor edit = Settings.preferences.edit();
        for (String key : keys) edit.putBoolean(key, true);
        edit.commit();
    }

    @Test public void theChatBlursUnderAShadeWithThePressedMessageSharpOnIt() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY);

        openFilledIn();

        assertEquals(Arrays.asList(24f), effects.get(column));
        assertFalse("The menu itself stays sharp", effects.containsKey(menu));
        InChatMenu.Lift lift = lift();
        assertNotNull(lift);
        assertSame(message, lift.message);
        assertEquals(chat.indexOfChild(menu) - 1, chat.indexOfChild(lift));
        assertEquals(chat.getWidth(), lift.getWidth());
        assertEquals(chat.getHeight(), lift.getHeight());
        assertEquals("Without Floating message menu the bar stays", View.VISIBLE, actions.getVisibility());
        assertNull(card());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void nothingHappensUntilLithoHasFilledTheMenuIn() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY);

        open();
        idle();
        assertTrue(effects.isEmpty());
        assertNull(lift());

        fillIn();
        idle();
        assertEquals(Arrays.asList(24f), effects.get(column));
        assertNotNull(lift());
    }

    /** Dressed while the row is still on its way, the message 150 px over it would be too far off to be found. */
    @Test public void theMenuWaitsForTheEmojiRowToFinishSlidingIn() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY);

        open();
        fillIn();
        // Litho sliding the row up into place from 150 px under it, 10 px a frame.
        for (int left = 150; left > 0; left -= 10) {
            panel.setTranslationY(left);
            frame();
            assertNull("Nothing happens while the row moves", lift());
        }
        panel.setTranslationY(0f);
        idle();

        assertNotNull(lift());
        assertSame(message, lift().message);
    }

    @Test public void aMenuThatNeverFillsInIsLeftAsMessengerDrewIt() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY, FloatingMenu.KEY);

        open();
        for (long waited = 0; waited <= InChatMenu.WAIT_MS; waited += 20) frame();
        fillIn();
        idle();

        assertTrue(effects.isEmpty());
        assertNull(lift());
        assertNull(card());
        assertEquals(View.VISIBLE, actions.getVisibility());
    }

    @Test public void everythingComesOffWhenTheMenuGoes() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY, FloatingMenu.KEY);
        openFilledIn();
        InChatMenu.Lift lift = lift();
        LinearLayout card = card();
        assertNotNull(lift);
        assertNotNull(card);

        chat.removeView(menu);

        assertEquals(Arrays.asList(24f, 0f), effects.get(column));
        assertEquals(View.GONE, lift.getVisibility());
        assertEquals(View.GONE, card.getVisibility());
        idle();
        assertNull(lift.getParent());
        assertNull(card.getParent());
        assertEquals(1, chat.getChildCount());
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theActionsFloatUnderThePressedMessage() {
        on(MenuBlur.KEY, FloatingMenu.KEY);

        openFilledIn();

        LinearLayout card = card();
        assertNotNull(card);
        assertEquals(View.GONE, actions.getVisibility());
        assertEquals(LABELS.length, card.getChildCount());
        for (int i = 0; i < LABELS.length; i++) {
            assertEquals(LABELS[i], ((TextView) card.getChildAt(i)).getText().toString());
        }
        assertEquals("The card goes over the menu", chat.getChildCount() - 1, chat.indexOfChild(card));
        float density = activity.getResources().getDisplayMetrics().density;
        Rect pressed = FloatingMenu.on(message);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) card.getLayoutParams();
        assertEquals(pressed.bottom + (int) (FloatingMenu.GAP_DP * density) - FloatingMenu.on(chat).top, params.topMargin);
        // Window blur needs Android 12, so older phones get the card alone.
        boolean blurs = Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
        assertEquals(blurs, lift() != null);
        assertEquals(blurs, effects.containsKey(column));
    }

    /** Moves the pressed message down to the last line of the chat, 10 px off its bottom, and opens the menu on it. */
    private int openOnTheLastMessage() {
        int top = chat.getHeight() - 70;
        column.getChildAt(0).getLayoutParams().height = top;
        column.requestLayout();
        idle();
        open(top - 60);
        idle();
        fillIn();
        idle();
        return top;
    }

    @Test public void theLastMessageMovesUpWithItsEmojiRowToMakeRoomForTheCard() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY, FloatingMenu.KEY);

        int top = openOnTheLastMessage();

        float density = activity.getResources().getDisplayMetrics().density;
        int gap = (int) (FloatingMenu.GAP_DP * density), edge = (int) (FloatingMenu.EDGE_DP * density);
        int height = FloatingMenu.height(LABELS.length, density);
        // Under the message the card needs its height and the gap; the chat ends 10 px under the message, past the edge.
        int rise = top + 60 + gap + height - (chat.getHeight() - edge);
        assertTrue(rise > 0);
        assertEquals(-rise, panel.getTranslationY(), 0f);
        assertEquals(rise, lift().rise);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) card().getLayoutParams();
        assertEquals(top + 60 - rise + gap, params.topMargin);
        assertEquals(chat.getHeight() - edge, params.topMargin + params.height);
    }

    @Test public void theRaisedEmojiRowGoesStraightBackUpWhenMessengerMovesIt() {
        assumeTrue(Build.VERSION.SDK_INT >= Build.VERSION_CODES.S);
        on(MenuBlur.KEY, FloatingMenu.KEY);
        openOnTheLastMessage();
        float raisedTo = panel.getTranslationY();
        assertTrue(raisedTo < 0);

        panel.setTranslationY(0f);
        frame();
        assertEquals(raisedTo, panel.getTranslationY(), 0f);

        chat.removeView(menu);
        assertEquals("Put back where Messenger had it", 0f, panel.getTranslationY(), 0f);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void withNoCopyOfTheMessageToMoveTheCardGoesOverTheEmojiRow() {
        on(FloatingMenu.KEY);

        int top = openOnTheLastMessage();

        float density = activity.getResources().getDisplayMetrics().density;
        int gap = (int) (FloatingMenu.GAP_DP * density);
        int height = FloatingMenu.height(LABELS.length, density);
        assertEquals(0f, panel.getTranslationY(), 0f);
        assertNull(lift());
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) card().getLayoutParams();
        assertEquals(top - 60 - gap - height, params.topMargin);
    }

    @Test public void theCardFloatsWithBlurBehindMenusOff() {
        on(FloatingMenu.KEY);

        openFilledIn();

        assertNotNull(card());
        assertNull(lift());
        assertTrue(effects.isEmpty());
    }

    @Test public void withBothSwitchesOffTheMenuIsLeftAlone() {
        openFilledIn();

        assertTrue(effects.isEmpty());
        assertNull(lift());
        assertNull(card());
        assertEquals(2, chat.getChildCount());
        assertEquals(View.VISIBLE, actions.getVisibility());
    }

    @Test public void aMenuWithNoChatAroundItIsLeftToTheDialogHook() {
        on(MenuBlur.KEY, FloatingMenu.KEY);

        MenuBlur.inChat(null);
        MenuBlur.inChat(new FrameLayout(activity));
        LinearLayout wrapper = new LinearLayout(activity);
        FrameLayout inside = new FrameLayout(activity);
        wrapper.addView(inside);
        MenuBlur.inChat(inside);
        idle();

        assertTrue(effects.isEmpty());
        assertTrue(Settings.hookErrors.isEmpty());
    }
}
