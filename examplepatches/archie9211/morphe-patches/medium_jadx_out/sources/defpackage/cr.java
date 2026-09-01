package defpackage;

import android.graphics.PathMeasure;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cr {
    public final PathMeasure a;

    public cr(PathMeasure pathMeasure) {
        this.a = pathMeasure;
    }

    public final void a(float f, float f2, br brVar) {
        this.a.getSegment(f, f2, brVar.a, true);
    }
}
