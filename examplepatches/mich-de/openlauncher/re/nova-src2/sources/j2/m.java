package j2;

/* loaded from: classes.dex */
public final /* synthetic */ class m implements i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68699a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f68700b;

    public /* synthetic */ m(q qVar, int i5) {
        this.f68699a = i5;
        this.f68700b = qVar;
    }

    @Override // j2.i
    public final double b(double d5) {
        switch (this.f68699a) {
            case 0:
                return kotlin.ranges.a.c0(this.f68700b.f68715k.b(d5), r10.f68709e, r10.f68710f);
            default:
                return this.f68700b.n.b(kotlin.ranges.a.c0(d5, r0.f68709e, r0.f68710f));
        }
    }
}
