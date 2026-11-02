package app.hushmessenger.extension;

import android.os.SystemClock;
import com.facebook.rsys.audio.frame.gen.AudioFrame;
import com.facebook.rsys.audio.frame.gen.AudioFrameMetadata;
import com.facebook.rsys.audio.gen.AudioEncodedPacket;
import com.facebook.rsys.audio.gen.AudioSourceSink;

/**
 * Takes one stream's sound from Messenger's native audio thread (#105). A Java exception crossing back into native code
 * would take the app down, so nothing leaves here, and it only copies the sound and hands it on.
 */
final class CallSink extends AudioSourceSink {
    private final CallMix.Side side;
    private final long began;
    private boolean failed;

    CallSink(CallMix.Side side, long began) {
        this.side = side;
        this.began = began;
    }

    @Override public void onFrame(AudioFrame frame) {
        try {
            AudioFrameMetadata about = frame.getMetadata();
            int frames = about.getNumberOfSamples();
            int channels = about.getNumberOfChannels();
            // Native copies exactly this many samples and checks nothing itself, so it has to be what the frame holds.
            short[] sound = frame.getAudioData().getAudioData(frames * channels);
            side.offer(sound, frames, channels, about.getSampleRate(), about.getIsMuted(), SystemClock.elapsedRealtime() - began);
        } catch (Throwable error) {
            if (failed) return;
            failed = true;
            Settings.hookFailedPrivately(CallRecording.KEY, "Couldn't read a call's sound", error);
        }
    }

    @Override public void onEncodedPacket(AudioEncodedPacket packet) {}

    @Override public void onPositionUpdate(float x, float y, float z) {}
}
