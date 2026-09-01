package defpackage;

import com.medium.android.graphql.fragment.CatalogDetailData;
import com.medium.android.graphql.type.CatalogType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zc1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ id1 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zc1(id1 id1Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = id1Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        id1 id1Var = this.d;
        switch (i) {
            case 0:
                return new zc1(id1Var, str, n92Var, 0);
            case 1:
                return new zc1(id1Var, str, n92Var, 1);
            default:
                return new zc1(id1Var, str, n92Var, 2);
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
        return ((zc1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        lj3 lj3Var;
        Integer num;
        int i = this.b;
        String str = this.e;
        id1 id1Var = this.d;
        c1e c1eVar = c1e.a;
        Object obj2 = null;
        switch (i) {
            case 0:
                r6c r6cVar = id1Var.L;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 != 1) {
                        if (i2 == 2) {
                            br7.v(obj);
                            objA = obj;
                        } else if (i2 != 3) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                    }
                    br7.v(obj);
                    return c1eVar;
                }
                br7.v(obj);
                if (id1Var.F) {
                    this.c = 1;
                    if (r6cVar.a(za1.a, this) != tb2Var) {
                        return c1eVar;
                    }
                } else {
                    n53 n53Var = id1Var.n;
                    CatalogDetailData catalogDetailData = id1Var.E;
                    if (catalogDetailData == null) {
                        g76.g0("catalogDetailData");
                        throw null;
                    }
                    String id = catalogDetailData.getId();
                    CatalogDetailData catalogDetailData2 = id1Var.E;
                    if (catalogDetailData2 == null) {
                        g76.g0("catalogDetailData");
                        throw null;
                    }
                    String version = catalogDetailData2.getCatalogSummaryData().getVersion();
                    CatalogDetailData catalogDetailData3 = id1Var.E;
                    if (catalogDetailData3 == null) {
                        g76.g0("catalogDetailData");
                        throw null;
                    }
                    CatalogType type = catalogDetailData3.getCatalogSummaryData().getType();
                    List listQ = d46.Q(str);
                    this.c = 2;
                    objA = n53Var.a(id, version, type, null, listQ, this);
                    if (objA != tb2Var) {
                    }
                }
                return tb2Var;
                cp3 cp3Var = (cp3) objA;
                if (cp3Var instanceof bp3) {
                    id1Var.o(((bp3) cp3Var).a);
                    return c1eVar;
                }
                qb1 qb1Var = new qb1(str);
                this.c = 3;
                if (r6cVar.a(qb1Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                vob vobVar = id1Var.z;
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
                Boolean bool = (Boolean) vobVar.a("key_on_max_posts_downloaded_shown");
                if ((bool != null ? bool.booleanValue() : false) || !((Boolean) id1Var.T.a.getValue()).booleanValue()) {
                    return c1eVar;
                }
                Object value = id1Var.U.a.getValue();
                gc1 gc1Var = value instanceof gc1 ? (gc1) value : null;
                if (gc1Var == null) {
                    return c1eVar;
                }
                az5 az5Var = gc1Var.k;
                ArrayList arrayList = new ArrayList();
                for (Object obj3 : az5Var) {
                    if (obj3 instanceof dc1) {
                        arrayList.add(obj3);
                    }
                }
                Iterator it2 = arrayList.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        Object next = it2.next();
                        if (((dc1) next).c.a.equals(str)) {
                            obj2 = next;
                        }
                    }
                }
                dc1 dc1Var = (dc1) obj2;
                if (dc1Var == null || (lj3Var = dc1Var.c.y) == null || lj3Var != lj3.NOT_DOWNLOADED || (num = id1Var.G) == null || num.intValue() < 100 || !g76.L(id1Var.H, lg1.a)) {
                    return c1eVar;
                }
                vobVar.d("key_on_max_posts_downloaded_shown", Boolean.TRUE);
                xpc xpcVar = id1Var.P;
                this.c = 1;
                xpcVar.a(ha1.a, this);
                return c1eVar == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                this.c = 1;
                Object objB = id1Var.d.F(str).b(new fd1(id1Var), this);
                if (objB != tb2Var3) {
                    objB = c1eVar;
                }
                return objB == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
