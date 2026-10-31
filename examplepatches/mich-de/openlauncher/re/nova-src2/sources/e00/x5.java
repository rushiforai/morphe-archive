package e00;

import java.util.List;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final /* synthetic */ class x5 implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51161a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q00.l f51162b;

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int i5 = this.f51161a;
        q00.l lVar = this.f51162b;
        switch (i5) {
            case 0:
                ((Integer) obj2).getClass();
                cw.l2.d(lVar, (p1.o) obj, p1.a0.l(1));
                break;
            default:
                ((Boolean) obj).booleanValue();
                if (((Boolean) obj2).booleanValue()) {
                    e10.q qVar = e10.q.f51751d;
                    List list = u00.t.f90314a;
                    lVar.setValue(qVar);
                }
                u00.t.c();
                break;
        }
        return Unit.f71706a;
    }

    public /* synthetic */ x5(q00.l lVar, int i5) {
        this.f51162b = lVar;
    }
}
