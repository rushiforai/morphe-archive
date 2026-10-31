package n0;

import android.os.Trace;
import androidx.compose.ui.node.LayoutNode;
import cw.l2;
import e10.p3;
import java.util.ArrayList;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlin.time.LongSaturatedMathKt;
import kotlin.time.MonotonicTimeSource;
import kotlin.time.TimeSource;
import z2.t1;
import z2.v1;

/* loaded from: classes2.dex */
public final class a1 implements m0, b1, n0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f77377a;

    /* renamed from: b, reason: collision with root package name */
    public final i50.c f77378b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f77379c;

    /* renamed from: d, reason: collision with root package name */
    public final y3.a f77380d;

    /* renamed from: e, reason: collision with root package name */
    public t1 f77381e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f77382f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f77383g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f77384h;

    /* renamed from: i, reason: collision with root package name */
    public Object f77385i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f77386j;

    /* renamed from: k, reason: collision with root package name */
    public z0 f77387k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f77388l;

    /* renamed from: m, reason: collision with root package name */
    public long f77389m;
    public long n;
    public long o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ androidx.room.h f77390p;

    public a1(androidx.room.h hVar, int i5, i50.c cVar, Function1 function1) {
        this.f77390p = hVar;
        this.f77377a = i5;
        this.f77378b = cVar;
        this.f77379c = function1;
        TimeSource.Monotonic.f72054a.getClass();
        MonotonicTimeSource.f72052a.getClass();
        this.o = MonotonicTimeSource.a();
    }

    @Override // n0.m0
    public final void a() {
        this.f77388l = true;
    }

    public final void b() {
        t1 t1Var = this.f77381e;
        if (t1Var != null) {
            t1Var.dispose();
        }
        this.f77381e = null;
        this.f77387k = null;
    }

    public final boolean c(m.p0 p0Var) {
        boolean zD;
        if (!this.f77390p.f15218a) {
            return false;
        }
        if (this.f77388l) {
            Trace.beginSection("compose:lazy:prefetch:execute:urgent");
            try {
                zD = d(p0Var);
            } finally {
                Trace.endSection();
            }
        } else {
            zD = d(p0Var);
        }
        l2.J(-1L, "compose:lazy:prefetch:execute:item");
        return zD;
    }

    @Override // n0.m0
    public final void cancel() {
        if (this.f77383g) {
            return;
        }
        this.f77383g = true;
        b();
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:126:0x026c  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0281  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x017f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean d(m.p0 p0Var) {
        z0 z0Var;
        z0 z0Var2;
        y3.a aVar;
        z0 z0Var3;
        List list;
        int i5 = this.f77377a;
        long j11 = i5;
        l2.J(j11, "compose:lazy:prefetch:execute:item");
        androidx.room.h hVar = this.f77390p;
        d0 d0Var = (d0) ((b0) hVar.f15219b).f77396b.invoke();
        if (!this.f77383g) {
            int iA = d0Var.a();
            if (i5 >= 0 && i5 < iA) {
                Object objD = d0Var.d(i5);
                Object obj = this.f77385i;
                if (obj != null && !objD.equals(obj)) {
                    b();
                    return false;
                }
                Object objB = d0Var.b(i5);
                i50.c cVar = this.f77378b;
                b bVar = (b) cVar.f61381d;
                if (cVar.f61380c != objB || bVar == null) {
                    z.o0 o0Var = (z.o0) cVar.f61379b;
                    Object objD2 = o0Var.d(objB);
                    Object obj2 = objD2;
                    if (objD2 == null) {
                        b bVar2 = new b();
                        bVar2.f77394d = -1;
                        o0Var.m(objB, bVar2);
                        obj2 = bVar2;
                    }
                    bVar = (b) obj2;
                    cVar.f61380c = objB;
                    cVar.f61381d = bVar;
                }
                e();
                long jA = p0Var.a();
                this.f77389m = jA;
                TimeSource.Monotonic.f72054a.getClass();
                MonotonicTimeSource.f72052a.getClass();
                this.o = MonotonicTimeSource.a();
                this.n = 0L;
                l2.J(jA, "compose:lazy:prefetch:available_time_nanos");
                if (!e()) {
                    if (h(this.f77389m, bVar.f77391a)) {
                        Trace.beginSection("compose:lazy:prefetch:compose");
                        try {
                            if (this.f77381e != null) {
                                j0.b.a("Request was already composed!");
                            }
                            Function2 function2A = ((b0) hVar.f15219b).a(i5, objD, objB);
                            this.f77385i = objD;
                            z2.n0 n0VarA = ((v1) hVar.f15220c).a();
                            LayoutNode layoutNode = n0VarA.f98107a;
                            if (layoutNode.isAttached()) {
                                n0VarA.c();
                                if (!n0VarA.f98113g.b(objD)) {
                                    n0VarA.f98118l.k(objD);
                                    z.o0 o0Var2 = n0VarA.f98116j;
                                    Object objD3 = o0Var2.d(objD);
                                    if (objD3 == null) {
                                        objD3 = n0VarA.h(objD);
                                        if (objD3 != null) {
                                            n0VarA.e(layoutNode.getFoldedChildren$ui_release().indexOf(objD3), layoutNode.getFoldedChildren$ui_release().size());
                                            n0VarA.o++;
                                        } else {
                                            int size = layoutNode.getFoldedChildren$ui_release().size();
                                            LayoutNode layoutNode2 = new LayoutNode(true, 0, 2, null);
                                            layoutNode.ignoreRemeasureRequests = true;
                                            layoutNode.insertAt$ui_release(size, layoutNode2);
                                            Unit unit = Unit.f71706a;
                                            layoutNode.ignoreRemeasureRequests = false;
                                            n0VarA.o++;
                                            objD3 = layoutNode2;
                                        }
                                        o0Var2.m(objD, objD3);
                                    }
                                    n0VarA.g((LayoutNode) objD3, objD, false, function2A);
                                }
                            }
                            this.f77381e = !layoutNode.isAttached() ? new z2.l0() : new z2.m0(n0VarA, objD);
                            this.f77384h = true;
                            Unit unit2 = Unit.f71706a;
                            Trace.endSection();
                            i();
                            bVar.f77391a = b.a(this.n, bVar.f77391a);
                        } finally {
                        }
                    }
                    if (e()) {
                    }
                } else {
                    if (this.f77386j) {
                        z0Var = this.f77387k;
                        if (z0Var != null) {
                            int i11 = bVar.f77394d;
                            boolean z11 = this.f77388l;
                            List[] listArr = z0Var.f77538b;
                            int i12 = z0Var.f77539c;
                            List list2 = z0Var.f77537a;
                            if (i12 < list2.size()) {
                                if (z0Var.f77542f.f77383g) {
                                    j0.b.c("Should not execute nested prefetch on canceled request");
                                }
                                Trace.beginSection("compose:lazy:prefetch:update_nested_prefetch_count");
                                try {
                                    int size2 = list2.size();
                                    for (int i13 = 0; i13 < size2; i13++) {
                                        ((o0) list2.get(i13)).f77457d = i11;
                                    }
                                    Unit unit3 = Unit.f71706a;
                                    Trace.endSection();
                                    Trace.beginSection("compose:lazy:prefetch:nested");
                                    while (z0Var.f77539c < list2.size()) {
                                        try {
                                            if (listArr[z0Var.f77539c] == null) {
                                                if (p0Var.a() <= 0) {
                                                    return true;
                                                }
                                                int i14 = z0Var.f77539c;
                                                o0 o0Var3 = (o0) list2.get(i14);
                                                Function1 function1 = o0Var3.f77454a;
                                                if (function1 == null) {
                                                    list = EmptyList.f71733a;
                                                } else {
                                                    l0 l0Var = new l0(o0Var3, o0Var3.f77457d);
                                                    function1.invoke(l0Var);
                                                    ArrayList arrayList = l0Var.f77448b;
                                                    o0Var3.f77459f = arrayList.size();
                                                    list = arrayList;
                                                }
                                                listArr[i14] = list;
                                            }
                                            List list3 = listArr[z0Var.f77539c];
                                            Intrinsics.d(list3);
                                            while (z0Var.f77540d < list3.size()) {
                                                b1 b1Var = (b1) list3.get(z0Var.f77540d);
                                                if (z11) {
                                                    a1 a1Var = b1Var instanceof a1 ? (a1) b1Var : null;
                                                    if (a1Var != null) {
                                                        a1Var.f77388l = true;
                                                    }
                                                }
                                                z0Var.f77541e = true;
                                                if (((a1) b1Var).c(p0Var)) {
                                                    return true;
                                                }
                                                z0Var.f77540d++;
                                            }
                                            z0Var.f77540d = 0;
                                            z0Var.f77539c++;
                                        } finally {
                                        }
                                    }
                                    Unit unit4 = Unit.f71706a;
                                } catch (Throwable th2) {
                                    throw th2;
                                }
                            }
                        }
                        z0Var2 = this.f77387k;
                        if (z0Var2 != null && z0Var2.f77541e) {
                            i();
                            l2.J(j11, "compose:lazy:prefetch:execute:item");
                            z0Var3 = this.f77387k;
                            if (z0Var3 != null) {
                                z0Var3.f77541e = false;
                            }
                        }
                        if (!this.f77382f && (aVar = this.f77380d) != null) {
                            if (h(this.f77389m, bVar.f77393c)) {
                                Trace.beginSection("compose:lazy:prefetch:measure");
                                try {
                                    f(aVar.f96596a);
                                    Unit unit5 = Unit.f71706a;
                                    Trace.endSection();
                                    i();
                                    bVar.f77393c = b.a(this.n, bVar.f77393c);
                                    Function1 function12 = this.f77379c;
                                    if (function12 != null) {
                                        function12.invoke(this);
                                    }
                                } finally {
                                }
                            }
                        }
                        z0 z0Var4 = this.f77387k;
                        if (this.f77382f || !this.f77386j || z0Var4 == null) {
                            return false;
                        }
                        List list4 = z0Var4.f77537a;
                        List list5 = list4;
                        int size3 = list5.size();
                        int iMin = Integer.MAX_VALUE;
                        for (int i15 = 0; i15 < size3; i15++) {
                            iMin = Math.min(iMin, ((o0) list4.get(i15)).f77458e);
                        }
                        if (iMin == Integer.MAX_VALUE) {
                            iMin = 0;
                        }
                        int i16 = bVar.f77394d;
                        bVar.f77394d = i16 == -1 ? iMin : ((i16 * 3) + iMin) / 4;
                        int size4 = list5.size();
                        int iMin2 = Integer.MAX_VALUE;
                        for (int i17 = 0; i17 < size4; i17++) {
                            iMin2 = Math.min(iMin2, ((o0) list4.get(i17)).f77459f);
                        }
                        if (iMin2 == Integer.MAX_VALUE) {
                            iMin2 = 0;
                        }
                        if (iMin2 >= iMin) {
                            return false;
                        }
                        bVar.f77393c = 0L;
                        return false;
                    }
                    if (this.f77389m > 0) {
                        Trace.beginSection("compose:lazy:prefetch:resolve-nested");
                        try {
                            this.f77387k = g();
                            this.f77386j = true;
                            Unit unit6 = Unit.f71706a;
                            z0Var = this.f77387k;
                            if (z0Var != null) {
                            }
                            z0Var2 = this.f77387k;
                            if (z0Var2 != null) {
                                i();
                                l2.J(j11, "compose:lazy:prefetch:execute:item");
                                z0Var3 = this.f77387k;
                                if (z0Var3 != null) {
                                }
                            }
                            if (!this.f77382f) {
                                if (h(this.f77389m, bVar.f77393c)) {
                                }
                            }
                            z0 z0Var42 = this.f77387k;
                            return this.f77382f ? false : false;
                        } finally {
                        }
                    }
                }
                return true;
            }
        }
        b();
        return false;
    }

    public final boolean e() {
        return this.f77384h;
    }

    public final void f(long j11) {
        if (this.f77383g) {
            j0.b.a("Callers should check whether the request is still valid before calling performMeasure()");
        }
        if (this.f77382f) {
            j0.b.a("Request was already measured!");
        }
        this.f77382f = true;
        t1 t1Var = this.f77381e;
        if (t1Var == null) {
            j0.b.b("performComposition() must be called before performMeasure()");
            throw new KotlinNothingValueException();
        }
        int iA = t1Var.a();
        for (int i5 = 0; i5 < iA; i5++) {
            t1Var.c(i5, j11);
        }
    }

    public final z0 g() {
        t1 t1Var = this.f77381e;
        if (t1Var == null) {
            j0.b.b("Should precompose before resolving nested prefetch states");
            throw new KotlinNothingValueException();
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        t1Var.b(new p3(objectRef, 1));
        List list = (List) objectRef.f71863a;
        if (list != null) {
            return new z0(this, list);
        }
        return null;
    }

    public final boolean h(long j11, long j12) {
        if (this.f77388l) {
            j12 = 0;
        }
        return j11 > j12;
    }

    public final void i() {
        long jA;
        TimeSource.Monotonic.f72054a.getClass();
        MonotonicTimeSource monotonicTimeSource = MonotonicTimeSource.f72052a;
        monotonicTimeSource.getClass();
        long jA2 = MonotonicTimeSource.a();
        long j11 = this.o;
        monotonicTimeSource.getClass();
        DurationUnit unit = DurationUnit.f72043b;
        Intrinsics.g(unit, "unit");
        long j12 = Long.MAX_VALUE;
        if (((j11 - 1) | 1) != Long.MAX_VALUE) {
            jA = (1 | (jA2 - 1)) == Long.MAX_VALUE ? LongSaturatedMathKt.a(jA2) : LongSaturatedMathKt.b(jA2, j11, unit);
        } else if (jA2 == j11) {
            Duration.f72038b.getClass();
            jA = 0;
        } else {
            jA = Duration.t(LongSaturatedMathKt.a(j11));
        }
        long j13 = jA >> 1;
        Duration.Companion companion = Duration.f72038b;
        if ((1 & ((int) jA)) == 0) {
            j12 = j13;
        } else if (j13 <= 9223372036854L) {
            j12 = j13 < -9223372036854L ? Long.MIN_VALUE : j13 * 1000000;
        }
        this.n = j12;
        long j14 = this.f77389m - j12;
        this.f77389m = j14;
        this.o = jA2;
        l2.J(j14, "compose:lazy:prefetch:available_time_nanos");
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("HandleAndRequestImpl { index = ");
        sb2.append(this.f77377a);
        sb2.append(", constraints = ");
        sb2.append(this.f77380d);
        sb2.append(", isComposed = ");
        sb2.append(e());
        sb2.append(", isMeasured = ");
        sb2.append(this.f77382f);
        sb2.append(", isCanceled = ");
        return a80.m.k(sb2, this.f77383g, " }");
    }

    public a1(androidx.room.h hVar, int i5, long j11, i50.c cVar, Function1 function1) {
        this(hVar, i5, cVar, function1);
        this.f77380d = new y3.a(j11);
    }
}
