package defpackage;

import android.util.Log;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vj {
    public final /* synthetic */ wj a;

    public /* synthetic */ vj(wj wjVar) {
        this.a = wjVar;
    }

    public void a(z72 z72Var) {
        wj wjVar = this.a;
        synchronized (wjVar) {
            ((ArrayList) wjVar.a).add(z72Var);
            Object obj = wjVar.c;
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", "Could not register handler for breadcrumbs events.", null);
            }
        }
    }
}
