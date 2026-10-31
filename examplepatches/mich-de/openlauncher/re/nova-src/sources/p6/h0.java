package p6;

import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.sequences.ConstrainedOnceSequence;
import z.d1;
import z.e1;

/* loaded from: classes2.dex */
public class h0 extends e0 implements Iterable, KMappedMarker {
    public static final /* synthetic */ int n = 0;

    /* renamed from: j, reason: collision with root package name */
    public final d1 f82177j;

    /* renamed from: k, reason: collision with root package name */
    public int f82178k;

    /* renamed from: l, reason: collision with root package name */
    public String f82179l;

    /* renamed from: m, reason: collision with root package name */
    public String f82180m;

    public h0(k0 k0Var) {
        super(k0Var);
        this.f82177j = new d1(0);
    }

    @Override // p6.e0
    public final b0 c(mh.c cVar) {
        return g(cVar, false, this);
    }

    public final e0 e(String route, boolean z11) {
        Object next;
        h0 h0Var;
        Intrinsics.g(route, "route");
        d1 d1Var = this.f82177j;
        Intrinsics.g(d1Var, "<this>");
        Iterator it = ((ConstrainedOnceSequence) q70.d.m0(new a70.e(d1Var))).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            e0 e0Var = (e0) next;
            if (r70.j.B0(e0Var.f82158g, route, false) || e0Var.d(route) != null) {
                break;
            }
        }
        e0 e0Var2 = (e0) next;
        if (e0Var2 != null) {
            return e0Var2;
        }
        if (!z11 || (h0Var = this.f82153b) == null || r70.k.U0(route)) {
            return null;
        }
        return h0Var.e(route, true);
    }

    @Override // p6.e0
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof h0) || !super.equals(obj)) {
            return false;
        }
        d1 d1Var = this.f82177j;
        int iF = d1Var.f();
        h0 h0Var = (h0) obj;
        d1 d1Var2 = h0Var.f82177j;
        if (iF != d1Var2.f() || this.f82178k != h0Var.f82178k) {
            return false;
        }
        Iterator it = ((ConstrainedOnceSequence) q70.d.m0(new a70.e(d1Var))).iterator();
        while (it.hasNext()) {
            e0 e0Var = (e0) it.next();
            if (!e0Var.equals(e1.b(d1Var2, e0Var.f82157f))) {
                return false;
            }
        }
        return true;
    }

    public final e0 f(int i5, h0 h0Var, boolean z11, e0 e0Var) {
        d1 d1Var = this.f82177j;
        d1Var.getClass();
        e0 e0VarF = (e0) e1.b(d1Var, i5);
        if (e0Var != null) {
            if (Intrinsics.b(e0VarF, e0Var) && Intrinsics.b(e0VarF.f82153b, e0Var.f82153b)) {
                return e0VarF;
            }
            e0VarF = null;
        } else if (e0VarF != null) {
            return e0VarF;
        }
        if (z11) {
            Iterator it = ((ConstrainedOnceSequence) q70.d.m0(new a70.e(d1Var))).iterator();
            while (true) {
                if (!it.hasNext()) {
                    e0VarF = null;
                    break;
                }
                e0 e0Var2 = (e0) it.next();
                e0VarF = (!(e0Var2 instanceof h0) || e0Var2.equals(h0Var)) ? null : ((h0) e0Var2).f(i5, this, true, e0Var);
                if (e0VarF != null) {
                    break;
                }
            }
        }
        if (e0VarF != null) {
            return e0VarF;
        }
        h0 h0Var2 = this.f82153b;
        if (h0Var2 == null || h0Var2.equals(h0Var)) {
            return null;
        }
        h0 h0Var3 = this.f82153b;
        Intrinsics.d(h0Var3);
        return h0Var3.f(i5, this, z11, e0Var);
    }

    public final b0 g(mh.c cVar, boolean z11, h0 h0Var) {
        b0 b0VarG;
        b0 b0VarC = super.c(cVar);
        ArrayList arrayList = new ArrayList();
        g0 g0Var = new g0(this);
        while (true) {
            if (!g0Var.hasNext()) {
                break;
            }
            e0 e0Var = (e0) g0Var.next();
            b0VarG = Intrinsics.b(e0Var, h0Var) ? null : e0Var.c(cVar);
            if (b0VarG != null) {
                arrayList.add(b0VarG);
            }
        }
        b0 b0Var = (b0) b70.g.j1(arrayList);
        h0 h0Var2 = this.f82153b;
        if (h0Var2 != null && z11 && !h0Var2.equals(h0Var)) {
            b0VarG = h0Var2.g(cVar, true, this);
        }
        return (b0) b70.g.j1(kotlin.collections.c.v0(new b0[]{b0VarC, b0Var, b0VarG}));
    }

    public final b0 h(String route, boolean z11, h0 h0Var) {
        b0 b0VarH;
        Intrinsics.g(route, "route");
        b0 b0VarD = d(route);
        ArrayList arrayList = new ArrayList();
        g0 g0Var = new g0(this);
        while (true) {
            if (!g0Var.hasNext()) {
                break;
            }
            e0 e0Var = (e0) g0Var.next();
            b0VarH = Intrinsics.b(e0Var, h0Var) ? null : e0Var instanceof h0 ? ((h0) e0Var).h(route, false, this) : e0Var.d(route);
            if (b0VarH != null) {
                arrayList.add(b0VarH);
            }
        }
        b0 b0Var = (b0) b70.g.j1(arrayList);
        h0 h0Var2 = this.f82153b;
        if (h0Var2 != null && z11 && !h0Var2.equals(h0Var)) {
            b0VarH = h0Var2.h(route, true, this);
        }
        return (b0) b70.g.j1(kotlin.collections.c.v0(new b0[]{b0VarD, b0Var, b0VarH}));
    }

    @Override // p6.e0
    public final int hashCode() {
        int iD = this.f82178k;
        d1 d1Var = this.f82177j;
        int iF = d1Var.f();
        for (int i5 = 0; i5 < iF; i5++) {
            iD = (((iD * 31) + d1Var.d(i5)) * 31) + ((e0) d1Var.g(i5)).hashCode();
        }
        return iD;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new g0(this);
    }

    @Override // p6.e0
    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        String str = this.f82180m;
        e0 e0VarE = (str == null || r70.k.U0(str)) ? null : e(str, true);
        if (e0VarE == null) {
            e0VarE = f(this.f82178k, this, false, null);
        }
        sb2.append(" startDestination=");
        if (e0VarE == null) {
            String str2 = this.f82180m;
            if (str2 != null) {
                sb2.append(str2);
            } else {
                String str3 = this.f82179l;
                if (str3 != null) {
                    sb2.append(str3);
                } else {
                    sb2.append("0x" + Integer.toHexString(this.f82178k));
                }
            }
        } else {
            sb2.append("{");
            sb2.append(e0VarE.toString());
            sb2.append("}");
        }
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
