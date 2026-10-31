package f00;

import cl.l0;
import e10.z2;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import l1.b3;
import p1.n1;
import z2.r0;

/* loaded from: classes4.dex */
public final class f implements Function2 {

    /* renamed from: b, reason: collision with root package name */
    public static final f f53257b = new f(0);

    /* renamed from: c, reason: collision with root package name */
    public static final f f53258c = new f(1);

    /* renamed from: d, reason: collision with root package name */
    public static final f f53259d = new f(2);

    /* renamed from: e, reason: collision with root package name */
    public static final f f53260e = new f(3);

    /* renamed from: f, reason: collision with root package name */
    public static final f f53261f = new f(4);

    /* renamed from: g, reason: collision with root package name */
    public static final f f53262g = new f(5);

    /* renamed from: h, reason: collision with root package name */
    public static final f f53263h = new f(6);

    /* renamed from: i, reason: collision with root package name */
    public static final f f53264i = new f(7);

    /* renamed from: j, reason: collision with root package name */
    public static final f f53265j = new f(8);

    /* renamed from: k, reason: collision with root package name */
    public static final f f53266k = new f(9);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f53267a;

    public /* synthetic */ f(int i5) {
        this.f53267a = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x01cb  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f53267a) {
            case 0:
                p1.o oVar = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar = (p1.t) oVar;
                    if (tVar.E()) {
                        tVar.V();
                    } else {
                        b3.b(l0.D(), x7.f.Y(oVar, 2132017718), null, 0L, oVar, 0, 12);
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
                        b2.t tVarJ = androidx.compose.foundation.layout.d.j(b2.r.f17024a, 24);
                        r0 r0VarD = k0.p.d(b2.d.f16997a, false);
                        p1.t tVar3 = (p1.t) oVar2;
                        int iHashCode = Long.hashCode(tVar3.T);
                        n1 n1VarL = tVar3.l();
                        b2.t tVarI = fg.a.I(tVarJ, oVar2);
                        b3.l.Po.getClass();
                        Function0 function0 = b3.k.f17270b;
                        tVar3.f0();
                        if (tVar3.S) {
                            tVar3.k(function0);
                        } else {
                            tVar3.p0();
                        }
                        p1.a0.j(r0VarD, b3.k.f17275g, oVar2);
                        p1.a0.j(n1VarL, b3.k.f17274f, oVar2);
                        b3.i iVar = b3.k.f17278j;
                        if (tVar3.S || !Intrinsics.b(tVar3.P(), Integer.valueOf(iHashCode))) {
                            a2.c.u(iHashCode, tVar3, iHashCode, iVar);
                        }
                        p1.a0.j(tVarI, b3.k.f17272d, oVar2);
                        ky.l.j(2132019004, 2132019008, null, oVar2, 0, 4);
                        tVar3.p(true);
                    }
                }
                break;
            case 2:
                p1.o oVar3 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar4 = (p1.t) oVar3;
                    if (tVar4.E()) {
                        tVar4.V();
                    } else {
                        z2.l(oVar3, 0);
                    }
                }
                break;
            case 3:
                p1.o oVar4 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar5 = (p1.t) oVar4;
                    if (tVar5.E()) {
                        tVar5.V();
                    } else {
                        z2.d(null, 2132017251, 0, oVar4, 2);
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
                        z2.d(null, 2132019504, 0, oVar5, 2);
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
                        z2.l(oVar6, 0);
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
                        ky.l.j(2132017962, 2132017963, null, oVar7, 0, 4);
                    }
                }
                break;
            case 7:
                p1.o oVar8 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar9 = (p1.t) oVar8;
                    if (tVar9.E()) {
                        tVar9.V();
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
            default:
                p1.o oVar10 = (p1.o) obj;
                if ((((Number) obj2).intValue() & 3) == 2) {
                    p1.t tVar11 = (p1.t) oVar10;
                    if (tVar11.E()) {
                        tVar11.V();
                    } else {
                        z2.d(null, 2132019166, 0, oVar10, 2);
                    }
                }
                break;
        }
        return Unit.f71706a;
    }
}
