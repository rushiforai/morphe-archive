package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import android.os.Handler;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;

/* loaded from: classes3.dex */
public interface AudioRendererEventListener {

    public static final class EventDispatcher {
        private final Handler handler;
        private final AudioRendererEventListener listener;

        public EventDispatcher(Handler handler, AudioRendererEventListener audioRendererEventListener) {
            if (audioRendererEventListener != null) {
                handler.getClass();
            } else {
                handler = null;
            }
            this.handler = handler;
            this.listener = audioRendererEventListener;
        }

        public void audioSessionId(int i5) {
            if (this.listener != null) {
                this.handler.post(new i(this, i5));
            }
        }

        public void audioTrackUnderrun(int i5, long j11, long j12) {
            if (this.listener != null) {
                this.handler.post(new g(this, i5, j11, j12));
            }
        }

        public void decoderInitialized(String str, long j11, long j12) {
            if (this.listener != null) {
                this.handler.post(new e(this, str, j11, j12));
            }
        }

        public void disabled(DecoderCounters decoderCounters) {
            if (this.listener != null) {
                this.handler.post(new h(this, decoderCounters));
            }
        }

        public void enabled(DecoderCounters decoderCounters) {
            if (this.listener != null) {
                this.handler.post(new d(this, decoderCounters));
            }
        }

        public void inputFormatChanged(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
            if (this.listener != null) {
                this.handler.post(new f(this, oVar));
            }
        }
    }

    void onAudioDecoderInitialized(String str, long j11, long j12);

    void onAudioDisabled(DecoderCounters decoderCounters);

    void onAudioEnabled(DecoderCounters decoderCounters);

    void onAudioInputFormatChanged(com.fyber.inneractive.sdk.player.exoplayer2.o oVar);

    void onAudioSessionId(int i5);

    void onAudioTrackUnderrun(int i5, long j11, long j12);
}
