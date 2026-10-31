package hy;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class n extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f61007d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f61008e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(ClosedFloatingPointRange closedFloatingPointRange, float f11) {
        super(1, Intrinsics.Kotlin.class, "scaleToOffset", "invoke$scaleToOffset(Lkotlin/ranges/ClosedFloatingPointRange;FFF)F", 0);
        this.f61007d = closedFloatingPointRange;
        this.f61008e = f11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        float fFloatValue = ((Number) obj).floatValue();
        ClosedFloatingPointRange closedFloatingPointRange = this.f61007d;
        return Float.valueOf(u.g(0.0f, this.f61008e, u.f(((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue(), fFloatValue)));
    }
}
