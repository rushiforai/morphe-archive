package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ol3 extends p4d implements c55 {
    public final /* synthetic */ int b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ol3(int i, int i2, n92 n92Var) {
        super(i, n92Var);
        this.b = i2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        int i2 = 3;
        switch (i) {
            case 0:
                long j = ((ip8) obj2).a;
                new ol3(i2, 0, (n92) obj3).invokeSuspend(c1eVar);
                return c1eVar;
            case 1:
                ((Number) obj2).floatValue();
                new ol3(i2, 1, (n92) obj3).invokeSuspend(c1eVar);
                return c1eVar;
            case 2:
                ((Number) obj).intValue();
                new ol3(i2, 2, (n92) obj3).invokeSuspend(c1eVar);
                return Boolean.FALSE;
            default:
                long j2 = ((ip8) obj2).a;
                new ol3(i2, i2, (n92) obj3).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                br7.v(obj);
                return c1eVar;
            case 1:
                br7.v(obj);
                return c1eVar;
            case 2:
                br7.v(obj);
                return Boolean.FALSE;
            default:
                br7.v(obj);
                return c1eVar;
        }
    }
}
