package defpackage;

import android.app.PendingIntent;
import com.medium.android.showlesslikethis.ui.ShowLessLikeThisDialogFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class x8c implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ u8c b;
    public final /* synthetic */ f9c c;

    public /* synthetic */ x8c(u8c u8cVar, f9c f9cVar, int i) {
        this.a = i;
        this.b = u8cVar;
        this.c = f9cVar;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        f9c f9cVar = this.c;
        u8c u8cVar = this.b;
        switch (i) {
            case 0:
                String str = f9cVar.f;
                str.getClass();
                l9c l9cVarG0 = u8cVar.a.g0();
                vx0.c0(f76.F(l9cVarG0), null, null, new j9c(l9cVarG0, str, n92Var, 1), 3);
                return c1eVar;
            case 1:
                String str2 = f9cVar.a;
                String str3 = f9cVar.c;
                String str4 = f9cVar.i;
                str2.getClass();
                str4.getClass();
                ShowLessLikeThisDialogFragment showLessLikeThisDialogFragment = u8cVar.a;
                m15 m15VarQ = showLessLikeThisDialogFragment.Q();
                u8cVar.a();
                p13 p13Var = showLessLikeThisDialogFragment.H0;
                if (p13Var != null) {
                    p13Var.p0(m15VarQ, str2, str3, str4);
                    return c1eVar;
                }
                g76.g0("router");
                throw null;
            default:
                String str5 = f9cVar.c;
                l9c l9cVarG02 = u8cVar.a.g0();
                vx0.c0(f76.F(l9cVarG02), null, null, new j9c(l9cVarG02, str5, n92Var, 0), 3);
                return c1eVar;
        }
    }
}
