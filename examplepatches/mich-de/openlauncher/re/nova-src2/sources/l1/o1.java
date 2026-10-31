package l1;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class o1 extends Lambda implements Function3 {

    /* renamed from: j, reason: collision with root package name */
    public static final o1 f73729j = new o1(3);

    /* JADX WARN: Removed duplicated region for block: B:15:0x0035  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        y6 y6Var = (y6) obj;
        p1.o oVar = (p1.o) obj2;
        int iIntValue = ((Number) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((p1.t) oVar).f(y6Var) ? 4 : 2;
        }
        if ((iIntValue & 19) == 18) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                o7.b(y6Var, null, null, 0L, 0L, 0L, 0L, 0L, oVar, iIntValue & 14);
            }
        }
        return Unit.f71706a;
    }
}
