package com.vungle.ads.internal.task;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r implements g {

    /* renamed from: g, reason: collision with root package name */
    public static final Handler f47548g = new Handler(Looper.getMainLooper());

    /* renamed from: h, reason: collision with root package name */
    public static final String f47549h = "r";

    /* renamed from: a, reason: collision with root package name */
    public final d f47550a;

    /* renamed from: b, reason: collision with root package name */
    public final Executor f47551b;

    /* renamed from: c, reason: collision with root package name */
    public final m f47552c;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f47553d;

    /* renamed from: e, reason: collision with root package name */
    public final q f47554e;

    /* renamed from: f, reason: collision with root package name */
    public long f47555f;

    public r(d creator, com.vungle.ads.internal.executor.j executor, h hVar) {
        Intrinsics.g(creator, "creator");
        Intrinsics.g(executor, "executor");
        this.f47550a = creator;
        this.f47551b = executor;
        this.f47552c = hVar;
        this.f47555f = Long.MAX_VALUE;
        this.f47553d = new CopyOnWriteArrayList();
        this.f47554e = new q(new WeakReference(this));
    }

    public final synchronized void a(e jobInfo) {
        try {
            Intrinsics.g(jobInfo, "jobInfo");
            e eVarA = jobInfo.a();
            if (eVarA != null) {
                String strD = eVarA.d();
                long jB = eVarA.b();
                eVarA.g();
                if (eVarA.f()) {
                    Iterator it = this.f47553d.iterator();
                    while (it.hasNext()) {
                        p pVar = (p) it.next();
                        e eVarA2 = pVar.a();
                        if (Intrinsics.b(eVarA2 != null ? eVarA2.d() : null, strD)) {
                            boolean z11 = u.f47714a;
                            String TAG = f47549h;
                            Intrinsics.f(TAG, "TAG");
                            t.a(TAG, "replacing pending job with new " + strD);
                            this.f47553d.remove(pVar);
                        }
                    }
                }
                this.f47553d.add(new p(SystemClock.uptimeMillis() + jB, eVarA));
                a();
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void a() {
        try {
            long jUptimeMillis = SystemClock.uptimeMillis();
            Iterator it = this.f47553d.iterator();
            long jMin = Long.MAX_VALUE;
            while (it.hasNext()) {
                p pVar = (p) it.next();
                long j11 = pVar.f47545a;
                if (jUptimeMillis >= j11) {
                    this.f47553d.remove(pVar);
                    e eVar = pVar.f47546b;
                    if (eVar != null) {
                        this.f47551b.execute(new f(eVar, this.f47550a, this, this.f47552c));
                    }
                } else {
                    jMin = Math.min(jMin, j11);
                }
            }
            if (jMin != Long.MAX_VALUE && jMin != this.f47555f) {
                Handler handler = f47548g;
                handler.removeCallbacks(this.f47554e);
                handler.postAtTime(this.f47554e, f47549h, jMin);
            }
            this.f47555f = jMin;
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
