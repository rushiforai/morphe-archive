package z2;

import android.view.ViewGroup;
import androidx.compose.ui.node.LayoutNode;
import b.u4;
import c3.f4;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;

/* loaded from: classes.dex */
public final class n0 implements p1.k {

    /* renamed from: a, reason: collision with root package name */
    public final LayoutNode f98107a;

    /* renamed from: b, reason: collision with root package name */
    public p1.w f98108b;

    /* renamed from: c, reason: collision with root package name */
    public y1 f98109c;

    /* renamed from: d, reason: collision with root package name */
    public int f98110d;

    /* renamed from: e, reason: collision with root package name */
    public int f98111e;

    /* renamed from: f, reason: collision with root package name */
    public final z.o0 f98112f;

    /* renamed from: g, reason: collision with root package name */
    public final z.o0 f98113g;

    /* renamed from: h, reason: collision with root package name */
    public final h0 f98114h;

    /* renamed from: i, reason: collision with root package name */
    public final e0 f98115i;

    /* renamed from: j, reason: collision with root package name */
    public final z.o0 f98116j;

    /* renamed from: k, reason: collision with root package name */
    public final x1 f98117k;

    /* renamed from: l, reason: collision with root package name */
    public final z.o0 f98118l;

    /* renamed from: m, reason: collision with root package name */
    public final r1.e f98119m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public final String f98120p;

    public n0(LayoutNode layoutNode, y1 y1Var) {
        this.f98107a = layoutNode;
        this.f98109c = y1Var;
        long[] jArr = z.z0.f97875a;
        this.f98112f = new z.o0();
        this.f98113g = new z.o0();
        this.f98114h = new h0(this);
        this.f98115i = new e0(this);
        this.f98116j = new z.o0();
        this.f98117k = new x1();
        this.f98118l = new z.o0();
        this.f98119m = new r1.e(new Object[16]);
        this.f98120p = "Asking for intrinsic measurements of SubcomposeLayout layouts is not supported. This includes components that are built on top of SubcomposeLayout, such as lazy lists, BoxWithConstraints, TabRow, etc. To mitigate this:\n- if intrinsic measurements are used to achieve 'match parent' sizing, consider replacing the parent of the component with a custom layout which controls the order in which children are measured, making intrinsic measurement not needed\n- adding a size modifier to the component, in order to fast return the queried intrinsic measurement.";
    }

    public static void a(f0 f0Var) {
        mk.o oVar = f0Var.f98056f;
        if (oVar != null) {
            oVar.c();
            f0Var.f98056f = null;
            p1.d2 d2Var = f0Var.f98053c;
            if (d2Var != null) {
                ((p1.z) d2Var).dispose();
            }
            f0Var.f98053c = null;
        }
    }

    public final void b(int i5) {
        boolean z11;
        boolean z12 = false;
        this.n = 0;
        List<LayoutNode> foldedChildren$ui_release = this.f98107a.getFoldedChildren$ui_release();
        int size = (foldedChildren$ui_release.size() - this.o) - 1;
        if (i5 <= size) {
            this.f98117k.clear();
            if (i5 <= size) {
                int i11 = i5;
                while (true) {
                    Object objD = this.f98112f.d(foldedChildren$ui_release.get(i11));
                    Intrinsics.d(objD);
                    this.f98117k.f98177a.b(((f0) objD).f98051a);
                    if (i11 == size) {
                        break;
                    } else {
                        i11++;
                    }
                }
            }
            this.f98109c.c(this.f98117k);
            z1.f fVarL = o2.f.l();
            Function1 function1E = fVarL != null ? fVarL.e() : null;
            z1.f fVarQ = o2.f.q(fVarL);
            z11 = false;
            while (size >= i5) {
                try {
                    LayoutNode layoutNode = foldedChildren$ui_release.get(size);
                    Object objD2 = this.f98112f.d(layoutNode);
                    Intrinsics.d(objD2);
                    f0 f0Var = (f0) objD2;
                    Object obj = f0Var.f98051a;
                    if (this.f98117k.f98177a.a(obj)) {
                        this.n++;
                        if (((Boolean) ((s2) f0Var.f98057g).getValue()).booleanValue()) {
                            layoutNode.getMeasurePassDelegate$ui_release().f17245l = b3.n0.f17298c;
                            b3.e1 lookaheadPassDelegate$ui_release = layoutNode.getLookaheadPassDelegate$ui_release();
                            if (lookaheadPassDelegate$ui_release != null) {
                                lookaheadPassDelegate$ui_release.q0();
                            }
                            f(f0Var, false);
                            if (f0Var.f98058h) {
                                z11 = true;
                            }
                        }
                    } else {
                        LayoutNode layoutNode2 = this.f98107a;
                        layoutNode2.ignoreRemeasureRequests = true;
                        this.f98112f.k(layoutNode);
                        p1.d2 d2Var = f0Var.f98053c;
                        if (d2Var != null) {
                            ((p1.z) d2Var).dispose();
                        }
                        this.f98107a.removeAt$ui_release(size, 1);
                        Unit unit = Unit.f71706a;
                        layoutNode2.ignoreRemeasureRequests = false;
                    }
                    this.f98113g.k(obj);
                    size--;
                } catch (Throwable th2) {
                    o2.f.w(fVarL, fVarQ, function1E);
                    throw th2;
                }
            }
            Unit unit2 = Unit.f71706a;
            o2.f.w(fVarL, fVarQ, function1E);
        } else {
            z11 = false;
        }
        if (z11) {
            synchronized (z1.k.f97943c) {
                z.p0 p0Var = z1.k.f97950j.f97895h;
                if (p0Var != null) {
                    if (p0Var.c()) {
                        z12 = true;
                    }
                }
            }
            if (z12) {
                z1.k.a();
            }
        }
        c();
    }

    public final void c() {
        int size = this.f98107a.getFoldedChildren$ui_release().size();
        z.o0 o0Var = this.f98112f;
        if (!(o0Var.f97870e == size)) {
            y2.a.a("Inconsistency between the count of nodes tracked by the state (" + o0Var.f97870e + ") and the children count on the SubcomposeLayout (" + size + "). Are you trying to use the state of the disposed SubcomposeLayout?");
        }
        if (!((size - this.n) - this.o >= 0)) {
            StringBuilder sbJ = u4.j(size, "Incorrect state. Total children ", ". Reusable children ");
            sbJ.append(this.n);
            sbJ.append(". Precomposed children ");
            sbJ.append(this.o);
            y2.a.a(sbJ.toString());
        }
        z.o0 o0Var2 = this.f98116j;
        if (o0Var2.f97870e == this.o) {
            return;
        }
        y2.a.a("Incorrect state. Precomposed children " + this.o + ". Map size " + o0Var2.f97870e);
    }

    public final void d(boolean z11) {
        this.o = 0;
        this.f98116j.g();
        List<LayoutNode> foldedChildren$ui_release = this.f98107a.getFoldedChildren$ui_release();
        int size = foldedChildren$ui_release.size();
        if (this.n != size) {
            this.n = size;
            z1.f fVarL = o2.f.l();
            Function1 function1E = fVarL != null ? fVarL.e() : null;
            z1.f fVarQ = o2.f.q(fVarL);
            for (int i5 = 0; i5 < size; i5++) {
                try {
                    LayoutNode layoutNode = foldedChildren$ui_release.get(i5);
                    f0 f0Var = (f0) this.f98112f.d(layoutNode);
                    if (f0Var != null && ((Boolean) ((s2) f0Var.f98057g).getValue()).booleanValue()) {
                        layoutNode.getMeasurePassDelegate$ui_release().f17245l = b3.n0.f17298c;
                        b3.e1 lookaheadPassDelegate$ui_release = layoutNode.getLookaheadPassDelegate$ui_release();
                        if (lookaheadPassDelegate$ui_release != null) {
                            lookaheadPassDelegate$ui_release.q0();
                        }
                        f(f0Var, z11);
                        f0Var.f98051a = r1.f98148a;
                    }
                } catch (Throwable th2) {
                    o2.f.w(fVarL, fVarQ, function1E);
                    throw th2;
                }
            }
            Unit unit = Unit.f71706a;
            o2.f.w(fVarL, fVarQ, function1E);
            this.f98113g.g();
        }
        c();
    }

    public final void e(int i5, int i11) {
        LayoutNode layoutNode = this.f98107a;
        layoutNode.ignoreRemeasureRequests = true;
        layoutNode.move$ui_release(i5, i11, 1);
        Unit unit = Unit.f71706a;
        layoutNode.ignoreRemeasureRequests = false;
    }

    public final void f(f0 f0Var, boolean z11) {
        p1.d2 d2Var;
        if (z11 || !f0Var.f98058h) {
            f0Var.f98057g = androidx.compose.runtime.d.k(Boolean.FALSE);
        } else {
            ((s2) f0Var.f98057g).setValue(Boolean.FALSE);
        }
        if (f0Var.f98056f != null) {
            a(f0Var);
            return;
        }
        if (z11) {
            p1.d2 d2Var2 = f0Var.f98053c;
            if (d2Var2 != null) {
                ((p1.z) d2Var2).o();
                return;
            }
            return;
        }
        b3.c2 outOfFrameExecutor = b3.s0.a(this.f98107a).getOutOfFrameExecutor();
        if (outOfFrameExecutor != null) {
            outOfFrameExecutor.schedule(new c3.c1(f0Var, 25));
        } else {
            if (f0Var.f98058h || (d2Var = f0Var.f98053c) == null) {
                return;
            }
            ((p1.z) d2Var).o();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x00ce  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void g(LayoutNode layoutNode, Object obj, boolean z11, Function2 function2) {
        boolean z12;
        z.o0 o0Var = this.f98112f;
        Object objD = o0Var.d(layoutNode);
        Object obj2 = objD;
        if (objD == null) {
            x1.e eVar = j.f98086a;
            f0 f0Var = new f0();
            f0Var.f98051a = obj;
            f0Var.f98052b = eVar;
            f0Var.f98053c = null;
            f0Var.f98057g = androidx.compose.runtime.d.k(Boolean.TRUE);
            o0Var.m(layoutNode, f0Var);
            obj2 = f0Var;
        }
        f0 f0Var2 = (f0) obj2;
        boolean z13 = f0Var2.f98052b != function2;
        if (f0Var2.f98056f != null) {
            if (z13) {
                a(f0Var2);
            } else {
                if (z11) {
                    return;
                }
                mk.o oVar = f0Var2.f98056f;
                if (oVar != null) {
                    z1.f fVarL = o2.f.l();
                    Function1 function1E = fVarL != null ? fVarL.e() : null;
                    z1.f fVarQ = o2.f.q(fVarL);
                    try {
                        LayoutNode layoutNode2 = this.f98107a;
                        layoutNode2.ignoreRemeasureRequests = true;
                        while (!oVar.f()) {
                            oVar.j(new rl.g(17));
                        }
                        oVar.a();
                        f0Var2.f98056f = null;
                        Unit unit = Unit.f71706a;
                        layoutNode2.ignoreRemeasureRequests = false;
                        o2.f.w(fVarL, fVarQ, function1E);
                    } finally {
                    }
                }
            }
        }
        p1.d2 d2Var = f0Var2.f98053c;
        if (d2Var != null) {
            p1.z zVar = (p1.z) d2Var;
            synchronized (zVar.f81671d) {
                z12 = zVar.n.f97870e > 0;
            }
        } else {
            z12 = true;
        }
        if (z13 || z12 || f0Var2.f98054d) {
            f0Var2.f98052b = function2;
            if (f0Var2.f98056f != null) {
                y2.a.a("new subcompose call while paused composition is still active");
            }
            z1.f fVarL2 = o2.f.l();
            Function1 function1E2 = fVarL2 != null ? fVarL2.e() : null;
            z1.f fVarQ2 = o2.f.q(fVarL2);
            try {
                LayoutNode layoutNode3 = this.f98107a;
                layoutNode3.ignoreRemeasureRequests = true;
                p1.d2 zVar2 = f0Var2.f98053c;
                p1.w wVar = this.f98108b;
                if (wVar == null) {
                    y2.a.c("parent composition reference not set");
                    throw new KotlinNothingValueException();
                }
                if (zVar2 != null) {
                    if (((p1.z) zVar2).f81688w == 3) {
                    }
                } else if (z11) {
                    ViewGroup.LayoutParams layoutParams = f4.f19280a;
                    zVar2 = t2.c.g(new i50.c(layoutNode), wVar);
                } else {
                    ViewGroup.LayoutParams layoutParams2 = f4.f19280a;
                    zVar2 = new p1.z(new i50.c(layoutNode), wVar);
                }
                f0Var2.f98053c = zVar2;
                Function2 eVar2 = f0Var2.f98052b;
                if (b3.s0.a(this.f98107a).getOutOfFrameExecutor() != null) {
                    f0Var2.f98058h = false;
                } else {
                    f0Var2.f98058h = true;
                    eVar2 = new x1.e(new c4.n(9, f0Var2, eVar2), true, 1524156494);
                }
                if (z11) {
                    if (f0Var2.f98055e) {
                        p1.z zVar3 = (p1.z) ((p1.i1) zVar2);
                        zVar3.l();
                        zVar3.s();
                        f0Var2.f98056f = zVar3.n(true, eVar2);
                    } else {
                        p1.z zVar4 = (p1.z) ((p1.i1) zVar2);
                        f0Var2.f98056f = zVar4.n(zVar4.l(), eVar2);
                    }
                } else if (f0Var2.f98055e) {
                    p1.z zVar5 = (p1.z) zVar2;
                    zVar5.l();
                    zVar5.s();
                    p1.t tVar = zVar5.f81687v;
                    tVar.f81576z = 100;
                    tVar.f81575y = true;
                    zVar5.f81689x = eVar2;
                    zVar5.f81668a.a(zVar5, eVar2);
                    tVar.v();
                } else {
                    ((p1.z) zVar2).B(eVar2);
                }
                f0Var2.f98055e = false;
                Unit unit2 = Unit.f71706a;
                layoutNode3.ignoreRemeasureRequests = false;
                o2.f.w(fVarL2, fVarQ2, function1E2);
                f0Var2.f98054d = false;
            } finally {
            }
        }
    }

    public final LayoutNode h(Object obj) {
        z.o0 o0Var;
        int i5;
        if (this.n == 0) {
            return null;
        }
        List<LayoutNode> foldedChildren$ui_release = this.f98107a.getFoldedChildren$ui_release();
        int size = foldedChildren$ui_release.size() - this.o;
        int i11 = size - this.n;
        int i12 = size - 1;
        int i13 = i12;
        while (true) {
            o0Var = this.f98112f;
            if (i13 < i11) {
                i5 = -1;
                break;
            }
            Object objD = o0Var.d(foldedChildren$ui_release.get(i13));
            Intrinsics.d(objD);
            if (Intrinsics.b(((f0) objD).f98051a, obj)) {
                i5 = i13;
                break;
            }
            i13--;
        }
        if (i5 == -1) {
            while (i12 >= i11) {
                Object objD2 = o0Var.d(foldedChildren$ui_release.get(i12));
                Intrinsics.d(objD2);
                f0 f0Var = (f0) objD2;
                Object obj2 = f0Var.f98051a;
                if (obj2 == r1.f98148a || this.f98109c.e(obj, obj2)) {
                    f0Var.f98051a = obj;
                    i13 = i12;
                    i5 = i13;
                    break;
                }
                i12--;
            }
            i13 = i12;
        }
        if (i5 == -1) {
            return null;
        }
        if (i13 != i11) {
            e(i13, i11);
        }
        this.n--;
        LayoutNode layoutNode = foldedChildren$ui_release.get(i11);
        Object objD3 = o0Var.d(layoutNode);
        Intrinsics.d(objD3);
        f0 f0Var2 = (f0) objD3;
        f0Var2.f98057g = androidx.compose.runtime.d.k(Boolean.TRUE);
        f0Var2.f98055e = true;
        f0Var2.f98054d = true;
        return layoutNode;
    }

    @Override // p1.k
    public final void onDeactivate() {
        d(true);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0050  */
    @Override // p1.k
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onRelease() {
        p1.d2 d2Var;
        LayoutNode layoutNode = this.f98107a;
        layoutNode.ignoreRemeasureRequests = true;
        z.o0 o0Var = this.f98112f;
        Object[] objArr = o0Var.f97868c;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i5 = 0;
            while (true) {
                long j11 = jArr[i5];
                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i11 = 8 - ((~(i5 - length)) >>> 31);
                    for (int i12 = 0; i12 < i11; i12++) {
                        if ((255 & j11) < 128 && (d2Var = ((f0) objArr[(i5 << 3) + i12]).f98053c) != null) {
                            ((p1.z) d2Var).dispose();
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
        layoutNode.removeAll$ui_release();
        Unit unit = Unit.f71706a;
        layoutNode.ignoreRemeasureRequests = false;
        o0Var.g();
        this.f98113g.g();
        this.o = 0;
        this.n = 0;
        this.f98116j.g();
        c();
    }
}
