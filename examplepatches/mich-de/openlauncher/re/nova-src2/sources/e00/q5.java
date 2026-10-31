package e00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function6;

/* loaded from: classes4.dex */
public final class q5 implements Function6 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function2 f50913a;

    public q5(Function2 function2) {
        this.f50913a = function2;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0025  */
    @Override // kotlin.jvm.functions.Function6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        ((Number) obj4).intValue();
        p1.o oVar = (p1.o) obj5;
        if ((((Number) obj6).intValue() & 8193) == 8192) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                this.f50913a.invoke(oVar, 0);
            }
        }
        return Unit.f71706a;
    }
}
