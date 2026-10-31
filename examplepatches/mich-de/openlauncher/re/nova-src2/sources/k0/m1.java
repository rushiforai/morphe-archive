package k0;

import c3.q2;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final /* synthetic */ class m1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70679a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f70680b;

    public /* synthetic */ m1(float f11, int i5) {
        this.f70679a = i5;
        this.f70680b = f11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f70679a) {
            case 0:
                q2 q2Var = (q2) obj;
                q2Var.f19405a = "padding";
                q2Var.f19406b = new y3.f(this.f70680b);
                return Unit.f71706a;
            case 1:
                return Integer.valueOf((int) (((Integer) obj).intValue() * this.f70680b));
            case 2:
                return Integer.valueOf((int) (((Integer) obj).intValue() * this.f70680b));
            case 3:
                return Integer.valueOf((int) (((Integer) obj).intValue() * this.f70680b));
            case 4:
                return Integer.valueOf((int) (((Integer) obj).intValue() * this.f70680b));
            default:
                float f11 = this.f70680b;
                i2.s0 s0Var = (i2.s0) ((i2.a0) obj);
                s0Var.a(1.0f - kotlin.ranges.a.d0(0.3f * f11, 0.0f, 1.0f));
                float fD0 = 1.0f - kotlin.ranges.a.d0(f11 * 0.05f, 0.0f, 1.0f);
                s0Var.i(fD0);
                s0Var.j(fD0);
                return Unit.f71706a;
        }
    }
}
