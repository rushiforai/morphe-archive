package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uz3 extends co6 implements x45 {
    public final /* synthetic */ t99 a;
    public final /* synthetic */ long b;
    public final /* synthetic */ long c;
    public final /* synthetic */ vt d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uz3(t99 t99Var, long j, long j2, vt vtVar) {
        super(1);
        this.a = t99Var;
        this.b = j;
        this.c = j2;
        this.d = vtVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        long j = this.b;
        long j2 = this.c;
        ((s99) obj).n(this.a, ((int) (j >> 32)) + ((int) (j2 >> 32)), ((int) (j & 4294967295L)) + ((int) (j2 & 4294967295L)), 0.0f, this.d);
        return c1e.a;
    }
}
