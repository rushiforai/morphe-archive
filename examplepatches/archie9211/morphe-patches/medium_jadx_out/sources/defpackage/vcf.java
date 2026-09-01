package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vcf implements c55 {
    public final /* synthetic */ int a;

    public /* synthetic */ vcf(int i) {
        this.a = i;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((xr6) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    tp7.e(0.0f, 0, 6, 0L, p65Var, jfc.e(w2g.F(iy0.a.a(o28Var, z46.h), 4.0f, 8.0f, 4.0f, 8.0f), 22.0f));
                }
                break;
            default:
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    p65Var2.S();
                } else {
                    jjd.b(vo7.R(p65Var2, R.string.edit_profile_acquire_image_take_photo), w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), 0L, 0L, 0L, null, new jgd(5), 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var2, 48, 0, 130044);
                }
                break;
        }
        return c1eVar;
    }
}
