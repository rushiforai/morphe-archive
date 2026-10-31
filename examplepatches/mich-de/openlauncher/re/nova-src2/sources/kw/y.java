package kw;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class y implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final y f72732a = new y();

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
                w3.h(new c3(2131232162, true, (n0.w) null, 10), false, androidx.compose.foundation.layout.e.o(b2.r.f17024a, 8), oVar, 432, 0);
            }
        }
        return Unit.f71706a;
    }
}
