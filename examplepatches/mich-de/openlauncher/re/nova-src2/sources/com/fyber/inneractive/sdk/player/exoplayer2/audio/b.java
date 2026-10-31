package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import b.c0;

/* loaded from: classes3.dex */
public final class b extends Exception {
    /* JADX WARN: Illegal instructions before constructor call */
    public b(int i5, int i11, int i12) {
        StringBuilder sbT = c0.t(i5, "Unhandled format: ", " Hz, ", i11, " channels in encoding ");
        sbT.append(i12);
        super(sbT.toString());
    }
}
