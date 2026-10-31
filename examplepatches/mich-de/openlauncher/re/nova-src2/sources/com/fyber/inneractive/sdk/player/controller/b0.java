package com.fyber.inneractive.sdk.player.controller;

import android.view.Surface;
import com.fyber.inneractive.sdk.player.exoplayer2.decoder.DecoderCounters;
import com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener;
import com.fyber.inneractive.sdk.util.IAlog;
import java.lang.ref.WeakReference;

/* loaded from: classes3.dex */
public final class b0 implements VideoRendererEventListener {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f28885a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f28886b = false;

    public b0(f fVar) {
        this.f28885a = new WeakReference(fVar);
    }

    public final String a() {
        f fVar = (f) this.f28885a.get();
        return fVar == null ? b0.class.getName() : IAlog.a(fVar);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onDroppedFrames(int i5, long j11) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onRenderedFirstFrame(Surface surface) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onVideoDecoderInitialized(String str, long j11, long j12) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onVideoDisabled(DecoderCounters decoderCounters) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onVideoEnabled(DecoderCounters decoderCounters) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onVideoInputFormatChanged(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.video.VideoRendererEventListener
    public final void onVideoSizeChanged(int i5, int i11, int i12, float f11) {
        f fVar = (f) this.f28885a.get();
        if (fVar != null) {
            fVar.f28901t = i5;
            fVar.f28902u = i11;
        }
    }

    public final void a(int i5, boolean z11) {
        com.fyber.inneractive.sdk.player.exoplayer2.g gVar;
        IAlog.a("%sonPlayerStateChanged called with pwr = %s state = %d", a(), Boolean.valueOf(z11), Integer.valueOf(i5));
        f fVar = (f) this.f28885a.get();
        if (fVar == null || (gVar = fVar.f28900s) == null || fVar.f28907z) {
            return;
        }
        if (i5 != 3) {
            if (i5 == 2) {
                if (fVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Playing) {
                    fVar.a(com.fyber.inneractive.sdk.player.enums.b.Buffering);
                    return;
                }
                return;
            } else {
                if (i5 == 4) {
                    fVar.a(com.fyber.inneractive.sdk.player.enums.b.Completed);
                    return;
                }
                return;
            }
        }
        if (!z11) {
            if (fVar.f28926e == com.fyber.inneractive.sdk.player.enums.b.Preparing) {
                com.fyber.inneractive.sdk.player.exoplayer2.trackselection.h hVar = gVar.o;
                if (hVar != null && hVar.f30265a > 0) {
                    com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b bVar = hVar.f30266b[0];
                    com.fyber.inneractive.sdk.player.exoplayer2.o oVar = bVar == null ? null : bVar.f30259d[bVar.a()];
                    if (oVar != null) {
                        int i11 = oVar.f30132j;
                        int i12 = oVar.f30133k;
                        fVar.f28901t = i11;
                        fVar.f28902u = i12;
                    }
                }
                this.f28886b = true;
                fVar.a(com.fyber.inneractive.sdk.player.enums.b.Prepared);
                return;
            }
            return;
        }
        fVar.a(com.fyber.inneractive.sdk.player.enums.b.Playing);
    }
}
