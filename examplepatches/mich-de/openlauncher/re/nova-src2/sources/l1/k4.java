package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class k4 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f73536j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f73537k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f73538l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f73539m;
    public final /* synthetic */ k0.g2 n;
    public final /* synthetic */ x1.e o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k4(b2.t tVar, long j11, long j12, float f11, k0.g2 g2Var, x1.e eVar, int i5) {
        super(2);
        this.f73536j = tVar;
        this.f73537k = j11;
        this.f73538l = j12;
        this.f73539m = f11;
        this.n = g2Var;
        this.o = eVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(196609);
        l4.a(this.f73536j, this.f73537k, this.f73538l, this.f73539m, this.n, this.o, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
