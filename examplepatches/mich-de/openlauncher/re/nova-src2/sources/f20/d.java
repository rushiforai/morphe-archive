package f20;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import p1.e1;
import z2.y;

/* loaded from: classes.dex */
public final /* synthetic */ class d implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54261a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e1 f54262b;

    public /* synthetic */ d(e1 e1Var, int i5) {
        this.f54261a = i5;
        this.f54262b = e1Var;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f54261a) {
            case 0:
                this.f54262b.setValue((y) obj);
                return Unit.f71706a;
            default:
                Float f11 = (Float) obj;
                f11.getClass();
                return Float.valueOf(((Number) ((Function1) this.f54262b.getValue()).invoke(f11)).floatValue());
        }
    }
}
