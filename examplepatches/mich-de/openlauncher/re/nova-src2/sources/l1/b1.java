package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class b1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ l3.a f73040j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function0 f73041k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f73042l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ boolean f73043m;
    public final /* synthetic */ x0 n;
    public final /* synthetic */ int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(l3.a aVar, Function0 function0, b2.t tVar, boolean z11, x0 x0Var, int i5) {
        super(2);
        this.f73040j = aVar;
        this.f73041k = function0;
        this.f73042l = tVar;
        this.f73043m = z11;
        this.n = x0Var;
        this.o = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        c1.c(this.f73040j, this.f73041k, this.f73042l, this.f73043m, this.n, (p1.o) obj, p1.a0.l(this.o | 1));
        return Unit.f71706a;
    }
}
