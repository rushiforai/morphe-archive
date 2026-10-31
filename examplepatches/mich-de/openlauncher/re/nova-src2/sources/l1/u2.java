package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class u2 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function0 f74061j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f74062k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ i2.v0 f74063l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f74064m;
    public final /* synthetic */ long n;
    public final /* synthetic */ q2 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ x1.e f74065p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ int f74066q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ int f74067r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u2(Function0 function0, b2.t tVar, i2.v0 v0Var, long j11, long j12, q2 q2Var, x1.e eVar, int i5, int i11) {
        super(2);
        this.f74061j = function0;
        this.f74062k = tVar;
        this.f74063l = v0Var;
        this.f74064m = j11;
        this.n = j12;
        this.o = q2Var;
        this.f74065p = eVar;
        this.f74066q = i5;
        this.f74067r = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        v2.a(this.f74061j, this.f74062k, this.f74063l, this.f74064m, this.n, this.o, this.f74065p, (p1.o) obj, p1.a0.l(this.f74066q | 1), this.f74067r);
        return Unit.f71706a;
    }
}
