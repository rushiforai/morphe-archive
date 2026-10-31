package xs;

import b2.r;
import cw.l2;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import p1.t;

/* loaded from: classes4.dex */
public final class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final c f96235a = new c();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        if ((((Number) obj2).intValue() & 3) == 2) {
            t tVar = (t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                b2.t tVarJ = androidx.compose.foundation.layout.d.j(r.f17024a, 16);
                s0.g gVarC = s0.h.c(24);
                t tVar2 = (t) oVar;
                tVar2.b0(-443512897);
                os.b bVar = (os.b) tVar2.j(os.g.f80779c);
                tVar2.p(false);
                l2.j(tVarJ, gVarC, bVar.f80738b, 0L, null, 0.0f, d.f96238c, oVar, 1572870, 56);
            }
        }
        return Unit.f71706a;
    }
}
