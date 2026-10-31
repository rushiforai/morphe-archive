package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class d8 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ e8 f73194j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ b2.t f73195k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f73196l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73197m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d8(e8 e8Var, b2.t tVar, float f11, long j11, int i5) {
        super(2);
        this.f73194j = e8Var;
        this.f73195k = tVar;
        this.f73196l = f11;
        this.f73197m = j11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(3073);
        this.f73194j.a(this.f73195k, this.f73196l, this.f73197m, (p1.o) obj, iL);
        return Unit.f71706a;
    }
}
