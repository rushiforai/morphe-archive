package gy;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes4.dex */
public final /* synthetic */ class y0 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f58605b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ClosedFloatingPointRange f58606c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f58607d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ List f58608e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ float f58609f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function1 f58610g;

    public /* synthetic */ y0(boolean z11, ClosedFloatingPointRange closedFloatingPointRange, int i5, List list, float f11, Function1 function1, int i11) {
        this.f58604a = i11;
        this.f58605b = z11;
        this.f58606c = closedFloatingPointRange;
        this.f58607d = i5;
        this.f58608e = list;
        this.f58609f = f11;
        this.f58610g = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        j3.b0 b0Var = (j3.b0) obj;
        switch (this.f58604a) {
            case 0:
                if (!this.f58605b) {
                    j3.y.a(b0Var);
                }
                j3.y.h(b0Var, new z0(this.f58606c, this.f58607d, this.f58608e, this.f58609f, this.f58610g, 0));
                break;
            default:
                if (!this.f58605b) {
                    j3.y.a(b0Var);
                }
                j3.y.h(b0Var, new z0(this.f58606c, this.f58607d, this.f58608e, this.f58609f, this.f58610g, 1));
                break;
        }
        return Unit.f71706a;
    }
}
