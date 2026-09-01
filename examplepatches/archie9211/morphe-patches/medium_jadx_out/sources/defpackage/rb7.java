package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rb7 extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rb7(int i, int i2, Object obj) {
        super(1);
        this.a = i2;
        this.b = obj;
        this.c = i;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf(((ub7) obj2).g(i2, ((Number) obj).longValue()));
            case 1:
                return Boolean.valueOf(((ub7) obj2).g(i2, ((Number) obj).longValue()));
            default:
                Boolean boolValueOf = Boolean.valueOf(((es4) obj).P0(i2));
                ((rya) obj2).a = boolValueOf;
                return boolValueOf;
        }
    }
}
