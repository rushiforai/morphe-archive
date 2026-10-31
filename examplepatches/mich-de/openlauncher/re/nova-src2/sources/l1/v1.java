package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class v1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f74103j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ float f74104k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f74105l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f74106m;
    public final /* synthetic */ int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v1(b2.t tVar, float f11, long j11, int i5, int i11) {
        super(2);
        this.f74103j = tVar;
        this.f74104k = f11;
        this.f74105l = j11;
        this.f74106m = i5;
        this.n = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        p5.d(this.f74103j, this.f74104k, this.f74105l, (p1.o) obj, p1.a0.l(this.f74106m | 1), this.n);
        return Unit.f71706a;
    }
}
