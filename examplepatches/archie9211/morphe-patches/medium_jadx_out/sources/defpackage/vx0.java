package defpackage;

import android.content.ContentValues;
import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Build;
import android.provider.MediaStore;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.core.parser.CLParsingException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.iptc.IptcDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.firebase.components.DependencyCycleException;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlinx.coroutines.DispatchException;
import scalapb.options.hI.AEVqIoD;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class vx0 {
    public static final /* synthetic */ int A = 0;
    public static final /* synthetic */ int B = 0;
    public static final b5 a = new b5(26);
    public static final xv2 b = new xv2(new rz5(11));
    public static final mz1 c = new mz1(new e02(13), false, -1255695216);
    public static final mz1 d = new mz1(new c02(3), false, -1448777049);
    public static final mz1 e = new mz1(new n02(2), false, -2002692304);
    public static final mz1 f = new mz1(new n02(3), false, 674834542);
    public static final mz1 g = new mz1(new m02(3), false, 1948319656);
    public static final mz1 h = new mz1(new u02(21), false, -1742235122);
    public static final mz1 i = new mz1(new u02(23), false, -938929891);
    public static final mz1 j = new mz1(new zz1(15), false, 1989472405);
    public static final mz1 k = new mz1(new zz1(16), false, -1949972660);
    public static final mz1 l = new mz1(new u02(24), false, -885541893);
    public static final mz1 m = new mz1(new zz1(17), false, 1153336398);
    public static final mz1 n = new mz1(new zz1(18), false, -554904811);
    public static final mz1 o = new mz1(new zz1(19), false, -1090563892);
    public static final mz1 p = new mz1(new u02(22), false, 1743019131);
    public static final mz1 q = new mz1(new zz1(14), false, 1354641358);
    public static final mz1 r = new mz1(new v02(14, 0), false, -1139335344);
    public static final mz1 s = new mz1(new v02(15, 0), false, -672991239);
    public static final Object t = new Object();
    public static final ugc u = new ugc(2);
    public static final pgc v = new pgc(1);
    public static final byte[] w = new byte[0];
    public static final /* synthetic */ int x = 0;
    public static final /* synthetic */ int y = 0;
    public static final /* synthetic */ int z = 0;

    public static final void A(hae haeVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        hae haeVar2;
        r28 r28Var2;
        ot2 ot2Var;
        String str;
        sn3 sn3Var;
        o28 o28Var;
        boolean z2;
        sn3 sn3Var2;
        String str2;
        o28 o28Var2;
        o28 o28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1955388299);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(haeVar) ? 4 : 2);
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            o28 o28Var4 = o28.b;
            r28 r28VarC = w2g.C(jfc.d(o28Var4, 1.0f), 24.0f);
            int i5 = 21;
            h70 h70Var = new h70(16.0f, true, new z10(i5));
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(h70Var, yq0Var, p65Var, 6);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var4, 1.0f);
            h70 h70Var2 = new h70(12.0f, true, new z10(i5));
            zq0 zq0Var = z46.n;
            omb ombVarA = nmb.a(h70Var2, zq0Var, p65Var, 54);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String str3 = haeVar.c;
            String str4 = haeVar.a;
            if (str3 == null) {
                str3 = null;
            }
            d46.a(str3, hl0.S, bgf.N(o28Var4, "user_avatar_" + str4), null, null, null, null, 0.0f, 0, null, null, p65Var, 3120, 0, 4080);
            sq6 sq6Var = new sq6(1.0f, true);
            wv1 wv1VarA2 = uv1.a(new h70(4.0f, true, new z10(21)), yq0Var, p65Var, 6);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                ot2Var = ot2Var2;
                p65Var.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String str5 = haeVar.b;
            sn3 sn3Var3 = jt7.c;
            ot2 ot2Var3 = ot2Var;
            haeVar2 = haeVar;
            jjd.b(str5, bgf.N(o28Var4, "user_name_" + str4), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(sn3Var3)).j, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            if (haeVar2.f) {
                p65Var.Y(-1958582877);
                h70 h70Var3 = new h70(4.0f, true, new z10(21));
                r28 r28VarN = bgf.N(o28Var4, "book_author_badge_" + str4);
                omb ombVarA2 = nmb.a(h70Var3, zq0Var, p65Var, 54);
                long j5 = p65Var.T;
                int i9 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarN);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var3);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA2);
                tp7.B(p65Var, cuVar2, i89VarL4);
                ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR4);
                w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var), null, null, null, null, 0.0f, null, p65Var, 56, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
                sn3Var = sn3Var3;
                str = str4;
                o28Var = o28Var4;
                z2 = false;
                jjd.b(vo7.R(p65Var, R.string.book_author), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var3)).m, ((zo7) p65Var.j(kt7.b)).w, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                p65Var = p65Var;
                p65Var.p(true);
            } else {
                str = str4;
                sn3Var = sn3Var3;
                o28Var = o28Var4;
                z2 = false;
                p65Var.Y(-1962177699);
            }
            p65Var.p(z2);
            Integer num = haeVar2.d;
            if (num == null) {
                p65Var.Y(-1957751675);
                p65Var.p(z2);
                sn3Var2 = sn3Var;
                str2 = str;
                o28Var2 = o28Var;
            } else {
                p65Var.Y(-1957751674);
                String strD = aoc.d(num.intValue());
                mkd mkdVarA = mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                StringBuilder sb = new StringBuilder("user_follower_count_");
                String str6 = str;
                sb.append(str6);
                o28 o28Var5 = o28Var;
                p65 p65Var2 = p65Var;
                sn3Var2 = sn3Var;
                str2 = str6;
                o28Var2 = o28Var5;
                jjd.b(strD, bgf.N(o28Var5, sb.toString()), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var2, 0, 0, 131068);
                p65Var = p65Var2;
                p65Var.p(z2);
            }
            p65Var.p(true);
            p65Var.p(true);
            String strConcat = haeVar2.e;
            if (strConcat == null) {
                p65Var.Y(-1634362774);
                p65Var.p(z2);
                o28Var3 = o28Var2;
            } else {
                p65Var.Y(-1634362773);
                if (strConcat.length() > 160) {
                    strConcat = muc.x0(160, strConcat).concat("...");
                }
                o28 o28Var6 = o28Var2;
                o28Var3 = o28Var6;
                p65 p65Var3 = p65Var;
                jjd.b(strConcat, bgf.N(o28Var6, "user_bio_" + str2), 0L, 0L, 0L, null, null, 0L, 2, false, 7, 0, null, ((bu7) p65Var.j(sn3Var2)).m, p65Var3, 0, 24960, 110588);
                p65Var = p65Var3;
                p65Var.p(z2);
            }
            p65Var.p(true);
            r28Var2 = o28Var3;
        } else {
            haeVar2 = haeVar;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(haeVar2, r28Var2, i2, 11);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x029f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:57:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void B(int r26, int r27, long r28, defpackage.x12 r30, defpackage.r28 r31) {
        /*
            Method dump skipped, instruction units count: 697
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.B(int, int, long, x12, r28):void");
    }

    public static r28 C(r28 r28Var, ul ulVar, hw8 hw8Var, boolean z2, iic iicVar) {
        return r28Var.b(new hk(ulVar, hw8Var, z2, iicVar));
    }

    public static final Object D(ul ulVar, float f2, pl plVar, ry2 ry2Var, Object obj, ww wwVar, p4d p4dVar) {
        Object objI;
        float fC = ry2Var.c(obj);
        oya oyaVar = new oya();
        oyaVar.a = Float.isNaN(ulVar.f.g()) ? 0.0f : ulVar.f.g();
        if (!Float.isNaN(fC)) {
            float f3 = oyaVar.a;
            if (f3 != fC && (objI = tr7.i(f3, fC, f2, wwVar, new r(plVar, 13, oyaVar), p4dVar)) == tb2.COROUTINE_SUSPENDED) {
                return objI;
            }
        }
        return c1e.a;
    }

    public static void E(m50 m50Var, q21 q21Var, c62 c62Var, qpc qpcVar, String str) throws CLParsingException {
        long j2;
        str.getClass();
        switch (str) {
            case "centerVertically":
                String strE = q21Var.E(str);
                c62 c62VarB = strE.equals("parent") ? qpcVar.b(0) : qpcVar.b(strE);
                c62Var.p(c62VarB);
                c62Var.e(c62VarB);
                return;
            case "center":
                String strE2 = q21Var.E(str);
                c62 c62VarB2 = strE2.equals("parent") ? qpcVar.b(0) : qpcVar.b(strE2);
                c62Var.o(c62VarB2);
                c62Var.i(c62VarB2);
                c62Var.p(c62VarB2);
                c62Var.e(c62VarB2);
                return;
            case "custom":
                m21 m21VarC = q21Var.C(str);
                q21 q21Var2 = m21VarC instanceof q21 ? (q21) m21VarC : null;
                if (q21Var2 == null) {
                    return;
                }
                for (String str2 : q21Var2.H()) {
                    m21 m21VarX = q21Var2.x(str2);
                    if (m21VarX instanceof o21) {
                        c62Var.j0.put(str2, Float.valueOf(m21VarX.q()));
                    } else if (m21VarX instanceof s21) {
                        String strE3 = m21VarX.e();
                        if (strE3.startsWith("#")) {
                            String strSubstring = strE3.substring(1);
                            if (strSubstring.length() == 6) {
                                strSubstring = "FF".concat(strSubstring);
                            }
                            j2 = Long.parseLong(strSubstring, 16);
                        } else {
                            j2 = -1;
                        }
                        if (j2 != -1) {
                            c62Var.i0.put(str2, Integer.valueOf((int) j2));
                        }
                    }
                }
                return;
            case "rotationX":
                c62Var.z = m50Var.w(q21Var.x(str));
                return;
            case "rotationY":
                c62Var.A = m50Var.w(q21Var.x(str));
                return;
            case "rotationZ":
                c62Var.B = m50Var.w(q21Var.x(str));
                return;
            case "translationX":
                c62Var.C = qpcVar.a.d(m50Var.w(q21Var.x(str)));
                return;
            case "translationY":
                c62Var.D = qpcVar.a.d(m50Var.w(q21Var.x(str)));
                return;
            case "translationZ":
                c62Var.E = qpcVar.a.d(m50Var.w(q21Var.x(str)));
                return;
            case "height":
                c62Var.f0 = h0(q21Var, str, qpcVar, qpcVar.a);
                return;
            case "motion":
                m21 m21VarX2 = q21Var.x(str);
                if (m21VarX2 instanceof q21) {
                    q21 q21Var3 = (q21) m21VarX2;
                    sxd sxdVar = new sxd();
                    sxdVar.a = new int[10];
                    sxdVar.b = new int[10];
                    sxdVar.c = 0;
                    sxdVar.d = new int[10];
                    sxdVar.e = new float[10];
                    sxdVar.f = 0;
                    sxdVar.g = new int[5];
                    sxdVar.h = new String[5];
                    sxdVar.i = 0;
                    for (String str3 : q21Var3.H()) {
                        str3.getClass();
                        switch (str3) {
                            case "stagger":
                                sxdVar.a(600, q21Var3.z(str3));
                                continue;
                                break;
                            case "easing":
                                sxdVar.c(603, q21Var3.E(str3));
                                continue;
                                break;
                            case "quantize":
                                m21 m21VarX3 = q21Var3.x(str3);
                                if (m21VarX3 instanceof k21) {
                                    k21 k21Var = (k21) m21VarX3;
                                    int size = k21Var.e.size();
                                    if (size <= 0) {
                                        break;
                                    } else {
                                        sxdVar.b(610, k21Var.A(0));
                                        if (size <= 1) {
                                            break;
                                        } else {
                                            sxdVar.c(611, k21Var.D(1));
                                            if (size > 2) {
                                                sxdVar.a(IptcDirectory.TAG_CITY, k21Var.y(2));
                                            }
                                        }
                                    }
                                } else {
                                    m21 m21VarX4 = q21Var3.x(str3);
                                    if (m21VarX4 == null) {
                                        StringBuilder sbU = lv8.u("no int found for key <", str3, ">, found [");
                                        sbU.append(m21VarX4.s());
                                        sbU.append("] : ");
                                        sbU.append(m21VarX4);
                                        throw new CLParsingException(sbU.toString(), q21Var3);
                                    }
                                    sxdVar.b(610, m21VarX4.r());
                                }
                                break;
                            case "pathArc":
                                String strE4 = q21Var3.E(str3);
                                String[] strArr = {"none", "startVertical", "startHorizontal", "flip", "below", "above"};
                                int i2 = 0;
                                while (true) {
                                    if (i2 >= 6) {
                                        i2 = -1;
                                    } else if (!strArr[i2].equals(strE4)) {
                                        i2++;
                                    }
                                }
                                if (i2 == -1) {
                                    System.err.println("0 pathArc = '" + strE4 + "'");
                                    break;
                                } else {
                                    sxdVar.b(IptcDirectory.TAG_PROVINCE_OR_STATE, i2);
                                    break;
                                }
                                break;
                            case "relativeTo":
                                sxdVar.c(605, q21Var3.E(str3));
                                break;
                        }
                    }
                    c62Var.getClass();
                    return;
                }
                return;
            case "pivotX":
                c62Var.x = m50Var.w(q21Var.x(str));
                return;
            case "pivotY":
                c62Var.y = m50Var.w(q21Var.x(str));
                return;
            case "scaleX":
                c62Var.G = m50Var.w(q21Var.x(str));
                return;
            case "scaleY":
                c62Var.H = m50Var.w(q21Var.x(str));
                return;
            case "hRtlBias":
                float fW = m50Var.w(q21Var.x(str));
                if (!qpcVar.b) {
                    fW = 1.0f - fW;
                }
                c62Var.h = fW;
                return;
            case "vWeight":
                c62Var.g = m50Var.w(q21Var.x(str));
                return;
            case "alpha":
                c62Var.F = m50Var.w(q21Var.x(str));
                return;
            case "hBias":
                c62Var.h = m50Var.w(q21Var.x(str));
                return;
            case "vBias":
                c62Var.i = m50Var.w(q21Var.x(str));
                return;
            case "width":
                c62Var.e0 = h0(q21Var, str, qpcVar, qpcVar.a);
                return;
            case "hWeight":
                c62Var.f = m50Var.w(q21Var.x(str));
                return;
            case "centerHorizontally":
                String strE5 = q21Var.E(str);
                c62 c62VarB3 = strE5.equals("parent") ? qpcVar.b(0) : qpcVar.b(strE5);
                c62Var.o(c62VarB3);
                c62Var.i(c62VarB3);
                return;
            case "visibility":
                switch (q21Var.E(str)) {
                    case "invisible":
                        c62Var.I = 4;
                        c62Var.F = 0.0f;
                        return;
                    case "gone":
                        c62Var.I = 8;
                        return;
                    case "visible":
                        c62Var.I = 0;
                        return;
                    default:
                        return;
                }
            default:
                g0(m50Var, q21Var, c62Var, qpcVar, str);
                return;
        }
    }

    public static final o33 F(sb2 sb2Var, ib2 ib2Var, wb2 wb2Var, b55 b55Var) {
        ib2 ib2VarQ = guc.Q(sb2Var, ib2Var);
        o33 zq6Var = wb2Var.isLazy() ? new zq6(ib2VarQ, b55Var) : new o33(ib2VarQ, true);
        wb2Var.invoke(b55Var, zq6Var, zq6Var);
        return zq6Var;
    }

    public static o33 G(sb2 sb2Var, ib2 ib2Var, b55 b55Var, int i2) {
        if ((i2 & 1) != 0) {
            ib2Var = zx3.a;
        }
        return F(sb2Var, ib2Var, wb2.DEFAULT, b55Var);
    }

    public static Object H(Class cls, InvocationHandler invocationHandler) {
        if (invocationHandler == null) {
            return null;
        }
        return cls.cast(Proxy.newProxyInstance(vx0.class.getClassLoader(), new Class[]{cls}, invocationHandler));
    }

    public static final int I(mn6 mn6Var) {
        mn6Var.getClass();
        yx yxVarI = mn6Var.getAnnotations().i(lnc.q);
        if (yxVarI == null) {
            return 0;
        }
        f52 f52Var = (f52) ei7.N(mnc.e, yxVarI.f());
        f52Var.getClass();
        return ((Number) ((u46) f52Var).a).intValue();
    }

    public static final hec J(vm6 vm6Var, ly lyVar, mn6 mn6Var, List list, ArrayList arrayList, mn6 mn6Var2, boolean z2) {
        y28 y28VarK;
        ly nyVar = cd7.e;
        int i2 = 0;
        ArrayList arrayList2 = new ArrayList(list.size() + arrayList.size() + (mn6Var != null ? 1 : 0) + 1);
        ArrayList arrayList3 = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            mn6 mn6Var3 = (mn6) it2.next();
            mn6Var3.getClass();
            arrayList3.add(new onc(mn6Var3));
        }
        arrayList2.addAll(arrayList3);
        onc oncVar = mn6Var != null ? new onc(mn6Var) : null;
        if (oncVar != null) {
            arrayList2.add(oncVar);
        }
        int i3 = 0;
        for (Object obj : arrayList) {
            int i4 = i3 + 1;
            if (i3 < 0) {
                d46.i0();
                throw null;
            }
            mn6 mn6Var4 = (mn6) obj;
            mn6Var4.getClass();
            arrayList2.add(new onc(mn6Var4));
            i3 = i4;
        }
        arrayList2.add(new onc(mn6Var2));
        int size = list.size() + arrayList.size() + (mn6Var == null ? 0 : 1);
        if (z2) {
            y28VarK = vm6Var.v(size);
        } else {
            n98 n98Var = mnc.a;
            y28VarK = vm6Var.k("Function" + size);
        }
        if (mn6Var != null) {
            y05 y05Var = lnc.p;
            if (!lyVar.g(y05Var)) {
                ArrayList arrayListP0 = bu1.P0(lyVar, new m01(vm6Var, y05Var, fy3.a));
                lyVar = arrayListP0.isEmpty() ? nyVar : new ny(i2, arrayListP0);
            }
        }
        if (!list.isEmpty()) {
            int size2 = list.size();
            y05 y05Var2 = lnc.q;
            if (!lyVar.g(y05Var2)) {
                Map mapSingletonMap = Collections.singletonMap(mnc.e, new u46(size2));
                mapSingletonMap.getClass();
                ArrayList arrayListP02 = bu1.P0(lyVar, new m01(vm6Var, y05Var2, mapSingletonMap));
                if (!arrayListP02.isEmpty()) {
                    nyVar = new ny(i2, arrayListP02);
                }
                lyVar = nyVar;
            }
        }
        return pwd.X(pr7.o(lyVar), y28VarK, arrayList2);
    }

    public static void K(ArrayList arrayList) {
        HashMap map = new HashMap(arrayList.size());
        Iterator it2 = arrayList.iterator();
        while (true) {
            int i2 = 0;
            if (!it2.hasNext()) {
                Iterator it3 = map.values().iterator();
                while (it3.hasNext()) {
                    for (lm2 lm2Var : (Set) it3.next()) {
                        for (s73 s73Var : lm2Var.a.c) {
                            if (s73Var.c == 0) {
                                Set<lm2> set = (Set) map.get(new mm2(s73Var.a, s73Var.b == 2));
                                if (set != null) {
                                    for (lm2 lm2Var2 : set) {
                                        lm2Var.b.add(lm2Var2);
                                        lm2Var2.c.add(lm2Var);
                                    }
                                }
                            }
                        }
                    }
                }
                HashSet<lm2> hashSet = new HashSet();
                Iterator it4 = map.values().iterator();
                while (it4.hasNext()) {
                    hashSet.addAll((Set) it4.next());
                }
                HashSet hashSet2 = new HashSet();
                for (lm2 lm2Var3 : hashSet) {
                    if (lm2Var3.c.isEmpty()) {
                        hashSet2.add(lm2Var3);
                    }
                }
                while (!hashSet2.isEmpty()) {
                    lm2 lm2Var4 = (lm2) hashSet2.iterator().next();
                    hashSet2.remove(lm2Var4);
                    i2++;
                    for (lm2 lm2Var5 : lm2Var4.b) {
                        lm2Var5.c.remove(lm2Var4);
                        if (lm2Var5.c.isEmpty()) {
                            hashSet2.add(lm2Var5);
                        }
                    }
                }
                if (i2 == arrayList.size()) {
                    return;
                }
                ArrayList arrayList2 = new ArrayList();
                for (lm2 lm2Var6 : hashSet) {
                    if (!lm2Var6.c.isEmpty() && !lm2Var6.b.isEmpty()) {
                        arrayList2.add(lm2Var6.a);
                    }
                }
                throw new DependencyCycleException("Dependency cycle detected: " + Arrays.toString(arrayList2.toArray()));
            }
            iy1 iy1Var = (iy1) it2.next();
            lm2 lm2Var7 = new lm2(iy1Var);
            for (rqa rqaVar : iy1Var.b) {
                boolean z2 = iy1Var.e == 0;
                mm2 mm2Var = new mm2(rqaVar, !z2);
                if (!map.containsKey(mm2Var)) {
                    map.put(mm2Var, new HashSet());
                }
                Set set2 = (Set) map.get(mm2Var);
                if (!set2.isEmpty() && z2) {
                    rd6.s("Multiple components provide ", rqaVar, ".");
                    return;
                }
                set2.add(lm2Var7);
            }
        }
    }

    public static final n98 L(mn6 mn6Var) {
        String str;
        yx yxVarI = mn6Var.getAnnotations().i(lnc.r);
        if (yxVarI != null) {
            Object objB1 = bu1.b1(yxVarI.f().values());
            kuc kucVar = objB1 instanceof kuc ? (kuc) objB1 : null;
            if (kucVar != null && (str = (String) kucVar.a) != null) {
                if (!n98.f(str)) {
                    str = null;
                }
                if (str != null) {
                    return n98.e(str);
                }
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:71:0x0189, code lost:
    
        if (r11.equals(r1) == false) goto L81;
     */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x015d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.ArrayList M(android.view.View r8, java.util.List r9, int r10, int r11, java.lang.String r12) {
        /*
            Method dump skipped, instruction units count: 447
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.M(android.view.View, java.util.List, int, int, java.lang.String):java.util.ArrayList");
    }

    public static ArrayList N(ViewGroup viewGroup) {
        ArrayList arrayList = new ArrayList();
        int childCount = viewGroup.getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            View childAt = viewGroup.getChildAt(i2);
            if (childAt.getVisibility() == 0) {
                arrayList.add(childAt);
            }
        }
        return arrayList;
    }

    public static u77 O(ev2 ev2Var, int i2, String str, Throwable th, LinkedHashMap linkedHashMap, Set set, long j2, String str2, vu2 vu2Var, String str3, boolean z2) throws IOException {
        h77 h77Var;
        String str4;
        o77 o77Var;
        r77 r77Var;
        Map map;
        ey3 ey3Var = ey3.a;
        ev2Var.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(linkedHashMap);
        if (th != null) {
            Object objRemove = linkedHashMap2.remove("_dd.error.fingerprint");
            String str5 = objRemove instanceof String ? (String) objRemove : null;
            String canonicalName = th.getClass().getCanonicalName();
            if (canonicalName == null) {
                canonicalName = th.getClass().getSimpleName();
            }
            String str6 = canonicalName;
            String strH0 = kyd.h0(th);
            String message = th.getMessage();
            ArrayList arrayList = new ArrayList(cu1.k0(ey3Var, 10));
            h77Var = new h77(str6, message, strH0, str5, arrayList.isEmpty() ? null : arrayList);
        } else {
            h77Var = null;
        }
        long j3 = j2 + vu2Var.j.d;
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        linkedHashMap3.putAll(linkedHashMap2);
        if (z2 && (map = (Map) vu2Var.q.get("tracing")) != null) {
            Object obj = map.get("context@".concat(str2));
            Map map2 = obj instanceof Map ? (Map) obj : null;
            if (map2 != null) {
                linkedHashMap3.put("dd.trace_id", map2.get("trace_id"));
                linkedHashMap3.put("dd.span_id", map2.get("span_id"));
            }
        }
        Map map3 = (Map) vu2Var.q.get("rum");
        if (map3 != null) {
            linkedHashMap3.put("application_id", map3.get("application_id"));
            linkedHashMap3.put("session_id", map3.get("session_id"));
            linkedHashMap3.put("view.id", map3.get("view_id"));
            linkedHashMap3.put("user_action.id", map3.get("action_id"));
        }
        synchronized (ev2Var.c) {
            str4 = ev2Var.c.format(new Date(j3));
        }
        va3 va3Var = vu2Var.m;
        ArrayList arrayList2 = new ArrayList();
        for (Object obj2 : set) {
            String str7 = (String) obj2;
            String str8 = (String) bu1.z0(muc.p0(str7, new String[]{":"}, 0, 6));
            if (str8 == null || !ev2.d.contains(str8)) {
                arrayList2.add(obj2);
            } else {
                f49.K(ev2Var.b, d66.WARN, e66.USER, new hm0(str7, 12), null, true, 40);
            }
        }
        Set setP1 = bu1.p1(arrayList2);
        String str9 = vu2Var.d;
        String strConcat = str9.length() > 0 ? "env:".concat(str9) : null;
        if (strConcat != null) {
            setP1.add(strConcat);
        }
        String str10 = vu2Var.e;
        String strConcat2 = str10.length() > 0 ? "version:".concat(str10) : null;
        if (strConcat2 != null) {
            setP1.add(strConcat2);
        }
        String str11 = vu2Var.g;
        String strConcat3 = str11.length() > 0 ? "variant:".concat(str11) : null;
        if (strConcat3 != null) {
            setP1.add(strConcat3);
        }
        String str12 = ev2Var.a;
        if (str12 == null) {
            str12 = vu2Var.c;
        }
        String strConcat4 = str12.length() > 0 ? "service:".concat(str12) : null;
        if (strConcat4 != null) {
            setP1.add(strConcat4);
        }
        zae zaeVar = vu2Var.n;
        zaeVar.getClass();
        s77 s77Var = new s77(null, null, null, null, ei7.Y(zaeVar.a));
        fe8 fe8Var = vu2Var.l;
        Long l2 = fe8Var.c;
        String str13 = fe8Var.b;
        m77 m77Var = (l2 == null && str13 == null) ? null : new m77(l2 != null ? l2.toString() : null, str13);
        Long l3 = fe8Var.f;
        String string = l3 != null ? l3.toString() : null;
        Long l4 = fe8Var.e;
        String string2 = l4 != null ? l4.toString() : null;
        Long l5 = fe8Var.d;
        k77 k77Var = new k77(new e77(m77Var, string, string2, l5 != null ? l5.toString() : null, fe8Var.a.toString()));
        j77 j77Var = new j77(str3, str2, vu2Var.i);
        String str14 = ev2Var.a;
        if (str14 == null) {
            str14 = vu2Var.c;
        }
        String str15 = str14;
        switch (i2) {
            case 2:
                o77Var = o77.TRACE;
                break;
            case 3:
                o77Var = o77.DEBUG;
                break;
            case 4:
                o77Var = o77.INFO;
                break;
            case 5:
                o77Var = o77.WARN;
                break;
            case 6:
                o77Var = o77.ERROR;
                break;
            case 7:
                o77Var = o77.CRITICAL;
                break;
            case 8:
            default:
                o77Var = o77.DEBUG;
                break;
            case 9:
                o77Var = o77.EMERGENCY;
                break;
        }
        o77 o77Var2 = o77Var;
        String str16 = vu2Var.p;
        f77 f77Var = new f77(new g77(va3Var.i));
        String strF0 = bu1.F0(setP1, ",", null, null, null, 62);
        l77 l77Var = new l77(va3Var.f, va3Var.h, va3Var.g);
        switch (dv2.a[va3Var.d.ordinal()]) {
            case 1:
                r77Var = r77.MOBILE;
                break;
            case 2:
                r77Var = r77.TABLET;
                break;
            case 3:
                r77Var = r77.TV;
                break;
            case 4:
                r77Var = r77.DESKTOP;
                break;
            case 5:
                r77Var = r77.GAMING_CONSOLE;
                break;
            case 6:
                r77Var = r77.BOT;
                break;
            case 7:
                r77Var = r77.OTHER;
                break;
            default:
                ygf.a();
                return null;
        }
        i77 i77Var = new i77(r77Var, va3Var.a, va3Var.c, va3Var.b, va3Var.i, Integer.valueOf(va3Var.l), va3Var.m, va3Var.n);
        String strValueOf = String.valueOf(vu2Var.f);
        str4.getClass();
        return new u77(i77Var, l77Var, o77Var2, str15, str, str4, j77Var, f77Var, s77Var, null, k77Var, h77Var, str16, strValueOf, strF0, linkedHashMap3);
    }

    public static final wg6 P(Annotation annotation) {
        annotation.getClass();
        Class<? extends Annotation> clsAnnotationType = annotation.annotationType();
        clsAnnotationType.getClass();
        return n1b.a.b(clsAnnotationType);
    }

    public static final List Q(mn6 mn6Var) {
        mn6Var.getClass();
        a0(mn6Var);
        int I = I(mn6Var);
        if (I == 0) {
            return ey3.a;
        }
        List listSubList = mn6Var.h0().subList(0, I);
        ArrayList arrayList = new ArrayList(cu1.k0(listSubList, 10));
        Iterator it2 = listSubList.iterator();
        while (it2.hasNext()) {
            arrayList.add(((xwd) it2.next()).b());
        }
        return arrayList;
    }

    public static final c65 R(z05 z05Var) {
        if (!z05Var.d() || z05Var.c()) {
            return null;
        }
        e65 e65Var = e65.b;
        y05 y05VarB = z05Var.i().b();
        String strB = z05Var.g().b();
        strB.getClass();
        e65Var.getClass();
        d65 d65VarA = e65Var.a(y05VarB, strB);
        if (d65VarA != null) {
            return d65VarA.a;
        }
        return null;
    }

    public static final boolean S(mkd mkdVar) {
        pa9 pa9Var;
        bb9 bb9Var = mkdVar.c;
        mx3 mx3Var = (bb9Var == null || (pa9Var = bb9Var.a) == null) ? null : new mx3(pa9Var.b);
        boolean z2 = false;
        if (mx3Var != null && mx3Var.a == 1) {
            z2 = true;
        }
        return !z2;
    }

    public static final Class T(wg6 wg6Var) {
        wg6Var.getClass();
        Class clsE = ((ym1) wg6Var).e();
        clsE.getClass();
        return clsE;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static final Class U(wg6 wg6Var) {
        wg6Var.getClass();
        Class clsE = ((ym1) wg6Var).e();
        if (clsE.isPrimitive()) {
            String name = clsE.getName();
            switch (name.hashCode()) {
                case -1325958191:
                    if (name.equals("double")) {
                        return Double.class;
                    }
                    break;
                case 104431:
                    if (name.equals("int")) {
                        return Integer.class;
                    }
                    break;
                case 3039496:
                    if (name.equals("byte")) {
                        return Byte.class;
                    }
                    break;
                case 3052374:
                    if (name.equals("char")) {
                        return Character.class;
                    }
                    break;
                case 3327612:
                    if (name.equals("long")) {
                        return Long.class;
                    }
                    break;
                case 3625364:
                    if (name.equals("void")) {
                        return Void.class;
                    }
                    break;
                case 64711720:
                    if (name.equals("boolean")) {
                        return Boolean.class;
                    }
                    break;
                case 97526364:
                    if (name.equals("float")) {
                        return Float.class;
                    }
                    break;
                case 109413500:
                    if (name.equals("short")) {
                        return Short.class;
                    }
                    break;
            }
        }
        return clsE;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static final Class V(wg6 wg6Var) {
        wg6Var.getClass();
        Class clsE = ((ym1) wg6Var).e();
        if (clsE.isPrimitive()) {
            return clsE;
        }
        String name = clsE.getName();
        switch (name.hashCode()) {
            case -2056817302:
                if (name.equals("java.lang.Integer")) {
                    return Integer.TYPE;
                }
                return null;
            case -527879800:
                if (name.equals("java.lang.Float")) {
                    return Float.TYPE;
                }
                return null;
            case -515992664:
                if (name.equals("java.lang.Short")) {
                    return Short.TYPE;
                }
                return null;
            case 155276373:
                if (name.equals("java.lang.Character")) {
                    return Character.TYPE;
                }
                return null;
            case 344809556:
                if (name.equals("java.lang.Boolean")) {
                    return Boolean.TYPE;
                }
                return null;
            case 398507100:
                if (name.equals("java.lang.Byte")) {
                    return Byte.TYPE;
                }
                return null;
            case 398795216:
                if (name.equals("java.lang.Long")) {
                    return Long.TYPE;
                }
                return null;
            case 399092968:
                if (name.equals("java.lang.Void")) {
                    return Void.TYPE;
                }
                return null;
            case 761287205:
                if (name.equals("java.lang.Double")) {
                    return Double.TYPE;
                }
                return null;
            default:
                return null;
        }
    }

    public static final wg6 W(Class cls) {
        cls.getClass();
        return n1b.a.b(cls);
    }

    public static final mn6 X(mn6 mn6Var) {
        mn6Var.getClass();
        a0(mn6Var);
        if (mn6Var.getAnnotations().i(lnc.p) == null) {
            return null;
        }
        return ((xwd) mn6Var.h0().get(I(mn6Var))).b();
    }

    public static final List Y(mn6 mn6Var) {
        mn6Var.getClass();
        a0(mn6Var);
        List listH0 = mn6Var.h0();
        return listH0.subList(((!a0(mn6Var) || mn6Var.getAnnotations().i(lnc.p) == null) ? 0 : 1) + I(mn6Var), listH0.size() - 1);
    }

    public static final Uri Z(Context context) {
        String strX = b09.x("img_", ".jpg", System.currentTimeMillis());
        ContentValues contentValues = new ContentValues();
        contentValues.put("_display_name", strX);
        contentValues.put("mime_type", "image/jpeg");
        int i2 = Build.VERSION.SDK_INT;
        if (i2 >= 29) {
            contentValues.put("relative_path", "Pictures/Medium/");
        }
        Uri uriInsert = context.getContentResolver().insert(i2 >= 29 ? MediaStore.Images.Media.getContentUri("external") : MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues);
        if (uriInsert != null) {
            return uriInsert;
        }
        ay0.e("Failed to create new MediaStore record.");
        return null;
    }

    public static final boolean a0(mn6 mn6Var) {
        c65 c65VarR;
        mn6Var.getClass();
        co1 co1VarA = mn6Var.j0().a();
        if (co1VarA == null) {
            return false;
        }
        if ((co1VarA instanceof y28) && vm6.I(co1VarA)) {
            int i2 = f93.a;
            z05 z05VarG = d93.g(co1VarA);
            z05VarG.getClass();
            c65VarR = R(z05VarG);
        } else {
            c65VarR = null;
        }
        return g76.L(c65VarR, y55.c) || g76.L(c65VarR, b65.c);
    }

    public static final void b(boolean z2, final i1a i1aVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1152868938);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.g(z2) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(i1aVar) ? 32 : 16;
        }
        int i4 = i3 | 384;
        final int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, "privacy_address_book_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            x(0, 4, p65Var, null, vo7.R(p65Var, R.string.privacy_address_book_title), vo7.R(p65Var, R.string.privacy_address_book_description));
            p65Var = p65Var;
            boolean z3 = !z2;
            String strR = vo7.R(p65Var, R.string.privacy_address_book_option_nobody);
            int i7 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z4 = i7 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                objM = new m45() { // from class: h1a
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i8 = i;
                        c1e c1eVar = c1e.a;
                        i1a i1aVar2 = i1aVar;
                        switch (i8) {
                            case 0:
                                i1aVar2.a(false);
                                break;
                            default:
                                i1aVar2.a(true);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            aq7.e(z3, strR, (m45) objM, bgf.N(w2g.G(o28Var, 0.0f, 10.0f, 24.0f, 0.0f, 9), "privacy_address_book_option_nobody"), p65Var, 3072);
            String strR2 = vo7.R(p65Var, R.string.privacy_address_book_option_everyone);
            i = i7 == 32 ? 1 : 0;
            Object objM2 = p65Var.M();
            if (i != 0 || objM2 == uobVar) {
                objM2 = new m45() { // from class: h1a
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i8 = i5;
                        c1e c1eVar = c1e.a;
                        i1a i1aVar2 = i1aVar;
                        switch (i8) {
                            case 0:
                                i1aVar2.a(false);
                                break;
                            default:
                                i1aVar2.a(true);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            aq7.e(z2, strR2, (m45) objM2, bgf.N(w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11), "privacy_address_book_option_everyone"), p65Var, (i4 & 14) | 3072);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g1a(z2, i1aVar, r28Var2, i2, 1);
        }
    }

    public static final enc b0(sb2 sb2Var, ib2 ib2Var, wb2 wb2Var, b55 b55Var) {
        ib2 ib2VarQ = guc.Q(sb2Var, ib2Var);
        enc rw6Var = wb2Var.isLazy() ? new rw6(ib2VarQ, b55Var) : new enc(ib2VarQ, true);
        wb2Var.invoke(b55Var, rw6Var, rw6Var);
        return rw6Var;
    }

    public static final void c(final sd1 sd1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(541323754);
        int i3 = (p65Var.f(sd1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            String str = sd1Var.f;
            boolean z2 = sd1Var.a;
            kx kxVarW = ho2.w(p65Var, 521095601);
            String strA = af1.a(sd1Var.h, p65Var);
            String strQ = vo7.Q(R.string.notification_type_catalog_followed_milestone, new Object[]{strA, String.valueOf(sd1Var.c)}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                long j2 = sd1Var.b;
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i3 & 14;
                boolean z3 = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z3 || objM == uobVar) {
                    objM = new m45() { // from class: td1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i6 = i;
                            c1e c1eVar = c1e.a;
                            sd1 sd1Var2 = sd1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i6) {
                                case 0:
                                    ek8Var2.k(sd1Var2.d, sd1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(sd1Var2.d, sd1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = (i4 == 32 ? 1 : 0) | (i5 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    final int i7 = 1;
                    objM2 = new m45() { // from class: td1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i62 = i7;
                            c1e c1eVar = c1e.a;
                            sd1 sd1Var2 = sd1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i62) {
                                case 0:
                                    ek8Var2.k(sd1Var2.d, sd1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(sd1Var2.d, sd1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z2, str, null, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 384, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(sd1Var, ek8Var, i2, 22);
        }
    }

    public static enc c0(sb2 sb2Var, ib2 ib2Var, wb2 wb2Var, b55 b55Var, int i2) {
        if ((i2 & 1) != 0) {
            ib2Var = zx3.a;
        }
        if ((i2 & 2) != 0) {
            wb2Var = wb2.DEFAULT;
        }
        return b0(sb2Var, ib2Var, wb2Var, b55Var);
    }

    public static final void d(fu3 fu3Var, nhc nhcVar, nt3 nt3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(460941931);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(fu3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(nt3Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        byte b2 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var = p65Var2;
            pr7.b(r28Var, pxf.E(-1331788433, new it3(nt3Var, 5, b2), p65Var2), null, pxf.E(2147131633, new u8(nhcVar, 21), p65Var2), null, 0, 0L, 0L, null, pxf.E(-1764626054, new ec(fu3Var, i4, nt3Var), p65Var2), p65Var, ((i3 >> 9) & 14) | 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 18, fu3Var, nhcVar, nt3Var, r28Var);
        }
    }

    public static vq6 d0(yw6 yw6Var, m45 m45Var) {
        h1c h1cVar = h1c.k;
        yw6Var.getClass();
        m45Var.getClass();
        int i2 = ys6.a[yw6Var.ordinal()];
        if (i2 == 1) {
            return new w5d(m45Var);
        }
        if (i2 == 2) {
            rnb rnbVar = new rnb();
            rnbVar.a = m45Var;
            rnbVar.b = h1cVar;
            return rnbVar;
        }
        if (i2 != 3) {
            ygf.a();
            return null;
        }
        k2e k2eVar = new k2e();
        k2eVar.a = m45Var;
        k2eVar.b = h1cVar;
        return k2eVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v12 */
    /* JADX WARN: Type inference failed for: r12v13 */
    /* JADX WARN: Type inference failed for: r12v15 */
    /* JADX WARN: Type inference failed for: r1v3 */
    /* JADX WARN: Type inference failed for: r1v4, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r1v9 */
    /* JADX WARN: Type inference failed for: r8v1, types: [p65, x12] */
    public static final void e(String str, rz2 rz2Var, zz zzVar, r28 r28Var, ju3 ju3Var, x12 x12Var, int i2) {
        ju3 ju3Var2;
        ju3 ju3Var3;
        int i3;
        ju3 ju3Var4;
        uob uobVar;
        ?? r1;
        int i4;
        int i5;
        str.getClass();
        ?? r8 = (p65) x12Var;
        r8.a0(-2134626550);
        int i6 = 2;
        int i7 = 16;
        int i8 = i2 | (r8.f(str) ? 4 : 2) | (r8.f(rz2Var) ? 32 : 16) | (r8.h(zzVar) ? 256 : 128) | (r8.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (r8.P(i8 & 1, (i8 & 9363) != 9362)) {
            r8.U();
            int i9 = i2 & 1;
            uob uobVar2 = w12.a;
            if (i9 == 0 || r8.z()) {
                boolean z2 = (i8 & 14) == 4;
                Object objM = r8.M();
                Object obj = objM;
                if (z2 || objM == uobVar2) {
                    mb mbVar = new mb(str, i7);
                    r8.j0(mbVar);
                    obj = mbVar;
                }
                x45 x45Var = (x45) obj;
                wue wueVarA = e67.a(r8);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ju3Var3 = (ju3) to7.z(n1b.a.b(ju3.class), wueVarA, t40.E(wueVarA, r8), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), r8);
                    i3 = i8 & (-57345);
                }
            } else {
                r8.S();
                i3 = i8 & (-57345);
                ju3Var3 = ju3Var;
            }
            r8.q();
            l78 l78VarZ = guc.z(ju3Var3.n, r8, 0);
            Context context = (Context) r8.j(eo.b);
            Object objM2 = r8.M();
            Object objJ = objM2;
            if (objM2 == uobVar2) {
                objJ = y30.j(r8);
            }
            nhc nhcVar = (nhc) objJ;
            Object objM3 = r8.M();
            Object obj2 = objM3;
            if (objM3 == uobVar2) {
                k49 k49VarU = qo7.u(null);
                r8.j0(k49VarU);
                obj2 = k49VarU;
            }
            l78 l78Var = (l78) obj2;
            boolean zH = r8.h(ju3Var3);
            Object objM4 = r8.M();
            Object obj3 = objM4;
            if (zH || objM4 == uobVar2) {
                nh2 nh2Var = new nh2(18, ju3Var3);
                r8.j0(nh2Var);
                obj3 = nh2Var;
            }
            nk7.a(false, (m45) obj3, r8, 0, 1);
            g7 g7Var = new g7(6);
            boolean zH2 = r8.h(ju3Var3) | r8.h(context);
            Object objM5 = r8.M();
            Object obj4 = objM5;
            if (zH2 || objM5 == uobVar2) {
                o8 o8Var = new o8(ju3Var3, context, l78Var, 15);
                r8.j0(o8Var);
                obj4 = o8Var;
            }
            ug7 ug7VarT = sgg.T(g7Var, (x45) obj4, r8, 0);
            e99 e99Var = new e99(context);
            boolean zH3 = r8.h(ju3Var3) | r8.h(context);
            Object objM6 = r8.M();
            Object obj5 = objM6;
            if (zH3 || objM6 == uobVar2) {
                si3 si3Var = new si3(ju3Var3, i6, context);
                r8.j0(si3Var);
                obj5 = si3Var;
            }
            ug7 ug7VarT2 = sgg.T(e99Var, (x45) obj5, r8, 8);
            int i10 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i10 == 32) | r8.f(ju3Var3) | r8.f(ug7VarT) | r8.f(ug7VarT2);
            Object objM7 = r8.M();
            if (zF || objM7 == uobVar2) {
                ju3Var4 = ju3Var3;
                uobVar = uobVar2;
                r1 = 0;
                i4 = 32;
                i5 = 1;
                nt3 nt3Var = new nt3(ju3Var4, rz2Var, context, ug7VarT, l78Var, ug7VarT2);
                r8.j0(nt3Var);
                objM7 = nt3Var;
            } else {
                ju3Var4 = ju3Var3;
                uobVar = uobVar2;
                r1 = 0;
                i4 = 32;
                i5 = 1;
            }
            nt3 nt3Var2 = (nt3) objM7;
            int i11 = (i3 & 7168) | 48;
            uob uobVar3 = uobVar;
            int i12 = i4;
            int i13 = i5;
            d((fu3) l78VarZ.getValue(), nhcVar, nt3Var2, r28Var, r8, i11);
            ut3 ut3Var = (ut3) guc.z(ju3Var4.s, r8, r1).getValue();
            if (g76.L(ut3Var, ut3.a)) {
                r8.Y(1618353166);
                rx0.a(nt3Var2, r8, r1);
                r8.p(r1);
            } else if (g76.L(ut3Var, ut3.c)) {
                r8.Y(1618355950);
                r8.p(r1);
            } else {
                if (!g76.L(ut3Var, ut3.b)) {
                    throw ho2.L(r8, 1618350887, r1);
                }
                r8.Y(1618358197);
                rx0.o(nt3Var2, r8, r1);
                r8.p(r1);
            }
            boolean zH4 = r8.h(zzVar) | r8.h(ju3Var4);
            Object objM8 = r8.M();
            Object obj6 = objM8;
            if (zH4 || objM8 == uobVar3) {
                xs3 xs3Var = new xs3(zzVar, ju3Var4, null, i13);
                r8.j0(xs3Var);
                obj6 = xs3Var;
            }
            c1e c1eVar = c1e.a;
            kyd.k(r8, (b55) obj6, c1eVar);
            Resources resources = (Resources) r8.j(eo.c);
            int i14 = (r8.h(ju3Var4) ? 1 : 0) | (i10 == i12 ? i13 : r1) | (r8.h(resources) ? 1 : 0) | (r8.f(nt3Var2) ? 1 : 0);
            Object objM9 = r8.M();
            if (i14 != 0 || objM9 == uobVar3) {
                b9 b9Var = new b9((Object) ju3Var4, (Object) rz2Var, nhcVar, resources, (Object) nt3Var2, (n92) null, 17);
                r8.j0(b9Var);
                objM9 = b9Var;
            }
            kyd.k(r8, (b55) objM9, c1eVar);
            ju3Var2 = ju3Var4;
        } else {
            r8.S();
            ju3Var2 = ju3Var;
        }
        mwa mwaVarS = r8.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, rz2Var, zzVar, r28Var, ju3Var2, i2, 16);
        }
    }

    public static w5d e0(m45 m45Var) {
        m45Var.getClass();
        return new w5d(m45Var);
    }

    public static final void f(nt3 nt3Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-530239844);
        int i3 = (p65Var2.f(nt3Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.edit_profile_title);
            boolean z2 = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new hq3(0, nt3Var, nt3.class, "onBackPressed", "onBackPressed()V", 0, 12);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, strR, (m45) ((qh6) objM), pxf.E(-1719396587, new so1(9, nt3Var), p65Var2), null, null, 0L, 0L, null, p65Var, 3072, 497);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new it3(nt3Var, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0095  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void f0(int r6, defpackage.qpc r7, defpackage.m50 r8, defpackage.k21 r9) {
        /*
            if (r6 != 0) goto Lb
            opc r6 = defpackage.opc.HORIZONTAL_CHAIN
            hj5 r6 = r7.e(r6)
            ir5 r6 = (defpackage.ir5) r6
            goto L13
        Lb:
            opc r6 = defpackage.opc.VERTICAL_CHAIN
            hj5 r6 = r7.e(r6)
            xse r6 = (defpackage.xse) r6
        L13:
            r0 = 1
            m21 r1 = r9.w(r0)
            boolean r2 = r1 instanceof defpackage.k21
            if (r2 == 0) goto Lb8
            k21 r1 = (defpackage.k21) r1
            java.util.ArrayList r2 = r1.e
            int r2 = r2.size()
            if (r2 >= r0) goto L28
            goto Lb8
        L28:
            r2 = 0
            r3 = r2
        L2a:
            java.util.ArrayList r4 = r1.e
            int r4 = r4.size()
            if (r3 >= r4) goto L40
            java.lang.String r4 = r1.D(r3)
            java.lang.Object[] r5 = new java.lang.Object[r0]
            r5[r2] = r4
            r6.q(r5)
            int r3 = r3 + 1
            goto L2a
        L40:
            java.util.ArrayList r1 = r9.e
            int r1 = r1.size()
            r3 = 2
            if (r1 <= r3) goto Lb8
            m21 r9 = r9.w(r3)
            boolean r1 = r9 instanceof defpackage.q21
            if (r1 != 0) goto L52
            goto Lb8
        L52:
            q21 r9 = (defpackage.q21) r9
            java.util.ArrayList r1 = r9.H()
            java.util.Iterator r1 = r1.iterator()
        L5c:
            boolean r3 = r1.hasNext()
            if (r3 == 0) goto Lb8
            java.lang.Object r3 = r1.next()
            java.lang.String r3 = (java.lang.String) r3
            r3.getClass()
            java.lang.String r4 = "style"
            boolean r4 = r3.equals(r4)
            if (r4 != 0) goto L77
            g0(r8, r9, r6, r7, r3)
            goto L5c
        L77:
            m21 r3 = r9.x(r3)
            boolean r4 = r3 instanceof defpackage.k21
            if (r4 == 0) goto L95
            r4 = r3
            k21 r4 = (defpackage.k21) r4
            java.util.ArrayList r5 = r4.e
            int r5 = r5.size()
            if (r5 <= r0) goto L95
            java.lang.String r3 = r4.D(r2)
            float r4 = r4.y(r0)
            r6.n0 = r4
            goto L99
        L95:
            java.lang.String r3 = r3.e()
        L99:
            java.lang.String r4 = "packed"
            boolean r4 = r3.equals(r4)
            if (r4 != 0) goto Lb3
            java.lang.String r4 = "spread_inside"
            boolean r3 = r3.equals(r4)
            if (r3 != 0) goto Lae
            lpc r3 = defpackage.lpc.SPREAD
            r6.t0 = r3
            goto L5c
        Lae:
            lpc r3 = defpackage.lpc.SPREAD_INSIDE
            r6.t0 = r3
            goto L5c
        Lb3:
            lpc r3 = defpackage.lpc.PACKED
            r6.t0 = r3
            goto L5c
        Lb8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.f0(int, qpc, m50, k21):void");
    }

    public static final void g(boolean z2, xn7 xn7Var, m45 m45Var, m45 m45Var2, r28 r28Var, boolean z3, x12 x12Var, int i2) {
        p65 p65Var;
        boolean z4;
        xn7Var.getClass();
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-34382752);
        int i3 = i2 | (p65Var2.g(z2) ? 4 : 2) | (p65Var2.h(m45Var) ? 256 : 128) | (p65Var2.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 196608;
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            if (z2) {
                p65Var2.Y(-2094128313);
                p65Var = p65Var2;
                fo7.j(m45Var2, vo7.R(p65Var2, R.string.common_following), xn7Var, bgf.N(r28Var, "unfollow_button"), true, null, p65Var, ((i3 >> 9) & 14) | 24960, 32);
                p65Var.p(false);
            } else {
                p65Var2.Y(-2093841904);
                fo7.i(m45Var, vo7.R(p65Var2, R.string.common_follow), xn7Var, bgf.N(r28Var, "follow_button"), true, p65Var2, ((i3 >> 6) & 14) | 24960, 0);
                p65Var = p65Var2;
                p65Var.p(false);
            }
            z4 = true;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            z4 = z3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ss4(z2, xn7Var, m45Var, m45Var2, r28Var, z4, i2);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to find 'out' block for switch in B:61:0x00ec. Please report as an issue. */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r16v0 */
    /* JADX WARN: Type inference failed for: r16v1 */
    /* JADX WARN: Type inference failed for: r16v2 */
    /* JADX WARN: Type inference failed for: r16v3 */
    /* JADX WARN: Type inference failed for: r16v4 */
    /* JADX WARN: Type inference failed for: r16v5 */
    /* JADX WARN: Type inference failed for: r16v6 */
    /* JADX WARN: Type inference failed for: r16v7 */
    /* JADX WARN: Type inference failed for: r23v0, types: [c62] */
    /* JADX WARN: Type inference failed for: r24v0, types: [qpc] */
    public static void g0(m50 m50Var, q21 q21Var, c62 c62Var, qpc qpcVar, String str) {
        c62 c62VarB;
        String strE;
        c62 c62VarB2;
        boolean z2;
        char c2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6 = qpcVar.b;
        m21 m21VarC = q21Var.C(str);
        k21 k21Var = m21VarC instanceof k21 ? (k21) m21VarC : null;
        ?? r16 = -1;
        r16 = -1;
        r16 = -1;
        r16 = -1;
        if (k21Var == null || k21Var.e.size() <= 1) {
            String strF = q21Var.F(str);
            if (strF != null) {
                c62VarB = strF.equals("parent") ? qpcVar.b(0) : qpcVar.b(strF);
                str.getClass();
                switch (str) {
                    case "baseline":
                        qpcVar.a(c62Var.a);
                        qpcVar.a(c62VarB.a);
                        c62Var.d0 = mpc.BASELINE_TO_BASELINE;
                        c62Var.X = c62VarB;
                        break;
                    case "bottom":
                        c62Var.e(c62VarB);
                        break;
                    case "end":
                        if (z6) {
                            c62Var.d0 = mpc.RIGHT_TO_RIGHT;
                            c62Var.M = c62VarB;
                            break;
                        } else {
                            c62Var.d0 = mpc.LEFT_TO_LEFT;
                            c62Var.J = c62VarB;
                            break;
                        }
                        break;
                    case "top":
                        c62Var.p(c62VarB);
                        break;
                    case "start":
                        if (z6) {
                            c62Var.d0 = mpc.LEFT_TO_LEFT;
                            c62Var.J = c62VarB;
                            break;
                        } else {
                            c62Var.d0 = mpc.RIGHT_TO_RIGHT;
                            c62Var.M = c62VarB;
                            break;
                        }
                        break;
                }
            }
            return;
        }
        String strD = k21Var.D(0);
        m21 m21VarB = k21Var.B(1);
        strE = m21VarB instanceof s21 ? m21VarB.e() : null;
        float fD = k21Var.e.size() > 2 ? qpcVar.a.d(m50Var.w(k21Var.B(2))) : 0.0f;
        float fD2 = k21Var.e.size() > 3 ? qpcVar.a.d(m50Var.w(k21Var.B(3))) : 0.0f;
        c62VarB2 = strD.equals("parent") ? qpcVar.b(0) : qpcVar.b(strD);
        str.getClass();
        switch (str) {
            case "baseline":
                z2 = true;
                c2 = 2;
                strE.getClass();
                switch (strE) {
                    case "baseline":
                        qpcVar.a(c62Var.a);
                        qpcVar.a(c62VarB2.a);
                        c62Var.d0 = mpc.BASELINE_TO_BASELINE;
                        c62Var.X = c62VarB2;
                        break;
                    case "bottom":
                        qpcVar.a(c62Var.a);
                        c62Var.d0 = mpc.BASELINE_TO_BOTTOM;
                        c62Var.Z = c62VarB2;
                        break;
                    case "top":
                        qpcVar.a(c62Var.a);
                        c62Var.d0 = mpc.BASELINE_TO_TOP;
                        c62Var.Y = c62VarB2;
                        break;
                }
                z3 = z2;
                z4 = false;
                break;
            case "circular":
                z2 = true;
                float fW = m50Var.w(k21Var.w(1));
                float fD3 = k21Var.e.size() > 2 ? qpcVar.a.d(m50Var.w(k21Var.B(2))) : 0.0f;
                c62Var.a0 = c62Var.j(c62VarB2);
                c62Var.b0 = fW;
                c62Var.c0 = fD3;
                c62Var.d0 = mpc.CIRCULAR_CONSTRAINT;
                c2 = 2;
                z3 = z2;
                z4 = false;
                break;
            case "bottom":
                strE.getClass();
                switch (strE) {
                    case "baseline":
                        qpcVar.a(c62VarB2.a);
                        c62Var.d0 = mpc.BOTTOM_TO_BASELINE;
                        c62Var.W = c62VarB2;
                        break;
                    case "bottom":
                        c62Var.e(c62VarB2);
                        break;
                    case "top":
                        c62Var.d0 = mpc.BOTTOM_TO_TOP;
                        c62Var.U = c62VarB2;
                        break;
                }
                z2 = true;
                c2 = 2;
                z3 = z2;
                z4 = false;
                break;
            case "end":
                z3 = !z6;
                z2 = true;
                c2 = 2;
                z4 = true;
                break;
            case "top":
                strE.getClass();
                switch (strE) {
                    case "baseline":
                        qpcVar.a(c62VarB2.a);
                        c62Var.d0 = mpc.TOP_TO_BASELINE;
                        c62Var.T = c62VarB2;
                        break;
                    case "bottom":
                        c62Var.d0 = mpc.TOP_TO_BOTTOM;
                        c62Var.S = c62VarB2;
                        break;
                    case "top":
                        c62Var.p(c62VarB2);
                        break;
                }
                z2 = true;
                c2 = 2;
                z3 = z2;
                z4 = false;
                break;
            case "left":
                z3 = true;
                z2 = true;
                c2 = 2;
                z4 = true;
                break;
            case "right":
                z3 = false;
                z2 = true;
                c2 = 2;
                z4 = true;
                break;
            case "start":
                z3 = z6;
                z2 = true;
                c2 = 2;
                z4 = true;
                break;
            default:
                z2 = true;
                c2 = 2;
                z3 = z2;
                z4 = false;
                break;
        }
        if (z4) {
            strE.getClass();
            switch (strE.hashCode()) {
                case 100571:
                    if (strE.equals("end")) {
                        r16 = 0;
                    }
                    break;
                case 108511772:
                    if (strE.equals("right")) {
                        r16 = z2;
                    }
                    break;
                case 109757538:
                    if (strE.equals("start")) {
                        r16 = c2;
                    }
                    break;
            }
            switch (r16) {
                case 0:
                    z5 = !z6;
                    break;
                case 1:
                    z5 = false;
                    break;
                case 2:
                    z5 = z6;
                    break;
                default:
                    z5 = z2;
                    break;
            }
            if (z3) {
                if (z5) {
                    c62Var.d0 = mpc.LEFT_TO_LEFT;
                    c62Var.J = c62VarB2;
                } else {
                    c62Var.d0 = mpc.LEFT_TO_RIGHT;
                    c62Var.K = c62VarB2;
                }
            } else if (z5) {
                c62Var.d0 = mpc.RIGHT_TO_LEFT;
                c62Var.L = c62VarB2;
            } else {
                c62Var.d0 = mpc.RIGHT_TO_RIGHT;
                c62Var.M = c62VarB2;
            }
        }
        c62Var.l(Float.valueOf(fD)).n(Float.valueOf(fD2));
    }

    public static final void h(rw4 rw4Var, lw4 lw4Var, kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        lw4 lw4Var2;
        lw4 lw4Var3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(318232728);
        int i3 = i2 | (p65Var2.f(rw4Var) ? 4 : 2) | (p65Var2.f(lw4Var) ? 32 : 16) | (p65Var2.f(kv6Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z2 = rw4Var.b;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i4 == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                gi4 gi4Var = new gi4(0, lw4Var, lw4.class, "refresh", "refresh()V", 0, 14);
                lw4Var3 = lw4Var;
                p65Var2.j0(gi4Var);
                objM = gi4Var;
            } else {
                lw4Var3 = lw4Var;
            }
            r28 r28VarB = r28Var.b(jfc.c);
            mz1 mz1VarE = pxf.E(-460585910, new nh((Object) kv6Var, (Object) rw4Var, (Object) lw4Var3, 29), p65Var2);
            lw4Var2 = lw4Var;
            er7.d(z2, (m45) ((qh6) objM), r28VarB, null, 0L, 0L, false, 0.0f, null, null, mz1VarE, p65Var2, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z4 = i4 == 32;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                objM2 = new z8(lw4Var2, null, 27);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            lw4Var2 = lw4Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 8, r28Var, (Object) rw4Var, (Object) lw4Var2, (Object) kv6Var);
        }
    }

    public static we3 h0(q21 q21Var, String str, qpc qpcVar, o19 o19Var) {
        m21 m21VarX = q21Var.x(str);
        we3 we3VarB = we3.b(0);
        if (m21VarX instanceof s21) {
            return i0(m21VarX.e());
        }
        if (m21VarX instanceof o21) {
            return we3.b(qpcVar.c(Float.valueOf(o19Var.d(q21Var.z(str)))));
        }
        if (m21VarX instanceof q21) {
            q21 q21Var2 = (q21) m21VarX;
            String strF = q21Var2.F("value");
            if (strF != null) {
                we3VarB = i0(strF);
            }
            m21 m21VarC = q21Var2.C("min");
            if (m21VarC != null) {
                if (m21VarC instanceof o21) {
                    int iC = qpcVar.c(Float.valueOf(o19Var.d(((o21) m21VarC).q())));
                    if (iC >= 0) {
                        we3VarB.a = iC;
                    }
                } else if (m21VarC instanceof s21) {
                    we3VarB.a = -2;
                }
            }
            m21 m21VarC2 = q21Var2.C("max");
            if (m21VarC2 != null) {
                if (m21VarC2 instanceof o21) {
                    int iC2 = qpcVar.c(Float.valueOf(o19Var.d(((o21) m21VarC2).q())));
                    if (we3VarB.b >= 0) {
                        we3VarB.b = iC2;
                        return we3VarB;
                    }
                } else if ((m21VarC2 instanceof s21) && we3VarB.g) {
                    we3VarB.f = we3.i;
                    we3VarB.b = Integer.MAX_VALUE;
                }
            }
        }
        return we3VarB;
    }

    public static final void i(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-113199330);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
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
            gq7.a(iy0.a.a(o28Var, ar0Var), null, vo7.R(p65Var, R.string.followers_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 0);
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static we3 i0(String str) {
        we3 we3VarB = we3.b(0);
        byte b2 = -1;
        switch (str.hashCode()) {
            case -1460244870:
                if (str.equals("preferWrap")) {
                    b2 = 0;
                }
                break;
            case -995424086:
                if (str.equals("parent")) {
                    b2 = 1;
                }
                break;
            case -895684237:
                if (str.equals("spread")) {
                    b2 = 2;
                }
                break;
            case 3657802:
                if (str.equals("wrap")) {
                    b2 = 3;
                }
                break;
        }
        String str2 = we3.i;
        String str3 = we3.j;
        switch (b2) {
            case 0:
                return we3.c(str2);
            case 1:
                return new we3(we3.k);
            case 2:
                return we3.c(str3);
            case 3:
                return new we3(str2);
            default:
                if (str.endsWith("%")) {
                    float f2 = Float.parseFloat(str.substring(0, str.indexOf(37))) / 100.0f;
                    we3 we3Var = new we3(we3.l);
                    we3Var.c = f2;
                    we3Var.g = true;
                    we3Var.b = 0;
                    return we3Var;
                }
                if (!str.contains(":")) {
                    return we3VarB;
                }
                we3 we3Var2 = new we3(we3.m);
                we3Var2.e = str;
                we3Var2.f = str3;
                we3Var2.g = true;
                return we3Var2;
        }
    }

    public static final void j(tw4 tw4Var, lw4 lw4Var, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object gi4Var;
        tw4 tw4Var2 = tw4Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(208294157);
        int i3 = i2 | (p65Var.f(tw4Var2) ? 4 : 2) | (p65Var.f(lw4Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
            ar0 ar0Var2 = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var2, false);
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
            tw4Var2 = tw4Var;
            b24 b24Var = tw4Var2.a;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                ar0Var = ar0Var2;
                gi4Var = new gi4(0, lw4Var, lw4.class, "refresh", "refresh()V", 0, 15);
                p65Var.j0(gi4Var);
            } else {
                gi4Var = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(o28Var, ar0Var), null, null, null, null, (m45) ((qh6) gi4Var), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 23, tw4Var2, lw4Var, r28Var);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:17:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00e2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void j0(int r17, defpackage.qpc r18, java.lang.String r19, defpackage.q21 r20) {
        /*
            Method dump skipped, instruction units count: 412
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.j0(int, qpc, java.lang.String, q21):void");
    }

    public static final void k(kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(830641724);
        int i3 = (p65Var.f(kv6Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarB = r28Var.b(jfc.c);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new cq4(7);
                p65Var.j0(objM);
            }
            k40.t(r28VarB, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 817889280, 380);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mw4(kv6Var, r28Var, i2, i4);
        }
    }

    public static void k0(qpc qpcVar, m50 m50Var, String str, q21 q21Var) throws CLParsingException {
        c62 c62VarB = qpcVar.b(str);
        we3 we3Var = c62VarB.e0;
        Iterator it2 = q21Var.H().iterator();
        while (it2.hasNext()) {
            E(m50Var, q21Var, c62VarB, qpcVar, (String) it2.next());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:82:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void l(defpackage.vw4 r22, defpackage.lw4 r23, defpackage.r28 r24, defpackage.nhc r25, defpackage.kv6 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 316
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.l(vw4, lw4, r28, nhc, kv6, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object l0(defpackage.m45 r5, defpackage.b55 r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.qk
            if (r0 == 0) goto L13
            r0 = r7
            qk r0 = (defpackage.qk) r0
            int r1 = r0.c
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.c = r1
            goto L18
        L13:
            qk r0 = new qk
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.c
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)     // Catch: androidx.compose.foundation.gestures.AnchoredDragFinishedSignal -> L40
            goto L40
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            wk r7 = new wk     // Catch: androidx.compose.foundation.gestures.AnchoredDragFinishedSignal -> L40
            r2 = 2
            r7.<init>(r5, r6, r3, r2)     // Catch: androidx.compose.foundation.gestures.AnchoredDragFinishedSignal -> L40
            r0.c = r4     // Catch: androidx.compose.foundation.gestures.AnchoredDragFinishedSignal -> L40
            java.lang.Object r5 = defpackage.o7f.s(r7, r0)     // Catch: androidx.compose.foundation.gestures.AnchoredDragFinishedSignal -> L40
            if (r5 != r1) goto L40
            return r1
        L40:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.l0(m45, b55, p92):java.lang.Object");
    }

    public static final void m(String str, String str2, rz2 rz2Var, r28 r28Var, ax4 ax4Var, x12 x12Var, int i2) {
        ax4 ax4Var2;
        int i3;
        ax4 ax4Var3;
        ax4 ax4Var4;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2058104849);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(rz2Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            int i6 = 3;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new bb0(str, str2, i6);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ax4 ax4Var5 = (ax4) to7.z(n1b.a.b(ax4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                    ax4Var3 = ax4Var5;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                ax4Var3 = ax4Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ax4Var3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            boolean zF = p65Var.f(ax4Var3) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new pw4(rz2Var, ax4Var3);
                p65Var.j0(objM2);
            }
            pw4 pw4Var = (pw4) objM2;
            l((vw4) l78VarZ.getValue(), pw4Var, r28Var, nhcVarF, kv6VarA, p65Var, (i3 >> 3) & 896, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean zH = p65Var.h(ax4Var3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(pw4Var);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ax4Var4 = ax4Var3;
                b9 b9Var = new b9((que) ax4Var4, nhcVarF, sb2Var, resources, (Object) pw4Var, (n92) null, 19);
                p65Var.j0(b9Var);
                objM4 = b9Var;
            } else {
                ax4Var4 = ax4Var3;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            boolean zF2 = p65Var.f(kv6VarA) | p65Var.f(pw4Var);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new xs3(kv6VarA, pw4Var, null, 11);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, kv6VarA);
            ax4Var2 = ax4Var4;
        } else {
            p65Var.S();
            ax4Var2 = ax4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, str2, rz2Var, r28Var, ax4Var2, i2, 21);
        }
    }

    public static final Object m0(ib2 ib2Var, b55 b55Var, n92 n92Var) throws Throwable {
        Unsafe unsafe;
        long j2;
        ib2 context = n92Var.getContext();
        ib2 ib2VarJ0 = !((Boolean) ib2Var.N(new v02(17, (byte) 0), Boolean.FALSE)).booleanValue() ? context.j0(ib2Var) : guc.D(context, ib2Var, false);
        bo.N(ib2VarJ0);
        if (ib2VarJ0 == context) {
            frb frbVar = new frb(n92Var, ib2VarJ0);
            return mo7.U(frbVar, true, frbVar, b55Var);
        }
        wz7 wz7Var = wz7.d;
        if (g76.L(ib2VarJ0.o0(wz7Var), context.o0(wz7Var))) {
            uzd uzdVar = new uzd(n92Var, ib2VarJ0);
            ib2 ib2Var2 = uzdVar.c;
            Object objF0 = gx1.f0(ib2Var2, null);
            try {
                return mo7.U(uzdVar, true, uzdVar, b55Var);
            } finally {
                gx1.Z(ib2Var2, objF0);
            }
        }
        sg3 sg3Var = new sg3(n92Var, ib2VarJ0);
        try {
            op8.k0(pwd.Q(pwd.F(b55Var, sg3Var, sg3Var)), c1e.a);
            do {
                unsafe = m80.a;
                j2 = sg3.e;
                int intVolatile = unsafe.getIntVolatile(sg3Var, j2);
                if (intVolatile != 0) {
                    if (intVolatile != 2) {
                        ygf.f("Already suspended");
                        return null;
                    }
                    Object objK = o7f.K(sg3Var.H());
                    if (objK instanceof cy1) {
                        throw ((cy1) objK).a;
                    }
                    return objK;
                }
            } while (!unsafe.compareAndSwapInt(sg3Var, j2, 0, 1));
            return tb2.COROUTINE_SUSPENDED;
        } catch (Throwable th) {
            Throwable th2 = th;
            if (th2 instanceof DispatchException) {
                th2 = ((DispatchException) th2).a;
            }
            sg3Var.resumeWith(new ajb(th2));
            throw th2;
        }
    }

    public static final void n(lw4 lw4Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1224187880);
        int i3 = (p65Var2.f(lw4Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.common_followers);
            boolean z2 = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new gi4(0, lw4Var, lw4.class, "onBackPressed", "onBackPressed()V", 0, 17);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 505);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new nw4(lw4Var, i2);
        }
    }

    public static eeg n0(jcg jcgVar) throws GeneralSecurityException {
        bzf bzfVar = jcgVar.e;
        if (bzfVar instanceof g2g) {
            return new d87((g2g) bzfVar);
        }
        if (bzfVar instanceof f1g) {
            return new ad((f1g) bzfVar);
        }
        if (bzfVar instanceof dbg) {
            return new ad((dbg) bzfVar);
        }
        throw new GeneralSecurityException("Unsupported DEM parameters: ".concat(String.valueOf(bzfVar)));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void o(defpackage.mx r19, defpackage.r28 r20, long r21, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 251
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.o(mx, r28, long, x12, int, int):void");
    }

    public static final void p(String str, r28 r28Var, long j2, x12 x12Var, int i2, int i3) {
        int i4;
        long j3;
        long j4;
        r28 r28Var2;
        long j5;
        r28 r28Var3;
        long j6;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-458909355);
        if ((i2 & 6) == 0) {
            i4 = (p65Var.f(str) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        int i5 = i3 & 2;
        if (i5 != 0) {
            i4 |= 48;
        } else if ((i2 & 48) == 0) {
            i4 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            if ((i3 & 4) == 0) {
                j3 = j2;
                int i6 = p65Var.e(j3) ? 256 : 128;
                i4 |= i6;
            } else {
                j3 = j2;
            }
            i4 |= i6;
        } else {
            j3 = j2;
        }
        int i7 = i4 | 3072;
        if (p65Var.P(i7 & 1, (i7 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                if (i5 != 0) {
                    r28Var = o28.b;
                }
                if ((i3 & 4) != 0) {
                    j5 = ((zo7) p65Var.j(kt7.b)).n;
                    i7 &= -897;
                } else {
                    j5 = j3;
                }
                r28Var3 = r28Var;
                j6 = j5;
            } else {
                p65Var.S();
                if ((i3 & 4) != 0) {
                    i7 &= -897;
                }
                r28Var3 = r28Var;
                j6 = j3;
            }
            p65Var.q();
            o(new mx(str), r28Var3, j6, p65Var, i7 & 8176, 0);
            r28Var2 = r28Var3;
            j4 = j6;
        } else {
            p65Var.S();
            j4 = j3;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk0(str, r28Var2, j4, i2, i3, 2);
        }
    }

    public static final void q(k1a k1aVar, i1a i1aVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1302671740);
        int i3 = i2 | (p65Var.f(k1aVar) ? 4 : 2) | (p65Var.f(i1aVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "content_state"), 3, 1.0f);
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
            r28 r28VarR3 = wgf.R(o28Var, wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarR3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            n92 n92Var = null;
            a(k1aVar, i1aVar, null, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            hp7.t(p65Var, jfc.l(o28Var, 10.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 22.0f));
            w(k1aVar.d, i1aVar, null, p65Var, i7);
            hp7.t(p65Var, jfc.l(o28Var, 22.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            b(k1aVar.e, i1aVar, null, p65Var, i7);
            b09.H(p65Var, true, true, true);
            boolean z2 = i7 == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new lo5(i1aVar, n92Var, 18);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 7, k1aVar, i1aVar, r28Var);
        }
    }

    public static final void r(l1a l1aVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1260329290);
        int i3 = (p65Var.f(l1aVar) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
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
            iq7.a(l1aVar.a, iy0.a.a(o28Var, ar0Var), null, null, null, null, null, null, p65Var, 0, 252);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(l1aVar, r28Var, i2, 20);
        }
    }

    public static final void s(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1766808090);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var, "loading_state"), 3, 1.0f);
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
            xz5.o(w2g.G(iy0.a.a(o28Var, ar0Var), 0.0f, 48.0f, 0.0f, 0.0f, 13), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 2);
        }
    }

    public static final void t(n1a n1aVar, nhc nhcVar, i1a i1aVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        n1aVar.getClass();
        nhcVar.getClass();
        i1aVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(479453226);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(n1aVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = 16;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(i1aVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            int i5 = 3;
            if (objM == w12.a) {
                objM = new mr9(i5);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "privacy_screen"), pxf.E(-42582226, new v08(i4, i1aVar), p65Var2), null, pxf.E(606010544, new w87(nhcVar, 7), p65Var2), null, 0, 0L, 0L, null, pxf.E(-917510599, new qg9(n1aVar, i5, i1aVar), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i2, 7, n1aVar, nhcVar, i1aVar, r28Var);
        }
    }

    public static final void u(String str, my6 my6Var, r28 r28Var, q1a q1aVar, x12 x12Var, int i2) {
        q1a q1aVar2;
        int i3;
        q1a q1aVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(702644094);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(my6Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z2 = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    objM = new ov5(str, 19);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    q1aVar3 = (q1a) to7.z(n1b.a.b(q1a.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                q1aVar3 = q1aVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(q1aVar3.i, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            boolean zF = p65Var.f(q1aVar3) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new i1a(my6Var, q1aVar3);
                p65Var.j0(objM2);
            }
            t((n1a) l78VarZ.getValue(), nhcVarF, (i1a) objM2, r28Var, p65Var, (i3 << 3) & 7168);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(q1aVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                zo5 zo5Var = new zo5(q1aVar3, nhcVarF, sb2Var, resources, null, 17);
                p65Var.j0(zo5Var);
                objM4 = zo5Var;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            q1aVar2 = q1aVar3;
        } else {
            p65Var.S();
            q1aVar2 = q1aVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 18, str, my6Var, r28Var, q1aVar2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x01d2  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0203  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0311  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x031c  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0338  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x034b  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x034d  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0352  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0354  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0362  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x03a0  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x03a9  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x03d6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void v(defpackage.eu3 r36, defpackage.nt3 r37, defpackage.r28 r38, defpackage.x12 r39, int r40) {
        /*
            Method dump skipped, instruction units count: 1296
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.v(eu3, nt3, r28, x12, int):void");
    }

    public static final void w(boolean z2, i1a i1aVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(383491432);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.g(z2) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(i1aVar) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            String strR = vo7.R(p65Var, R.string.privacy_reposting_title);
            String strR2 = vo7.R(p65Var, R.string.privacy_reposting_description);
            boolean z3 = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                g98 g98Var = new g98(1, i1aVar, i1a.class, "onAllowRepostsChanged", "onAllowRepostsChanged(Z)V", 0, 17);
                p65Var.j0(g98Var);
                objM = g98Var;
            }
            int i5 = ((i4 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3072 | ((i4 << 6) & 57344);
            o28 o28Var = o28.b;
            y(strR, z2, (x45) ((qh6) objM), "privacy_reposting", o28Var, strR2, p65Var, i5, 0);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g1a(z2, i1aVar, r28Var2, i2, 0);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:41:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void x(int r30, int r31, defpackage.x12 r32, defpackage.r28 r33, java.lang.String r34, java.lang.String r35) {
        /*
            Method dump skipped, instruction units count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.x(int, int, x12, r28, java.lang.String, java.lang.String):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0240  */
    /* JADX WARN: Removed duplicated region for block: B:86:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void y(java.lang.String r52, boolean r53, defpackage.x45 r54, java.lang.String r55, defpackage.r28 r56, java.lang.String r57, defpackage.x12 r58, int r59, int r60) {
        /*
            Method dump skipped, instruction units count: 592
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vx0.y(java.lang.String, boolean, x45, java.lang.String, r28, java.lang.String, x12, int, int):void");
    }

    public static final void z(hae haeVar, r28 r28Var, x12 x12Var, int i2) {
        az5 az5Var = haeVar.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1009411512);
        int i3 = (p65Var.f(haeVar) ? 4 : 2) | i2 | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28Var = o28.b;
            r28 r28VarN = bgf.N(aoc.e(p65Var, r28Var), "user_card_" + haeVar.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
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
            A(haeVar, null, p65Var, i3 & 14);
            if (az5Var.isEmpty()) {
                p65Var.Y(328692592);
            } else {
                p65Var.Y(330793865);
                tp7.c(0.0f, 0, 5, ((zo7) p65Var.j(kt7.b)).z, p65Var, null);
                aoc.b(az5Var, km4.u(1.0f, jfc.d(r28Var, 1.0f), false), p65Var, 0);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(haeVar, r28Var, i2, 23);
        }
    }

    public static final void a(k1a k1aVar, i1a i1aVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        Object obj;
        boolean z2;
        boolean z3;
        o28 o28Var;
        uob uobVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1554341746);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(k1aVar) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(i1aVar) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            x(384, 0, p65Var, bgf.N(o28Var2, AEVqIoD.tqrBoAxVxk), vo7.R(p65Var, R.string.privacy_activity_tab_title), vo7.R(p65Var, R.string.privacy_activity_tab_description));
            String strN = y30.n(10.0f, R.string.privacy_activity_tab_claps, p65Var, p65Var, o28Var2);
            boolean z4 = k1aVar.a;
            int i6 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z5 = i6 == 32;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z5 || objM == uobVar2) {
                z2 = true;
                z3 = false;
                o28Var = o28Var2;
                g98 g98Var = new g98(1, i1aVar, i1a.class, "onShowClapsChanged", "onShowClapsChanged(Z)V", 0, 14);
                p65Var.j0(g98Var);
                objM = g98Var;
            } else {
                z2 = true;
                z3 = false;
                o28Var = o28Var2;
            }
            y(strN, z4, (x45) ((qh6) objM), "privacy_activity_tab_claps", null, null, p65Var, 3072, 48);
            String strR = vo7.R(p65Var, R.string.privacy_activity_tab_responses);
            boolean z6 = k1aVar.b;
            boolean z7 = i6 == 32 ? z2 : z3;
            Object objM2 = p65Var.M();
            if (z7 || objM2 == uobVar2) {
                uobVar = uobVar2;
                g98 g98Var2 = new g98(1, i1aVar, i1a.class, "onShowResponsesChanged", "onShowResponsesChanged(Z)V", 0, 15);
                p65Var.j0(g98Var2);
                objM2 = g98Var2;
            } else {
                uobVar = uobVar2;
            }
            uob uobVar3 = uobVar;
            y(strR, z6, (x45) ((qh6) objM2), "privacy_activity_tab_responses", null, null, p65Var, 3072, 48);
            String strR2 = vo7.R(p65Var, R.string.privacy_activity_tab_highlights);
            boolean z8 = k1aVar.c;
            boolean z9 = i6 == 32 ? z2 : z3;
            Object objM3 = p65Var.M();
            if (z9 || objM3 == uobVar3) {
                g98 g98Var3 = new g98(1, i1aVar, i1a.class, "onShowHighlightsChanged", "onShowHighlightsChanged(Z)V", 0, 16);
                p65Var.j0(g98Var3);
                objM3 = g98Var3;
            }
            y(strR2, z8, (x45) ((qh6) objM3), "privacy_activity_tab_highlights", null, null, p65Var, 3072, 48);
            p65Var.p(z2);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i2, 14, k1aVar, i1aVar, obj);
        }
    }
}
