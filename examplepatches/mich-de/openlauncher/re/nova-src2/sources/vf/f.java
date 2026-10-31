package vf;

import android.os.SystemClock;
import java.util.ArrayList;
import xk.r2;

/* loaded from: classes3.dex */
public abstract class f implements k {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f92664a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f92665b = new ArrayList(1);

    /* renamed from: c, reason: collision with root package name */
    public int f92666c;

    /* renamed from: d, reason: collision with root package name */
    public l f92667d;

    public f(boolean z11) {
        this.f92664a = z11;
    }

    public final void a(int i5) {
        boolean z11;
        l lVar = this.f92667d;
        int i11 = wf.v.f94376a;
        for (int i12 = 0; i12 < this.f92666c; i12++) {
            g0 g0Var = (g0) this.f92665b.get(i12);
            boolean z12 = this.f92664a;
            p pVar = (p) g0Var;
            synchronized (pVar) {
                r2 r2Var = p.n;
                if (z12) {
                    int i13 = lVar.f92697g;
                    z11 = true;
                } else {
                    z11 = false;
                }
                if (z11) {
                    pVar.f92722h += i5;
                }
            }
        }
    }

    @Override // vf.k
    public final void addTransferListener(g0 g0Var) {
        g0Var.getClass();
        ArrayList arrayList = this.f92665b;
        if (arrayList.contains(g0Var)) {
            return;
        }
        arrayList.add(g0Var);
        this.f92666c++;
    }

    public final void h() {
        boolean z11;
        l lVar = this.f92667d;
        int i5 = wf.v.f94376a;
        for (int i11 = 0; i11 < this.f92666c; i11++) {
            g0 g0Var = (g0) this.f92665b.get(i11);
            boolean z12 = this.f92664a;
            p pVar = (p) g0Var;
            synchronized (pVar) {
                try {
                    r2 r2Var = p.n;
                    if (z12) {
                        int i12 = lVar.f92697g;
                        z11 = true;
                    } else {
                        z11 = false;
                    }
                    if (z11) {
                        wf.a.i(pVar.f92720f > 0);
                        pVar.f92718d.getClass();
                        long jElapsedRealtime = SystemClock.elapsedRealtime();
                        int i13 = (int) (jElapsedRealtime - pVar.f92721g);
                        pVar.f92724j += i13;
                        long j11 = pVar.f92725k;
                        long j12 = pVar.f92722h;
                        pVar.f92725k = j11 + j12;
                        if (i13 > 0) {
                            pVar.f92717c.a((j12 * 8000.0f) / i13, (int) Math.sqrt(j12));
                            if (pVar.f92724j >= 2000 || pVar.f92725k >= 524288) {
                                pVar.f92726l = (long) pVar.f92717c.b();
                            }
                            pVar.b(i13, pVar.f92722h, pVar.f92726l);
                            pVar.f92721g = jElapsedRealtime;
                            pVar.f92722h = 0L;
                        }
                        pVar.f92720f--;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        this.f92667d = null;
    }

    public final void i() {
        for (int i5 = 0; i5 < this.f92666c; i5++) {
            ((g0) this.f92665b.get(i5)).getClass();
        }
    }

    public final void j(l lVar) {
        boolean z11;
        this.f92667d = lVar;
        for (int i5 = 0; i5 < this.f92666c; i5++) {
            g0 g0Var = (g0) this.f92665b.get(i5);
            boolean z12 = this.f92664a;
            p pVar = (p) g0Var;
            synchronized (pVar) {
                try {
                    r2 r2Var = p.n;
                    if (z12) {
                        int i11 = lVar.f92697g;
                        z11 = true;
                    } else {
                        z11 = false;
                    }
                    if (z11) {
                        if (pVar.f92720f == 0) {
                            pVar.f92718d.getClass();
                            pVar.f92721g = SystemClock.elapsedRealtime();
                        }
                        pVar.f92720f++;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
