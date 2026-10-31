package gy;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class h1 extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f58348d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f58349e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h1(ClosedFloatingPointRange closedFloatingPointRange, float f11) {
        super(1, Intrinsics.Kotlin.class, "scaleToOffset", "invoke$scaleToOffset(Lkotlin/ranges/ClosedFloatingPointRange;FFF)F", 0);
        this.f58348d = closedFloatingPointRange;
        this.f58349e = f11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        float fFloatValue = ((Number) obj).floatValue();
        ClosedFloatingPointRange closedFloatingPointRange = this.f58348d;
        float fFloatValue2 = ((Number) closedFloatingPointRange.c()).floatValue();
        float fFloatValue3 = ((Number) closedFloatingPointRange.e()).floatValue();
        float f11 = t1.f58549a;
        float f12 = fFloatValue3 - fFloatValue2;
        return Float.valueOf(t1.f(0.0f, this.f58349e, kotlin.ranges.a.d0(f12 == 0.0f ? 0.0f : (fFloatValue - fFloatValue2) / f12, 0.0f, 1.0f)));
    }
}
