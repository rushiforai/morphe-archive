package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z68 extends uib implements b55 {
    public u75 c;
    public a78 d;
    public long[] e;
    public int f;
    public int g;
    public /* synthetic */ Object h;
    public final /* synthetic */ a78 i;
    public final /* synthetic */ u75 j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z68(a78 a78Var, u75 u75Var, n92 n92Var) {
        super(2, n92Var);
        this.i = a78Var;
        this.j = u75Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        z68 z68Var = new z68(this.i, this.j, n92Var);
        z68Var.h = obj;
        return z68Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((z68) create((nzb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        a78 a78Var;
        long[] jArr;
        int i;
        u75 u75Var;
        nzb nzbVar;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.g;
        if (i2 == 0) {
            br7.v(obj);
            nzb nzbVar2 = (nzb) this.h;
            a78Var = this.i;
            y68 y68Var = a78Var.b;
            jArr = y68Var.c;
            i = y68Var.e;
            u75Var = this.j;
            nzbVar = nzbVar2;
        } else {
            if (i2 != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            int i3 = this.f;
            long[] jArr2 = this.e;
            a78 a78Var2 = this.d;
            u75Var = this.c;
            nzbVar = (nzb) this.h;
            br7.v(obj);
            i = i3;
            a78Var = a78Var2;
            jArr = jArr2;
        }
        while (i != Integer.MAX_VALUE) {
            int i4 = (int) ((jArr[i] >> 31) & 2147483647L);
            u75Var.b = i;
            Object obj2 = a78Var.b.b[i];
            this.h = nzbVar;
            this.c = u75Var;
            this.d = a78Var;
            this.e = jArr;
            this.f = i4;
            this.g = 1;
            if (nzbVar.b(this, obj2) == tb2Var) {
                return tb2Var;
            }
            i = i4;
        }
        return c1e.a;
    }
}
