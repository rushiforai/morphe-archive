package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.Objects;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class jh implements ih, sh {

    /* renamed from: i, reason: collision with root package name */
    public static final String f32696i = new String();

    /* renamed from: a, reason: collision with root package name */
    public final Level f32697a;

    /* renamed from: b, reason: collision with root package name */
    public final long f32698b;

    /* renamed from: c, reason: collision with root package name */
    public nh f32699c;

    /* renamed from: d, reason: collision with root package name */
    public qh f32700d;

    /* renamed from: e, reason: collision with root package name */
    public xh f32701e;

    /* renamed from: f, reason: collision with root package name */
    public g f32702f;

    /* renamed from: g, reason: collision with root package name */
    public Object[] f32703g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ d2 f32704h;

    public jh(d2 d2Var, Level level) {
        Objects.requireNonNull(d2Var);
        this.f32704h = d2Var;
        d.f32446a.getClass();
        long nanos = TimeUnit.MILLISECONDS.toNanos(System.currentTimeMillis());
        this.f32699c = null;
        this.f32700d = null;
        this.f32701e = null;
        this.f32702f = null;
        this.f32703g = null;
        fb.b(level, "level");
        this.f32697a = level;
        this.f32698b = nanos;
    }

    @Override // com.google.android.gms.internal.measurement.sh
    public final sh a(Throwable th2) {
        th thVar = mh.f32825a;
        fb.b(thVar, "metadata key");
        if (th2 != null) {
            d(thVar, th2);
        }
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f9  */
    @Override // com.google.android.gms.internal.measurement.sh
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(String str, Object[] objArr) {
        boolean z11;
        nh nhVar;
        StackTraceElement[] stackTraceElementArr;
        int iL;
        int i5;
        xh vhVar;
        yh yhVar;
        xh xhVar;
        qh qhVar = this.f32700d;
        oh ohVar = qh.f33021a;
        if (qhVar == null) {
            ((i) d.f32446a).getClass();
            i.f32619b.getClass();
            this.f32700d = ohVar;
        }
        rh zhVar = this.f32700d;
        if (zhVar != ohVar) {
            nh nhVar2 = this.f32699c;
            if (nhVar2 != null && nhVar2.f32860f > 0) {
                fb.b(zhVar, "logSiteKey");
                int i11 = nhVar2.f32860f;
                for (int i12 = 0; i12 < i11; i12++) {
                    if (mh.f32830f.equals(nhVar2.h(i12))) {
                        zhVar = new zh(zhVar, nhVar2.i(i12));
                    }
                }
            }
        } else {
            zhVar = null;
        }
        h hVarC = c();
        int iA = hVarC.a();
        int i13 = 0;
        while (true) {
            if (i13 >= iA) {
                break;
            }
            if (hVarC.h(i13).f33092a != "eye3tag") {
                i13++;
            } else if (hVarC.j(mh.f32825a) == null) {
                th thVar = mh.f32833i;
                if (hVarC.j(thVar) == null) {
                    d(thVar, ai.SMALL);
                }
            }
        }
        nh nhVar3 = this.f32699c;
        int i14 = -1;
        xh xhVar2 = xh.f33233a;
        if (nhVar3 != null) {
            if (zhVar != null) {
                int i15 = hh.f32616d;
                if (nhVar3.j(mh.f32828d) != null) {
                    throw new ClassCastException();
                }
                nh nhVar4 = this.f32699c;
                eh ehVar = fh.f32542d;
                if (((Integer) nhVar4.j(mh.f32826b)) == null) {
                    vhVar = null;
                } else {
                    fh fhVar = (fh) fh.f32542d.c(zhVar, nhVar4);
                    AtomicLong atomicLong = fhVar.f32543c;
                    vhVar = fhVar;
                    if (atomicLong.incrementAndGet() < r10.intValue()) {
                        vhVar = xhVar2;
                    }
                }
                nh nhVar5 = this.f32699c;
                eh ehVar2 = yh.f33267d;
                Integer num = (Integer) nhVar5.j(mh.f32827c);
                if (num == null || num.intValue() <= 0) {
                    yhVar = 0;
                } else {
                    yhVar = (yh) yh.f33267d.c(zhVar, nhVar5);
                    AtomicInteger atomicInteger = yhVar.f33269c;
                    if ((((Random) yh.f33268e.get()).nextInt(num.intValue()) == 0 ? atomicInteger.incrementAndGet() : atomicInteger.get()) <= 0) {
                        yhVar = xhVar2;
                    }
                }
                if (vhVar != null) {
                    if (yhVar != 0 && vhVar != xhVar2 && yhVar != (xhVar = xh.f33234b)) {
                        vhVar = (yhVar == xhVar2 || vhVar == xhVar) ? yhVar : new vh(vhVar, yhVar);
                    }
                    this.f32701e = vhVar;
                    z11 = vhVar != xhVar2;
                }
            }
            nh nhVar6 = this.f32699c;
            th thVar2 = mh.f32833i;
            ai aiVar = (ai) nhVar6.j(thVar2);
            if (aiVar != null) {
                nh nhVar7 = this.f32699c;
                if (nhVar7 != null && (iL = nhVar7.l(thVar2)) >= 0) {
                    int i16 = iL + iL;
                    int i17 = i16 + 2;
                    while (true) {
                        i5 = nhVar7.f32860f;
                        if (i17 >= i5 + i5) {
                            break;
                        }
                        Object obj = nhVar7.f32859e[i17];
                        if (!obj.equals(thVar2)) {
                            Object[] objArr2 = nhVar7.f32859e;
                            objArr2[i16] = obj;
                            objArr2[i16 + 1] = objArr2[i17 + 1];
                            i16 += 2;
                        }
                        i17 += 2;
                    }
                    nhVar7.f32860f = i5 - ((i17 - i16) >> 1);
                    while (i16 < i17) {
                        nhVar7.f32859e[i16] = null;
                        i16++;
                    }
                }
                h hVarC2 = c();
                th thVar3 = mh.f32825a;
                Throwable th2 = (Throwable) hVarC2.j(thVar3);
                int i18 = aiVar.f32392a;
                String[] strArr = f0.f32520a;
                if (i18 <= 0 && i18 != -1) {
                    throw new IllegalArgumentException("invalid maximum depth: 0");
                }
                f0.f32521b.getClass();
                if (!(i18 == -1 || i18 > 0)) {
                    throw new IllegalArgumentException("maxDepth must be > 0 or -1");
                }
                StackTraceElement[] stackTrace = new Throwable().getStackTrace();
                String name = jh.class.getName();
                int i19 = 3;
                boolean z12 = false;
                while (true) {
                    if (i19 >= stackTrace.length) {
                        i19 = -1;
                        break;
                    }
                    if (!stackTrace[i19].getClassName().equals(name)) {
                        if (z12) {
                            break;
                        }
                    } else {
                        z12 = true;
                    }
                    i19++;
                }
                if (i19 == -1) {
                    stackTraceElementArr = new StackTraceElement[0];
                } else {
                    int length = stackTrace.length - i19;
                    if (i18 <= 0 || i18 >= length) {
                        i18 = length;
                    }
                    stackTraceElementArr = new StackTraceElement[i18];
                    System.arraycopy(stackTrace, i19, stackTraceElementArr, 0, i18);
                }
                zzyg zzygVar = new zzyg(aiVar.toString(), th2);
                zzygVar.setStackTrace(stackTraceElementArr);
                d(thVar3, zzygVar);
            }
        }
        xh xhVar3 = this.f32701e;
        if (xhVar3 != null) {
            wh whVar = (wh) wh.f33201c.c(zhVar, this.f32699c);
            AtomicInteger atomicInteger2 = whVar.f33203b;
            AtomicBoolean atomicBoolean = whVar.f33202a;
            int iIncrementAndGet = atomicInteger2.incrementAndGet();
            if (xhVar3 != xhVar2 && atomicBoolean.compareAndSet(false, true)) {
                try {
                    xhVar3.a();
                    atomicBoolean.set(false);
                    atomicInteger2.addAndGet(-iIncrementAndGet);
                    i14 = (-1) + iIncrementAndGet;
                } catch (Throwable th3) {
                    atomicBoolean.set(false);
                    throw th3;
                }
            }
            if (z11 && i14 > 0 && (nhVar = this.f32699c) != null) {
                nhVar.k(mh.f32829e, Integer.valueOf(i14));
            }
            z11 &= i14 >= 0;
        }
        if (!z11) {
            return;
        }
        Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
        this.f32703g = objArrCopyOf;
        for (Object obj2 : objArrCopyOf) {
        }
        if (str != f32696i) {
            d0 d0Var = d0.f32447c;
            this.f32702f = new g(str);
        }
        ((i) d.f32446a).getClass();
        x xVarB = n.f32839b.b();
        if (!xVarB.f33206a.isEmpty()) {
            h hVarC3 = c();
            th thVar4 = mh.f32832h;
            x xVar = (x) hVarC3.j(thVar4);
            if (xVar != null) {
                w wVar = xVar.f33206a;
                if (!wVar.isEmpty()) {
                    w wVar2 = xVarB.f33206a;
                    if (!wVar2.isEmpty()) {
                        xVar = new x(new w(wVar2, wVar));
                    }
                    xVarB = xVar;
                }
            }
            d(thVar4, xVarB);
        }
        c3 c3Var = (c3) this.f32704h.f32451b;
        try {
            g0 g0Var = (g0) g0.f32549b.get();
            int i21 = g0Var.f32550a + 1;
            g0Var.f32550a = i21;
            if (i21 == 0) {
                throw new AssertionError("Overflow of RecursionDepth (possible error in core library)");
            }
            try {
                if (i21 <= 100) {
                    c3Var.f(this);
                } else {
                    d2.b("unbounded recursion in log statement", this);
                }
                g0Var.close();
            } finally {
            }
        } catch (RuntimeException e3) {
            try {
                c3Var.i(e3, this);
            } catch (zzzg e11) {
                throw e11;
            } catch (RuntimeException e12) {
                String name2 = e12.getClass().getName();
                String message = e12.getMessage();
                StringBuilder sb2 = new StringBuilder(name2.length() + 2 + String.valueOf(message).length());
                sb2.append(name2);
                sb2.append(": ");
                sb2.append(message);
                d2.b(sb2.toString(), this);
                try {
                    e12.printStackTrace(System.err);
                } catch (RuntimeException unused) {
                }
            }
        }
    }

    public final h c() {
        nh nhVar = this.f32699c;
        return nhVar != null ? nhVar : hi.f32618e;
    }

    public final void d(th thVar, Object obj) {
        if (this.f32699c == null) {
            nh nhVar = new nh();
            nhVar.f32859e = new Object[8];
            nhVar.f32860f = 0;
            this.f32699c = nhVar;
        }
        this.f32699c.k(thVar, obj);
    }

    @Override // com.google.android.gms.internal.measurement.sh
    public final sh zzn() {
        ph phVar = new ph();
        phVar.f32969b = 0;
        if (this.f32700d == null) {
            this.f32700d = phVar;
        }
        return this;
    }
}
