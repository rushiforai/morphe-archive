package g4;

import b.c0;
import h4.n;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class c {

    /* renamed from: b, reason: collision with root package name */
    public int f57074b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f57075c;

    /* renamed from: d, reason: collision with root package name */
    public final d f57076d;

    /* renamed from: e, reason: collision with root package name */
    public final int f57077e;

    /* renamed from: f, reason: collision with root package name */
    public c f57078f;

    /* renamed from: i, reason: collision with root package name */
    public e4.f f57081i;

    /* renamed from: a, reason: collision with root package name */
    public HashSet f57073a = null;

    /* renamed from: g, reason: collision with root package name */
    public int f57079g = 0;

    /* renamed from: h, reason: collision with root package name */
    public int f57080h = Integer.MIN_VALUE;

    public c(d dVar, int i5) {
        this.f57076d = dVar;
        this.f57077e = i5;
    }

    public final void a(c cVar, int i5) {
        b(cVar, i5, Integer.MIN_VALUE, false);
    }

    public final boolean b(c cVar, int i5, int i11, boolean z11) {
        if (cVar == null) {
            j();
            return true;
        }
        if (!z11 && !i(cVar)) {
            return false;
        }
        this.f57078f = cVar;
        if (cVar.f57073a == null) {
            cVar.f57073a = new HashSet();
        }
        HashSet hashSet = this.f57078f.f57073a;
        if (hashSet != null) {
            hashSet.add(this);
        }
        this.f57079g = i5;
        this.f57080h = i11;
        return true;
    }

    public final void c(int i5, n nVar, ArrayList arrayList) {
        HashSet hashSet = this.f57073a;
        if (hashSet != null) {
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                h4.h.b(((c) it.next()).f57076d, i5, arrayList, nVar);
            }
        }
    }

    public final int d() {
        if (this.f57075c) {
            return this.f57074b;
        }
        return 0;
    }

    public final int e() {
        c cVar;
        if (this.f57076d.f57093f0 == 8) {
            return 0;
        }
        int i5 = this.f57080h;
        return (i5 == Integer.MIN_VALUE || (cVar = this.f57078f) == null || cVar.f57076d.f57093f0 != 8) ? this.f57079g : i5;
    }

    public final c f() {
        int i5 = this.f57077e;
        int iF = c0.F(i5);
        d dVar = this.f57076d;
        switch (iF) {
            case 0:
            case 5:
            case 6:
            case 7:
            case 8:
                return null;
            case 1:
                return dVar.J;
            case 2:
                return dVar.K;
            case 3:
                return dVar.H;
            case 4:
                return dVar.I;
            default:
                throw new AssertionError(fq.c.w(i5));
        }
    }

    public final boolean g() {
        HashSet hashSet = this.f57073a;
        if (hashSet == null) {
            return false;
        }
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            if (((c) it.next()).f().h()) {
                return true;
            }
        }
        return false;
    }

    public final boolean h() {
        return this.f57078f != null;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0063 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean i(c cVar) {
        if (cVar != null) {
            d dVar = cVar.f57076d;
            int i5 = cVar.f57077e;
            int i11 = this.f57077e;
            if (i5 != i11) {
                switch (c0.F(i11)) {
                    case 0:
                    case 7:
                    case 8:
                        break;
                    case 1:
                    case 3:
                        boolean z11 = i5 == 2 || i5 == 4;
                        if (!(dVar instanceof h)) {
                            return z11;
                        }
                        if (z11 || i5 == 8) {
                        }
                        break;
                    case 2:
                    case 4:
                        boolean z12 = i5 == 3 || i5 == 5;
                        if (!(dVar instanceof h)) {
                            return z12;
                        }
                        if (z12 || i5 == 9) {
                        }
                        break;
                    case 5:
                        if (i5 == 2 || i5 == 4) {
                        }
                        break;
                    case 6:
                        if (i5 == 6 || i5 == 8 || i5 == 9) {
                        }
                        break;
                    default:
                        throw new AssertionError(fq.c.w(i11));
                }
            } else if (i11 != 6 || (dVar.D && this.f57076d.D)) {
                return true;
            }
        }
        return false;
    }

    public final void j() {
        HashSet hashSet;
        c cVar = this.f57078f;
        if (cVar != null && (hashSet = cVar.f57073a) != null) {
            hashSet.remove(this);
            if (this.f57078f.f57073a.size() == 0) {
                this.f57078f.f57073a = null;
            }
        }
        this.f57073a = null;
        this.f57078f = null;
        this.f57079g = 0;
        this.f57080h = Integer.MIN_VALUE;
        this.f57075c = false;
        this.f57074b = 0;
    }

    public final void k() {
        e4.f fVar = this.f57081i;
        if (fVar == null) {
            this.f57081i = new e4.f(1);
        } else {
            fVar.c();
        }
    }

    public final void l(int i5) {
        this.f57074b = i5;
        this.f57075c = true;
    }

    public final String toString() {
        return this.f57076d.f57095g0 + ":" + fq.c.w(this.f57077e);
    }
}
