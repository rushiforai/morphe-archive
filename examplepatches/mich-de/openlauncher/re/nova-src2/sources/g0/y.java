package g0;

import androidx.compose.ui.node.LayoutNode;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final /* synthetic */ class y implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56764a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f56765b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f56766c;

    public /* synthetic */ y(int i5, Object obj, Object obj2) {
        this.f56764a = i5;
        this.f56765b = obj;
        this.f56766c = obj2;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f56764a) {
            case 0:
                g0 g0Var = (g0) this.f56765b;
                ai.j jVar = (ai.j) this.f56766c;
                v2.t tVar = (v2.t) obj;
                v2.t tVar2 = (v2.t) obj2;
                h2.b bVar = (h2.b) obj3;
                g0Var.f56540h = 0L;
                if (((Boolean) g0Var.f56534b.invoke(tVar)).booleanValue()) {
                    if (!g0Var.f56539g) {
                        if (g0Var.f56537e == null) {
                            g0Var.f56537e = v70.o.b(LayoutNode.NotPlacedPlaceOrder, 6, null);
                        }
                        g0Var.f56539g = true;
                        t70.m0.t(g0Var.getCoroutineScope(), null, null, new f0(g0Var, null), 3);
                    }
                    w2.d.a(jVar, tVar, 0L);
                    long jF = h2.b.f(tVar2.f91992c, bVar.f59016a);
                    v70.i iVar = g0Var.f56537e;
                    if (iVar != null) {
                        iVar.j(new o(jF));
                    }
                }
                return Unit.f71706a;
            case 1:
                p0.y yVar = (p0.y) this.f56765b;
                y3.n nVar = (y3.n) this.f56766c;
                float fFloatValue = ((Float) obj).floatValue();
                float fFloatValue2 = ((Float) obj2).floatValue();
                float fFloatValue3 = ((Float) obj3).floatValue();
                boolean zE = t2.c.E(yVar, fFloatValue);
                if (yVar.l().f81193e != d1.f56493a && nVar != y3.n.f96612a) {
                    zE = !zE;
                }
                int i5 = yVar.l().f81190b;
                float fR = i5 == 0 ? 0.0f : t2.c.r(yVar) / i5;
                float f11 = fR - ((int) fR);
                char c11 = Math.abs(fFloatValue) >= yVar.f81241q.mo102toPx0680j_4(h0.l.f58760a) ? fFloatValue > 0.0f ? (char) 1 : (char) 2 : (char) 0;
                if (c11 == 0) {
                    if (Math.abs(f11) <= 0.5f) {
                        fFloatValue2 = fFloatValue3;
                        break;
                    } else {
                        fFloatValue2 = fFloatValue3;
                    }
                } else if (c11 == 1) {
                    fFloatValue2 = fFloatValue3;
                } else if (c11 != 2) {
                    fFloatValue2 = 0.0f;
                }
                return Float.valueOf(fFloatValue2);
            default:
                ps.c.j((Function1) this.f56765b, this.f56766c, (CoroutineContext) obj3);
                return Unit.f71706a;
        }
    }
}
