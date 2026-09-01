package defpackage;

import com.medium.android.catalogs.listscatalogselector.ListsCatalogSelectorDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s37 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ListsCatalogSelectorDialogFragment b;
    public final /* synthetic */ u37 c;

    public /* synthetic */ s37(ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment, u37 u37Var, int i) {
        this.a = i;
        this.b = listsCatalogSelectorDialogFragment;
        this.c = u37Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        u37 u37Var = this.c;
        ListsCatalogSelectorDialogFragment listsCatalogSelectorDialogFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1477201193, new s37(listsCatalogSelectorDialogFragment, u37Var, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    k50.F((k47) guc.z(listsCatalogSelectorDialogFragment.g0().z, p65Var2, 0).getValue(), u37Var, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
