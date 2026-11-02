package app.hushmessenger.extension;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.media.AudioFormat;
import android.media.AudioManager;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaRecorder;
import android.os.Looper;
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
        CrashGuard.resetForTests();
        CallRecording.resetForTests();
        file = File.createTempFile("call", ".wav");
        store = new FileStore();
        CallRecording.store = store;
        speaker = new AudioTrack(AudioManager.STREAM_VOICE_CALL, 16000, AudioFormat.CHANNEL_OUT_MONO, AudioFormat.ENCODING_PCM_16BIT, 640, AudioTrack.MODE_STREAM);
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
        FrameLayout content = screen.get().findViewById(android.R.id.content);
        for (int i = 0; i < content.getChildCount(); i++) {
            if (content.getChildAt(i) instanceof TextView) return (TextView) content.getChildAt(i);
        }
        return null;
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
        assertEquals("Recording, tap to stop", pill().getText().toString());
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

    private static boolean layerAdded() {
        ArrayList<Object> layers = new ArrayList<>();
        CallRecording.addLayer(layers);
        return !layers.isEmpty();
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

    @Test public void ourLayerGoesLastBecauseNativeReadsFromTheEnd() {
        on();
        ArrayList<Object> layers = new ArrayList<>(List.of("Messenger's own"));
        CallRecording.addLayer(layers);
        assertEquals(2, layers.size());
        assertEquals("Messenger's own", layers.get(0));
        assertTrue(layers.get(1) instanceof CallRecording.JavaAudioLayer);
    }

    @Test public void theLayerOnlySpeaksAboutTheCallsAudio() {
        int[] values = new CallRecording.JavaAudioLayer().getValues();
        assertEquals(CallRecording.JavaAudioLayer.VALUES, values.length);
        assertEquals(0, values[CallRecording.JavaAudioLayer.OBOE_ON]);
        assertEquals(0, values[CallRecording.JavaAudioLayer.OBOE_RECORD]);
        assertEquals(CallRecording.JavaAudioLayer.MODULE_JAVA, values[CallRecording.JavaAudioLayer.MODULE]);
        int spoken = 0;
        for (int value : values) if (value != -1) spoken++;
        assertEquals("Anything else set would override Messenger's own config", 3, spoken);
        assertEquals(0, new CallRecording.JavaAudioLayer().getUpdatedValues().length);
    }

    @Test public void theFileIsNamedForWhenItStarted() {
        assertTrue(CallRecording.name(new Date(0)).matches("Call \\d{4}-\\d{2}-\\d{2} \\d{2}\\.\\d{2}\\.\\d{2}\\.wav"));
    }
}
