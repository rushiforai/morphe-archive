package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.exoplayer.drm.DrmSessionEventListener;
import java.util.concurrent.CopyOnWriteArrayList;

/* renamed from: com.facebook.ads.redexgen.X.Rp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1207Rp {
    public final int A00;
    public final C1202Rk A01;
    public final CopyOnWriteArrayList<DrmSessionEventListener.EventDispatcher.ListenerAndHandler> A02;

    public C1207Rp() {
        this(new CopyOnWriteArrayList(), 0, null);
    }

    public C1207Rp(CopyOnWriteArrayList<DrmSessionEventListener.EventDispatcher.ListenerAndHandler> listenerAndHandlers, int i5, C1202Rk c1202Rk) {
        this.A02 = listenerAndHandlers;
        this.A00 = i5;
        this.A01 = c1202Rk;
    }

    public final C1207Rp A00(int i5, C1202Rk c1202Rk) {
        return new C1207Rp(this.A02, i5, c1202Rk);
    }
}
