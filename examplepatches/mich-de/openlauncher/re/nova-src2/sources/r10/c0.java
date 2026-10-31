package r10;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c0 implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f85122b = new c0(0);

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f85123c = new c0(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85124a;

    public /* synthetic */ c0(int i5) {
        this.f85124a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x003e  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f85124a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        float f11 = 8;
                        b2.r rVar = b2.r.f17024a;
                        b2.t tVarN = androidx.compose.foundation.layout.d.n(rVar, 0.0f, f11, 0.0f, f11, 5);
                        z2.r0 r0VarD = k0.p.d(b2.d.f16997a, false);
                        p1.t tVar2 = (p1.t) oVar;
                        int iHashCode = Long.hashCode(tVar2.T);
                        p1.n1 n1VarL = tVar2.l();
                        b2.t tVarI = fg.a.I(tVarN, oVar);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar2.f0();
                        if (tVar2.S) {
                            tVar2.k(function0);
                        } else {
                            tVar2.p0();
                        }
                        p1.a0.j(r0VarD, b3.k.f17275g, oVar);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar2.S || !Intrinsics.b(tVar2.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar2, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar);
                        dx.t.a("app_drawer");
                        com.google.android.gms.internal.consent_sdk.e0.f(com.google.android.gms.internal.consent_sdk.k0.B("app_drawer", oVar, 6), androidx.compose.foundation.layout.e.e(rVar, 1.0f), qx.k.b(qx.l.f84547i, null, 6), null, null, oVar, 56, 24);
                        tVar2.p(true);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
