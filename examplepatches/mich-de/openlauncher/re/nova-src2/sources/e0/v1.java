package e0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes2.dex */
public final /* synthetic */ class v1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f50149a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f50150b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f50151c;

    public /* synthetic */ v1(float f11, ClosedFloatingPointRange closedFloatingPointRange, int i5) {
        this.f50149a = f11;
        this.f50150b = closedFloatingPointRange;
        this.f50151c = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Float fValueOf = Float.valueOf(this.f50149a);
        ClosedFloatingPointRange closedFloatingPointRange = this.f50150b;
        j3.y.i((j3.b0) obj, new j3.g(((Number) kotlin.ranges.a.i0(fValueOf, closedFloatingPointRange)).floatValue(), closedFloatingPointRange, this.f50151c));
        return Unit.f71706a;
    }
}
