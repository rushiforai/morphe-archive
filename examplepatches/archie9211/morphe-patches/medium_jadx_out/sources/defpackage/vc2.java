package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextPaint;
import android.view.View;
import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;
import com.squareup.moshi.JsonDataException;
import gen.model.SourceParameter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class vc2 {
    public static final hnc A;
    public static final int[] B;
    public static final int[] C;
    public static final int[] D;
    public static final int[] E;
    public static final /* synthetic */ int F = 0;
    public static final /* synthetic */ int G = 0;
    public static final /* synthetic */ int H = 0;
    public static final /* synthetic */ int I = 0;
    public static final /* synthetic */ int J = 0;
    public static final /* synthetic */ int K = 0;
    public static final mz1 a = new mz1(new e02(19), false, 937349512);
    public static final mz1 b = new mz1(new p02(11), false, -505419337);
    public static final mz1 c = new mz1(new p02(12), false, 687232378);
    public static final mz1 d = new mz1(new a02(26), false, 552629553);
    public static final mz1 e;
    public static final int[] f;
    public static final long[] g;
    public static final Object[] h;
    public static final rd6 i;
    public static final float j = 30.0f;
    public static final byte[] k;
    public static final byte[] l;
    public static final byte[] m;
    public static final byte[] n;
    public static final byte[] o;
    public static final byte[] p;
    public static final byte[] q;
    public static final n70 r;
    public static final hnc s;
    public static final hnc t;
    public static final hnc u;
    public static final hnc v;
    public static final hnc w;
    public static final hnc x;
    public static final hnc y;
    public static final hnc z;

    static {
        int i2 = 6;
        e = new mz1(new m02(i2), false, -1102177765);
        int i3 = 5;
        new mz1(new n02(i3), false, 1152696587);
        f = new int[0];
        g = new long[0];
        h = new Object[0];
        i = new rd6();
        k = new byte[]{48, 49, 53, 0};
        l = new byte[]{48, 49, 48, 0};
        m = new byte[]{48, 48, 57, 0};
        n = new byte[]{48, 48, 53, 0};
        o = new byte[]{48, 48, 49, 0};
        p = new byte[]{48, 48, 49, 0};
        q = new byte[]{48, 48, 50, 0};
        r = new n70(i2);
        s = new hnc(1);
        t = new hnc(2);
        u = new hnc(3);
        v = new hnc(4);
        w = new hnc(i3);
        x = new hnc(i2);
        y = new hnc(7);
        z = new hnc(8);
        A = new hnc(0);
        B = new int[]{0, 3, 6, 9, 12, 16, 19, 22, 25, 28};
        C = new int[]{0, 2, 3, 5, 6, 0, 1, 3, 4, 6};
        D = new int[]{67108863, 33554431};
        E = new int[]{26, 25};
    }

    public static final void A(String str, String str2, ihe iheVar, bo4 bo4Var, r28 r28Var, cie cieVar, x12 x12Var, int i2) {
        cie cieVar2;
        cie cieVar3;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1782101596);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(iheVar) ? 256 : 128) | (p65Var.h(bo4Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var.U();
            int i4 = i2 & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new bb0(str, str2, 28);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                cieVar3 = (cie) to7.z(n1b.a.b(cie.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
                cieVar3 = cieVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(cieVar3.l, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            l78 l78VarZ2 = guc.z(cieVar3.p, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            md3 md3Var = new md3(iheVar, 8, cieVar3);
            z((whe) l78VarZ.getValue(), (lhe) l78VarZ2.getValue(), new khe(iheVar, cieVar3), md3Var, r28Var, nhcVar, null, p65Var, 221184, 64);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(cieVar3) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                cie cieVar4 = cieVar3;
                objM3 = new gbd(cieVar4, nhcVar, resources, md3Var, null, 15);
                cieVar2 = cieVar4;
                p65Var.j0(objM3);
            } else {
                cieVar2 = cieVar3;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(cieVar2) | p65Var.f(kv6VarA);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                j5d j5dVar = new j5d(bo4Var, cieVar2, kv6VarA, null, 16);
                p65Var.j0(j5dVar);
                objM4 = j5dVar;
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
        } else {
            p65Var.S();
            cieVar2 = cieVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, iheVar, bo4Var, r28Var, cieVar2, i2, 29);
        }
    }

    public static final void B(kx kxVar, String str, String str2) {
        if (str2.length() <= 0) {
            e26.a("alternateText can't be an empty string.");
        }
        jx jxVar = new jx(new fuc(str), kxVar.a.length(), 0, 4);
        ArrayList arrayList = kxVar.b;
        arrayList.add(jxVar);
        kxVar.c.add(jxVar);
        arrayList.size();
        kxVar.d(str2);
        kxVar.e();
    }

    public static final int C(int i2, int i3, int[] iArr) {
        iArr.getClass();
        int i4 = i2 - 1;
        int i5 = 0;
        while (i5 <= i4) {
            int i6 = (i5 + i4) >>> 1;
            int i7 = iArr[i6];
            if (i7 < i3) {
                i5 = i6 + 1;
            } else {
                if (i7 <= i3) {
                    return i6;
                }
                i4 = i6 - 1;
            }
        }
        return ~i5;
    }

    public static final int D(long[] jArr, int i2, long j2) {
        jArr.getClass();
        int i3 = i2 - 1;
        int i4 = 0;
        while (i4 <= i3) {
            int i5 = (i4 + i3) >>> 1;
            long j3 = jArr[i5];
            if (j3 < j2) {
                i4 = i5 + 1;
            } else {
                if (j3 <= j2) {
                    return i5;
                }
                i3 = i5 - 1;
            }
        }
        return ~i4;
    }

    public static que E(Class cls) throws InvocationTargetException {
        try {
            Constructor declaredConstructor = cls.getDeclaredConstructor(null);
            if (!Modifier.isPublic(declaredConstructor.getModifiers())) {
                fm3.d("Cannot create an instance of ", cls);
                return null;
            }
            try {
                Object objNewInstance = declaredConstructor.newInstance(null);
                objNewInstance.getClass();
                return (que) objNewInstance;
            } catch (IllegalAccessException e2) {
                ywb.k("Cannot create an instance of ", cls, e2);
                return null;
            } catch (InstantiationException e3) {
                ywb.k("Cannot create an instance of ", cls, e3);
                return null;
            }
        } catch (NoSuchMethodException e4) {
            ywb.k("Cannot create an instance of ", cls, e4);
            return null;
        }
    }

    public static Object F(List list, um2 um2Var, s42 s42Var) {
        zg7 zg7Var = new zg7(27);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            G(it2.next(), um2Var, zg7Var, s42Var);
        }
        return s42Var.h0();
    }

    public static void G(Object obj, um2 um2Var, zg7 zg7Var, s42 s42Var) {
        if (obj != null) {
            if (((HashSet) zg7Var.b).add(obj) && s42Var.J(obj)) {
                Iterator it2 = um2Var.m(obj).iterator();
                while (it2.hasNext()) {
                    G(it2.next(), um2Var, zg7Var, s42Var);
                }
                s42Var.H(obj);
                return;
            }
            return;
        }
        Object[] objArr = new Object[3];
        switch (22) {
            case 1:
            case 5:
            case 8:
            case 11:
            case 15:
            case 18:
            case 21:
            case 23:
                objArr[0] = "neighbors";
                break;
            case 2:
            case 12:
            case 16:
            case 19:
            case 24:
                objArr[0] = "visited";
                break;
            case 3:
            case 6:
            case 13:
            case 25:
                objArr[0] = "handler";
                break;
            case 4:
            case 7:
            case 17:
            case 20:
            default:
                objArr[0] = "nodes";
                break;
            case 9:
                objArr[0] = "predicate";
                break;
            case 10:
            case 14:
                objArr[0] = "node";
                break;
            case 22:
                objArr[0] = "current";
                break;
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/utils/DFS";
        switch (22) {
            case 7:
            case 8:
            case 9:
                objArr[2] = "ifAny";
                break;
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
                objArr[2] = "dfsFromNode";
                break;
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
                objArr[2] = "topologicalOrder";
                break;
            case 22:
            case 23:
            case 24:
            case 25:
                objArr[2] = "doDfs";
                break;
            default:
                objArr[2] = "dfs";
                break;
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    public static final int H(wt6 wt6Var, Object obj, int i2) {
        int iE;
        return (obj == null || wt6Var.a() == 0 || (i2 < wt6Var.a() && obj.equals(wt6Var.c(i2))) || (iE = wt6Var.e(obj)) == -1) ? i2 : iE;
    }

    public static final String[] I(z82 z82Var) {
        z82Var.getClass();
        return (String[]) ((oo) z82Var).b.toArray(new String[0]);
    }

    public static final pj6 J(pj6 pj6Var) {
        pj6Var.getClass();
        return pj6Var.a().c() ? pj6Var : new cm8(pj6Var);
    }

    /* JADX WARN: Type inference failed for: r11v1, types: [we1] */
    /* JADX WARN: Type inference failed for: r11v2, types: [we1] */
    /* JADX WARN: Type inference failed for: r11v3, types: [we1] */
    /* JADX WARN: Type inference failed for: r11v4, types: [we1] */
    public static Object K(final m40 m40Var, nhc nhcVar, Resources resources, final ye1 ye1Var, x45 x45Var, x45 x45Var2, b55 b55Var, n92 n92Var) {
        boolean z2 = m40Var instanceof a81;
        final int i2 = 0;
        c1e c1eVar = c1e.a;
        if (z2) {
            Object objS = qb8.S(nhcVar, resources, new m45() { // from class: we1
                @Override // defpackage.m45
                public final Object invoke() {
                    int i3 = i2;
                    c1e c1eVar2 = c1e.a;
                    m40 m40Var2 = m40Var;
                    ye1 ye1Var2 = ye1Var;
                    switch (i3) {
                        case 0:
                            a81 a81Var = (a81) m40Var2;
                            ye1Var2.c(a81Var.t, a81Var.u, false);
                            break;
                        case 1:
                            z71 z71Var = (z71) m40Var2;
                            ye1Var2.c(z71Var.t, z71Var.v, true);
                            break;
                        case 2:
                            n81 n81Var = (n81) m40Var2;
                            ye1Var2.c(n81Var.t, n81Var.u, true);
                            break;
                        default:
                            m81 m81Var = (m81) m40Var2;
                            ye1Var2.c(m81Var.t, m81Var.v, false);
                            break;
                    }
                    return c1eVar2;
                }
            }, n92Var);
            if (objS == tb2.COROUTINE_SUSPENDED) {
                return objS;
            }
        } else {
            final int i3 = 1;
            if (m40Var instanceof z71) {
                Object objR = qb8.R(nhcVar, resources, new m45() { // from class: we1
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i32 = i3;
                        c1e c1eVar2 = c1e.a;
                        m40 m40Var2 = m40Var;
                        ye1 ye1Var2 = ye1Var;
                        switch (i32) {
                            case 0:
                                a81 a81Var = (a81) m40Var2;
                                ye1Var2.c(a81Var.t, a81Var.u, false);
                                break;
                            case 1:
                                z71 z71Var = (z71) m40Var2;
                                ye1Var2.c(z71Var.t, z71Var.v, true);
                                break;
                            case 2:
                                n81 n81Var = (n81) m40Var2;
                                ye1Var2.c(n81Var.t, n81Var.u, true);
                                break;
                            default:
                                m81 m81Var = (m81) m40Var2;
                                ye1Var2.c(m81Var.t, m81Var.v, false);
                                break;
                        }
                        return c1eVar2;
                    }
                }, n92Var);
                if (objR == tb2.COROUTINE_SUSPENDED) {
                    return objR;
                }
            } else if (m40Var instanceof y71) {
                Object objQ = yi2.Q(nhcVar, resources, n92Var);
                if (objQ == tb2.COROUTINE_SUSPENDED) {
                    return objQ;
                }
            } else if (m40Var instanceof n81) {
                final int i4 = 2;
                Object objU = qb8.U(nhcVar, resources, new m45() { // from class: we1
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i32 = i4;
                        c1e c1eVar2 = c1e.a;
                        m40 m40Var2 = m40Var;
                        ye1 ye1Var2 = ye1Var;
                        switch (i32) {
                            case 0:
                                a81 a81Var = (a81) m40Var2;
                                ye1Var2.c(a81Var.t, a81Var.u, false);
                                break;
                            case 1:
                                z71 z71Var = (z71) m40Var2;
                                ye1Var2.c(z71Var.t, z71Var.v, true);
                                break;
                            case 2:
                                n81 n81Var = (n81) m40Var2;
                                ye1Var2.c(n81Var.t, n81Var.u, true);
                                break;
                            default:
                                m81 m81Var = (m81) m40Var2;
                                ye1Var2.c(m81Var.t, m81Var.v, false);
                                break;
                        }
                        return c1eVar2;
                    }
                }, n92Var);
                if (objU == tb2.COROUTINE_SUSPENDED) {
                    return objU;
                }
            } else if (m40Var instanceof m81) {
                final int i5 = 3;
                Object objT = qb8.T(nhcVar, resources, new m45() { // from class: we1
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i32 = i5;
                        c1e c1eVar2 = c1e.a;
                        m40 m40Var2 = m40Var;
                        ye1 ye1Var2 = ye1Var;
                        switch (i32) {
                            case 0:
                                a81 a81Var = (a81) m40Var2;
                                ye1Var2.c(a81Var.t, a81Var.u, false);
                                break;
                            case 1:
                                z71 z71Var = (z71) m40Var2;
                                ye1Var2.c(z71Var.t, z71Var.v, true);
                                break;
                            case 2:
                                n81 n81Var = (n81) m40Var2;
                                ye1Var2.c(n81Var.t, n81Var.u, true);
                                break;
                            default:
                                m81 m81Var = (m81) m40Var2;
                                ye1Var2.c(m81Var.t, m81Var.v, false);
                                break;
                        }
                        return c1eVar2;
                    }
                }, n92Var);
                if (objT == tb2.COROUTINE_SUSPENDED) {
                    return objT;
                }
            } else if (m40Var instanceof l81) {
                Object objQ2 = yi2.Q(nhcVar, resources, n92Var);
                if (objQ2 == tb2.COROUTINE_SUSPENDED) {
                    return objQ2;
                }
            } else {
                if (m40Var instanceof v71) {
                    x45Var.invoke(((v71) m40Var).t);
                    return c1eVar;
                }
                if (m40Var instanceof w71) {
                    Object objQ3 = yi2.Q(nhcVar, resources, n92Var);
                    if (objQ3 == tb2.COROUTINE_SUSPENDED) {
                        return objQ3;
                    }
                } else if (m40Var instanceof f81) {
                    String string = resources.getString(R.string.common_make_catalog_public_successful, af1.b(((f81) m40Var).u, resources));
                    string.getClass();
                    Object objC = nhc.c(nhcVar, string, null, bhc.Short, n92Var, 6);
                    if (objC == tb2.COROUTINE_SUSPENDED) {
                        return objC;
                    }
                } else if (m40Var instanceof e81) {
                    String string2 = resources.getString(R.string.common_make_catalog_public_failed);
                    string2.getClass();
                    Object objC2 = nhc.c(nhcVar, string2, null, bhc.Long, n92Var, 6);
                    if (objC2 == tb2.COROUTINE_SUSPENDED) {
                        return objC2;
                    }
                } else {
                    if (m40Var instanceof b81) {
                        x45Var2.invoke(((b81) m40Var).t);
                        return c1eVar;
                    }
                    if (m40Var instanceof d81) {
                        String string3 = resources.getString(R.string.common_make_catalog_private_successful, af1.b(((d81) m40Var).u, resources));
                        string3.getClass();
                        Object objC3 = nhc.c(nhcVar, string3, null, bhc.Short, n92Var, 6);
                        if (objC3 == tb2.COROUTINE_SUSPENDED) {
                            return objC3;
                        }
                    } else if (m40Var instanceof c81) {
                        String string4 = resources.getString(R.string.common_make_catalog_private_failed);
                        string4.getClass();
                        Object objC4 = nhc.c(nhcVar, string4, null, bhc.Long, n92Var, 6);
                        if (objC4 == tb2.COROUTINE_SUSPENDED) {
                            return objC4;
                        }
                    } else if (g76.L(m40Var, p81.t)) {
                        Object objQ4 = yi2.Q(nhcVar, resources, n92Var);
                        if (objQ4 == tb2.COROUTINE_SUSPENDED) {
                            return objQ4;
                        }
                    } else if (m40Var instanceof j81) {
                        String string5 = resources.getString(R.string.common_report_catalog_successful);
                        string5.getClass();
                        Object objC5 = nhc.c(nhcVar, string5, null, bhc.Short, n92Var, 6);
                        if (objC5 == tb2.COROUTINE_SUSPENDED) {
                            return objC5;
                        }
                    } else if (m40Var instanceof i81) {
                        String string6 = resources.getString(R.string.common_report_catalog_failed);
                        string6.getClass();
                        Object objC6 = nhc.c(nhcVar, string6, null, bhc.Long, n92Var, 6);
                        if (objC6 == tb2.COROUTINE_SUSPENDED) {
                            return objC6;
                        }
                    } else if (g76.L(m40Var, h81.t)) {
                        Object objQ5 = yi2.Q(nhcVar, resources, n92Var);
                        if (objQ5 == tb2.COROUTINE_SUSPENDED) {
                            return objQ5;
                        }
                    } else {
                        if (m40Var instanceof u71) {
                            u71 u71Var = (u71) m40Var;
                            b55Var.invoke(u71Var.t, u71Var.u);
                            return c1eVar;
                        }
                        if (!g76.L(m40Var, t71.t)) {
                            ygf.a();
                            return null;
                        }
                        Object objQ6 = yi2.Q(nhcVar, resources, n92Var);
                        if (objQ6 == tb2.COROUTINE_SUSPENDED) {
                            return objQ6;
                        }
                    }
                }
            }
        }
        return c1eVar;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [boolean[], java.io.Serializable] */
    public static Boolean L(List list, um2 um2Var, x45 x45Var) {
        return (Boolean) F(list, um2Var, new tm2(x45Var, new boolean[1], 0));
    }

    public static int M(hd6 hd6Var, String str, int i2, int i3) {
        int iNextInt = hd6Var.nextInt();
        if (iNextInt >= i2 && iNextInt <= i3) {
            return iNextInt;
        }
        String strD = hd6Var.D();
        StringBuilder sbT = y30.t(iNextInt, "Expected ", str, " but was ", " at path ");
        sbT.append(strD);
        throw new JsonDataException(sbT.toString());
    }

    public static final due N(aq6 aq6Var) {
        due dueVar = aq6Var.o;
        if (dueVar != null) {
            return dueVar;
        }
        throw lv8.v("Required value was null.");
    }

    public static final void O(TextPaint textPaint, float f2) {
        if (Float.isNaN(f2)) {
            return;
        }
        if (f2 < 0.0f) {
            f2 = 0.0f;
        }
        if (f2 > 1.0f) {
            f2 = 1.0f;
        }
        textPaint.setAlpha(Math.round(f2 * 255.0f));
    }

    public static final String P(float f2) {
        if (Float.isNaN(f2)) {
            return "NaN";
        }
        if (Float.isInfinite(f2)) {
            return f2 < 0.0f ? "-Infinity" : "Infinity";
        }
        int iMax = Math.max(1, 0);
        float fPow = (float) Math.pow(10.0d, iMax);
        float f3 = f2 * fPow;
        int i2 = (int) f3;
        if (f3 - i2 >= 0.5f) {
            i2++;
        }
        float f4 = i2 / fPow;
        return iMax > 0 ? String.valueOf(f4) : String.valueOf((int) f4);
    }

    public static void Q(long[] jArr) {
        jArr[10] = 0;
        int i2 = 0;
        while (i2 < 10) {
            long j2 = jArr[i2];
            long j3 = j2 / 67108864;
            jArr[i2] = j2 - (j3 << 26);
            int i3 = i2 + 1;
            long j4 = jArr[i3] + j3;
            jArr[i3] = j4;
            long j5 = j4 / 33554432;
            jArr[i3] = j4 - (j5 << 25);
            i2 += 2;
            jArr[i2] = jArr[i2] + j5;
        }
        long j6 = jArr[0];
        long j7 = jArr[10];
        long j8 = j6 + (j7 << 4);
        jArr[0] = j8;
        long j9 = j8 + (j7 << 1);
        jArr[0] = j9;
        long j10 = j9 + j7;
        jArr[0] = j10;
        jArr[10] = 0;
        long j11 = j10 / 67108864;
        jArr[0] = j10 - (j11 << 26);
        jArr[1] = jArr[1] + j11;
    }

    public static void R(long[] jArr, long[] jArr2, long[] jArr3) {
        long[] jArr4 = new long[19];
        U(jArr4, jArr2, jArr3);
        S(jArr4);
        Q(jArr4);
        System.arraycopy(jArr4, 0, jArr, 0, 10);
    }

    public static void S(long[] jArr) {
        long j2 = jArr[8];
        long j3 = jArr[18];
        long j4 = j2 + (j3 << 4);
        jArr[8] = j4;
        long j5 = j4 + (j3 << 1);
        jArr[8] = j5;
        jArr[8] = j5 + j3;
        long j6 = jArr[7];
        long j7 = jArr[17];
        long j8 = j6 + (j7 << 4);
        jArr[7] = j8;
        long j9 = j8 + (j7 << 1);
        jArr[7] = j9;
        jArr[7] = j9 + j7;
        long j10 = jArr[6];
        long j11 = jArr[16];
        long j12 = j10 + (j11 << 4);
        jArr[6] = j12;
        long j13 = j12 + (j11 << 1);
        jArr[6] = j13;
        jArr[6] = j13 + j11;
        long j14 = jArr[5];
        long j15 = jArr[15];
        long j16 = j14 + (j15 << 4);
        jArr[5] = j16;
        long j17 = j16 + (j15 << 1);
        jArr[5] = j17;
        jArr[5] = j17 + j15;
        long j18 = jArr[4];
        long j19 = jArr[14];
        long j20 = j18 + (j19 << 4);
        jArr[4] = j20;
        long j21 = j20 + (j19 << 1);
        jArr[4] = j21;
        jArr[4] = j21 + j19;
        long j22 = jArr[3];
        long j23 = jArr[13];
        long j24 = j22 + (j23 << 4);
        jArr[3] = j24;
        long j25 = j24 + (j23 << 1);
        jArr[3] = j25;
        jArr[3] = j25 + j23;
        long j26 = jArr[2];
        long j27 = jArr[12];
        long j28 = j26 + (j27 << 4);
        jArr[2] = j28;
        long j29 = j28 + (j27 << 1);
        jArr[2] = j29;
        jArr[2] = j29 + j27;
        long j30 = jArr[1];
        long j31 = jArr[11];
        long j32 = j30 + (j31 << 4);
        jArr[1] = j32;
        long j33 = j32 + (j31 << 1);
        jArr[1] = j33;
        jArr[1] = j33 + j31;
        long j34 = jArr[0];
        long j35 = jArr[10];
        long j36 = j34 + (j35 << 4);
        jArr[0] = j36;
        long j37 = j36 + (j35 << 1);
        jArr[0] = j37;
        jArr[0] = j37 + j35;
    }

    public static void T(long[] jArr, long[] jArr2) {
        long j2 = jArr2[0];
        long j3 = j2 * 2;
        long j4 = jArr2[1];
        long j5 = jArr2[2];
        long j6 = jArr2[3];
        long j7 = jArr2[4];
        long j8 = jArr2[5];
        long j9 = jArr2[6];
        long j10 = jArr2[7];
        long j11 = jArr2[8];
        long j12 = jArr2[9];
        long[] jArr3 = {j2 * j2, j3 * j4, ((j2 * j5) + (j4 * j4)) * 2, ((j2 * j6) + (j4 * j5)) * 2, (j3 * j7) + (j4 * 4 * j6) + (j5 * j5), ((j2 * j8) + (j4 * j7) + (j5 * j6)) * 2, ((j4 * 2 * j8) + (j2 * j9) + (j5 * j7) + (j6 * j6)) * 2, ((j2 * j10) + (j4 * j9) + (j5 * j8) + (j6 * j7)) * 2, (((((j6 * j8) + (j4 * j10)) * 2) + (j2 * j11) + (j5 * j9)) * 2) + (j7 * j7), ((j2 * j12) + (j4 * j11) + (j5 * j10) + (j6 * j9) + (j7 * j8)) * 2, ((((j4 * j12) + (j6 * j10)) * 2) + (j5 * j11) + (j7 * j9) + (j8 * j8)) * 2, ((j5 * j12) + (j6 * j11) + (j7 * j10) + (j8 * j9)) * 2, (((((j6 * j12) + (j8 * j10)) * 2) + (j7 * j11)) * 2) + (j9 * j9), ((j7 * j12) + (j8 * j11) + (j9 * j10)) * 2, ((j8 * 2 * j12) + (j9 * j11) + (j10 * j10)) * 2, ((j9 * j12) + (j10 * j11)) * 2, (j10 * 4 * j12) + (j11 * j11), j11 * 2 * j12, 2 * j12 * j12};
        S(jArr3);
        Q(jArr3);
        System.arraycopy(jArr3, 0, jArr, 0, 10);
    }

    public static void U(long[] jArr, long[] jArr2, long[] jArr3) {
        jArr[0] = jArr2[0] * jArr3[0];
        long j2 = jArr2[0];
        long j3 = jArr3[1] * j2;
        long j4 = jArr2[1];
        long j5 = jArr3[0];
        jArr[1] = (j4 * j5) + j3;
        long j6 = jArr2[1];
        long j7 = jArr3[1];
        jArr[2] = (jArr2[2] * j5) + (jArr3[2] * j2) + (j6 * 2 * j7);
        long j8 = jArr3[2];
        long j9 = jArr2[2];
        jArr[3] = (jArr2[3] * j5) + (jArr3[3] * j2) + (j9 * j7) + (j6 * j8);
        long j10 = jArr3[3];
        long j11 = jArr2[3];
        jArr[4] = (jArr2[4] * j5) + (jArr3[4] * j2) + (((j11 * j7) + (j6 * j10)) * 2) + (j9 * j8);
        long j12 = jArr3[4];
        long j13 = (j6 * j12) + (j11 * j8) + (j9 * j10);
        long j14 = jArr2[4];
        jArr[5] = (jArr2[5] * j5) + (jArr3[5] * j2) + (j14 * j7) + j13;
        long j15 = jArr3[5];
        long j16 = jArr2[5];
        jArr[6] = (jArr2[6] * j5) + (jArr3[6] * j2) + (j14 * j8) + (j9 * j12) + (((j16 * j7) + (j6 * j15) + (j11 * j10)) * 2);
        long j17 = (j16 * j8) + (j9 * j15) + (j14 * j10) + (j11 * j12);
        long j18 = jArr3[6];
        long j19 = (j6 * j18) + j17;
        long j20 = jArr2[6];
        jArr[7] = (jArr2[7] * j5) + (jArr3[7] * j2) + (j20 * j7) + j19;
        long j21 = jArr3[7];
        long j22 = (j6 * j21) + (j16 * j10) + (j11 * j15);
        long j23 = jArr2[7];
        long j24 = (((j23 * j7) + j22) * 2) + (j14 * j12);
        jArr[8] = (jArr2[8] * j5) + (jArr3[8] * j2) + (j20 * j8) + (j9 * j18) + j24;
        long j25 = (j23 * j8) + (j9 * j21) + (j20 * j10) + (j11 * j18) + (j16 * j12) + (j14 * j15);
        long j26 = jArr3[8];
        long j27 = (j6 * j26) + j25;
        long j28 = jArr2[8];
        jArr[9] = (jArr2[9] * j5) + (j2 * jArr3[9]) + (j28 * j7) + j27;
        long j29 = (j23 * j10) + (j11 * j21) + (j16 * j15);
        long j30 = jArr3[9];
        long j31 = jArr2[9];
        long j32 = j14 * j18;
        jArr[10] = (j28 * j8) + (j9 * j26) + (j20 * j12) + j32 + (((j7 * j31) + (j6 * j30) + j29) * 2);
        long j33 = j9 * j30;
        long j34 = j8 * j31;
        jArr[11] = j34 + j33 + (j28 * j10) + (j11 * j26) + (j23 * j12) + (j14 * j21) + (j20 * j15) + (j16 * j18);
        long j35 = j11 * j30;
        long j36 = j10 * j31;
        long j37 = j28 * j12;
        jArr[12] = j37 + (j14 * j26) + ((j36 + j35 + (j23 * j15) + (j16 * j21)) * 2) + (j20 * j18);
        long j38 = j14 * j30;
        long j39 = j12 * j31;
        jArr[13] = j39 + j38 + (j28 * j15) + (j16 * j26) + (j23 * j18) + (j20 * j21);
        long j40 = j15 * j31;
        long j41 = j28 * j18;
        jArr[14] = j41 + (j20 * j26) + ((j40 + (j16 * j30) + (j23 * j21)) * 2);
        long j42 = j20 * j30;
        long j43 = j18 * j31;
        jArr[15] = j43 + j42 + (j28 * j21) + (j23 * j26);
        jArr[16] = (((j21 * j31) + (j23 * j30)) * 2) + (j28 * j26);
        jArr[17] = (j26 * j31) + (j28 * j30);
        jArr[18] = j31 * 2 * j30;
    }

    public static void V(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i2 = 0; i2 < 10; i2++) {
            jArr[i2] = jArr2[i2] - jArr3[i2];
        }
    }

    public static byte[] W(long[] jArr) {
        long j2;
        int[] iArr;
        int i2;
        int[] iArr2;
        long[] jArrCopyOf = Arrays.copyOf(jArr, 10);
        int i3 = 0;
        int i4 = 0;
        while (true) {
            j2 = 19;
            iArr = E;
            if (i4 >= 2) {
                break;
            }
            int i5 = 0;
            while (i5 < 9) {
                long j3 = jArrCopyOf[i5];
                int i6 = iArr[i5 & 1];
                int i7 = -((int) (((j3 >> 31) & j3) >> i6));
                jArrCopyOf[i5] = j3 + ((long) (i7 << i6));
                i5++;
                jArrCopyOf[i5] = jArrCopyOf[i5] - ((long) i7);
            }
            long j4 = jArrCopyOf[9];
            int i8 = -((int) (((j4 >> 31) & j4) >> 25));
            jArrCopyOf[9] = j4 + ((long) (i8 << 25));
            jArrCopyOf[0] = jArrCopyOf[0] - (((long) i8) * 19);
            i4++;
        }
        long j5 = jArrCopyOf[0];
        int i9 = -((int) (((j5 >> 31) & j5) >> 26));
        jArrCopyOf[0] = j5 + ((long) (i9 << 26));
        jArrCopyOf[1] = jArrCopyOf[1] - ((long) i9);
        int i10 = 0;
        while (true) {
            iArr2 = D;
            if (i10 >= 2) {
                break;
            }
            int i11 = i3;
            while (i11 < 9) {
                long j6 = jArrCopyOf[i11];
                int i12 = i11 & 1;
                int i13 = i3;
                int i14 = i10;
                int i15 = (int) (j6 >> iArr[i12]);
                jArrCopyOf[i11] = ((long) iArr2[i12]) & j6;
                i11++;
                jArrCopyOf[i11] = jArrCopyOf[i11] + ((long) i15);
                i3 = i13;
                j2 = j2;
                i10 = i14;
            }
            i10++;
        }
        int i16 = i3;
        long j7 = jArrCopyOf[9];
        jArrCopyOf[9] = j7 & 33554431;
        long j8 = (((long) ((int) (j7 >> 25))) * j2) + jArrCopyOf[i16];
        jArrCopyOf[i16] = j8;
        int i17 = ~((((int) j8) - 67108845) >> 31);
        for (int i18 = 1; i18 < 10; i18++) {
            int i19 = ~(((int) jArrCopyOf[i18]) ^ iArr2[i18 & 1]);
            int i20 = i19 & (i19 << 16);
            int i21 = i20 & (i20 << 8);
            int i22 = i21 & (i21 << 4);
            int i23 = i22 & (i22 << 2);
            i17 &= (i23 & (i23 << 1)) >> 31;
        }
        jArrCopyOf[i16] = jArrCopyOf[i16] - ((long) (67108845 & i17));
        long j9 = 33554431 & i17;
        jArrCopyOf[1] = jArrCopyOf[1] - j9;
        for (i2 = 2; i2 < 10; i2 += 2) {
            jArrCopyOf[i2] = jArrCopyOf[i2] - ((long) (67108863 & i17));
            int i24 = i2 + 1;
            jArrCopyOf[i24] = jArrCopyOf[i24] - j9;
        }
        for (int i25 = i16; i25 < 10; i25++) {
            jArrCopyOf[i25] = jArrCopyOf[i25] << C[i25];
        }
        byte[] bArr = new byte[32];
        for (int i26 = i16; i26 < 10; i26++) {
            int i27 = B[i26];
            long j10 = bArr[i27];
            long j11 = jArrCopyOf[i26];
            bArr[i27] = (byte) (j10 | (j11 & 255));
            bArr[i27 + 1] = (byte) (((long) bArr[r5]) | ((j11 >> 8) & 255));
            bArr[i27 + 2] = (byte) (((long) bArr[r5]) | ((j11 >> 16) & 255));
            bArr[i27 + 3] = (byte) (((long) bArr[r4]) | ((j11 >> 24) & 255));
        }
        return bArr;
    }

    public static void X(long[] jArr, long[] jArr2, long[] jArr3) {
        for (int i2 = 0; i2 < 10; i2++) {
            jArr[i2] = jArr2[i2] + jArr3[i2];
        }
    }

    public static final void a(x45 x45Var, r28 r28Var, x45 x45Var2, x12 x12Var, int i2, int i3) {
        int i4;
        r28 r28Var2;
        x45 x45Var3;
        fn fnVar = fn.n;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1783766393);
        if ((i2 & 6) == 0) {
            i4 = (p65Var.h(x45Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        int i5 = i3 & 2;
        if (i5 != 0) {
            i4 |= 48;
        } else if ((i2 & 48) == 0) {
            i4 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i6 = i3 & 4;
        if (i6 != 0) {
            i4 |= 384;
        } else if ((i2 & 384) == 0) {
            i4 |= p65Var.h(x45Var2) ? 256 : 128;
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            r28 r28Var3 = i5 != 0 ? o28.b : r28Var;
            x45 x45Var4 = i6 != 0 ? fnVar : x45Var2;
            b(x45Var, r28Var3, fnVar, x45Var4, p65Var, (i4 & 14) | 3072 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i4 << 6) & 57344));
            r28Var2 = r28Var3;
            x45Var3 = x45Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            x45Var3 = x45Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wo(x45Var, r28Var2, x45Var3, i2, i3, 1);
        }
    }

    public static final void b(x45 x45Var, r28 r28Var, x45 x45Var2, x45 x45Var3, x12 x12Var, int i2) {
        int i3;
        i89 i89Var;
        m73 m73Var;
        ip6 ip6Var;
        int i4;
        iy6 iy6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-180024211);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(x45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        int i5 = i3 | 384;
        if ((i2 & 3072) == 0) {
            i5 |= p65Var.h(x45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i5 |= p65Var.h(x45Var3) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            r28 r28VarR = gx1.R(p65Var, r28Var.b(dr4.b).b(cs4.b).b(fs4.b).b(as4.b));
            m73 m73Var2 = (m73) p65Var.j(z22.h);
            ip6 ip6Var2 = (ip6) p65Var.j(z22.n);
            i89 i89VarL = p65Var.l();
            iy6 iy6Var2 = (iy6) p65Var.j(y57.a);
            hpb hpbVar = (hpb) p65Var.j(d67.a);
            p65Var.Y(1314774735);
            int i7 = i5 & 14;
            long j3 = p65Var.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            Context context = (Context) p65Var.j(eo.b);
            n65 n65VarH = w2g.H(p65Var);
            qob qobVar = (qob) p65Var.j(sob.a);
            View view = (View) p65Var.j(eo.f);
            boolean zH = p65Var.h(context) | ((((i7 & 14) ^ 6) > 4 && p65Var.f(x45Var)) || (i7 & 6) == 4) | p65Var.h(n65VarH) | p65Var.h(qobVar) | p65Var.d(i8) | p65Var.h(view);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                i89Var = i89VarL;
                m73Var = m73Var2;
                ip6Var = ip6Var2;
                i4 = i6;
                iy6Var = iy6Var2;
                eu euVar = new eu(context, x45Var, n65VarH, qobVar, i8, view);
                p65Var.j0(euVar);
                objM = euVar;
            } else {
                i89Var = i89VarL;
                m73Var = m73Var2;
                ip6Var = ip6Var2;
                i4 = i6;
                iy6Var = iy6Var2;
            }
            m45 m45Var = (m45) objM;
            p65Var.T(null, 125, null, 1);
            p65Var.r = true;
            if (p65Var.S) {
                p65Var.k(m45Var);
            } else {
                p65Var.m0();
            }
            r12.W.getClass();
            tp7.B(p65Var, q12.e, i89Var);
            tp7.B(p65Var, cu.d, r28VarR);
            tp7.B(p65Var, cu.e, m73Var);
            tp7.B(p65Var, cu.f, iy6Var);
            tp7.B(p65Var, cu.g, hpbVar);
            tp7.B(p65Var, cu.h, ip6Var);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.B(p65Var, cu.b, x45Var3);
            tp7.B(p65Var, cu.c, x45Var2);
            p65Var.p(true);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new du(x45Var, r28Var, x45Var2, x45Var3, i2);
        }
    }

    public static final void c(sw5 sw5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1751032163);
        int i3 = (p65Var2.f(sw5Var) ? 4 : 2) | i2 | (p65Var2.f(r28Var) ? 32 : 16);
        int i4 = 1;
        int i5 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            amb ambVarA = bmb.a(2.0f);
            boolean z2 = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = qo7.u(Boolean.TRUE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            r28 r28VarN = bgf.N(op8.K(1.0f, r40.y(wo7.w(wo7.w(r28Var, 56.0f, null, op8.j(436207616), op8.j(436207616), 6), 16.0f, null, op8.j(637534208), op8.j(637534208), 6), ambVarA), true), "artwork");
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, zk7VarC);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            k40.c(u57.a.a(bo.a0(p65Var2)), pxf.E(-915110633, new b45(sw5Var, ambVarA, l78Var, i5), p65Var2), p65Var2, 56);
            if (((Boolean) l78Var.getValue()).booleanValue()) {
                p65Var2.Y(-139387841);
                p65Var = p65Var2;
                r28Var2 = r28Var;
                qv5.b(vn7.J(R.drawable.ic_story, 0, p65Var2), vo7.R(p65Var2, R.string.story), jfc.e(jfc.p(o28.b, 60.0f), 70.0f), xo7.f, p65Var, 392, 0);
            } else {
                p65Var = p65Var2;
                r28Var2 = r28Var;
                p65Var.Y(-153721621);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y35(sw5Var, r28Var2, i2, i4);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v5 */
    public static final void d(pq9 pq9Var, rq9 rq9Var, boolean z2, SourceParameter sourceParameter, b55 b55Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var;
        o28 o28Var;
        p65 p65Var2;
        ?? r2;
        float f2;
        p65 p65Var3;
        long j2;
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(86996858);
        int i3 = i2 | (p65Var4.f(pq9Var) ? 4 : 2) | (p65Var4.f(rq9Var) ? 32 : 16) | (p65Var4.g(z2) ? 256 : 128) | (p65Var4.f(sourceParameter) ? 2048 : 1024) | (p65Var4.h(b55Var) ? 16384 : 8192) | 196608;
        if (p65Var4.P(i3 & 1, (74899 & i3) != 74898)) {
            String strW = pq9Var.b;
            if (strW == null || muc.b0(strW)) {
                strW = null;
            }
            if (strW == null) {
                strW = km4.w(p65Var4, 1999612582, R.string.common_unknown_user, p65Var4, false);
            } else {
                p65Var4.Y(1999611249);
                p65Var4.p(false);
            }
            String str = strW;
            boolean z3 = pq9Var.e;
            o28 o28Var2 = o28.b;
            if (z3) {
                p65Var4.Y(1858578193);
                String str2 = pq9Var.a;
                r28 r28VarY = r40.y(jfc.f(o28Var2, 28.0f, 0.0f, 2), bmb.a(4.0f));
                boolean z4 = pq9Var.f && str2 != null;
                boolean zF = ((i3 & 7168) == 2048) | p65Var4.f(str2) | ((i3 & 57344) == 16384);
                Object objM = p65Var4.M();
                if (zF || objM == w12.a) {
                    objM = new le0(str2, b55Var, sourceParameter);
                    p65Var4.j0(objM);
                }
                r28 r28VarN = bgf.N(w2g.F(hlg.r(r28VarY, z4, str, null, (m45) objM, 12), 2.0f, 4.0f, 2.0f, 4.0f), "cta_author_picture_and_name");
                omb ombVarA = nmb.a(qb8.a, z46.n, p65Var4, 48);
                long j3 = p65Var4.T;
                int i4 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL = p65Var4.l();
                r28 r28VarR = gx1.R(p65Var4, r28VarN);
                r12.W.getClass();
                m45 m45Var = q12.b;
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(m45Var);
                } else {
                    p65Var4.m0();
                }
                tp7.B(p65Var4, q12.f, ombVarA);
                tp7.B(p65Var4, q12.e, i89VarL);
                tp7.B(p65Var4, q12.g, Integer.valueOf(i4));
                tp7.y(p65Var4, q12.h);
                tp7.B(p65Var4, q12.d, r28VarR);
                if (rq9Var == null || !rq9Var.d) {
                    p65Var4.Y(-1066622548);
                    r2 = 0;
                    f2 = 2.0f;
                    o28Var = o28Var2;
                    d46.a(pq9Var.c, hl0.XXXS, null, null, null, null, null, z2 ? 0.5f : 1.0f, 0, null, null, p65Var4, 48, 0, 3964);
                    p65 p65Var5 = p65Var4;
                    lv8.y(o28Var, 8.0f, p65Var5, false);
                    p65Var3 = p65Var5;
                } else {
                    p65Var4.Y(-1073743031);
                    p65Var4.p(false);
                    f2 = 2.0f;
                    o28Var = o28Var2;
                    r2 = 0;
                    p65Var3 = p65Var4;
                }
                sq6 sq6Var = new sq6(1.0f, r2);
                mkd mkdVar = ((bu7) p65Var3.j(jt7.c)).n;
                if (z2) {
                    p65Var3.Y(-1066049141);
                    j2 = ((zo7) p65Var3.j(kt7.b)).o;
                    p65Var3.p(r2);
                } else {
                    p65Var3.Y(-1065950003);
                    j2 = ((zo7) p65Var3.j(kt7.b)).n;
                    p65Var3.p(r2);
                }
                p65 p65Var6 = p65Var3;
                jjd.b(str, sq6Var, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(mkdVar, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var6, 0, 24960, 110588);
                p65 p65Var7 = p65Var6;
                if (pq9Var.d) {
                    p65Var7.Y(-1065777891);
                    o28 o28Var3 = o28Var;
                    o28Var = o28Var3;
                    w2g.e(vn7.J(R.drawable.ic_book_author, r2, p65Var7), vo7.R(p65Var7, R.string.book_author), w2g.i(w2g.G(o28Var3, f2, 0.0f, 0.0f, 0.0f, 14), z2 ? 0.5f : 1.0f), null, null, 0.0f, null, p65Var7, 8, 120);
                } else {
                    p65Var7.Y(-1073743031);
                }
                p65Var7.p(r2);
                p65Var7.p(true);
                p65Var7.p(r2);
                p65Var2 = p65Var7;
            } else {
                o28Var = o28Var2;
                p65Var4.Y(1860453755);
                zk7 zk7VarC = dy0.c(z46.d, false);
                long j4 = p65Var4.T;
                int i5 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL2 = p65Var4.l();
                r28 r28VarR2 = gx1.R(p65Var4, o28Var);
                r12.W.getClass();
                m45 m45Var2 = q12.b;
                p65Var4.c0();
                if (p65Var4.S) {
                    p65Var4.k(m45Var2);
                } else {
                    p65Var4.m0();
                }
                tp7.B(p65Var4, q12.f, zk7VarC);
                tp7.B(p65Var4, q12.e, i89VarL2);
                tp7.B(p65Var4, q12.g, Integer.valueOf(i5));
                tp7.y(p65Var4, q12.h);
                tp7.B(p65Var4, q12.d, r28VarR2);
                p65Var4.p(true);
                p65Var4.p(false);
                p65Var2 = p65Var4;
            }
            r28Var2 = o28Var;
            p65Var = p65Var2;
        } else {
            p65Var4.S();
            r28Var2 = r28Var;
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ke0(pq9Var, rq9Var, z2, sourceParameter, b55Var, r28Var2, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:101:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a5 A[PHI: r14
      0x00a5: PHI (r14v12 int) = (r14v0 int), (r14v5 int), (r14v6 int) binds: [B:57:0x00a3, B:67:0x00bb, B:66:0x00b8] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00ca  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x0156  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.pq9 r19, defpackage.rq9 r20, boolean r21, gen.model.SourceParameter r22, defpackage.b55 r23, defpackage.b55 r24, defpackage.r28 r25, com.medium.android.graphql.type.PublicationSubmissionStatus r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 362
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vc2.e(pq9, rq9, boolean, gen.model.SourceParameter, b55, b55, r28, com.medium.android.graphql.type.PublicationSubmissionStatus, x12, int, int):void");
    }

    public static final void f(nhe nheVar, khe kheVar, r28 r28Var, x12 x12Var, int i2) {
        char c2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(324677270);
        int i3 = i2 | (p65Var.f(nheVar) ? 4 : 2) | (p65Var.f(kheVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "blocked_state"), 3, 1.0f);
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
            p65Var.Y(-2063028505);
            kx kxVar = new kx();
            String strW = nheVar.a;
            if (strW == null) {
                c2 = 0;
                strW = km4.w(p65Var, 1385516352, R.string.common_unknown_user, p65Var, false);
            } else {
                c2 = 0;
                p65Var.Y(1385515670);
                p65Var.p(false);
            }
            Object[] objArr = new Object[1];
            objArr[c2] = strW;
            kxVar.d(vo7.Q(R.string.user_profile_posts_user_blocked, objArr, p65Var));
            kxVar.d(" ");
            p65Var.Y(-2063019339);
            wjd wjdVar = new wjd(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), null, 14);
            boolean z2 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new bf0(kheVar, 10, nheVar);
                p65Var.j0(objM);
            }
            int iV = ho2.v("learn_more", wjdVar, (e07) objM, kxVar);
            try {
                kxVar.d(vo7.R(p65Var, R.string.common_learn_more));
                kxVar.f(iV);
                p65Var.p(false);
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                jjd.c(mxVarI, iy0.a.a(jfc.d(w2g.C(o28Var, 24.0f), 1.0f), ar0Var), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 0, 0, 262140);
                p65Var.p(true);
                p65Var.p(true);
            } catch (Throwable th) {
                kxVar.f(iV);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 18, nheVar, kheVar, r28Var);
        }
    }

    public static final void g(sw5 sw5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(416140985);
        int i3 = 2;
        int i4 = (p65Var.f(sw5Var) ? 4 : 2) | i2 | 48;
        int i5 = 0;
        if (!p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            p65Var.S();
        } else {
            if (sw5Var == null) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new x35(sw5Var, i2, i3);
                    return;
                }
                return;
            }
            k40.c(u57.a.a(bo.a0(p65Var)), pxf.E(1748444025, new x35(sw5Var, i5), p65Var), p65Var, 56);
            r28Var = o28.b;
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new y35(sw5Var, r28Var, i2, i5);
        }
    }

    public static final void h(jt0 jt0Var, int i2, khe kheVar, r28 r28Var, x12 x12Var, int i3) {
        int i4;
        p65 p65Var;
        jt0 jt0Var2;
        int i5;
        uob uobVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-737514060);
        if ((i3 & 6) == 0) {
            i4 = (p65Var2.f(jt0Var) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var2.d(i2) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= (i3 & 512) == 0 ? p65Var2.f(kheVar) : p65Var2.h(kheVar) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i4 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i8, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 20.0f, 20.0f, 20.0f, 12.0f);
            omb ombVarA = nmb.a(qb8.f, z46.m, p65Var2, 6);
            long j5 = p65Var2.T;
            int i9 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28VarF);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i9, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            String strR = vo7.R(p65Var2, R.string.user_profile_posts_header_books);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 0, 0, 131070);
            p65Var = p65Var2;
            uob uobVar2 = w12.a;
            if (i2 > 1) {
                p65Var.Y(-251678026);
                String strQ = vo7.Q(R.string.see_all, new Object[]{Integer.valueOf(i2)}, p65Var);
                mkd mkdVarA = mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                r28 r28VarY = r40.y(o28Var, bmb.a(4.0f));
                boolean z2 = (i4 & 896) == 256 || ((i4 & 512) != 0 && p65Var.h(kheVar));
                Object objM = p65Var.M();
                if (z2 || objM == uobVar2) {
                    i5 = i4;
                    k8e k8eVar = new k8e(0, kheVar, khe.class, "seeAllBooks", "seeAllBooks()V", 0, 11);
                    p65Var.j0(k8eVar);
                    objM = k8eVar;
                } else {
                    i5 = i4;
                }
                uobVar = uobVar2;
                jjd.b(strQ, bgf.N(w2g.C(hlg.r(r28VarY, false, null, new vkb(0), (m45) ((qh6) objM), 11), 4.0f), "see_all_books_button"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 131068);
                p65Var = p65Var;
            } else {
                i5 = i4;
                uobVar = uobVar2;
                p65Var.Y(-276872377);
            }
            p65Var.p(false);
            p65Var.p(true);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 6.0f, 2);
            int i10 = i5;
            boolean z3 = (i10 & 896) == 256 || ((i10 & 512) != 0 && p65Var.h(kheVar));
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                hgb hgbVar = new hgb(1, kheVar, khe.class, "onBookSelected", "onBookSelected(Lcom/medium/android/profile/ui/books/BookUiModel;)V", 0, 19);
                p65Var.j0(hgbVar);
                objM2 = hgbVar;
            }
            jt0Var2 = jt0Var;
            hlg.g(jt0Var2, (x45) ((qh6) objM2), r28VarG, p65Var, (i10 & 14) | 384);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var = p65Var2;
            jt0Var2 = jt0Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(jt0Var2, i2, kheVar, r28Var, i3, 20);
        }
    }

    public static final void i(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        long j4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1428565879);
        int i3 = i2 | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j4 = j2;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j5 = p65Var.T;
            int i4 = (int) (j5 ^ (j5 >>> 32));
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
            long j6 = p65Var.T;
            int i5 = (int) (j6 ^ (j6 >>> 32));
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
            long j7 = p65Var.T;
            int i6 = (int) (j7 ^ (j7 >>> 32));
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
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 24.0f, 24.0f, 16.0f);
            omb ombVarA = nmb.a(qb8.f, z46.m, p65Var, 6);
            long j8 = p65Var.T;
            int i7 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            sn3 sn3Var = jt7.c;
            ok7.r(108.0f, 48, 4, j4, p65Var, null, ((bu7) p65Var.j(sn3Var)).j);
            ok7.r(60.0f, 48, 4, j4, p65Var, null, ((bu7) p65Var.j(sn3Var)).m);
            p65Var.p(true);
            hlg.h(6, j4, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 6.0f, 2));
            b09.H(p65Var, true, true, true);
            j3 = j4;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j3, i2, 24);
        }
    }

    public static final void k(l78 l78Var, boolean z2) {
        l78Var.setValue(Boolean.valueOf(z2));
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0289  */
    /* JADX WARN: Removed duplicated region for block: B:104:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x02c7  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0329  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x03a4  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0226  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0269  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x026b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0273  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x027b  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x027d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.rq9 r56, defpackage.pq9 r57, boolean r58, gen.model.SourceParameter r59, defpackage.b55 r60, defpackage.r28 r61, com.medium.android.graphql.type.PublicationSubmissionStatus r62, defpackage.x12 r63, int r64) {
        /*
            Method dump skipped, instruction units count: 1060
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vc2.l(rq9, pq9, boolean, gen.model.SourceParameter, b55, r28, com.medium.android.graphql.type.PublicationSubmissionStatus, x12, int):void");
    }

    public static final void m(lt1 lt1Var, jt1 jt1Var, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1599132441);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(lt1Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(jt1Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(cs1Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            l78 l78VarX = guc.x(jt1Var.u, bt4.NOT_FOLLOWING, p65Var, 48);
            int i5 = tr1.a[((bt4) l78VarX.getValue()).ordinal()];
            int i6 = 3;
            if (i5 == 1 || i5 == 2) {
                p65Var.Y(-22295298);
                boolean z2 = ((bt4) l78VarX.getValue()) == bt4.FOLLOWING;
                tw8 tw8Var = tw8.S;
                int i7 = i3 & 896;
                int i8 = i3 & 14;
                boolean z3 = (i7 == 256) | (i8 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z3 || objM == uobVar) {
                    objM = new qr1(cs1Var, lt1Var, i4);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                boolean z4 = (i8 == 4) | (i7 == 256);
                Object objM2 = p65Var.M();
                if (z4 || objM2 == uobVar) {
                    objM2 = new qr1(cs1Var, lt1Var, i6);
                    p65Var.j0(objM2);
                }
                pr7.f(z2, tw8Var, m45Var, (m45) objM2, jfc.q(r28Var, 100.0f, 0.0f, 2), false, p65Var, 48, 32);
                p65Var.p(false);
            } else {
                if (i5 != 3 && i5 != 4) {
                    throw ho2.L(p65Var, -832006224, false);
                }
                p65Var.Y(-21468714);
                hp7.t(p65Var, r28Var);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 11, lt1Var, jt1Var, cs1Var, r28Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x03b6  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x03c3  */
    /* JADX WARN: Removed duplicated region for block: B:99:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.lt1 r38, defpackage.cs1 r39, defpackage.r28 r40, boolean r41, defpackage.x12 r42, int r43, int r44) {
        /*
            Method dump skipped, instruction units count: 980
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vc2.n(lt1, cs1, r28, boolean, x12, int, int):void");
    }

    public static final void o(lt1 lt1Var, kt1 kt1Var, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1621293865);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(lt1Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(kt1Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(cs1Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            l78 l78VarX = guc.x(kt1Var.u, d88.NOT_MUTED, p65Var, 48);
            int i6 = tr1.b[((d88) l78VarX.getValue()).ordinal()];
            if (i6 == 1 || i6 == 2) {
                p65Var.Y(-1236304243);
                boolean z2 = ((d88) l78VarX.getValue()) == d88.MUTED;
                xn7 xn7Var = xn7.S;
                int i7 = i3 & 896;
                int i8 = i3 & 14;
                boolean z3 = (i7 == 256) | (i8 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z3 || objM == uobVar) {
                    objM = new qr1(cs1Var, lt1Var, i4);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                boolean z4 = (i7 == 256) | (i8 == 4);
                Object objM2 = p65Var.M();
                if (z4 || objM2 == uobVar) {
                    objM2 = new qr1(cs1Var, lt1Var, i5);
                    p65Var.j0(objM2);
                }
                ok7.c(z2, xn7Var, m45Var, (m45) objM2, r28Var, false, p65Var, ((i3 << 3) & 57344) | 48);
                p65Var.p(false);
            } else {
                if (i6 != 3 && i6 != 4) {
                    throw ho2.L(p65Var, -1009714707, false);
                }
                p65Var.Y(-1235544154);
                hp7.t(p65Var, r28Var);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 10, lt1Var, kt1Var, cs1Var, r28Var);
        }
    }

    public static final void p(ohe oheVar, sh9 sh9Var, khe kheVar, r28 r28Var, kv6 kv6Var, x12 x12Var, int i2) {
        khe kheVar2 = kheVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(506809627);
        int i3 = i2 | (p65Var.f(oheVar) ? 4 : 2) | (p65Var.f(sh9Var) ? 32 : 16) | (p65Var.f(kheVar2) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(kv6Var) ? 16384 : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            int size = oheVar.a.size();
            r28 r28VarN = bgf.N(r28Var, "content_state");
            int i4 = i3 & 896;
            boolean zD = ((i3 & 14) == 4) | (i4 == 256) | p65Var.d(stcVar.ordinal()) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | p65Var.d(size);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                vv1 vv1Var = new vv1(size, 1, oheVar, kheVar2, stcVar, sh9Var);
                kheVar2 = kheVar2;
                p65Var.j0(vv1Var);
                objM = vv1Var;
            }
            k40.t(r28VarN, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, (i3 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 508);
            p65Var = p65Var;
            boolean z2 = ((i3 & 57344) == 16384) | (i4 == 256);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new cfd(kv6Var, kheVar2, null, 12);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
            cie cieVar = kheVar2.b;
            if (!cieVar.s) {
                cieVar.s = true;
                cieVar.j.j(cieVar.c, gp7.u(cieVar.r), cieVar.q);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(oheVar, sh9Var, kheVar2, r28Var, kv6Var, i2, 15);
        }
    }

    public static final oo q(String str) {
        return new oo(qo7.B(str));
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x01d3  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(defpackage.ub0 r28, gen.model.SourceParameter r29, defpackage.i3c r30, defpackage.i45 r31, defpackage.r28 r32, defpackage.x12 r33, int r34) {
        /*
            Method dump skipped, instruction units count: 608
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vc2.r(ub0, gen.model.SourceParameter, i3c, i45, r28, x12, int):void");
    }

    public static final void s(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1445986361);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            dy0.a(flb.a0(jfc.e(jfc.p(bgf.N(r28Var, "drag_handle"), 40.0f), 4.0f), uu1.b(0.15f, uu1.d), bmb.a(2.0f)), p65Var, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 3);
        }
    }

    public static final void t(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1079498626);
        int i3 = i2 | 6;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.common_edit_unsupported);
            mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).i;
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            jjd.b(strR, w2g.D(bo.B(jfc.d(o28Var, 1.0f), 1.0f, ((zo7) p65Var2.j(kt7.b)).y, bmb.a(5.0f)), 20.0f, 16.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkdVar, p65Var, 0, 0, 130044);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var2, i2, 19);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v13 */
    /* JADX WARN: Type inference failed for: r1v14 */
    /* JADX WARN: Type inference failed for: r1v2 */
    /* JADX WARN: Type inference failed for: r1v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r5v4 */
    /* JADX WARN: Type inference failed for: r5v6 */
    /* JADX WARN: Type inference failed for: r5v7 */
    public static final void u(phe pheVar, khe kheVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        ar0 ar0Var;
        ar0 ar0Var2;
        fn fnVar;
        cu cuVar;
        uhe uheVar;
        cu cuVar2;
        cu cuVar3;
        cu cuVar4;
        o28 o28Var;
        m45 m45Var;
        rh4 rh4Var;
        ?? r1;
        int i3;
        p65 p65Var2;
        String strQ;
        phe pheVar2 = pheVar;
        ar0 ar0Var3 = z46.d;
        ar0 ar0Var4 = z46.h;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-380186058);
        int i4 = i2 | (p65Var3.f(pheVar2) ? 4 : 2) | (p65Var3.f(kheVar) ? 32 : 16) | (p65Var3.f(r28Var) ? 256 : 128);
        if (p65Var3.P(i4 & 1, (i4 & 147) != 146)) {
            rh4 rh4Var2 = jfc.c;
            r28 r28VarN = bgf.N(r28Var.b(rh4Var2), "empty_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j2 = p65Var3.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarN);
            r12.W.getClass();
            m45 m45Var2 = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var2);
            } else {
                p65Var3.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var3, cuVar5, wv1VarA);
            cu cuVar6 = q12.e;
            tp7.B(p65Var3, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar7 = q12.g;
            tp7.B(p65Var3, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var3, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var3, cuVar8, r28VarR);
            uhe uheVar2 = pheVar2.c;
            boolean z2 = uheVar2 instanceof rhe;
            o28 o28Var2 = o28.b;
            if (z2) {
                p65Var3.Y(183736460);
                rhe rheVar = (rhe) uheVar2;
                int i6 = ((i4 << 3) & 896) | 3072;
                uheVar = uheVar2;
                cuVar3 = cuVar5;
                h(rheVar.a, rheVar.b, kheVar, bgf.N(o28Var2, "user_profile_posts_book_section"), p65Var3, i6);
                r28 r28VarJ = ka1.j((jp7) p65Var3.j(kt7.a), o28Var2, 3, 1.0f);
                zk7 zk7VarC = dy0.c(ar0Var4, false);
                long j3 = p65Var3.T;
                int i7 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var3.l();
                r28 r28VarR2 = gx1.R(p65Var3, r28VarJ);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(m45Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar3, zk7VarC);
                tp7.B(p65Var3, cuVar6, i89VarL2);
                ka1.z(i7, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(ar0Var3, false);
                long j4 = p65Var3.T;
                int i8 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL3 = p65Var3.l();
                r28 r28VarR3 = gx1.R(p65Var3, r28VarD);
                p65Var3.c0();
                if (p65Var3.S) {
                    p65Var3.k(m45Var2);
                } else {
                    p65Var3.m0();
                }
                tp7.B(p65Var3, cuVar3, zk7VarC2);
                tp7.B(p65Var3, cuVar6, i89VarL3);
                ka1.z(i8, p65Var3, cuVar7, p65Var3, fnVar2);
                tp7.B(p65Var3, cuVar8, r28VarR3);
                rh4Var = rh4Var2;
                cuVar2 = cuVar6;
                ar0Var = ar0Var3;
                m45Var = m45Var2;
                ar0Var2 = ar0Var4;
                r1 = 0;
                cuVar4 = cuVar8;
                cuVar = cuVar7;
                i3 = 1;
                fnVar = fnVar2;
                o28Var = o28Var2;
                jjd.b(vo7.R(p65Var3, R.string.user_profile_posts_header_stories), w2g.G(bgf.N(jfc.d(o28Var2, 1.0f), "user_profile_posts_posts_header"), 24.0f, 24.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var3.j(jt7.c)).j, p65Var3, 0, 0, 131068);
                p65 p65Var4 = p65Var3;
                b09.H(p65Var4, true, true, false);
                p65Var2 = p65Var4;
            } else {
                ar0Var = ar0Var3;
                ar0Var2 = ar0Var4;
                fnVar = fnVar2;
                cuVar = cuVar7;
                uheVar = uheVar2;
                cuVar2 = cuVar6;
                cuVar3 = cuVar5;
                cuVar4 = cuVar8;
                o28Var = o28Var2;
                m45Var = m45Var2;
                rh4Var = rh4Var2;
                r1 = 0;
                r1 = 0;
                i3 = 1;
                i3 = 1;
                if (uheVar instanceof the) {
                    p65Var3.Y(-548233557);
                    i(0, 0L, p65Var3, bgf.N(m40.V(o28Var, p65Var3, 6), "user_profile_posts_book_section"));
                    p65Var3.p(false);
                    p65Var2 = p65Var3;
                } else {
                    if (!(uheVar instanceof she)) {
                        throw ho2.L(p65Var3, -548265517, false);
                    }
                    p65Var3.Y(-548225692);
                    p65Var3.p(false);
                    p65Var2 = p65Var3;
                }
            }
            hp7.t(p65Var2, jfc.l(o28Var, 24.0f));
            boolean z3 = uheVar instanceof she;
            r28 r28Var2 = z3 ? rh4Var : o28Var;
            zk7 zk7VarC3 = dy0.c(z3 ? ar0Var2 : ar0Var, r1);
            long j5 = p65Var2.T;
            int i9 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, r28Var2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(m45Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar3, zk7VarC3);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i9, p65Var2, cuVar, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            pheVar2 = pheVar;
            if (pheVar2.b) {
                strQ = km4.w(p65Var2, 118856398, R.string.user_profile_posts_user_empty_you, p65Var2, r1);
            } else {
                p65Var2.Y(118955629);
                String strW = pheVar2.a;
                if (strW == null) {
                    strW = km4.w(p65Var2, -1381631674, R.string.common_unknown_user, p65Var2, r1);
                } else {
                    p65Var2.Y(-1381632356);
                    p65Var2.p(r1);
                }
                Object[] objArr = new Object[i3];
                objArr[r1] = strW;
                strQ = vo7.Q(R.string.user_profile_posts_user_empty_other, objArr, p65Var2);
                p65Var2.p(r1);
            }
            p65 p65Var5 = p65Var2;
            jjd.b(strQ, jfc.d(w2g.E(bgf.N(o28Var, "user_profile_posts_user_empty"), 24.0f, 0.0f, 2), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 0, 130044);
            p65 p65Var6 = p65Var5;
            p65Var6.p(i3);
            p65Var6.p(i3);
            p65Var = p65Var6;
        } else {
            p65Var3.S();
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 17, pheVar2, kheVar, r28Var);
        }
    }

    public static final void v(qhe qheVar, khe kheVar, r28 r28Var, x12 x12Var, int i2) {
        qhe qheVar2 = qheVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(250152790);
        int i3 = i2 | (p65Var.f(qheVar2) ? 4 : 2) | (p65Var.f(kheVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            qheVar2 = qheVar;
            b24 b24Var = qheVar2.a;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                k8e k8eVar = new k8e(0, kheVar, khe.class, "refresh", "refresh()V", 0, 13);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            }
            iq7.a(b24Var, null, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 190);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 19, qheVar2, kheVar, r28Var);
        }
    }

    public static final void w(ub0 ub0Var, i45 i45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        i45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-42309230);
        int i3 = i2 | (p65Var.f(ub0Var) ? 4 : 2);
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(i45Var) ? 32 : 16;
        }
        int i4 = i3 | 3072;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            sb2 sb2Var = (sb2) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ul(j45.Collapsed);
                p65Var.j0(objM2);
            }
            ul ulVar = (ul) objM2;
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "full_player");
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            rh4 rh4Var = jfc.c;
            r28 r28VarN2 = bgf.N(flb.a0(rh4Var, uu1.b(0.5f, xo7.i), rv8.r), "overlay");
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM3;
            boolean zH = p65Var.h(sb2Var);
            int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = zH | (i6 == 32);
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                objM4 = new le0(sb2Var, ulVar, i45Var, 26);
                p65Var.j0(objM4);
            }
            dy0.a(hlg.p(r28VarN2, m68Var, null, false, null, (m45) objM4, 28), p65Var, 0);
            r40.h(rh4Var, z46.h, pxf.E(664622646, new gx4(ulVar, ub0Var, i45Var, 5), p65Var), p65Var, 3126, 4);
            p65Var.p(true);
            Object value = ulVar.c.getValue();
            boolean z3 = i6 == 32;
            Object objM5 = p65Var.M();
            if (z3 || objM5 == uobVar) {
                objM5 = new f45(ulVar, i45Var, null, 1);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, value);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 22, ub0Var, i45Var, r28Var2);
        }
    }

    public static final void y(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1888398538);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z2 = false;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, i3 & 14), "loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-2101123301);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z2);
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
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z2);
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
                stc stcVar2 = stcVar;
                il7.l(stcVar2, null, 0L, null, p65Var, 0, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                stcVar = stcVar2;
                z2 = false;
            }
            p65Var.p(z2);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 12);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:91:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void z(defpackage.whe r24, defpackage.lhe r25, defpackage.khe r26, defpackage.sh9 r27, defpackage.r28 r28, defpackage.nhc r29, defpackage.kv6 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 369
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vc2.z(whe, lhe, khe, sh9, r28, nhc, kv6, x12, int, int):void");
    }

    public static final void j(ub0 ub0Var, SourceParameter sourceParameter, final i3c i3cVar, i45 i45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        final i3c i3cVar2;
        o28 o28Var;
        uob uobVar;
        boolean z2;
        char c2;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1227840601);
        int i4 = i2 | (p65Var.f(ub0Var) ? 4 : 2) | (p65Var.f("") ? 32 : 16) | (p65Var.f(sourceParameter) ? 256 : 128) | (p65Var.f(i3cVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(i45Var) ? 16384 : 8192);
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.f, z46.n, p65Var, 54);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            int i6 = 57344 & i4;
            boolean z3 = i6 == 16384;
            int i7 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z4 = z3 | (i7 == 32);
            int i8 = i4 & 896;
            boolean z5 = z4 | (i8 == 256);
            Object objM2 = p65Var.M();
            if (z5 || objM2 == uobVar2) {
                i3 = i4;
                objM2 = new gd3(i45Var, 22, sourceParameter);
                p65Var.j0(objM2);
            } else {
                i3 = i4;
            }
            o28 o28Var2 = o28.b;
            f76.w((m45) objM2, bgf.N(o28Var2, "speech_rate"), false, null, null, null, pxf.E(-662874630, new g64(ub0Var, 14, i3cVar), p65Var), p65Var, 805306416, 508);
            if (ub0Var.o != null) {
                p65Var.Y(-1783566610);
                boolean z6 = ((i3 & 14) == 4) | (i6 == 16384) | (i7 == 32) | (i8 == 256);
                Object objM3 = p65Var.M();
                if (z6) {
                    uobVar = uobVar2;
                } else {
                    uobVar = uobVar2;
                    if (objM3 == uobVar) {
                    }
                    o28Var = o28Var2;
                    final int i9 = 0;
                    c2 = ' ';
                    z2 = false;
                    i3cVar2 = i3cVar;
                    f49.l((m45) objM3, bgf.N(o28Var, "share"), false, null, null, pxf.E(158182070, new b55() { // from class: c45
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i10 = i9;
                            c1e c1eVar = c1e.a;
                            o28 o28Var3 = o28.b;
                            i3c i3cVar3 = i3cVar;
                            x12 x12Var2 = (x12) obj;
                            int iIntValue = ((Integer) obj2).intValue();
                            switch (i10) {
                                case 0:
                                    p65 p65Var2 = (p65) x12Var2;
                                    if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                        p65Var2.S();
                                    } else {
                                        qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_share), er7.A(o28Var3, i3cVar3), uu1.d, p65Var2, 3080, 0);
                                    }
                                    break;
                                default:
                                    p65 p65Var3 = (p65) x12Var2;
                                    if (!p65Var3.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                        p65Var3.S();
                                    } else {
                                        qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var3), vo7.R(p65Var3, R.string.menu), er7.A(o28Var3, i3cVar3), uu1.d, p65Var3, 3080, 0);
                                    }
                                    break;
                            }
                            return c1eVar;
                        }
                    }, p65Var), p65Var, 1572912, 60);
                }
                objM3 = new z35(i45Var, ub0Var, sourceParameter);
                p65Var.j0(objM3);
                o28Var = o28Var2;
                final int i92 = 0;
                c2 = ' ';
                z2 = false;
                i3cVar2 = i3cVar;
                f49.l((m45) objM3, bgf.N(o28Var, "share"), false, null, null, pxf.E(158182070, new b55() { // from class: c45
                    @Override // defpackage.b55
                    public final Object invoke(Object obj, Object obj2) {
                        int i10 = i92;
                        c1e c1eVar = c1e.a;
                        o28 o28Var3 = o28.b;
                        i3c i3cVar3 = i3cVar;
                        x12 x12Var2 = (x12) obj;
                        int iIntValue = ((Integer) obj2).intValue();
                        switch (i10) {
                            case 0:
                                p65 p65Var2 = (p65) x12Var2;
                                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                    p65Var2.S();
                                } else {
                                    qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_share), er7.A(o28Var3, i3cVar3), uu1.d, p65Var2, 3080, 0);
                                }
                                break;
                            default:
                                p65 p65Var3 = (p65) x12Var2;
                                if (!p65Var3.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                    p65Var3.S();
                                } else {
                                    qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var3), vo7.R(p65Var3, R.string.menu), er7.A(o28Var3, i3cVar3), uu1.d, p65Var3, 3080, 0);
                                }
                                break;
                        }
                        return c1eVar;
                    }
                }, p65Var), p65Var, 1572912, 60);
            } else {
                i3cVar2 = i3cVar;
                o28Var = o28Var2;
                uobVar = uobVar2;
                z2 = false;
                c2 = ' ';
                p65Var.Y(-1802071099);
            }
            p65Var.p(z2);
            zk7 zk7VarC = dy0.c(z46.d, z2);
            long j3 = p65Var.T;
            int i10 = (int) (j3 ^ (j3 >>> c2));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                l78Var = l78Var2;
                objM4 = new ei4(l78Var, 4);
                p65Var.j0(objM4);
            } else {
                l78Var = l78Var2;
            }
            final int i11 = 1;
            l78 l78Var3 = l78Var;
            f49.l((m45) objM4, bgf.N(o28Var, AXoTRPEGKEve.GQIdzPn), false, null, null, pxf.E(1227405409, new b55() { // from class: c45
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i102 = i11;
                    c1e c1eVar = c1e.a;
                    o28 o28Var3 = o28.b;
                    i3c i3cVar3 = i3cVar2;
                    x12 x12Var2 = (x12) obj;
                    int iIntValue = ((Integer) obj2).intValue();
                    switch (i102) {
                        case 0:
                            p65 p65Var2 = (p65) x12Var2;
                            if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                p65Var2.S();
                            } else {
                                qv5.b(vn7.J(R.drawable.ic_share_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_share), er7.A(o28Var3, i3cVar3), uu1.d, p65Var2, 3080, 0);
                            }
                            break;
                        default:
                            p65 p65Var3 = (p65) x12Var2;
                            if (!p65Var3.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                                p65Var3.S();
                            } else {
                                qv5.b(vn7.J(R.drawable.ic_more_24, 0, p65Var3), vo7.R(p65Var3, R.string.menu), er7.A(o28Var3, i3cVar3), uu1.d, p65Var3, 3080, 0);
                            }
                            break;
                    }
                    return c1eVar;
                }
            }, p65Var), p65Var, 1572918, 60);
            boolean zBooleanValue = ((Boolean) l78Var3.getValue()).booleanValue();
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new ei4(l78Var3, 5);
                p65Var.j0(objM5);
            }
            xp7.b(zBooleanValue, (m45) objM5, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-151277570, new ov2(ub0Var, i45Var, sourceParameter, l78Var3, 6), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new a45(ub0Var, sourceParameter, i3cVar, i45Var, r28Var, i2, 1);
        }
    }

    public static final void x(ub0 ub0Var, i45 i45Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        x45 x45Var2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-947830340);
        int i3 = i2 | (p65Var.f(ub0Var) ? 4 : 2) | (p65Var.f(i45Var) ? 32 : 16) | (p65Var.f("") ? 256 : 128) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            String str = ub0Var.a;
            float f2 = ub0Var.g;
            SourceParameter sourceParameter = new SourceParameter(bPUi.QmEP, null, null, null, null, str, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -34, 8191, null);
            i3c i3cVar = new i3c(4.0f, uu1.b(0.6f, xo7.i), (((long) Float.floatToRawIntBits(2.0f)) << 32) | (((long) Float.floatToRawIntBits(2.0f)) & 4294967295L));
            boolean zC = p65Var.c(f2);
            Object objM = p65Var.M();
            if (zC || objM == w12.a) {
                objM = new g49(f2);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            x45Var2 = x45Var;
            g3d.a(guc.R(o28Var, x45Var2).b(jfc.c), bmb.b(22.0f, 22.0f, 0.0f, 0.0f), 0L, 0L, 0.0f, 12.0f, null, pxf.E(-274250921, new e45(ub0Var, i45Var, i3cVar, (g49) objM, sourceParameter, 0), p65Var), p65Var, 12779520, 92);
            r28Var2 = o28Var;
        } else {
            x45Var2 = x45Var;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 9, r28Var2, (Object) ub0Var, (Object) i45Var, (Object) x45Var2);
        }
    }
}
