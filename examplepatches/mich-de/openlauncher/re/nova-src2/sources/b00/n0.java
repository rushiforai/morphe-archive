package b00;

import android.content.Context;
import androidx.compose.ui.node.LayoutNode;
import com.android.launcher3.views.DoubleShadowBubbleTextView;
import com.teslacoilsw.launcher.launcher3.appprediction.PredictionRowView;
import e10.s2;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.reflect.KProperty;
import kotlin.sequences.FilteringSequence;
import t0.u1;
import t0.w1;

/* loaded from: classes.dex */
public final /* synthetic */ class n0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16415a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f16416b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f16417c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f16418d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f16419e;

    public /* synthetic */ n0(int i5, int i11, Object obj, Object obj2, Object obj3) {
        this.f16415a = i11;
        this.f16417c = obj;
        this.f16418d = obj2;
        this.f16419e = obj3;
        this.f16416b = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f16415a) {
            case 0:
                Context context = (Context) this.f16417c;
                tz.v vVar = (tz.v) this.f16418d;
                o9.n1 n1Var = (o9.n1) this.f16419e;
                PredictionRowView predictionRowView = new PredictionRowView(context, null);
                predictionRowView.f45853s = true;
                predictionRowView.f45858x = true;
                predictionRowView.n();
                y2 y2Var = y2.f51877a;
                y2Var.getClass();
                s2 s2Var = y2.K2;
                KProperty kProperty = y2.f51881b[188];
                s2Var.getClass();
                int iIntValue = ((Number) s2Var.l()).intValue();
                predictionRowView.f45856v = iIntValue;
                predictionRowView.j(predictionRowView.f45842f.f79934x.d());
                predictionRowView.f45844h = predictionRowView.f46400b * iIntValue;
                mx.f fVar = new mx.f(mx.g.f77085c, (mx.j) y2Var.K().l(), false);
                fVar.a(context.getResources(), 1.0f);
                fVar.f77077j = vVar.f90179b;
                n1Var.getClass();
                predictionRowView.f45857w = Integer.valueOf(fVar.f77074g + this.f16416b);
                predictionRowView.b(n1Var.f79934x);
                FilteringSequence.AnonymousClass1 anonymousClass1 = new FilteringSequence.AnonymousClass1();
                while (anonymousClass1.hasNext()) {
                    ((DoubleShadowBubbleTextView) anonymousClass1.next()).r(fVar);
                }
                return predictionRowView;
            case 1:
                p1.i0 i0Var = (p1.i0) this.f16417c;
                x1.g gVar = (x1.g) this.f16418d;
                z.h0 h0Var = (z.h0) this.f16419e;
                if (obj == i0Var) {
                    throw new IllegalStateException("A derived state calculation cannot read itself");
                }
                if (obj instanceof z1.z) {
                    int i5 = gVar.f94956a - this.f16416b;
                    int iA = h0Var.a(obj);
                    h0Var.h(Math.min(i5, iA >= 0 ? h0Var.f97831c[iA] : LayoutNode.NotPlacedPlaceOrder), obj);
                }
                return Unit.f71706a;
            default:
                t0.m0 m0Var = (t0.m0) this.f16417c;
                z2.t0 t0Var = (z2.t0) this.f16418d;
                z2.i1 i1Var = (z2.i1) this.f16419e;
                z2.h1 h1Var = (z2.h1) obj;
                int i11 = m0Var.f88090b;
                u1 u1Var = m0Var.f88089a;
                r3.f0 f0Var = m0Var.f88091c;
                w1 w1Var = (w1) m0Var.f88092d.invoke();
                u1Var.b(g0.d1.f56494b, t0.t0.m(h1Var, i11, f0Var, w1Var != null ? w1Var.f88262a : null, t0Var.getLayoutDirection() == y3.n.f96613b, i1Var.f98081a), this.f16416b, i1Var.f98081a);
                z2.h1.m(h1Var, i1Var, Math.round(-u1Var.a()), 0);
                return Unit.f71706a;
        }
    }
}
