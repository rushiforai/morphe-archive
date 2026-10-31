package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a extends c {
    public final long R0;
    public final ArrayList S0;
    public final ArrayList T0;

    public a(int i5, long j11) {
        super(i5);
        this.R0 = j11;
        this.S0 = new ArrayList();
        this.T0 = new ArrayList();
    }

    public final a b(int i5) {
        int size = this.T0.size();
        for (int i11 = 0; i11 < size; i11++) {
            a aVar = (a) this.T0.get(i11);
            if (aVar.f29511a == i5) {
                return aVar;
            }
        }
        return null;
    }

    public final b c(int i5) {
        int size = this.S0.size();
        for (int i11 = 0; i11 < size; i11++) {
            b bVar = (b) this.S0.get(i11);
            if (bVar.f29511a == i5) {
                return bVar;
            }
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4.c
    public final String toString() {
        return c.a(this.f29511a) + " leaves: " + Arrays.toString(this.S0.toArray()) + " containers: " + Arrays.toString(this.T0.toArray());
    }
}
