package n1;

import b2.t;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;
import p1.a0;

/* loaded from: classes2.dex */
public final class b extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ c f77622j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ o f77623k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ boolean f77624l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ t f77625m;
    public final /* synthetic */ long n;
    public final /* synthetic */ long o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ float f77626p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, o oVar, boolean z11, t tVar, long j11, long j12, float f11, int i5) {
        super(2);
        this.f77622j = cVar;
        this.f77623k = oVar;
        this.f77624l = z11;
        this.f77625m = tVar;
        this.n = j11;
        this.o = j12;
        this.f77626p = f11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = a0.l(1572865);
        this.f77622j.a(this.f77623k, this.f77624l, this.f77625m, this.n, this.o, this.f77626p, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
