package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.google.firebase.messaging.FirebaseMessaging;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ppd {
    public final Context a;
    public final e4 b;
    public final nig c;
    public final FirebaseMessaging d;
    public final ScheduledThreadPoolExecutor f;
    public final npd h;
    public final y70 e = new y70(0);
    public boolean g = false;

    public ppd(FirebaseMessaging firebaseMessaging, e4 e4Var, npd npdVar, nig nigVar, Context context, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor) {
        this.d = firebaseMessaging;
        this.b = e4Var;
        this.h = npdVar;
        this.c = nigVar;
        this.a = context;
        this.f = scheduledThreadPoolExecutor;
    }

    public static void a(jrg jrgVar) throws IOException {
        try {
            vp7.i(jrgVar, 30L, TimeUnit.SECONDS);
        } catch (InterruptedException | TimeoutException e) {
            throw new IOException("SERVICE_NOT_AVAILABLE", e);
        } catch (ExecutionException e2) {
            Throwable cause = e2.getCause();
            if (cause instanceof IOException) {
                throw ((IOException) cause);
            }
            if (!(cause instanceof RuntimeException)) {
                throw new IOException(e2);
            }
            throw ((RuntimeException) cause);
        }
    }

    public static boolean c() {
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            return true;
        }
        return Build.VERSION.SDK_INT == 23 && Log.isLoggable("FirebaseMessaging", 3);
    }

    public final void b(String str) throws IOException {
        String strA = this.d.a();
        Bundle bundle = new Bundle();
        bundle.putString("gcm.topic", "/topics/".concat(str));
        bundle.putString("delete", "1");
        String strConcat = "/topics/".concat(str);
        nig nigVar = this.c;
        a(nigVar.h(nigVar.G(strA, strConcat, bundle)));
    }

    public final void d(cpd cpdVar) {
        synchronized (this.e) {
            try {
                String str = cpdVar.c;
                if (this.e.containsKey(str)) {
                    ArrayDeque arrayDeque = (ArrayDeque) this.e.get(str);
                    wfd wfdVar = (wfd) arrayDeque.poll();
                    if (wfdVar != null) {
                        wfdVar.b(null);
                    }
                    if (arrayDeque.isEmpty()) {
                        this.e.remove(str);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final synchronized void e(boolean z) {
        this.g = z;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00a7 A[Catch: IOException -> 0x005d, TryCatch #1 {IOException -> 0x005d, blocks: (B:15:0x0028, B:32:0x00a7, B:34:0x00ad, B:20:0x0039, B:22:0x0041, B:24:0x004a, B:27:0x005f, B:29:0x0067, B:31:0x0094), top: B:54:0x0028 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean f() throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 283
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ppd.f():boolean");
    }

    public final void g(long j) {
        this.f.schedule(new rpd(this, this.a, this.b, Math.min(Math.max(30L, 2 * j), 28800L)), j, TimeUnit.SECONDS);
        e(true);
    }
}
