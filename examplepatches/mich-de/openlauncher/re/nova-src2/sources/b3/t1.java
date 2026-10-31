package b3;

import android.os.Build;
import android.view.ViewParent;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import androidx.compose.ui.platform.AndroidComposeView;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

/* loaded from: classes.dex */
public abstract class t1 extends y0 implements z2.q0, z2.y, g2 {
    public static final i2.s0 K = new i2.s0();
    public static final b0 L = new b0();
    public static final float[] M = i2.h0.a();
    public static final e N = new e(1);
    public static final e O = new e(2);
    public float A;
    public h2.a B;
    public b0 C;
    public l2.b D;
    public Canvas E;
    public p1 F;
    public boolean H;
    public c3.j2 I;
    public l2.b J;
    public final LayoutNode o;

    /* renamed from: p, reason: collision with root package name */
    public t1 f17359p;

    /* renamed from: q, reason: collision with root package name */
    public t1 f17360q;

    /* renamed from: r, reason: collision with root package name */
    public boolean f17361r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f17362s;

    /* renamed from: t, reason: collision with root package name */
    public Function1 f17363t;

    /* renamed from: u, reason: collision with root package name */
    public y3.c f17364u;

    /* renamed from: v, reason: collision with root package name */
    public y3.n f17365v;

    /* renamed from: x, reason: collision with root package name */
    public z2.s0 f17367x;

    /* renamed from: y, reason: collision with root package name */
    public z.h0 f17368y;

    /* renamed from: w, reason: collision with root package name */
    public float f17366w = 0.8f;

    /* renamed from: z, reason: collision with root package name */
    public long f17369z = 0;
    public final q1 G = new q1(this, 1);

    public t1(LayoutNode layoutNode) {
        this.o = layoutNode;
        this.f17364u = layoutNode.getDensity();
        this.f17365v = layoutNode.getLayoutDirection();
    }

    public static t1 Q0(z2.y yVar) {
        t1 t1VarA;
        z2.p0 p0Var = yVar instanceof z2.p0 ? (z2.p0) yVar : null;
        if (p0Var != null && (t1VarA = p0Var.a()) != null) {
            return t1VarA;
        }
        Intrinsics.e(yVar, "null cannot be cast to non-null type androidx.compose.ui.node.NodeCoordinator");
        return (t1) yVar;
    }

    public final void A0(Modifier$Node modifier$Node, e eVar, long j11, u uVar, int i5, boolean z11, float f11) {
        if (modifier$Node == null) {
            C0(eVar, j11, uVar, i5, z11);
            return;
        }
        int i11 = uVar.f17376c;
        z.j0 j0Var = uVar.f17374a;
        uVar.d(i11 + 1, j0Var.f97841b);
        uVar.f17376c++;
        j0Var.g(modifier$Node);
        uVar.f17375b.a(ic.b.k(f11, z11, false));
        K0(g.b(modifier$Node, eVar.a()), eVar, j11, uVar, i5, z11, f11, true);
        uVar.f17376c = i11;
    }

    public final void B0(e eVar, long j11, u uVar, int i5, boolean z11) {
        boolean z12;
        boolean z13;
        Modifier$Node modifier$NodeX0 = x0(eVar.a());
        if (!X0(j11)) {
            if (v2.g0.f(i5, 1)) {
                float fO0 = o0(j11, v0());
                if ((Float.floatToRawIntBits(fO0) & LayoutNode.NotPlacedPlaceOrder) < 2139095040) {
                    if (uVar.f17376c != ul.b.K(uVar)) {
                        if (i30.j.n(uVar.c(), ic.b.k(fO0, false, false)) <= 0) {
                            return;
                        }
                    }
                    A0(modifier$NodeX0, eVar, j11, uVar, i5, false, fO0);
                    return;
                }
                return;
            }
            return;
        }
        if (modifier$NodeX0 == null) {
            C0(eVar, j11, uVar, i5, z11);
            return;
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
        if (fIntBitsToFloat >= 0.0f && fIntBitsToFloat2 >= 0.0f && fIntBitsToFloat < Q() && fIntBitsToFloat2 < P()) {
            z0(modifier$NodeX0, eVar, j11, uVar, i5, z11);
            return;
        }
        float fO02 = !v2.g0.f(i5, 1) ? Float.POSITIVE_INFINITY : o0(j11, v0());
        if ((Float.floatToRawIntBits(fO02) & LayoutNode.NotPlacedPlaceOrder) < 2139095040) {
            if (uVar.f17376c != ul.b.K(uVar)) {
                z12 = z11;
                if (i30.j.n(uVar.c(), ic.b.k(fO02, z12, false)) > 0) {
                }
                K0(modifier$NodeX0, eVar, j11, uVar, i5, z12, fO02, z13);
            }
            z12 = z11;
            z13 = true;
            K0(modifier$NodeX0, eVar, j11, uVar, i5, z12, fO02, z13);
        }
        z12 = z11;
        z13 = false;
        K0(modifier$NodeX0, eVar, j11, uVar, i5, z12, fO02, z13);
    }

    public void C0(e eVar, long j11, u uVar, int i5, boolean z11) {
        t1 t1Var = this.f17359p;
        if (t1Var != null) {
            t1Var.B0(eVar, t1Var.t0(j11), uVar, i5, z11);
        }
    }

    @Override // z2.y
    public final void D(float[] fArr) {
        Owner ownerA = s0.a(this.o);
        t1 t1VarQ0 = Q0(z2.r1.f(this));
        U0(t1VarQ0, fArr);
        if (ownerA instanceof v2.i) {
            ((v2.i) ownerA).mo63localToScreen58bKbWc(fArr);
            return;
        }
        long jMo107localToScreenMKHz9U = t1VarQ0.mo107localToScreenMKHz9U(0L);
        if ((9223372034707292159L & jMo107localToScreenMKHz9U) != 9205357640488583168L) {
            i2.h0.f(fArr, Float.intBitsToFloat((int) (jMo107localToScreenMKHz9U >> 32)), Float.intBitsToFloat((int) (jMo107localToScreenMKHz9U & 4294967295L)));
        }
    }

    public final void D0() {
        c3.j2 j2Var = this.I;
        if (j2Var == null) {
            t1 t1Var = this.f17360q;
            if (t1Var != null) {
                t1Var.D0();
                return;
            }
            return;
        }
        AndroidComposeView androidComposeView = j2Var.f19352c;
        if (j2Var.f19359j || j2Var.f19356g) {
            return;
        }
        androidComposeView.invalidate();
        if (true != j2Var.f19359j) {
            j2Var.f19359j = true;
            androidComposeView.notifyLayerIsDirty$ui_release(j2Var, true);
        }
    }

    public final boolean E0() {
        if (this.I != null && this.f17366w <= 0.0f) {
            return true;
        }
        t1 t1Var = this.f17360q;
        if (t1Var != null) {
            return t1Var.E0();
        }
        return false;
    }

    public final long F0(z2.y yVar, long j11) {
        if (yVar instanceof z2.p0) {
            z2.p0 p0Var = (z2.p0) yVar;
            p0Var.a().G0();
            return p0Var.c(this, j11 ^ (-9223372034707292160L)) ^ (-9223372034707292160L);
        }
        t1 t1VarQ0 = Q0(yVar);
        t1VarQ0.G0();
        t1 t1VarS0 = s0(t1VarQ0);
        while (t1VarQ0 != t1VarS0) {
            j11 = t1VarQ0.R0(j11);
            t1VarQ0 = t1VarQ0.f17360q;
            Intrinsics.d(t1VarQ0);
        }
        return m0(t1VarS0, j11);
    }

    public final void G0() {
        this.o.getLayoutDelegate().b();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v15 */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v5, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r7v7, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public final void H0() {
        Modifier$Node parent;
        boolean zH = u1.h(128);
        Modifier$Node modifier$NodeY0 = y0(zH);
        if (modifier$NodeY0 == null || (modifier$NodeY0.getNode().getAggregateChildKindSet() & 128) == 0) {
            return;
        }
        z1.f fVarL = o2.f.l();
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            if (!zH) {
                parent = w0().getParent();
                if (parent == null) {
                }
                Unit unit = Unit.f71706a;
                o2.f.w(fVarL, fVarQ, function1E);
            }
            parent = w0();
            for (Modifier$Node modifier$NodeY02 = y0(zH); modifier$NodeY02 != null && (modifier$NodeY02.getAggregateChildKindSet() & 128) != 0; modifier$NodeY02 = modifier$NodeY02.getChild()) {
                if ((modifier$NodeY02.getKindSet() & 128) != 0) {
                    DelegatingNode delegatingNodeB = modifier$NodeY02;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof c0) {
                            ((c0) delegatingNodeB).mo27onRemeasuredozmzZPI(this.f98083c);
                        } else if ((delegatingNodeB.getKindSet() & 128) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & 128) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new r1.e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar);
                    }
                }
                if (modifier$NodeY02 == parent) {
                    break;
                }
            }
            Unit unit2 = Unit.f71706a;
            o2.f.w(fVarL, fVarQ, function1E);
        } catch (Throwable th2) {
            o2.f.w(fVarL, fVarQ, function1E);
            throw th2;
        }
    }

    @Override // z2.y
    public final z2.y I() {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        G0();
        return this.o.getOuterCoordinator$ui_release().f17360q;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v3 */
    /* JADX WARN: Type inference failed for: r4v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /* JADX WARN: Type inference failed for: r4v8 */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r5v0 */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v5 */
    /* JADX WARN: Type inference failed for: r5v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r5v9 */
    public final void I0() {
        boolean zH = u1.h(128);
        Modifier$Node modifier$NodeW0 = w0();
        if (!zH && (modifier$NodeW0 = modifier$NodeW0.getParent()) == null) {
            return;
        }
        for (Modifier$Node modifier$NodeY0 = y0(zH); modifier$NodeY0 != null && (modifier$NodeY0.getAggregateChildKindSet() & 128) != 0; modifier$NodeY0 = modifier$NodeY0.getChild()) {
            if ((modifier$NodeY0.getKindSet() & 128) != 0) {
                DelegatingNode delegatingNodeB = modifier$NodeY0;
                ?? eVar = 0;
                while (delegatingNodeB != 0) {
                    if (delegatingNodeB instanceof c0) {
                        ((c0) delegatingNodeB).onPlaced(this);
                    } else if ((delegatingNodeB.getKindSet() & 128) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                        Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                        int i5 = 0;
                        delegatingNodeB = delegatingNodeB;
                        eVar = eVar;
                        while (delegate$ui_release != null) {
                            if ((delegate$ui_release.getKindSet() & 128) != 0) {
                                i5++;
                                eVar = eVar;
                                if (i5 == 1) {
                                    delegatingNodeB = delegate$ui_release;
                                } else {
                                    if (eVar == 0) {
                                        eVar = new r1.e(new Modifier$Node[16]);
                                    }
                                    if (delegatingNodeB != 0) {
                                        eVar.b(delegatingNodeB);
                                        delegatingNodeB = 0;
                                    }
                                    eVar.b(delegate$ui_release);
                                }
                            }
                            delegate$ui_release = delegate$ui_release.getChild();
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                        }
                        if (i5 == 1) {
                        }
                    }
                    delegatingNodeB = o.b(eVar);
                }
            }
            if (modifier$NodeY0 == modifier$NodeW0) {
                return;
            }
        }
    }

    public final void J0() {
        this.f17361r = true;
        this.G.invoke();
        O0();
        if (y3.k.b(this.f17369z, 0L)) {
            return;
        }
        this.o.onCoordinatorPositionChanged$ui_release();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0184 A[PHI: r2
      0x0184: PHI (r2v4 r1.e) = (r2v1 r1.e), (r2v1 r1.e), (r2v6 r1.e) binds: [B:38:0x014a, B:40:0x014e, B:54:0x017e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r1v33 */
    /* JADX WARN: Type inference failed for: r2v10 */
    /* JADX WARN: Type inference failed for: r2v11, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v14 */
    /* JADX WARN: Type inference failed for: r2v15, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v16, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v20 */
    /* JADX WARN: Type inference failed for: r2v29 */
    /* JADX WARN: Type inference failed for: r2v30 */
    /* JADX WARN: Type inference failed for: r4v16 */
    /* JADX WARN: Type inference failed for: r4v17 */
    /* JADX WARN: Type inference failed for: r4v18 */
    /* JADX WARN: Type inference failed for: r4v19, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r4v20 */
    /* JADX WARN: Type inference failed for: r4v21 */
    /* JADX WARN: Type inference failed for: r4v22, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v32 */
    /* JADX WARN: Type inference failed for: r4v33 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void K0(Modifier$Node modifier$Node, e eVar, long j11, u uVar, int i5, boolean z11, float f11, boolean z12) {
        Modifier$Node modifier$NodeB;
        boolean z13;
        int i11;
        if (modifier$Node == null) {
            C0(eVar, j11, uVar, i5, z11);
            return;
        }
        int i12 = i5;
        if (v2.g0.f(i12, 3) || v2.g0.f(i12, 4)) {
            DelegatingNode delegatingNode = modifier$Node;
            r1.e eVar2 = null;
            while (true) {
                if (delegatingNode == 0) {
                    break;
                }
                if (delegatingNode instanceof l2) {
                    long jMo24getTouchBoundsExpansionRZrCHBk = ((l2) delegatingNode).mo24getTouchBoundsExpansionRZrCHBk();
                    int i13 = (int) (j11 >> 32);
                    float fIntBitsToFloat = Float.intBitsToFloat(i13);
                    LayoutNode layoutNode = this.o;
                    if (fIntBitsToFloat >= (-s2.a(jMo24getTouchBoundsExpansionRZrCHBk, layoutNode.getLayoutDirection()))) {
                        if (Float.intBitsToFloat(i13) < s2.b(jMo24getTouchBoundsExpansionRZrCHBk, layoutNode.getLayoutDirection()) + Q()) {
                            int i14 = (int) (j11 & 4294967295L);
                            if (Float.intBitsToFloat(i14) >= (-s2.d(jMo24getTouchBoundsExpansionRZrCHBk))) {
                                if (Float.intBitsToFloat(i14) < s2.c(jMo24getTouchBoundsExpansionRZrCHBk) + P()) {
                                    r1 r1Var = new r1(this, modifier$Node, eVar, j11, uVar, i12, z11, f11, z12);
                                    z.e0 e0Var = uVar.f17375b;
                                    z.j0 j0Var = uVar.f17374a;
                                    if (uVar.f17376c == ul.b.K(uVar)) {
                                        int i15 = uVar.f17376c;
                                        uVar.d(i15 + 1, j0Var.f97841b);
                                        uVar.f17376c++;
                                        j0Var.g(modifier$Node);
                                        e0Var.a(ic.b.k(0.0f, z11, true));
                                        r1Var.invoke();
                                        uVar.f17376c = i15;
                                        return;
                                    }
                                    long jC = uVar.c();
                                    int i16 = uVar.f17376c;
                                    if (!i30.j.J(jC)) {
                                        if (i30.j.E(jC) > 0.0f) {
                                            int i17 = uVar.f17376c;
                                            uVar.d(i17 + 1, j0Var.f97841b);
                                            uVar.f17376c++;
                                            j0Var.g(modifier$Node);
                                            e0Var.a(ic.b.k(0.0f, z11, true));
                                            r1Var.invoke();
                                            uVar.f17376c = i17;
                                            return;
                                        }
                                        return;
                                    }
                                    int iK = ul.b.K(uVar);
                                    uVar.f17376c = iK;
                                    uVar.d(iK + 1, j0Var.f97841b);
                                    uVar.f17376c++;
                                    j0Var.g(modifier$Node);
                                    e0Var.a(ic.b.k(0.0f, z11, true));
                                    r1Var.invoke();
                                    uVar.f17376c = iK;
                                    if (i30.j.E(uVar.c()) < 0.0f) {
                                        uVar.d(i16 + 1, uVar.f17376c + 1);
                                    }
                                    uVar.f17376c = i16;
                                    return;
                                }
                            }
                        }
                    }
                } else {
                    if ((delegatingNode.getKindSet() & 16) == 0 || !(delegatingNode instanceof DelegatingNode)) {
                        modifier$NodeB = o.b(eVar2);
                    } else {
                        Modifier$Node delegate$ui_release = delegatingNode.getDelegate();
                        int i18 = 0;
                        modifier$NodeB = delegatingNode;
                        eVar2 = eVar2;
                        while (delegate$ui_release != null) {
                            if ((delegate$ui_release.getKindSet() & 16) != 0) {
                                i18++;
                                eVar2 = eVar2;
                                if (i18 == 1) {
                                    modifier$NodeB = delegate$ui_release;
                                } else {
                                    if (eVar2 == null) {
                                        eVar2 = new r1.e(new Modifier$Node[16]);
                                    }
                                    if (modifier$NodeB != null) {
                                        eVar2.b(modifier$NodeB);
                                        modifier$NodeB = null;
                                    }
                                    eVar2.b(delegate$ui_release);
                                }
                            }
                            delegate$ui_release = delegate$ui_release.getChild();
                            modifier$NodeB = modifier$NodeB;
                            eVar2 = eVar2;
                        }
                        if (i18 == 1) {
                        }
                    }
                    i12 = i5;
                    delegatingNode = modifier$NodeB;
                    eVar2 = eVar2;
                }
            }
        }
        if (z12) {
            A0(modifier$Node, eVar, j11, uVar, i5, z11, f11);
            return;
        }
        switch (eVar.f17181a) {
            case 1:
                DelegatingNode delegatingNodeB = modifier$Node;
                ?? eVar3 = 0;
                while (true) {
                    int i19 = 0;
                    if (delegatingNodeB == 0) {
                        z13 = false;
                        break;
                    } else {
                        if (delegatingNodeB instanceof l2) {
                            if (((l2) delegatingNodeB).interceptOutOfBoundsChildEvents()) {
                                z13 = true;
                                break;
                            }
                        } else if ((delegatingNodeB.getKindSet() & 16) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release2 = delegatingNodeB.getDelegate();
                            delegatingNodeB = delegatingNodeB;
                            eVar3 = eVar3;
                            while (delegate$ui_release2 != null) {
                                if ((delegate$ui_release2.getKindSet() & 16) != 0) {
                                    i19++;
                                    eVar3 = eVar3;
                                    if (i19 == 1) {
                                        delegatingNodeB = delegate$ui_release2;
                                    } else {
                                        if (eVar3 == 0) {
                                            eVar3 = new r1.e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar3.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar3.b(delegate$ui_release2);
                                    }
                                }
                                delegate$ui_release2 = delegate$ui_release2.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar3 = eVar3;
                            }
                            if (i19 == 1) {
                            }
                        }
                        delegatingNodeB = o.b(eVar3);
                    }
                }
                break;
            default:
                z13 = false;
                break;
        }
        if (!z13) {
            K0(g.b(modifier$Node, eVar.a()), eVar, j11, uVar, i5, z11, f11, false);
            return;
        }
        s1 s1Var = new s1(this, modifier$Node, eVar, j11, uVar, i5, z11, f11);
        z.e0 e0Var2 = uVar.f17375b;
        z.j0 j0Var2 = uVar.f17374a;
        if (uVar.f17376c != ul.b.K(uVar)) {
            long jC2 = uVar.c();
            int i21 = uVar.f17376c;
            int iK2 = ul.b.K(uVar);
            uVar.f17376c = iK2;
            uVar.d(iK2 + 1, j0Var2.f97841b);
            uVar.f17376c++;
            j0Var2.g(modifier$Node);
            e0Var2.a(ic.b.k(f11, z11, false));
            s1Var.invoke();
            uVar.f17376c = iK2;
            long jC3 = uVar.c();
            if (uVar.f17376c + 1 >= ul.b.K(uVar) || i30.j.n(jC2, jC3) <= 0) {
                uVar.d(uVar.f17376c + 1, j0Var2.f97841b);
            } else {
                uVar.d(i21 + 1, i30.j.J(jC3) ? uVar.f17376c + 2 : uVar.f17376c + 1);
            }
            uVar.f17376c = i21;
            return;
        }
        int i22 = uVar.f17376c;
        int i23 = i22 + 1;
        uVar.d(i23, j0Var2.f97841b);
        uVar.f17376c++;
        j0Var2.g(modifier$Node);
        e0Var2.a(ic.b.k(f11, z11, false));
        s1Var.invoke();
        uVar.f17376c = i22;
        if (i23 == ul.b.K(uVar) || i30.j.J(uVar.c())) {
            int i24 = uVar.f17376c;
            int i25 = i24 + 1;
            j0Var2.k(i25);
            if (i25 < 0 || i25 >= (i11 = e0Var2.f97814b)) {
                android.support.v4.media.session.b.m0("Index must be between 0 and size");
                throw null;
            }
            long[] jArr = e0Var2.f97813a;
            long j12 = jArr[i25];
            if (i25 != i11 - 1) {
                u90.b.s(jArr, jArr, i25, i24 + 2, i11);
            }
            e0Var2.f97814b--;
        }
    }

    public abstract void L0(Canvas canvas, l2.b bVar);

    @Override // z2.y
    public final long M(long j11) {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        G0();
        for (t1 t1Var = this; t1Var != null; t1Var = t1Var.f17360q) {
            j11 = t1Var.R0(j11);
        }
        return j11;
    }

    public final void M0(long j11, float f11, Function1 function1, l2.b bVar) {
        LayoutNode layoutNode = this.o;
        if (bVar != null) {
            if (function1 != null) {
                y2.a.a("both ways to create layers shouldn't be used together");
            }
            if (this.J != bVar) {
                this.J = null;
                V0(false, null);
                this.J = bVar;
            }
            if (this.I == null) {
                Owner ownerA = s0.a(layoutNode);
                p1 p1Var = this.F;
                if (p1Var == null) {
                    p1 p1Var2 = new p1(this, new q1(this, 0), 0);
                    this.F = p1Var2;
                    p1Var = p1Var2;
                }
                q1 q1Var = this.G;
                c3.j2 j2Var = (c3.j2) ownerA.createLayer(p1Var, q1Var, bVar);
                j2Var.e(this.f98083c);
                j2Var.d(j11);
                this.I = j2Var;
                layoutNode.setInnerLayerCoordinatorIsDirty$ui_release(true);
                q1Var.invoke();
            }
        } else {
            if (this.J != null) {
                this.J = null;
                V0(false, null);
            }
            V0(false, function1);
        }
        if (!y3.k.b(this.f17369z, j11)) {
            s0.a(layoutNode).voteFrameRate(-4.0f);
            this.f17369z = j11;
            layoutNode.getLayoutDelegate().f17357p.Z();
            c3.j2 j2Var2 = this.I;
            if (j2Var2 != null) {
                j2Var2.d(j11);
            } else {
                t1 t1Var = this.f17360q;
                if (t1Var != null) {
                    t1Var.D0();
                }
            }
            layoutNode.onCoordinatorPositionChanged$ui_release();
            y0.i0(this);
            Owner owner = layoutNode.getOwner();
            if (owner != null) {
                owner.onLayoutChange(layoutNode);
            }
        }
        this.A = f11;
        if (!this.f17407k) {
            Z(e0());
        }
        if (this == layoutNode.getOuterCoordinator$ui_release()) {
            s0.a(layoutNode).getRectManager().g(layoutNode, !layoutNode.getMeasurePassDelegate$ui_release().f17244k);
        }
    }

    public final void N0(h2.a aVar, boolean z11, boolean z12) {
        c3.j2 j2Var = this.I;
        if (j2Var != null) {
            if (this.f17362s) {
                if (z12) {
                    long jV0 = v0();
                    float fIntBitsToFloat = Float.intBitsToFloat((int) (jV0 >> 32)) / 2.0f;
                    float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jV0 & 4294967295L)) / 2.0f;
                    long j11 = this.f98083c;
                    aVar.a(-fIntBitsToFloat, -fIntBitsToFloat2, ((int) (j11 >> 32)) + fIntBitsToFloat, ((int) (j11 & 4294967295L)) + fIntBitsToFloat2);
                } else if (z11) {
                    long j12 = this.f98083c;
                    aVar.a(0.0f, 0.0f, (int) (j12 >> 32), (int) (j12 & 4294967295L));
                }
                if (aVar.b()) {
                    return;
                }
            }
            float[] fArrB = j2Var.b();
            if (!j2Var.f19366s) {
                if (fArrB == null) {
                    aVar.f59012a = 0.0f;
                    aVar.f59013b = 0.0f;
                    aVar.f59014c = 0.0f;
                    aVar.f59015d = 0.0f;
                } else {
                    i2.h0.c(fArrB, aVar);
                }
            }
        }
        long j13 = this.f17369z;
        float f11 = (int) (j13 >> 32);
        aVar.f59012a += f11;
        aVar.f59014c += f11;
        float f12 = (int) (j13 & 4294967295L);
        aVar.f59013b += f12;
        aVar.f59015d += f12;
    }

    public final void O0() {
        if (this.I != null) {
            if (this.J != null) {
                this.J = null;
            }
            V0(false, null);
            LayoutNode.requestRelayout$ui_release$default(this.o, false, 1, null);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r8v12 */
    /* JADX WARN: Type inference failed for: r8v13 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r8v5, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r8v6 */
    /* JADX WARN: Type inference failed for: r8v7 */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    /* JADX WARN: Type inference failed for: r9v13 */
    /* JADX WARN: Type inference failed for: r9v14 */
    /* JADX WARN: Type inference failed for: r9v15 */
    /* JADX WARN: Type inference failed for: r9v16 */
    /* JADX WARN: Type inference failed for: r9v2 */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v5, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v8, types: [r1.e] */
    public final void P0(z2.s0 s0Var) {
        t1 t1Var;
        z2.s0 s0Var2 = this.f17367x;
        if (s0Var != s0Var2) {
            this.f17367x = s0Var;
            LayoutNode layoutNode = this.o;
            int i5 = 0;
            if (s0Var2 == null || s0Var.getWidth() != s0Var2.getWidth() || s0Var.getHeight() != s0Var2.getHeight()) {
                int width = s0Var.getWidth();
                int height = s0Var.getHeight();
                c3.j2 j2Var = this.I;
                if (j2Var != null) {
                    j2Var.e((width << 32) | (height & 4294967295L));
                } else if (layoutNode.isPlaced() && (t1Var = this.f17360q) != null) {
                    t1Var.D0();
                }
                U((height & 4294967295L) | (width << 32));
                if (this.f17363t != null) {
                    W0(false);
                }
                boolean zH = u1.h(4);
                Modifier$Node modifier$NodeW0 = w0();
                if (zH || (modifier$NodeW0 = modifier$NodeW0.getParent()) != null) {
                    for (Modifier$Node modifier$NodeY0 = y0(zH); modifier$NodeY0 != null && (modifier$NodeY0.getAggregateChildKindSet() & 4) != 0; modifier$NodeY0 = modifier$NodeY0.getChild()) {
                        if ((modifier$NodeY0.getKindSet() & 4) != 0) {
                            DelegatingNode delegatingNodeB = modifier$NodeY0;
                            ?? eVar = 0;
                            while (delegatingNodeB != 0) {
                                if (delegatingNodeB instanceof q) {
                                    ((q) delegatingNodeB).onMeasureResultChanged();
                                } else if ((delegatingNodeB.getKindSet() & 4) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                                    Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                                    int i11 = 0;
                                    delegatingNodeB = delegatingNodeB;
                                    eVar = eVar;
                                    while (delegate$ui_release != null) {
                                        if ((delegate$ui_release.getKindSet() & 4) != 0) {
                                            i11++;
                                            eVar = eVar;
                                            if (i11 == 1) {
                                                delegatingNodeB = delegate$ui_release;
                                            } else {
                                                if (eVar == 0) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (delegatingNodeB != 0) {
                                                    eVar.b(delegatingNodeB);
                                                    delegatingNodeB = 0;
                                                }
                                                eVar.b(delegate$ui_release);
                                            }
                                        }
                                        delegate$ui_release = delegate$ui_release.getChild();
                                        delegatingNodeB = delegatingNodeB;
                                        eVar = eVar;
                                    }
                                    if (i11 == 1) {
                                    }
                                }
                                delegatingNodeB = o.b(eVar);
                            }
                        }
                        if (modifier$NodeY0 == modifier$NodeW0) {
                            break;
                        }
                    }
                }
                Owner owner = layoutNode.getOwner();
                if (owner != null) {
                    owner.onLayoutChange(layoutNode);
                }
            }
            z.h0 h0Var = this.f17368y;
            if ((h0Var == null || h0Var.f97833e == 0) && s0Var.a().isEmpty()) {
                return;
            }
            z.h0 h0Var2 = this.f17368y;
            Map mapA = s0Var.a();
            if (h0Var2 != null && h0Var2.f97833e == mapA.size()) {
                Object[] objArr = h0Var2.f97830b;
                int[] iArr = h0Var2.f97831c;
                long[] jArr = h0Var2.f97829a;
                int length = jArr.length - 2;
                if (length < 0) {
                    return;
                }
                int i12 = 0;
                loop0: while (true) {
                    long j11 = jArr[i12];
                    if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                        int i13 = 8 - ((~(i12 - length)) >>> 31);
                        for (int i14 = i5; i14 < i13; i14++) {
                            if ((255 & j11) < 128) {
                                int i15 = (i12 << 3) + i14;
                                Object obj = objArr[i15];
                                int i16 = iArr[i15];
                                Integer num = (Integer) mapA.get((z2.n) obj);
                                if (num == null || num.intValue() != i16) {
                                    break loop0;
                                }
                            }
                            j11 >>= 8;
                        }
                        if (i13 != 8) {
                            return;
                        }
                    }
                    if (i12 == length) {
                        return;
                    }
                    i12++;
                    i5 = 0;
                }
            }
            layoutNode.getLayoutDelegate().f17357p.f17256y.g();
            z.h0 h0Var3 = this.f17368y;
            if (h0Var3 == null) {
                z.h0 h0Var4 = z.t0.f97838a;
                h0Var3 = new z.h0();
                this.f17368y = h0Var3;
            }
            h0Var3.c();
            for (Map.Entry entry : s0Var.a().entrySet()) {
                h0Var3.h(((Number) entry.getValue()).intValue(), entry.getKey());
            }
        }
    }

    public final long R0(long j11) {
        c3.j2 j2Var = this.I;
        if (j2Var != null) {
            j11 = j2Var.c(j11, false);
        }
        long j12 = this.f17369z;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) + ((int) (j12 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) + ((int) (j12 & 4294967295L));
        return (Float.floatToRawIntBits(fIntBitsToFloat2) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
    }

    public final h2.c S0() {
        if (isAttached()) {
            z2.y yVarF = z2.r1.f(this);
            h2.a aVar = this.B;
            if (aVar == null) {
                aVar = new h2.a();
                this.B = aVar;
            }
            long jN0 = n0(v0());
            int i5 = (int) (jN0 >> 32);
            aVar.f59012a = -Float.intBitsToFloat(i5);
            int i11 = (int) (jN0 & 4294967295L);
            aVar.f59013b = -Float.intBitsToFloat(i11);
            aVar.f59014c = Float.intBitsToFloat(i5) + Q();
            aVar.f59015d = Float.intBitsToFloat(i11) + P();
            t1 t1Var = this;
            while (t1Var != yVarF) {
                t1Var.N0(aVar, false, true);
                if (!aVar.b()) {
                    t1Var = t1Var.f17360q;
                    Intrinsics.d(t1Var);
                }
            }
            return vh.a.S(aVar);
        }
        return h2.c.f59017e;
    }

    @Override // z2.i1
    public abstract void T(long j11, float f11, l2.b bVar);

    public final void T0(t1 t1Var, float[] fArr) {
        float[] fArrA;
        if (Intrinsics.b(t1Var, this)) {
            return;
        }
        t1 t1Var2 = this.f17360q;
        Intrinsics.d(t1Var2);
        t1Var2.T0(t1Var, fArr);
        if (!y3.k.b(this.f17369z, 0L)) {
            float[] fArr2 = M;
            i2.h0.d(fArr2);
            long j11 = this.f17369z;
            i2.h0.f(fArr2, -((int) (j11 >> 32)), -((int) (j11 & 4294967295L)));
            i2.h0.e(fArr, fArr2);
        }
        c3.j2 j2Var = this.I;
        if (j2Var == null || (fArrA = j2Var.a()) == null) {
            return;
        }
        i2.h0.e(fArr, fArrA);
    }

    public final void U0(t1 t1Var, float[] fArr) {
        t1 t1Var2 = this;
        while (!t1Var2.equals(t1Var)) {
            c3.j2 j2Var = t1Var2.I;
            if (j2Var != null) {
                i2.h0.e(fArr, j2Var.b());
            }
            if (!y3.k.b(t1Var2.f17369z, 0L)) {
                float[] fArr2 = M;
                i2.h0.d(fArr2);
                i2.h0.f(fArr2, (int) (r1 >> 32), (int) (r1 & 4294967295L));
                i2.h0.e(fArr, fArr2);
            }
            t1Var2 = t1Var2.f17360q;
            Intrinsics.d(t1Var2);
        }
    }

    public final void V0(boolean z11, Function1 function1) {
        Owner owner;
        p1 p1Var;
        if (function1 != null && this.J != null) {
            y2.a.a("layerBlock can't be provided when explicitLayer is provided");
        }
        LayoutNode layoutNode = this.o;
        boolean z12 = (!z11 && this.f17363t == function1 && Intrinsics.b(this.f17364u, layoutNode.getDensity()) && this.f17365v == layoutNode.getLayoutDirection()) ? false : true;
        this.f17364u = layoutNode.getDensity();
        this.f17365v = layoutNode.getLayoutDirection();
        boolean zIsAttached = layoutNode.isAttached();
        q1 q1Var = this.G;
        if (zIsAttached && function1 != null) {
            this.f17363t = function1;
            if (this.I != null) {
                if (z12 && W0(true)) {
                    layoutNode.onCoordinatorPositionChanged$ui_release();
                    s0.a(layoutNode).getRectManager().f(layoutNode);
                    return;
                }
                return;
            }
            Owner ownerA = s0.a(layoutNode);
            p1 p1Var2 = this.F;
            if (p1Var2 == null) {
                p1 p1Var3 = new p1(this, new q1(this, 0), 0);
                this.F = p1Var3;
                p1Var = p1Var3;
            } else {
                p1Var = p1Var2;
            }
            c3.j2 j2Var = (c3.j2) Owner.createLayer$default(ownerA, p1Var, q1Var, null, 4, null);
            j2Var.e(this.f98083c);
            j2Var.d(this.f17369z);
            this.I = j2Var;
            W0(true);
            layoutNode.setInnerLayerCoordinatorIsDirty$ui_release(true);
            q1Var.invoke();
            return;
        }
        this.f17363t = null;
        c3.j2 j2Var2 = this.I;
        if (j2Var2 != null) {
            AndroidComposeView androidComposeView = j2Var2.f19352c;
            if (!i2.r0.k(j2Var2.b())) {
                layoutNode.onCoordinatorPositionChanged$ui_release();
            }
            j2Var2.f19353d = null;
            j2Var2.f19354e = null;
            j2Var2.f19356g = true;
            if (j2Var2.f19359j) {
                j2Var2.f19359j = false;
                androidComposeView.notifyLayerIsDirty$ui_release(j2Var2, false);
            }
            i2.z zVar = j2Var2.f19351b;
            if (zVar != null) {
                zVar.b(j2Var2.f19350a);
                androidComposeView.recycle$ui_release(j2Var2);
            }
            layoutNode.setInnerLayerCoordinatorIsDirty$ui_release(true);
            q1Var.invoke();
            if (isAttached() && layoutNode.isPlaced() && (owner = layoutNode.getOwner()) != null) {
                owner.onLayoutChange(layoutNode);
            }
        }
        this.I = null;
        this.H = false;
    }

    public final boolean W0(boolean z11) {
        boolean z12;
        boolean z13;
        Owner owner;
        Function0 function0;
        Function0 function02;
        if (this.J != null) {
            return false;
        }
        c3.j2 j2Var = this.I;
        if (j2Var == null) {
            if (this.f17363t == null) {
                return false;
            }
            y2.a.b("null layer with a non-null layerBlock");
            return false;
        }
        AndroidComposeView androidComposeView = j2Var.f19352c;
        Function1 function1 = this.f17363t;
        if (function1 == null) {
            throw a2.c.r("updateLayerParameters requires a non-null layerBlock");
        }
        i2.s0 s0Var = K;
        s0Var.i(1.0f);
        s0Var.j(1.0f);
        s0Var.a(1.0f);
        s0Var.q(0.0f);
        s0Var.t(0.0f);
        s0Var.k(0.0f);
        long j11 = i2.b0.f61098a;
        s0Var.b(j11);
        s0Var.n(j11);
        s0Var.g(0.0f);
        if (s0Var.f61159k != 8.0f) {
            s0Var.f61149a |= 2048;
            s0Var.f61159k = 8.0f;
        }
        long j12 = i2.y0.f61191b;
        s0Var.o(j12);
        s0Var.m(i2.r0.f61135a);
        s0Var.f(false);
        if (s0Var.f61164r != 3) {
            s0Var.f61149a |= 524288;
            s0Var.f61164r = 3;
        }
        s0Var.o = 9205357640488583168L;
        s0Var.f61165s = null;
        s0Var.f61149a = 0;
        LayoutNode layoutNode = this.o;
        s0Var.f61162p = layoutNode.getDensity();
        s0Var.f61163q = layoutNode.getLayoutDirection();
        s0Var.o = w20.e.t(this.f98083c);
        s0.a(layoutNode).getSnapshotObserver().a(this, f.n, new a3.e(function1, 14));
        b0 b0Var = this.C;
        if (b0Var == null) {
            b0Var = new b0();
            this.C = b0Var;
        }
        b0 b0Var2 = L;
        b0Var2.getClass();
        b0Var2.f17160a = b0Var.f17160a;
        b0Var2.f17161b = b0Var.f17161b;
        b0Var2.f17162c = b0Var.f17162c;
        b0Var2.f17163d = b0Var.f17163d;
        b0Var2.f17164e = b0Var.f17164e;
        b0Var2.f17165f = b0Var.f17165f;
        b0Var2.f17166g = b0Var.f17166g;
        float f11 = s0Var.f61150b;
        b0Var.f17160a = f11;
        b0Var.f17161b = s0Var.f61151c;
        b0Var.f17162c = s0Var.f61153e;
        b0Var.f17163d = s0Var.f61154f;
        b0Var.f17164e = s0Var.f61158j;
        b0Var.f17165f = s0Var.f61159k;
        long j13 = s0Var.f61160l;
        b0Var.f17166g = j13;
        int i5 = s0Var.f61149a | j2Var.n;
        j2Var.f19361l = s0Var.f61163q;
        j2Var.f19360k = s0Var.f61162p;
        int i11 = i5 & androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
        if (i11 != 0) {
            j2Var.o = j13;
        }
        if ((i5 & 1) != 0) {
            l2.d dVar = j2Var.f19350a.f74501a;
            if (dVar.y() != f11) {
                dVar.r(f11);
            }
        }
        if ((i5 & 2) != 0) {
            l2.b bVar = j2Var.f19350a;
            float f12 = s0Var.f61151c;
            l2.d dVar2 = bVar.f74501a;
            if (dVar2.L() != f12) {
                dVar2.C(f12);
            }
        }
        if ((i5 & 4) != 0) {
            j2Var.f19350a.f(s0Var.f61152d);
        }
        if ((i5 & 8) != 0) {
            l2.b bVar2 = j2Var.f19350a;
            float f13 = s0Var.f61153e;
            l2.d dVar3 = bVar2.f74501a;
            if (dVar3.G() != f13) {
                dVar3.J(f13);
            }
        }
        if ((i5 & 16) != 0) {
            l2.b bVar3 = j2Var.f19350a;
            float f14 = s0Var.f61154f;
            l2.d dVar4 = bVar3.f74501a;
            if (dVar4.F() != f14) {
                dVar4.b(f14);
            }
        }
        if ((i5 & 32) != 0) {
            l2.b bVar4 = j2Var.f19350a;
            float f15 = s0Var.f61155g;
            l2.d dVar5 = bVar4.f74501a;
            if (dVar5.K() != f15) {
                dVar5.z(f15);
                bVar4.f74507g = true;
                bVar4.a();
            }
            if (s0Var.f61155g > 0.0f && !j2Var.f19367t && (function02 = j2Var.f19354e) != null) {
                function02.invoke();
            }
        }
        if ((i5 & 64) != 0) {
            l2.b bVar5 = j2Var.f19350a;
            long j14 = s0Var.f61156h;
            l2.d dVar6 = bVar5.f74501a;
            long jK = dVar6.k();
            int i12 = i2.s.n;
            if (!ULong.a(j14, jK)) {
                dVar6.o(j14);
            }
        }
        if ((i5 & 128) != 0) {
            l2.b bVar6 = j2Var.f19350a;
            long j15 = s0Var.f61157i;
            l2.d dVar7 = bVar6.f74501a;
            long jN = dVar7.n();
            int i13 = i2.s.n;
            if (!ULong.a(j15, jN)) {
                dVar7.u(j15);
            }
        }
        if ((i5 & 1024) != 0) {
            l2.b bVar7 = j2Var.f19350a;
            float f16 = s0Var.f61158j;
            l2.d dVar8 = bVar7.f74501a;
            if (dVar8.j() != f16) {
                dVar8.A(f16);
            }
        }
        if ((i5 & 256) != 0) {
            l2.d dVar9 = j2Var.f19350a.f74501a;
            if (dVar9.H() != 0.0f) {
                dVar9.l();
            }
        }
        if ((i5 & EventBridgeChannel.QUEUE_CAPACITY) != 0) {
            l2.d dVar10 = j2Var.f19350a.f74501a;
            if (dVar10.h() != 0.0f) {
                dVar10.m();
            }
        }
        if ((i5 & 2048) != 0) {
            l2.b bVar8 = j2Var.f19350a;
            float f17 = s0Var.f61159k;
            l2.d dVar11 = bVar8.f74501a;
            if (dVar11.s() != f17) {
                dVar11.w(f17);
            }
        }
        if (i11 != 0) {
            if (i2.y0.a(j2Var.o, j12)) {
                l2.b bVar9 = j2Var.f19350a;
                if (!h2.b.b(bVar9.f74520v, 9205357640488583168L)) {
                    bVar9.f74520v = 9205357640488583168L;
                    bVar9.f74501a.D(9205357640488583168L);
                }
            } else {
                l2.b bVar10 = j2Var.f19350a;
                long jFloatToRawIntBits = (Float.floatToRawIntBits(i2.y0.c(j2Var.o) * ((int) (j2Var.f19355f & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits(i2.y0.b(j2Var.o) * ((int) (j2Var.f19355f >> 32))) << 32);
                if (!h2.b.b(bVar10.f74520v, jFloatToRawIntBits)) {
                    bVar10.f74520v = jFloatToRawIntBits;
                    bVar10.f74501a.D(jFloatToRawIntBits);
                }
            }
        }
        if ((i5 & ReaderJsonLexerKt.BATCH_SIZE) != 0) {
            l2.b bVar11 = j2Var.f19350a;
            boolean z14 = s0Var.n;
            if (bVar11.f74521w != z14) {
                bVar11.f74521w = z14;
                bVar11.f74507g = true;
                bVar11.a();
            }
        }
        if ((131072 & i5) != 0) {
            l2.d dVar12 = j2Var.f19350a.f74501a;
        }
        if ((262144 & i5) != 0) {
            l2.d dVar13 = j2Var.f19350a.f74501a;
            if (!Intrinsics.b(dVar13.f(), null)) {
                dVar13.q();
            }
        }
        if ((i5 & 524288) != 0) {
            l2.b bVar12 = j2Var.f19350a;
            int i14 = s0Var.f61164r;
            l2.d dVar14 = bVar12.f74501a;
            if (dVar14.x() != i14) {
                dVar14.c(i14);
            }
        }
        if ((32768 & i5) != 0) {
            l2.d dVar15 = j2Var.f19350a.f74501a;
            if (dVar15.e() != 0) {
                dVar15.I(0);
            }
        }
        if ((i5 & 7963) != 0) {
            j2Var.f19364q = true;
            j2Var.f19365r = true;
        }
        if (Intrinsics.b(j2Var.f19363p, s0Var.f61165s)) {
            z12 = true;
            z13 = false;
        } else {
            i2.r0 r0Var = s0Var.f61165s;
            j2Var.f19363p = r0Var;
            if (r0Var == null) {
                z12 = true;
            } else {
                l2.b bVar13 = j2Var.f19350a;
                if (r0Var instanceof i2.j0) {
                    h2.c cVar = ((i2.j0) r0Var).f61125b;
                    float f18 = cVar.f59018a;
                    float f19 = cVar.f59019b;
                    bVar13.g(0.0f, (Float.floatToRawIntBits(f18) << 32) | (Float.floatToRawIntBits(f19) & 4294967295L), (Float.floatToRawIntBits(cVar.f59020c - f18) << 32) | (Float.floatToRawIntBits(cVar.f59021d - f19) & 4294967295L));
                } else if (r0Var instanceof i2.i0) {
                    i2.n0 n0Var = ((i2.i0) r0Var).f61123b;
                    bVar13.f74511k = null;
                    bVar13.f74509i = 9205357640488583168L;
                    bVar13.f74508h = 0L;
                    bVar13.f74510j = 0.0f;
                    bVar13.f74507g = true;
                    bVar13.n = false;
                    bVar13.f74512l = n0Var;
                    bVar13.a();
                } else {
                    if (!(r0Var instanceof i2.k0)) {
                        throw new NoWhenBranchMatchedException();
                    }
                    i2.k0 k0Var = (i2.k0) r0Var;
                    i2.h hVar = k0Var.f61127c;
                    if (hVar != null) {
                        bVar13.f74511k = null;
                        bVar13.f74509i = 9205357640488583168L;
                        bVar13.f74508h = 0L;
                        bVar13.f74510j = 0.0f;
                        z12 = true;
                        bVar13.f74507g = true;
                        bVar13.n = false;
                        bVar13.f74512l = hVar;
                        bVar13.a();
                    } else {
                        z12 = true;
                        bVar13.g(Float.intBitsToFloat((int) (k0Var.f61126b.f59029h >> 32)), (Float.floatToRawIntBits(r9.f59022a) << 32) | (Float.floatToRawIntBits(r9.f59023b) & 4294967295L), (Float.floatToRawIntBits(r9.b()) << 32) | (Float.floatToRawIntBits(r9.a()) & 4294967295L));
                    }
                    if ((r0Var instanceof i2.i0) && Build.VERSION.SDK_INT < 33 && (function0 = j2Var.f19354e) != null) {
                        function0.invoke();
                    }
                }
                z12 = true;
                if (r0Var instanceof i2.i0) {
                    function0.invoke();
                }
            }
            z13 = z12;
        }
        j2Var.n = s0Var.f61149a;
        if (i5 != 0 || z13) {
            ViewParent parent = androidComposeView.getParent();
            if (parent != null) {
                parent.onDescendantInvalidated(androidComposeView, androidComposeView);
            }
            if (androidComposeView.getIsArrEnabled()) {
                androidComposeView.voteFrameRate(0.0f);
            }
        }
        boolean z15 = this.f17362s;
        this.f17362s = s0Var.n;
        this.f17366w = s0Var.f61152d;
        boolean z16 = (b0Var2.f17160a == b0Var.f17160a && b0Var2.f17161b == b0Var.f17161b && b0Var2.f17162c == b0Var.f17162c && b0Var2.f17163d == b0Var.f17163d && b0Var2.f17164e == b0Var.f17164e && b0Var2.f17165f == b0Var.f17165f && i2.y0.a(b0Var2.f17166g, b0Var.f17166g)) ? z12 : false;
        boolean z17 = !z16;
        if (z11 && ((!z16 || z15 != this.f17362s) && (owner = layoutNode.getOwner()) != null)) {
            owner.onLayoutChange(layoutNode);
        }
        return z17;
    }

    public final boolean X0(long j11) {
        if ((((9187343241974906880L ^ (j11 & 9187343241974906880L)) - 4294967297L) & (-9223372034707292160L)) != 0) {
            return false;
        }
        c3.j2 j2Var = this.I;
        if (j2Var != null && this.f17362s) {
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32));
            float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L));
            l2.b bVar = j2Var.f19350a;
            if (!(bVar.f74521w ? jk.b.H(bVar.d(), fIntBitsToFloat, fIntBitsToFloat2) : true)) {
                return false;
            }
        }
        return true;
    }

    @Override // b3.y0
    public final y0 a0() {
        return this.f17359p;
    }

    @Override // b3.y0
    public final z2.y b0() {
        return this;
    }

    @Override // b3.y0
    public final boolean c0() {
        return this.f17367x != null;
    }

    @Override // b3.y0
    public final LayoutNode d0() {
        return this.o;
    }

    @Override // b3.y0
    public final z2.s0 e0() {
        z2.s0 s0Var = this.f17367x;
        if (s0Var != null) {
            return s0Var;
        }
        throw new IllegalStateException("Asking for measurement result of unmeasured layout modifier");
    }

    @Override // b3.y0
    public final y0 f0() {
        return this.f17360q;
    }

    @Override // z2.y
    public final long g() {
        return this.f98083c;
    }

    @Override // b3.y0
    public final long g0() {
        return this.f17369z;
    }

    @Override // y3.c
    public final float getDensity() {
        return this.o.getDensity().getDensity();
    }

    @Override // y3.c
    public final float getFontScale() {
        return this.o.getDensity().getFontScale();
    }

    @Override // z2.t
    public final y3.n getLayoutDirection() {
        return this.o.getLayoutDirection();
    }

    @Override // z2.y
    public final h2.c i(z2.y yVar, boolean z11) {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        if (!yVar.isAttached()) {
            y2.a.b("LayoutCoordinates " + yVar + " is not attached!");
        }
        t1 t1VarQ0 = Q0(yVar);
        t1VarQ0.G0();
        t1 t1VarS0 = s0(t1VarQ0);
        h2.a aVar = this.B;
        if (aVar == null) {
            aVar = new h2.a();
            this.B = aVar;
        }
        aVar.f59012a = 0.0f;
        aVar.f59013b = 0.0f;
        aVar.f59014c = (int) (yVar.g() >> 32);
        aVar.f59015d = (int) (yVar.g() & 4294967295L);
        while (t1VarQ0 != t1VarS0) {
            t1VarQ0.N0(aVar, z11, false);
            if (aVar.b()) {
                return h2.c.f59017e;
            }
            t1VarQ0 = t1VarQ0.f17360q;
            Intrinsics.d(t1VarQ0);
        }
        l0(t1VarS0, aVar, z11);
        return vh.a.S(aVar);
    }

    @Override // z2.y
    public final boolean isAttached() {
        return w0().getIsAttached();
    }

    @Override // b3.g2
    public final boolean isValidOwnerScope() {
        return (this.I == null || this.f17361r || !this.o.isAttached()) ? false : true;
    }

    @Override // z2.y
    public final long j(long j11) {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        z2.y yVarF = z2.r1.f(this);
        return F0(yVarF, h2.b.f(s0.a(this.o).mo49calculateLocalPositionMKHz9U(j11), yVarF.M(0L)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v10 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v12 */
    /* JADX WARN: Type inference failed for: r5v13 */
    /* JADX WARN: Type inference failed for: r5v14 */
    /* JADX WARN: Type inference failed for: r5v2 */
    /* JADX WARN: Type inference failed for: r5v3, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r5v8, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r5v9 */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r6v5 */
    /* JADX WARN: Type inference failed for: r6v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r6v8 */
    /* JADX WARN: Type inference failed for: r6v9 */
    @Override // z2.i1, z2.s
    public final Object k() {
        LayoutNode layoutNode = this.o;
        if (!layoutNode.getNodes().m44hasH91voCI$ui_release(64)) {
            return null;
        }
        w0();
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        for (Modifier$Node tail = layoutNode.getNodes().getTail(); tail != null; tail = tail.getParent()) {
            if ((tail.getKindSet() & 64) != 0) {
                ?? eVar = 0;
                DelegatingNode delegatingNodeB = tail;
                while (delegatingNodeB != 0) {
                    if (delegatingNodeB instanceof j2) {
                        objectRef.f71863a = ((j2) delegatingNodeB).modifyParentData(layoutNode.getDensity(), objectRef.f71863a);
                    } else if ((delegatingNodeB.getKindSet() & 64) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                        Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                        int i5 = 0;
                        delegatingNodeB = delegatingNodeB;
                        eVar = eVar;
                        while (delegate$ui_release != null) {
                            if ((delegate$ui_release.getKindSet() & 64) != 0) {
                                i5++;
                                eVar = eVar;
                                if (i5 == 1) {
                                    delegatingNodeB = delegate$ui_release;
                                } else {
                                    if (eVar == 0) {
                                        eVar = new r1.e(new Modifier$Node[16]);
                                    }
                                    if (delegatingNodeB != 0) {
                                        eVar.b(delegatingNodeB);
                                        delegatingNodeB = 0;
                                    }
                                    eVar.b(delegate$ui_release);
                                }
                            }
                            delegate$ui_release = delegate$ui_release.getChild();
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                        }
                        if (i5 == 1) {
                        }
                    }
                    delegatingNodeB = o.b(eVar);
                }
            }
        }
        return objectRef.f71863a;
    }

    @Override // b3.y0
    public final void k0() {
        l2.b bVar = this.J;
        if (bVar != null) {
            T(this.f17369z, this.A, bVar);
        } else {
            S(this.A, this.f17369z, this.f17363t);
        }
    }

    public final void l0(t1 t1Var, h2.a aVar, boolean z11) {
        if (t1Var == this) {
            return;
        }
        t1 t1Var2 = this.f17360q;
        if (t1Var2 != null) {
            t1Var2.l0(t1Var, aVar, z11);
        }
        long j11 = this.f17369z;
        float f11 = (int) (j11 >> 32);
        aVar.f59012a -= f11;
        aVar.f59014c -= f11;
        float f12 = (int) (j11 & 4294967295L);
        aVar.f59013b -= f12;
        aVar.f59015d -= f12;
        c3.j2 j2Var = this.I;
        if (j2Var != null) {
            float[] fArrA = j2Var.a();
            if (!j2Var.f19366s) {
                if (fArrA == null) {
                    aVar.f59012a = 0.0f;
                    aVar.f59013b = 0.0f;
                    aVar.f59014c = 0.0f;
                    aVar.f59015d = 0.0f;
                } else {
                    i2.h0.c(fArrA, aVar);
                }
            }
            if (this.f17362s && z11) {
                long j12 = this.f98083c;
                aVar.a(0.0f, 0.0f, (int) (j12 >> 32), (int) (j12 & 4294967295L));
            }
        }
    }

    @Override // z2.y
    /* renamed from: localToScreen-MK-Hz9U, reason: not valid java name */
    public final long mo107localToScreenMKHz9U(long j11) {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        return s0.a(this.o).mo52localToScreenMKHz9U(M(j11));
    }

    @Override // z2.y
    public final long m(z2.y yVar, long j11) {
        return F0(yVar, j11);
    }

    public final long m0(t1 t1Var, long j11) {
        if (t1Var == this) {
            return j11;
        }
        t1 t1Var2 = this.f17360q;
        return (t1Var2 == null || Intrinsics.b(t1Var, t1Var2)) ? t0(j11) : t0(t1Var2.m0(t1Var, j11));
    }

    public final long n0(long j11) {
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) - Q();
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j11 & 4294967295L)) - P();
        float fMax = Math.max(0.0f, fIntBitsToFloat / 2.0f);
        float fMax2 = Math.max(0.0f, fIntBitsToFloat2 / 2.0f);
        return (Float.floatToRawIntBits(fMax2) & 4294967295L) | (Float.floatToRawIntBits(fMax) << 32);
    }

    public final float o0(long j11, long j12) {
        if (Q() >= Float.intBitsToFloat((int) (j12 >> 32)) && P() >= Float.intBitsToFloat((int) (j12 & 4294967295L))) {
            return Float.POSITIVE_INFINITY;
        }
        long jN0 = n0(j12);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (jN0 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (jN0 & 4294967295L));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j11 >> 32));
        float fMax = Math.max(0.0f, fIntBitsToFloat3 < 0.0f ? -fIntBitsToFloat3 : fIntBitsToFloat3 - Q());
        long jFloatToRawIntBits = (Float.floatToRawIntBits(Math.max(0.0f, Float.intBitsToFloat((int) (j11 & 4294967295L)) < 0.0f ? -r9 : r9 - P())) & 4294967295L) | (Float.floatToRawIntBits(fMax) << 32);
        if (fIntBitsToFloat > 0.0f || fIntBitsToFloat2 > 0.0f) {
            int i5 = (int) (jFloatToRawIntBits >> 32);
            if (Float.intBitsToFloat(i5) <= fIntBitsToFloat) {
                int i11 = (int) (jFloatToRawIntBits & 4294967295L);
                if (Float.intBitsToFloat(i11) <= fIntBitsToFloat2) {
                    float fIntBitsToFloat4 = Float.intBitsToFloat(i5);
                    float fIntBitsToFloat5 = Float.intBitsToFloat(i11);
                    return (fIntBitsToFloat5 * fIntBitsToFloat5) + (fIntBitsToFloat4 * fIntBitsToFloat4);
                }
            }
        }
        return Float.POSITIVE_INFINITY;
    }

    public final void p0(Canvas canvas, l2.b bVar) {
        c3.j2 j2Var = this.I;
        if (j2Var == null) {
            long j11 = this.f17369z;
            float f11 = (int) (j11 >> 32);
            float f12 = (int) (j11 & 4294967295L);
            canvas.translate(f11, f12);
            q0(canvas, bVar);
            canvas.translate(-f11, -f12);
            return;
        }
        k2.b bVar2 = j2Var.f19362m;
        j2Var.f();
        j2Var.f19367t = j2Var.f19350a.f74501a.K() > 0.0f;
        i50.c cVar = bVar2.f70866b;
        cVar.setCanvas(canvas);
        cVar.f61380c = bVar;
        ul.b.y(bVar2, j2Var.f19350a);
    }

    public final void q0(Canvas canvas, l2.b bVar) {
        Canvas canvas2;
        l2.b bVar2;
        Modifier$Node modifier$NodeX0 = x0(4);
        if (modifier$NodeX0 == null) {
            L0(canvas, bVar);
            return;
        }
        r0 mDrawScope$ui_release = this.o.getMDrawScope$ui_release();
        long jT = w20.e.t(this.f98083c);
        mDrawScope$ui_release.getClass();
        r1.e eVar = null;
        while (modifier$NodeX0 != null) {
            if (modifier$NodeX0 instanceof q) {
                canvas2 = canvas;
                bVar2 = bVar;
                mDrawScope$ui_release.a(canvas2, jT, this, (q) modifier$NodeX0, bVar2);
            } else {
                canvas2 = canvas;
                bVar2 = bVar;
                if ((modifier$NodeX0.getKindSet() & 4) != 0 && (modifier$NodeX0 instanceof DelegatingNode)) {
                    int i5 = 0;
                    for (Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$NodeX0).getDelegate(); delegate$ui_release != null; delegate$ui_release = delegate$ui_release.getChild()) {
                        if ((delegate$ui_release.getKindSet() & 4) != 0) {
                            i5++;
                            if (i5 == 1) {
                                modifier$NodeX0 = delegate$ui_release;
                            } else {
                                if (eVar == null) {
                                    eVar = new r1.e(new Modifier$Node[16]);
                                }
                                if (modifier$NodeX0 != null) {
                                    eVar.b(modifier$NodeX0);
                                    modifier$NodeX0 = null;
                                }
                                eVar.b(delegate$ui_release);
                            }
                        }
                    }
                    if (i5 == 1) {
                    }
                }
                canvas = canvas2;
                bVar = bVar2;
            }
            modifier$NodeX0 = o.b(eVar);
            canvas = canvas2;
            bVar = bVar2;
        }
    }

    public abstract void r0();

    public final t1 s0(t1 t1Var) {
        LayoutNode parent$ui_release = t1Var.o;
        LayoutNode layoutNode = this.o;
        if (parent$ui_release == layoutNode) {
            Modifier$Node modifier$NodeW0 = t1Var.w0();
            Modifier$Node modifier$NodeW02 = w0();
            if (!modifier$NodeW02.getNode().getIsAttached()) {
                y2.a.b("visitLocalAncestors called on an unattached node");
            }
            for (Modifier$Node parent = modifier$NodeW02.getNode().getParent(); parent != null; parent = parent.getParent()) {
                if ((parent.getKindSet() & 2) != 0 && parent == modifier$NodeW0) {
                    return t1Var;
                }
            }
            return this;
        }
        while (parent$ui_release.getDepth() > layoutNode.getDepth()) {
            parent$ui_release = parent$ui_release.getParent$ui_release();
            Intrinsics.d(parent$ui_release);
        }
        LayoutNode parent$ui_release2 = layoutNode;
        while (parent$ui_release2.getDepth() > parent$ui_release.getDepth()) {
            parent$ui_release2 = parent$ui_release2.getParent$ui_release();
            Intrinsics.d(parent$ui_release2);
        }
        while (parent$ui_release != parent$ui_release2) {
            parent$ui_release = parent$ui_release.getParent$ui_release();
            parent$ui_release2 = parent$ui_release2.getParent$ui_release();
            if (parent$ui_release == null || parent$ui_release2 == null) {
                throw new IllegalArgumentException("layouts are not part of the same hierarchy");
            }
        }
        if (parent$ui_release2 != layoutNode) {
            if (parent$ui_release != t1Var.o) {
                return parent$ui_release.getInnerCoordinator$ui_release();
            }
            return t1Var;
        }
        return this;
    }

    @Override // z2.y
    /* renamed from: screenToLocal-MK-Hz9U, reason: not valid java name */
    public final long mo108screenToLocalMKHz9U(long j11) {
        if (!isAttached()) {
            y2.a.b("LayoutCoordinate operations are only valid when isAttached is true");
        }
        return F0(z2.r1.f(this), s0.a(this.o).mo54screenToLocalMKHz9U(j11));
    }

    public final long t0(long j11) {
        long j12 = this.f17369z;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j11 >> 32)) - ((int) (j12 >> 32));
        long jFloatToRawIntBits = (Float.floatToRawIntBits(Float.intBitsToFloat((int) (j11 & 4294967295L)) - ((int) (j12 & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32);
        c3.j2 j2Var = this.I;
        return j2Var != null ? j2Var.c(jFloatToRawIntBits, true) : jFloatToRawIntBits;
    }

    public abstract z0 u0();

    public final long v0() {
        return this.f17364u.mo103toSizeXkaWNTQ(this.o.getViewConfiguration().d());
    }

    public abstract Modifier$Node w0();

    @Override // z2.y
    public final long x(long j11) {
        return s0.a(this.o).mo50calculatePositionInWindowMKHz9U(M(j11));
    }

    public final Modifier$Node x0(int i5) {
        boolean zH = u1.h(i5);
        Modifier$Node modifier$NodeW0 = w0();
        if (!zH && (modifier$NodeW0 = modifier$NodeW0.getParent()) == null) {
            return null;
        }
        for (Modifier$Node modifier$NodeY0 = y0(zH); modifier$NodeY0 != null && (modifier$NodeY0.getAggregateChildKindSet() & i5) != 0; modifier$NodeY0 = modifier$NodeY0.getChild()) {
            if ((modifier$NodeY0.getKindSet() & i5) != 0) {
                return modifier$NodeY0;
            }
            if (modifier$NodeY0 == modifier$NodeW0) {
                return null;
            }
        }
        return null;
    }

    public final Modifier$Node y0(boolean z11) {
        Modifier$Node modifier$NodeW0;
        LayoutNode layoutNode = this.o;
        if (layoutNode.getOuterCoordinator$ui_release() == this) {
            return layoutNode.getNodes().getHead();
        }
        if (!z11) {
            t1 t1Var = this.f17360q;
            if (t1Var != null) {
                return t1Var.w0();
            }
            return null;
        }
        t1 t1Var2 = this.f17360q;
        if (t1Var2 == null || (modifier$NodeW0 = t1Var2.w0()) == null) {
            return null;
        }
        return modifier$NodeW0.getChild();
    }

    @Override // z2.y
    public final void z(z2.y yVar, float[] fArr) {
        t1 t1VarQ0 = Q0(yVar);
        t1VarQ0.G0();
        t1 t1VarS0 = s0(t1VarQ0);
        i2.h0.d(fArr);
        t1VarQ0.U0(t1VarS0, fArr);
        T0(t1VarS0, fArr);
    }

    public final void z0(Modifier$Node modifier$Node, e eVar, long j11, u uVar, int i5, boolean z11) {
        if (modifier$Node == null) {
            C0(eVar, j11, uVar, i5, z11);
            return;
        }
        int i11 = uVar.f17376c;
        z.j0 j0Var = uVar.f17374a;
        uVar.d(i11 + 1, j0Var.f97841b);
        uVar.f17376c++;
        j0Var.g(modifier$Node);
        uVar.f17375b.a(ic.b.k(-1.0f, z11, false));
        z0(g.b(modifier$Node, eVar.a()), eVar, j11, uVar, i5, z11);
        uVar.f17376c = i11;
    }
}
