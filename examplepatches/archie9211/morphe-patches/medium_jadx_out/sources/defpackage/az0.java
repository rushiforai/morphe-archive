package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class az0 extends q62 {
    public final ys0 f;

    public az0(Context context, q7f q7fVar) {
        super(context, q7fVar);
        this.f = new ys0(2, this);
    }

    @Override // defpackage.q62
    public final void e() {
        d87.h().d(bz0.a, getClass().getSimpleName().concat(": registering receiver"));
        ((Context) this.b).registerReceiver(this.f, g());
    }

    @Override // defpackage.q62
    public final void f() {
        d87.h().d(bz0.a, getClass().getSimpleName().concat(": unregistering receiver"));
        ((Context) this.b).unregisterReceiver(this.f);
    }

    public abstract IntentFilter g();

    public abstract void h(Intent intent);
}
