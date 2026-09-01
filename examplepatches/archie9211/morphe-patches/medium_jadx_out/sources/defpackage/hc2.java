package defpackage;

import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hc2 implements Callable {
    public final /* synthetic */ long a;
    public final /* synthetic */ Throwable b;
    public final /* synthetic */ Thread c;
    public final /* synthetic */ iv2 d;
    public final /* synthetic */ jc2 e;

    public hc2(jc2 jc2Var, long j, Throwable th, Thread thread, iv2 iv2Var) {
        this.e = jc2Var;
        this.a = j;
        this.b = th;
        this.c = thread;
        this.d = iv2Var;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        long j = this.a;
        long j2 = j / 1000;
        jc2 jc2Var = this.e;
        String strD = jc2Var.d();
        if (strD == null) {
            Log.e("FirebaseCrashlytics", "Tried to write a fatal exception while no session was open.", null);
            return vp7.x(null);
        }
        jc2Var.c.h0();
        jz1 jz1Var = jc2Var.m;
        String strConcat = "Persisting fatal event for session ".concat(strD);
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", strConcat, null);
        }
        jz1Var.y(this.b, this.c, "crash", new q34(strD, j2, fy3.a), true);
        try {
            if (!new File((File) jc2Var.g.c, ".ae" + j).createNewFile()) {
                throw new IOException("Create new file failed.");
            }
        } catch (IOException e) {
            Log.w("FirebaseCrashlytics", "Could not create app exception marker file.", e);
        }
        iv2 iv2Var = this.d;
        jc2Var.a(false, iv2Var, false);
        jc2Var.b(new r21().a, Boolean.FALSE);
        return !jc2Var.b.a() ? vp7.x(null) : ((wfd) ((AtomicReference) iv2Var.h).get()).a.l((ud2) jc2Var.e.b, new zg7(this, strD));
    }
}
