package b3;

import androidx.compose.ui.graphics.Canvas;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class q1 extends Lambda implements Function0 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f17316j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ t1 f17317k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q1(t1 t1Var, int i5) {
        super(0);
        this.f17316j = i5;
        this.f17317k = t1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f17316j) {
            case 0:
                t1 t1Var = this.f17317k;
                Canvas canvas = t1Var.E;
                Intrinsics.d(canvas);
                t1Var.q0(canvas, t1Var.D);
                break;
            default:
                t1 t1Var2 = this.f17317k.f17360q;
                if (t1Var2 != null) {
                    t1Var2.D0();
                }
                break;
        }
        return Unit.f71706a;
    }
}
