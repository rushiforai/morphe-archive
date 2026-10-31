package io.sentry.android.core;

import android.os.Debug;
import android.os.Process;
import android.os.SystemClock;
import io.sentry.ILogger;
import io.sentry.a2;
import io.sentry.g3;
import io.sentry.n1;
import java.io.File;
import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: b, reason: collision with root package name */
    public final File f67012b;

    /* renamed from: c, reason: collision with root package name */
    public final int f67013c;

    /* renamed from: f, reason: collision with root package name */
    public String f67016f;

    /* renamed from: g, reason: collision with root package name */
    public final io.sentry.android.core.internal.util.o f67017g;

    /* renamed from: l, reason: collision with root package name */
    public final a0 f67022l;

    /* renamed from: m, reason: collision with root package name */
    public final io.sentry.o0 f67023m;
    public final ILogger n;

    /* renamed from: a, reason: collision with root package name */
    public long f67011a = 0;

    /* renamed from: d, reason: collision with root package name */
    public Future f67014d = null;

    /* renamed from: e, reason: collision with root package name */
    public File f67015e = null;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayDeque f67018h = new ArrayDeque();

    /* renamed from: i, reason: collision with root package name */
    public final ArrayDeque f67019i = new ArrayDeque();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayDeque f67020j = new ArrayDeque();

    /* renamed from: k, reason: collision with root package name */
    public final HashMap f67021k = new HashMap();
    public boolean o = false;

    public p(String str, int i5, io.sentry.android.core.internal.util.o oVar, io.sentry.o0 o0Var, ILogger iLogger, a0 a0Var) {
        i30.j.Q(str, "TracesFilesDirPath is required");
        this.f67012b = new File(str);
        this.f67013c = i5;
        i30.j.Q(iLogger, "Logger is required");
        this.n = iLogger;
        i30.j.Q(o0Var, "ExecutorService is required.");
        this.f67023m = o0Var;
        i30.j.Q(oVar, "SentryFrameMetricsCollector is required");
        this.f67017g = oVar;
        i30.j.Q(a0Var, "The BuildInfoProvider is required.");
        this.f67022l = a0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0041 A[Catch: all -> 0x0014, TRY_LEAVE, TryCatch #1 {, blocks: (B:3:0x0001, B:5:0x0007, B:10:0x0018, B:12:0x0020, B:17:0x002e, B:19:0x0041, B:22:0x004e, B:24:0x0056, B:25:0x0066, B:27:0x006e, B:28:0x007e, B:30:0x0086, B:31:0x0096, B:33:0x009d, B:34:0x00a3, B:39:0x00b1, B:40:0x00b3, B:11:0x001d, B:15:0x0024), top: B:45:0x0001, inners: #0, #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x004e A[Catch: all -> 0x0014, TRY_ENTER, TryCatch #1 {, blocks: (B:3:0x0001, B:5:0x0007, B:10:0x0018, B:12:0x0020, B:17:0x002e, B:19:0x0041, B:22:0x004e, B:24:0x0056, B:25:0x0066, B:27:0x006e, B:28:0x007e, B:30:0x0086, B:31:0x0096, B:33:0x009d, B:34:0x00a3, B:39:0x00b1, B:40:0x00b3, B:11:0x001d, B:15:0x0024), top: B:45:0x0001, inners: #0, #2 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized ai.w0 a(List list, boolean z11) {
        if (!this.o) {
            this.n.g(g3.WARNING, "Profiler not running", new Object[0]);
            return null;
        }
        this.f67022l.getClass();
        try {
            Debug.stopMethodTracing();
        } finally {
            try {
                this.o = false;
                this.f67017g.a(this.f67016f);
                long jElapsedRealtimeNanos = SystemClock.elapsedRealtimeNanos();
                long elapsedCpuTime = Process.getElapsedCpuTime();
                if (this.f67015e != null) {
                }
            } catch (Throwable th2) {
            }
        }
        this.o = false;
        this.f67017g.a(this.f67016f);
        long jElapsedRealtimeNanos2 = SystemClock.elapsedRealtimeNanos();
        long elapsedCpuTime2 = Process.getElapsedCpuTime();
        if (this.f67015e != null) {
            this.n.g(g3.ERROR, "Trace file does not exists", new Object[0]);
            return null;
        }
        if (!this.f67019i.isEmpty()) {
            this.f67021k.put("slow_frame_renders", new io.sentry.profilemeasurements.a("nanosecond", this.f67019i));
        }
        if (!this.f67020j.isEmpty()) {
            this.f67021k.put("frozen_frame_renders", new io.sentry.profilemeasurements.a("nanosecond", this.f67020j));
        }
        if (!this.f67018h.isEmpty()) {
            this.f67021k.put("screen_frame_rates", new io.sentry.profilemeasurements.a("hz", this.f67018h));
        }
        b(list);
        Future future = this.f67014d;
        if (future != null) {
            future.cancel(true);
            this.f67014d = null;
        }
        return new ai.w0(jElapsedRealtimeNanos2, elapsedCpuTime2, z11, this.f67015e, this.f67021k);
    }

    public final void b(List list) {
        this.f67022l.getClass();
        long jElapsedRealtimeNanos = (SystemClock.elapsedRealtimeNanos() - this.f67011a) - TimeUnit.MILLISECONDS.toNanos(System.currentTimeMillis());
        if (list != null) {
            ArrayDeque arrayDeque = new ArrayDeque(list.size());
            ArrayDeque arrayDeque2 = new ArrayDeque(list.size());
            ArrayDeque arrayDeque3 = new ArrayDeque(list.size());
            synchronized (list) {
                try {
                    Iterator it = list.iterator();
                    while (it.hasNext()) {
                        a2 a2Var = (a2) it.next();
                        io.sentry.h hVar = a2Var.f66740b;
                        n1 n1Var = a2Var.f66739a;
                        if (hVar != null) {
                            arrayDeque3.add(new io.sentry.profilemeasurements.b(Long.valueOf(TimeUnit.MILLISECONDS.toNanos(hVar.f67249a) + jElapsedRealtimeNanos), Double.valueOf(hVar.f67250b)));
                        }
                        if (n1Var != null && n1Var.f67407b > -1) {
                            arrayDeque.add(new io.sentry.profilemeasurements.b(Long.valueOf(TimeUnit.MILLISECONDS.toNanos(n1Var.f67406a) + jElapsedRealtimeNanos), Long.valueOf(n1Var.f67407b)));
                        }
                        if (n1Var != null && n1Var.f67408c > -1) {
                            arrayDeque2.add(new io.sentry.profilemeasurements.b(Long.valueOf(TimeUnit.MILLISECONDS.toNanos(n1Var.f67406a) + jElapsedRealtimeNanos), Long.valueOf(n1Var.f67408c)));
                        }
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (!arrayDeque3.isEmpty()) {
                this.f67021k.put("cpu_usage", new io.sentry.profilemeasurements.a("percent", arrayDeque3));
            }
            if (!arrayDeque.isEmpty()) {
                this.f67021k.put("memory_footprint", new io.sentry.profilemeasurements.a("byte", arrayDeque));
            }
            if (arrayDeque2.isEmpty()) {
                return;
            }
            this.f67021k.put("memory_native_footprint", new io.sentry.profilemeasurements.a("byte", arrayDeque2));
        }
    }
}
