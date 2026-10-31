package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class q1 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ r1 f16214j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f16215k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f16216l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f16217m;
    public final /* synthetic */ z2.t0 n;
    public final /* synthetic */ z2.i1 o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q1(r1 r1Var, long j11, int i5, int i11, z2.t0 t0Var, z2.i1 i1Var) {
        super(1);
        this.f16214j = r1Var;
        this.f16215k = j11;
        this.f16216l = i5;
        this.f16217m = i11;
        this.n = t0Var;
        this.o = i1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1.k((z2.h1) obj, this.o, this.f16214j.f16223b.a(this.f16215k, (this.f16217m & 4294967295L) | (this.f16216l << 32), this.n.getLayoutDirection()));
        return Unit.f71706a;
    }
}
