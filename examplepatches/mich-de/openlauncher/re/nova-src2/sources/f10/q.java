package f10;

import android.os.Bundle;
import android.view.LayoutInflater;
import com.google.android.gms.internal.consent_sdk.e0;
import e10.y2;
import kotlin.NotImplementedError;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import o9.z0;
import t70.j0;
import t70.k0;

/* loaded from: classes.dex */
public abstract class q extends m.m implements za.d, j0 {
    public final /* synthetic */ y70.d o = k0.b();

    /* renamed from: p, reason: collision with root package name */
    public l7.a f54203p;

    /* renamed from: q, reason: collision with root package name */
    public tz.k f54204q;

    /* renamed from: r, reason: collision with root package name */
    public tz.d f54205r;

    /* renamed from: s, reason: collision with root package name */
    public mx.j0 f54206s;

    @Override // za.d
    public final tz.d C() {
        tz.d dVar = this.f54205r;
        if (dVar != null) {
            return dVar;
        }
        Intrinsics.m("novaColorScheme");
        throw null;
    }

    @Override // za.d
    public final mx.j0 P() {
        mx.j0 j0Var = this.f54206s;
        if (j0Var != null) {
            return j0Var;
        }
        Intrinsics.m("deviceProfile");
        throw null;
    }

    public final l7.a Z() {
        l7.a aVar = this.f54203p;
        if (aVar != null) {
            return aVar;
        }
        Intrinsics.m("binding");
        throw null;
    }

    public abstract l7.a a0();

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.o.f96790a;
    }

    @Override // android.app.Activity, za.d
    public final LayoutInflater getLayoutInflater() {
        return super.getLayoutInflater();
    }

    @Override // za.d
    public final tz.k l() {
        tz.k kVar = this.f54204q;
        if (kVar != null) {
            return kVar;
        }
        Intrinsics.m("novaColorSchemeManager");
        throw null;
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public void onCreate(Bundle bundle) {
        mx.j0 j0VarA = ((z0) z0.f80267w.h(this)).a(this);
        Intrinsics.e(j0VarA, "null cannot be cast to non-null type com.teslacoilsw.launcher.NovaDeviceProfile");
        this.f54206s = j0VarA;
        this.f54204q = u90.b.c(this);
        this.f54205r = l().a((getResources().getConfiguration().uiMode & 48) == 32);
        super.onCreate(bundle);
        overridePendingTransition(0, 0);
        e0.d0(getWindow(), true, true);
        getWindow().setStatusBarColor(1023410176);
        this.f54203p = a0();
        setContentView(Z().getRoot());
        Z().getRoot().findViewById(2131427531).setOnClickListener(new ay.k(this, 25));
        if ((getResources().getConfiguration().uiMode & 48) == 32) {
            Z().getRoot().findViewById(2131428303).setBackgroundColor(((Number) y2.f51877a.P0().l()).intValue());
        }
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        k0.c(this, null);
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public void onPause() {
        super.onPause();
        if (isFinishing()) {
            overridePendingTransition(0, 0);
        }
    }

    @Override // za.d
    public final za.j u() {
        throw new NotImplementedError("An operation is not implemented: not implemented");
    }
}
