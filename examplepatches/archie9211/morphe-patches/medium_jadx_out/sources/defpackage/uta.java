package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.reportpost.ui.ReportPostDialogFragment;
import com.medium.android.reportresponse.ui.ReportResponseDialogFragment;
import com.medium.android.reportuser.ui.ReportUserDialogFragment;
import com.medium.android.repost.ui.report.ReportRepostDialogFragment;
import com.medium.android.repost.ui.repostnote.RepostWithNoteBottomSheetFragment;
import com.medium.android.reposters.ui.a;
import com.medium.proto.event.FindYourFriendsDismissed;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class uta extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uta(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        Object value;
        int i = this.a;
        int i2 = 1;
        int i3 = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                nua nuaVar = (nua) this.receiver;
                nuaVar.getClass();
                vx0.c0(f76.F(nuaVar), null, null, new kua(nuaVar, n92Var, i2), 3);
                return c1eVar;
            case 1:
                ((vta) this.receiver).a();
                return c1eVar;
            case 2:
                ((uza) ((vya) this.receiver)).a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 3:
                ((h4b) this.receiver).a();
                return c1eVar;
            case 4:
                ((h4b) this.receiver).a();
                return c1eVar;
            case 5:
                ReportPostDialogFragment reportPostDialogFragment = ((k5b) this.receiver).a;
                p13 p13Var = reportPostDialogFragment.H0;
                if (p13Var == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS = reportPostDialogFragment.S();
                if (reportPostDialogFragment.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri = Uri.parse(i03.x);
                uri.getClass();
                p13Var.g(contextS, uri, reportPostDialogFragment.g0().l);
                return c1eVar;
            case 6:
                ReportPostDialogFragment reportPostDialogFragment2 = ((k5b) this.receiver).a;
                p13 p13Var2 = reportPostDialogFragment2.H0;
                if (p13Var2 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS2 = reportPostDialogFragment2.S();
                if (reportPostDialogFragment2.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri2 = Uri.parse(i03.w);
                uri2.getClass();
                p13Var2.g(contextS2, uri2, reportPostDialogFragment2.g0().l);
                return c1eVar;
            case 7:
                k40.X(((k5b) this.receiver).a).f();
                return c1eVar;
            case 8:
                k40.X((ReportRepostDialogFragment) ((e6b) this.receiver).a.a).f();
                return c1eVar;
            case 9:
                ReportResponseDialogFragment reportResponseDialogFragment = ((m6b) this.receiver).a;
                p13 p13Var3 = reportResponseDialogFragment.H0;
                if (p13Var3 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS3 = reportResponseDialogFragment.S();
                if (reportResponseDialogFragment.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri3 = Uri.parse(i03.x);
                uri3.getClass();
                p13Var3.g(contextS3, uri3, reportResponseDialogFragment.g0().n);
                return c1eVar;
            case 10:
                ReportResponseDialogFragment reportResponseDialogFragment2 = ((m6b) this.receiver).a;
                p13 p13Var4 = reportResponseDialogFragment2.H0;
                if (p13Var4 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS4 = reportResponseDialogFragment2.S();
                if (reportResponseDialogFragment2.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri4 = Uri.parse(i03.w);
                uri4.getClass();
                p13Var4.g(contextS4, uri4, reportResponseDialogFragment2.g0().n);
                return c1eVar;
            case 11:
                k40.X(((m6b) this.receiver).a).f();
                return c1eVar;
            case 12:
                ReportUserDialogFragment reportUserDialogFragment = ((c7b) this.receiver).a;
                p13 p13Var5 = reportUserDialogFragment.H0;
                if (p13Var5 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS5 = reportUserDialogFragment.S();
                if (reportUserDialogFragment.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri5 = Uri.parse(i03.x);
                uri5.getClass();
                p13Var5.g(contextS5, uri5, reportUserDialogFragment.g0().k);
                return c1eVar;
            case 13:
                ReportUserDialogFragment reportUserDialogFragment2 = ((c7b) this.receiver).a;
                p13 p13Var6 = reportUserDialogFragment2.H0;
                if (p13Var6 == null) {
                    g76.g0("router");
                    throw null;
                }
                Context contextS6 = reportUserDialogFragment2.S();
                if (reportUserDialogFragment2.I0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri6 = Uri.parse(i03.w);
                uri6.getClass();
                p13Var6.g(contextS6, uri6, reportUserDialogFragment2.g0().k);
                return c1eVar;
            case 14:
                k40.X(((c7b) this.receiver).a).f();
                return c1eVar;
            case 15:
                ((l8b) this.receiver).a();
                return c1eVar;
            case 16:
                xpc xpcVar = ((i9b) this.receiver).b.n;
                do {
                    value = xpcVar.getValue();
                } while (!xpcVar.k(value, Integer.valueOf(((Number) value).intValue() + 1)));
                return c1eVar;
            case 17:
                k40.X((RepostWithNoteBottomSheetFragment) ((i9b) this.receiver).a.b).f();
                return c1eVar;
            case 18:
                z9b z9bVar = ((i9b) this.receiver).b;
                if (!((Boolean) z9bVar.m.getValue()).booleanValue()) {
                    String string = muc.y0(((uid) z9bVar.l.getValue()).a.b).toString();
                    if (z9bVar.e && z9bVar.d == null && muc.b0(string)) {
                        vx0.c0(f76.F(z9bVar), null, null, new xi7(z9bVar, n92Var, 12), 3);
                    } else {
                        vx0.c0(f76.F(z9bVar), null, null, new nx9(z9bVar, string, n92Var, 22), 3);
                    }
                }
                return c1eVar;
            case 19:
                ((mab) this.receiver).a();
                return c1eVar;
            case 20:
                ((mab) this.receiver).a();
                return c1eVar;
            case 21:
                jbb jbbVar = ((mab) this.receiver).b;
                vx0.c0(f76.F(jbbVar), null, null, new dbb(i3, n92Var, jbbVar), 3);
                return c1eVar;
            case 22:
                k40.X(((a) ((mab) this.receiver).a).a).f();
                return c1eVar;
            case 23:
                MainActivity mainActivity = ((bf7) this.receiver).a;
                int i4 = MainActivity.H;
                sg7 sg7VarV = mainActivity.v();
                km4.I(wld.a, null, "Request address book access declined.", new Object[0], "Request address book access declined.");
                cx2 cx2Var = sg7VarV.t;
                String string2 = Locale.getDefault().toString();
                string2.getClass();
                String str = sg7VarV.B;
                String str2 = sg7VarV.z;
                cx2Var.getClass();
                str.getClass();
                str2.getClass();
                rqd.a(cx2Var.a, new FindYourFriendsDismissed(null, string2, null, 5, null), "", str, false, null, str2, 24);
                sg7VarV.b.z(ek6.HAS_DISMISSED_FIND_YOUR_FRIENDS_DIALOG, true);
                sg7VarV.x.l(null);
                return c1eVar;
            case 24:
                ((lgb) this.receiver).i();
                return c1eVar;
            case 25:
                nib nibVar = ((lgb) this.receiver).c;
                vx0.c0(f76.F(nibVar), null, null, new gib(nibVar, n92Var, i3), 3);
                return c1eVar;
            case 26:
                ((lgb) this.receiver).i();
                return c1eVar;
            case 27:
                nib nibVar2 = (nib) this.receiver;
                nibVar2.getClass();
                vx0.c0(f76.F(nibVar2), null, null, new gib(nibVar2, n92Var, i3), 3);
                return c1eVar;
            case 28:
                ((lgb) this.receiver).a();
                return c1eVar;
            default:
                return ((l95) this.receiver).a();
        }
    }
}
