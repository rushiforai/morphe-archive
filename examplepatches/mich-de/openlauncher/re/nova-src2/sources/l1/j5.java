package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class j5 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f73495j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ float f73496k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ Function0 f73497l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ long f73498m;
    public final /* synthetic */ long n;
    public final /* synthetic */ Function1 o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j5(int i5, float f11, Function0 function0, long j11, long j12, Function1 function1) {
        super(1);
        this.f73495j = i5;
        this.f73496k = f11;
        this.f73497l = function0;
        this.f73498m = j11;
        this.n = j12;
        this.o = function1;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        k2.f fVar = (k2.f) obj;
        float fB = h2.e.b(fVar.mo94getSizeNHjbRc());
        int i5 = this.f73495j;
        float fMo98toDpu2uoSUM = this.f73496k;
        if (i5 != 0 && h2.e.b(fVar.mo94getSizeNHjbRc()) <= h2.e.d(fVar.mo94getSizeNHjbRc())) {
            fMo98toDpu2uoSUM += fVar.mo98toDpu2uoSUM(fB);
        }
        float fMo98toDpu2uoSUM2 = fMo98toDpu2uoSUM / fVar.mo98toDpu2uoSUM(h2.e.d(fVar.mo94getSizeNHjbRc()));
        float fFloatValue = ((Number) this.f73497l.invoke()).floatValue();
        float fMin = Math.min(fFloatValue, fMo98toDpu2uoSUM2) + fFloatValue;
        if (fMin <= 1.0f) {
            l5.d(fVar, fMin, 1.0f, this.f73498m, fB, this.f73495j);
        }
        l5.d(fVar, 0.0f, fFloatValue, this.n, fB, this.f73495j);
        this.o.invoke(fVar);
        return Unit.f71706a;
    }
}
