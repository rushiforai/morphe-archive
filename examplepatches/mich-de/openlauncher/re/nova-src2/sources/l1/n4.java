package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class n4 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ p4 f73688j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ boolean f73689k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ boolean f73690l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ i0.i f73691m;
    public final /* synthetic */ b2.t n;
    public final /* synthetic */ q8 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ i2.v0 f73692p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ float f73693q;

    /* renamed from: r, reason: collision with root package name */
    public final /* synthetic */ float f73694r;

    /* renamed from: s, reason: collision with root package name */
    public final /* synthetic */ int f73695s;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f73696t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n4(p4 p4Var, boolean z11, boolean z12, i0.i iVar, b2.t tVar, q8 q8Var, i2.v0 v0Var, float f11, float f12, int i5, int i11) {
        super(2);
        this.f73688j = p4Var;
        this.f73689k = z11;
        this.f73690l = z12;
        this.f73691m = iVar;
        this.n = tVar;
        this.o = q8Var;
        this.f73692p = v0Var;
        this.f73693q = f11;
        this.f73694r = f12;
        this.f73695s = i5;
        this.f73696t = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        this.f73688j.a(this.f73689k, this.f73690l, this.f73691m, this.n, this.o, this.f73692p, this.f73693q, this.f73694r, (p1.o) obj, p1.a0.l(this.f73695s | 1), this.f73696t);
        return Unit.f71706a;
    }
}
