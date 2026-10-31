package com.fyber.inneractive.sdk.player.exoplayer2.audio;

import b.c0;

/* loaded from: classes3.dex */
public final class n extends Exception {
    /* JADX WARN: Illegal instructions before constructor call */
    public n(int i5, int i11, int i12, int i13) {
        StringBuilder sbT = c0.t(i5, "AudioTrack init failed: ", ", Config(", i11, ", ");
        sbT.append(i12);
        sbT.append(", ");
        sbT.append(i13);
        sbT.append(")");
        super(sbT.toString());
    }
}
