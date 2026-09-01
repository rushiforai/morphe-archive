package defpackage;

import android.net.Uri;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.reposters.ui.a;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class re0 implements e07 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Uri b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ re0(Uri uri, Object obj, Object obj2, int i) {
        this.a = i;
        this.b = uri;
        this.d = obj;
        this.c = obj2;
    }

    @Override // defpackage.e07
    public final void a(d07 d07Var) {
        int i = this.a;
        Uri uri = this.b;
        Object obj = this.c;
        Object obj2 = this.d;
        d07Var.getClass();
        switch (i) {
            case 0:
                Uri uri2 = this.b;
                uri2.getClass();
                sw9 sw9Var = ((cv9) obj2).a;
                vx0.c0(f76.F(sw9Var), null, null, new gv9(sw9Var, uri2, (SourceParameter) obj, null, 0), 3);
                return;
            case 1:
                Uri uri3 = this.b;
                uri3.getClass();
                sw9 sw9Var2 = ((cv9) obj2).a;
                vx0.c0(f76.F(sw9Var2), null, null, new gv9(sw9Var2, uri3, (SourceParameter) obj, null, 2), 3);
                return;
            case 2:
                uri.getClass();
                ((kia) ((nla) obj2).a).c(uri, ((pia) obj).j);
                return;
            case 3:
                uri.getClass();
                ((k8b) obj2).f(uri, ((dr9) obj).x.b);
                return;
            default:
                uri.getClass();
                nab nabVar = (nab) obj2;
                SourceParameter sourceParameter = ((bab) obj).a.i;
                nabVar.getClass();
                uri.getClass();
                RepostersFragment repostersFragment = ((a) nabVar.a).a;
                py2 py2Var = repostersFragment.v0;
                if (py2Var != null) {
                    py2Var.a(repostersFragment.S(), uri, gp7.u(sourceParameter), null);
                    return;
                } else {
                    g76.g0("deepLinkHandler");
                    throw null;
                }
        }
    }
}
