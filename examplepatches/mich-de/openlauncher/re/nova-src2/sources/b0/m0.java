package b0;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class m0 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f16181j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ x1.e f16182k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f16183l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f16184m;
    public final /* synthetic */ Object n;
    public final /* synthetic */ Object o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Object f16185p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m0(Object obj, Object obj2, Object obj3, x1.e eVar, int i5, int i11, int i12) {
        super(2);
        this.f16181j = i12;
        this.n = obj;
        this.o = obj2;
        this.f16185p = obj3;
        this.f16182k = eVar;
        this.f16183l = i5;
        this.f16184m = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f16181j) {
            case 0:
                ((Number) obj2).intValue();
                b2.t tVar = (b2.t) this.o;
                c0.c0 c0Var = (c0.c0) this.f16185p;
                a.a.k(this.n, tVar, c0Var, this.f16182k, (p1.o) obj, p1.a0.l(this.f16183l | 1), this.f16184m);
                break;
            default:
                ((Number) obj2).intValue();
                c4.f0 f0Var = (c4.f0) this.n;
                Function0 function0 = (Function0) this.o;
                c4.g0 g0Var = (c4.g0) this.f16185p;
                c4.p.a(f0Var, function0, g0Var, this.f16182k, (p1.o) obj, p1.a0.l(this.f16183l | 1), this.f16184m);
                break;
        }
        return Unit.f71706a;
    }
}
