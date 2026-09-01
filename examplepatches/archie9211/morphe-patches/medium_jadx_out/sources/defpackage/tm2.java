package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tm2 extends s42 {
    public final /* synthetic */ int o;
    public final /* synthetic */ Object p;
    public final /* synthetic */ Serializable q;

    public tm2(x45 x45Var, rya ryaVar) {
        this.o = 1;
        this.q = ryaVar;
        this.p = x45Var;
    }

    @Override // defpackage.s42
    public void H(Object obj) {
        switch (this.o) {
            case 1:
                f41 f41Var = (f41) obj;
                f41Var.getClass();
                rya ryaVar = (rya) this.q;
                if (ryaVar.a == null && ((Boolean) ((x45) this.p).invoke(f41Var)).booleanValue()) {
                    ryaVar.a = f41Var;
                    break;
                }
                break;
        }
    }

    @Override // defpackage.s42
    public final boolean J(Object obj) {
        int i = this.o;
        Object obj2 = this.p;
        Object obj3 = this.q;
        switch (i) {
            case 0:
                boolean[] zArr = (boolean[]) obj3;
                if (((Boolean) ((x45) obj2).invoke(obj)).booleanValue()) {
                    zArr[0] = true;
                }
                break;
            case 1:
                ((f41) obj).getClass();
                if (((rya) obj3).a == null) {
                }
                break;
            default:
                y28 y28Var = (y28) obj;
                rya ryaVar = (rya) obj3;
                y28Var.getClass();
                String str = (String) obj2;
                String str2 = s96.a;
                mn1 mn1VarG = s96.g(f93.g(y28Var).a);
                String strR = ev6.r('.', mn1VarG != null ? te6.e(mn1VarG) : hlg.t(y28Var, wz7.i), str);
                if (re6.b.contains(strR)) {
                    ryaVar.a = me6.HIDDEN;
                } else if (re6.d.contains(strR)) {
                    ryaVar.a = me6.VISIBLE;
                } else if (re6.c.contains(strR)) {
                    ryaVar.a = me6.DEPRECATED_LIST_METHODS;
                } else if (re6.a.contains(strR)) {
                    ryaVar.a = me6.DROP;
                }
                if (ryaVar.a == null) {
                }
                break;
        }
        return true;
    }

    @Override // defpackage.s42
    public final Object h0() {
        int i = this.o;
        Object obj = this.q;
        switch (i) {
            case 0:
                return Boolean.valueOf(((boolean[]) obj)[0]);
            case 1:
                return (f41) ((rya) obj).a;
            default:
                me6 me6Var = (me6) ((rya) obj).a;
                return me6Var == null ? me6.NOT_CONSIDERED : me6Var;
        }
    }

    public /* synthetic */ tm2(Object obj, Serializable serializable, int i) {
        this.o = i;
        this.p = obj;
        this.q = serializable;
    }
}
