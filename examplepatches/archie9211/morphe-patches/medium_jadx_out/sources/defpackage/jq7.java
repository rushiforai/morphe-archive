package defpackage;

import android.os.Build;
import android.view.View;
import android.webkit.WebView;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.reader.R;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class jq7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static void A(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? C(i, i3, "start index") : (i2 < 0 || i2 > i3) ? C(i2, i3, "end index") : qq7.H("end index (%s) must not be less than start index (%s)", Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }

    public static void B(int i, int i2) {
        if (i < 0 || i > i2) {
            z10.i(E(i, i2, "index"));
        }
    }

    public static String C(int i, int i2, String str) {
        if (i < 0) {
            return qq7.H("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return qq7.H("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.w(i2, "negative size: "));
        return null;
    }

    public static String E(int i, int i2, String str) {
        if (i < 0) {
            return mq7.H("%s (%s) must not be negative", str, Integer.valueOf(i));
        }
        if (i2 >= 0) {
            return mq7.H("%s (%s) must not be greater than size (%s)", str, Integer.valueOf(i), Integer.valueOf(i2));
        }
        ay0.e(b09.A(new StringBuilder(String.valueOf(i2).length() + 15), i2, "negative size: "));
        return null;
    }

    public static final void a(b24 b24Var, r28 r28Var, String str, String str2, String str3, String str4, m45 m45Var, m45 m45Var2, x12 x12Var, int i, int i2) {
        String str5;
        int i3;
        m45 m45Var3;
        int i4;
        m45 m45Var4;
        int i5;
        r28 r28Var2;
        String str6;
        String str7;
        m45 m45Var5;
        String str8;
        p65 p65Var;
        m45 m45Var6;
        String str9;
        String strR;
        String strR2;
        String str10;
        r28 r28Var3;
        String str11;
        m45 m45Var7;
        int i6;
        String str12;
        int i7;
        String str13;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1118853560);
        int i8 = i | (p65Var2.f(b24Var) ? 4 : 2);
        int i9 = i8 | 9392;
        int i10 = i2 & 32;
        if (i10 != 0) {
            i3 = i8 | 206000;
            str5 = str4;
        } else {
            str5 = str4;
            i3 = i9 | (p65Var2.f(str5) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        }
        int i11 = i2 & 64;
        if (i11 != 0) {
            i4 = i3 | 1572864;
            m45Var3 = m45Var;
        } else {
            m45Var3 = m45Var;
            i4 = i3 | (p65Var2.h(m45Var3) ? 1048576 : 524288);
        }
        int i12 = i2 & 128;
        if (i12 != 0) {
            i5 = i4 | 12582912;
            m45Var4 = m45Var2;
        } else {
            m45Var4 = m45Var2;
            i5 = i4 | (p65Var2.h(m45Var4) ? 8388608 : 4194304);
        }
        if (p65Var2.P(i5 & 1, (4793491 & i5) != 4793490)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                String strR3 = vo7.R(p65Var2, f49.D(b24Var));
                Integer numF = f49.F(b24Var);
                if (numF == null) {
                    p65Var2.Y(-1474589629);
                    p65Var2.p(false);
                    strR = null;
                } else {
                    p65Var2.Y(-1474589628);
                    strR = vo7.R(p65Var2, numF.intValue());
                    p65Var2.p(false);
                }
                strR2 = vo7.R(p65Var2, R.string.common_try_again);
                int i13 = i5 & (-65409);
                if (i10 != 0) {
                    str5 = null;
                }
                if (i11 != 0) {
                    m45Var3 = null;
                }
                m45 m45Var8 = m45Var3;
                str10 = str5;
                r28Var3 = o28.b;
                str11 = strR;
                m45Var7 = m45Var8;
                i6 = i13;
                str12 = strR3;
                if (i12 != 0) {
                    m45Var4 = null;
                }
            } else {
                p65Var2.S();
                str11 = str2;
                strR2 = str3;
                i6 = i5 & (-65409);
                m45Var7 = m45Var3;
                str12 = str;
                str10 = str5;
                r28Var3 = r28Var;
            }
            p65Var2.q();
            if (b24Var.a()) {
                i7 = i6;
                str13 = strR2;
            } else {
                i7 = i6;
                str13 = null;
            }
            b(r28Var3, str12, str11, str13, str10, b24Var.a() ? m45Var7 : null, m45Var4, p65Var2, 3728382 & (i7 >> 3), 0);
            str6 = str12;
            m45Var5 = m45Var4;
            str7 = strR2;
            str8 = str10;
            str9 = str11;
            r28Var2 = r28Var3;
            p65Var = p65Var2;
            m45Var6 = m45Var7;
        } else {
            p65Var2.S();
            r28Var2 = r28Var;
            str6 = str;
            str7 = str3;
            m45Var5 = m45Var4;
            str8 = str5;
            p65Var = p65Var2;
            m45Var6 = m45Var3;
            str9 = str2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(b24Var, r28Var2, str6, str9, str7, str8, m45Var6, m45Var5, i, i2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0178  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x01a1  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02b4  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x031b  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x032e  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x033d  */
    /* JADX WARN: Removed duplicated region for block: B:151:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(defpackage.r28 r36, java.lang.String r37, java.lang.String r38, java.lang.String r39, java.lang.String r40, defpackage.m45 r41, defpackage.m45 r42, defpackage.x12 r43, int r44, int r45) {
        /*
            Method dump skipped, instruction units count: 840
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jq7.b(r28, java.lang.String, java.lang.String, java.lang.String, java.lang.String, m45, m45, x12, int, int):void");
    }

    public static final void c(String str, String str2, fha fhaVar, wea weaVar, lma lmaVar, db8 db8Var, r28 r28Var, x45 x45Var, String str3, m45 m45Var, x12 x12Var, int i) {
        String str4;
        db8 db8Var2 = db8Var;
        str.getClass();
        str2.getClass();
        fhaVar.getClass();
        weaVar.getClass();
        lmaVar.getClass();
        db8Var2.getClass();
        x45Var.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1634866004);
        int i2 = i | (p65Var.h(fhaVar) ? 256 : 128) | (p65Var.h(weaVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(lmaVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.h(db8Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288) | (p65Var.f(str3) ? 67108864 : 33554432) | (p65Var.h(m45Var) ? 536870912 : 268435456);
        if (p65Var.P(i2 & 1, (302589057 & i2) != 302589056)) {
            boolean zH = p65Var.h(db8Var2) | p65Var.h(fhaVar) | p65Var.h(weaVar) | p65Var.h(lmaVar) | ((1879048192 & i2) == 536870912) | ((234881024 & i2) == 67108864);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zH || objM == uobVar) {
                fy0 fy0Var = new fy0(db8Var2, fhaVar, str3, lmaVar, m45Var, weaVar, 2);
                str4 = str3;
                p65Var.j0(fy0Var);
                objM = fy0Var;
            } else {
                str4 = str3;
            }
            ep7.e(db8Var, r28Var, null, null, null, null, null, (x45) objM, p65Var, ((i2 >> 15) & 14) | 48 | ((i2 >> 12) & 896));
            db8Var2 = db8Var;
            if (str4 == null) {
                p65Var.Y(-632646983);
            } else {
                p65Var.Y(-632646982);
                boolean zF = p65Var.f(str4) | p65Var.h(db8Var2);
                Object objM2 = p65Var.M();
                if (zF || objM2 == uobVar) {
                    objM2 = new n79(str4, db8Var2, null, 8);
                    p65Var.j0(objM2);
                }
                kyd.k(p65Var, (b55) objM2, str4);
            }
            p65Var.p(false);
        } else {
            str4 = str3;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pc0(str, str2, fhaVar, weaVar, lmaVar, db8Var2, r28Var, x45Var, str4, m45Var, i);
        }
    }

    public static final void d(m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1240233429);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.h(m45Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(m45Var2) ? 32 : 16;
        }
        int i3 = 18;
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(-450530163, new c60(17, m45Var), p65Var2), null, pxf.E(-2067970613, new c60(i3, m45Var2), p65Var2), null, null, vx0.g, null, 0L, 0L, 0L, 0L, null, p65Var, ((i2 >> 3) & 14) | 1575984, 0, 16308);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b5b(m45Var, m45Var2, i, 0);
        }
    }

    public static final void e(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1860045160);
        int i2 = i | 6;
        if ((i & 48) == 0) {
            i2 |= p65Var.h(m45Var) ? 32 : 16;
        }
        int i3 = i2;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28Var2 = o28.b;
            r28 r28VarN = bgf.N(r28Var2, "show_more_replies_button");
            amb ambVarA = bmb.a(21.0f);
            jy8 jy8Var = h11.a;
            long j = uu1.g;
            f76.g(m45Var, r28VarN, false, ambVarA, h11.a(j, ((zo7) p65Var.j(kt7.b)).n, j, 0L, p65Var, 8), null, null, new jy8(12.0f, 8.0f, 12.0f, 8.0f), d46.e, p65Var, ((i3 >> 3) & 14) | 818085888, ExifDirectoryBase.TAG_TILE_OFFSETS);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gw5(r28Var2, m45Var, i);
        }
    }

    public static final jb6 f(x38 x38Var, qj6 qj6Var) {
        boolean z;
        x38Var.getClass();
        qj6Var.getClass();
        jb6 jb6VarA = x38Var.a(kyd.U(qj6Var), yoe.a, null);
        return ((jb6VarA instanceof rl8) || ((z = jb6VarA instanceof ph8))) ? jb6VarA : qj6Var.h() ? jb6VarA.c() : z ? jb6VarA : new ph8(jb6VarA);
    }

    public static final int g(float f) {
        return Math.round((float) Math.ceil(f));
    }

    public static void h(String str, Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(str);
    }

    public static final int i(float f) {
        return nk7.w0(f) * (-1);
    }

    public static int j(eya eyaVar, vw3 vw3Var, View view, View view2, sxa sxaVar, boolean z) {
        if (sxaVar.v() == 0 || eyaVar.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z) {
            return Math.abs(sxa.H(view) - sxa.H(view2)) + 1;
        }
        return Math.min(vw3Var.n(), vw3Var.d(view2) - vw3Var.g(view));
    }

    public static int k(eya eyaVar, vw3 vw3Var, View view, View view2, sxa sxaVar, boolean z, boolean z2) {
        if (sxaVar.v() == 0 || eyaVar.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        int iMax = z2 ? Math.max(0, (eyaVar.b() - Math.max(sxa.H(view), sxa.H(view2))) - 1) : Math.max(0, Math.min(sxa.H(view), sxa.H(view2)));
        if (z) {
            return Math.round((iMax * (Math.abs(vw3Var.d(view2) - vw3Var.g(view)) / (Math.abs(sxa.H(view) - sxa.H(view2)) + 1))) + (vw3Var.m() - vw3Var.g(view)));
        }
        return iMax;
    }

    public static int l(eya eyaVar, vw3 vw3Var, View view, View view2, sxa sxaVar, boolean z) {
        if (sxaVar.v() == 0 || eyaVar.b() == 0 || view == null || view2 == null) {
            return 0;
        }
        if (!z) {
            return eyaVar.b();
        }
        return (int) (((vw3Var.d(view2) - vw3Var.g(view)) / (Math.abs(sxa.H(view) - sxa.H(view2)) + 1)) * eyaVar.b());
    }

    public static final Object m(mc9 mc9Var, String str, p92 p92Var) {
        Object objC = mc9Var.c(str, new tjd(6), p92Var);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : c1e.a;
    }

    public static InvocationHandler n() {
        ClassLoader classLoader;
        if (Build.VERSION.SDK_INT >= 28) {
            classLoader = fz.b();
        } else {
            try {
                Method declaredMethod = WebView.class.getDeclaredMethod("getFactory", null);
                declaredMethod.setAccessible(true);
                classLoader = declaredMethod.invoke(null, null).getClass().getClassLoader();
            } catch (IllegalAccessException e) {
                ik4.j(e);
                return null;
            } catch (NoSuchMethodException e2) {
                ik4.j(e2);
                return null;
            } catch (InvocationTargetException e3) {
                ik4.j(e3);
                return null;
            }
        }
        return (InvocationHandler) Class.forName("org.chromium.support_lib_glue.SupportLibReflectionUtil", false, classLoader).getDeclaredMethod("createWebViewProviderFactory", null).invoke(null, null);
    }

    public static final String o(p98 p98Var, int i) {
        p98Var.getClass();
        String strA = p98Var.a(i);
        return p98Var.b(i) ? ".".concat(strA) : strA;
    }

    public static final int p(long j) {
        int i = Math.abs(Float.intBitsToFloat((int) (j >> 32))) >= 0.5f ? 1 : 0;
        return Math.abs(Float.intBitsToFloat((int) (j & 4294967295L))) >= 0.5f ? i | 2 : i;
    }

    public static final int q(xzb xzbVar, xzb[] xzbVarArr) {
        xzbVarArr.getClass();
        int iHashCode = (xzbVar.a().hashCode() * 31) + Arrays.hashCode(xzbVarArr);
        int iE = xzbVar.e();
        int i = 1;
        while (true) {
            int iHashCode2 = 0;
            if (!(iE > 0)) {
                break;
            }
            int i2 = iE - 1;
            int i3 = i * 31;
            String strA = xzbVar.h(xzbVar.e() - iE).a();
            if (strA != null) {
                iHashCode2 = strA.hashCode();
            }
            i = i3 + iHashCode2;
            iE = i2;
        }
        int iE2 = xzbVar.e();
        int iHashCode3 = 1;
        while (true) {
            if (!(iE2 > 0)) {
                return (((iHashCode * 31) + i) * 31) + iHashCode3;
            }
            int i4 = iE2 - 1;
            int i5 = iHashCode3 * 31;
            mo7 mo7VarJ = xzbVar.h(xzbVar.e() - iE2).j();
            iHashCode3 = i5 + (mo7VarJ != null ? mo7VarJ.hashCode() : 0);
            iE2 = i4;
        }
    }

    public static final el6 r(h5a h5aVar, p98 p98Var) {
        h5aVar.getClass();
        p98Var.getClass();
        String strO = o(p98Var, h5aVar.c);
        List<f5a> list = h5aVar.d;
        list.getClass();
        ArrayList arrayList = new ArrayList();
        for (f5a f5aVar : list) {
            e5a e5aVar = f5aVar.d;
            e5aVar.getClass();
            yl6 yl6VarS = s(e5aVar, p98Var);
            f09 f09Var = yl6VarS != null ? new f09(p98Var.getString(f5aVar.c), yl6VarS) : null;
            if (f09Var != null) {
                arrayList.add(f09Var);
            }
        }
        return new el6(strO, ei7.V(arrayList));
    }

    public static final yl6 s(e5a e5aVar, p98 p98Var) {
        e5aVar.getClass();
        p98Var.getClass();
        boolean zBooleanValue = cm4.P.d(e5aVar.m).booleanValue();
        d5a d5aVar = e5aVar.c;
        if (zBooleanValue) {
            int i = d5aVar != null ? ita.a[d5aVar.ordinal()] : -1;
            if (i == 1) {
                return new ul6((byte) e5aVar.d);
            }
            if (i == 2) {
                return new xl6((short) e5aVar.d);
            }
            if (i == 3) {
                return new vl6((int) e5aVar.d);
            }
            if (i == 4) {
                return new wl6(e5aVar.d);
            }
            lg8.w("Cannot read value of unsigned type: ", e5aVar.c);
            return null;
        }
        switch (d5aVar != null ? ita.a[d5aVar.ordinal()] : -1) {
            case -1:
                return null;
            case 0:
            default:
                ygf.a();
                return null;
            case 1:
                return new jl6((byte) e5aVar.d);
            case 2:
                return new sl6((short) e5aVar.d);
            case 3:
                return new ol6((int) e5aVar.d);
            case 4:
                return new rl6(e5aVar.d);
            case 5:
                return new kl6((char) e5aVar.d);
            case 6:
                return new nl6(e5aVar.e);
            case 7:
                return new ll6(e5aVar.f);
            case 8:
                return new il6(e5aVar.d != 0);
            case 9:
                return new tl6(p98Var.getString(e5aVar.g));
            case 10:
                String strO = o(p98Var, e5aVar.h);
                int i2 = e5aVar.l;
                return i2 == 0 ? new pl6(strO) : new gl6(strO, i2);
            case 11:
                return new ml6(o(p98Var, e5aVar.h), p98Var.getString(e5aVar.i));
            case 12:
                h5a h5aVar = e5aVar.j;
                h5aVar.getClass();
                return new fl6(r(h5aVar, p98Var));
            case 13:
                List<e5a> list = e5aVar.k;
                list.getClass();
                ArrayList arrayList = new ArrayList();
                for (e5a e5aVar2 : list) {
                    e5aVar2.getClass();
                    yl6 yl6VarS = s(e5aVar2, p98Var);
                    if (yl6VarS != null) {
                        arrayList.add(yl6VarS);
                    }
                }
                return new hl6(arrayList);
        }
    }

    public static final ed8 t(x12 x12Var) {
        View view = (View) ((p65) x12Var).j(eo.f);
        p65 p65Var = (p65) x12Var;
        zte zteVar = (zte) p65Var.j(z22.u);
        boolean zF = p65Var.f(view) | p65Var.f(zteVar);
        Object objM = p65Var.M();
        if (zF || objM == w12.a) {
            zteVar.c();
            objM = new ed8(view);
            p65Var.j0(objM);
        }
        return (ed8) objM;
    }

    public static final void u(f66 f66Var, rv8 rv8Var, m45 m45Var) {
        f66Var.getClass();
        rv8Var.getClass();
        long jNanoTime = System.nanoTime() - 500000000;
        int i = 1;
        boolean zBooleanValue = false;
        while (i <= 3 && !zBooleanValue) {
            if (System.nanoTime() - jNanoTime >= 500000000) {
                try {
                    zBooleanValue = ((Boolean) m45Var.invoke()).booleanValue();
                } catch (Exception e) {
                    f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), b18.b, e, 48);
                    zBooleanValue = false;
                }
                jNanoTime = System.nanoTime();
                i++;
            }
        }
    }

    public static long v(String str) {
        long j;
        int length = str.length();
        str.getClass();
        long j2 = 0;
        if (length < 0) {
            ywb.g(ev6.v("endIndex < beginIndex: ", length, 0, " < "));
            return 0L;
        }
        if (length > str.length()) {
            StringBuilder sbC = ev6.C("endIndex > string.length: ", length, " > ");
            sbC.append(str.length());
            throw new IllegalArgumentException(sbC.toString().toString());
        }
        int i = 0;
        while (i < length) {
            char cCharAt = str.charAt(i);
            if (cCharAt < 128) {
                j2++;
            } else {
                if (cCharAt < 2048) {
                    j = 2;
                } else if (cCharAt < 55296 || cCharAt > 57343) {
                    j = 3;
                } else {
                    int i2 = i + 1;
                    char cCharAt2 = i2 < length ? str.charAt(i2) : (char) 0;
                    if (cCharAt > 56319 || cCharAt2 < 56320 || cCharAt2 > 57343) {
                        j2++;
                        i = i2;
                    } else {
                        j2 += 4;
                        i += 2;
                    }
                }
                j2 += j;
            }
            i++;
        }
        return j2;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x004c A[PHI: r11
      0x004c: PHI (r11v11 float) = (r11v4 float), (r11v12 float) binds: [B:16:0x0059, B:13:0x004a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0073 A[PHI: r11
      0x0073: PHI (r11v9 float) = (r11v6 float), (r11v10 float) binds: [B:24:0x0080, B:21:0x0071] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long w(int r10, int r11, int[] r12, long r13) {
        /*
            r0 = 0
            r1 = r12[r0]
            int r1 = java.lang.Math.abs(r1)
            r2 = 32
            r3 = 0
            r4 = -1082130432(0xffffffffbf800000, float:-1.0)
            if (r1 != 0) goto L10
            r1 = r3
            goto L1a
        L10:
            long r5 = r13 >> r2
            int r1 = (int) r5
            float r1 = java.lang.Float.intBitsToFloat(r1)
            float r10 = (float) r10
            float r10 = r10 * r4
            float r1 = r1 - r10
        L1a:
            r10 = 1
            r5 = r12[r10]
            int r5 = java.lang.Math.abs(r5)
            r6 = 4294967295(0xffffffff, double:2.1219957905E-314)
            if (r5 != 0) goto L2a
            r5 = r3
            goto L34
        L2a:
            long r8 = r13 & r6
            int r5 = (int) r8
            float r5 = java.lang.Float.intBitsToFloat(r5)
            float r11 = (float) r11
            float r11 = r11 * r4
            float r5 = r5 - r11
        L34:
            long r8 = r13 >> r2
            int r11 = (int) r8
            float r8 = java.lang.Float.intBitsToFloat(r11)
            int r8 = (r8 > r3 ? 1 : (r8 == r3 ? 0 : -1))
            if (r8 < 0) goto L4e
            r0 = r12[r0]
            float r0 = (float) r0
            float r0 = r0 * r4
            float r0 = r0 + r1
            float r11 = java.lang.Float.intBitsToFloat(r11)
            int r1 = (r0 > r11 ? 1 : (r0 == r11 ? 0 : -1))
            if (r1 <= 0) goto L5c
        L4c:
            r0 = r11
            goto L5c
        L4e:
            r0 = r12[r0]
            float r0 = (float) r0
            float r0 = r0 * r4
            float r0 = r0 + r1
            float r11 = java.lang.Float.intBitsToFloat(r11)
            int r1 = (r0 > r11 ? 1 : (r0 == r11 ? 0 : -1))
            if (r1 >= 0) goto L5c
            goto L4c
        L5c:
            long r13 = r13 & r6
            int r11 = (int) r13
            float r13 = java.lang.Float.intBitsToFloat(r11)
            int r13 = (r13 > r3 ? 1 : (r13 == r3 ? 0 : -1))
            if (r13 < 0) goto L75
            r10 = r12[r10]
            float r10 = (float) r10
            float r10 = r10 * r4
            float r10 = r10 + r5
            float r11 = java.lang.Float.intBitsToFloat(r11)
            int r12 = (r10 > r11 ? 1 : (r10 == r11 ? 0 : -1))
            if (r12 <= 0) goto L83
        L73:
            r10 = r11
            goto L83
        L75:
            r10 = r12[r10]
            float r10 = (float) r10
            float r10 = r10 * r4
            float r10 = r10 + r5
            float r11 = java.lang.Float.intBitsToFloat(r11)
            int r12 = (r10 > r11 ? 1 : (r10 == r11 ? 0 : -1))
            if (r12 >= 0) goto L83
            goto L73
        L83:
            int r11 = java.lang.Float.floatToRawIntBits(r0)
            long r11 = (long) r11
            int r10 = java.lang.Float.floatToRawIntBits(r10)
            long r13 = (long) r10
            long r10 = r11 << r2
            long r13 = r13 & r6
            long r10 = r10 | r13
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jq7.w(int, int, int[], long):long");
    }

    public static void x(int i, int i2) {
        String strH;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strH = qq7.H("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.w(i2, "negative size: "));
                    return;
                }
                strH = qq7.H("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strH);
        }
    }

    public static void y(String str, boolean z) {
        if (z) {
            return;
        }
        ygf.f(str);
    }

    public static void z(int i, int i2) {
        String strH;
        if (i < 0 || i >= i2) {
            if (i < 0) {
                strH = mq7.H("%s (%s) must not be negative", "index", Integer.valueOf(i));
            } else {
                if (i2 < 0) {
                    ay0.e(b09.A(new StringBuilder(String.valueOf(i2).length() + 15), i2, "negative size: "));
                    return;
                }
                strH = mq7.H("%s (%s) must be less than size (%s)", "index", Integer.valueOf(i), Integer.valueOf(i2));
            }
            throw new IndexOutOfBoundsException(strH);
        }
    }

    public static void D(int i, int i2, int i3) {
        if (i < 0 || i2 < i || i2 > i3) {
            throw new IndexOutOfBoundsException((i < 0 || i > i3) ? E(i, i3, "start index") : (i2 < 0 || i2 > i3) ? E(i2, i3, "end index") : mq7.H(KLTXZbnQvj.FiSQcFmS, Integer.valueOf(i2), Integer.valueOf(i)));
        }
    }
}
