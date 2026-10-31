package hv;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class v implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final v f60628a = new v();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
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
                f1.e2.a(ul.b.V(2131232231, oVar, 0), x7.f.Y(oVar, 2132019903), null, hw.r.k(oVar).f60760h, oVar, 0, 4);
            }
        }
        return Unit.f71706a;
    }
}
