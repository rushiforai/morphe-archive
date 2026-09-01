package defpackage;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.FacebookException;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Date;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lv97;", "Lj15;", "<init>", "()V", "facebook-common_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public class v97 extends j15 {
    public String m0;
    public m87 n0;
    public p87 o0;
    public k7 p0;
    public View q0;

    @Override // defpackage.j15
    public final void A(Bundle bundle) {
        Bundle bundleExtra;
        super.A(bundle);
        p87 p87Var = bundle != null ? (p87) bundle.getParcelable("loginClient") : null;
        if (p87Var == null) {
            p87Var = new p87();
            p87Var.b = -1;
            if (p87Var.c != null) {
                throw new FacebookException("Can't set fragment once it is already set.");
            }
            p87Var.c = this;
        } else {
            if (p87Var.c != null) {
                throw new FacebookException("Can't set fragment once it is already set.");
            }
            p87Var.c = this;
        }
        this.o0 = p87Var;
        Y().d = new f70(26, this);
        m15 m15VarG = g();
        if (m15VarG == null) {
            return;
        }
        ComponentName callingActivity = m15VarG.getCallingActivity();
        if (callingActivity != null) {
            this.m0 = callingActivity.getPackageName();
        }
        Intent intent = m15VarG.getIntent();
        if (intent != null && (bundleExtra = intent.getBundleExtra("com.facebook.LoginFragment:Request")) != null) {
            this.n0 = (m87) bundleExtra.getParcelable("request");
        }
        this.p0 = P(new g7(4), new t7(1, new jr(this, 9, m15VarG)));
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        View viewInflate = layoutInflater.inflate(R.layout.com_facebook_login_fragment, viewGroup, false);
        View viewFindViewById = viewInflate.findViewById(R.id.com_facebook_login_fragment_progress_bar);
        viewFindViewById.getClass();
        this.q0 = viewFindViewById;
        Y().e = new my6(this);
        return viewInflate;
    }

    @Override // defpackage.j15
    public final void C() {
        ba7 ba7VarF = Y().f();
        if (ba7VarF != null) {
            ba7VarF.b();
        }
        this.E = true;
    }

    @Override // defpackage.j15
    public final void H() {
        this.E = true;
        View view = this.G;
        View viewFindViewById = view != null ? view.findViewById(R.id.com_facebook_login_fragment_progress_bar) : null;
        if (viewFindViewById != null) {
            viewFindViewById.setVisibility(8);
        }
    }

    @Override // defpackage.j15
    public final void I() {
        this.E = true;
        if (this.m0 == null) {
            Log.e("LoginFragment", "Cannot call LoginFragment with a null calling package. This can occur if the launchMode of the caller is singleInstance.");
            m15 m15VarG = g();
            if (m15VarG != null) {
                m15VarG.finish();
                return;
            }
            return;
        }
        p87 p87VarY = Y();
        m87 m87Var = this.n0;
        m87 m87Var2 = p87VarY.g;
        if ((m87Var2 == null || p87VarY.b < 0) && m87Var != null) {
            ea7 ea7Var = m87Var.n;
            if (m87Var2 != null) {
                throw new FacebookException("Attempted to authorize while a request is pending.");
            }
            Date date = w3.l;
            if (!wgf.B() || p87VarY.b()) {
                p87VarY.g = m87Var;
                ArrayList arrayList = new ArrayList();
                l87 l87Var = m87Var.a;
                ea7 ea7Var2 = ea7.INSTAGRAM;
                if (ea7Var != ea7Var2) {
                    if (l87Var.allowsGetTokenAuth()) {
                        qc5 qc5Var = new qc5();
                        qc5Var.b = p87VarY;
                        arrayList.add(qc5Var);
                    }
                    if (!f94.p && l87Var.allowsKatanaAuth()) {
                        arrayList.add(new dk6(p87VarY));
                    }
                } else if (!f94.p && l87Var.allowsInstagramAppAuth()) {
                    arrayList.add(new n36(p87VarY));
                }
                if (l87Var.allowsCustomTabAuth()) {
                    arrayList.add(new am2(p87VarY));
                }
                if (l87Var.allowsWebViewAuth()) {
                    arrayList.add(new e2f(p87VarY));
                }
                if (ea7Var != ea7Var2 && l87Var.allowsDeviceAuth()) {
                    ua3 ua3Var = new ua3();
                    ua3Var.b = p87VarY;
                    arrayList.add(ua3Var);
                }
                p87VarY.a = (ba7[]) arrayList.toArray(new ba7[0]);
                p87VarY.j();
            }
        }
    }

    @Override // defpackage.j15
    public final void J(Bundle bundle) {
        bundle.putParcelable("loginClient", Y());
    }

    public final p87 Y() {
        p87 p87Var = this.o0;
        if (p87Var != null) {
            return p87Var;
        }
        g76.g0("loginClient");
        throw null;
    }

    @Override // defpackage.j15
    public final void x(int i, int i2, Intent intent) {
        super.x(i, i2, intent);
        Y().i(i, i2, intent);
    }
}
