package dv;

import cw.r3;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final class c implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final c f49598a = new c();

    /* JADX WARN: Removed duplicated region for block: B:8:0x001b  */
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
                Duration.Companion companion = Duration.f72038b;
                n nVar = new n(DurationKt.g(83, DurationUnit.f72046e), 2132020035, m.f49616a, false);
                p1.t tVar2 = (p1.t) oVar;
                tVar2.b0(-1701798424);
                Object objP = tVar2.P();
                if (objP == p1.n.f81514a) {
                    objP = new r3(10);
                    tVar2.m0(objP);
                }
                tVar2.p(false);
                ex.i.l(nVar, (Function0) objP, null, tVar2, 48, 4);
            }
        }
        return Unit.f71706a;
    }
}
