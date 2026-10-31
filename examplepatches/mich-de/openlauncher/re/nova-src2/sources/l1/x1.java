package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class x1 extends Lambda implements Function2 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ b2.t f74218j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ float f74219k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ long f74220l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f74221m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x1(b2.t tVar, float f11, long j11, int i5, int i11) {
        super(2);
        this.f74218j = tVar;
        this.f74219k = f11;
        this.f74220l = j11;
        this.f74221m = i11;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((Number) obj2).intValue();
        int iL = p1.a0.l(1);
        int i5 = this.f74221m;
        p5.e(this.f74218j, this.f74219k, this.f74220l, (p1.o) obj, iL, i5);
        return Unit.f71706a;
    }
}
