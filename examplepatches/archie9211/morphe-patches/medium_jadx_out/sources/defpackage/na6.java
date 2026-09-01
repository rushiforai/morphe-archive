package defpackage;

import android.net.TrafficStats;
import android.os.Trace;
import android.util.Log;
import com.google.android.gms.analytics.wYI.ivbZv;
import j$.util.Objects;
import java.net.HttpURLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;
import java.util.TreeMap;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.CronetException;
import org.chromium.net.InlineExecutionProhibitedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class na6 extends sgg {
    public static final /* synthetic */ int O = 0;
    public final Executor A;
    public String B;
    public ReadableByteChannel C;
    public i7e D;
    public String E;
    public HttpURLConnection F;
    public la6 G;
    public final u86 H;
    public final int I;
    public final dm2 J;
    public final long K;
    public int L;
    public int M;
    public boolean N;
    public final n0c r;
    public final ma6 s;
    public final String t;
    public final TreeMap u;
    public final ArrayList v;
    public final AtomicInteger w;
    public final AtomicBoolean x;
    public final String y;
    public final u5e z;

    public na6(u86 u86Var, ceg cegVar, ThreadPoolExecutor threadPoolExecutor, Executor executor, String str, String str2, boolean z, int i, long j, String str3, ArrayList arrayList, u5e u5eVar, Executor executor2) {
        u5e u5eVar2;
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        this.u = treeMap;
        this.v = new ArrayList();
        this.w = new AtomicInteger(0);
        this.x = new AtomicBoolean(false);
        grb.f("Cronet JavaUrlRequest#JavaUrlRequest");
        try {
            Objects.requireNonNull(str, "URL is required");
            Objects.requireNonNull(threadPoolExecutor, "Executor is required");
            Objects.requireNonNull(executor, "userExecutor is required");
            this.r = new n0c(this, cegVar, executor);
            this.s = new ma6(new ia6(threadPoolExecutor, z ? i : TrafficStats.getThreadStatsTag()));
            this.H = u86Var;
            this.I = u86Var.x;
            this.J = u86Var.y;
            this.B = str;
            this.t = str2;
            this.K = j;
            d0(str3);
            this.y = str3;
            i0(arrayList);
            if (u5eVar == null) {
                u5eVar2 = null;
            } else {
                if (!treeMap.containsKey("Content-Type")) {
                    throw new IllegalArgumentException("Requests with upload data must have a Content-Type.");
                }
                u5eVar2 = new u5e(1, u5eVar);
            }
            this.z = u5eVar2;
            this.A = executor2 != null ? new qa6(executor2, 0) : executor2;
            Trace.endSection();
        } catch (Throwable th) {
            try {
                Trace.endSection();
                throw th;
            } catch (Throwable th2) {
                th.addSuppressed(th2);
                throw th;
            }
        }
    }

    @Override // defpackage.sgg
    public final void D() {
        int andSet = this.w.getAndSet(8);
        int i = 2;
        if (andSet == 1 || andSet == 2 || andSet == 3 || andSet == 4 || andSet == 5) {
            f0(new ga6(this, i), "fireDisconnect");
            g0();
            i7e i7eVar = this.D;
            n0c n0cVar = this.r;
            na6 na6Var = (na6) n0cVar.e;
            na6Var.f0(new ga6(na6Var, 0), "closeResponseChannel");
            n0cVar.B(new ka6(n0cVar, i7eVar), "onCanceled");
        }
    }

    @Override // defpackage.sgg
    public final void M() {
        j0(3, 1, new jn(9, this));
    }

    @Override // defpackage.sgg
    public final void S(ByteBuffer byteBuffer) {
        if (!byteBuffer.isDirect()) {
            ay0.e("byteBuffer must be a direct ByteBuffer.");
        } else if (!byteBuffer.hasRemaining()) {
            ay0.e("ByteBuffer is already full.");
        } else {
            j0(4, 5, new fi2(this, 14, new lt(this, 9, byteBuffer)));
        }
    }

    @Override // defpackage.sgg
    public final void Y() {
        this.H.z.incrementAndGet();
        j0(0, 1, new ga6(this, 3));
    }

    public final void e0(CronetException cronetException) {
        AtomicInteger atomicInteger;
        int i;
        do {
            atomicInteger = this.w;
            i = atomicInteger.get();
            if (i == 0) {
                ygf.f("Can't enter error state before start");
                return;
            } else if (i == 6 || i == 7 || i == 8) {
                return;
            }
        } while (!atomicInteger.compareAndSet(i, 6));
        f0(new ga6(this, 2), "fireDisconnect");
        g0();
        i7e i7eVar = this.D;
        n0c n0cVar = this.r;
        Executor executor = (Executor) n0cVar.d;
        na6 na6Var = (na6) n0cVar.e;
        na6Var.f0(new ga6(na6Var, 0), "closeResponseChannel");
        ss ssVar = new ss(n0cVar, i7eVar, cronetException, 14);
        try {
            n0cVar.B(ssVar, "onFailed");
        } catch (InlineExecutionProhibitedException unused) {
            if (executor != null) {
                grb.f("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnFallbackExecutor onFailed");
                try {
                    executor.execute(new v0(25, ssVar));
                    Trace.endSection();
                } catch (Throwable th) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th2) {
                        th.addSuppressed(th2);
                    }
                    throw th;
                }
            }
        }
    }

    public final void f0(Runnable runnable, String str) {
        grb.f("Cronet JavaUrlRequest#executeOnExecutor ".concat(str));
        try {
            this.s.execute(new ja6(0, runnable, str));
            Trace.endSection();
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public final void g0() {
        u5e u5eVar = this.z;
        if (u5eVar == null || !this.x.compareAndSet(false, true)) {
            return;
        }
        try {
            this.A.execute(new ha6(this, new f70(24, u5eVar), 2));
        } catch (RejectedExecutionException e) {
            Log.e("na6", "Exception when closing uploadDataProvider", e);
        }
    }

    public final void h0(String str, Exception exc) {
        Log.e("na6", "Exception in " + str + " method", exc);
        this.N = true;
    }

    public final void j0(int i, int i2, Runnable runnable) {
        AtomicInteger atomicInteger = this.w;
        if (!atomicInteger.compareAndSet(i, i2)) {
            int i3 = atomicInteger.get();
            if (i3 == 8 || i3 == 6) {
                return;
            }
            ygf.f(lv8.r("Invalid state transition - expected ", dm2.Y(i), " but was ", dm2.Y(i3)));
            return;
        }
        grb.f("Cronet JavaUrlRequest#transitionStates " + dm2.Y(i) + " -> " + dm2.Y(i2));
        try {
            runnable.run();
            Trace.endSection();
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public static void d0(String str) {
        Objects.requireNonNull(str, "Method is required.");
        if ("OPTIONS".equalsIgnoreCase(str) || "GET".equalsIgnoreCase(str) || "HEAD".equalsIgnoreCase(str) || "POST".equalsIgnoreCase(str) || "PUT".equalsIgnoreCase(str) || ivbZv.fmvG.equalsIgnoreCase(str) || "TRACE".equalsIgnoreCase(str) || "PATCH".equalsIgnoreCase(str)) {
            return;
        }
        ay0.e("Invalid http method ".concat(str));
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:217)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:68)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:102)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:282)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:65)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:125)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public final void i0(java.util.ArrayList r6) {
        /*
            r5 = this;
            java.util.Iterator r6 = r6.iterator()
        L4:
            boolean r0 = r6.hasNext()
            if (r0 == 0) goto L79
            java.lang.Object r0 = r6.next()
            java.util.Map$Entry r0 = (java.util.Map.Entry) r0
            java.lang.Object r1 = r0.getKey()
            java.lang.String r1 = (java.lang.String) r1
            r2 = 0
        L17:
            int r3 = r1.length()
            if (r2 >= r3) goto L49
            char r3 = r1.charAt(r2)
            r4 = 44
            if (r3 == r4) goto L69
            r4 = 47
            if (r3 == r4) goto L69
            r4 = 123(0x7b, float:1.72E-43)
            if (r3 == r4) goto L69
            r4 = 125(0x7d, float:1.75E-43)
            if (r3 == r4) goto L69
            switch(r3) {
                case 39: goto L69;
                case 40: goto L69;
                case 41: goto L69;
                default: goto L34;
            }
        L34:
            switch(r3) {
                case 58: goto L69;
                case 59: goto L69;
                case 60: goto L69;
                case 61: goto L69;
                case 62: goto L69;
                case 63: goto L69;
                case 64: goto L69;
                default: goto L37;
            }
        L37:
            switch(r3) {
                case 91: goto L69;
                case 92: goto L69;
                case 93: goto L69;
                default: goto L3a;
            }
        L3a:
            boolean r4 = java.lang.Character.isISOControl(r3)
            if (r4 != 0) goto L69
            boolean r3 = java.lang.Character.isWhitespace(r3)
            if (r3 != 0) goto L69
            int r2 = r2 + 1
            goto L17
        L49:
            java.lang.Object r1 = r0.getValue()
            java.lang.String r1 = (java.lang.String) r1
            java.lang.String r2 = "\r\n"
            boolean r1 = r1.contains(r2)
            if (r1 != 0) goto L69
            java.lang.Object r1 = r0.getKey()
            java.lang.String r1 = (java.lang.String) r1
            java.lang.Object r0 = r0.getValue()
            java.lang.String r0 = (java.lang.String) r0
            java.util.TreeMap r2 = r5.u
            r2.put(r1, r0)
            goto L4
        L69:
            java.lang.Object r5 = r0.getKey()
            java.lang.String r5 = (java.lang.String) r5
            r6 = 0
            java.lang.String r6 = com.drew.imaging.eps.ld.PdtluglzAX.GjGst
            java.lang.String r5 = defpackage.ka1.r(r6, r5)
            defpackage.ay0.e(r5)
        L79:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.na6.i0(java.util.ArrayList):void");
    }
}
