package e0;

import android.view.KeyEvent;
import androidx.compose.ui.node.DelegatingNode;
import b3.l2;
import b3.p2;
import b3.u2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.reflect.KProperty;
import t70.g2;

/* loaded from: classes.dex */
public abstract class g extends DelegatingNode implements l2, t2.d, p2, u2, b3.m, b3.z1 {

    /* renamed from: t, reason: collision with root package name */
    public static final a f49979t = new a();

    /* renamed from: a, reason: collision with root package name */
    public i0.i f49980a;

    /* renamed from: b, reason: collision with root package name */
    public b1 f49981b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f49982c;

    /* renamed from: d, reason: collision with root package name */
    public String f49983d;

    /* renamed from: e, reason: collision with root package name */
    public j3.h f49984e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f49985f;

    /* renamed from: g, reason: collision with root package name */
    public Function0 f49986g;

    /* renamed from: h, reason: collision with root package name */
    public final l0 f49987h;

    /* renamed from: i, reason: collision with root package name */
    public b1 f49988i;

    /* renamed from: j, reason: collision with root package name */
    public v2.l0 f49989j;

    /* renamed from: k, reason: collision with root package name */
    public b3.n f49990k;

    /* renamed from: l, reason: collision with root package name */
    public i0.k f49991l;

    /* renamed from: m, reason: collision with root package name */
    public i0.f f49992m;
    public final z.f0 n = z.s.a();
    public long o = 0;

    /* renamed from: p, reason: collision with root package name */
    public i0.i f49993p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f49994q;

    /* renamed from: r, reason: collision with root package name */
    public g2 f49995r;

    /* renamed from: s, reason: collision with root package name */
    public final a f49996s;

    public g(i0.i iVar, b1 b1Var, boolean z11, boolean z12, String str, j3.h hVar, Function0 function0) {
        this.f49980a = iVar;
        this.f49981b = b1Var;
        this.f49982c = z11;
        this.f49983d = str;
        this.f49984e = hVar;
        this.f49985f = z12;
        this.f49986g = function0;
        this.f49987h = new l0(iVar, 0, new bu.m(this));
        i0.i iVar2 = this.f49980a;
        this.f49993p = iVar2;
        this.f49994q = iVar2 == null;
        this.f49996s = f49979t;
    }

    public void B(j3.b0 b0Var) {
    }

    public abstract v2.l0 D();

    public final boolean E() {
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        t2.c.Q(this, g0.o1.f56643c, new w(booleanRef, 0));
        return booleanRef.f71859a || z.a(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0065  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void F() {
        i0.i iVar = this.f49980a;
        z.f0 f0Var = this.n;
        if (iVar != null) {
            i0.k kVar = this.f49991l;
            if (kVar != null) {
                iVar.b(new i0.j(kVar));
            }
            i0.f fVar = this.f49992m;
            if (fVar != null) {
                iVar.b(new i0.g(fVar));
            }
            Object[] objArr = f0Var.f97824c;
            long[] jArr = f0Var.f97822a;
            int length = jArr.length - 2;
            if (length >= 0) {
                int i5 = 0;
                while (true) {
                    long j11 = jArr[i5];
                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i11 = 8 - ((~(i5 - length)) >>> 31);
                        for (int i12 = 0; i12 < i11; i12++) {
                            if ((255 & j11) < 128) {
                                iVar.b(new i0.j((i0.k) objArr[(i5 << 3) + i12]));
                            }
                            j11 >>= 8;
                        }
                        if (i11 != 8) {
                            break;
                        } else if (i5 == length) {
                            break;
                        } else {
                            i5++;
                        }
                    }
                }
            }
        }
        this.f49991l = null;
        this.f49992m = null;
        f0Var.c();
    }

    public final void H() {
        i0.i iVar = this.f49980a;
        if (iVar != null) {
            g2 g2Var = this.f49995r;
            if (g2Var == null || !g2Var.b()) {
                i0.k kVar = this.f49991l;
                if (kVar != null) {
                    t70.m0.t(getCoroutineScope(), null, null, new d(kVar, iVar, null, 0), 3);
                }
            } else {
                g2 g2Var2 = this.f49995r;
                if (g2Var2 != null) {
                    g2Var2.c(null);
                }
            }
            this.f49991l = null;
        }
    }

    public final void I() {
        if (this.f49990k != null) {
            return;
        }
        b1 b1Var = this.f49982c ? this.f49988i : this.f49981b;
        if (b1Var != null) {
            if (this.f49980a == null) {
                this.f49980a = new i0.i();
            }
            this.f49987h.E(this.f49980a);
            i0.i iVar = this.f49980a;
            Intrinsics.d(iVar);
            b3.n nVarA = b1Var.a(iVar);
            delegate(nVarA);
            this.f49990k = nVarA;
        }
    }

    public void M() {
    }

    public abstract boolean N(KeyEvent keyEvent);

    public abstract void O(KeyEvent keyEvent);

    /* JADX WARN: Removed duplicated region for block: B:39:0x0081  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void P(i0.i iVar, b1 b1Var, boolean z11, boolean z12, String str, j3.h hVar, Function0 function0) {
        boolean z13;
        b3.n nVar;
        boolean z14 = true;
        if (Intrinsics.b(this.f49993p, iVar)) {
            z13 = false;
        } else {
            F();
            this.f49993p = iVar;
            this.f49980a = iVar;
            z13 = true;
        }
        if (!Intrinsics.b(this.f49981b, b1Var)) {
            this.f49981b = b1Var;
            z13 = true;
        }
        if (this.f49982c != z11) {
            this.f49982c = z11;
            if (z11) {
                k();
            }
            z13 = true;
        }
        boolean z15 = this.f49985f;
        l0 l0Var = this.f49987h;
        if (z15 != z12) {
            if (z12) {
                delegate(l0Var);
            } else {
                undelegate(l0Var);
                F();
            }
            b3.o.f(this).invalidateSemantics$ui_release();
            this.f49985f = z12;
        }
        if (!Intrinsics.b(this.f49983d, str)) {
            this.f49983d = str;
            b3.o.f(this).invalidateSemantics$ui_release();
        }
        if (!Intrinsics.b(this.f49984e, hVar)) {
            this.f49984e = hVar;
            b3.o.f(this).invalidateSemantics$ui_release();
        }
        this.f49986g = function0;
        boolean z16 = this.f49994q;
        i0.i iVar2 = this.f49993p;
        if (z16 == (iVar2 == null)) {
            z14 = z13;
        } else {
            boolean z17 = iVar2 == null;
            this.f49994q = z17;
            if (z17 || this.f49990k != null) {
            }
        }
        if (z14 && ((nVar = this.f49990k) != null || !this.f49994q)) {
            if (nVar != null) {
                undelegate(nVar);
            }
            this.f49990k = null;
            I();
        }
        l0Var.E(this.f49980a);
    }

    @Override // b3.u2
    public final Object a() {
        return this.f49996s;
    }

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
        j3.h hVar = this.f49984e;
        if (hVar != null) {
            j3.y.j(b0Var, hVar.f68785a);
        }
        String str = this.f49983d;
        a7.f fVar = new a7.f(this, 11);
        KProperty[] kPropertyArr = j3.y.f68878a;
        ((j3.k) b0Var).f(j3.j.f68789b, new j3.a(str, fVar));
        if (this.f49985f) {
            this.f49987h.applySemantics(b0Var);
        } else {
            j3.y.a(b0Var);
        }
        B(b0Var);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.p2
    public final boolean getShouldMergeDescendantSemantics() {
        return true;
    }

    @Override // b3.z1
    public final void k() {
        if (this.f49982c) {
            b3.g.f(this, new d00.t(this, 7));
        }
    }

    @Override // t2.d
    public final boolean n(KeyEvent keyEvent) {
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0081 A[RETURN] */
    @Override // t2.d
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean o(KeyEvent keyEvent) {
        boolean z11;
        I();
        long jV = t2.c.v(keyEvent);
        boolean z12 = this.f49985f;
        z.f0 f0Var = this.n;
        if (!z12 || !p3.i.t(t2.c.x(keyEvent), 2) || !androidx.compose.foundation.c.g(keyEvent)) {
            if (this.f49985f && p3.i.t(t2.c.x(keyEvent), 1) && androidx.compose.foundation.c.g(keyEvent)) {
                i0.k kVar = (i0.k) f0Var.f(jV);
                if (kVar != null) {
                    if (this.f49980a != null) {
                        t70.m0.t(getCoroutineScope(), null, null, new e(this, kVar, null, 2), 3);
                    }
                    O(keyEvent);
                }
                if (kVar != null) {
                    return true;
                }
            }
            return false;
        }
        if (f0Var.a(jV)) {
            z11 = false;
        } else {
            i0.k kVar2 = new i0.k(this.o);
            f0Var.g(jV, kVar2);
            if (this.f49980a != null) {
                t70.m0.t(getCoroutineScope(), null, null, new e(this, kVar2, null, 1), 3);
            }
            z11 = true;
        }
        if (!N(keyEvent) && !z11) {
            return false;
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        k();
        if (!this.f49994q) {
            I();
        }
        if (this.f49985f) {
            delegate(this.f49987h);
        }
    }

    @Override // b3.l2
    public void onCancelPointerInput() {
        i0.f fVar;
        i0.i iVar = this.f49980a;
        if (iVar != null && (fVar = this.f49992m) != null) {
            iVar.b(new i0.g(fVar));
        }
        this.f49992m = null;
        v2.l0 l0Var = this.f49989j;
        if (l0Var != null) {
            l0Var.onCancelPointerInput();
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        F();
        if (this.f49993p == null) {
            this.f49980a = null;
        }
        b3.n nVar = this.f49990k;
        if (nVar != null) {
            undelegate(nVar);
        }
        this.f49990k = null;
    }

    @Override // b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11) {
        v2.l0 l0VarD;
        long j12 = ((j11 >> 33) << 32) | (((j11 << 32) >> 33) & 4294967295L);
        this.o = (Float.floatToRawIntBits((int) (j12 >> 32)) << 32) | (Float.floatToRawIntBits((int) (j12 & 4294967295L)) & 4294967295L);
        I();
        if (this.f49985f && nVar == v2.n.f91981b) {
            int i5 = mVar.f91979e;
            Continuation continuation = null;
            if (i5 == 4) {
                t70.m0.t(getCoroutineScope(), null, null, new f(this, continuation, 0), 3);
            } else if (i5 == 5) {
                t70.m0.t(getCoroutineScope(), null, null, new f(this, continuation, 1), 3);
            }
        }
        if (this.f49989j == null && (l0VarD = D()) != null) {
            this.f49989j = (v2.l0) delegate(l0VarD);
        }
        v2.l0 l0Var = this.f49989j;
        if (l0Var != null) {
            l0Var.mo26onPointerEventH0pRuoY(mVar, nVar, j11);
        }
    }
}
