package d20;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class s implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final s f48925a = new s();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001b  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        if ((((Number) obj2).intValue() & 3) == 2) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                p6.u.a(oVar, 0);
            }
        }
        return Unit.f71706a;
    }
}
