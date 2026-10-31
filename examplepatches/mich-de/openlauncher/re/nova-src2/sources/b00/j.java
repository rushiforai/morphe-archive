package b00;

import e10.z2;
import k0.i2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;

/* loaded from: classes.dex */
public final class j implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final j f16371b = new j(0);

    /* renamed from: c, reason: collision with root package name */
    public static final j f16372c = new j(1);

    /* renamed from: d, reason: collision with root package name */
    public static final j f16373d = new j(2);

    /* renamed from: e, reason: collision with root package name */
    public static final j f16374e = new j(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16375a;

    public /* synthetic */ j(int i5) {
        this.f16375a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00db  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f16375a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                ((Number) obj3).intValue();
                b2.r rVar = b2.r.f17024a;
                b2.t tVarV = androidx.compose.foundation.layout.e.v(rVar, 0.0f, 600, 1);
                k0.x xVarA = k0.w.a(k0.k.f70657c, b2.d.f17009m, oVar, 0);
                p1.t tVar = (p1.t) oVar;
                int iHashCode = Long.hashCode(tVar.T);
                p1.n1 n1VarL = tVar.l();
                b2.t tVarI = fg.a.I(tVarV, oVar);
                b3.l.Po.getClass();
                Function0 function0 = b3.k.f17270b;
                tVar.f0();
                if (tVar.S) {
                    tVar.k(function0);
                } else {
                    tVar.p0();
                }
                p1.a0.j(xVarA, b3.k.f17275g, oVar);
                p1.a0.j(n1VarL, b3.k.f17274f, oVar);
                b3.i iVar = b3.k.f17278j;
                if (tVar.S || !Intrinsics.b(tVar.P(), Integer.valueOf(iHashCode))) {
                    a2.c.u(iHashCode, tVar, iHashCode, iVar);
                }
                p1.a0.j(tVarI, b3.k.f17272d, oVar);
                i2.b(androidx.compose.foundation.layout.e.g(rVar, 20), oVar);
                bh.g.m(oVar, 0);
                tVar.p(true);
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132017232), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 2132017210), z2.z(b2.r.f17024a, 0.38f), 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 48, 0, 131068);
                    }
                }
                break;
            default:
                p1.o oVar4 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar4 = (p1.t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 2132017977), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
