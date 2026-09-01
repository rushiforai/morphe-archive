package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusRawInfoMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.medium.android.data.post.model.ReportPostReason;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class mq7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;

    public static final vs6 A(y28 y28Var) {
        y28 y28Var2;
        co1 co1VarA;
        y28Var.getClass();
        int i = f93.a;
        Iterator it2 = y28Var.T().j0().b().iterator();
        while (true) {
            if (!it2.hasNext()) {
                y28Var2 = null;
                break;
            }
            mn6 mn6Var = (mn6) it2.next();
            if (!vm6.x(mn6Var)) {
                co1VarA = mn6Var.j0().a();
                if (d93.m(co1VarA, qn1.CLASS) || d93.m(co1VarA, qn1.ENUM_CLASS)) {
                    break;
                }
            }
        }
        co1VarA.getClass();
        y28Var2 = (y28) co1VarA;
        if (y28Var2 == null) {
            return null;
        }
        ev7 ev7VarJ0 = y28Var2.j0();
        vs6 vs6Var = ev7VarJ0 instanceof vs6 ? (vs6) ev7VarJ0 : null;
        return vs6Var == null ? A(y28Var2) : vs6Var;
    }

    public static final boolean C(rb9 rb9Var, long j, long j2) {
        int i = rb9Var.i == 1 ? 1 : 0;
        long j3 = rb9Var.c;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j3 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j3 & 4294967295L));
        float f = i;
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j2 >> 32)) * f;
        float f2 = ((int) (j >> 32)) + fIntBitsToFloat3;
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (j2 & 4294967295L)) * f;
        return (fIntBitsToFloat > f2) | (fIntBitsToFloat < (-fIntBitsToFloat3)) | (fIntBitsToFloat2 < (-fIntBitsToFloat4)) | (fIntBitsToFloat2 > ((int) (j & 4294967295L)) + fIntBitsToFloat4);
    }

    public static final long D(float f, long j) {
        return (Float.isNaN(f) || f >= 1.0f) ? j : uu1.b(uu1.c(j) * f, j);
    }

    /* JADX WARN: Code restructure failed: missing block: B:43:0x00bb, code lost:
    
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.dw8 E(defpackage.h21... r11) {
        /*
            Method dump skipped, instruction units count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mq7.E(h21[]):dw8");
    }

    public static final long F(rb9 rb9Var, boolean z) {
        long jD = ip8.d(rb9Var.c, rb9Var.g);
        if (z || !rb9Var.b()) {
            return jD;
        }
        return 0L;
    }

    public static final String G(char c2) {
        String strValueOf = String.valueOf(c2);
        strValueOf.getClass();
        Locale locale = Locale.ROOT;
        String upperCase = strValueOf.toUpperCase(locale);
        upperCase.getClass();
        if (upperCase.length() <= 1) {
            return String.valueOf(Character.toTitleCase(c2));
        }
        if (c2 == 329) {
            return upperCase;
        }
        char cCharAt = upperCase.charAt(0);
        String lowerCase = upperCase.substring(1).toLowerCase(locale);
        lowerCase.getClass();
        return cCharAt + lowerCase;
    }

    public static String H(String str, Object... objArr) {
        int length;
        int iIndexOf;
        StringBuilder sb = new StringBuilder(str.length() + (objArr.length * 16));
        int i = 0;
        int i2 = 0;
        while (true) {
            length = objArr.length;
            if (i >= length || (iIndexOf = str.indexOf("%s", i2)) == -1) {
                break;
            }
            sb.append((CharSequence) str, i2, iIndexOf);
            sb.append(I(objArr[i]));
            i2 = iIndexOf + 2;
            i++;
        }
        sb.append((CharSequence) str, i2, str.length());
        if (i < length) {
            String str2 = " [";
            while (i < objArr.length) {
                sb.append(str2);
                sb.append(I(objArr[i]));
                i++;
                str2 = ", ";
            }
            sb.append(']');
        }
        return sb.toString();
    }

    public static String I(Object obj) {
        if (obj == null) {
            return "null";
        }
        try {
            return obj.toString();
        } catch (Exception e2) {
            String name = obj.getClass().getName();
            String hexString = Integer.toHexString(System.identityHashCode(obj));
            String strS = y30.s(new StringBuilder(name.length() + 1 + String.valueOf(hexString).length()), name, "@", hexString);
            Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strS), (Throwable) e2);
            String name2 = e2.getClass().getName();
            StringBuilder sb = new StringBuilder(strS.length() + 8 + name2.length() + 1);
            ka1.C(sb, "<", strS, " threw ", name2);
            sb.append(">");
            return sb.toString();
        }
    }

    public static String J(String str, Object... objArr) {
        int length;
        int iIndexOf;
        StringBuilder sb = new StringBuilder(str.length() + (objArr.length * 16));
        int i = 0;
        int i2 = 0;
        while (true) {
            length = objArr.length;
            if (i >= length || (iIndexOf = str.indexOf("%s", i2)) == -1) {
                break;
            }
            sb.append((CharSequence) str, i2, iIndexOf);
            sb.append(K(objArr[i]));
            i2 = iIndexOf + 2;
            i++;
        }
        sb.append((CharSequence) str, i2, str.length());
        if (i < length) {
            String str2 = " [";
            while (i < objArr.length) {
                sb.append(str2);
                sb.append(K(objArr[i]));
                i++;
                str2 = ", ";
            }
            sb.append(']');
        }
        return sb.toString();
    }

    public static final void a(int i, x12 x12Var, r28 r28Var, String str, String str2) {
        r28 r28Var2;
        String strW;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1530542963);
        int i2 = i | (p65Var.f(str != null ? new ax5(str) : null) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | 384;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            f76.c(str, hl0.XXXS, null, null, null, null, 0.0f, 0, null, p65Var, (i2 & 14) | 48, 4092);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            if (str2 == null) {
                strW = km4.w(p65Var, 1816956163, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(1816955729);
                p65Var.p(false);
                strW = str2;
            }
            kjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, dl7.m(((eu7) p65Var.j(kt7.c)).n), p65Var, 0, 3120, 55294);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new im4(str, str2, r28Var2, i, 1);
        }
    }

    public static final void b(String str, String str2, String str3, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(468347977);
        int i2 = (p65Var.f(str != null ? new ax5(str) : null) ? 4 : 2) | i | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        byte b2 = 0;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            aq7.f(pxf.E(-1809195965, new q60(str, str2, 3), p65Var), pxf.E(2092772386, new pb(str3, 5, b2), p65Var), r28Var, p65Var, ((i2 >> 3) & 896) | 54);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i, 26, r28Var, (Object) str, (Object) str2, (Object) str3);
        }
    }

    public static final void c(final m45 m45Var, final r28 r28Var, final m3c m3cVar, final long j, final long j2, final rn4 rn4Var, x12 x12Var, final int i) {
        int i2;
        p65 p65Var;
        mz1 mz1Var = yi2.l;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-434103979);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(m3cVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.e(j) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.e(j2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.f(rn4Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var2.f(null) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var2.h(mz1Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i2 & 1, (4793491 & i2) != 4793490)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            p65Var = p65Var2;
            flb.G(m45Var, r28Var, m3cVar, j, j2, rn4Var, mz1Var, p65Var, i2 & 33554430);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: lq7
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    mq7.c(m45Var, r28Var, m3cVar, j, j2, rn4Var, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void d(final m45 m45Var, final long j, final u18 u18Var, ou ouVar, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        long j2;
        u18 u18Var2;
        int i3;
        ip6 ip6Var;
        int i4;
        boolean z;
        boolean z2;
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(766784632);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            j2 = j;
            i2 |= p65Var.e(j2) ? 32 : 16;
        } else {
            j2 = j;
        }
        if ((i & 384) == 0) {
            u18Var2 = u18Var;
            i2 |= p65Var.f(u18Var2) ? 256 : 128;
        } else {
            u18Var2 = u18Var;
        }
        if ((i & 3072) == 0) {
            i2 |= (i & 4096) == 0 ? p65Var.f(ouVar) : p65Var.h(ouVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.h(mz1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            View view = (View) p65Var.j(eo.f);
            m73 m73Var = (m73) p65Var.j(z22.h);
            ip6 ip6Var2 = (ip6) p65Var.j(z22.n);
            n65 n65VarH = w2g.H(p65Var);
            l78 l78VarY = qo7.y(mz1Var, p65Var);
            Object[] objArr = new Object[0];
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                i3 = i2;
                objM = new oo7(15);
                p65Var.j0(objM);
            } else {
                i3 = i2;
            }
            UUID uuid = (UUID) hp7.E(objArr, (m45) objM, p65Var, 48);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zF = p65Var.f(view) | p65Var.f(m73Var);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                ip6Var = ip6Var2;
                i4 = i3;
                z = true;
                z2 = false;
                j18 j18Var = new j18(m45Var, u18Var2, j2, view, ip6Var, m73Var, uuid, ouVar, sb2Var);
                mz1 mz1Var2 = new mz1(new fx2(4, l78VarY), true, -1051373467);
                f18 f18Var = j18Var.i;
                f18Var.setParentCompositionContext(n65VarH);
                f18Var.j.setValue(mz1Var2);
                f18Var.k = true;
                f18Var.d();
                p65Var.j0(j18Var);
                obj = j18Var;
            } else {
                ip6Var = ip6Var2;
                i4 = i3;
                z = true;
                z2 = false;
                obj = objM3;
            }
            final j18 j18Var2 = (j18) obj;
            boolean zH = p65Var.h(j18Var2);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new ff4(28, j18Var2);
                p65Var.j0(objM4);
            }
            kyd.h(j18Var2, (x45) objM4, p65Var);
            int i5 = i4;
            boolean zH2 = p65Var.h(j18Var2) | ((i5 & 14) == 4 ? z : z2) | ((i5 & 896) == 256 ? z : z2) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? z : z2) | p65Var.d(ip6Var.ordinal());
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                final ip6 ip6Var3 = ip6Var;
                objM5 = new m45() { // from class: v18
                    @Override // defpackage.m45
                    public final Object invoke() {
                        j18Var2.d(m45Var, u18Var, j, ip6Var3);
                        return c1e.a;
                    }
                };
                p65Var.j0(objM5);
            }
            kyd.v((m45) objM5, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vy6(m45Var, j, u18Var, ouVar, mz1Var, i);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v39 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v23 */
    /* JADX WARN: Type inference failed for: r2v27 */
    /* JADX WARN: Type inference failed for: r2v3, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v8 */
    /* JADX WARN: Type inference failed for: r2v9, types: [boolean] */
    public static final void e(final if8 if8Var, final my6 my6Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        o28 o28Var;
        int i3;
        ?? r2;
        int i4;
        p65 p65Var2;
        o28 o28Var2;
        p65 p65Var3;
        o28 o28Var3;
        float f;
        int i5;
        ?? r22;
        final int i6;
        Object obj;
        p65 p65Var4;
        o28 o28Var4;
        p65 p65Var5;
        boolean z;
        Object obj2;
        p65 p65Var6 = (p65) x12Var;
        p65Var6.a0(1169199857);
        if ((i & 6) == 0) {
            i2 = (p65Var6.f(if8Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= (i & 64) == 0 ? p65Var6.f(my6Var) : p65Var6.h(my6Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var6.f(r28Var) ? 256 : 128;
        }
        if (p65Var6.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarN = bgf.N(jfc.d(r28Var, 1.0f), "newsletter_item");
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var6, 48);
            long j = p65Var6.T;
            int i7 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var6.l();
            r28 r28VarR = gx1.R(p65Var6, r28VarN);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var6.c0();
            if (p65Var6.S) {
                p65Var6.k(m45Var);
            } else {
                p65Var6.m0();
            }
            tp7.B(p65Var6, q12.f, wv1VarA);
            tp7.B(p65Var6, q12.e, i89VarL);
            tp7.B(p65Var6, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var6, q12.h);
            tp7.B(p65Var6, q12.d, r28VarR);
            o28 o28Var5 = o28.b;
            hp7.t(p65Var6, jfc.l(o28Var5, 32.0f));
            String str = if8Var.d;
            if (str == null) {
                p65Var6.Y(1842589582);
                p65Var6.p(false);
                i3 = i2;
                o28Var = o28Var5;
                r2 = 0;
                i4 = 3;
                p65Var2 = p65Var6;
            } else {
                p65Var6.Y(1842589583);
                o28Var = o28Var5;
                i3 = i2;
                r2 = 0;
                i4 = 3;
                jjd.b(str, bgf.N(w2g.E(o28Var5, 24.0f, 0.0f, 2), "title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var6.j(jt7.c)).h, p65Var6, 48, 0, 130044);
                p65 p65Var7 = p65Var6;
                p65Var7.p(false);
                p65Var2 = p65Var7;
            }
            String str2 = if8Var.e;
            if (str2 == null) {
                p65Var2.Y(1842960838);
                p65Var2.p(r2);
                o28Var2 = o28Var;
                p65Var3 = p65Var2;
            } else {
                p65Var2.Y(1842960839);
                r28 r28VarN2 = bgf.N(w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8), "description");
                mkd mkdVar = ((bu7) p65Var2.j(jt7.c)).m;
                jgd jgdVar = new jgd(i4);
                p65 p65Var8 = p65Var2;
                o28Var2 = o28Var;
                jjd.b(str2, r28VarN2, 0L, 0L, 0L, null, jgdVar, 0L, 0, false, 0, 0, null, mkdVar, p65Var8, 48, 0, 130044);
                p65 p65Var9 = p65Var8;
                p65Var9.p(r2);
                p65Var3 = p65Var9;
            }
            hp7.t(p65Var3, jfc.l(o28Var2, 32.0f));
            l78 l78VarX = guc.x(if8Var.f, new ag8(if8Var.c), p65Var3, r2);
            final xn7 xn7Var = xn7.M;
            r28 r28VarT = jfc.t(jfc.a(w2g.E(o28Var2, 24.0f, 0.0f, 2), 186.0f, 24.0f), null, 3);
            cg8 cg8Var = (cg8) l78VarX.getValue();
            boolean z2 = cg8Var instanceof bg8;
            Object obj3 = w12.a;
            if (z2) {
                p65Var3.Y(1843989605);
                r28 r28VarN3 = bgf.N(r28VarT, "button_unsubscribe_from_newsletter");
                amb ambVarA = bmb.a(xn7Var.m180getCornerSizeD9Ej5fM());
                d8a d8aVar = kt7.b;
                cu0 cu0VarB = k40.b(1.0f, ((zo7) p65Var3.j(d8aVar)).y);
                jy8 jy8Var = h11.a;
                long j2 = uu1.g;
                o28Var3 = o28Var2;
                f = 24.0f;
                g11 g11VarA = h11.a(j2, ((zo7) p65Var3.j(d8aVar)).n, j2, ((zo7) p65Var3.j(d8aVar)).n, p65Var3, 0);
                hy8 contentPadding = xn7Var.getContentPadding();
                boolean z3 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var3.h(my6Var))) | ((i3 & 14) == 4);
                Object objM = p65Var3.M();
                if (z3 || objM == obj3) {
                    z = false;
                    final boolean z4 = false ? 1 : 0;
                    Object obj4 = new m45() { // from class: gf8
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = z4;
                            c1e c1eVar = c1e.a;
                            if8 if8Var2 = if8Var;
                            my6 my6Var2 = my6Var;
                            switch (i8) {
                                case 0:
                                    String str3 = if8Var2.c;
                                    String str4 = if8Var2.b;
                                    SourceParameter sourceParameter = if8Var2.h;
                                    ho2.O(sourceParameter, str3, str4);
                                    pka pkaVar = (pka) my6Var2.a;
                                    vx0.c0(f76.F(pkaVar), null, null, new uk8(pkaVar, str3, str4, sourceParameter, (n92) null, 15), 3);
                                    break;
                                default:
                                    String str5 = if8Var2.c;
                                    String str6 = if8Var2.b;
                                    SourceParameter sourceParameter2 = if8Var2.h;
                                    ho2.O(sourceParameter2, str5, str6);
                                    pka pkaVar2 = (pka) my6Var2.a;
                                    vx0.c0(f76.F(pkaVar2), null, null, new lka(pkaVar2, str5, str6, sourceParameter2, null, 0), 3);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var3.j0(obj4);
                    obj2 = obj4;
                } else {
                    z = false;
                    obj2 = objM;
                }
                final int i8 = z ? 1 : 0;
                f76.s((m45) obj2, r28VarN3, false, ambVarA, g11VarA, cu0VarB, contentPadding, pxf.E(-471410615, new c55() { // from class: hf8
                    @Override // defpackage.c55
                    public final Object f(Object obj5, Object obj6, Object obj7) {
                        int i9 = i8;
                        c1e c1eVar = c1e.a;
                        o28 o28Var6 = o28.b;
                        xn7 xn7Var2 = xn7Var;
                        switch (i9) {
                            case 0:
                                x12 x12Var2 = (x12) obj6;
                                int iIntValue = ((Integer) obj7).intValue();
                                ((pmb) obj5).getClass();
                                p65 p65Var10 = (p65) x12Var2;
                                if (!p65Var10.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var10.S();
                                } else {
                                    omb ombVarA = nmb.a(qb8.a, z46.n, p65Var10, 48);
                                    long j3 = p65Var10.T;
                                    int i10 = (int) ((j3 >>> 32) ^ j3);
                                    i89 i89VarL2 = p65Var10.l();
                                    r28 r28VarR2 = gx1.R(p65Var10, o28Var6);
                                    r12.W.getClass();
                                    ot2 ot2Var = q12.b;
                                    p65Var10.c0();
                                    if (p65Var10.S) {
                                        p65Var10.k(ot2Var);
                                    } else {
                                        p65Var10.m0();
                                    }
                                    tp7.B(p65Var10, q12.f, ombVarA);
                                    tp7.B(p65Var10, q12.e, i89VarL2);
                                    tp7.B(p65Var10, q12.g, Integer.valueOf(i10));
                                    tp7.y(p65Var10, q12.h);
                                    tp7.B(p65Var10, q12.d, r28VarR2);
                                    qv5.b(vn7.J(R.drawable.ic_subscribed, 0, p65Var10), null, null, 0L, p65Var10, 56, 12);
                                    jjd.b(y30.n(8.0f, R.string.common_unsubscribe, p65Var10, p65Var10, o28Var6), bgf.N(o28Var6, "button_unsubscribe_from_newsletter_text"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, (mkd) xn7Var2.getTextStyle().invoke(p65Var10, 0), p65Var10, 48, 24960, 110588);
                                    p65Var10.p(true);
                                }
                                break;
                            default:
                                x12 x12Var3 = (x12) obj6;
                                int iIntValue2 = ((Integer) obj7).intValue();
                                ((pmb) obj5).getClass();
                                p65 p65Var11 = (p65) x12Var3;
                                if (!p65Var11.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                    p65Var11.S();
                                } else {
                                    omb ombVarA2 = nmb.a(qb8.a, z46.n, p65Var11, 48);
                                    long j4 = p65Var11.T;
                                    int i11 = (int) ((j4 >>> 32) ^ j4);
                                    i89 i89VarL3 = p65Var11.l();
                                    r28 r28VarR3 = gx1.R(p65Var11, o28Var6);
                                    r12.W.getClass();
                                    ot2 ot2Var2 = q12.b;
                                    p65Var11.c0();
                                    if (p65Var11.S) {
                                        p65Var11.k(ot2Var2);
                                    } else {
                                        p65Var11.m0();
                                    }
                                    tp7.B(p65Var11, q12.f, ombVarA2);
                                    tp7.B(p65Var11, q12.e, i89VarL3);
                                    tp7.B(p65Var11, q12.g, Integer.valueOf(i11));
                                    tp7.y(p65Var11, q12.h);
                                    tp7.B(p65Var11, q12.d, r28VarR3);
                                    qv5.b(vn7.J(R.drawable.ic_subscribe, 0, p65Var11), null, null, 0L, p65Var11, 56, 12);
                                    jjd.b(y30.n(8.0f, R.string.newsletter_item_get_the_newsletter, p65Var11, p65Var11, o28Var6), bgf.N(o28Var6, "button_text"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a((mkd) xn7Var2.getTextStyle().invoke(p65Var11, 0), ((zo7) p65Var11.j(kt7.b)).p, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var11, 48, 0, 131068);
                                    p65Var11.p(true);
                                }
                                break;
                        }
                        return c1eVar;
                    }
                }, p65Var3), p65Var3, 805306368, OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight);
                p65Var3.p(z);
                i5 = 1;
                r22 = z;
                p65Var4 = p65Var3;
            } else {
                o28Var3 = o28Var2;
                f = 24.0f;
                if (cg8Var instanceof ag8) {
                    p65Var3.Y(1846127644);
                    r28 r28VarN4 = bgf.N(r28VarT, "button");
                    amb ambVarA2 = bmb.a(xn7Var.m180getCornerSizeD9Ej5fM());
                    jy8 jy8Var2 = h11.a;
                    d8a d8aVar2 = kt7.b;
                    g11 g11VarA2 = h11.a(((zo7) p65Var3.j(d8aVar2)).d, ((zo7) p65Var3.j(d8aVar2)).p, 0L, ((zo7) p65Var3.j(d8aVar2)).p, p65Var3, 4);
                    hy8 contentPadding2 = xn7Var.getContentPadding();
                    boolean z5 = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 || ((i3 & 64) != 0 && p65Var3.h(my6Var))) | ((i3 & 14) == 4);
                    Object objM2 = p65Var3.M();
                    if (z5 || objM2 == obj3) {
                        i6 = 1;
                        final boolean z6 = true ? 1 : 0;
                        Object obj5 = new m45() { // from class: gf8
                            @Override // defpackage.m45
                            public final Object invoke() {
                                int i82 = z6;
                                c1e c1eVar = c1e.a;
                                if8 if8Var2 = if8Var;
                                my6 my6Var2 = my6Var;
                                switch (i82) {
                                    case 0:
                                        String str3 = if8Var2.c;
                                        String str4 = if8Var2.b;
                                        SourceParameter sourceParameter = if8Var2.h;
                                        ho2.O(sourceParameter, str3, str4);
                                        pka pkaVar = (pka) my6Var2.a;
                                        vx0.c0(f76.F(pkaVar), null, null, new uk8(pkaVar, str3, str4, sourceParameter, (n92) null, 15), 3);
                                        break;
                                    default:
                                        String str5 = if8Var2.c;
                                        String str6 = if8Var2.b;
                                        SourceParameter sourceParameter2 = if8Var2.h;
                                        ho2.O(sourceParameter2, str5, str6);
                                        pka pkaVar2 = (pka) my6Var2.a;
                                        vx0.c0(f76.F(pkaVar2), null, null, new lka(pkaVar2, str5, str6, sourceParameter2, null, 0), 3);
                                        break;
                                }
                                return c1eVar;
                            }
                        };
                        p65Var3.j0(obj5);
                        obj = obj5;
                    } else {
                        i6 = 1;
                        obj = objM2;
                    }
                    p65 p65Var10 = p65Var3;
                    f76.g((m45) obj, r28VarN4, false, ambVarA2, g11VarA2, null, null, contentPadding2, pxf.E(-1146226640, new c55() { // from class: hf8
                        @Override // defpackage.c55
                        public final Object f(Object obj52, Object obj6, Object obj7) {
                            int i9 = i6;
                            c1e c1eVar = c1e.a;
                            o28 o28Var6 = o28.b;
                            xn7 xn7Var2 = xn7Var;
                            switch (i9) {
                                case 0:
                                    x12 x12Var2 = (x12) obj6;
                                    int iIntValue = ((Integer) obj7).intValue();
                                    ((pmb) obj52).getClass();
                                    p65 p65Var102 = (p65) x12Var2;
                                    if (!p65Var102.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                        p65Var102.S();
                                    } else {
                                        omb ombVarA = nmb.a(qb8.a, z46.n, p65Var102, 48);
                                        long j3 = p65Var102.T;
                                        int i10 = (int) ((j3 >>> 32) ^ j3);
                                        i89 i89VarL2 = p65Var102.l();
                                        r28 r28VarR2 = gx1.R(p65Var102, o28Var6);
                                        r12.W.getClass();
                                        ot2 ot2Var = q12.b;
                                        p65Var102.c0();
                                        if (p65Var102.S) {
                                            p65Var102.k(ot2Var);
                                        } else {
                                            p65Var102.m0();
                                        }
                                        tp7.B(p65Var102, q12.f, ombVarA);
                                        tp7.B(p65Var102, q12.e, i89VarL2);
                                        tp7.B(p65Var102, q12.g, Integer.valueOf(i10));
                                        tp7.y(p65Var102, q12.h);
                                        tp7.B(p65Var102, q12.d, r28VarR2);
                                        qv5.b(vn7.J(R.drawable.ic_subscribed, 0, p65Var102), null, null, 0L, p65Var102, 56, 12);
                                        jjd.b(y30.n(8.0f, R.string.common_unsubscribe, p65Var102, p65Var102, o28Var6), bgf.N(o28Var6, "button_unsubscribe_from_newsletter_text"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, (mkd) xn7Var2.getTextStyle().invoke(p65Var102, 0), p65Var102, 48, 24960, 110588);
                                        p65Var102.p(true);
                                    }
                                    break;
                                default:
                                    x12 x12Var3 = (x12) obj6;
                                    int iIntValue2 = ((Integer) obj7).intValue();
                                    ((pmb) obj52).getClass();
                                    p65 p65Var11 = (p65) x12Var3;
                                    if (!p65Var11.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                        p65Var11.S();
                                    } else {
                                        omb ombVarA2 = nmb.a(qb8.a, z46.n, p65Var11, 48);
                                        long j4 = p65Var11.T;
                                        int i11 = (int) ((j4 >>> 32) ^ j4);
                                        i89 i89VarL3 = p65Var11.l();
                                        r28 r28VarR3 = gx1.R(p65Var11, o28Var6);
                                        r12.W.getClass();
                                        ot2 ot2Var2 = q12.b;
                                        p65Var11.c0();
                                        if (p65Var11.S) {
                                            p65Var11.k(ot2Var2);
                                        } else {
                                            p65Var11.m0();
                                        }
                                        tp7.B(p65Var11, q12.f, ombVarA2);
                                        tp7.B(p65Var11, q12.e, i89VarL3);
                                        tp7.B(p65Var11, q12.g, Integer.valueOf(i11));
                                        tp7.y(p65Var11, q12.h);
                                        tp7.B(p65Var11, q12.d, r28VarR3);
                                        qv5.b(vn7.J(R.drawable.ic_subscribe, 0, p65Var11), null, null, 0L, p65Var11, 56, 12);
                                        jjd.b(y30.n(8.0f, R.string.newsletter_item_get_the_newsletter, p65Var11, p65Var11, o28Var6), bgf.N(o28Var6, "button_text"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a((mkd) xn7Var2.getTextStyle().invoke(p65Var11, 0), ((zo7) p65Var11.j(kt7.b)).p, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var11, 48, 0, 131068);
                                        p65Var11.p(true);
                                    }
                                    break;
                            }
                            return c1eVar;
                        }
                    }, p65Var3), p65Var10, 805502976, ExifDirectoryBase.TAG_TILE_OFFSETS);
                    p65 p65Var11 = p65Var10;
                    r22 = 0;
                    p65Var11.p(false);
                    i5 = i6;
                    p65Var4 = p65Var11;
                } else {
                    i5 = 1;
                    r22 = 0;
                    if (!g76.L(cg8Var, yf8.a) && !g76.L(cg8Var, zf8.a)) {
                        throw ho2.L(p65Var3, 1583502753, false);
                    }
                    p65Var3.Y(1583633067);
                    p65Var3.p(false);
                    p65Var4 = p65Var3;
                }
            }
            String str3 = if8Var.g;
            if (str3 == null) {
                p65Var4.Y(1848050418);
                p65Var4.p(r22);
                o28Var4 = o28Var3;
                p65Var5 = p65Var4;
            } else {
                p65Var4.Y(1848050419);
                Object[] objArr = new Object[i5];
                objArr[r22] = str3;
                p65 p65Var12 = p65Var4;
                o28Var4 = o28Var3;
                jjd.b(vo7.Q(R.string.newsletter_item_emails_sent_to_email, objArr, p65Var4), bgf.N(w2g.G(o28Var3, f, f, f, 0.0f, 8), "email"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var4.j(jt7.c)).o, ((zo7) p65Var4.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var12, 48, 0, 130044);
                p65 p65Var13 = p65Var12;
                p65Var13.p(false);
                p65Var5 = p65Var13;
            }
            lv8.y(o28Var4, 32.0f, p65Var5, i5);
            p65Var = p65Var5;
        } else {
            p65Var6.S();
            p65Var = p65Var6;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 6, if8Var, my6Var, r28Var);
        }
    }

    public static final void f(r28 r28Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(633470259);
        int i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            long j = ((zo7) p65Var.j(kt7.b)).c;
            xn7 xn7Var = xn7.M;
            r28 r28VarV = m40.V(jfc.d(r28Var, 1.0f), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.e, z46.q, p65Var, 54);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            p65Var.Y(-103302994);
            sn3 sn3Var = z22.h;
            m73 m73Var = (m73) p65Var.j(sn3Var);
            sn3 sn3Var2 = jt7.c;
            float fZ = m73Var.z(((bu7) p65Var.j(sn3Var2)).h.b.c);
            p65Var.p(false);
            r28 r28VarD = jfc.d(jfc.e(w2g.E(o28Var, 24.0f, 0.0f, 2), fZ), 0.5f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarD, j, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(-103290547);
            float fZ2 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).m.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.E(o28Var, 24.0f, 0.0f, 2), fZ2), 0.9f), j, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            fo7.h(xn7Var, jfc.p(w2g.E(o28Var, 24.0f, 0.0f, 2), 186.0f), j, p65Var, 54, 0);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            p65Var.Y(-103269650);
            float fZ3 = ((m73) p65Var.j(sn3Var)).z(((bu7) p65Var.j(sn3Var2)).o.b.c);
            p65Var.p(false);
            dy0.a(flb.a0(jfc.d(jfc.e(w2g.E(o28Var, 24.0f, 0.0f, 2), fZ3), 1.0f), j, nr5Var), p65Var, 0);
            lv8.y(o28Var, 32.0f, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i, 23);
        }
    }

    public static final void g(boolean z, b55 b55Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-642000585);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(b55Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            Object objA = z57.a(p65Var);
            if (objA == null) {
                p65Var.Y(1512740606);
                objA = a67.a(p65Var);
            } else {
                p65Var.Y(1512737723);
            }
            p65Var.p(false);
            if (objA == null) {
                ygf.f("No NavigationEventDispatcherOwner was provided via LocalNavigationEventDispatcherOwner and no OnBackPressedDispatcherOwner was provided via LocalOnBackPressedDispatcherOwner. Please provide one of the two.");
                return;
            }
            boolean zF = p65Var.f(objA);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                kc8 kc8Var = objA instanceof kc8 ? (kc8) objA : null;
                jc8 navigationEventDispatcher = kc8Var != null ? kc8Var.getNavigationEventDispatcher() : null;
                jq8 jq8Var = objA instanceof jq8 ? (jq8) objA : null;
                objM = new vl0(navigationEventDispatcher, jq8Var != null ? jq8Var.getOnBackPressedDispatcher() : null);
                p65Var.j0(objM);
            }
            vl0 vl0Var = (vl0) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            long j = p65Var.T;
            boolean zF2 = p65Var.f(vl0Var) | p65Var.e(j);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new j12(sb2Var, new iy9(j, objA));
                p65Var.j0(objM3);
            }
            j12 j12Var = (j12) objM3;
            p65Var.Y(-348514256);
            boolean zH = p65Var.h(j12Var) | p65Var.h(b55Var);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new ui9(j12Var, 5, b55Var);
                p65Var.j0(objM4);
            }
            kyd.v((m45) objM4, p65Var);
            Boolean boolValueOf = Boolean.valueOf(z);
            int i3 = i2 & 14;
            boolean zH2 = p65Var.h(j12Var) | (i3 == 4);
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                objM5 = new xl0(j12Var, z, 3);
                p65Var.j0(objM5);
            }
            kyd.n(boolValueOf, j12Var, null, (x45) objM5, p65Var, i3);
            boolean zH3 = p65Var.h(vl0Var) | p65Var.h(j12Var);
            Object objM6 = p65Var.M();
            if (zH3 || objM6 == uobVar) {
                objM6 = new q58(vl0Var, 24, j12Var);
                p65Var.j0(objM6);
            }
            kyd.i(vl0Var, j12Var, (x45) objM6, p65Var);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jm1(z, b55Var, i);
        }
    }

    public static final void h(String str, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(874623704);
        int i2 = (p65Var.f(str) ? 4 : 2) | i | 48;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            hp7.t(p65Var, jfc.e(o28Var, 20.0f));
            p65Var.Y(-807150008);
            kx kxVar = new kx();
            p65Var.Y(-807148970);
            int iH = kxVar.h(new skc(((zo7) p65Var.j(kt7.b)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVar.d(vo7.R(p65Var, R.string.common_in_with_spaces));
                kxVar.f(iH);
                p65Var.p(false);
                kxVar.d(str);
                mx mxVarI = kxVar.i();
                p65Var.p(false);
                kjd.c(mxVarI, null, 0L, 0L, 0L, null, 0L, 2, false, 1, 0, null, null, dl7.m(((eu7) p65Var.j(kt7.c)).n), p65Var, 0, 3120, 120830);
                p65Var = p65Var;
                p65Var.p(true);
                r28Var2 = o28Var;
            } catch (Throwable th) {
                kxVar.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var2, i, 3);
        }
    }

    public static final void i(tj9 tj9Var, x45 x45Var, x45 x45Var2, m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        x45Var.getClass();
        x45Var2.getClass();
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-402796907);
        int i2 = i | (p65Var.f(tj9Var) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | (p65Var.h(x45Var2) ? 256 : 128) | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(m45Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 196608;
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            o28 o28Var = o28.b;
            qo7.b(jfc.d(o28Var, 1.0f), 0L, null, 8.0f, null, false, pxf.E(1310933213, new d98(tj9Var, x45Var, x45Var2, m45Var, m45Var2, 14), p65Var), p65Var, 1772544, 22);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i, 18, r28Var2, tj9Var, x45Var, x45Var2, m45Var, m45Var2);
        }
    }

    public static final void j(final List list, final x45 x45Var, final r28 r28Var, x12 x12Var, final int i) {
        int i2;
        final List list2;
        final x45 x45Var2;
        final r28 r28Var2;
        final int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(911117702);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(list) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(x45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i4 = 1;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            int size = list.size();
            if (size == 0) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    final int i5 = 0;
                    mwaVarS.d = new b55() { // from class: mta
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            int i6 = i5;
                            c1e c1eVar = c1e.a;
                            int i7 = i;
                            r28 r28Var3 = r28Var;
                            x45 x45Var3 = x45Var;
                            List list3 = list;
                            x12 x12Var2 = (x12) obj;
                            ((Integer) obj2).getClass();
                            switch (i6) {
                                case 0:
                                    mq7.j(list3, x45Var3, r28Var3, x12Var2, tr7.y(i7 | 1));
                                    break;
                                default:
                                    mq7.j(list3, x45Var3, r28Var3, x12Var2, tr7.y(i7 | 1));
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    return;
                }
                return;
            }
            list2 = list;
            i3 = i;
            x45Var2 = x45Var;
            r28Var2 = r28Var;
            mz1 mz1VarE = pxf.E(1444276491, new pk3(i4, x45Var2), p65Var);
            boolean zH = p65Var.h(list2) | p65Var.d(size);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new s(list2, size, mz1VarE, 29);
                p65Var.j0(objM);
            }
            f76.u(r28Var2, (b55) objM, p65Var, (i2 >> 6) & 14, 0);
        } else {
            list2 = list;
            x45Var2 = x45Var;
            r28Var2 = r28Var;
            i3 = i;
            p65Var.S();
        }
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            final int i6 = 1;
            mwaVarS2.d = new b55() { // from class: mta
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    int i62 = i6;
                    c1e c1eVar = c1e.a;
                    int i7 = i3;
                    r28 r28Var3 = r28Var2;
                    x45 x45Var3 = x45Var2;
                    List list3 = list2;
                    x12 x12Var2 = (x12) obj;
                    ((Integer) obj2).getClass();
                    switch (i62) {
                        case 0:
                            mq7.j(list3, x45Var3, r28Var3, x12Var2, tr7.y(i7 | 1));
                            break;
                        default:
                            mq7.j(list3, x45Var3, r28Var3, x12Var2, tr7.y(i7 | 1));
                            break;
                    }
                    return c1eVar;
                }
            };
        }
    }

    public static final void k(lta ltaVar, r28 r28Var, x45 x45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        boolean z;
        String strW;
        List list = ltaVar.b;
        Long l = ltaVar.a;
        x45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-24202022);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(ltaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = i2 | 48;
        if ((i & 384) == 0) {
            i3 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarE = w2g.E(o28Var, 24.0f, 0.0f, 2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j = p65Var2.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, wv1VarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String strR = vo7.R(p65Var2, R.string.post_stats_readers_interests_title);
            mkd mkdVarU = to7.u(p65Var2);
            int i5 = i3;
            r28Var2 = o28Var;
            jjd.b(strR, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarU, p65Var2, 0, 0, 131070);
            hp7.t(p65Var2, jfc.e(r28Var2, 4.0f));
            if (l != null) {
                p65Var2.Y(-1816643971);
                z = false;
                strW = vo7.Q(R.string.stats_from_to_utc_updated_daily, new Object[]{vo7.v(l.longValue(), p65Var2), vo7.R(p65Var2, R.string.common_today)}, p65Var2);
                p65Var2.p(false);
            } else {
                z = false;
                strW = km4.w(p65Var2, -1816400466, R.string.stats_updated_daily, p65Var2, false);
            }
            boolean z2 = z;
            jjd.b(strW, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.t(p65Var2), p65Var2, 0, 0, 131070);
            hp7.t(p65Var2, jfc.e(r28Var2, 4.0f));
            jjd.b(vo7.R(p65Var2, list.isEmpty() ? R.string.post_stats_readers_interests_empty : R.string.post_stats_readers_interests_description), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.s(p65Var2), p65Var2, 0, 0, 131070);
            p65Var = p65Var2;
            if (list.isEmpty()) {
                p65Var.Y(-1818015566);
            } else {
                p65Var.Y(-1815786511);
                hp7.t(p65Var, jfc.e(r28Var2, 32.0f));
            }
            p65Var.p(z2);
            j(list, x45Var, jfc.d(r28Var2, 1.0f), p65Var, ((i5 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 384);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 21, ltaVar, r28Var2, x45Var);
        }
    }

    public static final void l(t5b t5bVar, k5b k5bVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1933938405);
        int i2 = (p65Var.f(t5bVar) ? 4 : 2) | i | (p65Var.f(k5bVar) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            r28 r28VarJ = ka1.j((jp7) p65Var.j(kt7.a), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ui9(k5bVar, 23, t5bVar);
                p65Var.j0(objM);
            }
            fo7.l((m45) objM, vo7.R(p65Var, R.string.common_report), xn7.L, bgf.N(jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), "button_report"), t5bVar.c, p65Var, 3456, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(t5bVar, k5bVar, i, 8);
        }
    }

    public static final void m(t5b t5bVar, final k5b k5bVar, r28 r28Var, x12 x12Var, int i) {
        final int i2;
        Object utaVar;
        o28 o28Var;
        t5b t5bVar2 = t5bVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1296547013);
        int i3 = i | (p65Var.f(t5bVar2) ? 4 : 2) | (p65Var.f(k5bVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            r28 r28VarR3 = wgf.R(r28Var, wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            hp7.t(p65Var, jfc.l(o28Var2, 16.0f));
            t5bVar2 = t5bVar;
            ReportPostReason reportPostReason = t5bVar2.a;
            boolean z = reportPostReason == ReportPostReason.HARASSMENT;
            String strR = vo7.R(p65Var, R.string.report_post_reason_harassment);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i7 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                final int i8 = 1;
                objM = new m45() { // from class: m5b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i8;
                        c1e c1eVar = c1e.a;
                        k5b k5bVar2 = k5bVar;
                        switch (i9) {
                            case 0:
                                k5bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                            case 1:
                                k5bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 2:
                                k5bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            default:
                                k5bVar2.a(ReportPostReason.SPAM);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            final int i9 = 3;
            aq7.e(z, strR, (m45) objM, bgf.N(o28Var2, "radio_button_harassment"), p65Var, 3072);
            boolean z3 = reportPostReason == ReportPostReason.RULES_VIOLATION;
            String strR2 = vo7.R(p65Var, R.string.report_post_reason_rules_violation);
            boolean z4 = i7 == 32;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                final int i10 = 2;
                objM2 = new m45() { // from class: m5b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i10;
                        c1e c1eVar = c1e.a;
                        k5b k5bVar2 = k5bVar;
                        switch (i92) {
                            case 0:
                                k5bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                            case 1:
                                k5bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 2:
                                k5bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            default:
                                k5bVar2.a(ReportPostReason.SPAM);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            aq7.e(z3, strR2, (m45) objM2, bgf.N(o28Var2, "radio_button_rules_violation"), p65Var, 3072);
            boolean z5 = reportPostReason == ReportPostReason.SPAM;
            String strR3 = vo7.R(p65Var, R.string.report_post_reason_spam);
            boolean z6 = i7 == 32;
            Object objM3 = p65Var.M();
            if (z6 || objM3 == uobVar) {
                objM3 = new m45() { // from class: m5b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i9;
                        c1e c1eVar = c1e.a;
                        k5b k5bVar2 = k5bVar;
                        switch (i92) {
                            case 0:
                                k5bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                            case 1:
                                k5bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 2:
                                k5bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            default:
                                k5bVar2.a(ReportPostReason.SPAM);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM3);
            }
            aq7.e(z5, strR3, (m45) objM3, bgf.N(o28Var2, "radio_button_spam"), p65Var, 3072);
            boolean z7 = reportPostReason == ReportPostReason.AI_GENERATED_CONTENT;
            String strR4 = vo7.R(p65Var, R.string.report_post_reason_ai_generated_content);
            boolean z8 = i7 == 32;
            Object objM4 = p65Var.M();
            if (z8 || objM4 == uobVar) {
                i2 = 0;
                objM4 = new m45() { // from class: m5b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i2;
                        c1e c1eVar = c1e.a;
                        k5b k5bVar2 = k5bVar;
                        switch (i92) {
                            case 0:
                                k5bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                            case 1:
                                k5bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 2:
                                k5bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            default:
                                k5bVar2.a(ReportPostReason.SPAM);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM4);
            } else {
                i2 = 0;
            }
            aq7.e(z7, strR4, (m45) objM4, bgf.N(o28Var2, "radio_button_ai_generated_content"), p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var2, 16.0f));
            boolean z9 = t5bVar2.b;
            String strR5 = vo7.R(p65Var, R.string.report_post_block_author);
            int i11 = i7 == 32 ? 1 : i2;
            Object objM5 = p65Var.M();
            if (i11 != 0 || objM5 == uobVar) {
                objM5 = new eb8(18, k5bVar);
                p65Var.j0(objM5);
            }
            int i12 = i2;
            bgf.i(z9, strR5, (x45) objM5, bgf.N(o28Var2, "checkbox_block_author"), false, p65Var, 3072);
            hp7.t(p65Var, jfc.l(o28Var2, 25.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            String strN = y30.n(24.0f, R.string.report_post_report_violation, p65Var, p65Var, o28Var2);
            int i13 = i7 == 32 ? 1 : i12;
            Object objM6 = p65Var.M();
            if (i13 != 0 || objM6 == uobVar) {
                o28Var = o28Var2;
                utaVar = new uta(0, k5bVar, k5b.class, "goToReportViolationScreen", "goToReportViolationScreen()V", 0, 5);
                p65Var.j0(utaVar);
            } else {
                utaVar = objM6;
                o28Var = o28Var2;
            }
            q(3072, 2, p65Var, (m45) ((qh6) utaVar), bgf.N(o28Var, "row_report_violation"), strN, null);
            String strR6 = vo7.R(p65Var, R.string.report_post_read_our_rules_title);
            String strR7 = vo7.R(p65Var, R.string.report_post_read_our_rules_description);
            if (i7 == 32) {
                i12 = 1;
            }
            Object objM7 = p65Var.M();
            if (i12 != 0 || objM7 == uobVar) {
                uta utaVar2 = new uta(0, k5bVar, k5b.class, "goToMediumRulesScreen", "goToMediumRulesScreen()V", 0, 6);
                p65Var.j0(utaVar2);
                objM7 = utaVar2;
            }
            q(3072, 0, p65Var, (m45) ((qh6) objM7), bgf.N(o28Var, "row_rules"), strR6, strR7);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 26, t5bVar2, k5bVar, r28Var);
        }
    }

    public static final void n(vpc vpcVar, bo4 bo4Var, k5b k5bVar, x12 x12Var, int i) {
        p65 p65Var;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1010292080);
        int i2 = i | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(k5bVar) ? 256 : 128);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i2 & 14);
            nhc nhcVarF = mk7.F(p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new qna(10);
                p65Var2.j0(objM);
            }
            pr7.b(bgf.N(new l60((x45) objM, false), "report_post_screen"), pxf.E(-1722210068, new n5b(k5bVar), p65Var2), pxf.E(-1553066293, new pma(k5bVar, 9, l78VarZ), p65Var2), pxf.E(-1383922518, new w87(nhcVarF, 18), p65Var2), null, 0, 0L, 0L, null, pxf.E(635552961, new qg9(k5bVar, 13, l78VarZ), p65Var2), p65Var2, 805309872, 496);
            p65Var = p65Var2;
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                rna rnaVar = new rna(bo4Var, nhcVarF, resources, k5bVar, null, 6);
                p65Var.j0(rnaVar);
                objM2 = rnaVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 27, vpcVar, bo4Var, k5bVar);
        }
    }

    public static final void o(k5b k5bVar, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-263882465);
        int i2 = (p65Var2.f(k5bVar) ? 4 : 2) | i;
        if (p65Var2.P(i2 & 1, (i2 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.report_post_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new uta(0, k5bVar, k5b.class, "onClose", "onClose()V", 0, 7);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strR, (m45) ((qh6) objM), null, vn7.J(R.drawable.ic_close_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_close), 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n5b(k5bVar, i);
        }
    }

    public static final void p(String str, x45 x45Var, x45 x45Var2, x12 x12Var, int i) {
        String str2;
        x45 x45Var3;
        str.getClass();
        x45Var.getClass();
        x45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-366282603);
        int i2 = i | (p65Var.f(str) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | (p65Var.h(x45Var2) ? 256 : 128);
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(jfc.d(o28Var, 1.0f), 48.0f, 0.0f, 2);
            int i4 = i2 & 14;
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i4 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new g4b(i3, x45Var, str);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(hlg.r(r28VarF, false, null, null, (m45) objM, 15), "search_history");
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            qv5.b(vn7.J(R.drawable.ic_search_24, 0, p65Var), null, bgf.N(jfc.l(w2g.G(o28Var, 24.0f, 12.0f, 0.0f, 12.0f, 4), 24.0f), "icon"), ((zo7) p65Var.j(kt7.b)).o, p65Var, 440, 0);
            jjd.b(str, bgf.N(w2g.G(o28Var, 16.0f, 0.0f, 0.0f, 0.0f, 14).b(new sq6(1.0f, true)), "text"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, i4, 24960, 110588);
            str2 = str;
            p65Var = p65Var;
            boolean z2 = (i4 == 4) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                x45Var3 = x45Var2;
                objM2 = new g4b(2, x45Var3, str2);
                p65Var.j0(objM2);
            } else {
                x45Var3 = x45Var2;
            }
            f49.l((m45) objM2, bgf.N(w2g.G(o28Var, 12.0f, 0.0f, 4.0f, 0.0f, 10), "delete_search"), false, null, null, pxf.E(881177939, new pb(str2, 6, (byte) 0), p65Var), p65Var, 1572912, 60);
            p65Var.p(true);
        } else {
            str2 = str;
            x45Var3 = x45Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 13, str2, x45Var, x45Var3);
        }
    }

    public static final void q(int i, int i2, x12 x12Var, m45 m45Var, r28 r28Var, String str, String str2) {
        String str3;
        int i3;
        String str4;
        String str5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2130326747);
        int i4 = i | (p65Var.f(str) ? 4 : 2);
        int i5 = i2 & 2;
        if (i5 != 0) {
            i3 = i4 | 48;
            str3 = str2;
        } else {
            str3 = str2;
            i3 = i4 | (p65Var.f(str3) ? 32 : 16);
        }
        int i6 = i3 | (p65Var.h(m45Var) ? 256 : 128);
        if (p65Var.P(i6 & 1, (i6 & 1171) != 1170)) {
            String str6 = i5 != 0 ? null : str3;
            r28 r28VarR = hlg.r(jfc.d(r28Var, 1.0f), false, null, new vkb(0), m45Var, 11);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i7 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarR);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR2);
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(o28Var, 48.0f, 0.0f, 2);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarU = km4.u(1.0f, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), true);
            sn3 sn3Var = jt7.c;
            jjd.b(str, r28VarU, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, i6 & 14, 0, 131068);
            p65Var = p65Var;
            boolean z = false;
            c09 c09VarJ = vn7.J(R.drawable.ic_chevron_forward, 0, p65Var);
            r28 r28VarG = w2g.G(o28Var, 0.0f, 0.0f, 16.0f, 0.0f, 11);
            sn3 sn3Var2 = kt7.b;
            qv5.b(c09VarJ, null, r28VarG, ((zo7) p65Var.j(sn3Var2)).o, p65Var, 440, 0);
            p65Var.p(true);
            if (str6 != null) {
                p65Var.Y(-1797207324);
                str5 = str6;
                jjd.b(str5, w2g.G(o28Var, 24.0f, 0.0f, 64.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i6 >> 3) & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z = false;
            } else {
                str5 = str6;
                p65Var.Y(-1806299097);
            }
            p65Var.p(z);
            p65Var.p(true);
            str4 = str5;
        } else {
            p65Var.S();
            str4 = str3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rma(str, str4, m45Var, r28Var, i, i2, 1);
        }
    }

    public static final long r(float f, float f2) {
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(f2)) & 4294967295L) | (Float.floatToRawIntBits(f) << 32);
        int i = nrd.c;
        return jFloatToRawIntBits;
    }

    public static final void s(final m45 m45Var, r28 r28Var, m3c m3cVar, long j, long j2, rn4 rn4Var, x12 x12Var, final int i, final int i2) {
        int i3;
        r28 r28Var2;
        int i4;
        final m3c m3cVar2;
        final long j3;
        final long j4;
        final rn4 rn4Var2;
        final r28 r28Var3;
        m3c m3cVar3;
        int i5;
        long j5;
        long j6;
        rn4 rn4Var3;
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(229731635);
        if ((i & 6) == 0) {
            i3 = i | (p65Var.h(m45Var) ? 4 : 2);
        } else {
            i3 = i;
        }
        int i6 = i2 & 2;
        if (i6 != 0) {
            i4 = i3 | 48;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i4 = i3 | (p65Var.f(r28Var2) ? 32 : 16);
        }
        int i7 = i4 | 1664128;
        if (p65Var.P(i7 & 1, (599187 & i7) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                r28 r28Var4 = i6 != 0 ? o28.b : r28Var2;
                m3cVar3 = bmb.a;
                long j7 = ((zo7) p65Var.j(kt7.b)).e;
                i5 = i7 & (-466817);
                j5 = j7;
                j6 = uu1.d;
                rn4Var3 = new rn4(t84.a, t84.d, t84.b, t84.c);
                r28Var3 = r28Var4;
            } else {
                p65Var.S();
                i5 = i7 & (-466817);
                j5 = j;
                j6 = j2;
                rn4Var3 = rn4Var;
                r28Var3 = r28Var2;
                m3cVar3 = m3cVar;
            }
            p65Var.q();
            c(m45Var, bgf.N(r28Var3, "write_fab"), m3cVar3, j5, j6, rn4Var3, p65Var, 14180352 | (i5 & 14));
            m3cVar2 = m3cVar3;
            j3 = j5;
            j4 = j6;
            rn4Var2 = rn4Var3;
        } else {
            p65Var.S();
            m3cVar2 = m3cVar;
            j3 = j;
            j4 = j2;
            rn4Var2 = rn4Var;
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: kq7
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    mq7.s(m45Var, r28Var3, m3cVar2, j3, j4, rn4Var2, (x12) obj, tr7.y(i | 1), i2);
                    return c1e.a;
                }
            };
        }
    }

    public static void t(long j, kz0 kz0Var, int i, ArrayList arrayList, int i2, int i3, ArrayList arrayList2) {
        int i4;
        int i5;
        ArrayList arrayList3;
        long j2;
        int i6;
        int i7 = i;
        ArrayList arrayList4 = arrayList;
        ArrayList arrayList5 = arrayList2;
        if (i2 >= i3) {
            ay0.e("Failed requirement.");
            return;
        }
        for (int i8 = i2; i8 < i3; i8++) {
            if (((h21) arrayList4.get(i8)).e() < i7) {
                ay0.e("Failed requirement.");
                return;
            }
        }
        h21 h21Var = (h21) arrayList.get(i2);
        h21 h21Var2 = (h21) arrayList4.get(i3 - 1);
        if (i7 == h21Var.e()) {
            int iIntValue = ((Number) arrayList5.get(i2)).intValue();
            int i9 = i2 + 1;
            h21 h21Var3 = (h21) arrayList4.get(i9);
            i4 = i9;
            i5 = iIntValue;
            h21Var = h21Var3;
        } else {
            i4 = i2;
            i5 = -1;
        }
        if (h21Var.j(i7) == h21Var2.j(i7)) {
            int iMin = Math.min(h21Var.e(), h21Var2.e());
            int i10 = 0;
            for (int i11 = i7; i11 < iMin && h21Var.j(i11) == h21Var2.j(i11); i11++) {
                i10++;
            }
            long j3 = (kz0Var.b / 4) + j + 2 + ((long) i10) + 1;
            kz0Var.N0(-i10);
            kz0Var.N0(i5);
            int i12 = i7 + i10;
            while (i7 < i12) {
                kz0Var.N0(h21Var.j(i7) & 255);
                i7++;
            }
            if (i4 + 1 == i3) {
                if (i12 == ((h21) arrayList4.get(i4)).e()) {
                    kz0Var.N0(((Number) arrayList5.get(i4)).intValue());
                    return;
                } else {
                    ygf.f("Check failed.");
                    return;
                }
            }
            kz0 kz0Var2 = new kz0();
            kz0Var.N0(((int) ((kz0Var2.b / 4) + j3)) * (-1));
            t(j3, kz0Var2, i12, arrayList4, i4, i3, arrayList5);
            kz0Var.J(kz0Var2);
            return;
        }
        int i13 = 1;
        for (int i14 = i4 + 1; i14 < i3; i14++) {
            if (((h21) arrayList4.get(i14 - 1)).j(i7) != ((h21) arrayList4.get(i14)).j(i7)) {
                i13++;
            }
        }
        long j4 = (kz0Var.b / 4) + j + 2 + ((long) (i13 * 2));
        kz0Var.N0(i13);
        kz0Var.N0(i5);
        for (int i15 = i4; i15 < i3; i15++) {
            int iJ = ((h21) arrayList4.get(i15)).j(i7);
            if (i15 == i4 || iJ != ((h21) arrayList4.get(i15 - 1)).j(i7)) {
                kz0Var.N0(iJ & 255);
            }
        }
        kz0 kz0Var3 = new kz0();
        int i16 = i4;
        while (i16 < i3) {
            byte bJ = ((h21) arrayList4.get(i16)).j(i7);
            int i17 = i16 + 1;
            int i18 = i17;
            while (true) {
                if (i18 >= i3) {
                    i18 = i3;
                    break;
                } else if (bJ != ((h21) arrayList4.get(i18)).j(i7)) {
                    break;
                } else {
                    i18++;
                }
            }
            if (i17 == i18 && i7 + 1 == ((h21) arrayList4.get(i16)).e()) {
                kz0Var.N0(((Number) arrayList5.get(i16)).intValue());
                arrayList3 = arrayList5;
                j2 = j4;
                i6 = i18;
            } else {
                kz0Var.N0(((int) ((kz0Var3.b / 4) + j4)) * (-1));
                arrayList3 = arrayList5;
                j2 = j4;
                i6 = i18;
                t(j2, kz0Var3, i7 + 1, arrayList, i16, i6, arrayList3);
                arrayList4 = arrayList;
            }
            j4 = j2;
            i16 = i6;
            arrayList5 = arrayList3;
        }
        kz0Var.J(kz0Var3);
    }

    public static final boolean u(rb9 rb9Var) {
        return (rb9Var.b() || rb9Var.h || !rb9Var.d) ? false : true;
    }

    public static final boolean v(rb9 rb9Var) {
        return !rb9Var.h && rb9Var.d;
    }

    public static final boolean w(rb9 rb9Var) {
        return (rb9Var.b() || !rb9Var.h || rb9Var.d) ? false : true;
    }

    public static final boolean x(rb9 rb9Var) {
        return rb9Var.h && !rb9Var.d;
    }

    public static final ArrayList y(ArrayList arrayList, List list, s55 s55Var) {
        mn6 mn6VarF;
        list.getClass();
        arrayList.size();
        list.size();
        ArrayList<f09> arrayListT1 = bu1.t1(list, arrayList);
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayListT1, 10));
        for (f09 f09Var : arrayListT1) {
            mn6 mn6Var = (mn6) f09Var.a;
            lqe lqeVar = (lqe) f09Var.b;
            int i = lqeVar.g;
            ly annotations = lqeVar.getAnnotations();
            n98 name = lqeVar.getName();
            name.getClass();
            boolean zZ0 = lqeVar.z0();
            boolean z = lqeVar.i;
            boolean z2 = lqeVar.j;
            if (lqeVar.k != null) {
                int i2 = f93.a;
                b38 b38VarD = d93.d(s55Var);
                b38VarD.getClass();
                mn6VarF = b38VarD.e().f(mn6Var);
            } else {
                mn6VarF = null;
            }
            mn6 mn6Var2 = mn6VarF;
            jkc jkcVarD = lqeVar.d();
            jkcVarD.getClass();
            arrayList2.add(new lqe(s55Var, null, i, annotations, name, mn6Var, zZ0, z, z2, mn6Var2, jkcVarD));
        }
        return arrayList2;
    }

    public abstract String B();

    public abstract int z();

    public static String K(Object obj) {
        if (obj == null) {
            return "null";
        }
        try {
            return obj.toString();
        } catch (Exception e2) {
            String strX = ev6.x(obj.getClass().getName(), "@", Integer.toHexString(System.identityHashCode(obj)));
            Logger.getLogger("com.google.common.base.Strings").logp(Level.WARNING, "com.google.common.base.Strings", "lenientToString", "Exception during lenientFormat for ".concat(strX), (Throwable) e2);
            return ev6.y("<", strX, pUlNWdybf.lLzXXJZUKCpx, e2.getClass().getName(), ">");
        }
    }
}
