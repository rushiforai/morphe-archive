package jd;

import android.util.Log;
import com.google.ads.mediation.pangle.PangleMediationAdapter;
import x7.l;

/* loaded from: classes.dex */
public final class d implements b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ eg.c f69481a;

    public d(eg.c cVar) {
        this.f69481a = cVar;
    }

    @Override // jd.b
    public final void a(bg.a aVar) {
        Log.w(PangleMediationAdapter.TAG, aVar.toString());
        ((l) this.f69481a).onInitializationFailed(aVar.f17862b);
    }

    @Override // jd.b
    public final void b() {
        ((l) this.f69481a).onInitializationSucceeded();
    }
}
