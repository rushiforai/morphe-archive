package iy;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import p1.e1;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f68239a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f68240b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e1 f68241c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e1 f68242d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Object f68243e;

    public /* synthetic */ f(Function1 function1, e1 e1Var, e1 e1Var2, e1 e1Var3) {
        this.f68243e = function1;
        this.f68240b = e1Var;
        this.f68241c = e1Var2;
        this.f68242d = e1Var3;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        int i5 = this.f68239a;
        e1 e1Var = this.f68242d;
        e1 e1Var2 = this.f68241c;
        e1 e1Var3 = this.f68240b;
        Object obj4 = this.f68243e;
        switch (i5) {
            case 0:
                Float f11 = (Float) obj;
                f11.getClass();
                Float f12 = (Float) obj2;
                f12.getClass();
                Float f13 = (Float) obj3;
                f13.getClass();
                e1Var3.setValue(f11);
                e1Var2.setValue(f12);
                e1Var.setValue(f13);
                int i11 = i2.s.n;
                ((e1) obj4).setValue(new i2.s(lm.e.r(((Number) e1Var3.getValue()).floatValue(), ((Number) e1Var2.getValue()).floatValue(), ((Number) e1Var.getValue()).floatValue())));
                break;
            default:
                Float f14 = (Float) obj;
                f14.getClass();
                Float f15 = (Float) obj2;
                f15.getClass();
                Float f16 = (Float) obj3;
                f16.getClass();
                e1Var3.setValue(f14);
                e1Var2.setValue(f15);
                e1Var.setValue(f16);
                int i12 = i2.s.n;
                ((Function1) obj4).invoke(new i2.s(lm.e.r(((Number) e1Var3.getValue()).floatValue(), ((Number) e1Var2.getValue()).floatValue(), ((Number) e1Var.getValue()).floatValue())));
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ f(e1 e1Var, e1 e1Var2, e1 e1Var3, e1 e1Var4) {
        this.f68240b = e1Var;
        this.f68241c = e1Var2;
        this.f68242d = e1Var3;
        this.f68243e = e1Var4;
    }
}
