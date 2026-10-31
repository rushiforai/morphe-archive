/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.media.AudioAttributes;
import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.AudioTrack;
import android.media.MediaRecorder;
import android.widget.FrameLayout;

import java.nio.ByteBuffer;

/** Lets tests outside this package play a block of call audio past the recorder's hooks. */
public final class CallRecorderForTests {
    private CallRecorderForTests() {}

    /** Whether one block the newer engine played was copied for a recording. Nothing is left queued. */
    public static boolean takesAFrame() {
        boolean manual = CallRecorder.manual;
        CallRecorder.manual = true;
        int before = CallRecorder.QUEUE.size();
        AudioTrack track = track(CallMixer.RATE);
        try {
            CallRecorder.modernPlayed(track, ByteBuffer.allocate(960), 960);
            return CallRecorder.QUEUE.size() > before;
        } finally {
            track.release();
            CallRecorder.QUEUE.clear();
            CallRecorder.manual = manual;
        }
    }

    /** Whether a block is copied after the call screen's record button was tapped. The tap is forgotten after. */
    public static boolean takesAFrameAfterATap() {
        try {
            CallRecorder.choose(true);
            return takesAFrame();
        } finally {
            CallRecorder.resetForTests();
        }
    }

    /** Whether the call screen gets a record button, next to a minimize button like Telegram's. */
    public static boolean addsARecordButton() {
        FrameLayout screen = CallRecordButtonTest.screen();
        CallRecordButton.attach(screen);
        return CallRecordButton.find(screen) != null;
    }

    /** A 16-bit mono AudioTrack at [rate], as WebRTC opens one for a call. */
    static AudioTrack track(int rate) {
        return new AudioTrack.Builder()
                .setAudioAttributes(new AudioAttributes.Builder().setUsage(AudioAttributes.USAGE_VOICE_COMMUNICATION).build())
                .setAudioFormat(new AudioFormat.Builder().setSampleRate(rate)
                        .setChannelMask(AudioFormat.CHANNEL_OUT_MONO).setEncoding(AudioFormat.ENCODING_PCM_16BIT).build())
                .setBufferSizeInBytes(3840)
                .setTransferMode(AudioTrack.MODE_STREAM)
                .build();
    }

    /** A 16-bit AudioRecord at [rate] with [channels] channels, as WebRTC opens one for a call. */
    static AudioRecord record(int rate, int channels) {
        return new AudioRecord.Builder()
                .setAudioSource(MediaRecorder.AudioSource.VOICE_COMMUNICATION)
                .setAudioFormat(new AudioFormat.Builder().setSampleRate(rate)
                        .setChannelMask(channels == 2 ? AudioFormat.CHANNEL_IN_STEREO : AudioFormat.CHANNEL_IN_MONO)
                        .setEncoding(AudioFormat.ENCODING_PCM_16BIT).build())
                .setBufferSizeInBytes(3840)
                .build();
    }
}
