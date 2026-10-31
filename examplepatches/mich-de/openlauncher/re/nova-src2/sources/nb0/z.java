package nb0;

import java.io.Serializable;
import java.util.AbstractQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import rx.exceptions.MissingBackpressureException;

/* loaded from: classes5.dex */
public final class z extends ib0.h {

    /* renamed from: l, reason: collision with root package name */
    public static final x[] f78174l = new x[0];

    /* renamed from: m, reason: collision with root package name */
    public static final x[] f78175m = new x[0];

    /* renamed from: e, reason: collision with root package name */
    public final AbstractQueue f78176e;

    /* renamed from: f, reason: collision with root package name */
    public final AtomicReference f78177f;

    /* renamed from: g, reason: collision with root package name */
    public volatile Serializable f78178g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicReference f78179h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicBoolean f78180i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f78181j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f78182k;

    public z(AtomicReference atomicReference) {
        this.f78176e = (rx.internal.util.unsafe.l.f86488a == null || rx.internal.util.unsafe.l.f86489b) ? new sb0.b(rb0.d.f85780a) : new rx.internal.util.unsafe.c(rb0.d.f85780a);
        this.f78179h = new AtomicReference(f78174l);
        this.f78177f = atomicReference;
        this.f78180i = new AtomicBoolean();
    }

    @Override // ib0.e
    public final void c(Object obj) throws Throwable {
        if (obj == null) {
            obj = d.f78105b;
        }
        if (this.f78176e.offer(obj)) {
            j();
        } else {
            onError(new MissingBackpressureException());
        }
    }

    @Override // ib0.h
    public final void e() {
        f(rb0.d.f85780a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean h(x xVar) {
        while (true) {
            AtomicReference atomicReference = this.f78179h;
            x[] xVarArr = (x[]) atomicReference.get();
            if (xVarArr == f78175m) {
                return false;
            }
            int length = xVarArr.length;
            x[] xVarArr2 = new x[length + 1];
            System.arraycopy(xVarArr, 0, xVarArr2, 0, length);
            xVarArr2[length] = xVar;
            while (!atomicReference.compareAndSet(xVarArr, xVarArr2)) {
                if (atomicReference.get() != xVarArr) {
                    break;
                }
            }
            return true;
        }
    }

    public final boolean i(Serializable serializable, boolean z11) {
        int i5 = 0;
        if (serializable != null) {
            b bVar = d.f78104a;
            x[] xVarArr = f78175m;
            AtomicReference atomicReference = this.f78179h;
            AtomicReference atomicReference2 = this.f78177f;
            if (serializable != bVar) {
                Throwable th2 = ((c) serializable).f78103a;
                while (!atomicReference2.compareAndSet(this, null) && atomicReference2.get() == this) {
                }
                try {
                    x[] xVarArr2 = (x[]) atomicReference.getAndSet(xVarArr);
                    int length = xVarArr2.length;
                    while (i5 < length) {
                        xVarArr2[i5].f78172b.onError(th2);
                        i5++;
                    }
                    return true;
                } finally {
                }
            }
            if (z11) {
                while (!atomicReference2.compareAndSet(this, null) && atomicReference2.get() == this) {
                }
                try {
                    x[] xVarArr3 = (x[]) atomicReference.getAndSet(xVarArr);
                    int length2 = xVarArr3.length;
                    while (i5 < length2) {
                        xVarArr3[i5].f78172b.onCompleted();
                        i5++;
                    }
                    return true;
                } finally {
                }
            }
        }
        return false;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't find top splitter block for handler:B:101:0x0127
        	at jadx.core.utils.BlockUtils.getTopSplitterForHandler(BlockUtils.java:1178)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.collectHandlerRegions(ExcHandlersRegionMaker.java:53)
        	at jadx.core.dex.visitors.regions.maker.ExcHandlersRegionMaker.process(ExcHandlersRegionMaker.java:38)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:27)
        */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v0 */
    /* JADX WARN: Type inference failed for: r10v1, types: [int] */
    /* JADX WARN: Type inference failed for: r10v2 */
    /* JADX WARN: Type inference failed for: r10v3, types: [int] */
    /* JADX WARN: Type inference failed for: r10v5, types: [int] */
    /* JADX WARN: Type inference failed for: r10v6 */
    /* JADX WARN: Type inference failed for: r10v7 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v2, types: [int] */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r9v1, types: [int] */
    /* JADX WARN: Type inference failed for: r9v5 */
    /* JADX WARN: Type inference failed for: r9v6 */
    public final void j() throws java.lang.Throwable {
        /*
            Method dump skipped, instructions count: 321
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: nb0.z.j():void");
    }

    public final void k() {
        this.f61509a.c(new xb0.b(new y(this)));
    }

    @Override // ib0.e
    public final void onCompleted() throws Throwable {
        if (this.f78178g == null) {
            this.f78178g = d.f78104a;
            j();
        }
    }

    @Override // ib0.e
    public final void onError(Throwable th2) throws Throwable {
        if (this.f78178g == null) {
            this.f78178g = new c(th2);
            j();
        }
    }
}
