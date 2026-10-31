package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class f5 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ long f73294j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ k2.k f73295k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f73296l;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ p1.y2 f73297m;
    public final /* synthetic */ p1.y2 n;
    public final /* synthetic */ p1.y2 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ float f73298p;

    /* renamed from: q, reason: collision with root package name */
    public final /* synthetic */ long f73299q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f5(float f11, long j11, long j12, c0.j0 j0Var, c0.j0 j0Var2, c0.j0 j0Var3, c0.j0 j0Var4, k2.k kVar) {
        super(1);
        this.f73294j = j11;
        this.f73295k = kVar;
        this.f73296l = j0Var;
        this.f73297m = j0Var2;
        this.n = j0Var3;
        this.o = j0Var4;
        this.f73298p = f11;
        this.f73299q = j12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        float f11;
        k2.f fVar = (k2.f) obj;
        long j11 = this.f73294j;
        k2.k kVar = this.f73295k;
        l5.e(fVar, 0.0f, 360.0f, j11, kVar);
        float fFloatValue = (((Number) this.f73296l.getValue()).floatValue() * 216.0f) % 360.0f;
        float fFloatValue2 = ((Number) this.f73297m.getValue()).floatValue();
        p1.y2 y2Var = this.n;
        float fAbs = Math.abs(fFloatValue2 - ((Number) y2Var.getValue()).floatValue());
        float fFloatValue3 = ((Number) y2Var.getValue()).floatValue() + ((Number) this.o.getValue()).floatValue() + (fFloatValue - 90.0f);
        if (kVar.f70874c == 0) {
            f11 = 0.0f;
        } else {
            f11 = ((this.f73298p / (l5.f73588e / 2)) * 57.29578f) / 2.0f;
        }
        l5.e(fVar, fFloatValue3 + f11, Math.max(fAbs, 0.1f), this.f73299q, kVar);
        return Unit.f71706a;
    }
}
