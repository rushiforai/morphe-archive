package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cu extends co6 implements b55 {
    public static final cu A;
    public static final cu B;
    public static final cu C;
    public static final cu D;
    public static final cu E;
    public static final cu b;
    public static final cu c;
    public static final cu d;
    public static final cu e;
    public static final cu f;
    public static final cu g;
    public static final cu h;
    public static final cu i;
    public static final cu j;
    public static final cu k;
    public static final cu l;
    public static final cu m;
    public static final cu n;
    public static final cu o;
    public static final cu p;
    public static final cu q;
    public static final cu r;
    public static final cu s;
    public static final cu t;
    public static final cu u;
    public static final cu v;
    public static final cu w;
    public static final cu x;
    public static final cu y;
    public static final cu z;
    public final /* synthetic */ int a;

    static {
        int i2 = 2;
        b = new cu(i2, 0);
        c = new cu(i2, 1);
        d = new cu(i2, 2);
        e = new cu(i2, 3);
        f = new cu(i2, 4);
        g = new cu(i2, 5);
        h = new cu(i2, 6);
        i = new cu(i2, 7);
        j = new cu(i2, 8);
        k = new cu(i2, 9);
        l = new cu(i2, 10);
        m = new cu(i2, 11);
        n = new cu(i2, 12);
        o = new cu(i2, 13);
        p = new cu(i2, 14);
        q = new cu(i2, 15);
        r = new cu(i2, 16);
        s = new cu(i2, 17);
        t = new cu(i2, 18);
        u = new cu(i2, 19);
        v = new cu(i2, 20);
        w = new cu(i2, 21);
        x = new cu(i2, 22);
        y = new cu(i2, 23);
        z = new cu(i2, 24);
        A = new cu(i2, 25);
        B = new cu(i2, 26);
        C = new cu(i2, 27);
        D = new cu(i2, 28);
        E = new cu(i2, 29);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cu(int i2, int i3) {
        super(i2);
        this.a = i3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v10 */
    /* JADX WARN: Type inference failed for: r1v11, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v14, types: [o78] */
    /* JADX WARN: Type inference failed for: r1v23 */
    /* JADX WARN: Type inference failed for: r1v24 */
    /* JADX WARN: Type inference failed for: r1v25 */
    /* JADX WARN: Type inference failed for: r1v26 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r1v9 */
    /* JADX WARN: Type inference failed for: r5v8 */
    /* JADX WARN: Type inference failed for: r9v38 */
    /* JADX WARN: Type inference failed for: r9v39, types: [q28] */
    /* JADX WARN: Type inference failed for: r9v43 */
    /* JADX WARN: Type inference failed for: r9v44, types: [q28] */
    /* JADX WARN: Type inference failed for: r9v45, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r9v46 */
    /* JADX WARN: Type inference failed for: r9v47 */
    /* JADX WARN: Type inference failed for: r9v48 */
    /* JADX WARN: Type inference failed for: r9v49 */
    /* JADX WARN: Type inference failed for: r9v67 */
    /* JADX WARN: Type inference failed for: r9v68 */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i2 = this.a;
        int i3 = 0;
        z = false;
        boolean z2 = false;
        c1e c1eVar = c1e.a;
        switch (i2) {
            case 0:
                vc2.N((aq6) obj).setUpdateBlock((x45) obj2);
                return c1eVar;
            case 1:
                vc2.N((aq6) obj).setReleaseBlock((x45) obj2);
                return c1eVar;
            case 2:
                vc2.N((aq6) obj).setModifier((r28) obj2);
                return c1eVar;
            case 3:
                vc2.N((aq6) obj).setDensity((m73) obj2);
                return c1eVar;
            case 4:
                vc2.N((aq6) obj).setLifecycleOwner((iy6) obj2);
                return c1eVar;
            case 5:
                vc2.N((aq6) obj).setSavedStateRegistryOwner((hpb) obj2);
                return c1eVar;
            case 6:
                due dueVarN = vc2.N((aq6) obj);
                int i4 = fu.a[((ip6) obj2).ordinal()];
                if (i4 != 1) {
                    if (i4 != 2) {
                        ygf.a();
                        return null;
                    }
                    i3 = 1;
                }
                dueVarN.setLayoutDirection(i3);
                return c1eVar;
            case 7:
                long j2 = ((s46) obj).a;
                long j3 = ((s46) obj2).a;
                Map map = qwe.a;
                return f76.P(0.0f, 400.0f, new s46(4294967297L), 1);
            case 8:
                jz3 jz3Var = (jz3) obj2;
                if (((jz3) obj) == jz3Var && jz3Var == jz3.PostExit) {
                    z2 = true;
                }
                return Boolean.valueOf(z2);
            case 9:
                String str = (String) obj;
                p28 p28Var = (p28) obj2;
                if (str.length() == 0) {
                    return p28Var.toString();
                }
                return str + ", " + p28Var;
            case 10:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                }
                return c1eVar;
            case 11:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                }
                return c1eVar;
            case 12:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                }
                return c1eVar;
            case 13:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Number) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                }
                return c1eVar;
            case 14:
                ((Number) obj2).intValue();
                ((aq6) ((r12) obj)).getClass();
                return c1eVar;
            case 15:
                ((aq6) ((r12) obj)).c0((zk7) obj2);
                return c1eVar;
            case 16:
                ((aq6) ((r12) obj)).d0((r28) obj2);
                return c1eVar;
            case 17:
                w22 w22Var = (w22) obj2;
                aq6 aq6Var = (aq6) ((r12) obj);
                aq6Var.B = w22Var;
                hj0 hj0Var = aq6Var.F;
                sn3 sn3Var = z22.h;
                i89 i89Var = (i89) w22Var;
                i89Var.getClass();
                aq6Var.Z((m73) m40.U(i89Var, sn3Var));
                i89 i89Var2 = (i89) w22Var;
                ip6 ip6Var = (ip6) m40.U(i89Var2, z22.n);
                if (aq6Var.z != ip6Var) {
                    aq6Var.z = ip6Var;
                    aq6Var.E();
                    aq6 aq6VarV = aq6Var.v();
                    if (aq6VarV != null) {
                        aq6VarV.C();
                    } else {
                        mx8 mx8Var = aq6Var.n;
                        if (mx8Var != null) {
                            ((mn) mx8Var).invalidate();
                        }
                    }
                    aq6Var.D();
                    for (q28 q28Var = (q28) hj0Var.g; q28Var != null; q28Var = q28Var.f) {
                        q28Var.B0();
                    }
                }
                aq6Var.e0((zte) m40.U(i89Var2, z22.u));
                q28 q28Var2 = (q28) hj0Var.g;
                if ((q28Var2.d & 32768) != 0) {
                    while (q28Var2 != null) {
                        if ((q28Var2.c & 32768) != 0) {
                            ?? Q0 = q28Var2;
                            ?? o78Var = 0;
                            while (Q0 != 0) {
                                if (Q0 instanceof u22) {
                                    q28 q28Var3 = ((q28) ((u22) Q0)).a;
                                    if (q28Var3.n) {
                                        fh8.c(q28Var3);
                                    } else {
                                        q28Var3.j = true;
                                    }
                                } else if ((Q0.c & 32768) != 0 && (Q0 instanceof b43)) {
                                    q28 q28Var4 = ((b43) Q0).p;
                                    int i5 = 0;
                                    o78Var = o78Var;
                                    Q0 = Q0;
                                    while (q28Var4 != null) {
                                        if ((q28Var4.c & 32768) != 0) {
                                            i5++;
                                            o78Var = o78Var;
                                            if (i5 == 1) {
                                                Q0 = q28Var4;
                                            } else {
                                                if (o78Var == 0) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (Q0 != 0) {
                                                    o78Var.b(Q0);
                                                    Q0 = 0;
                                                }
                                                o78Var.b(q28Var4);
                                            }
                                        }
                                        q28Var4 = q28Var4.f;
                                        o78Var = o78Var;
                                        Q0 = Q0;
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                Q0 = flb.q0(o78Var);
                            }
                        }
                        if ((q28Var2.d & 32768) != 0) {
                            q28Var2 = q28Var2.f;
                        }
                    }
                }
                return c1eVar;
            case 18:
                Collection collection = (List) obj;
                List list = (List) obj2;
                if (collection == null) {
                    collection = ey3.a;
                }
                return bu1.Q0(list, collection);
            case 19:
                return (no) obj;
            case 20:
                List list2 = (List) obj;
                List list3 = (List) obj2;
                if (list2 == null) {
                    return list3;
                }
                ArrayList arrayList = new ArrayList(list2);
                arrayList.addAll(list3);
                return arrayList;
            case 21:
                return (z82) obj;
            case 22:
                return (th4) obj;
            case 23:
                return (c1e) obj;
            case 24:
                return (c1e) obj;
            case 25:
                throw new IllegalStateException("merge function called on unmergeable property IsDialog. A dialog should not be a child of a clickable/focusable node.");
            case 26:
                throw new IllegalStateException("merge function called on unmergeable property IsPopup. A popup should not be a child of a clickable/focusable node.");
            case 27:
                return (c1e) obj;
            case 28:
                throw new IllegalStateException("merge function called on unmergeable property PaneTitle.");
            default:
                vkb vkbVar = (vkb) obj;
                int i6 = ((vkb) obj2).a;
                return vkbVar;
        }
    }
}
