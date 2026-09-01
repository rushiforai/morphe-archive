package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class um4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ xm4 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ um4(xm4 xm4Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = xm4Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        xm4 xm4Var = this.d;
        switch (i) {
            case 0:
                return new um4(xm4Var, str, n92Var, 0);
            default:
                return new um4(xm4Var, str, n92Var, 1);
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
        return ((um4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xm4 xm4Var = this.d;
                Object value = xm4Var.k.a.getValue();
                value.getClass();
                List list = ((sm4) value).b;
                ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((rm4) it2.next()).a);
                }
                kb2 kb2Var = xm4Var.g;
                lm1 lm1Var = new lm1(xm4Var, arrayList, this.e, null, 3);
                this.c = 1;
                return vx0.m0(kb2Var, lm1Var, this) == tb2Var ? tb2Var : c1eVar;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xm4 xm4Var2 = this.d;
                Object value2 = xm4Var2.k.a.getValue();
                value2.getClass();
                List list2 = ((sm4) value2).b;
                ArrayList arrayList2 = new ArrayList(cu1.k0(list2, 10));
                Iterator it3 = list2.iterator();
                while (it3.hasNext()) {
                    arrayList2.add(((rm4) it3.next()).a);
                }
                Set setQ1 = bu1.q1(arrayList2);
                kb2 kb2Var2 = xm4Var2.g;
                lm1 lm1Var2 = new lm1(xm4Var2, setQ1, this.e, null, 4);
                this.c = 1;
                return vx0.m0(kb2Var2, lm1Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }
}
