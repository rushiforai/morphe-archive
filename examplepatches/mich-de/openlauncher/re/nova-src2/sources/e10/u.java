package e10;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class u implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final u f51834a = new u();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        p1.o oVar = (p1.o) obj2;
        if ((((Number) obj3).intValue() & 17) == 16) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                l1.i0.a(v.f51846a, null, null, null, 0.0f, 0.0f, null, null, null, oVar, 6, 510);
            }
        }
        return Unit.f71706a;
    }
}
