package ys;

import f1.e2;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class j implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final j f97489a = new j();

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
                n2.c cVarV = ul.b.V(2131232196, oVar, 0);
                String strY = x7.f.Y(oVar, 2132019768);
                p1.t tVar2 = (p1.t) oVar;
                tVar2.b0(-443512897);
                os.b bVar = (os.b) tVar2.j(os.g.f80779c);
                tVar2.p(false);
                e2.a(cVarV, strY, androidx.compose.foundation.layout.e.o(b2.r.f17024a, 24), bVar.f80757w, oVar, 384, 0);
            }
        }
        return Unit.f71706a;
    }
}
