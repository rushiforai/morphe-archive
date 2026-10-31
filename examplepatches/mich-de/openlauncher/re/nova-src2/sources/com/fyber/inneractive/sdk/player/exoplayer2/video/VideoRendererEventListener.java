package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.os.Handler;
import android.view.Surface;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;

/* loaded from: classes3.dex */
public interface VideoRendererEventListener {

    public static final class EventDispatcher {
        private final Handler handler;
        private final VideoRendererEventListener listener;

        public EventDispatcher(Handler handler, VideoRendererEventListener videoRendererEventListener) {
            if (videoRendererEventListener != null) {
                handler.getClass();
            } else {
                handler = null;
            }
            this.handler = handler;
            this.listener = videoRendererEventListener;
        }

        public void decoderInitialized(String str, long j11, long j12) {
            if (this.listener != null) {
                this.handler.post(new j(this, str, j11, j12));
            }
        }

        public void disabled(DecoderCounters decoderCounters) {
            if (this.listener != null) {
                this.handler.post(new o(this, decoderCounters));
            }
        }

        public void droppedFrames(int i5, long j11) {
            if (this.listener != null) {
                this.handler.post(new l(this, i5, j11));
            }
        }

        public void enabled(DecoderCounters decoderCounters) {
            if (this.listener != null) {
                this.handler.post(new i(this, decoderCounters));
            }
        }

        public void inputFormatChanged(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
            if (this.listener != null) {
                this.handler.post(new k(this, oVar));
            }
        }

        public void renderedFirstFrame(Surface surface) {
            if (this.listener != null) {
                this.handler.post(new n(this, surface));
            }
        }

        public void videoSizeChanged(int i5, int i11, int i12, float f11) {
            if (this.listener != null) {
                this.handler.post(new m(this, i5, i11, i12, f11));
            }
        }
    }

    void onDroppedFrames(int i5, long j11);

    void onRenderedFirstFrame(Surface surface);

    void onVideoDecoderInitialized(String str, long j11, long j12);

    void onVideoDisabled(DecoderCounters decoderCounters);

    void onVideoEnabled(DecoderCounters decoderCounters);

    void onVideoInputFormatChanged(com.fyber.inneractive.sdk.player.exoplayer2.o oVar);

    void onVideoSizeChanged(int i5, int i11, int i12, float f11);
}
