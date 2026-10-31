package ge;

import fe.y1;
import fe.z1;
import gf.w;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f57402a;

    /* renamed from: b, reason: collision with root package name */
    public int f57403b;

    /* renamed from: c, reason: collision with root package name */
    public long f57404c;

    /* renamed from: d, reason: collision with root package name */
    public final w f57405d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f57406e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f57407f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ h f57408g;

    public g(h hVar, String str, int i5, w wVar) {
        this.f57408g = hVar;
        this.f57402a = str;
        this.f57403b = i5;
        this.f57404c = wVar == null ? -1L : wVar.f57643d;
        if (wVar == null || !wVar.a()) {
            return;
        }
        this.f57405d = wVar;
    }

    public final boolean a(a aVar) {
        w wVar = aVar.f57381d;
        z1 z1Var = aVar.f57379b;
        if (wVar == null) {
            return this.f57403b != aVar.f57380c;
        }
        long j11 = this.f57404c;
        if (j11 == -1) {
            return false;
        }
        if (wVar.f57643d > j11) {
            return true;
        }
        w wVar2 = this.f57405d;
        if (wVar2 == null) {
            return false;
        }
        int i5 = wVar2.f57641b;
        int iB = z1Var.b(wVar.f57640a);
        int iB2 = z1Var.b(wVar2.f57640a);
        if (wVar.f57643d < wVar2.f57643d || iB < iB2) {
            return false;
        }
        if (iB > iB2) {
            return true;
        }
        if (!wVar.a()) {
            int i11 = wVar.f57644e;
            return i11 == -1 || i11 > i5;
        }
        int i12 = wVar.f57641b;
        int i13 = wVar.f57642c;
        if (i12 <= i5) {
            return i12 == i5 && i13 > wVar2.f57642c;
        }
        return true;
    }

    public final boolean b(z1 z1Var, z1 z1Var2) {
        w wVar;
        int i5 = this.f57403b;
        if (i5 < z1Var.o()) {
            h hVar = this.f57408g;
            y1 y1Var = hVar.f57411a;
            z1Var.n(i5, y1Var);
            for (int i11 = y1Var.n; i11 <= y1Var.o; i11++) {
                int iB = z1Var2.b(z1Var.l(i11));
                if (iB != -1) {
                    i5 = z1Var2.f(iB, hVar.f57412b, false).f55077c;
                    break;
                }
            }
            i5 = -1;
        } else if (i5 >= z1Var2.o()) {
            i5 = -1;
        }
        this.f57403b = i5;
        return i5 != -1 && ((wVar = this.f57405d) == null || z1Var2.b(wVar.f57640a) != -1);
    }
}
