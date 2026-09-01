package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TimeZone;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cgd {
    public static final Logger k;
    public static final cgd l;
    public final eoc a;
    public final Logger b;
    public int c;
    public boolean d;
    public long e;
    public int f;
    public int g;
    public final ArrayList h;
    public final ArrayList i;
    public final jn j;

    static {
        Logger logger = Logger.getLogger(cgd.class.getName());
        logger.getClass();
        k = logger;
        fgf fgfVar = new fgf(ka1.v(new StringBuilder(), ggf.b, " TaskRunner"), true);
        eoc eocVar = new eoc();
        eocVar.a = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue(), fgfVar);
        l = new cgd(eocVar);
    }

    public cgd(eoc eocVar) {
        Logger logger = k;
        logger.getClass();
        this.a = eocVar;
        this.b = logger;
        this.c = PhotoshopDirectory.TAG_PRINT_FLAGS_INFO;
        this.h = new ArrayList();
        this.i = new ArrayList();
        this.j = new jn(15, this);
    }

    public final void a(ufd ufdVar, long j, boolean z) {
        TimeZone timeZone = ggf.a;
        bgd bgdVar = ufdVar.c;
        bgdVar.getClass();
        if (bgdVar.d != ufdVar) {
            ygf.f("Check failed.");
            return;
        }
        boolean z2 = bgdVar.f;
        bgdVar.f = false;
        bgdVar.d = null;
        this.h.remove(bgdVar);
        if (j != -1 && !z2 && !bgdVar.c) {
            bgdVar.f(ufdVar, j, true);
        }
        if (bgdVar.e.isEmpty()) {
            return;
        }
        this.i.add(bgdVar);
        if (z) {
            return;
        }
        e();
    }

    public final ufd b() {
        boolean z;
        TimeZone timeZone = ggf.a;
        while (true) {
            ArrayList arrayList = this.i;
            if (arrayList.isEmpty()) {
                break;
            }
            long jNanoTime = System.nanoTime();
            Iterator it2 = arrayList.iterator();
            long jMin = Long.MAX_VALUE;
            ufd ufdVar = null;
            while (true) {
                if (!it2.hasNext()) {
                    z = false;
                    break;
                }
                ufd ufdVar2 = (ufd) ((bgd) it2.next()).e.get(0);
                long jMax = Math.max(0L, ufdVar2.d - jNanoTime);
                if (jMax > 0) {
                    jMin = Math.min(jMax, jMin);
                } else {
                    if (ufdVar != null) {
                        z = true;
                        break;
                    }
                    ufdVar = ufdVar2;
                }
            }
            ArrayList arrayList2 = this.h;
            if (ufdVar != null) {
                TimeZone timeZone2 = ggf.a;
                ufdVar.d = -1L;
                bgd bgdVar = ufdVar.c;
                bgdVar.getClass();
                bgdVar.e.remove(ufdVar);
                arrayList.remove(bgdVar);
                bgdVar.d = ufdVar;
                arrayList2.add(bgdVar);
                if (z || (!this.d && !arrayList.isEmpty())) {
                    e();
                }
                return ufdVar;
            }
            if (!this.d) {
                this.d = true;
                this.e = jNanoTime + jMin;
                try {
                    try {
                        TimeZone timeZone3 = ggf.a;
                        if (jMin > 0) {
                            long j = jMin / 1000000;
                            Long.signum(j);
                            long j2 = jMin - (1000000 * j);
                            if (j > 0 || jMin > 0) {
                                wait(j, (int) j2);
                            }
                        }
                    } catch (InterruptedException unused) {
                        TimeZone timeZone4 = ggf.a;
                        for (int size = arrayList2.size() - 1; -1 < size; size--) {
                            ((bgd) arrayList2.get(size)).b();
                        }
                        for (int size2 = arrayList.size() - 1; -1 < size2; size2--) {
                            bgd bgdVar2 = (bgd) arrayList.get(size2);
                            bgdVar2.b();
                            if (bgdVar2.e.isEmpty()) {
                                arrayList.remove(size2);
                            }
                        }
                    }
                } finally {
                    this.d = false;
                }
            } else if (jMin < this.e - jNanoTime) {
                notify();
            }
        }
        return null;
    }

    public final void c(bgd bgdVar) {
        bgdVar.getClass();
        TimeZone timeZone = ggf.a;
        if (bgdVar.d == null) {
            boolean zIsEmpty = bgdVar.e.isEmpty();
            ArrayList arrayList = this.i;
            if (zIsEmpty) {
                arrayList.remove(bgdVar);
            } else {
                byte[] bArr = egf.a;
                if (!arrayList.contains(bgdVar)) {
                    arrayList.add(bgdVar);
                }
            }
        }
        if (this.d) {
            notify();
        } else {
            e();
        }
    }

    public final bgd d() {
        int i;
        synchronized (this) {
            i = this.c;
            this.c = i + 1;
        }
        return new bgd(this, b09.w(i, "Q"));
    }

    public final void e() {
        TimeZone timeZone = ggf.a;
        int i = this.f;
        if (i > this.g) {
            return;
        }
        this.f = i + 1;
        ((ThreadPoolExecutor) this.a.a).execute(this.j);
    }
}
