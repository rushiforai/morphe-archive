package p00;

import cw.l2;
import e10.n2;
import e10.s2;
import e10.y2;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.reflect.KProperty;
import l1.g9;

/* loaded from: classes4.dex */
public final class d implements Function3 {

    /* renamed from: b, reason: collision with root package name */
    public static final d f81284b = new d(0);

    /* renamed from: c, reason: collision with root package name */
    public static final d f81285c = new d(1);

    /* renamed from: d, reason: collision with root package name */
    public static final d f81286d = new d(2);

    /* renamed from: e, reason: collision with root package name */
    public static final d f81287e = new d(3);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81288a;

    public /* synthetic */ d(int i5) {
        this.f81288a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0148  */
    @Override // kotlin.jvm.functions.Function3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f81288a) {
            case 0:
                p1.o oVar = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        mc0.d.f76206a.m("Composing horizontal_scroll", new Object[0]);
                        String strY = x7.f.Y(oVar, 2132019247);
                        String strY2 = x7.f.Y(oVar, 2132019248);
                        y2 y2Var = y2.f51877a;
                        y2Var.getClass();
                        s2 s2Var = y2.B0;
                        KProperty kProperty = y2.f51881b[74];
                        s2Var.getClass();
                        bh.g.b(strY, s2Var, null, false, false, strY2, null, null, null, oVar, 0, 476);
                        s2 s2VarQ = y2Var.Q();
                        p1.t tVar2 = (p1.t) oVar;
                        tVar2.b0(-1180187305);
                        q00.l lVar = new q00.l(s2VarQ, androidx.compose.runtime.d.a(s2VarQ.c(), s2VarQ.l(), null, tVar2, 0, 2));
                        tVar2.p(false);
                        l2.d(lVar, oVar, 0);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar3 = (p1.t) oVar2;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        mc0.d.f76206a.m("Composing advanced", new Object[0]);
                        String strY3 = x7.f.Y(oVar2, 2132019168);
                        String strY4 = x7.f.Y(oVar2, 2132019169);
                        y2.f51877a.getClass();
                        s2 s2Var2 = y2.C0;
                        KProperty[] kPropertyArr = y2.f51881b;
                        KProperty kProperty2 = kPropertyArr[75];
                        s2Var2.getClass();
                        bh.g.b(strY3, s2Var2, null, false, false, strY4, null, null, null, oVar2, 0, 476);
                        String strY5 = x7.f.Y(oVar2, 2132019198);
                        String strY6 = x7.f.Y(oVar2, 2132019199);
                        n2 n2Var = y2.D0;
                        KProperty kProperty3 = kPropertyArr[76];
                        n2Var.getClass();
                        bh.g.b(strY5, n2Var, null, false, false, strY6, null, null, null, oVar2, 0, 476);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar4 = (p1.t) oVar3;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        g9.b(x7.f.Y(oVar3, 17039370), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar3, 0, 0, 131070);
                    }
                }
                break;
            default:
                p1.o oVar4 = (p1.o) obj2;
                if ((((Number) obj3).intValue() & 17) == 16) {
                    p1.t tVar5 = (p1.t) oVar4;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        g9.b(x7.f.Y(oVar4, 17039360), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar4, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
