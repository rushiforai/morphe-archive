package defpackage;

import android.content.Context;
import android.net.ConnectivityManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class re8 extends q62 {
    public final ConnectivityManager f;
    public final Object g;
    public volatile boolean h;
    public final j16 i;

    public re8(Context context, q7f q7fVar) {
        super(context, q7fVar);
        Object systemService = ((Context) this.b).getSystemService("connectivity");
        systemService.getClass();
        this.f = (ConnectivityManager) systemService;
        this.g = new Object();
        this.i = new j16(this);
    }

    @Override // defpackage.q62
    public final Object c() {
        return pe8.a(this.f, this.h);
    }

    @Override // defpackage.q62
    public final void e() {
        try {
            d87.h().d(pe8.a, "Registering network callback");
            o6.q(this.f, this.i);
        } catch (IllegalArgumentException e) {
            d87.h().g(pe8.a, "Received exception while registering network callback", e);
        } catch (SecurityException e2) {
            d87.h().g(pe8.a, "Received exception while registering network callback", e2);
        }
    }

    @Override // defpackage.q62
    public final void f() {
        try {
            d87.h().d(pe8.a, "Unregistering network callback");
            this.f.unregisterNetworkCallback(this.i);
        } catch (IllegalArgumentException e) {
            d87.h().g(pe8.a, "Received exception while unregistering network callback", e);
        } catch (SecurityException e2) {
            d87.h().g(pe8.a, "Received exception while unregistering network callback", e2);
        }
    }
}
