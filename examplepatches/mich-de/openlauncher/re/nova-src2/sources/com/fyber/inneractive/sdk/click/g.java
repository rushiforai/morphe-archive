package com.fyber.inneractive.sdk.click;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.activities.InternalStoreWebpageActivity;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.network.h1;
import com.fyber.inneractive.sdk.util.d0;
import com.fyber.inneractive.sdk.util.g0;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.web.v0;
import java.util.List;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class g extends a {

    /* renamed from: a, reason: collision with root package name */
    public v0 f27709a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f27710b;

    /* renamed from: c, reason: collision with root package name */
    public f f27711c;

    /* renamed from: d, reason: collision with root package name */
    public final g1 f27712d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.g f27713e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f27714f = false;

    public g(f fVar, g1 g1Var, com.fyber.inneractive.sdk.util.g gVar) {
        this.f27711c = fVar;
        this.f27712d = g1Var;
        this.f27713e = gVar;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final boolean a(Uri uri, r rVar) {
        com.fyber.inneractive.sdk.ignite.m mVar;
        v0 v0Var;
        com.fyber.inneractive.sdk.ignite.m mVar2 = com.fyber.inneractive.sdk.ignite.m.NONE;
        if (rVar != null) {
            mVar = rVar.f27742m;
            this.f27710b = rVar.f27741l;
            this.f27709a = rVar.f27740k;
        } else {
            mVar = mVar2;
        }
        return mVar != mVar2 && IAConfigManager.Q.F.n() && (v0Var = this.f27709a) != null && v0Var.f31396l;
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final b a(Context context, Uri uri, List list) throws JSONException {
        d0 d0Var;
        v0 v0Var = this.f27709a;
        if (v0Var != null) {
            boolean z11 = this.f27710b;
            if (v0Var.C) {
                g0 g0Var = g0.FAILED;
                IllegalStateException illegalStateException = new IllegalStateException("Store controller is already open");
                context.getClass();
                d0Var = new d0(g0Var, illegalStateException);
            } else {
                v0Var.C = true;
                try {
                    context.getClass();
                } catch (Throwable unused) {
                }
                v0Var.D = true;
                if (v0Var.f31394j.equals("invalid_task_id") && !v0Var.f31408z) {
                    v0Var.f31388d = z11 ? com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP : com.fyber.inneractive.sdk.ignite.m.SINGLE_TAP;
                }
                v0Var.B = z11;
                if (v0Var.A) {
                    v0Var.d("onInstallationSuccess();");
                } else if (!v0Var.f31408z) {
                    String str = v0Var.f31387c;
                    PackageInfo packageInfo = !TextUtils.isEmpty(str) ? com.fyber.inneractive.sdk.util.o.f31210a.getPackageManager().getPackageInfo(str, 0) : null;
                    if (packageInfo != null) {
                        v0Var.d("onInstallationSuccess();");
                    } else if (z11) {
                        v0Var.f31386b.a(v0Var.f31387c, new com.fyber.inneractive.sdk.ignite.g(v0Var.f31390f, v0Var.f31388d, v0Var.f31392h.f28392a));
                        v0Var.d("onShowInstallStarted();");
                    }
                }
                try {
                    InternalStoreWebpageActivity.startActivity(context, v0Var.f31389e);
                    d0Var = new d0(g0.OPENED_INTERNAL_STORE, null);
                } catch (ActivityNotFoundException e3) {
                    d0Var = new d0(g0.FAILED, e3);
                }
            }
            Throwable th2 = d0Var.f31181b;
            if (th2 == null) {
                IAConfigManager.Q.f27759s.a(new h1(new e(this, list, uri), uri.toString()));
                return new b(uri.toString(), q.OPEN_INTERNAL_STORE, "IgniteGooglePlay", null);
            }
            if (list != null) {
                list.add(new j(this.f27709a.f31395k, false, q.OPEN_INTERNAL_STORE, th2.toString()));
            }
            return r.a(uri.toString(), "IgniteGooglePlay", "mInternalStoreWebpageController.show has failed");
        }
        return r.a(uri.toString(), "IgniteGooglePlay", "mInternalStoreWebpageController is null");
    }

    @Override // com.fyber.inneractive.sdk.click.a
    public final void a() {
        this.f27714f = true;
        this.f27711c = null;
    }
}
