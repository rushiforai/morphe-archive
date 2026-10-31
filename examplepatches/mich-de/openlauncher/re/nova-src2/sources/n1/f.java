package n1;

import i2.a0;
import i2.s0;
import i2.v0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class f extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ o f77638j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f77639k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f77640l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f77641m;
    public final /* synthetic */ v0 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(o oVar, boolean z11, float f11, float f12, v0 v0Var) {
        super(1);
        this.f77638j = oVar;
        this.f77639k = z11;
        this.f77640l = f11;
        this.f77641m = f12;
        this.n = v0Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        a0 a0Var = (a0) obj;
        q qVar = (q) this.f77638j;
        boolean z11 = ((Number) qVar.f77679a.e()).floatValue() > 0.0f || this.f77639k;
        float fFloatValue = ((Number) qVar.f77679a.e()).floatValue() * a0Var.mo96roundToPx0680j_4(this.f77640l);
        s0 s0Var = (s0) a0Var;
        s0Var.t(fFloatValue - h2.e.b(s0Var.o));
        s0Var.k(z11 ? s0Var.f61162p.getDensity() * this.f77641m : 0.0f);
        s0Var.m(this.n);
        s0Var.f(true);
        return Unit.f71706a;
    }
}
