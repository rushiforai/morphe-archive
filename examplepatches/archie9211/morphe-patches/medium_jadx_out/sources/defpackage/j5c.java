package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.widget.Toast;
import com.medium.android.admin.stagebranch.StageBranchFragment;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.onboarding.ui.starterpackdetail.StarterPackDetailFragment;
import com.medium.android.postpage.sharepostfriendlink.SharePostFriendLinkDialogFragment;
import com.medium.android.postpage.sharepostfriendlink.a;
import com.medium.android.susi.ui.signIn.SignInFragment;
import com.medium.android.susi.ui.signUp.SignUpFragment;
import com.medium.proto.event.OnboardingStarterPackFollowAllClicked;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class j5c extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j5c(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 2;
        int i3 = 18;
        int i4 = 0;
        int i5 = 1;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                v5c v5cVar = (v5c) ((a) ((i5c) this.receiver)).a.L0.getValue();
                if (!((Boolean) v5cVar.l.getValue()).booleanValue()) {
                    xpc xpcVar = v5cVar.k;
                    Boolean bool = Boolean.TRUE;
                    xpcVar.getClass();
                    xpcVar.m(null, bool);
                    vx0.c0(f76.F(v5cVar), null, null, new r5c(v5cVar, n92Var, i4), 3);
                }
                return c1eVar;
            case 1:
                v5c v5cVar2 = (v5c) ((a) ((i5c) this.receiver)).a.L0.getValue();
                if (!((Boolean) v5cVar2.k.getValue()).booleanValue()) {
                    xpc xpcVar2 = v5cVar2.l;
                    Boolean bool2 = Boolean.TRUE;
                    xpcVar2.getClass();
                    xpcVar2.m(null, bool2);
                    vx0.c0(f76.F(v5cVar2), null, null, new r5c(v5cVar2, n92Var, i5), 3);
                }
                return c1eVar;
            case 2:
                ((a) ((i5c) this.receiver)).c();
                return c1eVar;
            case 3:
                ((a) ((i5c) this.receiver)).b();
                return c1eVar;
            case 4:
                SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = ((a) ((i5c) this.receiver)).a;
                p13 p13Var = sharePostFriendLinkDialogFragment.H0;
                if (p13Var != null) {
                    p13Var.J(sharePostFriendLinkDialogFragment.S(), new UpsellInfo(UpsellReferrer.POST, "post_friend_link", null, null, null, null, 60, null), sharePostFriendLinkDialogFragment.g0().getReferrerSource(), null);
                    return c1eVar;
                }
                g76.g0("router");
                throw null;
            case 5:
                ((a) ((i5c) this.receiver)).c();
                return c1eVar;
            case 6:
                ((w5c) this.receiver).g();
                return c1eVar;
            case 7:
                ((w5c) this.receiver).c();
                return c1eVar;
            case 8:
                ((w5c) this.receiver).d();
                return c1eVar;
            case 9:
                ((w5c) this.receiver).f();
                return c1eVar;
            case 10:
                ((w5c) this.receiver).b();
                return c1eVar;
            case 11:
                ((c6c) this.receiver).a();
                return c1eVar;
            case 12:
                ((u8c) this.receiver).b();
                return c1eVar;
            case 13:
                ((u8c) this.receiver).b();
                return c1eVar;
            case 14:
                l9c l9cVarG0 = ((u8c) this.receiver).a.g0();
                vx0.c0(f76.F(l9cVarG0), null, null, new eub(l9cVarG0, n92Var, 12), 3);
                return c1eVar;
            case 15:
                ((u8c) this.receiver).b();
                return c1eVar;
            case 16:
                ((u8c) this.receiver).b();
                return c1eVar;
            case 17:
                wac wacVar = ((eac) this.receiver).b;
                vx0.c0(f76.F(wacVar), null, null, new uac(wacVar, n92Var, i5), 3);
                return c1eVar;
            case 18:
                ((SignInFragment) ((eac) this.receiver).a.a).i1().H().f();
                return c1eVar;
            case 19:
                sdc sdcVar = ((cbc) this.receiver).b;
                vx0.c0(f76.F(sdcVar), null, null, new qdc(sdcVar, n92Var, i2), 3);
                return c1eVar;
            case 20:
                lig ligVar = ((SignUpFragment) ((cbc) this.receiver).a.a).u0;
                if (ligVar != null) {
                    ligVar.H().f();
                    return c1eVar;
                }
                g76.g0("susiRouter");
                throw null;
            case 21:
                u81 u81Var = (u81) ((ojc) this.receiver);
                y81 y81Var = u81Var.a;
                v81 v81Var = u81Var.b;
                y81Var.t(new ResponsesReference.Catalog(v81Var.c, null, 2, null), v81Var.g);
                return c1eVar;
            case 22:
                omc omcVar = (omc) this.receiver;
                xmc xmcVar = omcVar.a;
                vx0.c0(f76.F(xmcVar), null, null, new xi7(xmcVar, n92Var, 17), 3);
                mya myaVar = omcVar.b;
                Context context = (Context) myaVar.b;
                Toast.makeText(context, "Stage Branch applied", 1).show();
                ((p13) ((StageBranchFragment) myaVar.c).Z()).m(context, "admin_stage_branch", false);
                return c1eVar;
            case 23:
                omc omcVar2 = (omc) this.receiver;
                omcVar2.a.c.P(null);
                mya myaVar2 = omcVar2.b;
                Context context2 = (Context) myaVar2.b;
                Toast.makeText(context2, "Stage Branch disabled", 1).show();
                ((p13) ((StageBranchFragment) myaVar2.c).Z()).m(context2, "admin_stage_branch", false);
                return c1eVar;
            case 24:
                ((StageBranchFragment) ((omc) this.receiver).b.c).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 25:
                uoc uocVar = ((koc) this.receiver).b;
                roc rocVar = (roc) uocVar.y.a.getValue();
                if (rocVar instanceof noc) {
                    noc nocVar = (noc) rocVar;
                    if (!nocVar.d) {
                        ax2 ax2Var = uocVar.k;
                        String str = uocVar.b;
                        String str2 = uocVar.c;
                        String strU = gp7.u(uocVar.o);
                        String str3 = uocVar.n;
                        ax2Var.getClass();
                        str.getClass();
                        str2.getClass();
                        str3.getClass();
                        rqd.a(ax2Var.b, new OnboardingStarterPackFollowAllClicked(null, str, null, 5, null), str2, strU, false, null, str3, 24);
                        List list = nocVar.b;
                        ArrayList<hae> arrayList = new ArrayList();
                        for (Object obj : list) {
                            if (obj instanceof hae) {
                                arrayList.add(obj);
                            }
                        }
                        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
                        for (hae haeVar : arrayList) {
                            arrayList2.add(new ps4(haeVar.a, haeVar.h));
                        }
                        ArrayList<nca> arrayList3 = new ArrayList();
                        for (Object obj2 : list) {
                            if (obj2 instanceof nca) {
                                arrayList3.add(obj2);
                            }
                        }
                        ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList3, 10));
                        for (nca ncaVar : arrayList3) {
                            arrayList4.add(new ps4(ncaVar.a, ncaVar.j));
                        }
                        vx0.c0(f76.F(uocVar), null, null, new uk8(uocVar, arrayList2, arrayList4, list, (n92) null, 29), 3);
                    }
                }
                return c1eVar;
            case 26:
                ks8 ks8Var = ((StarterPackDetailFragment) ((koc) this.receiver).a.a).u0;
                if (ks8Var != null) {
                    k40.X(ks8Var.a).f();
                    return c1eVar;
                }
                g76.g0("onboardingRouter");
                throw null;
            case 27:
                uoc uocVar2 = ((koc) this.receiver).b;
                vx0.c0(f76.F(uocVar2), null, null, new xi7(uocVar2, n92Var, i3), 3);
                return c1eVar;
            case 28:
                ks8 ks8Var2 = ((StarterPackDetailFragment) ((koc) this.receiver).a.a).u0;
                if (ks8Var2 != null) {
                    k40.X(ks8Var2.a).f();
                    return c1eVar;
                }
                g76.g0("onboardingRouter");
                throw null;
            default:
                uoc uocVar3 = ((koc) this.receiver).b;
                vx0.c0(f76.F(uocVar3), null, null, new xi7(uocVar3, n92Var, i3), 3);
                return c1eVar;
        }
    }
}
