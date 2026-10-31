package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class z2 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ n2.c f74346j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ String f74347k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ b2.t f74348l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f74349m;
    public final /* synthetic */ int n;
    public final /* synthetic */ int o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z2(n2.c cVar, String str, b2.t tVar, long j11, int i5, int i11) {
        super(2);
        this.f74346j = cVar;
        this.f74347k = str;
        this.f74348l = tVar;
        this.f74349m = j11;
        this.n = i5;
        this.o = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        b3.a(this.f74346j, this.f74347k, this.f74348l, this.f74349m, (p1.o) obj, p1.a0.l(this.n | 1), this.o);
        return Unit.f71706a;
    }
}
