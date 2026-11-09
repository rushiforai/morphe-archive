package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.time.Duration;
import java.util.ArrayList;
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
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class ChatPreviewSizeTest {
    private static final int CHAT_TOP = 30;
    private ActivityController<Activity> controller;
    private FrameLayout preview;
    private Chat chat;
    private ScrollView list;
    private View layer;
    private int clicks;
    private long downAt;

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
    }

    @After public void restore() {
        if (controller != null) controller.pause().stop().destroy();
        Settings.preferences.edit().clear().commit();
        Settings.hookErrors.clear();
    }

    private static void on(boolean bigger) {
        Settings.preferences.edit().putBoolean(ChatPreviewSize.KEY, bigger).commit();
    }

    /** Records what reaches the chat, the way Messenger's thread host passes touches on to its message list. */
    static final class Chat extends FrameLayout {
        final List<String> got = new ArrayList<>();

        Chat(Context context) {
            super(context);
        }

        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            got.add(MotionEvent.actionToString(event.getActionMasked()) + "@" + Math.round(event.getX()) + "," + Math.round(event.getY()));
            return super.dispatchTouchEvent(event);
        }
    }

    /**
     * The preview's chat area as onCreateView builds it: a FrameLayout holding the chat first and the tap layer over
     * it, the layer opening the chat on a click. The hook runs right after the layer is stored, as the patch puts it.
     */
    private void openPreview() {
        controller = Robolectric.buildActivity(Activity.class).setup();
        Activity activity = controller.get();
        preview = new FrameLayout(activity);
        chat = new Chat(activity);
        // A scrolling list of messages, standing in for the chat's message list.
        list = new ScrollView(activity);
        LinearLayout messages = new LinearLayout(activity);
        messages.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < 80; i++) {
            TextView message = new TextView(activity);
            message.setText("message " + i);
            messages.addView(message, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 40));
        }
        list.addView(messages, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        chat.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        FrameLayout.LayoutParams below = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        below.topMargin = CHAT_TOP;
        preview.addView(chat, below);
        layer = new View(activity);
        layer.setTag("InboxThreadPreviewDialogFragment.preview_tap");
        layer.setOnClickListener(v -> clicks++);
        preview.addView(layer, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        ChatPreviewSize.tapLayer(layer);
        activity.setContentView(preview);
        idle(50);
        assertTrue("the preview needs room to drag in", preview.getHeight() > 300);
    }

    private static void idle(long ms) {
        shadowOf(Looper.getMainLooper()).idleFor(Duration.ofMillis(ms));
    }

    private void send(int action, float x, float y) {
        long now = SystemClock.uptimeMillis();
        if (action == MotionEvent.ACTION_DOWN) downAt = now;
        MotionEvent event = MotionEvent.obtain(downAt, now, action, x, y, 0);
        preview.dispatchTouchEvent(event);
        event.recycle();
        idle(16);
    }

    private void drag(float x, float fromY, float toY) {
        send(MotionEvent.ACTION_DOWN, x, fromY);
        for (int step = 1; step <= 4; step++) send(MotionEvent.ACTION_MOVE, x, fromY + (toY - fromY) * step / 4);
        send(MotionEvent.ACTION_UP, x, toY);
        idle(500);
    }

    @Test public void sizesFollowTheSwitch() {
        on(false);
        assertEquals(374, ChatPreviewSize.height(374, 1000));
        assertEquals(160, ChatPreviewSize.least(160, 374));
        on(true);
        assertEquals(650, ChatPreviewSize.height(374, 1000));
        assertEquals("the chat never shrinks for a long menu", 650, ChatPreviewSize.least(160, 650));
        assertEquals("Messenger's own height stays when it's taller", 700, ChatPreviewSize.height(700, 1000));
        assertEquals("no cap leaves the height alone", 374, ChatPreviewSize.height(374, 0));
        assertTrue(Settings.lastActive(ChatPreviewSize.KEY) > 0);
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertEquals(374, ChatPreviewSize.height(374, 1000));
        assertEquals(160, ChatPreviewSize.least(160, 374));
    }

    @Test public void aTapStillOpensTheChat() {
        on(true);
        openPreview();
        send(MotionEvent.ACTION_DOWN, 50, 200);
        send(MotionEvent.ACTION_UP, 50, 200);
        idle(500);
        assertEquals(1, clicks);
        assertEquals("a tap never reaches the chat", List.of(), chat.got);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void aDragScrollsTheChatInsteadOfOpeningIt() {
        on(true);
        openPreview();
        drag(50, 300, 60);
        assertEquals("a drag doesn't open the chat", 0, clicks);
        assertTrue(chat.got.toString(), chat.got.size() >= 3);
        assertEquals("the press goes over first, moved into the chat's place", "ACTION_DOWN@50," + (300 - CHAT_TOP), chat.got.get(0));
        assertTrue(chat.got.toString(), chat.got.get(1).startsWith("ACTION_MOVE@50,"));
        assertEquals("ACTION_UP@50," + (60 - CHAT_TOP), chat.got.get(chat.got.size() - 1));
        assertTrue("the message list scrolled", list.getScrollY() > 0);
        assertTrue(Settings.hookErrors.isEmpty());

        // The next tap after a drag opens the chat as usual.
        chat.got.clear();
        send(MotionEvent.ACTION_DOWN, 50, 200);
        send(MotionEvent.ACTION_UP, 50, 200);
        idle(500);
        assertEquals(1, clicks);
        assertEquals(List.of(), chat.got);
    }

    @Test public void aDragFromOutsideTheChatStaysWithTheLayer() {
        on(true);
        openPreview();
        // Begins in the strip above the chat, so there's nothing under the press to hand it to.
        send(MotionEvent.ACTION_DOWN, 50, CHAT_TOP / 2f);
        send(MotionEvent.ACTION_MOVE, 50, CHAT_TOP / 2f + 60);
        send(MotionEvent.ACTION_UP, 50, CHAT_TOP / 2f + 60);
        idle(500);
        assertEquals(List.of(), chat.got);
        assertEquals(0, list.getScrollY());
    }

    @Test public void switchedOffTheLayerKeepsEveryTouch() {
        on(false);
        openPreview();
        drag(50, 300, 60);
        assertEquals(List.of(), chat.got);
        assertEquals(0, list.getScrollY());
        assertEquals(0, Settings.lastActive(ChatPreviewSize.KEY));
    }
}
