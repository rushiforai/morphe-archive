package bu;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18606a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f18607b;

    public /* synthetic */ x(u uVar, int i5, int i11) {
        this.f18606a = i11;
        this.f18607b = uVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f18606a;
        p1.o oVar = (p1.o) obj;
        ((Integer) obj2).getClass();
        switch (i5) {
            case 0:
                a0.a(this.f18607b, oVar, p1.a0.l(9));
                break;
            default:
                a0.e(this.f18607b, oVar, p1.a0.l(9));
                break;
        }
        return Unit.f71706a;
    }
}
