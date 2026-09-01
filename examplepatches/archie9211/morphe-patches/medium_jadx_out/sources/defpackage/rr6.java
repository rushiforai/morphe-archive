package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rr6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;

    public /* synthetic */ rr6(int i, Collection collection) {
        this.a = 4;
        this.b = i;
        this.c = collection;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i;
        int i2 = this.a;
        c1e c1eVar = c1e.a;
        int i3 = 0;
        Object obj2 = this.c;
        int i4 = this.b;
        switch (i2) {
            case 0:
                eu6 eu6Var = (eu6) obj;
                d03 d03Var = ((ur6) obj2).a;
                oic oicVarA = vn7.A();
                vn7.T(oicVarA, vn7.G(oicVarA), oicVarA != null ? oicVarA.e() : null);
                d03Var.getClass();
                int i5 = eu6Var.a;
                i = i5 != -1 ? i5 : 2;
                while (i3 < i) {
                    eu6Var.a(i4 + i3);
                    i3++;
                }
                return c1eVar;
            case 1:
                eu6 eu6Var2 = (eu6) obj;
                d03 d03Var2 = ((kv6) obj2).a;
                oic oicVarA2 = vn7.A();
                vn7.T(oicVarA2, vn7.G(oicVarA2), oicVarA2 != null ? oicVarA2.e() : null);
                d03Var2.getClass();
                int i6 = eu6Var2.a;
                i = i6 != -1 ? i6 : 2;
                while (i3 < i) {
                    eu6Var2.a(i4 + i3);
                    i3++;
                }
                return c1eVar;
            case 2:
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                List list = ((su9) obj2).c;
                xu6Var.l0(list.size(), new dy4(new jd3(i4, 1), 19, list), new re(list, 28), new mz1(new zi9(i3, list), true, 2039820996));
                return c1eVar;
            case 3:
                ArrayList arrayList = (ArrayList) obj2;
                s99 s99Var = (s99) obj;
                int size = arrayList.size();
                for (int i7 = 0; i7 < size; i7++) {
                    t99 t99Var = (t99) arrayList.get(i7);
                    s99.j(s99Var, t99Var, 0, (i4 - t99Var.b) / 2);
                }
                return c1eVar;
            default:
                return Boolean.valueOf(((List) obj).addAll(i4, (Collection) obj2));
        }
    }

    public /* synthetic */ rr6(int i, int i2, Object obj) {
        this.a = i2;
        this.c = obj;
        this.b = i;
    }
}
