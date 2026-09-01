package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.core.navigation.s;
import com.medium.android.home.ui.home.HomeFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ip5 implements js0 {
    public final /* synthetic */ int a;
    public final /* synthetic */ que b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ip5(que queVar, Object obj, int i) {
        this.a = i;
        this.b = queVar;
        this.c = obj;
    }

    @Override // defpackage.js0
    public final void a() {
        int i = this.a;
        int i2 = 1;
        n92 n92Var = null;
        que queVar = this.b;
        switch (i) {
            case 0:
                bq5 bq5Var = (bq5) queVar;
                vx0.c0(f76.F(bq5Var), null, null, new yp5(bq5Var, n92Var, i2), 3);
                break;
            default:
                ime imeVar = (ime) queVar;
                vx0.c0(f76.F(imeVar), null, null, new eme(imeVar, n92Var, i2), 3);
                break;
        }
    }

    @Override // defpackage.js0
    public final void b(SourceParameter sourceParameter) {
        int i = this.a;
        Object obj = this.c;
        sourceParameter.getClass();
        switch (i) {
            case 0:
                rq5 rq5Var = (rq5) obj;
                rq5Var.getClass();
                HomeFragment homeFragment = ((dq5) rq5Var.b).a;
                s sVarZ = homeFragment.Z();
                Context contextS = homeFragment.S();
                if (homeFragment.v0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                ((p13) sVarZ).f(contextS, Uri.parse(i03.z), gp7.u(sourceParameter));
                return;
            default:
                ((dle) obj).q(sourceParameter);
                return;
        }
    }

    @Override // defpackage.js0
    public final void c(String str, SourceParameter sourceParameter) {
        int i = this.a;
        que queVar = this.b;
        switch (i) {
            case 0:
                str.getClass();
                sourceParameter.getClass();
                bq5 bq5Var = (bq5) queVar;
                vx0.c0(f76.F(bq5Var), null, null, new zp5(bq5Var, str, sourceParameter, null, 1), 3);
                break;
            default:
                str.getClass();
                sourceParameter.getClass();
                ime imeVar = (ime) queVar;
                vx0.c0(f76.F(imeVar), null, null, new dme(imeVar, str, sourceParameter, null, 1), 3);
                break;
        }
    }
}
