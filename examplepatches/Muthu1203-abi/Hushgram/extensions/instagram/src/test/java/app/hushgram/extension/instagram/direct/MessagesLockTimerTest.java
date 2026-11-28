/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.direct;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.util.ReflectionHelpers;

import java.util.HashMap;
import java.util.Map;

import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/**
 * Lock your messages looks at the screen before each frame. With nothing locked it walks the window
 * only while there's an open chat's name to learn, never on a screen without one, and its frame
 * listener goes when its screen does (#129).
 */
@RunWith(RobolectricTestRunner.class)
// A phone-sized window, so the chat below the inbox is on screen rather than past the window's edge.
@Config(sdk = {28, 37}, qualifiers = "w1080dp-h1920dp")
public class MessagesLockTimerTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private static final int FRAME = 0x7f0b0001;
    private static final int LIST = 0x7f0b0002;
    private static final int CHAT = 0x7f0b0003;
    private static final String ALICE = "340282366841710300949128111";

    /** A screen that counts how often it's asked whether it shows, which each look at the window does. */
    static final class Counted extends FrameLayout {
        int asks;

        Counted(Context context) {
            super(context);
        }

        @Override public boolean isShown() {
            asks++;
            return super.isShown();
        }
    }

    /** How many view ids were looked up, which a look at the window does for each screen it hasn't kept. */
    private int lookups;
    private Counted list;
    private Counted chat;

    @Before
    public void enable() {
        MessagesLock.resetForTests();
        ChatAccounts.signInForTests(MessagesLockTest.ME);
        Map<String, Integer> ids = new HashMap<String, Integer>() {
            @Override public Integer get(Object key) {
                lookups++;
                return super.get(key);
            }
        };
        ids.put(MessagesLock.INBOX_FRAME, FRAME);
        ids.put(MessagesLock.INBOX_LIST, LIST);
        ids.put(MessagesLock.CHAT_ROOT, CHAT);
        MessagesLock.idsForTests = ids;
        MessagesLock.asker = (activity, confirmed, notConfirmed) -> { };
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.LOCK_MESSAGES.save(false);
        Settings.LOCK_APP.resetToDefault();
        Settings.LOCKED_CHATS.resetToDefault();
        HookStatus.clear();
    }

    @After
    public void restore() {
        MessagesLock.resetForTests();
        Settings.LOCK_MESSAGES.resetToDefault();
        Settings.LOCK_APP.resetToDefault();
        Settings.LOCKED_CHATS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
    }

    /** The inbox and a chat on one screen, the chat showing [name] as its first text, or no text at all. */
    private Activity screen(String name) {
        Activity activity = MessagesLockTest.focused().get();
        FrameLayout root = new FrameLayout(activity);
        FrameLayout frame = new FrameLayout(activity);
        frame.setId(FRAME);
        list = new Counted(activity);
        list.setId(LIST);
        frame.addView(list, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 600));
        root.addView(frame, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 800));
        chat = new Counted(activity);
        chat.setId(CHAT);
        if (name != null) {
            TextView header = new TextView(activity);
            header.setText(name);
            chat.addView(header, new FrameLayout.LayoutParams(300, 80));
        }
        FrameLayout.LayoutParams below = new FrameLayout.LayoutParams(300, 500);
        below.topMargin = 900;
        root.addView(chat, below);
        activity.setContentView(root);
        ShadowLooper.idleMainLooper();
        View decor = activity.getWindow().getDecorView();
        decor.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.EXACTLY));
        decor.layout(0, 0, 1080, 1920);
        return activity;
    }

    /** Everything the lock has asked of the window so far. */
    private int looks() {
        return lookups + list.asks + chat.asks;
    }

    /** The check before each of [count] frames, each half a second after the last: as often as an idle look may come. */
    private static void frames(Activity activity, int count) {
        for (int i = 0; i < count; i++) {
            SystemClock.sleep(MessagesLock.IDLE_LOOK_MS);
            MessagesLock.check(activity);
        }
    }

    /** The chat on screen is the one [id] names, as the patch's bridge would answer. */
    private static void open(String id) {
        ChatLocks.reader = fragment -> id;
        ChatLocks.opened(new Object());
    }

    private static int frameListeners(View view) {
        Object listeners = ReflectionHelpers.getField(view.getViewTreeObserver(), "mOnPreDrawListeners");
        if (listeners == null) return 0;
        Integer size = ReflectionHelpers.callInstanceMethod(listeners, "size");
        return size;
    }

    @Test
    public void nothingLockedAndNoChatOpenNeverWalksTheWindow() {
        Activity activity = screen("Alice");
        int before = looks();

        frames(activity, 6);
        assertEquals("no look with nothing to learn", before, looks());

        // The locks keep working while paused, so pausing changes nothing here: still nothing to do.
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        frames(activity, 6);
        assertEquals("the same while paused, with nothing locked", before, looks());
    }

    @Test
    public void aLockTurnedOffLeavesNoWalkBehind() {
        Activity activity = screen("Alice");
        ViewGroup window = (ViewGroup) activity.getWindow().getDecorView();
        Settings.LOCK_MESSAGES.save(true);
        MessagesLock.check(activity);
        assertTrue("the inbox got its cover", coverShown(window));

        Settings.LOCK_MESSAGES.save(false);
        MessagesLock.check(activity);
        assertFalse("turned off, the cover is taken down", coverShown(window));

        int before = looks();
        frames(activity, 6);
        assertEquals("a cover taken down leaves no look behind", before, looks());
    }

    private static boolean coverShown(ViewGroup window) {
        for (int i = 0; i < window.getChildCount(); i++) {
            View child = window.getChildAt(i);
            if (child instanceof MessagesLock.Cover && child.getVisibility() != View.GONE) return true;
        }
        return false;
    }

    @Test
    public void anOpenChatIsLookedAtOnlyUntilItsNameIsFound() {
        Activity activity = screen("Alice");
        open(ALICE);
        int before = looks();

        MessagesLock.check(activity);
        assertTrue("a chat whose name isn't known yet is looked at", looks() > before);
        assertEquals("Alice", ChatLocks.lastOpened().name);

        int found = looks();
        frames(activity, 6);
        assertEquals("never again once its name is known", found, looks());
    }

    @Test
    public void aChatWhoseNameNeverShowsIsLookedAtABoundedNumberOfTimes() {
        Activity activity = screen(null);
        open(ALICE);

        frames(activity, ChatLocks.NAME_ATTEMPTS);
        int spent = looks();
        assertTrue(spent > 0);
        frames(activity, 10);
        assertEquals("the looks end with the name's attempts", spent, looks());
        assertEquals(ChatList.placeholder(ALICE), ChatLocks.lastOpened().name);
    }

    @Test
    public void theFrameListenerGoesWhenTheScreenDoes() {
        MessagesLock.watch(RuntimeEnvironment.getApplication());
        ActivityController<Activity> controller = MessagesLockTest.focused();
        View decor = controller.get().getWindow().getDecorView();
        int resumed = frameListeners(decor);

        controller.pause();
        assertEquals("paused, its frames aren't looked at", resumed - 1, frameListeners(decor));

        controller.resume();
        assertEquals("back in front, they are again", resumed, frameListeners(decor));
        controller.pause().stop().destroy();
    }
}
