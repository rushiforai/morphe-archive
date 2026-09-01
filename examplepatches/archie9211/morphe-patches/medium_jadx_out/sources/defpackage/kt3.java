package defpackage;

import com.medium.android.donkey.main.MainActivity;
import com.medium.android.profile.ui.edit.EditProfileFragment;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class kt3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ EditProfileFragment b;
    public final /* synthetic */ rz2 c;

    public /* synthetic */ kt3(EditProfileFragment editProfileFragment, rz2 rz2Var, int i) {
        this.a = i;
        this.b = editProfileFragment;
        this.c = rz2Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        EditProfileFragment editProfileFragment = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(1 & iIntValue, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    l78 l78VarZ = guc.z(((MainActivity) editProfileFragment.Q()).s(), p65Var, 0);
                    String referrerSource = ((EditProfileFragment.BundleInfo) editProfileFragment.u0.getValue()).getReferrerSource();
                    editProfileFragment.Z();
                    vx0.e(referrerSource, this.c, new zz(m4.K(editProfileFragment.S(), R.id.pronounsPickerFragment), 4), w2g.G(o28.b, 0.0f, 0.0f, 0.0f, ((vj3) l78VarZ.getValue()).a, 7).b(jfc.c), null, p65Var, 0);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jt7.a(false, pxf.E(2125770365, new kt3(editProfileFragment, this.c, i2), p65Var2), p65Var2, 48, 1);
                }
                break;
        }
        return c1eVar;
    }
}
