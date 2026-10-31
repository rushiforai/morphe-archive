package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import java.io.IOException;

/* loaded from: classes3.dex */
public final class a0 extends IOException {
    public a0(Throwable th2) {
        super("Unexpected " + th2.getClass().getSimpleName() + ": " + th2.getMessage(), th2);
    }
}
