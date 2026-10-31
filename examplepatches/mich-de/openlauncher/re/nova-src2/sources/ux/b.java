package ux;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.g9;

/* loaded from: classes4.dex */
public final class b implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final b f91603a = new b();

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
                g9.b(x7.f.Y(oVar, 2132018896), null, i2.s.b(0.6f, i2.s.f61140f), 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 384, 0, 131066);
            }
        }
        return Unit.f71706a;
    }
}
