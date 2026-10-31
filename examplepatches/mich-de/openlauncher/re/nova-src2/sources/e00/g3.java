package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class g3 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f50419a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ cw.r3 f50420b;

    public /* synthetic */ g3(cw.r3 r3Var) {
        this.f50420b = r3Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f50419a) {
            case 0:
                ((Integer) obj2).getClass();
                int iL = p1.a0.l(1);
                a.a.y(this.f50420b, (p1.o) obj, iL);
                break;
            default:
                this.f50420b.invoke();
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ g3(cw.r3 r3Var, int i5) {
        this.f50420b = r3Var;
    }
}
