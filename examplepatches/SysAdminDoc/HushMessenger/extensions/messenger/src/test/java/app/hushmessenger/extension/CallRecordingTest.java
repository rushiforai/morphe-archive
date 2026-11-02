package app.hushmessenger.extension;

import android.app.Activity;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Looper;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.facebook.rsys.audio.frame.AudioFrameData;
import com.facebook.rsys.audio.frame.gen.AudioFrame;
import com.facebook.rsys.audio.frame.gen.AudioFrameMetadata;
import com.facebook.rsys.audio.gen.AudioApi;
import com.facebook.rsys.audio.gen.AudioSourceSink;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.time.Duration;
import java.util.Date;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
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
    private static final class Added {
        final String stream;
        final int type;
        final AudioSourceSink sink;

        Added(String stream, int type, AudioSourceSink sink) {
            this.stream = stream;
            this.type = type;
            this.sink = sink;
        }
    }

    private static final class FakeApi extends AudioApi {
        final List<Added> added = new CopyOnWriteArrayList<>();
        final List<Added> removed = new CopyOnWriteArrayList<>();

        @Override public void addSink(String stream, int type, AudioSourceSink sink) {
            added.add(new Added(stream, type, sink));
        }

        @Override public void removeSink(String stream, int type, AudioSourceSink sink) {
            removed.add(new Added(stream, type, sink));
        }
    }

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

    private static AudioFrame frame(int samples, int channels, int rate, boolean muted, short value, int[] asked) {
        return new AudioFrame() {
            @Override public AudioFrameData getAudioData() {
                return new AudioFrameData() {
                    @Override public short[] getAudioData(int size) {
                        asked[0] = size;
                        short[] sound = new short[size];
                        java.util.Arrays.fill(sound, value);
                        return sound;
                    }
                };
            }

            @Override public AudioFrameMetadata getMetadata() {
                return new AudioFrameMetadata() {
                    @Override public boolean getIsMuted() { return muted; }
                    @Override public int getNumberOfChannels() { return channels; }
                    @Override public int getNumberOfSamples() { return samples; }
                    @Override public int getSampleRate() { return rate; }
                };
            }
        };
    }

    private File file;
    private File account;
    private FakeApi api;
    private FileStore store;
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
        api = new FakeApi();
        Context context = RuntimeEnvironment.getApplication();
        account = context.getDatabasePath("msys_database_42");
        account.getParentFile().mkdirs();
        assertTrue(account.createNewFile() || account.isFile());
        CallRecording.register(RuntimeEnvironment.getApplication());
    }

    @After public void tidy() {
        if (screen != null) screen.pause().stop().destroy();
        idle();
        CallRecording.resetForTests();
        account.delete();
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
        CallRecording.api(api);
        CallRecording.active(true);
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

    private Added stream(String id) {
        for (Added one : api.added) if (one.stream.equals(id)) return one;
        throw new AssertionError(id);
    }

    private void recording() throws InterruptedException {
        pill().performClick();
        waitFor(() -> api.added.size() == 2);
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
        CallRecording.api(api);
        idle();
        assertNull(pill());
    }

    @Config(sdk = 28)
    @Test public void android9CantSaveThereSoNothingShows() {
        on();
        assertFalse(Settings.available(CallRecording.KEY));
        open();
        callStarts();
        assertNull(pill());
    }

    @Test public void theButtonComesAndGoesWithTheCall() {
        on();
        open();
        callStarts();
        assertEquals("Record", pill().getText().toString());
        CallRecording.active(false);
        idle();
        assertNull(pill());
    }

    @Test public void aScreenThatOpensDuringTheCallGetsTheButton() {
        on();
        callStarts();
        open();
        assertEquals("Record", pill().getText().toString());
    }

    @Test public void nothingTouchesTheCallUntilTheButtonIsTapped() {
        on();
        open();
        callStarts();
        assertTrue(api.added.isEmpty());
        assertEquals(0, active());
    }

    @Test public void tappingReadsBothSidesAndTappingAgainSavesTheFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        assertEquals(1, stream("42").type);
        assertEquals(9, stream("0").type);
        idle();
        assertEquals("Recording, tap to stop", pill().getText().toString());
        assertEquals(1, active());

        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        stream("42").sink.onFrame(frame(160, 1, 16000, false, (short) 1000, new int[1]));
        stream("0").sink.onFrame(frame(160, 1, 16000, false, (short) 500, new int[1]));
        pill().performClick();
        finished();

        assertEquals(2, api.removed.size());
        assertSame(stream("42").sink, api.removed.stream().filter(one -> one.stream.equals("42")).findFirst().get().sink);
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

    @Test public void hangingUpFinishesTheFile() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        stream("0").sink.onFrame(frame(160, 1, 16000, false, (short) 500, new int[1]));
        CallRecording.active(false);
        idle();
        finished();
        assertEquals(2, api.removed.size());
        assertTrue(store.kept);
        assertNull(pill());
        assertEquals(0, active());
    }

    @Test public void aNewCallsAudioFinishesTheOldRecording() throws Exception {
        on();
        open();
        callStarts();
        recording();
        ShadowSystemClock.advanceBy(Duration.ofSeconds(1));
        stream("42").sink.onFrame(frame(160, 1, 16000, false, (short) 500, new int[1]));
        CallRecording.api(new FakeApi());
        idle();
        finished();
        assertTrue(store.kept);
        assertEquals(2, api.removed.size());
    }

    @Test public void aRecordingKeepsGoingWithMessengerInTheBackground() throws Exception {
        on();
        open();
        callStarts();
        recording();
        screen.pause();
        idle();
        assertTrue(api.removed.isEmpty());
        assertFalse(store.closed);
        CallRecording.active(false);
        idle();
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
        assertTrue(api.added.isEmpty());
        assertEquals("Record", pill().getText().toString());
        assertEquals(0, active());
    }

    @Test public void withNoAccountItDoesntTouchTheCall() throws Exception {
        on();
        account.delete();
        open();
        callStarts();
        pill().performClick();
        waitFor(() -> {
            idle();
            return "Couldn't record this call".equals(ShadowToast.getTextOfLatestToast());
        });
        assertTrue(api.added.isEmpty());
    }

    @Test public void theSinkAsksNativeForEveryChannelsSamples() throws Exception {
        CallMix mix = new CallMix(FileChannel.open(file.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE));
        int[] asked = new int[1];
        new CallSink(mix.mine, 0).onFrame(frame(480, 2, 48000, false, (short) 1, asked));
        assertEquals(960, asked[0]);
    }

    @Test public void aBrokenFrameNeverReachesNative() throws Exception {
        CallMix mix = new CallMix(FileChannel.open(file.toPath(), StandardOpenOption.READ, StandardOpenOption.WRITE));
        CallSink sink = new CallSink(mix.mine, 0);
        sink.onFrame(new AudioFrame() {
            @Override public AudioFrameData getAudioData() { throw new IllegalStateException("gone"); }
            @Override public AudioFrameMetadata getMetadata() { throw new NoSuchMethodError("gone"); }
        });
        sink.onFrame(null);
    }

    @Test public void theFileIsNamedForWhenItStarted() {
        assertTrue(CallRecording.name(new Date(0)).matches("Call \\d{4}-\\d{2}-\\d{2} \\d{2}\\.\\d{2}\\.\\d{2}\\.wav"));
    }

    @Test public void theCurrentAccountComesFromItsDatabase() {
        assertEquals("42", LocalSearchStore.currentUser(account.getParentFile()));
        account.delete();
        assertNull(LocalSearchStore.currentUser(account.getParentFile()));
    }
}
