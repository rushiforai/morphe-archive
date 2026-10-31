package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class k8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73558j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function3 f73559k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f73560l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73561m;
    public final /* synthetic */ long n;
    public final /* synthetic */ float o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function2 f73562p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ x1.e f73563q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ e0.a2 f73564r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ int f73565s;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k8(int i5, Function3 function3, b2.t tVar, long j11, long j12, float f11, Function2 function2, x1.e eVar, e0.a2 a2Var, int i11) {
        super(2);
        this.f73558j = i5;
        this.f73559k = function3;
        this.f73560l = tVar;
        this.f73561m = j11;
        this.n = j12;
        this.o = f11;
        this.f73562p = function2;
        this.f73563q = eVar;
        this.f73564r = a2Var;
        this.f73565s = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        o8.b(this.f73558j, this.f73559k, this.f73560l, this.f73561m, this.n, this.o, this.f73562p, this.f73563q, this.f73564r, (p1.o) obj, p1.a0.l(this.f73565s | 1));
        return Unit.f71706a;
    }
}
