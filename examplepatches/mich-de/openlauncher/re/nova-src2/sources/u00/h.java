package u00;

import e10.s2;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.reflect.KProperty;
import l1.g9;

/* loaded from: classes4.dex */
public final class h implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final h f90236b = new h(0);

    /* renamed from: c, reason: collision with root package name */
    public static final h f90237c = new h(1);

    /* renamed from: d, reason: collision with root package name */
    public static final h f90238d = new h(2);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90239a;

    public /* synthetic */ h(int i5) {
        this.f90239a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00e5  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f90239a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        g9.b(x7.f.Y(oVar, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar, 0, 0, 131070);
                    }
                }
                break;
            case 1:
                ((Number) obj3).intValue();
                x1.e eVar = i.f90240a;
                y2.f51877a.getClass();
                s2 s2Var = y2.B1;
                KProperty kProperty = y2.f51881b[127];
                s2Var.getClass();
                p1.t tVar2 = (p1.t) ((p1.o) obj2);
                tVar2.b0(-1180187305);
                q00.l lVar = new q00.l(s2Var, androidx.compose.runtime.d.a(s2Var.c(), s2Var.l(), null, tVar2, 0, 2));
                Object objF = a2.c.f(-1874501460, tVar2, false);
                if (objF == p1.n.f81514a) {
                    objF = new t00.s(6);
                    tVar2.m0(objF);
                }
                tVar2.p(false);
                bh.g.c(eVar, lVar, null, (Function2) objF, tVar2, 24582, 12);
                break;
            default:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        g9.b(x7.f.Y(oVar2, 2132019397), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar2, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
