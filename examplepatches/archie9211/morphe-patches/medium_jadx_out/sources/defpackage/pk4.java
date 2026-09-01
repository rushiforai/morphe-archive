package defpackage;

import android.app.Application;
import android.content.Context;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pk4 {
    public final xj4 a;
    public final o1c b;

    public pk4(xj4 xj4Var, o1c o1cVar, ib2 ib2Var, m1c m1cVar) {
        xj4Var.getClass();
        o1cVar.getClass();
        ib2Var.getClass();
        m1cVar.getClass();
        this.a = xj4Var;
        this.b = o1cVar;
        Log.d("FirebaseSessions", "Initializing Firebase Sessions 3.0.6.");
        xj4Var.a();
        Context applicationContext = xj4Var.a.getApplicationContext();
        if (applicationContext instanceof Application) {
            ((Application) applicationContext).registerActivityLifecycleCallbacks(m1cVar);
            vx0.c0(o7f.c(ib2Var), null, null, new xs3(this, m1cVar, null, 5), 3);
        } else {
            Log.e("FirebaseSessions", "Failed to register lifecycle callbacks, unexpected context " + applicationContext.getClass() + '.');
        }
    }
}
