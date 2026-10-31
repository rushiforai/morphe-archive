package ld;

import android.util.Log;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import x7.l;

/* loaded from: classes.dex */
public final class d implements b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ eg.c f74859a;

    public d(eg.c cVar) {
        this.f74859a = cVar;
    }

    @Override // ld.b
    public final void a(bg.a aVar) {
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        ((l) this.f74859a).onInitializationFailed(aVar.toString());
    }

    @Override // ld.b
    public final void b() {
        ((l) this.f74859a).onInitializationSucceeded();
    }
}
