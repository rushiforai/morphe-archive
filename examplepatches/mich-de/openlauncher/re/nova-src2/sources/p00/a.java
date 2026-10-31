package p00;

import e10.z2;
import gy.v;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import k0.i2;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import l1.b3;
import l1.g9;
import l1.s1;
import m3.p0;
import p1.e1;
import p1.g1;
import p10.c0;

/* loaded from: classes4.dex */
public final class a implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final a f81251b = new a(0);

    /* renamed from: c, reason: collision with root package name */
    public static final a f81252c = new a(1);

    /* renamed from: d, reason: collision with root package name */
    public static final a f81253d = new a(2);

    /* renamed from: e, reason: collision with root package name */
    public static final a f81254e = new a(3);

    /* renamed from: f, reason: collision with root package name */
    public static final a f81255f = new a(4);

    /* renamed from: g, reason: collision with root package name */
    public static final a f81256g = new a(5);

    /* renamed from: h, reason: collision with root package name */
    public static final a f81257h = new a(6);

    /* renamed from: i, reason: collision with root package name */
    public static final a f81258i = new a(7);

    /* renamed from: j, reason: collision with root package name */
    public static final a f81259j = new a(8);

    /* renamed from: k, reason: collision with root package name */
    public static final a f81260k = new a(9);

    /* renamed from: l, reason: collision with root package name */
    public static final a f81261l = new a(10);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81262a;

    public /* synthetic */ a(int i5) {
        this.f81262a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:105:0x02c7  */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x02f5  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x0299  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f81262a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        ky.l.j(2132019035, 0, null, oVar, 0, 6);
                    }
                }
                break;
            case 1:
                p1.o oVar2 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar2 = (p1.t) oVar2;
                    if (tVar2.E()) {
                        tVar2.V();
                    } else {
                        i2.b(androidx.compose.foundation.layout.e.g(b2.r.f17024a, 24), oVar2);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar3 = (p1.t) oVar3;
                    if (tVar3.E()) {
                        tVar3.V();
                    } else {
                        ky.l.j(2132019194, 2132019195, null, oVar3, 0, 4);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar4 = (p1.t) oVar4;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        p1.t tVar5 = (p1.t) oVar4;
                        tVar5.b0(1193424142);
                        Object objP = tVar5.P();
                        g1 g1Var = p1.n.f81514a;
                        if (objP == g1Var) {
                            objP = androidx.compose.runtime.d.k(Boolean.FALSE);
                            tVar5.m0(objP);
                        }
                        e1 e1Var = (e1) objP;
                        tVar5.p(false);
                        tVar5.b0(1193433448);
                        Set<Map.Entry> setEntrySet = MapsKt.j0(new Pair(wy.h.f94897a, 2132017522), new Pair(wy.h.f94898b, 2132019491), new Pair(wy.h.f94899c, 2132017758)).entrySet();
                        ArrayList arrayList = new ArrayList(b70.c.u0(setEntrySet, 10));
                        for (Map.Entry entry : setEntrySet) {
                            arrayList.add(new v((wy.h) entry.getKey(), x7.f.Y(tVar5, ((Number) entry.getValue()).intValue())));
                        }
                        tVar5.p(false);
                        tVar5.b0(1193438431);
                        Object objP2 = tVar5.P();
                        if (objP2 == g1Var) {
                            objP2 = new o00.f(e1Var, 3);
                            tVar5.m0(objP2);
                        }
                        tVar5.p(false);
                        ky.l.d(androidx.compose.foundation.c.d(b2.r.f17024a, false, null, null, (Function0) objP2, 15), false, null, g.n, false, null, null, x1.f.d(723980547, new j00.f(11, arrayList, e1Var), tVar5), null, tVar5, 12585984, 374);
                    }
                }
                break;
            case 4:
                p1.o oVar5 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar6 = (p1.t) oVar5;
                    if (tVar6.E()) {
                        tVar6.V();
                    } else {
                        z2.l(oVar5, 0);
                    }
                }
                break;
            case 5:
                p1.o oVar6 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar7 = (p1.t) oVar6;
                    if (tVar7.E()) {
                        tVar7.V();
                    } else {
                        z2.d(null, 2132019166, 0, oVar6, 2);
                    }
                }
                break;
            case 6:
                p1.o oVar7 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar8 = (p1.t) oVar7;
                    if (tVar8.E()) {
                        tVar8.V();
                    } else {
                        z2.l(oVar7, 0);
                    }
                }
                break;
            case 7:
                p1.o oVar8 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar9 = (p1.t) oVar8;
                    if (tVar9.E()) {
                        tVar9.V();
                    } else {
                        z2.d(null, 2132017979, 0, oVar8, 2);
                    }
                }
                break;
            case 8:
                p1.o oVar9 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar10 = (p1.t) oVar9;
                    if (tVar10.E()) {
                        tVar10.V();
                    } else {
                        z2.l(oVar9, 0);
                    }
                }
                break;
            case 9:
                p1.o oVar10 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar11 = (p1.t) oVar10;
                    if (tVar11.E()) {
                        tVar11.V();
                    } else {
                        o2.g gVarG = c0.G();
                        String strY = x7.f.Y(oVar10, 2132019504);
                        p1.t tVar12 = (p1.t) oVar10;
                        tVar12.b0(-54848625);
                        long jB = ((p0) tVar12.j(g9.f73360a)).b();
                        if (jB == 16) {
                            jB = ((i2.s) tVar12.j(s1.f73932a)).f61148a;
                        }
                        long j11 = jB;
                        tVar12.p(false);
                        b3.b(gVarG, strY, null, j11, tVar12, 0, 4);
                    }
                }
                break;
            default:
                p1.o oVar11 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar13 = (p1.t) oVar11;
                    if (tVar13.E()) {
                        tVar13.V();
                    } else {
                        g9.b(x7.f.Y(oVar11, 2132019299), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, oVar11, 0, 0, 131070);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
