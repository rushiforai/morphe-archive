package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes2.dex */
public final class r6 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73916j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ x6 f73917k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r6(x6 x6Var, int i5) {
        super(1);
        this.f73916j = i5;
        this.f73917k = x6Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean z11;
        switch (this.f73916j) {
            case 0:
                this.f73917k.f74250i.p((int) (((y3.m) obj).f96611a >> 32));
                return Unit.f71706a;
            case 1:
                float fFloatValue = ((Number) obj).floatValue();
                x6 x6Var = this.f73917k;
                ClosedFloatingPointRange closedFloatingPointRange = x6Var.f74243b;
                float fD0 = kotlin.ranges.a.d0(fFloatValue, ((Number) closedFloatingPointRange.c()).floatValue(), ((Number) closedFloatingPointRange.e()).floatValue());
                p1.m2 m2Var = x6Var.f74244c;
                if (fD0 == m2Var.m()) {
                    z11 = false;
                } else {
                    if (fD0 != m2Var.m()) {
                        Function1 function1 = x6Var.f74245d;
                        if (function1 != null) {
                            function1.invoke(Float.valueOf(fD0));
                        } else {
                            x6Var.d(fD0);
                        }
                    }
                    Function0 function0 = x6Var.f74242a;
                    if (function0 != null) {
                        function0.invoke();
                    }
                    z11 = true;
                }
                return Boolean.valueOf(z11);
            default:
                long j11 = ((h2.b) obj).f59016a;
                x6 x6Var2 = this.f73917k;
                x6Var2.a(0.0f);
                x6Var2.f74252k.invoke();
                return Unit.f71706a;
        }
    }
}
