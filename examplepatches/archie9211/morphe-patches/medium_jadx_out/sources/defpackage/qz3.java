package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qz3 extends co6 implements x45 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ m45 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qz3(boolean z, m45 m45Var) {
        super(1);
        this.a = z;
        this.b = m45Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        ((tjb) obj).e(!this.a && ((Boolean) this.b.invoke()).booleanValue());
        return c1e.a;
    }
}
