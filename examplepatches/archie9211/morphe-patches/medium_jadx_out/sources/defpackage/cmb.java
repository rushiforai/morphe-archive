package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cmb extends gsa {
    @Override // defpackage.gsa
    public final void f0(j4c j4cVar, float f, float f2) {
        float f3 = f2 * f;
        j4cVar.d(f3, 180.0f, 90.0f);
        float f4 = f3 * 2.0f;
        f4c f4cVar = new f4c(0.0f, 0.0f, f4, f4);
        f4cVar.f = 180.0f;
        f4cVar.g = 90.0f;
        j4cVar.f.add(f4cVar);
        d4c d4cVar = new d4c(f4cVar);
        j4cVar.a(180.0f);
        j4cVar.g.add(d4cVar);
        j4cVar.d = 270.0f;
        float f5 = (0.0f + f4) * 0.5f;
        float f6 = (f4 - 0.0f) / 2.0f;
        j4cVar.b = (((float) Math.cos(Math.toRadians(270.0d))) * f6) + f5;
        j4cVar.c = (f6 * ((float) Math.sin(Math.toRadians(270.0d)))) + f5;
    }
}
