package e0;

/* loaded from: classes2.dex */
public final class p0 implements i2.v0 {

    /* renamed from: b, reason: collision with root package name */
    public static final p0 f50093b = new p0(0);

    /* renamed from: c, reason: collision with root package name */
    public static final p0 f50094c = new p0(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50095a;

    public /* synthetic */ p0(int i5) {
        this.f50095a = i5;
    }

    @Override // i2.v0
    public final i2.r0 a(long j11, y3.n nVar, y3.c cVar) {
        switch (this.f50095a) {
            case 0:
                float fMo96roundToPx0680j_4 = cVar.mo96roundToPx0680j_4(a0.f49894a);
                return new i2.j0(new h2.c(0.0f, -fMo96roundToPx0680j_4, Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)) + fMo96roundToPx0680j_4));
            default:
                float fMo96roundToPx0680j_42 = cVar.mo96roundToPx0680j_4(a0.f49894a);
                return new i2.j0(new h2.c(-fMo96roundToPx0680j_42, 0.0f, Float.intBitsToFloat((int) (j11 >> 32)) + fMo96roundToPx0680j_42, Float.intBitsToFloat((int) (j11 & 4294967295L))));
        }
    }
}
