package n00;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.g9;

/* loaded from: classes4.dex */
public final class j implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final j f77570a = new j();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
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
                g9.b(x7.f.Y(oVar, 2132017237), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
            }
        }
        return Unit.f71706a;
    }
}
