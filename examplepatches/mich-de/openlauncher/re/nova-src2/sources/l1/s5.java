package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class s5 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f73952j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function2 f73953k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function2 f73954l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function2 f73955m;
    public final /* synthetic */ Function2 n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ long f73956p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ long f73957q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ k0.g2 f73958r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ x1.e f73959s;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f73960t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ int f73961u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s5(b2.t tVar, Function2 function2, Function2 function22, Function2 function23, Function2 function24, int i5, long j11, long j12, k0.g2 g2Var, x1.e eVar, int i11, int i12) {
        super(2);
        this.f73952j = tVar;
        this.f73953k = function2;
        this.f73954l = function22;
        this.f73955m = function23;
        this.n = function24;
        this.o = i5;
        this.f73956p = j11;
        this.f73957q = j12;
        this.f73958r = g2Var;
        this.f73959s = eVar;
        this.f73960t = i11;
        this.f73961u = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(this.f73960t | 1);
        int i5 = this.f73961u;
        u5.a(this.f73952j, this.f73953k, this.f73954l, this.f73955m, this.n, this.o, this.f73956p, this.f73957q, this.f73958r, this.f73959s, (p1.o) obj, iL, i5);
        return Unit.f71706a;
    }
}
