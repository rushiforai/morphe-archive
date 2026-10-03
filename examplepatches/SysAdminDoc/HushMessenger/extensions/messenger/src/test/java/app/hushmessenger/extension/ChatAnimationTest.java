package app.hushmessenger.extension;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.graphics.Matrix;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.view.animation.TranslateAnimation;
import com.facebook.messaging.msys.thread.fragment.MsysThreadViewActivity;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.function.ToIntBiFunction;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowActivity;
import org.robolectric.shadows.ShadowLooper;
import static app.hushmessenger.extension.ChatAnimation.CHAT;
import static app.hushmessenger.extension.ChatAnimation.INBOX;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class ChatAnimationTest {
    /** The entrance Messenger 580 gives a chat it opens from the inbox, search or a notification. */
    private static final int THREAD_ENTER = 0x7f18000a;

    /** What the patch's animation resources resolve to in these tests. */
    private static final Map<String, Integer> ANIMS = Map.of("hush_chat_in", 101, "hush_chat_out", 102,
        "hush_chat_hold", 103, "hush_chat_in_rtl", 111, "hush_chat_out_rtl", 112);
    private static final ToIntBiFunction<Context, String> LOOKUP = ChatAnimation.animations;
    private Locale locale;

    @Before public void reset() {
        locale = Locale.getDefault();
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        ChatAnimation.slidIn.clear();
        ChatAnimation.slidOutAt = Long.MIN_VALUE / 2;
        ChatAnimation.switchedAt = Long.MIN_VALUE / 2;
        ChatAnimation.slidingInUntil = 0;
        ChatAnimation.slidActivities.clear();
        ChatAnimation.animations = (context, name) -> ANIMS.getOrDefault(name, 0);
    }

    @After public void restore() {
        Locale.setDefault(locale);
        durationScale(1f);
        ChatAnimation.animations = LOOKUP;
    }

    /** Android's Remove animations setting, which the SDK only reaches through its hidden setter. */
    private static void durationScale(float scale) {
        try {
            ValueAnimator.class.getMethod("setDurationScale", float.class).invoke(null, scale);
        } catch (ReflectiveOperationException error) {
            throw new AssertionError(error);
        }
    }

    private static void on() { Settings.preferences.edit().putBoolean("chat_animation", true).commit(); }

    /** Where the animation puts the view along x at its first frame, for a view 100 pixels wide. */
    private static float startX(Animation animation) {
        animation.initialize(100, 100, 100, 100);
        animation.setStartTime(0);
        Transformation transformation = new Transformation();
        animation.getTransformation(0, transformation);
        float[] values = new float[9];
        transformation.getMatrix().getValues(values);
        return values[Matrix.MTRANS_X];
    }

    @Test public void offByDefaultEveryFragmentKeepsItsStockAnimation() {
        Object chat = new Object();
        assertNull(ChatAnimation.create(chat, CHAT, true, THREAD_ENTER));
        assertNull(ChatAnimation.create(new Object(), INBOX, false, 0));
        assertNull(ChatAnimation.create(chat, CHAT, false, 0));
        assertNull(ChatAnimation.create(new Object(), INBOX, true, 0));
        assertTrue(ChatAnimation.slidIn.isEmpty());
        assertEquals(0, Settings.lastActive("chat_animation"));
    }

    @Test public void openingSlidesTheChatOverTheInboxAndBackSlidesItAway() {
        on();
        Object chat = new Object();
        // Messenger asks for both before either draws a frame.
        Animation open = ChatAnimation.create(chat, CHAT, true, THREAD_ENTER);
        Animation under = ChatAnimation.create(new Object(), INBOX, false, 0);
        assertTrue(open instanceof TranslateAnimation);
        assertEquals(ChatAnimation.SLIDE_IN, open.getDuration());
        assertEquals(100f, startX(open), 0.01f);
        // The inbox stays drawn under the chat for the whole slide instead of vanishing.
        assertTrue(under instanceof AlphaAnimation);
        assertEquals(ChatAnimation.SLIDE_IN, under.getDuration());

        // Back: the inbox shows at once whichever of the two Messenger asks first.
        assertTrue(ChatAnimation.create(new Object(), INBOX, true, 0) instanceof AlphaAnimation);
        Animation close = ChatAnimation.create(chat, CHAT, false, 0);
        assertTrue(close instanceof TranslateAnimation);
        assertEquals(ChatAnimation.SLIDE_OUT, close.getDuration());
        assertEquals(0f, startX(close), 0.01f);
        assertTrue(ChatAnimation.create(new Object(), INBOX, true, 0) instanceof AlphaAnimation);
        assertTrue(Settings.lastActive("chat_animation") > 0);

        // Once the slide is over the inbox fades in its own way again.
        ShadowLooper.idleMainLooper(ChatAnimation.SLIDE_OUT + 1, TimeUnit.MILLISECONDS);
        assertNull(ChatAnimation.create(new Object(), INBOX, true, 0));
        // And the chat slid out once; another hide of it is Messenger's own.
        assertNull(ChatAnimation.create(chat, CHAT, false, 0));
    }

    @Test public void chatsMessengerAddsWithoutAnEntranceKeepTheirOwnBothWays() {
        on();
        // Restored chats, bubbles and chat heads come with no entrance; a chat-to-chat switch fades.
        for (int nextAnim : new int[] {0, android.R.anim.fade_in}) {
            Object chat = new Object();
            assertNull(ChatAnimation.create(chat, CHAT, true, nextAnim));
            assertNull(ChatAnimation.create(chat, CHAT, false, 0));
        }
        assertTrue(ChatAnimation.slidIn.isEmpty());
        // Only the chat that slid in slides out.
        ShadowLooper.idleMainLooper(ChatAnimation.SAME_PASS, TimeUnit.MILLISECONDS);
        Object slid = new Object();
        assertNotNull(ChatAnimation.create(slid, CHAT, true, THREAD_ENTER));
        assertNull(ChatAnimation.create(new Object(), CHAT, false, 0));
        assertNotNull(ChatAnimation.create(slid, CHAT, false, 0));
    }

    @Test public void anotherScreenCoveringTheInboxKeepsItsOwnExit() {
        on();
        // Nothing is sliding in, so whatever covers the inbox, it leaves the way Messenger has it.
        assertNull(ChatAnimation.create(new Object(), INBOX, false, 0));
        assertNotNull(ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER));
        assertNotNull(ChatAnimation.create(new Object(), INBOX, false, 0));
        // Long after the chat opened, the next screen over the inbox is Messenger's own again.
        ShadowLooper.idleMainLooper(ChatAnimation.PENDING, TimeUnit.MILLISECONDS);
        assertNull(ChatAnimation.create(new Object(), INBOX, false, 0));
    }

    @Test public void aChatThatAnotherChatReplacesDoesNotSlideOut() {
        on();
        Object first = new Object();
        assertNotNull(ChatAnimation.create(first, CHAT, true, THREAD_ENTER));
        ShadowLooper.idleMainLooper(ChatAnimation.SLIDE_IN, TimeUnit.MILLISECONDS);
        // A second chat fades in over the first, which leaves with it instead of sliding away.
        assertNull(ChatAnimation.create(new Object(), CHAT, true, android.R.anim.fade_in));
        assertNull(ChatAnimation.create(first, CHAT, false, 0));
        assertTrue(ChatAnimation.slidIn.isEmpty());
        // The inbox under them wasn't uncovered, so it doesn't jump in either.
        assertNull(ChatAnimation.create(new Object(), INBOX, true, 0));
    }

    @Test public void pauseRemoveAnimationsAndAMissingInstallKeepStock() {
        on();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertNull(ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER));
        assertNull(ChatAnimation.create(new Object(), INBOX, false, 0));
        Settings.preferences.edit().putBoolean("paused", false).commit();

        durationScale(0f);
        assertNull(ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER));
        assertNull(ChatAnimation.create(new Object(), INBOX, false, 0));
        durationScale(1f);

        Settings.installed = java.util.Set.of("ads");
        assertNull(ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER));
        assertTrue(ChatAnimation.slidIn.isEmpty());
    }

    @Test public void rightToLeftLanguagesSlideFromTheOtherSide() {
        on();
        Locale.setDefault(new Locale("ar"));
        Object chat = new Object();
        assertEquals(-100f, startX(ChatAnimation.create(chat, CHAT, true, THREAD_ENTER)), 0.01f);
        Animation close = ChatAnimation.create(chat, CHAT, false, 0);
        close.initialize(100, 100, 100, 100);
        close.setStartTime(0);
        Transformation end = new Transformation();
        close.getTransformation(ChatAnimation.SLIDE_OUT, end);
        float[] values = new float[9];
        end.getMatrix().getValues(values);
        assertEquals(-100f, values[Matrix.MTRANS_X], 0.01f);
    }

    private static float x(Transformation transformation) {
        float[] values = new float[9];
        transformation.getMatrix().getValues(values);
        return values[Matrix.MTRANS_X];
    }

    @Test public void aStalledFrameContinuesTheSlideInsteadOfSkippingToItsEnd() {
        on();
        long start = SystemClock.uptimeMillis();
        Animation open = ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER);
        open.initialize(100, 100, 100, 100);
        Transformation frame = new Transformation();
        assertTrue(open.getTransformation(start, frame));
        assertEquals(100f, x(frame), 0.01f);
        // Messenger builds the chat on the main thread, so the next frame comes 120 ms late.
        assertTrue(open.getTransformation(start + 120, frame));
        Animation plain = new TranslateAnimation(Animation.RELATIVE_TO_SELF, 1f, Animation.RELATIVE_TO_SELF, 0f,
            Animation.ABSOLUTE, 0f, Animation.ABSOLUTE, 0f);
        plain.setDuration(ChatAnimation.SLIDE_IN);
        plain.setInterpolator(open.getInterpolator());
        plain.initialize(100, 100, 100, 100);
        Transformation skipped = new Transformation();
        plain.getTransformation(start, skipped);
        plain.getTransformation(start + 120, skipped);
        // Only one frame of the slide went by, where a plain slide would be most of the way in.
        assertTrue(x(frame) > 2 * x(skipped));
        // Steady frames after that finish it within the slide's own length.
        long now = start + 120;
        while (open.getTransformation(now += 16, frame)) assertTrue(now < start + 120 + ChatAnimation.SLIDE_IN);
        assertEquals(0f, x(frame), 0.01f);
    }

    @Test public void theInboxStaysDrawnUntilTheChatHasSlidOverIt() {
        on();
        long start = SystemClock.uptimeMillis();
        Animation open = ChatAnimation.create(new Object(), CHAT, true, THREAD_ENTER);
        Animation hold = ChatAnimation.create(new Object(), INBOX, false, 0);
        open.initialize(100, 100, 100, 100);
        hold.initialize(100, 100, 100, 100);
        Transformation frame = new Transformation();
        // The chat draws its first frame 100 ms after the inbox, so it slides in past the hold's own length.
        long now = start;
        for (; now < start + 100 + ChatAnimation.SLIDE_IN; now += 16) {
            if (now >= start + 100) open.getTransformation(now, frame);
            assertTrue(hold.getTransformation(now, frame));
            assertEquals(1f, frame.getAlpha(), 0.001f);
        }
        while (open.getTransformation(now, frame)) {
            assertTrue(hold.getTransformation(now, frame));
            now += 16;
        }
        // Once the chat covers it, the inbox stops drawing.
        assertFalse(hold.getTransformation(now, frame));
    }

    @Test public void unknownRolesAreLeftAlone() {
        on();
        assertNull(ChatAnimation.create(new Object(), 0, true, THREAD_ENTER));
        assertNull(ChatAnimation.create(new Object(), 3, false, 0));
    }

    private static ActivityController<MsysThreadViewActivity> chatActivity() {
        return Robolectric.buildActivity(MsysThreadViewActivity.class);
    }

    private static void register() { ChatAnimation.register(RuntimeEnvironment.getApplication()); }

    private static void assertTransition(Activity activity, int type, int enter, int exit) {
        ShadowActivity.OverriddenActivityTransition transition = shadowOf(activity).getOverriddenActivityTransition(type);
        assertNotNull(transition);
        assertEquals(enter, transition.enterAnim);
        assertEquals(exit, transition.exitAnim);
    }

    private static void assertStock(Activity activity) {
        assertNull(shadowOf(activity).getOverriddenActivityTransition(Activity.OVERRIDE_TRANSITION_OPEN));
        assertNull(shadowOf(activity).getOverriddenActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE));
    }

    @Test public void aChatOpenedInItsOwnActivitySlidesInOverTheScreenAndBackOut() {
        on();
        register();
        Activity chat = chatActivity().create().start().resume().get();
        assertTransition(chat, Activity.OVERRIDE_TRANSITION_OPEN, 101, 103);
        assertTransition(chat, Activity.OVERRIDE_TRANSITION_CLOSE, 103, 102);
        assertTrue(Settings.hookErrors.isEmpty());
        assertTrue(Settings.lastActive("chat_animation") > 0);
    }

    @Test public void chatActivitiesKeepStockWhenOffRestoredOrUnderRemoveAnimations() {
        register();
        assertStock(chatActivity().create().start().resume().get());
        on();
        // Android brings this one back already on screen after a restart or a rotation.
        assertStock(chatActivity().create(new Bundle()).start().resume().get());
        durationScale(0f);
        assertStock(chatActivity().create().start().resume().get());
        durationScale(1f);
        // Every other activity keeps its own.
        assertStock(Robolectric.buildActivity(Activity.class).create().start().resume().get());
        assertTrue(ChatAnimation.slidActivities.isEmpty());
    }

    @Test public void switchingItOffWhileAChatIsOpenLetsThatChatCloseTheStockWay() {
        on();
        register();
        ActivityController<MsysThreadViewActivity> controller = chatActivity().create().start().resume();
        Settings.preferences.edit().putBoolean("chat_animation", false).commit();
        controller.pause().resume();
        assertNull(shadowOf(controller.get()).getOverriddenActivityTransition(Activity.OVERRIDE_TRANSITION_CLOSE));
        controller.pause().stop().destroy();
        assertTrue(ChatAnimation.slidActivities.isEmpty());
    }

    @Test public void rightToLeftChatActivitiesSlideFromTheOtherSide() {
        on();
        register();
        Locale.setDefault(new Locale("ar"));
        Activity chat = chatActivity().create().start().resume().get();
        assertTransition(chat, Activity.OVERRIDE_TRANSITION_OPEN, 111, 103);
        assertTransition(chat, Activity.OVERRIDE_TRANSITION_CLOSE, 103, 112);
    }

    @Test public void missingSlideResourcesAreReportedAndTheChatKeepsStock() {
        on();
        register();
        ChatAnimation.animations = (context, name) -> name.equals("hush_chat_hold") ? 0 : ANIMS.get(name);
        assertStock(chatActivity().create().start().resume().get());
        assertNotNull(Settings.hookErrors.get("chat_animation"));
        assertTrue(ChatAnimation.slidActivities.isEmpty());
    }

    @Config(sdk = 30)
    @Test public void olderAndroidTakesTheSlidesAsPendingTransitions() {
        on();
        register();
        ActivityController<MsysThreadViewActivity> controller = chatActivity().create().start().resume();
        ShadowActivity chat = shadowOf(controller.get());
        assertEquals(101, chat.getPendingTransitionEnterAnimationResourceId());
        assertEquals(103, chat.getPendingTransitionExitAnimationResourceId());
        // Leaving for another screen keeps the chat, so only a finishing chat slides out.
        controller.pause().resume();
        assertEquals(101, chat.getPendingTransitionEnterAnimationResourceId());
        controller.get().finish();
        controller.pause();
        assertEquals(103, chat.getPendingTransitionEnterAnimationResourceId());
        assertEquals(102, chat.getPendingTransitionExitAnimationResourceId());
    }
}
