package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class g5 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f73343j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f73344k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f73345l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73346m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ int f73347p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g5(b2.t tVar, long j11, float f11, long j12, int i5, int i11, int i12) {
        super(2);
        this.f73343j = tVar;
        this.f73344k = j11;
        this.f73345l = f11;
        this.f73346m = j12;
        this.n = i5;
        this.o = i11;
        this.f73347p = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        l5.b(this.f73343j, this.f73344k, this.f73345l, this.f73346m, this.n, (p1.o) obj, p1.a0.l(this.o | 1), this.f73347p);
        return Unit.f71706a;
    }
}
