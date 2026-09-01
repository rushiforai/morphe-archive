package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.text.TextUtils;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zf5 implements pqb, yq8, t44 {
    public static final String o = d87.k("GreedyScheduler");
    public final Context a;
    public final z33 c;
    public boolean d;
    public final i2a g;
    public final mya h;
    public final r32 i;
    public Boolean k;
    public final ru l;
    public final xfd m;
    public final o2b n;
    public final HashMap b = new HashMap();
    public final Object e = new Object();
    public final a1a f = new a1a(new ct2(5, false));
    public final HashMap j = new HashMap();

    public zf5(Context context, r32 r32Var, sqd sqdVar, i2a i2aVar, mya myaVar, xfd xfdVar) {
        this.a = context;
        md5 md5Var = r32Var.f;
        this.c = new z33(this, md5Var, r32Var.d);
        this.n = new o2b(md5Var, myaVar);
        this.m = xfdVar;
        this.l = new ru(sqdVar);
        this.i = r32Var;
        this.g = i2aVar;
        this.h = myaVar;
    }

    @Override // defpackage.yq8
    public final void a(c8f c8fVar, m72 m72Var) {
        h7f h7fVarW = il7.w(c8fVar);
        boolean z = m72Var instanceof k72;
        mya myaVar = this.h;
        o2b o2bVar = this.n;
        String str = o;
        a1a a1aVar = this.f;
        if (z) {
            if (a1aVar.f(h7fVarW)) {
                return;
            }
            d87.h().d(str, "Constraints met: Scheduling work ID " + h7fVarW);
            unc uncVarA0 = a1aVar.a0(h7fVarW);
            o2bVar.L(uncVarA0);
            myaVar.getClass();
            myaVar.H(uncVarA0, null);
            return;
        }
        d87.h().d(str, "Constraints not met: Cancelling work ID " + h7fVarW);
        unc uncVarQ = a1aVar.Q(h7fVarW);
        if (uncVarQ != null) {
            o2bVar.e(uncVarQ);
            int i = ((l72) m72Var).a;
            myaVar.getClass();
            myaVar.I(uncVarQ, i);
        }
    }

    @Override // defpackage.t44
    public final void b(h7f h7fVar, boolean z) {
        unc uncVarQ = this.f.Q(h7fVar);
        if (uncVarQ != null) {
            this.n.e(uncVarQ);
        }
        f(h7fVar);
        if (z) {
            return;
        }
        synchronized (this.e) {
            this.j.remove(h7fVar);
        }
    }

    @Override // defpackage.pqb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.pqb
    public final void d(String str) {
        List<unc> listG;
        Runnable runnable;
        String str2 = o;
        Boolean boolValueOf = this.k;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(h2a.a(this.a, this.i));
            this.k = boolValueOf;
        }
        if (!boolValueOf.booleanValue()) {
            d87.h().j(str2, "Ignoring schedule request in non-main process");
            return;
        }
        if (!this.d) {
            this.g.a(this);
            this.d = true;
        }
        d87.h().d(str2, "Cancelling work ID " + str);
        z33 z33Var = this.c;
        if (z33Var != null && (runnable = (Runnable) z33Var.c.remove(str)) != null) {
            ((Handler) z33Var.b.b).removeCallbacks(runnable);
        }
        a1a a1aVar = this.f;
        a1aVar.getClass();
        str.getClass();
        synchronized (a1aVar.c) {
            listG = ((ct2) a1aVar.b).g(str);
        }
        for (unc uncVar : listG) {
            this.n.e(uncVar);
            mya myaVar = this.h;
            myaVar.getClass();
            myaVar.I(uncVar, -512);
        }
    }

    @Override // defpackage.pqb
    public final void e(c8f... c8fVarArr) {
        Boolean boolValueOf = this.k;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(h2a.a(this.a, this.i));
            this.k = boolValueOf;
        }
        if (!boolValueOf.booleanValue()) {
            d87.h().j(o, "Ignoring schedule request in a secondary process");
            return;
        }
        if (!this.d) {
            this.g.a(this);
            this.d = true;
        }
        HashSet<c8f> hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        for (c8f c8fVar : c8fVarArr) {
            if (!this.f.f(il7.w(c8fVar))) {
                long jMax = Math.max(c8fVar.a(), g(c8fVar));
                rz5 rz5Var = this.i.d;
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (c8fVar.b == j7f.ENQUEUED) {
                    if (jCurrentTimeMillis < jMax) {
                        z33 z33Var = this.c;
                        if (z33Var != null) {
                            md5 md5Var = z33Var.b;
                            HashMap map = z33Var.c;
                            Runnable runnable = (Runnable) map.remove(c8fVar.a);
                            if (runnable != null) {
                                ((Handler) md5Var.b).removeCallbacks(runnable);
                            }
                            p0g p0gVar = new p0g(z33Var, c8fVar, false, 6);
                            map.put(c8fVar.a, p0gVar);
                            ((Handler) md5Var.b).postDelayed(p0gVar, jMax - System.currentTimeMillis());
                        }
                    } else if (!g76.L(e72.j, c8fVar.j)) {
                        e72 e72Var = c8fVar.j;
                        if (e72Var.d) {
                            d87.h().d(o, "Ignoring " + c8fVar + ". Requires device idle.");
                        } else if (Build.VERSION.SDK_INT < 24 || !e72Var.b()) {
                            hashSet.add(c8fVar);
                            hashSet2.add(c8fVar.a);
                        } else {
                            d87.h().d(o, "Ignoring " + c8fVar + ". Requires ContentUri triggers.");
                        }
                    } else if (!this.f.f(il7.w(c8fVar))) {
                        d87.h().d(o, "Starting work for " + c8fVar.a);
                        a1a a1aVar = this.f;
                        a1aVar.getClass();
                        unc uncVarA0 = a1aVar.a0(il7.w(c8fVar));
                        this.n.L(uncVarA0);
                        mya myaVar = this.h;
                        myaVar.getClass();
                        myaVar.H(uncVarA0, null);
                    }
                }
            }
        }
        synchronized (this.e) {
            try {
                if (!hashSet.isEmpty()) {
                    d87.h().d(o, "Starting tracking for " + TextUtils.join(",", hashSet2));
                    for (c8f c8fVar2 : hashSet) {
                        h7f h7fVarW = il7.w(c8fVar2);
                        if (!this.b.containsKey(h7fVarW)) {
                            this.b.put(h7fVarW, a7f.a(this.l, c8fVar2, ((q7f) this.m).b, this));
                        }
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void f(h7f h7fVar) {
        va6 va6Var;
        synchronized (this.e) {
            va6Var = (va6) this.b.remove(h7fVar);
        }
        if (va6Var != null) {
            d87.h().d(o, "Stopping tracking for " + h7fVar);
            va6Var.m(null);
        }
    }

    public final long g(c8f c8fVar) {
        long jMax;
        synchronized (this.e) {
            try {
                h7f h7fVarW = il7.w(c8fVar);
                yf5 yf5Var = (yf5) this.j.get(h7fVarW);
                if (yf5Var == null) {
                    int i = c8fVar.k;
                    rz5 rz5Var = this.i.d;
                    yf5Var = new yf5(i, System.currentTimeMillis());
                    this.j.put(h7fVarW, yf5Var);
                }
                jMax = (((long) Math.max((c8fVar.k - yf5Var.a) - 5, 0)) * 30000) + yf5Var.b;
            } catch (Throwable th) {
                throw th;
            }
        }
        return jMax;
    }
}
