package app.hushmessenger.extension;

import android.content.Context;
import app.hushmessenger.extension.MarkReadButtonTest.Button;
import app.hushmessenger.extension.MarkReadButtonTest.DetailsButton;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
@LooperMode(LooperMode.Mode.PAUSED)
public class CallButtonsTest {
    private final Button audio = new Button("audio_call_button");
    private final Button video = new Button("video_call_button");
    private final Button details = new DetailsButton();

    @Before public void reset() {
        Context context = RuntimeEnvironment.getApplication();
        Settings.initialize(context);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
        CrashGuard.onProcessStart(context);
    }

    private static void on(boolean hide) {
        Settings.preferences.edit().putBoolean(CallButtons.KEY, hide).commit();
    }

    @Test public void offEveryBarKeepsItsCallButtons() {
        on(false);
        List<Object> older = new ArrayList<>(Arrays.asList(audio, video, details, null));
        MarkReadButton.add(older, new Object());
        assertEquals(Arrays.asList(audio, video, details, null), older);
        List<Object> newer = Collections.unmodifiableList(Arrays.asList(audio, video, details));
        assertSame(newer, MarkReadButton.addTo(newer, new Object(), new Object(), new Object()));
    }

    @Test public void theOlderBarsCallButtonsLeaveEmptyPlacesItSkips() {
        on(true);
        List<Object> older = new ArrayList<>(Arrays.asList(audio, video, details, null));
        MarkReadButton.add(older, new Object());
        assertEquals(Arrays.asList(null, null, details, null), older);
    }

    @Test public void theNewerBarGetsACopyWithNoNullsAndItsOwnListStaysAsItWas() {
        on(true);
        List<Object> newer = Collections.unmodifiableList(Arrays.asList(audio, video, details));
        assertEquals(Collections.singletonList(details), MarkReadButton.addTo(newer, new Object(), new Object(), new Object()));
        assertEquals(Arrays.asList(audio, video, details), newer);
    }

    @Test public void everyKindOfCallButtonGoes() {
        on(true);
        List<Object> all = new ArrayList<>();
        for (String tag : MarkReadButton.CALL_TAGS) all.add(new Button(tag));
        assertTrue(CallButtons.without(all).isEmpty());
        CallButtons.blank(all);
        assertEquals(Collections.nCopies(MarkReadButton.CALL_TAGS.length, null), all);
    }

    @Test public void buttonsThatDontStartACallStay() {
        on(true);
        // Meta AI's voice button and Messenger's join a call button, which is another class with no tag to read.
        List<Object> others = Collections.unmodifiableList(Arrays.asList(new Button("friendship_status_button"),
            new Button("ai_voice_audio_button"), new Object(), details));
        assertSame(others, CallButtons.without(others));
    }

    @Test public void markAsReadGetsTheRoomThisLeaves() throws Exception {
        on(true);
        Button ours = new Button("hush_mark_read_button");
        List<Object> older = new ArrayList<>(Arrays.asList(audio, video, details));
        CallButtons.blank(older);
        assertTrue(MarkReadButton.place(older, ours));
        assertEquals(Arrays.asList(null, null, ours, details), older);
        // Add friend keeps its place too, since nothing has to give way now.
        Button friend = new Button("friendship_status_button");
        List<Object> full = new ArrayList<>(CallButtons.without(Arrays.asList(friend, audio, video)));
        assertTrue(MarkReadButton.place(full, ours));
        assertEquals(Arrays.asList(friend, ours), full);
    }

    @Test public void aListThatCantChangeLeavesTheBarAsItWas() {
        on(true);
        List<Object> locked = Collections.unmodifiableList(Arrays.asList(audio, details));
        CallButtons.blank(locked);
        assertEquals(Arrays.asList(audio, details), locked);
        CallButtons.blank(null);
        assertNull(CallButtons.without(null));
    }
}
