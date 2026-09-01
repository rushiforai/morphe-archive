package defpackage;

import android.net.Uri;
import com.medium.proto.event.GiveTipClicked;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class pe0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ cv9 b;
    public final /* synthetic */ te0 c;

    public /* synthetic */ pe0(cv9 cv9Var, te0 te0Var, int i) {
        this.a = i;
        this.b = cv9Var;
        this.c = te0Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        te0 te0Var = this.c;
        cv9 cv9Var = this.b;
        switch (i) {
            case 0:
                String str = te0Var.b;
                String str2 = te0Var.a.a;
                Uri uri = te0Var.c;
                SourceParameter sourceParameter = te0Var.d;
                str.getClass();
                uri.getClass();
                sw9 sw9Var = cv9Var.a;
                ty2 ty2Var = sw9Var.m;
                String str3 = sw9Var.d;
                String strU = gp7.u(sourceParameter);
                String str4 = sw9Var.D0;
                ty2Var.getClass();
                str3.getClass();
                str4.getClass();
                rqd.a(ty2Var.a, new GiveTipClicked(null, str, str2, null, 9, null), str3, strU, false, null, str4, 24);
                vx0.c0(f76.F(sw9Var), null, null, new gv9(sw9Var, uri, sourceParameter, null, 1), 3);
                break;
            case 1:
                String str5 = te0Var.a.a;
                SourceParameter sourceParameter2 = te0Var.d;
                sw9 sw9Var2 = cv9Var.a;
                vx0.c0(f76.F(sw9Var2), null, null, new gs9(sw9Var2, str5, sourceParameter2, null, 6), 3);
                break;
            case 2:
                String str6 = te0Var.a.a;
                SourceParameter sourceParameter3 = te0Var.d;
                sw9 sw9Var3 = cv9Var.a;
                vx0.c0(f76.F(sw9Var3), null, null, new gs9(sw9Var3, str6, sourceParameter3, null, 7), 3);
                break;
            case 3:
                String str7 = te0Var.a.a;
                SourceParameter sourceParameter4 = te0Var.d;
                sw9 sw9Var4 = cv9Var.a;
                vx0.c0(f76.F(sw9Var4), null, null, new gs9(sw9Var4, str7, sourceParameter4, null, 8), 3);
                break;
            default:
                SourceParameter sourceParameter5 = te0Var.d;
                sw9 sw9Var5 = cv9Var.a;
                vx0.c0(f76.F(sw9Var5), null, null, new kd7(sw9Var5, sourceParameter5, null, 26), 3);
                break;
        }
        return c1eVar;
    }
}
