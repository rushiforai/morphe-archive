package v7;

import android.content.Context;
import android.net.ConnectivityManager;
import k30.d0;
import kotlin.jvm.internal.Intrinsics;
import o7.r;
import y7.k;

/* loaded from: classes.dex */
public final class g extends e {

    /* renamed from: f, reason: collision with root package name */
    public final ConnectivityManager f92133f;

    /* renamed from: g, reason: collision with root package name */
    public final d0 f92134g;

    public g(Context context, a8.c cVar) {
        super(context, cVar);
        Object systemService = this.f92128b.getSystemService("connectivity");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
        this.f92133f = (ConnectivityManager) systemService;
        this.f92134g = new d0(this, 3);
    }

    @Override // v7.e
    public final Object a() {
        return h.a(this.f92133f);
    }

    @Override // v7.e
    public final void c() {
        try {
            r rVarC = r.c();
            String str = h.f92135a;
            rVarC.getClass();
            k.a(this.f92133f, this.f92134g);
        } catch (IllegalArgumentException e3) {
            r.c().b(h.f92135a, "Received exception while registering network callback", e3);
        } catch (SecurityException e11) {
            r.c().b(h.f92135a, "Received exception while registering network callback", e11);
        }
    }

    @Override // v7.e
    public final void d() {
        try {
            r rVarC = r.c();
            String str = h.f92135a;
            rVarC.getClass();
            y7.i.c(this.f92133f, this.f92134g);
        } catch (IllegalArgumentException e3) {
            r.c().b(h.f92135a, "Received exception while unregistering network callback", e3);
        } catch (SecurityException e11) {
            r.c().b(h.f92135a, "Received exception while unregistering network callback", e11);
        }
    }
}
