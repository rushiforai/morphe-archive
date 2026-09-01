package defpackage;

import android.content.Context;
import android.util.Log;
import java.io.File;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nc2 {
    public final Context a;
    public final ft2 b;
    public final hx4 c;
    public final long d;
    public s26 e;
    public s26 f;
    public jc2 g;
    public final sv5 h;
    public final bh4 i;
    public final vj j;
    public final vj k;
    public final gc2 l;
    public final pc2 m;
    public final olb n;
    public final m50 o;

    public nc2(xj4 xj4Var, sv5 sv5Var, pc2 pc2Var, ft2 ft2Var, vj vjVar, vj vjVar2, bh4 bh4Var, gc2 gc2Var, olb olbVar, m50 m50Var) {
        this.b = ft2Var;
        xj4Var.a();
        this.a = xj4Var.a;
        this.h = sv5Var;
        this.m = pc2Var;
        this.j = vjVar;
        this.k = vjVar2;
        this.i = bh4Var;
        this.l = gc2Var;
        this.n = olbVar;
        this.o = m50Var;
        this.d = System.currentTimeMillis();
        this.c = new hx4();
    }

    public final void a(iv2 iv2Var) {
        m50.l();
        m50.l();
        this.e.h0();
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", "Initialization marker file was created.", null);
        }
        try {
            try {
                this.j.a(new z72(5));
                this.g.g();
                if (!iv2Var.d().b.a) {
                    if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                        Log.d("FirebaseCrashlytics", "Collection of crash reports disabled in Crashlytics settings.", null);
                    }
                    throw new RuntimeException("Collection of crash reports disabled in Crashlytics settings.");
                }
                if (!this.g.c(iv2Var)) {
                    Log.w("FirebaseCrashlytics", "Previous sessions could not be finalized.", null);
                }
                this.g.h(((wfd) ((AtomicReference) iv2Var.h).get()).a);
                c();
            } catch (Exception e) {
                Log.e("FirebaseCrashlytics", "Crashlytics encountered a problem during asynchronous initialization.", e);
                c();
            }
        } catch (Throwable th) {
            c();
            throw th;
        }
    }

    public final void b(iv2 iv2Var) {
        Future<?> futureSubmit = ((ud2) this.o.b).a.submit(new kc2(this, iv2Var, 1));
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", "Crashlytics detected incomplete initialization on previous app launch. Will initialize synchronously.", null);
        }
        try {
            futureSubmit.get(3L, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Log.e("FirebaseCrashlytics", "Crashlytics was interrupted during initialization.", e);
            Thread.currentThread().interrupt();
        } catch (ExecutionException e2) {
            Log.e("FirebaseCrashlytics", "Crashlytics encountered a problem during initialization.", e2);
        } catch (TimeoutException e3) {
            Log.e("FirebaseCrashlytics", "Crashlytics timed out during initialization.", e3);
        }
    }

    public final void c() {
        m50.l();
        try {
            s26 s26Var = this.e;
            bh4 bh4Var = (bh4) s26Var.c;
            if (new File((File) bh4Var.c, (String) s26Var.b).delete()) {
                return;
            }
            Log.w("FirebaseCrashlytics", "Initialization marker file was not properly removed.", null);
        } catch (Exception e) {
            Log.e("FirebaseCrashlytics", "Problem encountered deleting Crashlytics initialization marker.", e);
        }
    }
}
