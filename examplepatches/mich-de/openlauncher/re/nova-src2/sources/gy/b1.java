package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class b1 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58237a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f58238b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f58239c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f58240d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ float f58241e;

    public /* synthetic */ b1(Function1 function1, ClosedFloatingPointRange closedFloatingPointRange, p1.e1 e1Var, float f11, int i5, int i11) {
        this.f58237a = i11;
        this.f58238b = function1;
        this.f58239c = closedFloatingPointRange;
        this.f58240d = e1Var;
        this.f58241e = f11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58237a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(385);
                t1.a(this.f58238b, this.f58239c, this.f58240d, this.f58241e, (p1.o) obj, iL);
                break;
            default:
                ((Integer) obj2).getClass();
                int iL2 = p1.a0.l(385);
                hy.u.a(this.f58238b, this.f58239c, this.f58240d, this.f58241e, (p1.o) obj, iL2);
                break;
        }
        return Unit.f71706a;
    }
}
