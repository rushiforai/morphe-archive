package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class zj1 extends yj1 {
    public final /* synthetic */ int d;
    public final Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zj1(Object obj, ib2 ib2Var, int i, nz0 nz0Var, int i2) {
        super(ib2Var, i, nz0Var);
        this.d = i2;
        this.e = obj;
    }

    @Override // defpackage.yj1
    public Object e(l2a l2aVar, n92 n92Var) {
        int i = this.d;
        c1e c1eVar = c1e.a;
        Object obj = this.e;
        switch (i) {
            case 0:
                Object objInvoke = ((b55) obj).invoke(l2aVar, n92Var);
                return objInvoke == tb2.COROUTINE_SUSPENDED ? objInvoke : c1eVar;
            default:
                hzb hzbVar = new hzb(l2aVar);
                Iterator it2 = ((Iterable) obj).iterator();
                while (it2.hasNext()) {
                    vx0.c0(l2aVar, null, null, new r91((bo4) it2.next(), hzbVar, null, 6), 3);
                }
                return c1eVar;
        }
    }

    @Override // defpackage.yj1
    public yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        int i2 = this.d;
        Object obj = this.e;
        switch (i2) {
            case 0:
                return new zj1((b55) obj, ib2Var, i, nz0Var, 0);
            default:
                return new zj1((Iterable) obj, ib2Var, i, nz0Var, 1);
        }
    }

    @Override // defpackage.yj1
    public wj1 j(sb2 sb2Var) {
        switch (this.d) {
            case 1:
                r91 r91Var = new r91(this, (n92) null, 4);
                nz0 nz0Var = nz0.SUSPEND;
                wb2 wb2Var = wb2.DEFAULT;
                l2a l2aVar = new l2a(guc.Q(sb2Var, this.a), pwd.e(this.b, 4, nz0Var));
                wb2Var.invoke(r91Var, l2aVar, l2aVar);
                return l2aVar;
            default:
                return super.j(sb2Var);
        }
    }

    @Override // defpackage.yj1
    public String toString() {
        switch (this.d) {
            case 0:
                return "block[" + ((b55) this.e) + "] -> " + super.toString();
            default:
                return super.toString();
        }
    }
}
