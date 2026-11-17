package app.hushmessenger.extension;

import android.app.Application;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Intent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** #193: who a call is with, for the name of its recording. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class CallNameTest {
    private Application app;

    @Before public void reset() {
        app = RuntimeEnvironment.getApplication();
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        QuietCalls.resetForTests();
    }

    private TextView text(String said, float size) {
        TextView view = new TextView(app);
        view.setText(said);
        view.setTextSize(size);
        return view;
    }

    /** Messenger's call screen: the name above the state of the call, the time it's run, and our own buttons. */
    private FrameLayout callScreen() {
        FrameLayout screen = new FrameLayout(app);
        LinearLayout middle = new LinearLayout(app);
        middle.addView(text("Alex Kim", 28));
        middle.addView(text("Connecting", 14));
        middle.addView(text("01:12", 20));
        screen.addView(middle);
        TextView ours = text("Stop 1:12", 32);
        ours.setTag("call_recording_pill");
        screen.addView(ours);
        TextView captions = text("so I said we should go on Friday", 34);
        captions.setTag("call_captions_box");
        screen.addView(captions);
        return screen;
    }

    @Test public void theNameIsTheBiggestTextOnTheCallScreen() {
        assertEquals("Alex Kim", CallName.onScreen(callScreen()));
        assertEquals("Alex Kim", CallName.of(callScreen()));
    }

    @Test public void aNameIsTakenOverTheTimeTheCallHasRunAndOverWhatItsDoing() {
        FrameLayout screen = new FrameLayout(app);
        screen.addView(text("12:04", 40));
        screen.addView(text("Mum", 16));
        assertEquals("Mum", CallName.onScreen(screen));
    }

    @Test public void textThatIsntShownIsntRead() {
        FrameLayout screen = new FrameLayout(app);
        TextView gone = text("Old Group Chat", 40);
        gone.setVisibility(View.GONE);
        screen.addView(gone);
        screen.addView(text("Alex Kim", 20));
        assertEquals("Alex Kim", CallName.onScreen(screen));
    }

    @Test public void aScreenWithNothingToGoOnHasNoName() {
        FrameLayout screen = new FrameLayout(app);
        screen.addView(text("01:12", 28));
        assertNull(CallName.onScreen(screen));
        assertNull(CallName.onScreen(new FrameLayout(app)));
        assertNull(CallName.onScreen(null));
        assertNull(CallName.of(null));
    }

    /** A call that rang leaves its caller in a notification, which is all an answered call from the shade says. */
    @Test public void withNothingOnScreenTheCallThatRangNamesIt() {
        PendingIntent full = PendingIntent.getActivity(app, 0, new Intent(), PendingIntent.FLAG_IMMUTABLE);
        Notification ringing = new Notification.Builder(app, "messenger_orca_749_voip_incoming@test")
            .setSmallIcon(android.R.drawable.sym_call_incoming).setContentTitle("Jess Carter")
            .setCategory(Notification.CATEGORY_CALL).setFullScreenIntent(full, true).build();
        QuietCalls.incomingNotification(ringing, app);
        FrameLayout screen = new FrameLayout(app);
        screen.addView(text("01:12", 28));
        assertEquals("Jess Carter", CallName.of(screen));
    }

    @Test public void aTimeACountOrASentenceIsNoName() {
        assertNull(CallName.nameIn("01:12"));
        assertNull(CallName.nameIn("4"));
        assertNull(CallName.nameIn("   "));
        assertNull(CallName.nameIn(null));
        assertNull(CallName.nameIn("—"));
        StringBuilder sentence = new StringBuilder();
        while (sentence.length() <= CallName.LONGEST) sentence.append("a long line of text ");
        assertNull(CallName.nameIn(sentence));
    }

    @Test public void aNameComesBackOnOneLineWithItsSpacesRunTogether() {
        assertEquals("Alex Kim", CallName.nameIn("  Alex   Kim \n"));
        assertEquals("Alex Kim and Jess", CallName.nameIn("Alex Kim\nand Jess"));
        assertEquals("Mum 2", CallName.nameIn("Mum 2"));
    }
}
