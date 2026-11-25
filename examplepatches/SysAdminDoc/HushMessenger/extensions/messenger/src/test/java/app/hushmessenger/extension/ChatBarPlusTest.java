package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import androidx.recyclerview.widget.RecyclerView;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

/** The chat bar the way Messenger builds it, and a + menu shaped like the one it opens (#198). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class ChatBarPlusTest {
    private static final int ROW = 68;
    private static final int MENU_HEIGHT = 204;
    private static final int MENU_Y = 100;

    /** Named as Messenger names it, which is what the bar is found by. */
    public static class ComposerBarLeftPrimaryButtonsView extends LinearLayout {
        public ComposerBarLeftPrimaryButtonsView(Context context) {
            super(context);
        }
    }

    public static class ComposerActionButton extends ImageView {
        int taps;

        public ComposerActionButton(Context context, String name) {
            super(context);
            setContentDescription(name);
            setOnClickListener(view -> taps++);
        }
    }

    private Activity activity;
    private FrameLayout chat;
    private LinearLayout bar;
    private ComposerActionButton plus;
    private ComposerActionButton camera;
    private ComposerActionButton gallery;
    private ComposerActionButton mic;
    private LinearLayout card;
    private FrameLayout holder;

    @Before public void openChat() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().putBoolean(ChatBarPlus.KEY, true).commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        activity = Robolectric.buildActivity(Activity.class).setup().get();
        chat = new FrameLayout(activity);
        bar = new ComposerBarLeftPrimaryButtonsView(activity);
        FrameLayout frame = new FrameLayout(activity);
        plus = button("Show more options.");
        frame.addView(plus, new FrameLayout.LayoutParams(56, 56));
        bar.addView(frame);
        camera = button("Open camera.");
        gallery = button("Open photo gallery.");
        mic = button("Open audio recorder.");
        for (View view : new View[] {camera, gallery, mic}) bar.addView(view, new LinearLayout.LayoutParams(56, 56));
        chat.addView(bar, new FrameLayout.LayoutParams(300, 56));
        activity.setContentView(chat);
        idle();
    }

    /** Everything in the feature reports failures quietly, so a test that passed must have had none. */
    @After public void nothingFailedQuietly() {
        assertTrue(Settings.hookErrors.toString(), Settings.hookErrors.isEmpty());
    }

    private ComposerActionButton button(String name) {
        return new ComposerActionButton(activity, name);
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    /** Opens a menu like Messenger's and puts the chat bar right under it. */
    private PopupWindow openMenu() {
        card = new LinearLayout(activity);
        holder = new FrameLayout(activity);
        RecyclerView list = new RecyclerView(activity);
        for (int i = 0; i < 3; i++) list.addView(new View(activity), new ViewGroup.LayoutParams(-1, ROW));
        holder.addView(list, new FrameLayout.LayoutParams(-1, -1));
        card.addView(holder, new LinearLayout.LayoutParams(-1, -1));
        PopupWindow popup = new PopupWindow(card, 240, MENU_HEIGHT, true);
        popup.showAtLocation(chat, Gravity.TOP | Gravity.START, 10, MENU_Y);
        idle();
        View window = card.getRootView();
        window.measure(View.MeasureSpec.makeMeasureSpec(240, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(MENU_HEIGHT, View.MeasureSpec.EXACTLY));
        window.layout(0, 0, 240, MENU_HEIGHT);
        moveBarUnder(window, 0);
        return popup;
    }

    private void moveBarUnder(View window, int gap) {
        int[] menuAt = new int[2];
        int[] barAt = new int[2];
        window.getLocationOnScreen(menuAt);
        bar.getLocationOnScreen(barAt);
        bar.offsetTopAndBottom(menuAt[1] + window.getHeight() + gap - barAt[1]);
    }

    private ViewGroup rows() {
        return card.findViewWithTag(ChatBarPlus.ROWS);
    }

    private WindowManager.LayoutParams windowParams() {
        return (WindowManager.LayoutParams) card.getRootView().getLayoutParams();
    }

    @Test public void theCameraGalleryAndMicLeaveTheBarAndPlusStays() {
        ChatBarPlus.chatShown(new Object(), chat);
        assertEquals(View.GONE, camera.getVisibility());
        assertEquals(View.GONE, gallery.getVisibility());
        assertEquals(View.GONE, mic.getVisibility());
        assertEquals(View.VISIBLE, plus.getVisibility());
    }

    @Test public void aButtonMessengerShowsAgainLeavesAgainWithoutASecondRow() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        camera.setVisibility(View.VISIBLE);
        open.look();
        assertEquals(View.GONE, camera.getVisibility());
        openMenu();
        open.findMenu();
        assertEquals(3, rows().getChildCount());
    }

    @Test public void aButtonWithNoNameStaysWhereItCanBeReached() {
        camera.setContentDescription(null);
        ChatBarPlus.watch(chat);
        assertEquals(View.VISIBLE, camera.getVisibility());
        assertEquals(View.GONE, gallery.getVisibility());
    }

    @Test public void turningItOffBringsTheButtonsBack() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        Settings.preferences.edit().putBoolean(ChatBarPlus.KEY, false).commit();
        open.look();
        assertEquals(View.VISIBLE, camera.getVisibility());
        assertEquals(View.VISIBLE, gallery.getVisibility());
        assertEquals(View.VISIBLE, mic.getVisibility());
    }

    @Test public void aButtonMessengerHidItselfStaysHiddenAndGetsNoRow() {
        mic.setVisibility(View.GONE);
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        openMenu();
        open.findMenu();
        assertEquals(2, rows().getChildCount());
        Settings.preferences.edit().putBoolean(ChatBarPlus.KEY, false).commit();
        open.look();
        assertEquals(View.GONE, mic.getVisibility());
        assertEquals(View.VISIBLE, camera.getVisibility());
    }

    @Test public void aBarWithoutPlusKeepsItsButtons() {
        ((ViewGroup) plus.getParent()).removeView(plus);
        ChatBarPlus.watch(chat);
        assertEquals(View.VISIBLE, camera.getVisibility());
        assertEquals(View.VISIBLE, gallery.getVisibility());
        assertEquals(View.VISIBLE, mic.getVisibility());
    }

    @Test public void theMenuGetsARowForEachButtonAndGrowsUpward() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        openMenu();
        Drawable look = new ColorDrawable(0xFF242526);
        holder.setBackground(look);
        open.findMenu();
        ViewGroup rows = rows();
        assertEquals(3, rows.getChildCount());
        assertEquals("Open camera", rows.getChildAt(0).getContentDescription());
        assertEquals("Open photo gallery", rows.getChildAt(1).getContentDescription());
        assertEquals("Open audio recorder", rows.getChildAt(2).getContentDescription());
        assertEquals("The rows match Messenger's", ROW, rows.getChildAt(0).getLayoutParams().height);
        assertSame("The rows sit under Messenger's list", rows, card.getChildAt(card.getChildCount() - 1));
        assertEquals("Messenger's part keeps its size", MENU_HEIGHT, holder.getLayoutParams().height);
        assertEquals("Taller by the rows", MENU_HEIGHT + 3 * ROW, windowParams().height);
        assertEquals("The bottom edge stays on the bar", MENU_Y - 3 * ROW, windowParams().y);
        assertSame("The card's look runs behind the rows", look, card.getBackground());
        assertNull(holder.getBackground());
    }

    @Test public void tappingARowClosesTheMenuAndPressesTheRealButton() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        PopupWindow popup = openMenu();
        open.findMenu();
        rows().getChildAt(1).performClick();
        idle();
        assertFalse(popup.isShowing());
        assertEquals(1, gallery.taps);
        assertEquals(0, camera.taps);
        assertEquals(0, mic.taps);
    }

    @Test public void aWindowAwayFromTheBarIsLeftAlone() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        openMenu();
        moveBarUnder(card.getRootView(), 200);
        open.findMenu();
        assertNull(rows());
        assertEquals(MENU_HEIGHT, windowParams().height);
        assertEquals(MENU_Y, windowParams().y);
    }

    @Test public void lookingAgainAtTheSameOpenMenuChangesNothing() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        openMenu();
        open.findMenu();
        open.findMenu();
        assertEquals(3, rows().getChildCount());
        assertEquals(MENU_HEIGHT + 3 * ROW, windowParams().height);
        assertEquals(MENU_Y - 3 * ROW, windowParams().y);
    }

    @Test public void withTheSwitchOffTheMenuStaysAsItWas() {
        ChatBarPlus.Chat open = ChatBarPlus.watch(chat);
        Settings.preferences.edit().putBoolean(ChatBarPlus.KEY, false).commit();
        openMenu();
        open.findMenu();
        assertNull(rows());
    }

    @Config(sdk = 28)
    @Test public void beforeAndroidTenNothingLeavesTheBar() {
        assertNull(ChatBarPlus.watch(chat));
        assertEquals(View.VISIBLE, camera.getVisibility());
    }
}
