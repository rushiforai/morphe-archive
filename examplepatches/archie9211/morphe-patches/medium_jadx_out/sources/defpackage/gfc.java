package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gfc extends co6 implements x45 {
    public final /* synthetic */ long a;
    public final /* synthetic */ int b;
    public final /* synthetic */ int c;
    public final /* synthetic */ bl7 d;
    public final /* synthetic */ t99 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gfc(hfc hfcVar, long j, int i, int i2, bl7 bl7Var, t99 t99Var) {
        super(1);
        this.a = j;
        this.b = i;
        this.c = i2;
        this.d = bl7Var;
        this.e = t99Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        s99 s99Var = (s99) obj;
        long j = (((long) this.b) << 32) | (((long) this.c) & 4294967295L);
        ip6 layoutDirection = this.d.getLayoutDirection();
        long j2 = this.a;
        float f = (((int) (j >> 32)) - ((int) (j2 >> 32))) / 2.0f;
        float f2 = (((int) (j & 4294967295L)) - ((int) (j2 & 4294967295L))) / 2.0f;
        float f3 = layoutDirection == ip6.Ltr ? -1.0f : (-1.0f) * (-1.0f);
        float f4 = (1.0f - 1.0f) * f2;
        int iRound = Math.round((f3 + 1.0f) * f);
        s99.i(s99Var, this.e, (((long) Math.round(f4)) & 4294967295L) | (((long) iRound) << 32));
        return c1e.a;
    }
}
