package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class k0 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ l0 f73518j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f73519k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f73520l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f73521m;
    public final /* synthetic */ i2.v0 n;
    public final /* synthetic */ long o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k0(l0 l0Var, b2.t tVar, float f11, float f12, i2.v0 v0Var, long j11, int i5) {
        super(2);
        this.f73518j = l0Var;
        this.f73519k = tVar;
        this.f73520l = f11;
        this.f73521m = f12;
        this.n = v0Var;
        this.o = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(196609);
        this.f73518j.a(this.f73519k, this.f73520l, this.f73521m, this.n, this.o, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
