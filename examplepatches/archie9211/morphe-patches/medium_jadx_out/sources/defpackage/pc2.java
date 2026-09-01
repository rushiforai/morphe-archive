package defpackage;

import android.util.Log;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pc2 {
    public static final rz5 c = new rz5(15);
    public final bw8 a;
    public final AtomicReference b = new AtomicReference(null);

    public pc2(bw8 bw8Var) {
        this.a = bw8Var;
        bw8Var.a(new f70(6, this));
    }

    public final rz5 a() {
        pc2 pc2Var = (pc2) this.b.get();
        return pc2Var == null ? c : pc2Var.a();
    }

    public final boolean b() {
        pc2 pc2Var = (pc2) this.b.get();
        return pc2Var != null && pc2Var.b();
    }

    public final boolean c() {
        pc2 pc2Var = (pc2) this.b.get();
        return pc2Var != null && pc2Var.c();
    }

    public final void d(String str, long j, fk0 fk0Var) {
        String strR = ka1.r("Deferring native open session: ", str);
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", strR, null);
        }
        this.a.a(new oc2(str, j, fk0Var));
    }
}
