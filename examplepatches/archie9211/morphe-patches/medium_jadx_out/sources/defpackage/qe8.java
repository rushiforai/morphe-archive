package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qe8 extends az0 {
    public final ConnectivityManager g;

    public qe8(Context context, q7f q7fVar) {
        super(context, q7fVar);
        Object systemService = ((Context) this.b).getSystemService("connectivity");
        systemService.getClass();
        this.g = (ConnectivityManager) systemService;
    }

    @Override // defpackage.q62
    public final Object c() {
        return pe8.a(this.g, false);
    }

    @Override // defpackage.az0
    public final IntentFilter g() {
        return new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
    }

    @Override // defpackage.az0
    public final void h(Intent intent) {
        if (g76.L(intent.getAction(), "android.net.conn.CONNECTIVITY_CHANGE")) {
            d87.h().d(pe8.a, "Network broadcast received");
            d(pe8.a(this.g, false));
        }
    }
}
