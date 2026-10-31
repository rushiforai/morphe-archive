package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class e5 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function0 f73249j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f73250k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f73251l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f73252m;
    public final /* synthetic */ long n;
    public final /* synthetic */ int o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ float f73253p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e5(Function0 function0, b2.t tVar, long j11, float f11, long j12, int i5, float f12, int i11) {
        super(2);
        this.f73249j = function0;
        this.f73250k = tVar;
        this.f73251l = j11;
        this.f73252m = f11;
        this.n = j12;
        this.o = i5;
        this.f73253p = f12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(3121);
        l5.a(this.f73249j, this.f73250k, this.f73251l, this.f73252m, this.n, this.o, this.f73253p, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
