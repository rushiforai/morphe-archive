package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jye implements bo4 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ bo4 b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public jye(zz zzVar, String str, a1a a1aVar, String str2) {
        this.b = zzVar;
        this.c = str;
        this.e = a1aVar;
        this.d = str2;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.e;
        Object obj2 = this.d;
        Object obj3 = this.c;
        bo4 bo4Var = this.b;
        switch (i) {
            case 0:
                Object objB = ((zz) bo4Var).b(new dac(do4Var, (String) obj3, (a1a) obj, (String) obj2, 13), n92Var);
                return objB == tb2.COROUTINE_SUSPENDED ? objB : c1eVar;
            default:
                Object objB2 = ((u50) bo4Var).b(new eh9(do4Var, (h00) obj3, (s33) obj2, (t1f) obj), n92Var);
                return objB2 == tb2.COROUTINE_SUSPENDED ? objB2 : c1eVar;
        }
    }

    public jye(u50 u50Var, h00 h00Var, s33 s33Var, t1f t1fVar) {
        this.b = u50Var;
        this.c = h00Var;
        this.d = s33Var;
        this.e = t1fVar;
    }
}
