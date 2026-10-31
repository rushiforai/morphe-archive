package com.facebook.ads.redexgen.X;

import android.media.AudioTrack;
import android.media.AudioTrack$StreamEventCallback;
import android.os.Handler;
import android.os.Looper;
import java.util.Objects;

/* loaded from: assets/audience_network/classes.dex */
public final class RD {
    public final AudioTrack$StreamEventCallback A00;
    public final Handler A01 = new Handler(Looper.myLooper());
    public final /* synthetic */ SI A02;

    public RD(SI si2) {
        this.A02 = si2;
        this.A00 = new RC(this, si2);
    }

    public final void A00(AudioTrack audioTrack) {
        Handler handler = this.A01;
        Objects.requireNonNull(handler);
        audioTrack.registerStreamEventCallback(new ExecutorC0977Ib(handler), this.A00);
    }

    public final void A01(AudioTrack audioTrack) {
        audioTrack.unregisterStreamEventCallback(this.A00);
        this.A01.removeCallbacksAndMessages(null);
    }
}
