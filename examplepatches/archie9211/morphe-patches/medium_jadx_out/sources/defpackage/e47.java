package defpackage;

import com.medium.android.graphql.fragment.EntityCatalogsConnectionData;
import com.medium.android.graphql.type.CatalogType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e47 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ x47 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e47(x47 x47Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = x47Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        x47 x47Var = this.d;
        switch (i) {
            case 0:
                return new e47(x47Var, n92Var, 0);
            case 1:
                return new e47(x47Var, n92Var, 1);
            case 2:
                return new e47(x47Var, n92Var, 2);
            default:
                return new e47(x47Var, n92Var, 3);
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
        return ((e47) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objN;
        Object objN2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        x47 x47Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    qi1 qi1Var = x47Var.d;
                    CatalogType catalogType = CatalogType.LISTS;
                    ud1 ud1Var = x47Var.b;
                    yd4 yd4Var = yd4.NetworkFirst;
                    this.c = 1;
                    objN = qi1Var.n(catalogType, ud1Var, yd4Var, this);
                    if (objN == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objN = ((bjb) obj).a;
                }
                if (!(objN instanceof ajb)) {
                    x47Var.s = (EntityCatalogsConnectionData) objN;
                }
                Throwable thB = bjb.b(objN);
                if (thB == null) {
                    return c1eVar;
                }
                wld.a.e(thB, "Fetch catalog item connection data failed", new Object[0]);
                return c1eVar;
            case 1:
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
                r6c r6cVar = x47Var.q;
                f47 f47Var = f47.a;
                this.c = 1;
                return r6cVar.a(f47Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
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
                r6c r6cVar2 = x47Var.q;
                f47 f47Var2 = f47.b;
                this.c = 1;
                return r6cVar2.a(f47Var2, this) == tb2Var3 ? tb2Var3 : c1eVar;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    qi1 qi1Var2 = x47Var.d;
                    CatalogType catalogType2 = CatalogType.LISTS;
                    ud1 ud1Var2 = x47Var.b;
                    yd4 yd4Var2 = yd4.NetworkFirst;
                    this.c = 1;
                    objN2 = qi1Var2.n(catalogType2, ud1Var2, yd4Var2, this);
                    if (objN2 == tb2Var4) {
                        return tb2Var4;
                    }
                } else {
                    if (i5 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objN2 = ((bjb) obj).a;
                }
                if (!(objN2 instanceof ajb)) {
                    x47Var.s = (EntityCatalogsConnectionData) objN2;
                }
                Throwable thB2 = bjb.b(objN2);
                if (thB2 == null) {
                    return c1eVar;
                }
                wld.a.e(thB2, "Fetch catalog item connection data failed", new Object[0]);
                return c1eVar;
        }
    }
}
