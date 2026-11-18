package app.hushmessenger.extension;

import android.Manifest;
import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaRecorder;
import android.os.Looper;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.function.BooleanSupplier;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowSystemClock;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class CallRecordingTest {
    private final class FileStore implements CallRecording.Store {
        volatile boolean closed;
        volatile boolean kept;
        volatile String name;

        @Override public CallRecording.Target open(Context context, String name) throws IOException {
            this.name = name;
            FileChannel channel = FileChannel.open(file.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE);
            return new CallRecording.Target() {
                @Override public FileChannel channel() {
                    return channel;
                }

                @Override public void close(boolean keep) throws IOException {
                    channel.close();
                    kept = keep;
                    closed = true;
                }
            };
        }
    }

    private File file;
    private FileStore store;
    private AudioTrack speaker;
    private AudioRecord microphone;
    private ActivityController<Activity> screen;

    @Before public void reset() throws IOException {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        CallRecording.resetForTests();
        file = File.createTempFile("call", ".wav");
        store = new FileStore();
        CallRecording.store = store;
        shadowOf(RuntimeEnvironment.getApplication()).grantPermissions(Manifest.permission.POST_NOTIFICATIONS);
        speaker =new AudioTrack(AudioManager.STREAM_VOICE_CALL, 16000, AudioFormat.CHANNEL_OUT_MONO, AudioFormat.ENCODING_PCM_16BIT, 640, AudioTrack.MODE_STREAM);
        microphone = new AudioRecord(MediaRecorder.AudioSource.VOICE_COMMUNICATION, 16000, AudioFormat.CHANNEL_IN_MONO, AudioFormat.ENCODING_PCM_16BIT, 640);
        CallRecording.register(RuntimeEnvironment.getApplication());
    }

    @After public void tidy() {
        if (screen != null) screen.pause().stop().destroy();
        idle();
        CallRecording.resetForTests();
        file.delete();
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static void waitFor(BooleanSupplier condition) throws InterruptedException {
        for (int tries = 0; tries < 500 && !condition.getAsBoolean(); tries++) Thread.sleep(10);
        assertTrue(condition.getAsBoolean());
    }

    private void open() {
        screen = Robolectric.buildActivity(Activity.class).setup();
        idle();
    }

    private void callStarts() {
        CallRecording.playoutStarted();
        idle();
    }

    private void callEnds() {
        CallRecording.playoutStopped();
        idle();
    }

    private TextView pill() {
        return byTag("call_recording_pill");
    }

    private TextView pausePill() {
        return byTag("call_recording_pause");
    }

    private View bar() {
        return byTag("call_recording_bar");
    }

    private <T extends View> T byTag(String tag) {
        FrameLayout content = screen.get().findViewById(android.R.id.content);
        return content.findViewWithTag(tag);
    }

    private void on() {
        Settings.preferences.edit().putBoolean(CallRecording.KEY, true).commit();
    }

    private void recording() throws InterruptedException {
        pill().performClick();
        waitFor(CallRecording::listening);
    }

    /** One 10 ms frame the way the audio threads hold it: direct, in the phone's byte order, and the buffer not saying so. */
    private static ByteBuffer frame(short value) {
        ByteBuffer buffer = ByteBuffer.allocateDirect(320).order(ByteOrder.nativeOrder());
        for (int i = 0; i < 160; i++) buffer.putShort(i * 2, value);
        return buffer.order(ByteOrder.BIG_ENDIAN);
    }

    /** Waits until the file's done and Messenger's screen has heard about it. */
    private void finished() throws InterruptedException {
        waitFor(() -> store.closed);
        // The session posts its last step just after closing the file.
        for (int tries = 0; tries < 50; tries++) {
            Thread.sleep(10);
            idle();
        }
    }

    private int active() {
        return RuntimeEnvironment.getApplication().getSystemService(NotificationManager.class).getActiveNotifications().length;
    }

    @Test public void offNothingShowsDuringACall() {
        open();
        callStarts();
        assertNull(pill());
    }

    @Test public void pausedNothingShowsDuringACall() {
        on();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        open();
        callStarts();
        assertNull(pill());
    }

    @Test public void withNoCallNothingShows() {
        on();
        open();
        assertNull(pill());
    }

    @Config(sdk = 28)
    @Test public void android9CantSaveThereSoNothingShowsAndCallsStayAsTheyAre() {
        on();
        assertFalse(Settings.available(CallRecording.KEY));
        assertFalse(layerAdded());
        assertNull(Settings.heldUntilRestart(CallRecording.KEY));
        open();
        callStarts();
        assertNull(pill());
    }

    @Test public void theButtonComesAndGoesWithTheCall() {
        on();
        open();
        callStarts();
        assertEquals("Record", pill().getText().toString());
        callEnds();
        assertNull(pill());
    }

    /** #105: it used to sit under the status bar, over the name of the person you were calling. */
    @Test public void theButtonSitsAboveMessengersOwnCallButtons() {
        on();
        open();
        callStarts();
        View buttons = bar();
        assertNotNull(buttons);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) buttons.getLayoutParams();
        assertEquals(android.view.Gravity.BOTTOM | android.view.Gravity.CENTER_HORIZONTAL, params.gravity);
        assertEquals(0, params.topMargin);
        CallRecording.place(buttons);
        float density = buttons.getResources().getDisplayMetrics().density;
        assertEquals((int) (density * CallRecording.ABOVE_CALL_BUTTONS_DP), params.bottomMargin);
    }

    @Test public void theButtonShowsItsPressBeforeAndDuringARecording() throws Exception {
        on();
        open();
        callStarts();
        assertTrue(pill().getBackground() instanceof android.graphics.drawable.RippleDrawable);
        recording();
        idle();
        assertTrue(pill().getBackground() instanceof android.graphics.drawable.RippleDrawable);
    }

    @Test public void aScreenThatOpensDuringTheCallGetsTheButton() {
        on();
        callStarts();
        open();
        assertEquals("Record", pill().getText().toString());
    }

    @Test public void nothingIsReadOrKeptUntilTheButtonIsTapped() {
        on();
        open();
        callStarts();
        CallRecording.heard(speaker, frame((short) 500), 320);
        CallRecording.spoke(microphone, frame((short) 1000), 320);
        assertFalse(CallRecording.listening());
        assertNull(store.name);
        assertEquals(0, active());
    }

    @Test public void tappingReadsBothSidesAndTappingAgainSavesTheFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        idle();
        assertEquals("Stop 0:00", pill().getText().toString());
        assertEquals("Recording, tap to stop", pill().getContentDescription());
        assertEquals(1, active());

        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.spoke(microphone, frame((short) 1000), 320);
        CallRecording.heard(speaker, frame((short) 500), 320);
        pill().performClick();
        finished();

        assertFalse(CallRecording.listening());
        assertTrue(store.kept);
        assertEquals("Record", pill().getText().toString());
        assertEquals(0, active());
        assertEquals("Call saved to Recordings/" + CallRecording.FOLDER, ShadowToast.getTextOfLatestToast());

        ByteBuffer all = ByteBuffer.wrap(Files.readAllBytes(file.toPath())).order(ByteOrder.LITTLE_ENDIAN);
        int samples = all.getInt(40) / 2;
        assertTrue(samples >= CallMix.RATE);
        int mixed = 0;
        for (int i = 0; i < samples; i++) {
            if (all.getShort(CallMix.HEADER_BYTES + i * 2) == 1500) mixed++;
        }
        assertEquals(160, mixed);
    }

    @Test public void withoutTheNotificationGrantItStillRecordsAndSaves() throws Exception {
        shadowOf(RuntimeEnvironment.getApplication()).denyPermissions(Manifest.permission.POST_NOTIFICATIONS);
        on();
        open();
        callStarts();
        recording();
        idle();
        assertEquals("Stop 0:00", pill().getText().toString());
        assertEquals(0, active());

        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);
        pill().performClick();
        finished();
        assertTrue(store.kept);
        assertEquals("Call saved to Recordings/" + CallRecording.FOLDER, ShadowToast.getTextOfLatestToast());
    }

    @Test public void aCallThatNeverHandsOverSoundSaysSoAndKeepsNoFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(10));
        pill().performClick();
        finished();
        assertFalse(store.kept);
        assertEquals("Couldn't record this call", ShadowToast.getTextOfLatestToast());
    }

    @Test public void framesOfNothingButSilenceCountAsNoSound() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(10));
        CallRecording.spoke(microphone, frame((short) 0), 320);
        CallRecording.heard(speaker, frame((short) 0), 320);
        pill().performClick();
        finished();
        assertFalse(store.kept);
        assertEquals("Couldn't record this call", ShadowToast.getTextOfLatestToast());
    }

    @Test public void hangingUpFinishesTheFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);
        callEnds();
        finished();
        assertTrue(store.kept);
        assertNull(pill());
        assertEquals(0, active());
    }

    @Test public void aRecordingKeepsGoingWithMessengerInTheBackground() throws Exception {
        on();
        open();
        callStarts();
        recording();
        screen.pause();
        idle();
        assertTrue(CallRecording.listening());
        assertFalse(store.closed);
        callEnds();
        finished();
    }

    @Test public void stoppingStraightAwayLeavesNoEmptyFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        pill().performClick();
        finished();
        assertFalse(store.kept);
        assertNull(ShadowToast.getTextOfLatestToast());
    }

    @Test public void aFileThatWontOpenSaysSoAndLeavesTheCallAlone() throws Exception {
        on();
        CallRecording.store = (context, name) -> { throw new IOException("full"); };
        open();
        callStarts();
        pill().performClick();
        waitFor(() -> {
            idle();
            return "Couldn't record this call".equals(ShadowToast.getTextOfLatestToast());
        });
        assertFalse(CallRecording.listening());
        assertEquals("Record", pill().getText().toString());
        assertEquals(0, active());
    }

    @Test public void theNextCallInTheSameRunCanRecordToo() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);
        callEnds();
        finished();
        assertNull(pill());

        store.closed = false;
        store.kept = false;
        callStarts();
        assertEquals("Record", pill().getText().toString());
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.spoke(microphone, frame((short) 500), 320);
        callEnds();
        finished();
        assertTrue(store.kept);
    }

    @Test public void soundThatCantBeReadNeverReachesTheAudioThreads() throws Exception {
        on();
        open();
        callStarts();
        CallRecording.heard(null, null, 0);
        recording();
        CallRecording.heard(null, null, 0);
        CallRecording.spoke(null, null, 0);
        CallRecording.heard(speaker, null, 320);
        CallRecording.spoke(microphone, frame((short) 1), -1);
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.spoke(microphone, frame((short) 500), 320);
        pill().performClick();
        finished();
        assertTrue(store.kept);
    }

    /** Messenger's own config layer, at the length one build's generated config has. */
    static final class OwnLayer implements com.facebook.rtc.fbwebrtc.overlayconfig.overlayconfiglayer.OverlayConfigLayerInterface {
        final int length;
        int asked;

        OwnLayer(int length) {
            this.length = length;
        }

        @Override public int getLayerSource() { return 2; }
        @Override public int[] getUpdatedValues() { return getValues(); }
        @Override public int[] getValues() {
            asked++;
            return new int[length];
        }
        @Override public void logExposure(int id) { }
    }

    /** 586's generated config length, from the new-array in its MobileConfig layer's getNonCachedValues. */
    private static final int LENGTH_586 = 0x18d6;

    private static boolean layerAdded() {
        ArrayList<Object> layers = new ArrayList<>(List.of(new OwnLayer(LENGTH_586)));
        CallRecording.addLayer(layers);
        return layers.size() > 1;
    }

    @Test public void theAudioOnlyMovesWithTheSwitchOn() {
        assertFalse(layerAdded());
        CallRecording.resetForTests();
        on();
        assertTrue(layerAdded());
        CallRecording.resetForTests();
        Settings.preferences.edit().putBoolean("paused", true).commit();
        assertFalse(layerAdded());
    }

    @Test public void theAudioHoldsItsFirstAnswerAndTheRestartRowSaysSo() {
        on();
        assertNull("Native hasn't asked yet, so the switch still decides", Settings.heldUntilRestart(CallRecording.KEY));
        assertTrue(layerAdded());
        assertNull(Settings.heldUntilRestart(CallRecording.KEY));

        Settings.preferences.edit().putBoolean(CallRecording.KEY, false).commit();
        assertTrue(layerAdded());
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(CallRecording.KEY));

        CallRecording.resetForTests();
        assertFalse(layerAdded());
        on();
        assertFalse(layerAdded());
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(CallRecording.KEY));
    }

    @Test public void liveCaptionsAloneMoveTheAudioTooAndKeepTheRecordButtonAway() {
        Settings.preferences.edit().putBoolean(CallCaptions.KEY, true).commit();
        assertTrue(layerAdded());
        assertTrue(Settings.hookErrors.isEmpty());
        open();
        callStarts();
        assertNull(pill());
    }

    @Test public void eachSwitchsRestartRowFollowsWhatTheAudioActuallyDid() {
        Settings.preferences.edit().putBoolean(CallCaptions.KEY, true).commit();
        assertTrue(layerAdded());
        assertNull(Settings.heldUntilRestart(CallCaptions.KEY));
        assertNull("Record calls was never on, so it has nothing to wait for", Settings.heldUntilRestart(CallRecording.KEY));

        on();
        assertNull("The audio already moved for captions, so recording needs no restart", Settings.heldUntilRestart(CallRecording.KEY));
        Settings.preferences.edit().putBoolean(CallCaptions.KEY, false).commit();
        assertNull("Record calls still wants the audio where it is", Settings.heldUntilRestart(CallCaptions.KEY));
        Settings.preferences.edit().putBoolean(CallRecording.KEY, false).commit();
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(CallCaptions.KEY));

        CallRecording.resetForTests();
        assertFalse(layerAdded());
        Settings.preferences.edit().putBoolean(CallCaptions.KEY, true).commit();
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(CallCaptions.KEY));
        assertNull(Settings.heldUntilRestart(CallRecording.KEY));
    }

    @Test public void ourLayerGoesLastBecauseNativeReadsFromTheEnd() {
        on();
        OwnLayer own = new OwnLayer(LENGTH_586);
        ArrayList<Object> layers = new ArrayList<>(List.of(own));
        CallRecording.addLayer(layers);
        assertEquals(2, layers.size());
        assertSame(own, layers.get(0));
        assertTrue(layers.get(1) instanceof CallRecording.JavaAudioLayer);
        assertEquals("Messenger's own layer is only read once native reads ours", 0, own.asked);
    }

    @Test public void withNoLayerOfMessengersOwnNothingIsAddedAndItSaysWhy() {
        on();
        ArrayList<Object> layers = new ArrayList<>(List.of("something else"));
        CallRecording.addLayer(layers);
        assertEquals(1, layers.size());
        assertTrue(Settings.hookErrors.containsKey(CallRecording.KEY));
    }

    @Test public void theLayerOnlySpeaksAboutTheCallsAudioAtTheLengthOfTheBuildsOwn() {
        // 586 grew the config from 585's 0x18bb values to 0x18d6, and a 585-length layer crashed a 586 call as it started.
        for (int length : new int[]{0x18bb, LENGTH_586}) {
            OwnLayer own = new OwnLayer(length);
            CallRecording.JavaAudioLayer layer = new CallRecording.JavaAudioLayer(own);
            int[] values = layer.getValues();
            assertEquals(length, values.length);
            assertEquals(0, values[CallRecording.JavaAudioLayer.OBOE_ON]);
            assertEquals(0, values[CallRecording.JavaAudioLayer.OBOE_RECORD]);
            assertEquals(CallRecording.JavaAudioLayer.MODULE_JAVA, values[CallRecording.JavaAudioLayer.MODULE]);
            int spoken = 0;
            for (int value : values) if (value != CallRecording.JavaAudioLayer.UNSET) spoken++;
            assertEquals("Anything else set would override Messenger's own config", 3, spoken);
            assertArrayEquals("An update is the same numbers, at the same length", values, layer.getUpdatedValues());
            values[0] = 7;
            assertEquals("Native gets its own copy", CallRecording.JavaAudioLayer.UNSET, layer.getValues()[0]);
            assertEquals("Messenger's own layer is read once", 1, own.asked);
        }
    }

    @Test public void aConfigTooShortForTheAudioIdsGetsALayerThatSaysNothing() {
        int[] values = new CallRecording.JavaAudioLayer(new OwnLayer(0xb1d)).getValues();
        assertEquals(0xb1d, values.length);
        for (int value : values) assertEquals(CallRecording.JavaAudioLayer.UNSET, value);
    }

    @Test public void theFileIsNamedForWhenItStarted() {
        assertTrue(CallRecording.name(new Date(0)).matches("Call \\d{4}-\\d{2}-\\d{2} \\d{2}\\.\\d{2}\\.\\d{2}\\.wav"));
    }

    /** #193: the name of the person or group on the call goes in the file's name. */
    @Test public void theFileSaysWhoTheCallWasWith() {
        assertTrue(CallRecording.name(new Date(0), "Alex Kim").matches("Call with Alex Kim \\d{4}-\\d{2}-\\d{2} \\d{2}\\.\\d{2}\\.\\d{2}\\.wav"));
        assertEquals("Nothing to go on leaves the plain name", CallRecording.name(new Date(0)), CallRecording.name(new Date(0), " "));
    }

    @Test public void aNameAFileCantCarryIsCleanedUpFirst() {
        assertEquals("Alex Kim", CallRecording.fileSafe("Alex/Kim"));
        assertEquals("Alex Kim", CallRecording.fileSafe("  Alex\tKim\n"));
        assertEquals("Work Chat", CallRecording.fileSafe("Work: *Chat*?"));
        assertEquals("A name can't start a file with a dot", "hidden", CallRecording.fileSafe("..hidden"));
        assertEquals("", CallRecording.fileSafe(null));
        assertEquals("A right-to-left mark can't turn the rest of the name around", "a bc", CallRecording.fileSafe("a‮bc"));
        StringBuilder room = new StringBuilder();
        while (room.length() < 200) room.append("Group chat about the trip ");
        assertEquals(48, CallRecording.fileSafe(room.toString()).length());
    }

    @Test public void theTimeOnTheButtonReadsTheWayACallScreenCountsIt() {
        assertEquals("0:00", CallRecording.clock(0));
        assertEquals("0:05", CallRecording.clock(5_400));
        assertEquals("1:05", CallRecording.clock(65_000));
        assertEquals("59:59", CallRecording.clock(3_599_999));
        assertEquals("1:00:00", CallRecording.clock(3_600_000));
        assertEquals("2:03:04", CallRecording.clock(7_384_000));
        assertEquals("A clock that reads backwards still reads", "0:00", CallRecording.clock(-5_000));
    }

    @Test public void theButtonCountsTheRecordingUp() throws Exception {
        on();
        open();
        callStarts();
        recording();
        idle();
        assertEquals("Stop 0:00", pill().getText().toString());
        ShadowSystemClock.advanceBy(Duration.ofSeconds(13));
        idle();
        assertEquals("Stop 0:13", pill().getText().toString());
    }

    @Test public void holdOnlyShowsWhileItRecords() throws Exception {
        on();
        open();
        callStarts();
        assertEquals(View.GONE, pausePill().getVisibility());
        recording();
        idle();
        assertEquals(View.VISIBLE, pausePill().getVisibility());
        assertEquals("Pause", pausePill().getText().toString());
        pill().performClick();
        finished();
        assertEquals(View.GONE, pausePill().getVisibility());
    }

    /** #193: what's said while a recording waits is left out, and so is the wait itself. */
    @Test public void holdingTheRecordingLeavesTheWaitOutOfTheFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);

        pausePill().performClick();
        idle();
        assertEquals("Resume", pausePill().getText().toString());
        assertEquals("Paused 0:01", pill().getText().toString());
        ShadowSystemClock.advanceBy(Duration.ofSeconds(5));
        CallRecording.heard(speaker, frame((short) 2000), 320);
        CallRecording.spoke(microphone, frame((short) 2000), 320);
        assertEquals("The time stands still while it waits", "Paused 0:01", pill().getText().toString());

        pausePill().performClick();
        idle();
        assertEquals("Pause", pausePill().getText().toString());
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);
        pill().performClick();
        finished();

        assertTrue(store.kept);
        ByteBuffer all = ByteBuffer.wrap(Files.readAllBytes(file.toPath())).order(ByteOrder.LITTLE_ENDIAN);
        int samples = all.getInt(40) / 2;
        assertTrue("About the two seconds it recorded, not the seven the clock moved: " + samples,
            samples >= CallMix.RATE && samples < CallMix.RATE * 3);
        int said = 0;
        int whileWaiting = 0;
        for (int i = 0; i < samples; i++) {
            short sample = all.getShort(CallMix.HEADER_BYTES + i * 2);
            if (sample == 500) said++;
            if (sample >= 2000) whileWaiting++;
        }
        assertEquals("Both stretches it did record are in it", 320, said);
        assertEquals("Nothing from the wait is", 0, whileWaiting);
    }

    @Test public void aRecordingOnHoldStillFinishesWhenTheCallEnds() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        CallRecording.heard(speaker, frame((short) 500), 320);
        pausePill().performClick();
        idle();
        callEnds();
        finished();
        assertTrue(store.kept);
        assertNull(pill());
    }

    private void scope(String scope) {
        Settings.preferences.edit().putString(CallRecordings.SCOPE, scope).commit();
    }

    @Test public void nothingRecordsItselfUntilTheScopeSaysSo() throws Exception {
        on();
        open();
        callStarts();
        assertEquals(CallRecordings.TAP, CallRecordings.scope());
        assertFalse(CallRecording.listening());
        assertEquals("Record", pill().getText().toString());
    }

    @Test public void everyCallRecordsItselfWithoutATap() throws Exception {
        on();
        scope(CallRecordings.ALL);
        open();
        callStarts();
        waitFor(CallRecording::listening);
        CallRecording.heard(speaker, frame((short) 500), 320);
        callEnds();
        finished();
        assertTrue(store.kept);
    }

    /** Stopping one by hand has to stick: the next screen change mustn't start the call over again. */
    @Test public void aRecordingStoppedByHandStaysStopped() throws Exception {
        on();
        scope(CallRecordings.ALL);
        open();
        callStarts();
        waitFor(CallRecording::listening);
        pill().performClick();
        finished();
        screen.pause();
        screen.resume();
        idle();
        assertFalse(CallRecording.listening());
        assertEquals("Record", pill().getText().toString());
    }

    @Test public void onlyAChosenChatRecordsItself() throws Exception {
        on();
        scope(CallRecordings.CHOSEN);
        QuietCalls.resetForTests();
        QuietCalls.incoming("t_17", 0);
        open();
        callStarts();
        idle();
        assertFalse("Nobody has switched that chat on", CallRecording.listening());
        callEnds();
        idle();

        Settings.preferences.edit().putBoolean(CallRecordings.CHAT_PREFIX + "t_17", true).commit();
        QuietCalls.incoming("t_17", 0);
        callStarts();
        waitFor(CallRecording::listening);
        CallRecording.heard(speaker, frame((short) 500), 320);
        callEnds();
        finished();
        assertTrue(store.kept);
    }

    @Test public void aChatThatCalledIsRememberedForTheListEvenWithQuietCallsOff() {
        on();
        QuietCalls.resetForTests();
        QuietCalls.incoming("t_42", 0);
        QuietCalls.remember("t_42", "Alex Kim");
        List<String[]> recent = QuietCalls.recent();
        assertEquals(1, recent.size());
        assertEquals("t_42", recent.get(0)[0]);
        assertEquals("Alex Kim", recent.get(0)[1]);
    }
}
