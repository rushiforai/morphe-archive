package defpackage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.susi.ui.auth.AuthFragment;
import com.medium.android.susi.ui.signIn.SignInFragment;
import com.medium.reader.R;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wc0 implements ec0 {
    public final /* synthetic */ yd0 a;
    public final /* synthetic */ zg7 b;
    public final /* synthetic */ iy6 c;
    public final /* synthetic */ String d;
    public final /* synthetic */ Context e;
    public final /* synthetic */ vq6 f;
    public final /* synthetic */ aa7 g;
    public final /* synthetic */ o41 h;
    public final /* synthetic */ Activity i;
    public final /* synthetic */ List j;

    public wc0(yd0 yd0Var, zg7 zg7Var, iy6 iy6Var, String str, Context context, vq6 vq6Var, aa7 aa7Var, o41 o41Var, Activity activity, List list) {
        this.a = yd0Var;
        this.b = zg7Var;
        this.c = iy6Var;
        this.d = str;
        this.e = context;
        this.f = vq6Var;
        this.g = aa7Var;
        this.h = o41Var;
        this.i = activity;
        this.j = list;
    }

    @Override // defpackage.ec0
    public final void a(SusiOperation susiOperation) {
        susiOperation.getClass();
        yd0 yd0Var = this.a;
        vx0.c0(f76.F(yd0Var), null, null, new rd0(yd0Var, null, 4), 3);
        yd0Var.h.d(l3d.GOOGLE, yd0Var.e, yd0Var.g(), yd0Var.i(), yd0Var.c);
        vx0.c0(o7f.x(this.c), null, null, new b9(susiOperation, this.d, this.e, yd0Var, this.f, (n92) null, 8), 3);
    }

    @Override // defpackage.ec0
    public final void b(SusiOperation susiOperation, SusiDestination susiDestination, String str, boolean z) {
        AuthFragment authFragment = (AuthFragment) this.b.b;
        susiOperation.getClass();
        yd0 yd0Var = this.a;
        yd0Var.h.d(l3d.MEDIUM, yd0Var.e, yd0Var.g(), yd0Var.i(), yd0Var.c);
        int i = vc0.a[susiOperation.ordinal()];
        if (i != 1) {
            if (i == 2) {
                b09.T(authFragment.i1(), str, null, null, susiDestination, z, 6);
                return;
            } else {
                ygf.a();
                return;
            }
        }
        lig ligVarI1 = authFragment.i1();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new SignInFragment.BundleInfo(str, "", susiDestination, z));
        ligVarI1.W(R.id.signInFragment, bundle);
    }

    @Override // defpackage.ec0
    public final void c() {
        SusiOperation susiOperation;
        yd0 yd0Var = this.a;
        int i = pd0.a[yd0Var.e.ordinal()];
        if (i == 1) {
            susiOperation = SusiOperation.LOGIN;
        } else {
            if (i != 2) {
                ygf.a();
                return;
            }
            susiOperation = SusiOperation.REGISTER;
        }
        yd0Var.e = susiOperation;
        n92 n92Var = null;
        vx0.c0(f76.F(yd0Var), null, null, new j0(yd0Var, susiOperation, n92Var, 23), 3);
        vx0.c0(f76.F(yd0Var), null, null, new z8(yd0Var, n92Var, 13), 3);
    }

    @Override // defpackage.ec0
    public final void d() {
        vx0.c0(o7f.x(this.c), null, null, new l0(this.a, this.i, null, 14), 3);
    }

    @Override // defpackage.ec0
    public final void e() {
        yd0 yd0Var = this.a;
        vx0.c0(f76.F(yd0Var), null, null, new rd0(yd0Var, null, 3), 3);
        yd0Var.h.d(l3d.FACEBOOK, yd0Var.e, yd0Var.g(), yd0Var.i(), yd0Var.c);
        Date date = w3.l;
        w3 w3VarR = wgf.r();
        if (w3VarR != null) {
            yd0Var.f(w3VarR);
            return;
        }
        pkf pkfVar = new pkf(yd0Var);
        aa7 aa7Var = this.g;
        aa7Var.d(this.h, pkfVar);
        Activity activity = this.i;
        if (activity == null) {
            ay0.e("Required value was null.");
            return;
        }
        List list = this.j;
        aa7.g(list);
        ku3 ku3Var = new ku3((Collection) list);
        if (activity instanceof v7) {
            Log.w(aa7.g, "You're calling logging in Facebook with an activity supports androidx activity result APIs. Please follow our document to upgrade to new APIs to avoid overriding onActivityResult().");
        }
        aa7Var.e(new md5(activity), aa7Var.a(ku3Var));
    }

    @Override // defpackage.ec0
    public final void f(String str) {
        yd0 yd0Var = this.a;
        vx0.c0(f76.F(yd0Var), null, null, new rd0(yd0Var, null, 1), 3);
        yd0Var.h.d(l3d.APPLE, yd0Var.e, yd0Var.g(), yd0Var.i(), yd0Var.c);
        s0 s0Var = new s0(7, yd0Var);
        AuthFragment authFragment = (AuthFragment) this.b.b;
        authFragment.m().a0("apple_auth_result", authFragment, new f70(2, s0Var));
        lig ligVarI1 = authFragment.i1();
        Bundle bundle = new Bundle();
        bundle.putParcelable("bundle_info", new AbstractMediumFragment.BundleInfo(str));
        ligVarI1.W(R.id.appleAuthFragment, bundle);
    }

    public final void g(l3d l3dVar) {
        l3dVar.getClass();
        this.a.k(l3dVar);
    }
}
