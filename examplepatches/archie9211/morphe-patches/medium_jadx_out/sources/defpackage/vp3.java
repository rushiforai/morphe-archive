package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.donkey.write.EditPostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class vp3 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ i06 b;
    public final /* synthetic */ EditPostFragment c;
    public final /* synthetic */ String d;

    public /* synthetic */ vp3(i06 i06Var, EditPostFragment editPostFragment, String str, int i) {
        this.a = i;
        this.b = i06Var;
        this.c = editPostFragment;
        this.d = str;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.d;
        EditPostFragment editPostFragment = this.c;
        i06 i06Var = this.b;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i3 = EditPostFragment.Q0;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-829920916, new vp3(i06Var, editPostFragment, str, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i4 = EditPostFragment.Q0;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    String str2 = i06Var.b;
                    String str3 = i06Var.c;
                    long j = i06Var.d;
                    long j2 = i06Var.e;
                    Highlight highlight = i06Var.f;
                    boolean zH = p65Var2.h(editPostFragment) | p65Var2.f(i06Var) | p65Var2.f(str);
                    Object objM = p65Var2.M();
                    if (zH || objM == w12.a) {
                        objM = new o8(editPostFragment, i06Var, str);
                        p65Var2.j0(objM);
                    }
                    bo.p(str2, str3, j, j2, null, highlight, false, 0, (x45) objM, p65Var2, 0, 208);
                }
                break;
        }
        return c1eVar;
    }
}
