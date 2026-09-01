package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jp7 {
    public static final jp7 a = new jp7();

    public static ip7 a(x12 x12Var) {
        Context context = (Context) ((p65) x12Var).j(eo.b);
        context.getClass();
        float f = r1.widthPixels / context.getResources().getDisplayMetrics().density;
        return vj3.a(f, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED;
    }
}
