// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;

import android.content.Context;
import android.media.AudioAttributes;
import android.media.AudioFocusRequest;
import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

/** A visible, matching Live session borrows focus; Android restores the music on release. */
final class LiveAudioFocus {
    private final AudioManager audio;
    private final Handler main = new Handler(Looper.getMainLooper());
    private AudioFocusRequest request;
    private boolean active, closed;
    private int generation;
    private String status = "IDLE";

    LiveAudioFocus(Context context) {
        AudioManager service;
        try {
            service = (AudioManager) context.getApplicationContext().getSystemService(Context.AUDIO_SERVICE);
        } catch (RuntimeException unavailable) {
            service = null;
        }
        audio = service;
    }

    static boolean needsFocus(String state, String microphone) {
        if (!"MIC_OPEN".equals(microphone)) return false;
        return "STARTING".equals(state) || "LISTENING".equals(state)
                || "TRANSCRIBING".equals(state) || "PROCESSING".equals(state)
                || "SPEAKING".equals(state);
    }

    void update(String state, String microphone) {
        if (closed) return;
        if (!needsFocus(state, microphone)) {
            active = false;
            release("INACTIVE");
            return;
        }
        // One attempt per active episode. No periodic focus stealing after a call or denial.
        if (active) return;
        active = true;
        if (audio == null) { report("UNAVAILABLE"); return; }
        final int ticket = ++generation;
        try {
            request = new AudioFocusRequest.Builder(AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK)
                    .setAudioAttributes(new AudioAttributes.Builder()
                            .setUsage(AudioAttributes.USAGE_ASSISTANT)
                            .setContentType(AudioAttributes.CONTENT_TYPE_SPEECH).build())
                    .setAcceptsDelayedFocusGain(false)
                    .setOnAudioFocusChangeListener(change -> focusChanged(ticket, change), main)
                    .build();
            int result = audio.requestAudioFocus(request);
            if (result == AudioManager.AUDIOFOCUS_REQUEST_GRANTED) report("GRANTED");
            else release("DENIED");
        } catch (RuntimeException unavailable) {
            // Also abandon a request if the service failed after registering it.
            release("UNAVAILABLE");
        }
    }

    private void focusChanged(int ticket, int change) {
        if (closed || request == null || ticket != generation) return;
        if (change == AudioManager.AUDIOFOCUS_GAIN) report("GRANTED");
        else if (change == AudioManager.AUDIOFOCUS_LOSS
                || change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT
                || change == AudioManager.AUDIOFOCUS_LOSS_TRANSIENT_CAN_DUCK) release("LOST");
    }

    private void release(String reason) {
        AudioFocusRequest previous = request;
        request = null;
        ++generation; // Any already queued callback belongs to the old lease.
        if (previous != null) {
            try { audio.abandonAudioFocusRequest(previous); }
            catch (RuntimeException unavailable) { report("RELEASE_UNAVAILABLE"); return; }
        }
        if (previous != null || !"INACTIVE".equals(reason)) report(reason);
    }

    void close() {
        if (closed) return;
        closed = true;
        active = false;
        release("CLOSED");
    }

    String status() { return status; }

    private void report(String value) {
        if (!status.equals(value)) {
            status = value;
            Log.i("GsaLiveAudio", "focus=" + value);
        }
    }
}
