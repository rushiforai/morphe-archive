package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class km2 extends gsa {
    @Override // defpackage.gsa
    public final void f0(j4c j4cVar, float f, float f2) {
        float f3 = f2 * f;
        j4cVar.d(f3, 180.0f, 90.0f);
        double d = f3;
        j4cVar.c((float) (Math.sin(Math.toRadians(90.0d)) * d), (float) (Math.sin(Math.toRadians(0.0d)) * d));
    }
}
