package p10;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import l1.b3;

/* loaded from: classes4.dex */
public final class l implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final l f81814a = new l();

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
                b3.b(ex.i.w(), "Back", null, 0L, oVar, 48, 12);
            }
        }
        return Unit.f71706a;
    }
}
