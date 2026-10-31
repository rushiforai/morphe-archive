package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class a1 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58221a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f58222b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f58223c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f58224d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f58225e;

    public /* synthetic */ a1(ClosedFloatingPointRange closedFloatingPointRange, Function1 function1, float f11, p1.e1 e1Var, int i5) {
        this.f58221a = i5;
        this.f58222b = closedFloatingPointRange;
        this.f58223c = function1;
        this.f58224d = f11;
        this.f58225e = e1Var;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f58221a) {
            case 0:
                ClosedFloatingPointRange closedFloatingPointRange = this.f58222b;
                float fFloatValue = (((Number) closedFloatingPointRange.e()).floatValue() - ((Number) closedFloatingPointRange.c()).floatValue()) / 1000;
                float fFloatValue2 = ((Number) this.f58223c.invoke(Float.valueOf(this.f58224d))).floatValue();
                p1.e1 e1Var = this.f58225e;
                if (Math.abs(fFloatValue2 - ((Number) e1Var.getValue()).floatValue()) > fFloatValue) {
                    e1Var.setValue(Float.valueOf(fFloatValue2));
                }
                break;
            default:
                ClosedFloatingPointRange closedFloatingPointRange2 = this.f58222b;
                float fFloatValue3 = (((Number) closedFloatingPointRange2.e()).floatValue() - ((Number) closedFloatingPointRange2.c()).floatValue()) / 1000;
                float fFloatValue4 = ((Number) this.f58223c.invoke(Float.valueOf(this.f58224d))).floatValue();
                p1.e1 e1Var2 = this.f58225e;
                if (Math.abs(fFloatValue4 - ((Number) e1Var2.getValue()).floatValue()) > fFloatValue3) {
                    e1Var2.setValue(Float.valueOf(fFloatValue4));
                }
                break;
        }
        return Unit.f71706a;
    }
}
