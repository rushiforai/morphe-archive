package e10;

import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class t implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final t f51817b = new t(0);

    /* renamed from: c, reason: collision with root package name */
    public static final t f51818c = new t(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f51819a;

    public /* synthetic */ t(int i5) {
        this.f51819a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00d6  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f51819a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        z2.g(54, 0, androidx.compose.foundation.layout.d.l(b2.r.f17024a, 6, 0.0f, 2), "Nova Launcher", oVar);
                    }
                }
                break;
            default:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        o2.g gVarC = t2.c.f88475a;
                        if (gVarC == null) {
                            o2.e eVar = new o2.e("Outlined.Warning", 24.0f, 24.0f, 24.0f, 24.0f, 0L, 0, false, 96);
                            EmptyList emptyList = o2.k0.f79316a;
                            i2.x0 x0Var = new i2.x0(i2.s.f61136b);
                            o2.h hVar = new o2.h(0);
                            hVar.o(1.0f, 21.0f);
                            hVar.l(22.0f);
                            hVar.m(12.0f, 2.0f);
                            hVar.m(1.0f, 21.0f);
                            hVar.g();
                            hVar.o(13.0f, 18.0f);
                            hVar.l(-2.0f);
                            hVar.u(-2.0f);
                            hVar.l(2.0f);
                            hVar.u(2.0f);
                            hVar.g();
                            hVar.o(13.0f, 14.0f);
                            hVar.l(-2.0f);
                            hVar.u(-4.0f);
                            hVar.l(2.0f);
                            hVar.u(4.0f);
                            hVar.g();
                            o2.e.b(eVar, hVar.f79265a, x0Var, 1.0f, null);
                            gVarC = eVar.c();
                            t2.c.f88475a = gVarC;
                        }
                        l1.b3.b(gVarC, null, null, 0L, oVar2, 48, 12);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
