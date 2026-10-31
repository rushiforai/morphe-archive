package gy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final /* synthetic */ class m1 implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f58435a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f1.w f58436b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Ref.FloatRef f58437c;

    public /* synthetic */ m1(f1.w wVar, Ref.FloatRef floatRef, int i5) {
        this.f58435a = i5;
        this.f58436b = wVar;
        this.f58437c = floatRef;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        c0.e eVar = (c0.e) obj;
        switch (this.f58435a) {
            case 0:
                float fFloatValue = ((Number) eVar.e()).floatValue();
                Ref.FloatRef floatRef = this.f58437c;
                this.f58436b.a(fFloatValue - floatRef.f71860a);
                floatRef.f71860a = ((Number) eVar.e()).floatValue();
                break;
            default:
                float fFloatValue2 = ((Number) eVar.e()).floatValue();
                Ref.FloatRef floatRef2 = this.f58437c;
                this.f58436b.a(fFloatValue2 - floatRef2.f71860a);
                floatRef2.f71860a = ((Number) eVar.e()).floatValue();
                break;
        }
        return Unit.f71706a;
    }
}
