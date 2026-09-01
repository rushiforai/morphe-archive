package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.core.navigation.s;
import com.medium.stats.ui.user.UserStatsFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ube implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ ube(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                String str = ((dce) obj).a;
                str.getClass();
                ide ideVar = ((zbe) obj2).a;
                ideVar.i();
                ideVar.e(str);
                return c1eVar;
            case 1:
                ((nee) obj2).F(((ffe) obj).d);
                return c1eVar;
            case 2:
                ((nee) obj2).g(((ife) obj).a);
                return c1eVar;
            case 3:
                ((nee) obj2).g(((dfe) obj).a);
                return c1eVar;
            case 4:
                ((rfe) obj2).g(((lge) obj).a);
                return c1eVar;
            case 5:
                ((rfe) obj2).g(((hge) obj).a);
                return c1eVar;
            case 6:
                uge ugeVar = (uge) obj;
                ((ihe) obj2).r0(ugeVar.a, ugeVar.j);
                return c1eVar;
            case 7:
                return Integer.valueOf(iq7.v(nk7.w0(((g49) obj2).g()), -((int) ((g49) obj).g()), 0));
            case 8:
                ((ihe) obj2).g(((ije) obj).a);
                return c1eVar;
            case 9:
                ((ihe) obj2).g(((mje) obj).a);
                return c1eVar;
            case 10:
                ((ihe) obj2).R(((jje) ((nje) obj)).m);
                return c1eVar;
            case 11:
                SourceParameter sourceParameter = ((wme) ((l78) obj).getValue()).c;
                UserStatsFragment userStatsFragment = ((ume) obj2).a;
                s sVarZ = userStatsFragment.Z();
                Context contextS = userStatsFragment.S();
                if (userStatsFragment.u0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                ((p13) sVarZ).f(contextS, Uri.parse(i03.m), gp7.u(sourceParameter));
                return c1eVar;
            case 12:
                xne xneVar = (xne) obj;
                ((ek8) obj2).k(xneVar.c, xneVar.h);
                return c1eVar;
            case 13:
                yne yneVar = (yne) obj;
                ((ek8) obj2).k(yneVar.b, yneVar.h);
                return c1eVar;
            default:
                ((ddf) obj2).b(((aef) obj).e);
                return c1eVar;
        }
    }
}
