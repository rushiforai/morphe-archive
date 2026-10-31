package e0;

import android.view.KeyEvent;
import c3.n3;
import g0.t2;
import java.util.List;
import kotlin.coroutines.Continuation;
import t70.g2;

/* loaded from: classes.dex */
public class y extends g {

    /* renamed from: u, reason: collision with root package name */
    public v2.t f50162u;

    @Override // e0.g
    public final v2.l0 D() {
        return null;
    }

    @Override // e0.g
    public final boolean N(KeyEvent keyEvent) {
        return false;
    }

    @Override // e0.g
    public final void O(KeyEvent keyEvent) {
        this.f49986g.invoke();
    }

    @Override // e0.g, b3.l2
    public final void onCancelPointerInput() {
        super.onCancelPointerInput();
        if (this.f50162u != null) {
            this.f50162u = null;
            H();
        }
    }

    @Override // e0.g, b3.l2
    /* renamed from: onPointerEvent-H0pRuoY */
    public final void mo26onPointerEventH0pRuoY(v2.m mVar, v2.n nVar, long j11) {
        super.mo26onPointerEventH0pRuoY(mVar, nVar, j11);
        Continuation continuation = null;
        int i5 = 0;
        if (nVar != v2.n.f91981b) {
            if (nVar != v2.n.f91982c || this.f50162u == null) {
                return;
            }
            List list = mVar.f91975a;
            int size = list.size();
            while (i5 < size) {
                v2.t tVar = (v2.t) list.get(i5);
                if (tVar.l() && !tVar.equals(this.f50162u)) {
                    this.f50162u = null;
                    H();
                    return;
                }
                i5++;
            }
            return;
        }
        v2.t tVar2 = this.f50162u;
        if (tVar2 == null) {
            if (t2.f(mVar, true)) {
                v2.t tVar3 = (v2.t) mVar.f91975a.get(0);
                tVar3.a();
                this.f50162u = tVar3;
                if (this.f49985f) {
                    long jE = tVar3.e();
                    i0.i iVar = this.f49980a;
                    if (iVar != null) {
                        i0.k kVar = new i0.k(jE);
                        if (E()) {
                            this.f49995r = t70.m0.t(getCoroutineScope(), null, null, new dm.c(iVar, kVar, this, continuation, 1), 3);
                            return;
                        } else {
                            this.f49991l = kVar;
                            t70.m0.t(getCoroutineScope(), null, null, new d(iVar, kVar, null), 3);
                            return;
                        }
                    }
                    return;
                }
                return;
            }
            return;
        }
        List list2 = mVar.f91975a;
        int size2 = list2.size();
        for (int i11 = 0; i11 < size2; i11++) {
            if (!v2.g0.c((v2.t) list2.get(i11))) {
                long jMo103toSizeXkaWNTQ = b3.o.f(this).getDensity().mo103toSizeXkaWNTQ(((n3) b3.g.c(this, c3.z1.f19506s)).d());
                float fMax = Math.max(0.0f, Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ >> 32)) - ((int) (j11 >> 32))) / 2.0f;
                float fMax2 = Math.max(0.0f, Float.intBitsToFloat((int) (jMo103toSizeXkaWNTQ & 4294967295L)) - ((int) (j11 & 4294967295L))) / 2.0f;
                long jFloatToRawIntBits = (Float.floatToRawIntBits(fMax2) & 4294967295L) | (Float.floatToRawIntBits(fMax) << 32);
                int size3 = list2.size();
                while (i5 < size3) {
                    v2.t tVar4 = (v2.t) list2.get(i5);
                    if (tVar4.l() || v2.g0.i(tVar4, j11, jFloatToRawIntBits)) {
                        this.f50162u = null;
                        H();
                        return;
                    }
                    i5++;
                }
                return;
            }
        }
        ((v2.t) list2.get(0)).a();
        if (this.f49985f) {
            long jE2 = tVar2.e();
            i0.i iVar2 = this.f49980a;
            if (iVar2 != null) {
                g2 g2Var = this.f49995r;
                if (g2Var == null || !g2Var.b()) {
                    i0.k kVar2 = this.f49991l;
                    if (kVar2 != null) {
                        t70.m0.t(getCoroutineScope(), null, null, new d(kVar2, iVar2, null, 1), 3);
                    }
                } else {
                    t70.m0.t(getCoroutineScope(), null, null, new b(this, jE2, iVar2, (Continuation) null, 2), 3);
                }
                this.f49991l = null;
            }
            this.f49986g.invoke();
        }
        this.f50162u = null;
    }
}
