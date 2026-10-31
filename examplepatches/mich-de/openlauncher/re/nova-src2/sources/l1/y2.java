package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class y2 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ o2.g f74292j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f74293k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f74294l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f74295m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y2(o2.g gVar, String str, b2.t tVar, long j11, int i5, int i11) {
        super(2);
        this.f74292j = gVar;
        this.f74293k = str;
        this.f74294l = tVar;
        this.f74295m = j11;
        this.n = i5;
        this.o = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        b3.b(this.f74292j, this.f74293k, this.f74294l, this.f74295m, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
        return Unit.f71706a;
    }
}
