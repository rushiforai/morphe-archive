package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.core.membership.UpsellReferrer;
import com.medium.android.profile.ui.premium.ProfilePremiumBottomSheetDialogFragment;
import com.medium.android.settings.ui.privacy.PrivacyFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class bo9 extends x55 implements m45 {
    public final /* synthetic */ int a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bo9(int i, Object obj, Class cls, String str, String str2, int i2, int i3) {
        super(i, i2, cls, obj, str, str2);
        this.a = i3;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        int i2 = 2;
        int i3 = 1;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((lo9) this.receiver).a();
                return c1eVar;
            case 1:
                ((lo9) this.receiver).a();
                return c1eVar;
            case 2:
                ko9 ko9Var = ((lo9) this.receiver).a;
                vx0.c0(f76.F(ko9Var), null, null, new o9(ko9Var, n92Var, 4), 3);
                return c1eVar;
            case 3:
                ((lo9) this.receiver).a();
                return c1eVar;
            case 4:
                ((lo9) this.receiver).a();
                return c1eVar;
            case 5:
                ko9 ko9Var2 = ((lo9) this.receiver).a;
                vx0.c0(f76.F(ko9Var2), null, null, new eo9(ko9Var2, n92Var, i2), 3);
                return c1eVar;
            case 6:
                return ((l95) this.receiver).a();
            case 7:
                wp9 wp9Var = ((fp9) this.receiver).b;
                vx0.c0(f76.F(wp9Var), null, null, new sp9(wp9Var, n92Var, i3), 3);
                return c1eVar;
            case 8:
                wp9 wp9Var2 = ((fp9) this.receiver).b;
                vx0.c0(f76.F(wp9Var2), null, null, new sp9(wp9Var2, n92Var, i3), 3);
                return c1eVar;
            case 9:
                ((fp9) this.receiver).a.a.Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 10:
                ((iq9) this.receiver).x();
                return c1eVar;
            case 11:
                ((iq9) this.receiver).a();
                return c1eVar;
            case 12:
                qx9 qx9Var = ((ex9) this.receiver).a;
                vx0.c0(f76.F(qx9Var), null, null, new lx9(qx9Var, n92Var, 0), 3);
                return c1eVar;
            case 13:
                qx9 qx9Var2 = ((ex9) this.receiver).a;
                vx0.c0(f76.F(qx9Var2), null, null, new lx9(qx9Var2, n92Var, i3), 3);
                return c1eVar;
            case 14:
                qx9 qx9Var3 = ((ex9) this.receiver).a;
                vx0.c0(f76.F(qx9Var3), null, null, new lx9(qx9Var3, n92Var, i3), 3);
                return c1eVar;
            case 15:
                ((PrivacyFragment) ((i1a) this.receiver).a.a).Q().getOnBackPressedDispatcher().d();
                return c1eVar;
            case 16:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 17:
                ProfilePremiumBottomSheetDialogFragment profilePremiumBottomSheetDialogFragment = ((x2a) this.receiver).a;
                p13 p13Var = profilePremiumBottomSheetDialogFragment.H0;
                if (p13Var == null) {
                    g76.g0("router");
                    throw null;
                }
                p13Var.J(profilePremiumBottomSheetDialogFragment.S(), new UpsellInfo(UpsellReferrer.PROFILE_PREMIUM, null, null, null, null, null, 62, null), ((f3a) profilePremiumBottomSheetDialogFragment.M0.getValue()).e(), null);
                return c1eVar;
            case 18:
                ProfilePremiumBottomSheetDialogFragment profilePremiumBottomSheetDialogFragment2 = ((x2a) this.receiver).a;
                py2 py2Var = profilePremiumBottomSheetDialogFragment2.J0;
                if (py2Var == null) {
                    g76.g0("deepLinkHandler");
                    throw null;
                }
                Context contextS = profilePremiumBottomSheetDialogFragment2.S();
                if (profilePremiumBottomSheetDialogFragment2.K0 == null) {
                    g76.g0("mediumUris");
                    throw null;
                }
                Uri uri = Uri.parse(i03.i);
                uri.getClass();
                py2Var.a(contextS, uri, ((f3a) profilePremiumBottomSheetDialogFragment2.M0.getValue()).e(), null);
                return c1eVar;
            case 19:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 20:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 21:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 22:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 23:
                ((x2a) this.receiver).a();
                return c1eVar;
            case 24:
                w9a w9aVar = ((e9a) this.receiver).b;
                vx0.c0(f76.F(w9aVar), null, null, new r9a(w9aVar, n92Var, i2), 3);
                return c1eVar;
            case 25:
                w9a w9aVar2 = ((e9a) this.receiver).b;
                vx0.c0(f76.F(w9aVar2), null, null, new r9a(w9aVar2, n92Var, i3), 3);
                return c1eVar;
            case 26:
                w9a w9aVar3 = ((e9a) this.receiver).b;
                vx0.c0(f76.F(w9aVar3), null, null, new r9a(w9aVar3, n92Var, i2), 3);
                return c1eVar;
            case 27:
                ((e9a) this.receiver).c();
                return c1eVar;
            case 28:
                ((e9a) this.receiver).c();
                return c1eVar;
            default:
                ((e9a) this.receiver).c();
                return c1eVar;
        }
    }
}
