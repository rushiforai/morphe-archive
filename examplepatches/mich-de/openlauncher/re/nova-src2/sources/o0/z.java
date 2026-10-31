package o0;

import androidx.compose.ui.node.LayoutNode;
import e0.f1;
import g0.b2;
import g0.d1;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import n0.k0;
import n0.m0;
import n0.o0;
import p1.e1;
import p1.g1;
import p1.s2;
import z2.l1;

/* loaded from: classes.dex */
public final class z implements b2 {

    /* renamed from: x, reason: collision with root package name */
    public static final /* synthetic */ int f78832x = 0;

    /* renamed from: a, reason: collision with root package name */
    public boolean f78833a;

    /* renamed from: b, reason: collision with root package name */
    public p f78834b;

    /* renamed from: c, reason: collision with root package name */
    public final u f78835c;

    /* renamed from: d, reason: collision with root package name */
    public final e1 f78836d = androidx.compose.runtime.d.j(r.f78794a, g1.f81422b);

    /* renamed from: e, reason: collision with root package name */
    public final c30.c f78837e = new c30.c(5, (byte) 0);

    /* renamed from: f, reason: collision with root package name */
    public final e1 f78838f;

    /* renamed from: g, reason: collision with root package name */
    public final e1 f78839g;

    /* renamed from: h, reason: collision with root package name */
    public l1 f78840h;

    /* renamed from: i, reason: collision with root package name */
    public final m0.z f78841i;

    /* renamed from: j, reason: collision with root package name */
    public final n0.d f78842j;

    /* renamed from: k, reason: collision with root package name */
    public final n0.j f78843k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f78844l;

    /* renamed from: m, reason: collision with root package name */
    public final o0 f78845m;
    public final g0.l n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public int f78846p;

    /* renamed from: q, reason: collision with root package name */
    public final LinkedHashMap f78847q;

    /* renamed from: r, reason: collision with root package name */
    public final i0.i f78848r;

    /* renamed from: s, reason: collision with root package name */
    public final k0 f78849s;

    /* renamed from: t, reason: collision with root package name */
    public final androidx.compose.foundation.lazy.layout.c f78850t;

    /* renamed from: u, reason: collision with root package name */
    public final e1 f78851u;

    /* renamed from: v, reason: collision with root package name */
    public final e1 f78852v;

    /* renamed from: w, reason: collision with root package name */
    public final m.w f78853w;

    static {
        y1.j.b(new m3.a0(9), new m(1));
    }

    public z(int[] iArr, int[] iArr2) {
        this.f78835c = new u(iArr, iArr2, new y(2, 0, z.class, this, "fillNearestIndices", "fillNearestIndices(II)[I"));
        Boolean bool = Boolean.FALSE;
        this.f78838f = androidx.compose.runtime.d.k(bool);
        this.f78839g = androidx.compose.runtime.d.k(bool);
        this.f78841i = new m0.z(this, 1);
        this.f78842j = new n0.d();
        this.f78843k = new n0.j();
        this.f78844l = true;
        this.f78845m = new o0(null);
        this.n = new g0.l(new b00.t(this, 27));
        this.f78846p = -1;
        this.f78847q = new LinkedHashMap();
        this.f78848r = new i0.i();
        this.f78849s = new k0();
        this.f78850t = new androidx.compose.foundation.lazy.layout.c();
        this.f78851u = n0.z.f();
        this.f78852v = n0.z.f();
        this.f78853w = new m.w(1);
    }

    @Override // g0.b2
    public final float a(float f11) {
        return this.n.a(f11);
    }

    @Override // g0.b2
    public final boolean b() {
        return this.n.b();
    }

    @Override // g0.b2
    public final boolean c() {
        return ((Boolean) ((s2) this.f78839g).getValue()).booleanValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x005f, code lost:
    
        if (r5.n.d(r6, r7, r0) == r1) goto L21;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // g0.b2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        x xVar;
        Function2 function22;
        if (continuationImpl instanceof x) {
            xVar = (x) continuationImpl;
            int i5 = xVar.f78831x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xVar.f78831x = i5 - Integer.MIN_VALUE;
            } else {
                xVar = new x(this, continuationImpl);
            }
        }
        Object obj = xVar.f78829v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xVar.f78831x;
        if (i11 == 0) {
            ResultKt.b(obj);
            xVar.f78827t = f1Var;
            xVar.f78828u = (SuspendLambda) function2;
            xVar.f78831x = 1;
            function22 = function2;
            if (this.f78842j.a(xVar) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        Function2 function23 = (Function2) xVar.f78828u;
        f1Var = xVar.f78827t;
        ResultKt.b(obj);
        function22 = function23;
        xVar.f78827t = null;
        xVar.f78828u = null;
        xVar.f78831x = 2;
    }

    @Override // g0.b2
    public final boolean e() {
        return ((Boolean) ((s2) this.f78838f).getValue()).booleanValue();
    }

    public final void f(p pVar, boolean z11, boolean z12) {
        Object obj;
        if (!z11 && this.f78833a) {
            this.f78834b = pVar;
            return;
        }
        boolean z13 = true;
        if (z11) {
            this.f78833a = true;
        }
        float f11 = this.o;
        float f12 = pVar.f78777c;
        List list = pVar.f78787m;
        int[] iArr = pVar.f78775a;
        int[] iArr2 = pVar.f78776b;
        this.o = f11 - f12;
        ((s2) this.f78836d).setValue(pVar);
        u uVar = this.f78835c;
        if (z12) {
            uVar.f78817d = iArr2;
            uVar.f78818e.p(u.b(uVar.f78815b, iArr2));
        } else {
            uVar.getClass();
            int iA = u.a(iArr);
            List list2 = list;
            int size = list2.size();
            int i5 = 0;
            while (true) {
                if (i5 >= size) {
                    obj = null;
                    break;
                }
                obj = list.get(i5);
                if (((s) obj).f78795a == iA) {
                    break;
                } else {
                    i5++;
                }
            }
            s sVar = (s) obj;
            uVar.f78820g = sVar != null ? sVar.f78796b : null;
            uVar.f78821h.a(iA);
            if (uVar.f78819f || pVar.f78786l > 0) {
                uVar.f78819f = true;
                z1.f fVarL = o2.f.l();
                Function1 function1E = fVarL != null ? fVarL.e() : null;
                z1.f fVarQ = o2.f.q(fVarL);
                try {
                    uVar.f78815b = iArr;
                    uVar.f78816c.p(u.a(iArr));
                    uVar.f78817d = iArr2;
                    uVar.f78818e.p(u.b(iArr, iArr2));
                    Unit unit = Unit.f71706a;
                } finally {
                    o2.f.w(fVarL, fVarQ, function1E);
                }
            }
            if (this.f78846p != -1 && !list2.isEmpty()) {
                int i11 = ((s) b70.g.W0(list)).f78795a;
                int i12 = ((s) b70.g.h1(list)).f78795a;
                int i13 = this.f78846p;
                if (i11 > i13 || i13 > i12) {
                    this.f78846p = -1;
                    LinkedHashMap linkedHashMap = this.f78847q;
                    Iterator it = linkedHashMap.values().iterator();
                    while (it.hasNext()) {
                        ((m0) it.next()).cancel();
                    }
                    linkedHashMap.clear();
                }
            }
        }
        if (iArr[0] == 0 && iArr2[0] <= 0) {
            z13 = false;
        }
        ((s2) this.f78839g).setValue(Boolean.valueOf(z13));
        ((s2) this.f78838f).setValue(Boolean.valueOf(pVar.f78780f));
        if (z11) {
            this.f78853w.F(pVar.f78779e, pVar.f78785k, pVar.f78792t);
        }
    }

    public final p g() {
        return (p) ((s2) this.f78836d).getValue();
    }

    public final void h(float f11, p pVar) {
        LinkedHashMap linkedHashMap;
        int iH;
        int i5;
        long jH;
        if (this.f78844l) {
            List list = pVar.f78787m;
            if (list.isEmpty()) {
                return;
            }
            boolean z11 = f11 < 0.0f;
            int i11 = z11 ? ((s) b70.g.h1(list)).f78795a : ((s) b70.g.W0(list)).f78795a;
            if (i11 == this.f78846p) {
                return;
            }
            this.f78846p = i11;
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            x7.e eVar = pVar.f78783i;
            int[] iArr = (int[]) eVar.f95131b;
            int length = iArr.length;
            int i12 = 0;
            while (true) {
                linkedHashMap = this.f78847q;
                if (i12 >= length) {
                    break;
                }
                c30.c cVar = this.f78837e;
                if (z11) {
                    iH = i11 + 1;
                    int length2 = cVar.f19532b + ((int[]) cVar.f19533c).length;
                    while (true) {
                        if (iH >= length2) {
                            iH = cVar.f19532b + ((int[]) cVar.f19533c).length;
                            break;
                        } else if (cVar.b(iH, i12)) {
                            break;
                        } else {
                            iH++;
                        }
                    }
                } else {
                    iH = cVar.h(i11, i12);
                }
                int i13 = iH;
                if (i13 < 0 || i13 >= pVar.f78786l || linkedHashSet.contains(Integer.valueOf(i13))) {
                    break;
                }
                linkedHashSet.add(Integer.valueOf(i13));
                if (!linkedHashMap.containsKey(Integer.valueOf(i13))) {
                    boolean zQ = pVar.f78784j.q(i13);
                    int i14 = zQ ? 0 : i12;
                    int i15 = zQ ? length : 1;
                    if (i15 == 1) {
                        i5 = iArr[i14];
                    } else {
                        int[] iArr2 = (int[]) eVar.f95130a;
                        int i16 = iArr2[i14];
                        int i17 = (i14 + i15) - 1;
                        i5 = (iArr2[i17] + iArr[i17]) - i16;
                    }
                    if (pVar.f78793u == d1.f56493a) {
                        if (i5 < 0) {
                            y3.j.a("width must be >= 0");
                        }
                        jH = y3.b.h(i5, i5, 0, LayoutNode.NotPlacedPlaceOrder);
                    } else {
                        if (i5 < 0) {
                            y3.j.a("height must be >= 0");
                        }
                        jH = y3.b.h(0, LayoutNode.NotPlacedPlaceOrder, i5, i5);
                    }
                    linkedHashMap.put(Integer.valueOf(i13), this.f78845m.a(i13, jH, true, null));
                }
                i12++;
                i11 = i13;
            }
            Iterator it = linkedHashMap.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                if (!linkedHashSet.contains(entry.getKey())) {
                    ((m0) entry.getValue()).cancel();
                    it.remove();
                }
            }
        }
    }
}
