package defpackage;

import android.content.Intent;
import com.medium.android.donkey.read.web.ExternalWebViewActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class b84 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ ExternalWebViewActivity c;
    public final /* synthetic */ c84 d;

    public /* synthetic */ b84(String str, ExternalWebViewActivity externalWebViewActivity, c84 c84Var, int i) {
        this.a = i;
        this.b = str;
        this.c = externalWebViewActivity;
        this.d = c84Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ExternalWebViewActivity externalWebViewActivity = this.c;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                int i3 = ExternalWebViewActivity.r;
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    jt7.a(false, pxf.E(1954966780, new b84(this.b, externalWebViewActivity, this.d, i2), p65Var), p65Var, 48, 1);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                int i4 = ExternalWebViewActivity.r;
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    Intent intent = externalWebViewActivity.getIntent();
                    intent.getClass();
                    String strJ0 = op8.j0(intent);
                    String str = externalWebViewActivity.q;
                    if (str == null) {
                        g76.g0("appVersionName");
                        throw null;
                    }
                    py2 py2Var = externalWebViewActivity.p;
                    if (py2Var == null) {
                        g76.g0("deepLinkHandler");
                        throw null;
                    }
                    v4.a(this.b, strJ0, str, py2Var, this.d, false, null, false, p65Var2, 196608, 192);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
        }
    }
}
