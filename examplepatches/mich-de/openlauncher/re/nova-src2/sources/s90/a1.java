package s90;

import ai.h2;
import android.net.TrafficStats;
import android.os.Trace;
import android.util.Log;
import java.net.HttpURLConnection;
import java.nio.ByteBuffer;
import java.nio.channels.ReadableByteChannel;
import java.util.ArrayList;
import java.util.Objects;
import java.util.TreeMap;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import o9.d4;
import org.chromium.net.CronetException;
import org.chromium.net.ExperimentalUrlRequest;
import org.chromium.net.InlineExecutionProhibitedException;
import org.chromium.net.UploadDataProvider;
import org.chromium.net.UrlRequest;

/* loaded from: classes5.dex */
public final class a1 extends ExperimentalUrlRequest {

    /* renamed from: z, reason: collision with root package name */
    public static final /* synthetic */ int f86852z = 0;

    /* renamed from: a, reason: collision with root package name */
    public final x0 f86853a;

    /* renamed from: b, reason: collision with root package name */
    public final z0 f86854b;

    /* renamed from: c, reason: collision with root package name */
    public final String f86855c;

    /* renamed from: d, reason: collision with root package name */
    public final TreeMap f86856d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f86857e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicInteger f86858f;

    /* renamed from: g, reason: collision with root package name */
    public final AtomicBoolean f86859g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f86860h;

    /* renamed from: i, reason: collision with root package name */
    public final String f86861i;

    /* renamed from: j, reason: collision with root package name */
    public final q90.a f86862j;

    /* renamed from: k, reason: collision with root package name */
    public final Executor f86863k;

    /* renamed from: l, reason: collision with root package name */
    public volatile int f86864l;

    /* renamed from: m, reason: collision with root package name */
    public String f86865m;
    public ReadableByteChannel n;
    public g1 o;

    /* renamed from: p, reason: collision with root package name */
    public String f86866p;

    /* renamed from: q, reason: collision with root package name */
    public HttpURLConnection f86867q;

    /* renamed from: r, reason: collision with root package name */
    public y0 f86868r;

    /* renamed from: s, reason: collision with root package name */
    public final i0 f86869s;

    /* renamed from: t, reason: collision with root package name */
    public final int f86870t;

    /* renamed from: u, reason: collision with root package name */
    public final e0 f86871u;

    /* renamed from: v, reason: collision with root package name */
    public final long f86872v;

    /* renamed from: w, reason: collision with root package name */
    public int f86873w;

    /* renamed from: x, reason: collision with root package name */
    public int f86874x;

    /* renamed from: y, reason: collision with root package name */
    public boolean f86875y;

    public a1(i0 i0Var, UrlRequest.Callback callback, ThreadPoolExecutor threadPoolExecutor, Executor executor, String str, String str2, boolean z11, boolean z12, int i5, boolean z13, int i11, long j11, String str3, ArrayList arrayList, UploadDataProvider uploadDataProvider, Executor executor2) {
        q90.a aVar;
        TreeMap treeMap = new TreeMap(String.CASE_INSENSITIVE_ORDER);
        this.f86856d = treeMap;
        this.f86857e = new ArrayList();
        this.f86858f = new AtomicInteger(0);
        this.f86859g = new AtomicBoolean(false);
        this.f86864l = -1;
        p90.a.a("Cronet JavaUrlRequest#JavaUrlRequest");
        try {
            Objects.requireNonNull(str, "URL is required");
            Objects.requireNonNull(callback, "Listener is required");
            Objects.requireNonNull(threadPoolExecutor, "Executor is required");
            Objects.requireNonNull(executor, "userExecutor is required");
            this.f86860h = z11;
            this.f86853a = new x0(this, callback, executor);
            this.f86854b = new z0(new t0(threadPoolExecutor, z12 ? i5 : TrafficStats.getThreadStatsTag(), z13, i11));
            this.f86869s = i0Var;
            this.f86870t = i0Var.f86962c;
            this.f86871u = i0Var.f86963d;
            this.f86865m = str;
            this.f86855c = str2;
            this.f86872v = j11;
            b(str3);
            this.f86861i = str3;
            f(arrayList);
            if (uploadDataProvider == null) {
                aVar = null;
            } else {
                if (!treeMap.containsKey("Content-Type")) {
                    throw new IllegalArgumentException("Requests with upload data must have a Content-Type.");
                }
                aVar = new q90.a(uploadDataProvider, 1);
            }
            this.f86862j = aVar;
            this.f86863k = (executor2 == null || z11) ? executor2 : new h2(executor2, 1);
            Trace.endSection();
        } catch (Throwable th2) {
            try {
                Trace.endSection();
                throw th2;
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
                throw th2;
            }
        }
    }

    public static void a(a1 a1Var, String str, Exception exc) {
        Log.e("a1", "Exception in " + str + " method", exc);
        a1Var.f86875y = true;
    }

    public static void b(String str) {
        Objects.requireNonNull(str, "Method is required.");
        if (!"OPTIONS".equalsIgnoreCase(str) && !"GET".equalsIgnoreCase(str) && !"HEAD".equalsIgnoreCase(str) && !"POST".equalsIgnoreCase(str) && !"PUT".equalsIgnoreCase(str) && !"DELETE".equalsIgnoreCase(str) && !"TRACE".equalsIgnoreCase(str) && !"PATCH".equalsIgnoreCase(str)) {
            throw new IllegalArgumentException("Invalid http method ".concat(str));
        }
    }

    public final void c(CronetException cronetException) {
        AtomicInteger atomicInteger;
        int i5;
        do {
            atomicInteger = this.f86858f;
            i5 = atomicInteger.get();
            if (i5 == 0) {
                throw new IllegalStateException("Can't enter error state before start");
            }
            if (i5 == 6 || i5 == 7 || i5 == 8) {
                return;
            }
        } while (!atomicInteger.compareAndSet(i5, 6));
        d("fireDisconnect", new q0(this, 2));
        e();
        g1 g1Var = this.o;
        x0 x0Var = this.f86853a;
        Executor executor = x0Var.f87057c;
        a1 a1Var = x0Var.f87058d;
        a1Var.d("closeResponseChannel", new q0(a1Var, 0));
        r0 r0Var = new r0(1, x0Var, g1Var, cronetException);
        try {
            x0Var.c("onFailed", r0Var);
        } catch (InlineExecutionProhibitedException unused) {
            if (executor != null) {
                p90.a.a("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnFallbackExecutor onFailed");
                try {
                    executor.execute(new d4(r0Var, 6));
                    Trace.endSection();
                } catch (Throwable th2) {
                    try {
                        Trace.endSection();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        }
    }

    @Override // org.chromium.net.UrlRequest
    public final void cancel() {
        int andSet = this.f86858f.getAndSet(8);
        if (andSet == 1 || andSet == 2 || andSet == 3 || andSet == 4 || andSet == 5) {
            d("fireDisconnect", new q0(this, 2));
            e();
            g1 g1Var = this.o;
            x0 x0Var = this.f86853a;
            a1 a1Var = x0Var.f87058d;
            a1Var.d("closeResponseChannel", new q0(a1Var, 0));
            x0Var.c("onCanceled", new w0(x0Var, g1Var, 0));
        }
    }

    public final void d(String str, Runnable runnable) {
        p90.a.a("Cronet JavaUrlRequest#executeOnExecutor ".concat(str));
        try {
            this.f86854b.execute(new u0(0, str, runnable));
            Trace.endSection();
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    public final void e() {
        q90.a aVar = this.f86862j;
        if (aVar == null || !this.f86859g.compareAndSet(false, true)) {
            return;
        }
        try {
            this.f86863k.execute(new o0(this, new k30.e(aVar, 20), 0));
        } catch (RejectedExecutionException e3) {
            Log.e("a1", "Exception when closing uploadDataProvider", e3);
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:101)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:95)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:124)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public final void f(java.util.ArrayList r6) {
        /*
            r5 = this;
            java.util.Iterator r6 = r6.iterator()
        L4:
            boolean r0 = r6.hasNext()
            if (r0 == 0) goto L7b
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
            java.util.TreeMap r2 = r5.f86856d
            r2.put(r1, r0)
            goto L4
        L69:
            java.lang.IllegalArgumentException r6 = new java.lang.IllegalArgumentException
            java.lang.Object r0 = r0.getKey()
            java.lang.String r0 = (java.lang.String) r0
            java.lang.String r1 = "Invalid header with headername: "
            java.lang.String r0 = b.c0.k(r1, r0)
            r6.<init>(r0)
            throw r6
        L7b:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: s90.a1.f(java.util.ArrayList):void");
    }

    @Override // org.chromium.net.UrlRequest
    public final void followRedirect() {
        g(3, 1, new o7.g0(this, 17));
    }

    public final void g(int i5, int i11, Runnable runnable) {
        AtomicInteger atomicInteger = this.f86858f;
        if (!atomicInteger.compareAndSet(i5, i11)) {
            int i12 = atomicInteger.get();
            if (i12 != 8 && i12 != 6) {
                throw new IllegalStateException(b.c0.m("Invalid state transition - expected ", d0.c(i5), " but was ", d0.c(i12)));
            }
            return;
        }
        p90.a.a("Cronet JavaUrlRequest#transitionStates " + d0.c(i5) + " -> " + d0.c(i11));
        try {
            runnable.run();
            Trace.endSection();
        } catch (Throwable th2) {
            try {
                Trace.endSection();
            } catch (Throwable th3) {
                th2.addSuppressed(th3);
            }
            throw th2;
        }
    }

    @Override // org.chromium.net.UrlRequest
    public final void getStatus(UrlRequest.StatusListener statusListener) {
        int i5 = this.f86858f.get();
        int i11 = this.f86864l;
        switch (i5) {
            case 0:
            case 6:
            case 7:
            case 8:
                i11 = -1;
                break;
            case 1:
                break;
            case 2:
            case 3:
            case 4:
                i11 = 0;
                break;
            case 5:
                i11 = 14;
                break;
            default:
                throw new IllegalStateException(b.c0.h(i5, "Switch is exhaustive: "));
        }
        x0 x0Var = this.f86853a;
        j1 j1Var = new j1(statusListener);
        x0Var.getClass();
        x0Var.c("sendStatus", new ab.k(j1Var, i11, 10));
    }

    @Override // org.chromium.net.UrlRequest
    public final boolean isDone() {
        int i5 = this.f86858f.get();
        return i5 == 7 || i5 == 6 || i5 == 8;
    }

    @Override // org.chromium.net.UrlRequest
    public final void read(ByteBuffer byteBuffer) {
        if (!byteBuffer.isDirect()) {
            throw new IllegalArgumentException("byteBuffer must be a direct ByteBuffer.");
        }
        if (!byteBuffer.hasRemaining()) {
            throw new IllegalArgumentException("ByteBuffer is already full.");
        }
        g(4, 5, new s0(0, this, new q10.d(3, this, byteBuffer)));
    }

    @Override // org.chromium.net.UrlRequest
    public final void start() {
        this.f86864l = 10;
        this.f86869s.f86964e.incrementAndGet();
        g(0, 1, new q0(this, 3));
    }
}
