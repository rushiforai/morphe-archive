package z2;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class q1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f98137j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ Function2 f98138k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f98139l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f98140m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q1(b2.t tVar, Function2 function2, int i5, int i11) {
        super(2);
        this.f98137j = tVar;
        this.f98138k = function2;
        this.f98139l = i5;
        this.f98140m = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(this.f98139l | 1);
        int i5 = this.f98140m;
        r1.a(this.f98137j, this.f98138k, (p1.o) obj, iL, i5);
        return Unit.f71706a;
    }
}
