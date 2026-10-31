package f0;

import b2.r;
import i2.r0;
import k0.p;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import p1.o;
import p1.t;

/* loaded from: classes2.dex */
public final class a implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f53196a = new a();

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        c cVar = (c) obj;
        o oVar = (o) obj2;
        int iIntValue = ((Number) obj3).intValue();
        if ((iIntValue & 6) == 0) {
            iIntValue |= ((t) oVar).f(cVar) ? 4 : 2;
        }
        t tVar = (t) oVar;
        if (tVar.S(iIntValue & 1, (iIntValue & 19) != 18)) {
            p.a(androidx.compose.foundation.a.b(androidx.compose.foundation.layout.e.g(androidx.compose.foundation.layout.e.e(androidx.compose.foundation.layout.d.l(r.f17024a, 0.0f, e.f53215l, 1), 1.0f), e.f53214k), cVar.f53200c, r0.f61135a), tVar, 0);
        } else {
            tVar.V();
        }
        return Unit.f71706a;
    }
}
