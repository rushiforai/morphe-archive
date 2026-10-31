package pu;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public static final a0 f83012a = new a0();

    /* JADX WARN: Removed duplicated region for block: B:23:0x0050  */
    @Override // kotlin.jvm.functions.Function4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        int i5;
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        Function0 onBack = (Function0) obj2;
        p1.o oVar = (p1.o) obj3;
        int iIntValue = ((Number) obj4).intValue();
        Intrinsics.g(onBack, "onBack");
        if ((iIntValue & 6) == 0) {
            i5 = (((p1.t) oVar).g(zBooleanValue) ? 4 : 2) | iIntValue;
        } else {
            i5 = iIntValue;
        }
        if ((iIntValue & 48) == 0) {
            i5 |= ((p1.t) oVar).h(onBack) ? 32 : 16;
        }
        if ((i5 & 147) == 146) {
            p1.t tVar = (p1.t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                p1.t tVar2 = (p1.t) oVar;
                tVar2.b0(-628952840);
                boolean z11 = (i5 & 112) == 32;
                Object objP = tVar2.P();
                if (z11 || objP == p1.n.f81514a) {
                    objP = new b20.v(onBack, 29);
                    tVar2.m0(objP);
                }
                tVar2.p(false);
                io.sentry.config.a.a(zBooleanValue, (Function0) objP, tVar2, i5 & 14);
            }
        }
        return Unit.f71706a;
    }
}
