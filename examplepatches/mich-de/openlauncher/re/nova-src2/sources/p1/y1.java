package p1;

import androidx.compose.runtime.ComposeRuntimeError;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Pair;
import kotlin.Result;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class y1 extends w {

    /* renamed from: y, reason: collision with root package name */
    public static final w70.i2 f81644y = w70.u1.c(v1.b.f91889e);

    /* renamed from: z, reason: collision with root package name */
    public static final AtomicReference f81645z = new AtomicReference(Boolean.FALSE);

    /* renamed from: a, reason: collision with root package name */
    public final f f81646a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f81647b;

    /* renamed from: c, reason: collision with root package name */
    public t70.r1 f81648c;

    /* renamed from: d, reason: collision with root package name */
    public Throwable f81649d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f81650e;

    /* renamed from: f, reason: collision with root package name */
    public Object f81651f;

    /* renamed from: g, reason: collision with root package name */
    public z.p0 f81652g;

    /* renamed from: h, reason: collision with root package name */
    public final r1.e f81653h;

    /* renamed from: i, reason: collision with root package name */
    public final ArrayList f81654i;

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f81655j;

    /* renamed from: k, reason: collision with root package name */
    public final z.o0 f81656k;

    /* renamed from: l, reason: collision with root package name */
    public final ab.c0 f81657l;

    /* renamed from: m, reason: collision with root package name */
    public final z.o0 f81658m;
    public final z.o0 n;
    public ArrayList o;

    /* renamed from: p, reason: collision with root package name */
    public LinkedHashSet f81659p;

    /* renamed from: q, reason: collision with root package name */
    public t70.m f81660q;

    /* renamed from: r, reason: collision with root package name */
    public je.f f81661r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f81662s;

    /* renamed from: t, reason: collision with root package name */
    public final w70.i2 f81663t;

    /* renamed from: u, reason: collision with root package name */
    public final x7.u f81664u;

    /* renamed from: v, reason: collision with root package name */
    public final t70.s1 f81665v;

    /* renamed from: w, reason: collision with root package name */
    public final CoroutineContext f81666w;

    /* renamed from: x, reason: collision with root package name */
    public final g1 f81667x;

    public y1(CoroutineContext coroutineContext) {
        f fVar = new f(new a7.f(this, 25));
        this.f81646a = fVar;
        this.f81647b = new Object();
        this.f81650e = new ArrayList();
        this.f81652g = new z.p0();
        this.f81653h = new r1.e(new g0[16]);
        this.f81654i = new ArrayList();
        this.f81655j = new ArrayList();
        this.f81656k = new z.o0();
        this.f81657l = new ab.c0(4);
        this.f81658m = new z.o0();
        this.n = new z.o0();
        this.f81663t = w70.u1.c(w1.f81615c);
        this.f81664u = new x7.u(13);
        t70.s1 s1Var = new t70.s1((t70.r1) coroutineContext.get(t70.q1.f88853a));
        s1Var.w(new v1(this, 0));
        this.f81665v = s1Var;
        this.f81666w = coroutineContext.plus(fVar).plus(s1Var);
        this.f81667x = new g1(6);
    }

    public static final void B(ArrayList arrayList, y1 y1Var, g0 g0Var) {
        arrayList.clear();
        synchronized (y1Var.f81647b) {
            try {
                Iterator it = y1Var.f81655j.iterator();
                while (it.hasNext()) {
                    d1 d1Var = (d1) it.next();
                    if (Intrinsics.b(d1Var.b(), g0Var)) {
                        arrayList.add(d1Var);
                        it.remove();
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static void u(z1.b bVar) {
        try {
            if (bVar.w() instanceof z1.g) {
                throw new IllegalStateException("Unsupported concurrent change during composition. A state object was modified by composition as well as being modified outside composition.");
            }
        } finally {
            bVar.c();
        }
    }

    public final void A(g0 g0Var) {
        synchronized (this.f81647b) {
            ArrayList arrayList = this.f81655j;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                if (Intrinsics.b(((d1) arrayList.get(i5)).b(), g0Var)) {
                    Unit unit = Unit.f71706a;
                    ArrayList arrayList2 = new ArrayList();
                    B(arrayList2, this, g0Var);
                    while (!arrayList2.isEmpty()) {
                        C(arrayList2, null);
                        B(arrayList2, this, g0Var);
                    }
                    return;
                }
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x0146, code lost:
    
        r3 = r10.size();
        r4 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x014b, code lost:
    
        if (r4 >= r3) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0155, code lost:
    
        if (((kotlin.Pair) r10.get(r4)).f71684b == null) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x0157, code lost:
    
        r4 = r4 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x015a, code lost:
    
        r3 = new java.util.ArrayList(r10.size());
        r4 = r10.size();
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x0168, code lost:
    
        if (r8 >= r4) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x016a, code lost:
    
        r11 = (kotlin.Pair) r10.get(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0172, code lost:
    
        if (r11.f71684b != null) goto L121;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0174, code lost:
    
        r11 = (p1.d1) r11.f71683a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x017b, code lost:
    
        r8 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x017e, code lost:
    
        r4 = r17.f81647b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0180, code lost:
    
        monitor-enter(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0181, code lost:
    
        b70.d.z0(r3, r17.f81655j);
        r3 = kotlin.Unit.f71706a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0188, code lost:
    
        monitor-exit(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x0189, code lost:
    
        r3 = new java.util.ArrayList(r10.size());
        r4 = r10.size();
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0197, code lost:
    
        if (r8 >= r4) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x0199, code lost:
    
        r11 = r10.get(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x01a2, code lost:
    
        if (((kotlin.Pair) r11).f71684b == null) goto L125;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01a4, code lost:
    
        r3.add(r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01a7, code lost:
    
        r8 = r8 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x01aa, code lost:
    
        r10 = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final List C(List list, z.p0 p0Var) {
        z1.b bVarC;
        ArrayList arrayList;
        HashMap map = new HashMap(list.size());
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            Object obj = list.get(i5);
            g0 g0VarB = ((d1) obj).b();
            Object arrayList2 = map.get(g0VarB);
            if (arrayList2 == null) {
                arrayList2 = new ArrayList();
                map.put(g0VarB, arrayList2);
            }
            ((ArrayList) arrayList2).add(obj);
        }
        for (Map.Entry entry : map.entrySet()) {
            g0 g0Var = (g0) entry.getKey();
            List list2 = (List) entry.getValue();
            if (((z) g0Var).f81687v.F) {
                u.c("Check failed");
            }
            b00.t tVar = new b00.t(g0Var, 29);
            b00.x xVar = new b00.x(7, g0Var, p0Var);
            z1.f fVarK = z1.k.k();
            z1.b bVar = fVarK instanceof z1.b ? (z1.b) fVarK : null;
            if (bVar == null || (bVarC = bVar.C(tVar, xVar)) == null) {
                throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
            }
            try {
                z1.f fVarJ = bVarC.j();
                try {
                    synchronized (this.f81647b) {
                        try {
                            arrayList = new ArrayList(list2.size());
                            int size2 = list2.size();
                            for (int i11 = 0; i11 < size2; i11++) {
                                d1 d1Var = (d1) list2.get(i11);
                                z.o0 o0Var = this.f81656k;
                                d1Var.getClass();
                                Object objB = r1.a.b(o0Var);
                                arrayList.add(new Pair(d1Var, objB));
                            }
                            int size3 = arrayList.size();
                            int i12 = 0;
                            while (true) {
                                if (i12 >= size3) {
                                    break;
                                }
                                Pair pair = (Pair) arrayList.get(i12);
                                if (pair.f71684b == null) {
                                    ab.c0 c0Var = this.f81657l;
                                    ((d1) pair.f71683a).getClass();
                                    if (((z.o0) c0Var.f691b).a(null)) {
                                        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList, 10));
                                        Iterator it = arrayList.iterator();
                                        while (it.hasNext()) {
                                            Pair pair2 = (Pair) it.next();
                                            if (pair2.f71684b == null) {
                                                ab.c0 c0Var2 = this.f81657l;
                                                ((d1) pair2.f71683a).getClass();
                                                z.o0 o0Var2 = (z.o0) c0Var2.f691b;
                                                if (o0Var2.e()) {
                                                    ((z.o0) c0Var2.f692c).g();
                                                }
                                            }
                                            arrayList3.add(pair2);
                                        }
                                        arrayList = arrayList3;
                                    }
                                }
                                i12++;
                            }
                        } finally {
                        }
                    }
                    int size4 = arrayList.size();
                    int i13 = 0;
                    while (true) {
                        if (i13 >= size4) {
                            break;
                        }
                        if (((Pair) arrayList.get(i13)).f71684b != null) {
                            break;
                        }
                        i13++;
                    }
                    ((z) g0Var).t(arrayList);
                    Unit unit = Unit.f71706a;
                    z1.f.q(fVarJ);
                } catch (Throwable th2) {
                    z1.f.q(fVarJ);
                    throw th2;
                }
            } finally {
                u(bVarC);
            }
        }
        return b70.g.I1(map.keySet());
    }

    public final g0 D(g0 g0Var, z.p0 p0Var) {
        z1.b bVarC;
        z zVar = (z) g0Var;
        if (zVar.f81687v.F || zVar.f81688w == 3) {
            return null;
        }
        LinkedHashSet linkedHashSet = this.f81659p;
        if (linkedHashSet == null || !linkedHashSet.contains(g0Var)) {
            b00.t tVar = new b00.t(g0Var, 29);
            b00.x xVar = new b00.x(7, g0Var, p0Var);
            z1.f fVarK = z1.k.k();
            z1.b bVar = fVarK instanceof z1.b ? (z1.b) fVarK : null;
            if (bVar == null || (bVarC = bVar.C(tVar, xVar)) == null) {
                throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
            }
            try {
                z1.f fVarJ = bVarC.j();
                if (p0Var != null) {
                    try {
                        if (p0Var.c()) {
                            b00.c cVar = new b00.c(12, p0Var, g0Var);
                            t tVar2 = ((z) g0Var).f81687v;
                            if (tVar2.F) {
                                u.c("Preparing a composition while composing is not supported");
                            }
                            tVar2.F = true;
                            try {
                                cVar.invoke();
                                tVar2.F = false;
                            } catch (Throwable th2) {
                                tVar2.F = false;
                                throw th2;
                            }
                        }
                    } catch (Throwable th3) {
                        z1.f.q(fVarJ);
                        throw th3;
                    }
                }
                boolean zY = zVar.y();
                z1.f.q(fVarJ);
                if (zY) {
                    return g0Var;
                }
            } finally {
                u(bVarC);
            }
        }
        return null;
    }

    public final void E(Throwable th2, g0 g0Var) throws Throwable {
        int i5 = 26;
        if (!((Boolean) f81645z.get()).booleanValue() || (th2 instanceof ComposeRuntimeError)) {
            synchronized (this.f81647b) {
                je.f fVar = this.f81661r;
                if (fVar != null) {
                    throw fVar.i();
                }
                this.f81661r = new je.f(th2, i5);
                Unit unit = Unit.f71706a;
            }
            throw th2;
        }
        synchronized (this.f81647b) {
            try {
                x1.k.c("Error was captured in composition while live edit was enabled.", th2);
                this.f81654i.clear();
                this.f81653h.g();
                this.f81652g = new z.p0();
                this.f81655j.clear();
                this.f81656k.g();
                this.f81658m.g();
                this.f81661r = new je.f(th2, i5);
                if (g0Var != null) {
                    G(g0Var);
                }
                w();
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    public final boolean F() {
        EmptyList emptyList = EmptyList.f71733a;
        synchronized (this.f81647b) {
            boolean z11 = true;
            if (this.f81652g.b()) {
                if (this.f81653h.f85079c == 0 && !x() && !this.f81656k.f()) {
                    z11 = false;
                }
                return z11;
            }
            List listZ = z();
            r1.h hVar = new r1.h(this.f81652g);
            this.f81652g = new z.p0();
            try {
                int size = listZ.size();
                for (int i5 = 0; i5 < size; i5++) {
                    ((z) ((g0) listZ.get(i5))).z(hVar);
                    if (((w1) this.f81663t.getValue()).compareTo(w1.f81614b) <= 0) {
                        break;
                    }
                }
                synchronized (this.f81647b) {
                    if (w() != null) {
                        throw new IllegalStateException("called outside of runRecomposeAndApplyChanges");
                    }
                    if (this.f81653h.f85079c == 0 && !x() && !this.f81656k.f()) {
                        z11 = false;
                    }
                }
                return z11;
            } catch (Throwable th2) {
                synchronized (this.f81647b) {
                    z.p0 p0Var = this.f81652g;
                    p0Var.getClass();
                    Iterator<E> it = hVar.iterator();
                    while (it.hasNext()) {
                        p0Var.j(it.next());
                    }
                    throw th2;
                }
            }
        }
    }

    public final void G(g0 g0Var) {
        ArrayList arrayList = this.o;
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.o = arrayList;
        }
        if (!arrayList.contains(g0Var)) {
            arrayList.add(g0Var);
        }
        if (this.f81650e.remove(g0Var)) {
            this.f81651f = null;
        }
    }

    @Override // p1.w
    public final void a(g0 g0Var, Function2 function2) throws Throwable {
        w1 w1Var;
        boolean zContains;
        z1.b bVarC;
        boolean z11 = ((z) g0Var).f81687v.F;
        synchronized (this.f81647b) {
            w1 w1Var2 = (w1) this.f81663t.getValue();
            w1Var = w1.f81614b;
            zContains = w1Var2.compareTo(w1Var) > 0 ? true ^ z().contains(g0Var) : true;
        }
        try {
            b00.t tVar = new b00.t(g0Var, 29);
            b00.x xVar = new b00.x(7, g0Var, null);
            z1.f fVarK = z1.k.k();
            z1.b bVar = fVarK instanceof z1.b ? (z1.b) fVarK : null;
            if (bVar == null || (bVarC = bVar.C(tVar, xVar)) == null) {
                throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
            }
            try {
                z1.f fVarJ = bVarC.j();
                try {
                    z zVar = (z) g0Var;
                    zVar.m(function2);
                    Unit unit = Unit.f71706a;
                    synchronized (this.f81647b) {
                        if (((w1) this.f81663t.getValue()).compareTo(w1Var) > 0 && !z().contains(g0Var)) {
                            this.f81650e.add(g0Var);
                            this.f81651f = null;
                        }
                    }
                    if (!z11) {
                        z1.k.k().m();
                    }
                    try {
                        A(g0Var);
                        try {
                            zVar.g();
                            zVar.i();
                            if (z11) {
                                return;
                            }
                            z1.k.k().m();
                        } catch (Throwable th2) {
                            E(th2, null);
                        }
                    } catch (Throwable th3) {
                        E(th3, g0Var);
                    }
                } finally {
                    z1.f.q(fVarJ);
                }
            } finally {
                u(bVarC);
            }
        } catch (Throwable th4) {
            if (zContains) {
                synchronized (this.f81647b) {
                    Unit unit2 = Unit.f71706a;
                }
            }
            E(th4, g0Var);
        }
    }

    @Override // p1.w
    public final z.a1 b(g0 g0Var, rl.g gVar, Function2 function2) {
        x7.u uVar = this.f81664u;
        try {
            z zVar = (z) g0Var;
            rl.g gVar2 = zVar.f81681p;
            zVar.f81681p = gVar;
            try {
                a(g0Var, function2);
                z.p0 p0Var = (z.p0) uVar.h();
                if (p0Var == null) {
                    p0Var = z.b1.f97745a;
                    Intrinsics.e(p0Var, "null cannot be cast to non-null type androidx.collection.ScatterSet<E of androidx.collection.ScatterSetKt.emptyScatterSet>");
                }
                return p0Var;
            } finally {
                ((z) g0Var).f81681p = gVar2;
            }
        } finally {
            uVar.u(null);
        }
    }

    @Override // p1.w
    public final boolean d() {
        return ((Boolean) f81645z.get()).booleanValue();
    }

    @Override // p1.w
    public final boolean e() {
        return false;
    }

    @Override // p1.w
    public final boolean f() {
        return false;
    }

    @Override // p1.w
    public final long g() {
        return 1000;
    }

    @Override // p1.w
    public final v h() {
        return null;
    }

    @Override // p1.w
    public final CoroutineContext j() {
        return this.f81666w;
    }

    @Override // p1.w
    public final void k(g0 g0Var) {
        t70.l lVarW;
        synchronized (this.f81647b) {
            if (this.f81653h.h(g0Var)) {
                lVarW = null;
            } else {
                this.f81653h.b(g0Var);
                lVarW = w();
            }
        }
        if (lVarW != null) {
            int i5 = Result.f71687b;
            ((t70.m) lVarW).resumeWith(Unit.f71706a);
        }
    }

    @Override // p1.w
    public final c1 l(d1 d1Var) {
        c1 c1Var;
        synchronized (this.f81647b) {
            c1Var = (c1) this.f81658m.k(d1Var);
        }
        return c1Var;
    }

    @Override // p1.w
    public final z.a1 m(g0 g0Var, rl.g gVar, z.a1 a1Var) {
        x7.u uVar = this.f81664u;
        try {
            F();
            z zVar = (z) g0Var;
            zVar.z(new r1.h(a1Var));
            rl.g gVar2 = zVar.f81681p;
            zVar.f81681p = gVar;
            try {
                g0 g0VarD = D(zVar, null);
                if (g0VarD != null) {
                    A(zVar);
                    z zVar2 = (z) g0VarD;
                    zVar2.g();
                    zVar2.i();
                }
                z.p0 p0Var = (z.p0) uVar.h();
                if (p0Var == null) {
                    p0Var = z.b1.f97745a;
                    Intrinsics.e(p0Var, "null cannot be cast to non-null type androidx.collection.ScatterSet<E of androidx.collection.ScatterSetKt.emptyScatterSet>");
                }
                return p0Var;
            } finally {
                zVar.f81681p = gVar2;
            }
        } finally {
            uVar.u(null);
        }
    }

    @Override // p1.w
    public final void n(Set set) {
    }

    @Override // p1.w
    public final void p(t1 t1Var) {
        x7.u uVar = this.f81664u;
        z.p0 p0Var = (z.p0) uVar.h();
        if (p0Var == null) {
            z.p0 p0Var2 = z.b1.f97745a;
            p0Var = new z.p0();
            uVar.u(p0Var);
        }
        p0Var.d(t1Var);
    }

    @Override // p1.w
    public final void q(z zVar) {
        synchronized (this.f81647b) {
            try {
                LinkedHashSet linkedHashSet = this.f81659p;
                if (linkedHashSet == null) {
                    linkedHashSet = new LinkedHashSet();
                    this.f81659p = linkedHashSet;
                }
                linkedHashSet.add(zVar);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // p1.w
    public final void t(z zVar) {
        synchronized (this.f81647b) {
            if (this.f81650e.remove(zVar)) {
                this.f81651f = null;
            }
            this.f81653h.j(zVar);
            this.f81654i.remove(zVar);
            Unit unit = Unit.f71706a;
        }
    }

    public final void v() {
        synchronized (this.f81647b) {
            try {
                if (((w1) this.f81663t.getValue()).compareTo(w1.f81617e) >= 0) {
                    w70.i2 i2Var = this.f81663t;
                    w1 w1Var = w1.f81614b;
                    i2Var.getClass();
                    i2Var.k(null, w1Var);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f81665v.c(null);
    }

    public final t70.l w() {
        w1 w1Var;
        w70.i2 i2Var = this.f81663t;
        int iCompareTo = ((w1) i2Var.getValue()).compareTo(w1.f81614b);
        ArrayList arrayList = this.f81655j;
        ArrayList arrayList2 = this.f81654i;
        r1.e eVar = this.f81653h;
        if (iCompareTo > 0) {
            if (this.f81661r != null) {
                w1Var = w1.f81615c;
            } else if (this.f81648c == null) {
                this.f81652g = new z.p0();
                eVar.g();
                w1Var = x() ? w1.f81616d : w1.f81615c;
            } else {
                w1Var = (eVar.f85079c == 0 && !this.f81652g.c() && arrayList2.isEmpty() && arrayList.isEmpty() && !x() && !this.f81656k.f()) ? w1.f81617e : w1.f81618f;
            }
            i2Var.getClass();
            i2Var.k(null, w1Var);
            if (w1Var != w1.f81618f) {
                return null;
            }
            t70.m mVar = this.f81660q;
            this.f81660q = null;
            return mVar;
        }
        for (g0 g0Var : z()) {
        }
        this.f81650e.clear();
        this.f81651f = EmptyList.f71733a;
        this.f81652g = new z.p0();
        eVar.g();
        arrayList2.clear();
        arrayList.clear();
        this.o = null;
        t70.m mVar2 = this.f81660q;
        if (mVar2 != null) {
            mVar2.a(null);
        }
        this.f81660q = null;
        this.f81661r = null;
        return null;
    }

    public final boolean x() {
        return !this.f81662s && (this.f81646a.f81405d.get() & 134217727) > 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean y() {
        boolean z11;
        synchronized (this.f81647b) {
            if (this.f81652g.c() || this.f81653h.f85079c != 0) {
                z11 = true;
            } else if (!x()) {
                z11 = false;
            }
        }
        return z11;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.List] */
    public final List z() {
        ?? r02 = this.f81651f;
        if (r02 != 0) {
            return r02;
        }
        ArrayList arrayList = this.f81650e;
        List arrayList2 = arrayList.isEmpty() ? EmptyList.f71733a : new ArrayList(arrayList);
        this.f81651f = arrayList2;
        return arrayList2;
    }
}
