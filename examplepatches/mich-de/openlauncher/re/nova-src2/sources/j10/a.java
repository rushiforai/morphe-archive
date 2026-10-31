package j10;

import b2.r;
import k0.p;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;
import p1.a0;
import p1.n1;
import p1.o;
import p1.t;
import z2.r0;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final a f68598a = new a();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0020  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        o oVar = (o) obj;
        if ((((Number) obj2).intValue() & 3) == 2) {
            t tVar = (t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                b2.t tVarJ = androidx.compose.foundation.layout.d.j(r.f17024a, 24);
                r0 r0VarD = p.d(b2.d.f16997a, false);
                t tVar2 = (t) oVar;
                int iHashCode = Long.hashCode(tVar2.T);
                n1 n1VarL = tVar2.l();
                b2.t tVarI = fg.a.I(tVarJ, oVar);
                b3.l.Po.getClass();
                Function0 function0 = b3.k.f17270b;
                tVar2.f0();
                if (tVar2.S) {
                    tVar2.k(function0);
                } else {
                    tVar2.p0();
                }
                a0.j(r0VarD, b3.k.f17275g, oVar);
                a0.j(n1VarL, b3.k.f17274f, oVar);
                b3.i iVar = b3.k.f17278j;
                if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                    a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                }
                a0.j(tVarI, b3.k.f17272d, oVar);
                g9.b(x7.f.Y(oVar, 2132018083), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                tVar2.p(true);
            }
        }
        return Unit.f71706a;
    }
}
