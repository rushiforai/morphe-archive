package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import kotlin.ranges.ClosedFloatingPointRange;

/* loaded from: classes2.dex */
public final class p6 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ float f73785j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function1 f73786k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f73787l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f73788m;
    public final /* synthetic */ ClosedFloatingPointRange n;
    public final /* synthetic */ Function0 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ h6 f73789p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ i0.i f73790q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p6(float f11, Function1 function1, b2.t tVar, boolean z11, ClosedFloatingPointRange closedFloatingPointRange, Function0 function0, h6 h6Var, i0.i iVar, int i5) {
        super(2);
        this.f73785j = f11;
        this.f73786k = function1;
        this.f73787l = tVar;
        this.f73788m = z11;
        this.n = closedFloatingPointRange;
        this.o = function0;
        this.f73789p = h6Var;
        this.f73790q = iVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(1);
        w6.b(this.f73785j, this.f73786k, this.f73787l, this.f73788m, this.n, this.o, this.f73789p, this.f73790q, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
