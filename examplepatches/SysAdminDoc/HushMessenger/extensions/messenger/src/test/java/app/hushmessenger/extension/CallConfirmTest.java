package app.hushmessenger.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Looper;
import android.view.View;
import android.view.WindowManager;
import app.hushmessenger.extension.MarkReadButtonTest.DetailsButton;
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
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class CallConfirmTest {
    /** Messenger's tap listener type: one onClick(View), and a static helper the way R8 leaves one. */
    public interface Tap {
        void onClick(View view);

        static Tap nothing() { return view -> { }; }
    }

    /** A top bar button spec the way 585 builds it: a test tag, a final tap listener and a second one. */
    public static final class Spec {
        public final String tag;
        public final Tap click;
        public final Tap other;

        Spec(String tag, Tap click, Tap other) {
            this.tag = tag;
            this.click = click;
            this.other = other;
        }
    }

    /** Counts the taps that reached Messenger. */
    static final class Counting implements Tap {
        int taps;
        View last;

        @Override public void onClick(View view) {
            taps++;
            last = view;
        }
    }

    /** An audio or video row of the menu on someone's picture, with the patch's hook at the top of its tap. */
    static final class ProfileRow {
        final int video;
        int taps;
        View tapped;
        Object message;

        ProfileRow(int video) {
            this.video = video;
        }

        boolean tap(Context context, View view, CharSequence about) {
            if (CallConfirm.profileCall(this, context, view, about, video)) return true;
            taps++;
            tapped = view;
            message = about;
            return true;
        }
    }

    private final List<Boolean> asked = new ArrayList<>();
    private final List<Runnable> waiting = new ArrayList<>();
    private final CallConfirm.Asker shown = CallConfirm.asker;
    private View view;

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
        view = new View(context);
        CallConfirm.asker = (tapped, video, call) -> {
            assertSame(view, tapped);
            asked.add(video);
            waiting.add(call);
        };
    }

    @After public void restore() {
        CallConfirm.asker = shown;
    }

    private static void on(boolean ask) {
        Settings.preferences.edit().putBoolean(CallConfirm.KEY, ask).commit();
    }

    @Test public void offTheCallButtonsKeepTheirOwnListeners() {
        on(false);
        Counting tap = new Counting();
        Spec audio = new Spec("audio_call_button", tap, null);
        List<Object> newer = Collections.unmodifiableList(Arrays.asList(audio, new DetailsButton()));
        assertSame(newer, MarkReadButton.addTo(newer, new Object(), new Object(), new Object()));
        assertSame(tap, audio.click);
    }

    @Test public void aTapAsksFirstAndOnlyCallReachesMessenger() {
        on(true);
        Counting tap = new Counting();
        Spec audio = new Spec("audio_call_button", tap, null);
        MarkReadButton.addTo(Collections.unmodifiableList(Arrays.asList(audio, new DetailsButton())), new Object(), new Object(), new Object());
        assertNotSame(tap, audio.click);
        audio.click.onClick(view);
        assertEquals(Collections.singletonList(false), asked);
        assertEquals("Nothing rings before Call", 0, tap.taps);
        waiting.get(0).run();
        assertEquals(1, tap.taps);
        assertSame(view, tap.last);
        // Cancel is just never running it: a second tap asks again and rings nothing on its own.
        audio.click.onClick(view);
        assertEquals(2, asked.size());
        assertEquals(1, tap.taps);
    }

    /** A 586 call button inside its wrapper: the test tag and the two tap listeners stay on this one. */
    static final class Built586 extends MarkReadButtonTest.Base {
        final String testKey;
        final Tap click;
        final Tap other;

        Built586(String testKey, Tap click, Tap other) {
            this.testKey = testKey;
            this.click = click;
            this.other = other;
        }
    }

    @Test public void aCallButtonWrappedThe586WayAsksFirstAndVideoSaysSo() throws Exception {
        on(true);
        Counting tap = new Counting();
        Counting second = new Counting();
        Built586 video = new Built586("video_call_button", tap, second);
        MarkReadButtonTest.Wrapper wrapper = new MarkReadButtonTest.Wrapper(video);
        MarkReadButton.addTo(Collections.unmodifiableList(Arrays.asList(wrapper, new DetailsButton())), new Object(), new Object(), new Object());
        assertNotNull(CallConfirm.asking(video.click));
        assertNotNull(CallConfirm.asking(video.other));
        video.click.onClick(view);
        assertEquals(Collections.singletonList(true), asked);
        assertEquals("Nothing rings before Call", 0, tap.taps);
        waiting.get(0).run();
        assertEquals(1, tap.taps);
        assertEquals("Built again, the bar hands over the same button", 0, CallConfirm.guard(wrapper, true));
    }

    /** #172: a business chat's bar and the New message screen take the builders' buttons past both top bar seams. */
    @Test public void aButtonFromTheBuilderAsksWhereverMessengerPutsIt() throws Exception {
        Counting tap = new Counting();
        Built586 video = new Built586("video_call_button", tap, null);
        MarkReadButtonTest.Wrapper wrapper = new MarkReadButtonTest.Wrapper(video);
        on(false);
        CallConfirm.built(wrapper);
        assertSame("Off, Messenger's listener stays", tap, video.click);
        on(true);
        CallConfirm.built(wrapper);
        assertNotNull(CallConfirm.asking(video.click));
        video.click.onClick(view);
        assertEquals(Collections.singletonList(true), asked);
        assertEquals("Nothing rings before Call", 0, tap.taps);
        waiting.get(0).run();
        assertEquals(1, tap.taps);
        assertEquals("The top bar's seam finds it already asking", 0, CallConfirm.guard(wrapper, true));
        Spec friend = new Spec("friendship_status_button", tap, null);
        CallConfirm.built(friend);
        assertSame("Only call buttons ask", tap, friend.click);
        CallConfirm.built(null);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    @Test public void theOlderBarsCallButtonsAskTooAndVideoSaysSo() {
        on(true);
        Counting tap = new Counting();
        Spec video = new Spec("video_call_button", tap, null);
        MarkReadButton.add(new ArrayList<>(Arrays.asList(video, null)), new Object());
        video.click.onClick(view);
        assertEquals(Collections.singletonList(true), asked);
        assertEquals(0, tap.taps);
    }

    @Test public void turnedOffLaterATapGoesStraightThrough() {
        on(true);
        Counting tap = new Counting();
        Spec audio = new Spec("audio_call_button", tap, null);
        CallConfirm.guard(new ArrayList<>(Collections.singletonList(audio)));
        on(false);
        audio.click.onClick(view);
        assertTrue(asked.isEmpty());
        assertEquals(1, tap.taps);
    }

    @Test public void everyListenerOnACallButtonIsWrappedOnceAndOtherButtonsStay() throws Exception {
        on(true);
        Counting tap = new Counting();
        Counting second = new Counting();
        Spec audio = new Spec("audio_call_button", tap, second);
        Spec friend = new Spec("friendship_status_button", tap, null);
        CallConfirm.guard(new ArrayList<>(Arrays.asList(audio, friend)));
        assertNotNull(CallConfirm.asking(audio.click));
        assertNotNull(CallConfirm.asking(audio.other));
        assertSame(tap, friend.click);
        assertEquals("Built again, the bar hands over the same spec", 0, CallConfirm.guard(audio, false));
        for (String tag : MarkReadButton.CALL_TAGS) {
            Spec spec = new Spec(tag, new Counting(), null);
            assertEquals(tag, 1, CallConfirm.guard(spec, false));
        }
    }

    @Test public void theWrapperComparesLikeTheListenerItHolds() throws Exception {
        on(true);
        Tap shared = new Counting();
        Spec first = new Spec("audio_call_button", shared, null);
        Spec again = new Spec("audio_call_button", shared, Tap.nothing());
        CallConfirm.guard(first, false);
        CallConfirm.guard(again, false);
        assertEquals(first.click, again.click);
        assertEquals(first.click, shared);
        assertEquals(shared.hashCode(), first.click.hashCode());
        assertNotEquals(first.click, new Counting());
        assertNotEquals(first.click, again.other);
    }

    @Test public void onlyOneMethodTapListenersCount() {
        assertTrue(CallConfirm.isTapListener(View.OnClickListener.class));
        assertTrue(CallConfirm.isTapListener(Tap.class));
        assertFalse(CallConfirm.isTapListener(Runnable.class));
        assertFalse(CallConfirm.isTapListener(View.OnTouchListener.class));
        assertFalse(CallConfirm.isTapListener(Counting.class));
    }

    /** The question Messenger's own call button gets in a chat: an ordinary dialog, and Call runs its tap. */
    @Test public void theQuestionGoesUpOverTheChat() {
        on(true);
        CallConfirm.asker = shown;
        Counting tap = new Counting();
        Spec audio = new Spec("audio_call_button", tap, null);
        CallConfirm.guard(new ArrayList<>(Collections.singletonList(audio)));
        Activity chat = Robolectric.buildActivity(Activity.class).setup().get();
        audio.click.onClick(new View(chat));
        AlertDialog question = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(question.isShowing());
        assertEquals(WindowManager.LayoutParams.TYPE_APPLICATION, question.getWindow().getAttributes().type);
        assertEquals(0, tap.taps);
        answer(question, AlertDialog.BUTTON_POSITIVE);
        assertEquals(1, tap.taps);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /**
     * #172: a chat head draws from Messenger's own service, where no activity holds a window for a dialog, so the
     * question never reached the screen and the call rang anyway. It goes up over other apps there instead.
     */
    @Test public void theQuestionGoesUpInAChatHeadToo() {
        on(true);
        CallConfirm.asker = shown;
        Counting tap = new Counting();
        Spec call = new Spec(CallConfirm.VIDEO_TAG, tap, null);
        CallConfirm.guard(new ArrayList<>(Collections.singletonList(call)));
        // The application context a chat head's window leads to, with no activity anywhere up the chain.
        assertNull(ChatJump.activity(view.getContext()));
        call.click.onClick(view);
        AlertDialog question = (AlertDialog) ShadowDialog.getLatestDialog();
        assertTrue(question.isShowing());
        assertEquals(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY, question.getWindow().getAttributes().type);
        assertEquals(0, tap.taps);
        answer(question, AlertDialog.BUTTON_POSITIVE);
        assertEquals(1, tap.taps);
        assertTrue(Settings.hookErrors.isEmpty());
    }

    /** Cancel in a chat head leaves the call alone, the same as it does in a chat. */
    @Test public void cancelInAChatHeadLeavesTheCall() {
        on(true);
        CallConfirm.asker = shown;
        Counting tap = new Counting();
        Spec call = new Spec("audio_call_button", tap, null);
        CallConfirm.guard(new ArrayList<>(Collections.singletonList(call)));
        call.click.onClick(view);
        AlertDialog question = (AlertDialog) ShadowDialog.getLatestDialog();
        answer(question, AlertDialog.BUTTON_NEGATIVE);
        assertEquals(0, tap.taps);
        assertFalse(question.isShowing());
    }

    /** Presses a dialog button and lets the answer reach the listener. */
    private static void answer(AlertDialog question, int button) {
        question.getButton(button).performClick();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    @Test public void aQuestionThatCantGoUpLetsTheCallThroughAndSaysWhy() {
        on(true);
        CallConfirm.asker = (tapped, video, call) -> { throw new IllegalStateException("no window"); };
        Counting tap = new Counting();
        Spec audio = new Spec("audio_call_button", tap, null);
        CallConfirm.guard(new ArrayList<>(Collections.singletonList(audio)));
        audio.click.onClick(view);
        assertEquals(1, tap.taps);
        assertTrue(Settings.hookErrors.containsKey(CallConfirm.KEY));
    }

    /** #201: these rows call from inside their own tap, so Cancel has to leave the row's tap never having run. */
    @Test public void aProfileMenuCallRowAsksFirstAndCancelStartsNothing() {
        on(true);
        ProfileRow audio = new ProfileRow(0), video = new ProfileRow(1);
        assertTrue(audio.tap(view.getContext(), view, "message"));
        assertTrue(video.tap(view.getContext(), view, "message"));
        assertEquals(Arrays.asList(false, true), asked);
        assertEquals(0, audio.taps);
        assertEquals(0, video.taps);
    }

    @Test public void callOnAProfileMenuRowRunsItsOwnTapOnceAndTheNextTapAsksAgain() {
        on(true);
        ProfileRow row = new ProfileRow(1);
        row.tap(view.getContext(), view, "message");
        waiting.get(0).run();
        assertEquals("Call must not ask a second time", 1, asked.size());
        assertEquals(1, row.taps);
        assertSame(view, row.tapped);
        assertEquals("message", row.message);

        row.tap(view.getContext(), view, "message");
        assertEquals(2, asked.size());
        assertEquals(1, row.taps);
    }

    @Test public void offAProfileMenuRowCallsStraightAway() {
        on(false);
        ProfileRow row = new ProfileRow(0);
        row.tap(view.getContext(), view, "message");
        assertTrue(asked.isEmpty());
        assertEquals(1, row.taps);
    }

    @Test public void aProfileMenuQuestionThatCantGoUpLetsTheCallThroughAndSaysWhy() {
        on(true);
        CallConfirm.asker = (tapped, video, call) -> { throw new IllegalStateException("no window"); };
        ProfileRow row = new ProfileRow(0);
        row.tap(view.getContext(), view, "message");
        assertEquals(1, row.taps);
        assertTrue(Settings.hookErrors.containsKey(CallConfirm.KEY));
    }

    @Test public void aRowWithoutItsTapMethodIsReportedAndLeftToCall() {
        on(true);
        assertFalse(CallConfirm.profileCall(new Object(), view.getContext(), view, "message", 0));
        assertTrue(asked.isEmpty());
        assertTrue(Settings.hookErrors.containsKey(CallConfirm.KEY));
    }
}
