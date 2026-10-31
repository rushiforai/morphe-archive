package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class b1 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ z2.i1 f16057j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f16058k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f16059l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ v0 f16060m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(z2.i1 i1Var, long j11, long j12, v0 v0Var) {
        super(1);
        this.f16057j = i1Var;
        this.f16058k = j11;
        this.f16059l = j12;
        this.f16060m = v0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        z2.h1 h1Var = (z2.h1) obj;
        long j11 = this.f16058k;
        long j12 = this.f16059l;
        h1Var.getClass();
        z2.i1 i1Var = this.f16057j;
        z2.h1.a(h1Var, i1Var);
        i1Var.S(0.0f, y3.k.d(((((int) (j11 >> 32)) + ((int) (j12 >> 32))) << 32) | ((((int) (j11 & 4294967295L)) + ((int) (j12 & 4294967295L))) & 4294967295L), i1Var.f98085e), this.f16060m);
        return Unit.f71706a;
    }
}
