package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class d5 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ Function0 f73185j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ int f73186k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ float f73187l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ float f73188m;
    public final /* synthetic */ long n;
    public final /* synthetic */ k2.k o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ long f73189p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d5(Function0 function0, int i5, float f11, float f12, long j11, k2.k kVar, long j12) {
        super(1);
        this.f73185j = function0;
        this.f73186k = i5;
        this.f73187l = f11;
        this.f73188m = f12;
        this.n = j11;
        this.o = kVar;
        this.f73189p = j12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        k2.f fVar = (k2.f) obj;
        float fFloatValue = ((Number) this.f73185j.invoke()).floatValue() * 360.0f;
        int i5 = this.f73186k;
        float f11 = this.f73187l;
        if (i5 != 0 && h2.e.b(fVar.mo94getSizeNHjbRc()) <= h2.e.d(fVar.mo94getSizeNHjbRc())) {
            f11 += this.f73188m;
        }
        float fMo98toDpu2uoSUM = (f11 / ((float) (fVar.mo98toDpu2uoSUM(h2.e.d(fVar.mo94getSizeNHjbRc())) * 3.141592653589793d))) * 360.0f;
        float fMin = Math.min(fFloatValue, fMo98toDpu2uoSUM) + 270.0f + fFloatValue;
        float fMin2 = (360.0f - fFloatValue) - (Math.min(fFloatValue, fMo98toDpu2uoSUM) * 2);
        long j11 = this.n;
        k2.k kVar = this.o;
        l5.e(fVar, fMin, fMin2, j11, kVar);
        l5.e(fVar, 270.0f, fFloatValue, this.f73189p, kVar);
        return Unit.f71706a;
    }
}
