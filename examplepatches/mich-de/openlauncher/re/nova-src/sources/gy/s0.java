package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class s0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58531a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f58532b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1 f58533c;

    public /* synthetic */ s0(ClosedFloatingPointRange closedFloatingPointRange, Function1 function1, int i5) {
        this.f58531a = i5;
        this.f58532b = closedFloatingPointRange;
        this.f58533c = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        int i5 = this.f58531a;
        int iIntValue = ((Integer) obj).intValue();
        switch (i5) {
            case 0:
                float f11 = iIntValue / 100.0f;
                if (!this.f58532b.d(Float.valueOf(f11))) {
                    throw new IllegalStateException();
                }
                this.f58533c.invoke(Float.valueOf(f11));
                return Unit.f71706a;
            default:
                float f12 = iIntValue / 100.0f;
                if (!this.f58532b.d(Float.valueOf(f12))) {
                    throw new IllegalStateException();
                }
                this.f58533c.invoke(Float.valueOf(f12));
                return Unit.f71706a;
        }
    }
}
