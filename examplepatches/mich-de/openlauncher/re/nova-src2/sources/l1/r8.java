package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class r8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ v8 f73923j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f73924k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ i0.i f73925l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ q8 f73926m;
    public final /* synthetic */ i2.v0 n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r8(v8 v8Var, boolean z11, i0.i iVar, q8 q8Var, i2.v0 v0Var, int i5) {
        super(2);
        v8 v8Var2 = v8.f74139a;
        v8 v8Var3 = v8.f74139a;
        this.f73923j = v8Var;
        this.f73924k = z11;
        this.f73925l = iVar;
        this.f73926m = q8Var;
        this.n = v0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        ((Number) obj2).intValue();
        v8 v8Var = v8.f74139a;
        v8 v8Var2 = v8.f74139a;
        this.f73923j.a(this.f73924k, this.f73925l, this.f73926m, this.n, oVar, p1.a0.l(114822145));
        return Unit.f71706a;
    }
}
