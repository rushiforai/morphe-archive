package defpackage;

import android.text.SegmentFinder;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zy extends SegmentFinder {
    public final /* synthetic */ d2f a;

    public zy(d2f d2fVar) {
        this.a = d2fVar;
    }

    public final int nextEndBoundary(int i) {
        return this.a.i0(i);
    }

    public final int nextStartBoundary(int i) {
        return this.a.W(i);
    }

    public final int previousEndBoundary(int i) {
        return this.a.Y(i);
    }

    public final int previousStartBoundary(int i) {
        return this.a.h0(i);
    }
}
