package e0;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.LayoutNode;
import b3.p2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.reflect.KProperty;

/* loaded from: classes2.dex */
public final class x1 extends Modifier$Node implements b3.e0, p2 {

    /* renamed from: a, reason: collision with root package name */
    public a2 f50160a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f50161b;

    @Override // b3.p2
    public final void applySemantics(j3.b0 b0Var) {
        j3.y.l(b0Var);
        final int i5 = 0;
        final int i11 = 1;
        j3.i iVar = new j3.i(new Function0(this) { // from class: e0.w1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ x1 f50155b;

            {
                this.f50155b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int iH;
                switch (i5) {
                    case 0:
                        iH = this.f50155b.f50160a.h();
                        break;
                    default:
                        iH = this.f50155b.f50160a.g();
                        break;
                }
                return Float.valueOf(iH);
            }
        }, new Function0(this) { // from class: e0.w1

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ x1 f50155b;

            {
                this.f50155b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                int iH;
                switch (i11) {
                    case 0:
                        iH = this.f50155b.f50160a.h();
                        break;
                    default:
                        iH = this.f50155b.f50160a.g();
                        break;
                }
                return Float.valueOf(iH);
            }
        });
        if (this.f50161b) {
            j3.a0 a0Var = j3.w.f68870u;
            KProperty kProperty = j3.y.f68878a[12];
            a0Var.a(b0Var, iVar);
        } else {
            j3.a0 a0Var2 = j3.w.f68869t;
            KProperty kProperty2 = j3.y.f68878a[11];
            a0Var2.a(b0Var, iVar);
        }
    }

    @Override // b3.e0
    public final int maxIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        if (!this.f50161b) {
            i5 = LayoutNode.NotPlacedPlaceOrder;
        }
        return sVar.b(i5);
    }

    @Override // b3.e0
    public final int maxIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        if (this.f50161b) {
            i5 = LayoutNode.NotPlacedPlaceOrder;
        }
        return sVar.F(i5);
    }

    @Override // b3.e0
    /* renamed from: measure-3p2s80s */
    public final z2.s0 mo25measure3p2s80s(z2.t0 t0Var, z2.q0 q0Var, long j11) {
        ab.e0.r(j11, this.f50161b ? g0.d1.f56493a : g0.d1.f56494b);
        boolean z11 = this.f50161b;
        int iH = LayoutNode.NotPlacedPlaceOrder;
        int iG = z11 ? Integer.MAX_VALUE : y3.a.g(j11);
        if (this.f50161b) {
            iH = y3.a.h(j11);
        }
        z2.i1 i1VarH = q0Var.H(y3.a.a(j11, 0, iH, 0, iG, 5));
        int i5 = i1VarH.f98081a;
        int iH2 = y3.a.h(j11);
        if (i5 > iH2) {
            i5 = iH2;
        }
        int i11 = i1VarH.f98082b;
        int iG2 = y3.a.g(j11);
        if (i11 > iG2) {
            i11 = iG2;
        }
        int i12 = i1VarH.f98082b - i11;
        int i13 = i1VarH.f98081a - i5;
        if (!this.f50161b) {
            i12 = i13;
        }
        a2 a2Var = this.f50160a;
        a2Var.f49900d.p(i12);
        z1.f fVarL = o2.f.l();
        Function1 function1E = fVarL != null ? fVarL.e() : null;
        z1.f fVarQ = o2.f.q(fVarL);
        try {
            if (a2Var.h() > i12) {
                a2Var.f49897a.p(i12);
            }
            Unit unit = Unit.f71706a;
            o2.f.w(fVarL, fVarQ, function1E);
            this.f50160a.f49898b.p(this.f50161b ? i11 : i5);
            return t0Var.y(i5, i11, b70.h.f17594a, new b10.y(this, i12, i1VarH, 1));
        } catch (Throwable th2) {
            o2.f.w(fVarL, fVarQ, function1E);
            throw th2;
        }
    }

    @Override // b3.e0
    public final int minIntrinsicHeight(z2.t tVar, z2.s sVar, int i5) {
        if (!this.f50161b) {
            i5 = LayoutNode.NotPlacedPlaceOrder;
        }
        return sVar.t(i5);
    }

    @Override // b3.e0
    public final int minIntrinsicWidth(z2.t tVar, z2.s sVar, int i5) {
        if (this.f50161b) {
            i5 = LayoutNode.NotPlacedPlaceOrder;
        }
        return sVar.E(i5);
    }
}
