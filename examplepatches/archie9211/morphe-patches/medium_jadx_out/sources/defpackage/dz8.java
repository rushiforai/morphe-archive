package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dz8 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ gz8 d;
    public final /* synthetic */ int e;
    public final /* synthetic */ float f;
    public final /* synthetic */ ww g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dz8(gz8 gz8Var, int i, float f, ww wwVar, n92 n92Var) {
        super(2, n92Var);
        this.d = gz8Var;
        this.e = i;
        this.f = f;
        this.g = wwVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        dz8 dz8Var = new dz8(this.d, this.e, this.f, this.g, n92Var);
        dz8Var.c = obj;
        return dz8Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((dz8) create((xrb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i2 = this.b;
        c1e c1eVar = c1e.a;
        int i3 = 1;
        if (i2 != 0) {
            if (i2 == 1) {
                br7.v(obj);
                return c1eVar;
            }
            ygf.f("call to 'resume' before 'invoke' with coroutine");
            return null;
        }
        br7.v(obj);
        xrb xrbVar = (xrb) this.c;
        gz8 gz8Var = this.d;
        fv6 fv6Var = new fv6(xrbVar, gz8Var, i3);
        this.b = 1;
        iz8 iz8Var = jz8.a;
        int i4 = this.e;
        gz8Var.q.h(gz8Var.j(new Integer(i4).intValue()));
        boolean z = i4 > gz8Var.e;
        int iE = (fv6Var.e() - gz8Var.e) + 1;
        if (((z && i4 > fv6Var.e()) || (!z && i4 < gz8Var.e)) && Math.abs(i4 - gz8Var.e) >= 3) {
            if (z) {
                i = i4 - iE;
                int i5 = gz8Var.e;
                if (i < i5) {
                    i = i5;
                }
            } else {
                int i6 = iE + i4;
                i = gz8Var.e;
                if (i6 <= i) {
                    i = i6;
                }
            }
            fv6Var.f(i, 0);
        }
        Object objK = tr7.k(0.0f, fv6Var.b(i4) + this.f, this.g, new sn8(new oya(), 2, fv6Var), this, 4);
        if (objK != tb2Var) {
            objK = c1eVar;
        }
        return objK == tb2Var ? tb2Var : c1eVar;
    }
}
