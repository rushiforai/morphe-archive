package defpackage;

import com.medium.android.graphql.fragment.IframeData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class t19 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ u19 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ IframeData e;

    public /* synthetic */ t19(String str, u19 u19Var, String str2, IframeData iframeData, int i) {
        this.a = i;
        this.b = str;
        this.c = u19Var;
        this.d = str2;
        this.e = iframeData;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(-1138940658, new t19(this.b, this.c, this.d, this.e, 1), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    u19 u19Var = this.c;
                    o7f.e(new yv5(this.b, u19Var.b, this.d, kyd.E(this.e), false, false), u19Var.c, null, p65Var2, 0);
                }
                break;
        }
        return c1eVar;
    }
}
