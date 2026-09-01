package defpackage;

import com.medium.android.catalogs.listscatalogselector.ListsCatalogSelectorDialogFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v37 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ListsCatalogSelectorDialogFragment d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v37(ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = listsCatalogSelectorDialogFragment;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = this.d;
        switch (i) {
            case 0:
                return new v37(listsCatalogSelectorDialogFragment, n92Var, 0);
            case 1:
                return new v37(listsCatalogSelectorDialogFragment, n92Var, 1);
            case 2:
                return new v37(listsCatalogSelectorDialogFragment, n92Var, 2);
            default:
                return new v37(listsCatalogSelectorDialogFragment, n92Var, 3);
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
        return ((v37) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = this.d;
        n92 n92Var = null;
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
                if (listsCatalogSelectorDialogFragment.H0 == null) {
                    g76.g0("router");
                    throw null;
                }
                bo4 bo4VarK = m4.K(listsCatalogSelectorDialogFragment.S(), R.id.createCatalogBottomSheetDialogFragment);
                ob0 ob0Var = new ob0(4, listsCatalogSelectorDialogFragment.g0());
                this.c = 1;
                Object objB = bo4VarK.b(new yh(ob0Var, 18), this);
                if (objB != tb2Var) {
                    objB = c1eVar;
                }
                return objB == tb2Var ? tb2Var : c1eVar;
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
                vx6 vx6Var = vx6.STARTED;
                v37 v37Var = new v37(listsCatalogSelectorDialogFragment, n92Var, 0);
                this.c = 1;
                return gq7.Q(listsCatalogSelectorDialogFragment, vx6Var, v37Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    uua uuaVar = listsCatalogSelectorDialogFragment.g0().y;
                    ob0 ob0Var2 = new ob0(5, listsCatalogSelectorDialogFragment);
                    this.c = 1;
                    if (uuaVar.a.b(ob0Var2, this) == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i4 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                z72.b();
                return null;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                vx6 vx6Var2 = vx6.STARTED;
                v37 v37Var2 = new v37(listsCatalogSelectorDialogFragment, n92Var, 2);
                this.c = 1;
                return gq7.Q(listsCatalogSelectorDialogFragment, vx6Var2, v37Var2, this) == tb2Var4 ? tb2Var4 : c1eVar;
        }
    }
}
