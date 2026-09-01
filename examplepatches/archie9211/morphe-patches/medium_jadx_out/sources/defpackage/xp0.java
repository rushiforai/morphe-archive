package defpackage;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xp0 implements qg4 {
    public final File a;
    public final rg4 b;
    public final f66 c;
    public final h08 d;
    public final rv8 e;
    public final AtomicInteger f;
    public final tp0 g;
    public final long h;
    public final long i;
    public File j;
    public long k;
    public long l;
    public long m;

    public xp0(File file, rg4 rg4Var, f66 f66Var, h08 h08Var, rv8 rv8Var) {
        AtomicInteger atomicInteger = new AtomicInteger(0);
        f66Var.getClass();
        rv8Var.getClass();
        this.a = file;
        this.b = rg4Var;
        this.c = f66Var;
        this.d = h08Var;
        this.e = rv8Var;
        this.f = atomicInteger;
        this.g = new tp0();
        double d = rg4Var.a;
        this.h = nk7.x0(1.05d * d);
        this.i = nk7.x0(d * 0.95d);
    }

    public static File e(File file) {
        return new File(km4.y(file.getPath(), "_metadata"));
    }

    @Override // defpackage.qg4
    public final File a() {
        File file = null;
        if (!i()) {
            return null;
        }
        this.e.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis() - this.m;
        rg4 rg4Var = this.b;
        long j = rg4Var.g;
        f66 f66Var = this.c;
        if (jCurrentTimeMillis > j) {
            ArrayList arrayListC = c(j());
            Iterator it2 = arrayListC.iterator();
            long jU0 = 0;
            while (it2.hasNext()) {
                jU0 += ht2.u0((File) it2.next(), f66Var);
            }
            long j2 = rg4Var.f;
            long jB = jU0 - j2;
            if (jB > 0) {
                f49.L(this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new up0(jU0, j2, jB), null, 56);
                for (File file2 : bu1.e1(arrayListC)) {
                    if (jB > 0) {
                        jB = (jB - b(file2, true)) - b(e(file2), false);
                    }
                }
            }
            this.m = System.currentTimeMillis();
        }
        File file3 = (File) bu1.J0(j());
        if (file3 != null) {
            File file4 = this.j;
            long j3 = this.k;
            if (g76.L(file4, file3)) {
                boolean zH = h(file3, this.i);
                boolean z = ht2.u0(file3, f66Var) < rg4Var.b;
                boolean z2 = j3 < ((long) rg4Var.d);
                if (zH && z && z2) {
                    this.k = j3 + 1;
                    this.l = System.currentTimeMillis();
                    file = file3;
                }
            }
        }
        if (file == null) {
            file = new File(this.a, String.valueOf(System.currentTimeMillis()));
            File file5 = this.j;
            long j4 = this.l;
            if (file5 != null) {
                this.d.c(file5, new rp0(j4, this.k));
            }
            this.j = file;
            this.k = 1L;
            this.l = System.currentTimeMillis();
            this.f.incrementAndGet();
        }
        return file;
    }

    public final long b(File file, boolean z) {
        f66 f66Var = this.c;
        if (!ht2.k0(file, f66Var)) {
            return 0L;
        }
        long jU0 = ht2.u0(file, f66Var);
        if (!ht2.g0(file, f66Var)) {
            return 0L;
        }
        if (z) {
            this.d.d(file, e4b.h, this.f.decrementAndGet());
        }
        return jU0;
    }

    public final ArrayList c(List list) {
        this.e.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis() - this.b.e;
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            File file = (File) it2.next();
            String name = file.getName();
            name.getClass();
            Long lP = tuc.P(name);
            if ((lP != null ? lP.longValue() : 0L) < jCurrentTimeMillis) {
                f66 f66Var = this.c;
                if (ht2.g0(file, f66Var)) {
                    this.d.d(file, e4b.g, this.f.decrementAndGet());
                }
                if (ht2.k0(e(file), f66Var)) {
                    ht2.g0(e(file), f66Var);
                }
                file = null;
            }
            if (file != null) {
                arrayList.add(file);
            }
        }
        return arrayList;
    }

    @Override // defpackage.qg4
    public final File d(File file) {
        int i = 0;
        if (!g76.L(file.getParent(), this.a.getPath())) {
            f49.L(this.c, d66.DEBUG, d46.R(e66.MAINTAINER, e66.TELEMETRY), new cn(file, 3, this), null, 56);
        }
        String name = file.getName();
        name.getClass();
        if (tuc.P(name) != null) {
            return e(file);
        }
        f49.L(this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, i), null, 56);
        return null;
    }

    public final File f(Set set) {
        Object obj = null;
        if (!i()) {
            return null;
        }
        ArrayList arrayListC = c(bu1.e1(j()));
        this.e.getClass();
        this.m = System.currentTimeMillis();
        this.f.set(arrayListC.size());
        Iterator it2 = arrayListC.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            File file = (File) next;
            if (!set.contains(file) && !h(file, this.h)) {
                obj = next;
                break;
            }
        }
        return (File) obj;
    }

    @Override // defpackage.qg4
    public final File g() {
        if (i()) {
            return this.a;
        }
        return null;
    }

    public final boolean h(File file, long j) {
        this.e.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        String name = file.getName();
        name.getClass();
        Long lP = tuc.P(name);
        return (lP != null ? lP.longValue() : 0L) >= jCurrentTimeMillis - j;
    }

    public final boolean i() {
        boolean zK0 = ht2.k0(this.a, this.c);
        File file = this.a;
        int i = 4;
        int i2 = 5;
        if (zK0) {
            if (!file.isDirectory()) {
                f49.L(this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new wp0(this, 1), null, 56);
                return false;
            }
            File file2 = this.a;
            f66 f66Var = this.c;
            file2.getClass();
            f66Var.getClass();
            Boolean boolValueOf = Boolean.FALSE;
            try {
                boolValueOf = Boolean.valueOf(file2.canWrite());
            } catch (SecurityException e) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file2, i), e, 48);
            } catch (Exception e2) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file2, i2), e2, 48);
            }
            if (boolValueOf.booleanValue()) {
                return true;
            }
            f49.L(this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new wp0(this, 0), null, 56);
            return false;
        }
        synchronized (file) {
            if (ht2.k0(this.a, this.c)) {
                return true;
            }
            File file3 = this.a;
            f66 f66Var2 = this.c;
            file3.getClass();
            f66Var2.getClass();
            Boolean boolValueOf2 = Boolean.FALSE;
            try {
                boolValueOf2 = Boolean.valueOf(file3.mkdirs());
            } catch (SecurityException e3) {
                f49.L(f66Var2, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file3, i), e3, 48);
            } catch (Exception e4) {
                f49.L(f66Var2, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file3, i2), e4, 48);
            }
            if (boolValueOf2.booleanValue()) {
                return true;
            }
            f49.L(this.c, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new wp0(this, 2), null, 56);
            return false;
        }
    }

    public final List j() {
        File file = this.a;
        file.getClass();
        tp0 tp0Var = this.g;
        tp0Var.getClass();
        f66 f66Var = this.c;
        f66Var.getClass();
        File[] fileArr = (File[]) ht2.C0(file, null, f66Var, new ce(17, tp0Var));
        if (fileArr == null) {
            fileArr = new File[0];
        }
        return k80.Q0(fileArr);
    }
}
