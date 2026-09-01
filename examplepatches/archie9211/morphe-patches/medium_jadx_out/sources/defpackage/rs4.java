package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rs4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ku3 d;
    public final /* synthetic */ List e;
    public final /* synthetic */ String f;
    public final /* synthetic */ String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ rs4(ku3 ku3Var, List list, String str, String str2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ku3Var;
        this.e = list;
        this.f = str;
        this.g = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new rs4(this.d, this.e, this.f, this.g, n92Var, 0);
            default:
                return new rs4(this.d, this.e, this.f, this.g, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((rs4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objB;
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.g;
        String str2 = this.f;
        ku3 ku3Var = this.d;
        List<ps4> list = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    hs8 hs8Var = (hs8) ku3Var.b;
                    ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                    Iterator it2 = list.iterator();
                    while (it2.hasNext()) {
                        arrayList.add(((ps4) it2.next()).a);
                    }
                    this.c = 1;
                    objA = hs8Var.a(arrayList, this);
                    if (objA == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objA = ((bjb) obj).a;
                }
                if (!(objA instanceof ajb)) {
                    for (ps4 ps4Var : list) {
                        ((ax2) ku3Var.c).b(ps4Var.a, str2, gp7.u(ps4Var.b), str);
                    }
                }
                br7.v(objA);
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    hs8 hs8Var2 = (hs8) ku3Var.b;
                    ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
                    Iterator it3 = list.iterator();
                    while (it3.hasNext()) {
                        arrayList2.add(((ps4) it3.next()).a);
                    }
                    this.c = 1;
                    objB = hs8Var2.b(arrayList2, this);
                    if (objB == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                    objB = ((bjb) obj).a;
                }
                if (!(objB instanceof ajb)) {
                    for (ps4 ps4Var2 : list) {
                        ((s26) ku3Var.d).y0(ps4Var2.a, str2, gp7.u(ps4Var2.b), str);
                    }
                }
                br7.v(objB);
                break;
        }
        return c1eVar;
    }
}
