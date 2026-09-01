package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.facebook.FacebookException;
import com.medium.proto.event.YourStoriesPageViewed;
import com.medium.reader.R;
import j$.util.DesugarTimeZone;
import java.io.File;
import java.util.AbstractCollection;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;
import kotlinx.coroutines.internal.DiagnosticCoroutineContextException;
import kotlinx.coroutines.internal.ExceptionSuccessfullyProcessed;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class pwd {
    public static final mz1 a = new mz1(new a02(2), false, -1486699551);
    public static final mz1 b = new mz1(new f02(21), false, 1641953589);
    public static final mz1 c = new mz1(new f02(22), false, -802831678);
    public static final mz1 d = new mz1(new c02(27), false, 1936136599);
    public static final mz1 e = new mz1(new c02(28), false, 332677717);
    public static final mz1 f = new mz1(new f02(23), false, 1712352176);
    public static final mz1 g = new mz1(new f02(24), false, -1236860913);
    public static final mz1 h = new mz1(new u02(0), false, 2100921854);
    public static final String[] i = {"standard", "accelerate", "decelerate", "linear"};
    public static final kkb j = new kkb(0.16f, 0.1f, 0.08f, 0.1f);
    public static final /* synthetic */ int k = 0;

    public static r28 A(r28 r28Var) {
        rd6 rd6Var = vc2.i;
        float f2 = vc2.j;
        return r28Var.b(new ui7(1200, rd6Var, 30.0f));
    }

    public static void B(int i2, Object obj) {
        if (obj == null || S(i2, obj)) {
            return;
        }
        b0("kotlin.jvm.functions.Function" + i2, obj);
        throw null;
    }

    public static final void C(Calendar calendar) {
        calendar.getClass();
        calendar.set(5, 1);
        calendar.set(11, 0);
        calendar.set(12, 0);
        calendar.set(13, 0);
        calendar.set(14, 0);
    }

    public static int D(Comparable comparable, Comparable comparable2) {
        if (comparable == comparable2) {
            return 0;
        }
        if (comparable == null) {
            return -1;
        }
        if (comparable2 == null) {
            return 1;
        }
        return comparable.compareTo(comparable2);
    }

    public static iy1 E(String str, String str2) {
        rj0 rj0Var = new rj0(str, str2);
        hy1 hy1VarB = iy1.b(rj0.class);
        hy1VarB.e = 1;
        hy1VarB.f = new gy1(0, rj0Var);
        return hy1VarB.b();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static n92 F(b55 b55Var, Object obj, n92 n92Var) {
        b55Var.getClass();
        n92Var.getClass();
        if (b55Var instanceof kn0) {
            return ((kn0) b55Var).create(obj, n92Var);
        }
        ib2 context = n92Var.getContext();
        return context == zx3.a ? new h76(b55Var, obj, n92Var) : new i76(n92Var, context, b55Var, obj);
    }

    public static final Calendar G(Long l) {
        Calendar calendar = Calendar.getInstance(DesugarTimeZone.getTimeZone("UTC"), Locale.US);
        if (l != null) {
            calendar.setTimeInMillis(l.longValue());
        }
        calendar.getClass();
        return calendar;
    }

    public static boolean H(File file) {
        if (!file.isDirectory()) {
            file.delete();
            return true;
        }
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles == null) {
            return false;
        }
        boolean z = true;
        for (File file2 : fileArrListFiles) {
            z = H(file2) && z;
        }
        return z;
    }

    public static final void I(Calendar calendar) {
        calendar.set(5, calendar.getActualMaximum(5));
        calendar.set(11, 23);
        calendar.set(12, 59);
        calendar.set(13, 59);
        calendar.set(14, 999);
    }

    public static final void J(Calendar calendar) {
        calendar.getClass();
        Calendar calendarG = G(null);
        if (calendar.after(calendarG)) {
            calendar.set(5, calendarG.get(5));
            calendar.set(2, calendarG.get(2));
            calendar.set(1, calendarG.get(1));
        } else {
            calendar.set(5, calendar.getActualMaximum(5));
        }
        calendar.set(11, 23);
        calendar.set(12, 59);
        calendar.set(13, 59);
        calendar.set(14, 999);
    }

    public static final o3e K(hec hecVar, hec hecVar2) {
        hecVar.getClass();
        hecVar2.getClass();
        return hecVar.equals(hecVar2) ? hecVar : new bn4(hecVar, hecVar2);
    }

    public static l41 L(bo4 bo4Var, ky6 ky6Var) {
        vx6 vx6Var = vx6.STARTED;
        bo4Var.getClass();
        ky6Var.getClass();
        vx6Var.getClass();
        return o7f.l(new io4(ky6Var, vx6Var, bo4Var, null, 1));
    }

    public static iy1 M(String str, fm3 fm3Var) {
        hy1 hy1VarB = iy1.b(rj0.class);
        hy1VarB.e = 1;
        hy1VarB.a(s73.b(Context.class));
        hy1VarB.f = new lt(str, 10, fm3Var);
        return hy1VarB.b();
    }

    public static final void N(ib2 ib2Var, Throwable th) {
        Throwable runtimeException;
        Iterator it2 = mb2.a.iterator();
        while (it2.hasNext()) {
            try {
                ((lb2) it2.next()).I(ib2Var, th);
            } catch (ExceptionSuccessfullyProcessed unused) {
                return;
            } catch (Throwable th2) {
                if (th == th2) {
                    runtimeException = th;
                } else {
                    runtimeException = new RuntimeException("Exception while trying to handle coroutine exception", th2);
                    kyd.D(runtimeException, th);
                }
                Thread threadCurrentThread = Thread.currentThread();
                try {
                    threadCurrentThread.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread, runtimeException);
                } catch (Throwable unused2) {
                }
            }
        }
        try {
            kyd.D(th, new DiagnosticCoroutineContextException(ib2Var));
        } catch (Throwable unused3) {
        }
        Thread threadCurrentThread2 = Thread.currentThread();
        try {
            threadCurrentThread2.getUncaughtExceptionHandler().uncaughtException(threadCurrentThread2, th);
        } catch (Throwable unused4) {
        }
    }

    public static boolean O(xvd xvdVar, hkb hkbVar, tr7 tr7Var) {
        wvd wvdVar = wvd.f;
        xvdVar.getClass();
        hkbVar.getClass();
        bo1 bo1Var = xvdVar.c;
        if ((bo1Var.z(hkbVar) && !bo1Var.F0(hkbVar)) || bo1Var.P(hkbVar)) {
            return true;
        }
        xvdVar.c();
        ArrayDeque arrayDeque = xvdVar.f;
        arrayDeque.getClass();
        zgc zgcVar = xvdVar.g;
        zgcVar.getClass();
        arrayDeque.push(hkbVar);
        while (!arrayDeque.isEmpty()) {
            hkb hkbVar2 = (hkb) arrayDeque.pop();
            hkbVar2.getClass();
            if (zgcVar.add(hkbVar2)) {
                tr7 tr7Var2 = bo1Var.F0(hkbVar2) ? wvdVar : tr7Var;
                if (tr7Var2.equals(wvdVar)) {
                    tr7Var2 = null;
                }
                if (tr7Var2 == null) {
                    continue;
                } else {
                    Iterator it2 = bo1Var.I(bo1Var.L(hkbVar2)).iterator();
                    while (it2.hasNext()) {
                        hkb hkbVarX = tr7Var2.x(xvdVar, (qn6) it2.next());
                        if ((bo1Var.z(hkbVarX) && !bo1Var.F0(hkbVarX)) || bo1Var.P(hkbVarX)) {
                            xvdVar.a();
                            return true;
                        }
                        arrayDeque.add(hkbVarX);
                    }
                }
            }
        }
        xvdVar.a();
        return false;
    }

    public static final r28 P(r28 r28Var, a76 a76Var) {
        return r28Var.b(new w66(a76Var));
    }

    public static n92 Q(n92 n92Var) {
        n92<Object> n92VarIntercepted;
        n92Var.getClass();
        p92 p92Var = n92Var instanceof p92 ? (p92) n92Var : null;
        return (p92Var == null || (n92VarIntercepted = p92Var.intercepted()) == null) ? n92Var : n92VarIntercepted;
    }

    public static boolean R(xvd xvdVar, hkb hkbVar, awd awdVar) {
        bo1 bo1Var = xvdVar.c;
        if (bo1Var.x(hkbVar)) {
            return true;
        }
        if (bo1Var.F0(hkbVar)) {
            return false;
        }
        if (xvdVar.b) {
            bo1Var.Z(hkbVar);
        }
        return bo1Var.m0(bo1Var.L(hkbVar), awdVar);
    }

    public static boolean S(int i2, Object obj) {
        if (obj instanceof j55) {
            if ((obj instanceof l55 ? ((l55) obj).getArity() : obj instanceof m45 ? 0 : obj instanceof x45 ? 1 : obj instanceof b55 ? 2 : obj instanceof c55 ? 3 : obj instanceof d55 ? 4 : obj instanceof e55 ? 5 : obj instanceof f55 ? 6 : obj instanceof g55 ? 7 : obj instanceof h55 ? 8 : obj instanceof i55 ? 9 : obj instanceof n45 ? 10 : obj instanceof o45 ? 11 : obj instanceof p45 ? 12 : obj instanceof q45 ? 13 : obj instanceof r45 ? 14 : obj instanceof s45 ? 15 : obj instanceof t45 ? 16 : obj instanceof u45 ? 17 : obj instanceof v45 ? 18 : obj instanceof w45 ? 19 : obj instanceof y45 ? 20 : obj instanceof z45 ? 21 : obj instanceof a55 ? 22 : -1) == i2) {
                return true;
            }
        }
        return false;
    }

    public static yi5 T(LinkedHashMap linkedHashMap) {
        String[] strArr = new String[linkedHashMap.size() * 2];
        int i2 = 0;
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            String string = muc.y0(str).toString();
            String string2 = muc.y0(str2).toString();
            iq7.J(string);
            iq7.K(string2, string);
            strArr[i2] = string;
            strArr[i2 + 1] = string2;
            i2 += 2;
        }
        return new yi5(strArr);
    }

    public static yi5 U(String... strArr) {
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        if (strArr2.length % 2 != 0) {
            ay0.e("Expected alternating header names and values");
            return null;
        }
        String[] strArr3 = (String[]) Arrays.copyOf(strArr2, strArr2.length);
        int length = strArr3.length;
        int i2 = 0;
        for (int i3 = 0; i3 < length; i3++) {
            if (strArr3[i3] == null) {
                ay0.e("Headers cannot be null");
                return null;
            }
            strArr3[i3] = muc.y0(strArr2[i3]).toString();
        }
        int iU = hk7.u(0, strArr3.length - 1, 2);
        if (iU >= 0) {
            while (true) {
                String str = strArr3[i2];
                String str2 = strArr3[i2 + 1];
                iq7.J(str);
                iq7.K(str2, str);
                if (i2 == iU) {
                    break;
                }
                i2 += 2;
            }
        }
        return new yi5(strArr3);
    }

    public static final r28 V(r28 r28Var, x45 x45Var) {
        return r28Var.b(new cr8(x45Var));
    }

    public static final int W(int i2, String str) {
        str.getClass();
        char cCharAt = str.charAt(i2);
        return (cCharAt << 7) + str.charAt(i2 + 1);
    }

    public static final hec X(uvd uvdVar, y28 y28Var, List list) {
        uvdVar.getClass();
        y28Var.getClass();
        list.getClass();
        zvd zvdVarN = y28Var.n();
        zvdVarN.getClass();
        return Y(uvdVar, zvdVarN, list, false);
    }

    public static hec Y(uvd uvdVar, zvd zvdVar, List list, boolean z) {
        ev7 ev7VarY;
        y28 y28Var;
        ev7 ev7VarH0;
        ev7 ev7Var;
        ev7 ev7VarN0;
        uvdVar.getClass();
        zvdVar.getClass();
        list.getClass();
        if (uvdVar.isEmpty() && list.isEmpty() && !z && zvdVar.a() != null) {
            co1 co1VarA = zvdVar.a();
            co1VarA.getClass();
            hec hecVarT = co1VarA.T();
            hecVarT.getClass();
            return hecVarT;
        }
        co1 co1VarA2 = zvdVar.a();
        if (co1VarA2 instanceof swd) {
            ev7VarY = ((swd) co1VarA2).T().H();
        } else {
            if (co1VarA2 instanceof y28) {
                int i2 = f93.a;
                b38 b38VarD = d93.d(co1VarA2);
                b38VarD.getClass();
                f93.h(b38VarD);
                boolean zIsEmpty = list.isEmpty();
                sn6 sn6Var = sn6.a;
                if (zIsEmpty) {
                    y28 y28Var2 = (y28) co1VarA2;
                    y28Var = y28Var2 instanceof y28 ? y28Var2 : null;
                    if (y28Var == null || (ev7VarN0 = y28Var.n0(sn6Var)) == null) {
                        ev7VarY = y28Var2.m0();
                        ev7VarY.getClass();
                    } else {
                        ev7Var = ev7VarN0;
                    }
                } else {
                    y28 y28Var3 = (y28) co1VarA2;
                    exd exdVarN = bwd.b.n(zvdVar, list);
                    y28Var = y28Var3 instanceof y28 ? y28Var3 : null;
                    if (y28Var == null || (ev7VarH0 = y28Var.h0(exdVarN, sn6Var)) == null) {
                        ev7VarY = y28Var3.f0(exdVarN);
                        ev7VarY.getClass();
                    } else {
                        ev7Var = ev7VarH0;
                    }
                }
                return a0(uvdVar, zvdVar, list, z, ev7Var, new pn6(uvdVar, zvdVar, list, z));
            }
            if (co1VarA2 instanceof ha3) {
                t14 t14Var = t14.SCOPE_FOR_ABBREVIATION_TYPE;
                String str = ((ha3) co1VarA2).getName().a;
                str.getClass();
                ev7VarY = l24.a(t14Var, true, str);
            } else {
                if (!(zvdVar instanceof u66)) {
                    rd6.p("Unsupported classifier: ", co1VarA2, " for constructor: ", zvdVar);
                    return null;
                }
                ev7VarY = ek7.y("member scope for intersection type", ((u66) zvdVar).b);
            }
        }
        ev7Var = ev7VarY;
        return a0(uvdVar, zvdVar, list, z, ev7Var, new pn6(uvdVar, zvdVar, list, z));
    }

    public static final hec Z(ev7 ev7Var, uvd uvdVar, zvd zvdVar, List list, boolean z) {
        uvdVar.getClass();
        zvdVar.getClass();
        list.getClass();
        ev7Var.getClass();
        iec iecVar = new iec(zvdVar, list, z, ev7Var, new pn6(ev7Var, uvdVar, zvdVar, list, z));
        return uvdVar.isEmpty() ? iecVar : new kec(iecVar, uvdVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.bj r22, defpackage.nhc r23, defpackage.ti r24, defpackage.e9d r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pwd.a(bj, nhc, ti, e9d, r28, x12, int, int):void");
    }

    public static final hec a0(uvd uvdVar, zvd zvdVar, List list, boolean z, ev7 ev7Var, x45 x45Var) {
        uvdVar.getClass();
        zvdVar.getClass();
        list.getClass();
        ev7Var.getClass();
        iec iecVar = new iec(zvdVar, list, z, ev7Var, x45Var);
        return uvdVar.isEmpty() ? iecVar : new kec(iecVar, uvdVar);
    }

    public static final void b(String str, olb olbVar, r28 r28Var, ej ejVar, x12 x12Var, int i2) {
        ej ejVar2;
        int i3;
        ej ejVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1901100630);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(olbVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 5);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    ejVar3 = (ej) to7.z(n1b.a.b(ej.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                ejVar3 = ejVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ejVar3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i6 == 32) | p65Var.f(ejVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new ui(ejVar3, olbVar);
                p65Var.j0(objM2);
            }
            ui uiVar = (ui) objM2;
            boolean zF2 = p65Var.f(ejVar3) | (i6 == 32);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new ti(ejVar3, olbVar);
                p65Var.j0(objM3);
            }
            a((bj) l78VarZ.getValue(), nhcVarF, (ti) objM3, uiVar, r28Var, p65Var, (i3 << 6) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(ejVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(uiVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ra raVar = new ra(ejVar3, nhcVarF, resources, uiVar, null, 15);
                p65Var.j0(raVar);
                objM4 = raVar;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            ejVar2 = ejVar3;
        } else {
            p65Var.S();
            ejVar2 = ejVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 10, str, olbVar, r28Var, ejVar2);
        }
    }

    public static void b0(String str, Object obj) {
        ClassCastException classCastException = new ClassCastException(ev6.x(obj == null ? "null" : obj.getClass().getName(), " cannot be cast to ", str));
        g76.d0(classCastException, pwd.class.getName());
        throw classCastException;
    }

    public static final void c(zi ziVar, ti tiVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1313235392);
        int i3 = i2 | (p65Var.f(ziVar) ? 4 : 2) | (p65Var.f(tiVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = ziVar.a;
            r28 r28VarA = iy0.a.a(o28Var, ar0Var);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                vf vfVar = new vf(0, tiVar, ti.class, "refresh", "refresh()V", 0, 19);
                p65Var.j0(vfVar);
                objM = vfVar;
            }
            iq7.a(b24Var, r28VarA, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 15, ziVar, tiVar, r28Var);
        }
    }

    public static void c0(Throwable th) {
        if (th instanceof VirtualMachineError) {
            throw ((VirtualMachineError) th);
        }
        if (th instanceof ThreadDeath) {
            throw ((ThreadDeath) th);
        }
        if (th instanceof LinkageError) {
            throw ((LinkageError) th);
        }
    }

    public static final void d(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1134661626);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(2119250234);
            for (int i7 = 0; i7 < 10; i7++) {
                vn7.g(null, p65Var, 0);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 8);
        }
    }

    public static void d0(String str) {
        boolean zContains;
        str.getClass();
        if (str.length() == 0 || str.length() > 40) {
            throw new FacebookException(String.format(Locale.ROOT, "Identifier '%s' must be less than %d characters", Arrays.copyOf(new Object[]{str, 40}, 2)));
        }
        HashSet hashSet = i40.f;
        synchronized (hashSet) {
            zContains = hashSet.contains(str);
        }
        if (zContains) {
            return;
        }
        Pattern patternCompile = Pattern.compile("^[0-9a-zA-Z_]+[0-9a-zA-Z _-]*$");
        patternCompile.getClass();
        if (!patternCompile.matcher(str).matches()) {
            throw new FacebookException(String.format("Skipping event named '%s' due to illegal name - must be under 40 chars and alphanumeric, _, - or space, and not start with a space or hyphen.", Arrays.copyOf(new Object[]{str}, 1)));
        }
        synchronized (hashSet) {
            hashSet.add(str);
        }
    }

    public static uz0 e(int i2, int i3, nz0 nz0Var) {
        if ((i3 & 1) != 0) {
            i2 = 0;
        }
        if ((i3 & 2) != 0) {
            nz0Var = nz0.SUSPEND;
        }
        if (i2 == -2) {
            if (nz0Var != nz0.SUSPEND) {
                return new t32(1, nz0Var);
            }
            wj1.V.getClass();
            return new uz0(vj1.b);
        }
        if (i2 != -1) {
            return i2 != 0 ? i2 != Integer.MAX_VALUE ? nz0Var == nz0.SUSPEND ? new uz0(i2) : new t32(i2, nz0Var) : new uz0(Integer.MAX_VALUE) : nz0Var == nz0.SUSPEND ? new uz0(0) : new t32(1, nz0Var);
        }
        if (nz0Var == nz0.SUSPEND) {
            return new t32(1, nz0.DROP_OLDEST);
        }
        ay0.e("CONFLATED capacity cannot be used with non-default onBufferOverflow");
        return null;
    }

    public static final r28 e0(r28 r28Var, a76 a76Var) {
        return r28Var.b(new c76(a76Var));
    }

    public static final void f(yi yiVar, ti tiVar, e9d e9dVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        ti tiVar2 = tiVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-988158034);
        int i3 = i2 | (p65Var.f(yiVar) ? 4 : 2) | (p65Var.f(tiVar2) ? 32 : 16) | (p65Var.f(e9dVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z = yiVar.b;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i4 == 32;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, tiVar, ti.class, "refresh", "refresh()V", 0, 20);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(54709088, new fd3(kv6VarA, (Object) yiVar, (Object) e9dVar, (Object) tiVar, 20), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i4 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                tiVar2 = tiVar;
                objM2 = new z8(tiVar2, null, 9);
                p65Var.j0(objM2);
            } else {
                tiVar2 = tiVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 11, yiVar, tiVar2, e9dVar, r28Var);
        }
    }

    public static Object f0(b55 b55Var, Object obj, n92 n92Var) {
        b55Var.getClass();
        ib2 context = n92Var.getContext();
        Object j76Var = context == zx3.a ? new j76(n92Var) : new k76(n92Var, context);
        B(2, b55Var);
        return b55Var.invoke(obj, j76Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void g(kff kffVar, iff iffVar, kv6 kv6Var, sh9 sh9Var, gff gffVar, r28 r28Var, x12 x12Var, int i2) {
        gff gffVar2;
        q53 q53Var;
        int i3;
        Object hgbVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(735405907);
        int i4 = i2 | (p65Var.f(kffVar) ? 4 : 2) | (p65Var.f(iffVar) ? 32 : 16) | (p65Var.f(kv6Var) ? 256 : 128) | (p65Var.f(sh9Var) ? 2048 : 1024) | (p65Var.f(gffVar) ? 16384 : 8192);
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            int size = kffVar.a.size();
            r28 r28VarN = bgf.N(r28Var, "content_state");
            boolean zD = ((i4 & 14) == 4) | p65Var.d(stcVar.ordinal()) | ((i4 & 7168) == 2048) | p65Var.d(size);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                objM = new h83(kffVar, size, stcVar, sh9Var);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, (i4 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 508);
            if (iffVar != null) {
                p65Var.Y(-1944464675);
                q53 q53Var2 = iffVar.a;
                int i5 = i4 & 57344;
                Object[] objArr = i5 == 16384;
                Object objM2 = p65Var.M();
                if (objArr == true || objM2 == uobVar) {
                    q53Var = q53Var2;
                    i3 = 16384;
                    iaf iafVar = new iaf(0, gffVar, gff.class, "onDialogClosed", "onDialogClosed()V", 0, 15);
                    p65Var.j0(iafVar);
                    objM2 = iafVar;
                } else {
                    i3 = 16384;
                    q53Var = q53Var2;
                }
                m45 m45Var = (m45) ((qh6) objM2);
                boolean z = i5 == i3;
                Object objM3 = p65Var.M();
                if (z || objM3 == uobVar) {
                    hgbVar = new hgb(1, gffVar, gff.class, "onDeletePostConfirmed", "onDeletePostConfirmed(Lcom/medium/android/design/component/deletepostconfirmation/DeletePostConfirmationDialogState;)V", 0, 23);
                    gffVar2 = gffVar;
                    p65Var.j0(hgbVar);
                } else {
                    hgbVar = objM3;
                    gffVar2 = gffVar;
                }
                p65Var = p65Var;
                bgf.k(q53Var, m45Var, (x45) ((qh6) hgbVar), null, p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var = p65Var;
                gffVar2 = gffVar;
                if (iffVar != null) {
                    throw ho2.L(p65Var, -1944467530, false);
                }
                p65Var.Y(-1944457833);
                p65Var.p(false);
            }
            sff sffVar = gffVar2.a;
            String str = sffVar.i;
            String str2 = sffVar.b;
            if (!sffVar.k) {
                sffVar.k = true;
                String strU = gp7.u(sffVar.j);
                sffVar.g.j(str2, strU, str);
                ax2 ax2Var = sffVar.h;
                ax2Var.getClass();
                rqd.a(ax2Var.b, new YourStoriesPageViewed(null, 0 == true ? 1 : 0, 3, 0 == true ? 1 : 0), str2, strU, false, null, str, 24);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(i2, 7, r28Var, kffVar, iffVar, kv6Var, sh9Var, gffVar);
        }
    }

    public static final void h(vpc vpcVar, bo4 bo4Var, u43 u43Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        uob uobVar;
        o28 o28Var;
        u43 u43Var2;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(920764043);
        int i3 = i2 | (p65Var.h(vpcVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(u43Var) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var, i3 & 14);
            nhc nhcVarF = mk7.F(p65Var);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            h53 h53Var = (h53) l78VarZ.getValue();
            if (h53Var == null) {
                throw ho2.L(p65Var, 1707445734, false);
            }
            p65Var.Y(1391296384);
            String strR = vo7.R(p65Var, R.string.delete_list);
            String strR2 = vo7.R(p65Var, R.string.delete_list_subtitle);
            int i5 = i3 & 896;
            boolean z = i5 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z || objM == uobVar2) {
                uobVar = uobVar2;
                o28Var = o28Var2;
                gu1 gu1Var = new gu1(0, u43Var, u43.class, "close", "close()V", 0, 8);
                u43Var2 = u43Var;
                p65Var.j0(gu1Var);
                objM = gu1Var;
            } else {
                u43Var2 = u43Var;
                uobVar = uobVar2;
                o28Var = o28Var2;
            }
            ek7.g(strR, (m45) ((qh6) objM), bgf.N(o28Var, "delete_catalog_screen"), strR2, pxf.E(754598243, new ec(u43Var2, 22, h53Var), p65Var), p65Var, 24576, 0);
            p65Var.p(false);
            br7.k(nhcVarF, iy0.a.a(o28Var, z46.k), 0.0f, null, p65Var, 0, 12);
            p65Var = p65Var;
            p65Var.p(true);
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | (i5 == 256) | p65Var.f(nhcVarF) | p65Var.h(resources);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                fl2 fl2Var = new fl2(bo4Var, u43Var, nhcVarF, resources, null, 1);
                p65Var.j0(fl2Var);
                objM2 = fl2Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 27, vpcVar, bo4Var, u43Var, r28Var2);
        }
    }

    public static final long i(float f2, float f3) {
        return (((long) Float.floatToRawIntBits(f3)) & 4294967295L) | (Float.floatToRawIntBits(f2) << 32);
    }

    public static final void j(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-161787028);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            gq7.a(null, null, vo7.R(p65Var, R.string.your_responses_empty_state_title), vo7.R(p65Var, R.string.your_responses_empty_state_text), 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2035);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 19);
        }
    }

    public static final void k(mff mffVar, gff gffVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(983776337);
        int i3 = i2 | (p65Var.f(mffVar) ? 4 : 2) | (p65Var.f(gffVar) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = mffVar.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                iaf iafVar = new iaf(0, gffVar, gff.class, "refresh", "refresh()V", 0, 16);
                p65Var.j0(iafVar);
                objM = iafVar;
            }
            iq7.a(b24Var, jfc.c, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2f(i2, 5, r28Var, mffVar, gffVar);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2037268253);
        boolean z = false;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, 6), "loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-2026897714);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z);
                long j3 = p65Var.T;
                int i4 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i4);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z);
                long j4 = p65Var.T;
                int i5 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                il7.l(stcVar, null, ((zo7) p65Var.j(kt7.b)).b, null, p65Var, 0, 10);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = false;
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 20);
        }
    }

    public static final void m(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(390636282);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.h(m45Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(m45Var2) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            kng.c(m45Var2, pxf.E(458243394, new c60(7, m45Var), p65Var), bgf.N(o28Var, "make_catalog_private_confirmation_dialog"), pxf.E(-2079096764, new c60(8, m45Var2), p65Var), k40.e, k40.f, null, 0L, 0L, null, p65Var, ((i4 >> 3) & 14) | 224304);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk4(m45Var, m45Var2, r28Var2, i2, 2);
        }
    }

    public static final void n(led ledVar, kv6 kv6Var, cs1 cs1Var, obe obeVar, aed aedVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(573310998);
        int i3 = i2 | (p65Var.f(ledVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(cs1Var) ? 256 : 128) | (p65Var.f(obeVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(aedVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (!p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.S();
        } else if (ledVar instanceof fed) {
            p65Var.Y(-1576645371);
            o(((fed) ledVar).a, aedVar, r28Var, p65Var, (i3 >> 9) & PhotoshopDirectory.TAG_CAPTION);
            p65Var.p(false);
        } else if (ledVar instanceof ged) {
            p65Var.Y(-1576394550);
            p(r28Var, p65Var, (i3 >> 15) & 14);
            p65Var.p(false);
        } else {
            if (!(ledVar instanceof ked)) {
                throw ho2.L(p65Var, 1196064740, false);
            }
            p65Var.Y(-1576258770);
            t((ked) ledVar, kv6Var, cs1Var, obeVar, aedVar, r28Var, p65Var, i3 & 524286);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 24, r28Var, ledVar, kv6Var, cs1Var, obeVar, aedVar);
        }
    }

    public static final void o(b24 b24Var, aed aedVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(267635950);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(b24Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(aedVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarB = r28Var.b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarB);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ibd ibdVar = new ibd(0, aedVar, aed.class, "refresh", "refresh()V", 0, 3);
                p65Var.j0(ibdVar);
                objM = ibdVar;
            }
            iq7.a(b24Var, jfc.d(o28.b, 1.0f), null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 14, b24Var, aedVar, r28Var);
        }
    }

    public static final void p(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(342218634);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarV = m40.V(r28Var, p65Var, i3 & 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-895594205);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                char c3 = c2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                tr7.g(0, 1, p65Var, null);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 19);
        }
    }

    public static final void q(final led ledVar, final nhc nhcVar, final kv6 kv6Var, final cs1 cs1Var, final obe obeVar, final udd uddVar, final aed aedVar, final r28 r28Var, uod uodVar, x12 x12Var, final int i2) {
        int i3;
        p65 p65Var;
        final uod uodVar2;
        int i4;
        uod uodVarA;
        String strQ;
        uod uodVar3;
        ledVar.getClass();
        nhcVar.getClass();
        kv6Var.getClass();
        cs1Var.getClass();
        obeVar.getClass();
        aedVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-162930351);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(ledVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(kv6Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(cs1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(obeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(uddVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(aedVar) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= 33554432;
        }
        if (p65Var2.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var2.U();
            if ((i2 & 1) == 0 || p65Var2.z()) {
                i4 = i3 & (-234881025);
                uodVarA = rod.a(p65Var2);
            } else {
                p65Var2.S();
                i4 = i3 & (-234881025);
                uodVarA = uodVar;
            }
            int i5 = i4;
            p65Var2.q();
            if (ledVar instanceof fed) {
                strQ = km4.w(p65Var2, -536189366, R.string.tag_who_to_follow_title, p65Var2, false);
            } else if (ledVar instanceof ged) {
                p65Var2.Y(-536185818);
                strQ = vo7.Q(R.string.tag_who_to_follow_title_with_tag, new Object[]{((ged) ledVar).a}, p65Var2);
                p65Var2.p(false);
            } else {
                if (!(ledVar instanceof ked)) {
                    throw ho2.L(p65Var2, -536191471, false);
                }
                p65Var2.Y(-536181274);
                strQ = vo7.Q(R.string.tag_who_to_follow_title_with_tag, new Object[]{((ked) ledVar).a}, p65Var2);
                p65Var2.p(false);
            }
            final String str = strQ;
            final upc upcVarA = zu.a(nk7.o0(kv6Var), null, "elevation", p65Var2, 384, 10);
            uod uodVar4 = uodVarA;
            npa npaVarJ = vo7.J(p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            boolean zBooleanValue = ledVar instanceof ked ? ((ked) ledVar).c || ((Boolean) l78Var.getValue()).booleanValue() : ((Boolean) l78Var.getValue()).booleanValue();
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                uodVar3 = uodVar4;
                objM2 = new obb(l78Var, null, 17);
                p65Var2.j0(objM2);
            } else {
                uodVar3 = uodVar4;
            }
            kyd.k(p65Var2, (b55) objM2, ledVar);
            boolean z = (i5 & 3670016) == 1048576;
            Object objM3 = p65Var2.M();
            if (z || objM3 == uobVar) {
                objM3 = new nbb(aedVar, 16, l78Var);
                p65Var2.j0(objM3);
            }
            m45 m45Var = (m45) objM3;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = new d3d(15);
                p65Var2.j0(objM4);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM4), "tag_who_to_follow");
            final uod uodVar5 = uodVar3;
            er7.d(zBooleanValue, m45Var, r28VarN, npaVarJ, 0L, 0L, false, 0.0f, null, null, pxf.E(-1279294113, new c55() { // from class: xdd
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    ((hy0) obj).getClass();
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                        rh4 rh4Var = jfc.c;
                        uod uodVar6 = uodVar5;
                        pr7.b(rv8.J(rh4Var, uodVar6.a(), null), pxf.E(-1300624285, new g9b(str, uddVar, uodVar6, upcVarA, 14), p65Var3), null, pxf.E(177921509, new eyc(nhcVar, 3), p65Var3), null, 0, 0L, 0L, null, pxf.E(1989648750, new g91(ledVar, kv6Var, cs1Var, obeVar, aedVar, 7), p65Var3), p65Var3, 805309488, 500);
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var2), p65Var2, 0, PhotoshopDirectory.TAG_CAPTION);
            p65Var = p65Var2;
            uodVar2 = uodVar5;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            uodVar2 = uodVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: ydd
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    pwd.q(ledVar, nhcVar, kv6Var, cs1Var, obeVar, uddVar, aedVar, r28Var, uodVar2, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void r(String str, String str2, udd uddVar, r28 r28Var, qed qedVar, x12 x12Var, int i2) {
        qed qedVar2;
        int i3;
        qed qedVar3;
        qed qedVar4;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1816791266);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(uddVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 23);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    qed qedVar5 = (qed) to7.z(n1b.a.b(qed.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                    qedVar3 = qedVar5;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                qedVar3 = qedVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(qedVar3.m, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            int i6 = i3 & 896;
            boolean zF = (i6 == 256) | p65Var.f(qedVar3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new zdd(uddVar, qedVar3);
                p65Var.j0(objM3);
            }
            zdd zddVar = (zdd) objM3;
            boolean zF2 = p65Var.f(qedVar3) | (i6 == 256);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new bed(uddVar, qedVar3);
                p65Var.j0(objM4);
            }
            bed bedVar = (bed) objM4;
            boolean zF3 = p65Var.f(qedVar3);
            Object objM5 = p65Var.M();
            if (zF3 || objM5 == uobVar) {
                objM5 = new aed(qedVar3);
                p65Var.j0(objM5);
            }
            q((led) l78VarZ.getValue(), nhcVarF, kv6VarA, zddVar, bedVar, uddVar, (aed) objM5, r28Var, null, p65Var, ((i3 << 9) & 458752) | ((i3 << 12) & 29360128));
            boolean zH = p65Var.h(qedVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(zddVar) | p65Var.f(bedVar);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                qedVar4 = qedVar3;
                yu yuVar = new yu(qedVar4, nhcVarF, sb2Var, resources, zddVar, bedVar, null, 22);
                p65Var.j0(yuVar);
                objM6 = yuVar;
            } else {
                qedVar4 = qedVar3;
            }
            kyd.k(p65Var, (b55) objM6, c1e.a);
            qedVar2 = qedVar4;
        } else {
            p65Var.S();
            qedVar2 = qedVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, str2, uddVar, r28Var, qedVar2, i2, 9);
        }
    }

    public static final void s(String str, m45 m45Var, uod uodVar, float f2, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1890281770);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(uodVar) ? 256 : 128) | (p65Var.c(f2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            qk7.e(pxf.E(1462572888, new ba1(str, 6), p65Var), wo7.w(o28.b, f2, null, 0L, 0L, 30), m45Var, null, null, null, 0L, null, uodVar, p65Var, 6 | ((i3 << 3) & 896) | ((i3 << 18) & 234881024));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dj3(str, m45Var, uodVar, f2, i2, 7);
        }
    }

    public static final void t(ked kedVar, kv6 kv6Var, cs1 cs1Var, obe obeVar, aed aedVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1171829749);
        int i3 = i2 | (p65Var2.f(kedVar) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(cs1Var) ? 256 : 128) | (p65Var2.f(obeVar) ? 2048 : 1024) | (p65Var2.f(aedVar) ? 16384 : 8192) | (p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 24.0f, 7);
            boolean z = ((i3 & 14) == 4) | ((i3 & 896) == 256) | ((i3 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new pi9(kedVar, cs1Var, obeVar, 13);
                p65Var2.j0(objM);
            }
            k40.t(r28Var, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var2, ((i3 >> 15) & 14) | 384 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 504);
            p65Var = p65Var2;
            boolean z2 = (i3 & 57344) == 16384;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new obb(aedVar, null, 18);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 25, r28Var, kedVar, kv6Var, cs1Var, obeVar, aedVar);
        }
    }

    public static final void u(int i2, x12 x12Var, bo4 bo4Var, r28 r28Var, uef uefVar, String str) {
        uefVar.getClass();
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1747174491);
        int i3 = 4;
        int i4 = i2 | (p65Var.f(uefVar) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128);
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            boolean z = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new kef(str, i5);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            sff sffVar = (sff) to7.z(n1b.a.b(sff.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            l78 l78VarZ = guc.z(sffVar.q, p65Var, 0);
            l78 l78VarZ2 = guc.z(sffVar.p, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            kv6 kv6VarA = pv6.a(p65Var);
            md3 md3Var = new md3(uefVar, 11, sffVar);
            v((off) l78VarZ.getValue(), (iff) l78VarZ2.getValue(), new gff(sffVar), md3Var, r28Var, kv6VarA, nhcVar, p65Var, 1597440, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(sffVar) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                objM3 = new gbd(sffVar, nhcVar, resources, md3Var, null, 26);
                p65Var.j0(objM3);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM4 = p65Var.M();
            n92 n92Var = null;
            if (zH2 || objM4 == uobVar) {
                objM4 = new wi1(bo4Var, kv6VarA, n92Var, 13);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            boolean zF = p65Var.f(kv6VarA) | p65Var.h(sffVar);
            Object objM5 = p65Var.M();
            if (zF || objM5 == uobVar) {
                objM5 = new kaf(kv6VarA, sffVar, n92Var, i3);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, kv6VarA);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gv4(uefVar, str, bo4Var, r28Var, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:97:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void v(defpackage.off r24, defpackage.iff r25, defpackage.gff r26, defpackage.sh9 r27, defpackage.r28 r28, defpackage.kv6 r29, defpackage.nhc r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 383
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pwd.v(off, iff, gff, sh9, r28, kv6, nhc, x12, int, int):void");
    }

    public static Collection w(AbstractCollection abstractCollection) {
        if (!(abstractCollection instanceof th6) || (abstractCollection instanceof uh6)) {
            return abstractCollection;
        }
        b0("kotlin.collections.MutableCollection", abstractCollection);
        throw null;
    }

    public static List x(Object obj) {
        if ((obj instanceof th6) && !(obj instanceof vh6)) {
            b0("kotlin.collections.MutableList", obj);
            throw null;
        }
        try {
            return (List) obj;
        } catch (ClassCastException e2) {
            g76.d0(e2, pwd.class.getName());
            throw e2;
        }
    }

    public static Map y(Object obj) {
        if ((obj instanceof th6) && !(obj instanceof wh6)) {
            b0("kotlin.collections.MutableMap", obj);
            throw null;
        }
        try {
            return (Map) obj;
        } catch (ClassCastException e2) {
            g76.d0(e2, pwd.class.getName());
            throw e2;
        }
    }

    public static Set z(Object obj) {
        if ((obj instanceof th6) && !(obj instanceof ii6)) {
            b0("kotlin.collections.MutableSet", obj);
            throw null;
        }
        try {
            return (Set) obj;
        } catch (ClassCastException e2) {
            g76.d0(e2, pwd.class.getName());
            throw e2;
        }
    }
}
