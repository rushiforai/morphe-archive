package j00;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;

/* loaded from: classes4.dex */
public final class t implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final t f68567a = new t();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0024  */
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
                g9.b(x7.f.Y(oVar, 2132019442), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
            }
        }
        return Unit.f71706a;
    }
}
