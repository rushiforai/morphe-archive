package m1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class i0 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f75695j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f75696k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ m3.p0 f75697l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ Function2 f75698m;
    public final /* synthetic */ int n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i0(long j11, m3.p0 p0Var, Function2 function2, int i5, int i11) {
        super(2);
        this.f75695j = i11;
        this.f75696k = j11;
        this.f75697l = p0Var;
        this.f75698m = function2;
        this.n = i5;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f75695j) {
            case 0:
                ((Number) obj2).intValue();
                p7.u.l(this.f75696k, this.f75697l, this.f75698m, (p1.o) obj, p1.a0.l(this.n | 1));
                break;
            default:
                ((Number) obj2).intValue();
                r0.b(this.f75696k, this.f75697l, this.f75698m, (p1.o) obj, p1.a0.l(this.n | 1));
                break;
        }
        return Unit.f71706a;
    }
}
