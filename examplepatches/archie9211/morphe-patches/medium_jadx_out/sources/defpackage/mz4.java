package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Handler;
import j$.util.DesugarCollections;
import j$.util.Objects;
import java.util.ArrayList;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mz4 implements xw3 {
    public final Context a;
    public final lz4 b;
    public final Object c = new Object();
    public Handler d;
    public ThreadPoolExecutor e;
    public ThreadPoolExecutor f;
    public ht2 g;

    public mz4(Context context, lz4 lz4Var) {
        jq7.h("Context cannot be null", context);
        this.a = context.getApplicationContext();
        this.b = lz4Var;
    }

    @Override // defpackage.xw3
    public final void a(ht2 ht2Var) {
        synchronized (this.c) {
            this.g = ht2Var;
        }
        c();
    }

    public final void b() {
        synchronized (this.c) {
            try {
                this.g = null;
                Handler handler = this.d;
                if (handler != null) {
                    handler.removeCallbacks(null);
                }
                this.d = null;
                ThreadPoolExecutor threadPoolExecutor = this.f;
                if (threadPoolExecutor != null) {
                    threadPoolExecutor.shutdown();
                }
                this.e = null;
                this.f = null;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void c() {
        synchronized (this.c) {
            try {
                if (this.g == null) {
                    return;
                }
                ThreadPoolExecutor threadPoolExecutor = this.e;
                if (threadPoolExecutor == null) {
                    ThreadPoolExecutor threadPoolExecutor2 = new ThreadPoolExecutor(0, 1, 15L, TimeUnit.SECONDS, new LinkedBlockingDeque(), new g32("emojiCompat"));
                    threadPoolExecutor2.allowCoreThreadTimeOut(true);
                    this.f = threadPoolExecutor2;
                    this.e = threadPoolExecutor2;
                    threadPoolExecutor = threadPoolExecutor2;
                }
                threadPoolExecutor.execute(new v0(22, this));
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final g05 d() {
        try {
            Context context = this.a;
            Object[] objArr = {this.b};
            ArrayList arrayList = new ArrayList(1);
            Object obj = objArr[0];
            Objects.requireNonNull(obj);
            arrayList.add(obj);
            f05 f05VarA = kz4.a(context, DesugarCollections.unmodifiableList(arrayList));
            int i = f05VarA.a;
            if (i != 0) {
                ygf.i(ev6.w("fetchFonts failed (", i, ")"));
                return null;
            }
            g05[] g05VarArr = (g05[]) f05VarA.b.get(0);
            if (g05VarArr != null && g05VarArr.length != 0) {
                return g05VarArr[0];
            }
            ygf.i("fetchFonts failed (empty result)");
            return null;
        } catch (PackageManager.NameNotFoundException e) {
            lg8.p("provider not found", e);
            return null;
        }
    }
}
