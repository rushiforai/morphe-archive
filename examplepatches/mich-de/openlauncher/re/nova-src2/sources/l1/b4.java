package l1;

import java.util.LinkedHashMap;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class b4 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ float f73054j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ long f73055k;

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ f6 f73056l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b4(float f11, long j11, f6 f6Var) {
        super(1);
        this.f73054j = f11;
        this.f73055k = j11;
        this.f73056l = f6Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        m1.r rVar = (m1.r) obj;
        float f11 = this.f73054j;
        Float fValueOf = Float.valueOf(f11);
        LinkedHashMap linkedHashMap = rVar.f75745a;
        LinkedHashMap linkedHashMap2 = rVar.f75745a;
        linkedHashMap.put(g6.f73348a, fValueOf);
        int i5 = (int) (this.f73055k & 4294967295L);
        float f12 = i5;
        if (f12 > f11 / 2 && !this.f73056l.f73300a) {
            linkedHashMap2.put(g6.f73350c, Float.valueOf(f11 / 2.0f));
        }
        if (i5 != 0) {
            linkedHashMap2.put(g6.f73349b, Float.valueOf(Math.max(0.0f, f11 - f12)));
        }
        return Unit.f71706a;
    }
}
