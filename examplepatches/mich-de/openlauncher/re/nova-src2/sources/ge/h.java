package ge;

import fe.x1;
import fe.y1;
import fe.z1;
import gf.w;
import java.util.HashMap;
import java.util.Random;
import wf.v;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: g, reason: collision with root package name */
    public static final fe.l f57409g = new fe.l();

    /* renamed from: h, reason: collision with root package name */
    public static final Random f57410h = new Random();

    /* renamed from: d, reason: collision with root package name */
    public k f57414d;

    /* renamed from: f, reason: collision with root package name */
    public String f57416f;

    /* renamed from: a, reason: collision with root package name */
    public final y1 f57411a = new y1();

    /* renamed from: b, reason: collision with root package name */
    public final x1 f57412b = new x1();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f57413c = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public z1 f57415e = z1.f55127a;

    /* JADX WARN: Removed duplicated region for block: B:30:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0071 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final g a(int i5, w wVar) {
        long j11;
        HashMap map = this.f57413c;
        g gVar = null;
        long j12 = Long.MAX_VALUE;
        for (g gVar2 : map.values()) {
            long j13 = gVar2.f57404c;
            w wVar2 = gVar2.f57405d;
            if (j13 == -1 && i5 == gVar2.f57403b && wVar != null) {
                gVar2.f57404c = wVar.f57643d;
            }
            if (wVar != null) {
                long j14 = wVar.f57643d;
                if (wVar2 == null) {
                    if (!wVar.a() && j14 == gVar2.f57404c) {
                        j11 = gVar2.f57404c;
                        if (j11 == -1) {
                        }
                        gVar = gVar2;
                        j12 = j11;
                    }
                } else if (j14 == wVar2.f57643d && wVar.f57641b == wVar2.f57641b && wVar.f57642c == wVar2.f57642c) {
                    j11 = gVar2.f57404c;
                    if (j11 == -1) {
                    }
                    gVar = gVar2;
                    j12 = j11;
                }
            } else if (i5 == gVar2.f57403b) {
                j11 = gVar2.f57404c;
                if (j11 == -1 || j11 < j12) {
                    gVar = gVar2;
                    j12 = j11;
                } else if (j11 == j12) {
                    int i11 = v.f94376a;
                    if (gVar.f57405d != null && wVar2 != null) {
                        gVar = gVar2;
                    }
                }
            }
        }
        if (gVar != null) {
            return gVar;
        }
        String str = (String) f57409g.get();
        g gVar3 = new g(this, str, i5, wVar);
        map.put(str, gVar3);
        return gVar3;
    }

    public final synchronized String b(z1 z1Var, w wVar) {
        return a(z1Var.g(wVar.f57640a, this.f57412b).f55077c, wVar).f57402a;
    }

    public final void c(a aVar) {
        w wVar;
        z1 z1Var = aVar.f57379b;
        int i5 = aVar.f57380c;
        w wVar2 = aVar.f57381d;
        if (z1Var.p()) {
            this.f57416f = null;
            return;
        }
        g gVar = (g) this.f57413c.get(this.f57416f);
        this.f57416f = a(i5, wVar2).f57402a;
        d(aVar);
        if (wVar2 != null) {
            long j11 = wVar2.f57643d;
            if (wVar2.a()) {
                if (gVar != null && gVar.f57404c == j11 && (wVar = gVar.f57405d) != null && wVar.f57641b == wVar2.f57641b && wVar.f57642c == wVar2.f57642c) {
                    return;
                }
                a(i5, new w(j11, wVar2.f57640a));
                this.f57414d.getClass();
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0036, code lost:
    
        if (r1.f57643d < r2) goto L20;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final synchronized void d(a aVar) {
        try {
            this.f57414d.getClass();
            if (aVar.f57379b.p()) {
                return;
            }
            g gVar = (g) this.f57413c.get(this.f57416f);
            w wVar = aVar.f57381d;
            if (wVar != null && gVar != null) {
                long j11 = gVar.f57404c;
                if (j11 == -1) {
                    if (gVar.f57403b != aVar.f57380c) {
                        return;
                    }
                }
            }
            g gVarA = a(aVar.f57380c, wVar);
            if (this.f57416f == null) {
                this.f57416f = gVarA.f57402a;
            }
            w wVar2 = aVar.f57381d;
            if (wVar2 != null && wVar2.a()) {
                w wVar3 = aVar.f57381d;
                g gVarA2 = a(aVar.f57380c, new w(wVar3.f57640a, wVar3.f57643d, wVar3.f57641b));
                if (!gVarA2.f57406e) {
                    gVarA2.f57406e = true;
                    aVar.f57379b.g(aVar.f57381d.f57640a, this.f57412b);
                    this.f57412b.d(aVar.f57381d.f57641b);
                    int i5 = v.f94376a;
                    long j12 = this.f57412b.f55079e;
                    this.f57414d.getClass();
                }
            }
            if (!gVarA.f57406e) {
                gVarA.f57406e = true;
                this.f57414d.getClass();
            }
            if (gVarA.f57402a.equals(this.f57416f) && !gVarA.f57407f) {
                gVarA.f57407f = true;
                k kVar = this.f57414d;
                String str = gVarA.f57402a;
                kVar.getClass();
                w wVar4 = aVar.f57381d;
                if (wVar4 == null || !wVar4.a()) {
                    kVar.b();
                    kVar.f57425i = str;
                    kVar.f57426j = d2.b.h().setPlayerName("ExoPlayerLib").setPlayerVersion("2.18.2");
                    kVar.c(aVar.f57379b, aVar.f57381d);
                }
            }
        } finally {
        }
    }
}
