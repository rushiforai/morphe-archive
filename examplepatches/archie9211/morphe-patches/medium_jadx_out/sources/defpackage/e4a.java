package defpackage;

import com.medium.android.profile.ui.edit.pronouns.PronounsPickerDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class e4a implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ PronounsPickerDialogFragment b;

    public /* synthetic */ e4a(PronounsPickerDialogFragment pronounsPickerDialogFragment, int i) {
        this.a = i;
        this.b = pronounsPickerDialogFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PronounsPickerDialogFragment pronounsPickerDialogFragment = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-513065987, new e4a(pronounsPickerDialogFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wue wueVarA = e67.a(p65Var2);
                    if (wueVarA == null) {
                        ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    } else {
                        n4a n4aVar = (n4a) to7.z(n1b.a.b(n4a.class), wueVarA, null, wueVarA instanceof pi5 ? ((pi5) wueVarA).getDefaultViewModelCreationExtras() : og2.b, p65Var2);
                        mk7.e(n4aVar.h, n4aVar.e, new gg5(pronounsPickerDialogFragment, 26, n4aVar), null, p65Var2, 0);
                    }
                }
                break;
        }
        return c1eVar;
    }
}
