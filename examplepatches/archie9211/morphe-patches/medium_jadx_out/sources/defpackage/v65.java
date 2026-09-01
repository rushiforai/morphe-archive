package defpackage;

import android.os.Trace;
import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v65 implements Runnable {
    public static final ThreadLocal e = new ThreadLocal();
    public static final js4 f = new js4(19);
    public long b;
    public long c;
    public final ArrayList a = new ArrayList();
    public final ArrayList d = new ArrayList();

    public static pr0 c(RecyclerView recyclerView, int i, long j) {
        int iD = recyclerView.f.D();
        for (int i2 = 0; i2 < iD; i2++) {
            pr0 pr0VarK = RecyclerView.K(recyclerView.f.C(i2));
            if (pr0VarK.c == i && !pr0VarK.e()) {
                return null;
            }
        }
        yxa yxaVar = recyclerView.c;
        if (j == Long.MAX_VALUE) {
            try {
                if (lqd.a()) {
                    Trace.beginSection("RV Prefetch forced - needed next frame");
                }
            } catch (Throwable th) {
                recyclerView.S(false);
                Trace.endSection();
                throw th;
            }
        }
        recyclerView.R();
        pr0 pr0VarL = yxaVar.l(i, j);
        if (pr0VarL != null) {
            if (!pr0VarL.d() || pr0VarL.e()) {
                yxaVar.a(pr0VarL, false);
            } else {
                yxaVar.i(pr0VarL.a);
            }
        }
        recyclerView.S(false);
        Trace.endSection();
        return pr0VarL;
    }

    public final void a(RecyclerView recyclerView, int i, int i2) {
        if (recyclerView.s) {
            if (RecyclerView.P0 && !this.a.contains(recyclerView)) {
                ygf.f("attempting to post unregistered view!");
                return;
            } else if (this.b == 0) {
                this.b = recyclerView.getNanoTime();
                recyclerView.post(this);
            }
        }
        ym0 ym0Var = recyclerView.t0;
        ym0Var.b = i;
        ym0Var.c = i2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v3 */
    /* JADX WARN: Type inference failed for: r11v4, types: [int] */
    /* JADX WARN: Type inference failed for: r11v6 */
    public final void b(long j) {
        u65 u65Var;
        RecyclerView recyclerView;
        RecyclerView recyclerView2;
        u65 u65Var2;
        ArrayList arrayList = this.a;
        int size = arrayList.size();
        boolean z = false;
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            RecyclerView recyclerView3 = (RecyclerView) arrayList.get(i2);
            int windowVisibility = recyclerView3.getWindowVisibility();
            ym0 ym0Var = recyclerView3.t0;
            if (windowVisibility == 0) {
                ym0Var.e(recyclerView3, false);
                i += ym0Var.d;
            }
        }
        ArrayList arrayList2 = this.d;
        arrayList2.ensureCapacity(i);
        int i3 = 0;
        int i4 = 0;
        while (i3 < size) {
            RecyclerView recyclerView4 = (RecyclerView) arrayList.get(i3);
            if (recyclerView4.getWindowVisibility() == 0) {
                ym0 ym0Var2 = recyclerView4.t0;
                int iAbs = Math.abs(ym0Var2.c) + Math.abs(ym0Var2.b);
                for (?? r11 = z; r11 < ym0Var2.d * 2; r11 += 2) {
                    if (i4 >= arrayList2.size()) {
                        u65Var2 = new u65();
                        arrayList2.add(u65Var2);
                    } else {
                        u65Var2 = (u65) arrayList2.get(i4);
                    }
                    int[] iArr = (int[]) ym0Var2.e;
                    int i5 = iArr[r11 + 1];
                    if (i5 <= iAbs) {
                        z = true;
                    }
                    u65Var2.a = z;
                    u65Var2.b = iAbs;
                    u65Var2.c = i5;
                    u65Var2.d = recyclerView4;
                    u65Var2.e = iArr[r11];
                    i4++;
                    z = false;
                }
            }
            i3++;
            z = false;
        }
        Collections.sort(arrayList2, f);
        for (int i6 = 0; i6 < arrayList2.size() && (recyclerView = (u65Var = (u65) arrayList2.get(i6)).d) != null; i6++) {
            pr0 pr0VarC = c(recyclerView, u65Var.e, u65Var.a ? Long.MAX_VALUE : j);
            if (pr0VarC != null && pr0VarC.b != null && pr0VarC.d() && !pr0VarC.e() && (recyclerView2 = (RecyclerView) pr0VarC.b.get()) != null) {
                if (recyclerView2.C && recyclerView2.f.D() != 0) {
                    yxa yxaVar = recyclerView2.c;
                    pxa pxaVar = recyclerView2.L;
                    if (pxaVar != null) {
                        pxaVar.e();
                    }
                    sxa sxaVar = recyclerView2.n;
                    if (sxaVar != null) {
                        sxaVar.k0(yxaVar);
                        recyclerView2.n.l0(yxaVar);
                    }
                    yxaVar.a.clear();
                    yxaVar.g();
                }
                ym0 ym0Var3 = recyclerView2.t0;
                ym0Var3.e(recyclerView2, true);
                if (ym0Var3.d != 0) {
                    try {
                        Trace.beginSection(j == Long.MAX_VALUE ? "RV Nested Prefetch" : "RV Nested Prefetch forced - needed next frame");
                        eya eyaVar = recyclerView2.u0;
                        kxa kxaVar = recyclerView2.m;
                        eyaVar.d = 1;
                        eyaVar.e = op8.Y(((gy6) kxaVar).c);
                        eyaVar.g = false;
                        eyaVar.h = false;
                        eyaVar.i = false;
                        for (int i7 = 0; i7 < ym0Var3.d * 2; i7 += 2) {
                            c(recyclerView2, ((int[]) ym0Var3.e)[i7], j);
                        }
                    } finally {
                        Trace.endSection();
                    }
                }
            }
            u65Var.a = false;
            u65Var.b = 0;
            u65Var.c = 0;
            u65Var.d = null;
            u65Var.e = 0;
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        ArrayList arrayList = this.a;
        try {
            Trace.beginSection("RV Prefetch");
            if (!arrayList.isEmpty()) {
                int size = arrayList.size();
                long jMax = 0;
                for (int i = 0; i < size; i++) {
                    RecyclerView recyclerView = (RecyclerView) arrayList.get(i);
                    if (recyclerView.getWindowVisibility() == 0) {
                        jMax = Math.max(recyclerView.getDrawingTime(), jMax);
                    }
                }
                if (jMax != 0) {
                    b(TimeUnit.MILLISECONDS.toNanos(jMax) + this.c);
                }
            }
        } finally {
            this.b = 0L;
            Trace.endSection();
        }
    }
}
