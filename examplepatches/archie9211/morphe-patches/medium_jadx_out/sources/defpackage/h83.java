package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class h83 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ h83(kff kffVar, int i, stc stcVar, sh9 sh9Var) {
        this.a = 4;
        this.c = kffVar;
        this.b = i;
        this.d = stcVar;
        this.e = sh9Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i;
        int i2 = this.a;
        int i3 = this.b;
        int i4 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.e;
        Object obj3 = this.d;
        Object obj4 = this.c;
        switch (i2) {
            case 0:
                p46 p46Var = (p46) obj3;
                t68 t68Var = (t68) obj2;
                if (obj == ((j83) obj4)) {
                    ygf.f("A derived state calculation cannot read itself");
                    return null;
                }
                if (obj instanceof dqc) {
                    int i5 = p46Var.a - i3;
                    int iD = t68Var.d(obj);
                    t68Var.g(Math.min(i5, iD >= 0 ? t68Var.c[iD] : Integer.MAX_VALUE), obj);
                }
                return c1eVar;
            case 1:
                mr5 mr5Var = (mr5) obj4;
                bl7 bl7Var = (bl7) obj3;
                t99 t99Var = (t99) obj2;
                s99 s99Var = (s99) obj;
                int i6 = mr5Var.c;
                eid eidVar = mr5Var.b;
                prd prdVar = mr5Var.d;
                rjd rjdVar = (rjd) mr5Var.e.invoke();
                eidVar.a(hw8.Horizontal, er7.y(s99Var, i6, prdVar, rjdVar != null ? rjdVar.a : null, bl7Var.getLayoutDirection() == ip6.Rtl, t99Var.a), i3, t99Var.a);
                s99.j(s99Var, t99Var, Math.round(-eidVar.a.g()), 0);
                return c1eVar;
            case 2:
                t99[] t99VarArr = (t99[]) obj4;
                omb ombVar = (omb) obj3;
                int[] iArr = (int[]) obj2;
                s99 s99Var2 = (s99) obj;
                int length = t99VarArr.length;
                int i7 = 0;
                while (i4 < length) {
                    t99 t99Var2 = t99VarArr[i4];
                    int i8 = i7 + 1;
                    t99Var2.getClass();
                    Object objW = t99Var2.w();
                    mmb mmbVar = objW instanceof mmb ? (mmb) objW : null;
                    bo boVar = mmbVar != null ? mmbVar.c : null;
                    s99Var2.g(t99Var2, iArr[i7], boVar != null ? boVar.y(i3, t99Var2.b, ip6.Ltr) : ombVar.b.a(t99Var2.b, i3), 0.0f);
                    i4++;
                    i7 = i8;
                }
                return c1eVar;
            case 3:
                ArrayList arrayList = (ArrayList) obj4;
                lvc lvcVar = (lvc) obj3;
                f72 f72Var = (f72) obj2;
                s99 s99Var3 = (s99) obj;
                s99Var3.getClass();
                int i9 = 0;
                int i10 = 0;
                for (Object obj5 : arrayList) {
                    int i11 = i9 + 1;
                    if (i9 < 0) {
                        d46.i0();
                        throw null;
                    }
                    t99 t99Var3 = (t99) obj5;
                    s99.j(s99Var3, t99Var3, 0, i10);
                    i10 += t99Var3.b;
                    if (i9 < arrayList.size() - 1) {
                        tk7 tk7Var = (tk7) bu1.z0(lvcVar.x(new mz1(new n2c(3), true, 156920901), b09.w(i9, "divider")));
                        int i12 = this.b;
                        if (tk7Var != null) {
                            i = i12;
                            s99.j(s99Var3, tk7Var.s(f72.a(f72Var.a, 0, 0, i, i12, 3)), 0, i10);
                        } else {
                            i = i12;
                        }
                        i10 += i;
                    }
                    i9 = i11;
                }
                return c1eVar;
            default:
                kff kffVar = (kff) obj4;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                List list = kffVar.a;
                xu6Var.l0(list.size(), new j8e(new n2c(23), 11, list), new lba(list, 27), new mz1(new jhe(list, this.b, kffVar, (stc) obj3, (sh9) obj2, 1), true, 2039820996));
                if (kffVar.c) {
                    ev6.l(xu6Var, 5, new f8f(9), g01.o, 4);
                }
                return c1eVar;
        }
    }

    public /* synthetic */ h83(int i, int i2, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.b = i;
    }

    public /* synthetic */ h83(t99[] t99VarArr, omb ombVar, int i, int[] iArr) {
        this.a = 2;
        this.c = t99VarArr;
        this.d = ombVar;
        this.b = i;
        this.e = iArr;
    }
}
