package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class k5 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function0 f73540j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f73541k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f73542l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73543m;
    public final /* synthetic */ int n;
    public final /* synthetic */ float o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ Function1 f73544p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ int f73545q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f73546r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k5(Function0 function0, b2.t tVar, long j11, long j12, int i5, float f11, Function1 function1, int i11, int i12) {
        super(2);
        this.f73540j = function0;
        this.f73541k = tVar;
        this.f73542l = j11;
        this.f73543m = j12;
        this.n = i5;
        this.o = f11;
        this.f73544p = function1;
        this.f73545q = i11;
        this.f73546r = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        l5.c(this.f73540j, this.f73541k, this.f73542l, this.f73543m, this.n, this.o, this.f73544p, (p1.o) obj, p1.a0.l(this.f73545q | 1), this.f73546r);
        return Unit.f71706a;
    }
}
