package h00;

import b2.r;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import l1.b3;
import l1.g9;
import p1.t;

/* loaded from: classes4.dex */
public final class a implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f58762a = new a();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0024  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        p1.o oVar = (p1.o) obj2;
        if ((((Number) obj3).intValue() & 17) == 16) {
            t tVar = (t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                b3.b(i30.j.D(), null, null, 0L, oVar, 48, 12);
                g9.b(x7.f.Y(oVar, 2132017721), androidx.compose.foundation.layout.d.n(r.f17024a, 8, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 48, 0, 131068);
            }
        }
        return Unit.f71706a;
    }
}
