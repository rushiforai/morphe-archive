package com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls;

import android.os.SystemClock;
import com.fyber.inneractive.sdk.player.exoplayer2.source.y;

/* loaded from: classes3.dex */
public final class e extends com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b {

    /* renamed from: g, reason: collision with root package name */
    public int f29208g;

    public e(y yVar, int[] iArr) {
        super(yVar, iArr);
        int i5 = 0;
        com.fyber.inneractive.sdk.player.exoplayer2.o oVar = yVar.f30245b[0];
        while (true) {
            if (i5 >= this.f30257b) {
                i5 = -1;
                break;
            } else if (this.f30259d[i5] == oVar) {
                break;
            } else {
                i5++;
            }
        }
        this.f29208g = i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b
    public final int a() {
        return this.f29208g;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b
    public final Object b() {
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b
    public final int c() {
        return 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.trackselection.b
    public final void d() {
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        if (this.f30260e[this.f29208g] > jElapsedRealtime) {
            for (int i5 = this.f30257b - 1; i5 >= 0; i5--) {
                if (this.f30260e[i5] <= jElapsedRealtime) {
                    this.f29208g = i5;
                    return;
                }
            }
            throw new IllegalStateException();
        }
    }
}
