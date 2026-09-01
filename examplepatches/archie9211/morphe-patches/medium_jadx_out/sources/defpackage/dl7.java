package defpackage;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Shader;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.graphql.fragment.PagingParamsData;
import com.medium.android.graphql.type.PagingOptions;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.xmlpull.v1.XmlPullParser;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class dl7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;
    public static final /* synthetic */ int e = 0;
    public static final /* synthetic */ int f = 0;

    public static String A(String str, Object... objArr) {
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
            sb.append(B(objArr[i]));
            i2 = iIndexOf + 2;
            i++;
        }
        sb.append((CharSequence) str, i2, str.length());
        if (i < length) {
            String str2 = " [";
            while (i < objArr.length) {
                sb.append(str2);
                sb.append(B(objArr[i]));
                i++;
                str2 = ", ";
            }
            sb.append(']');
        }
        return sb.toString();
    }

    public static q2g C(Context context, String str) {
        String strValueOf;
        n2g n2gVarQ = q2g.q();
        n2gVarQ.b();
        q2g.u((q2g) n2gVarQ.b);
        n2gVarQ.b();
        q2g.v((q2g) n2gVarQ.b);
        String packageName = context.getPackageName();
        n2gVarQ.b();
        q2g.s((q2g) n2gVarQ.b, packageName);
        n2gVarQ.b();
        q2g.t((q2g) n2gVarQ.b, str);
        try {
            strValueOf = String.valueOf(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
        } catch (PackageManager.NameNotFoundException unused) {
            rxf.i("DelegationApiParamsBuilder", "No version code is found!");
            strValueOf = null;
        }
        if (strValueOf != null) {
            n2gVarQ.b();
            q2g.r((q2g) n2gVarQ.b, strValueOf);
        }
        return (q2g) n2gVarQ.a();
    }

    public static final void a(int i, dr9 dr9Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        dr9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1307191517);
        int i3 = i2 | (p65Var.d(i) ? 4 : 2) | (p65Var.f(dr9Var) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128) | 3072;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            int i5 = i3 & 896;
            boolean z = (i5 == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ng5(sh9Var, dr9Var, i4);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarR = hlg.r(o28Var, false, null, null, (m45) objM, 15);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j = p65Var.T;
            int i6 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            jjd.b(String.valueOf(i), w2g.G(o28Var, 24.0f, 26.0f, 0.0f, 0.0f, 12), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 48, 0, 131068);
            p65Var = p65Var;
            il7.k(dr9Var, stc.S, sh9Var, null, new jy8(12.0f, 20.0f, 24.0f, 20.0f), p65Var, ((i3 >> 3) & 14) | 48 | i5, 8);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new hm8(i, dr9Var, sh9Var, r28Var2, i2);
        }
    }

    public static final void b(final mz1 mz1Var, b55 b55Var, b55 b55Var2, mkd mkdVar, final long j, long j2, x12 x12Var, final int i) {
        b55 b55Var3;
        b55 b55Var4;
        mkd mkdVar2;
        long j3;
        boolean z;
        int i2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-931325388);
        int i3 = i | (p65Var.h(mz1Var) ? 4 : 2) | (p65Var.h(b55Var) ? 32 : 16) | (p65Var.h(b55Var2) ? 256 : 128) | (p65Var.f(mkdVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.e(j) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.e(j2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            float f2 = b55Var2 == null ? 8.0f : 0.0f;
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 16.0f, 0.0f, f2, 0.0f, 10);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new id(14);
                p65Var.j0(objM);
            }
            zk7 zk7Var = (zk7) objM;
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7Var);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            cu cuVar3 = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar3);
            }
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarE = w2g.E(kng.J(o28Var, "text"), 0.0f, 6.0f, 1);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            int iS2 = w2g.s(p65Var);
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarE);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS2))) {
                lv8.w(iS2, p65Var, iS2, cuVar3);
            }
            tp7.B(p65Var, cuVar4, r28VarR2);
            km4.H(i3 & 14, mz1Var, p65Var, true);
            if (b55Var != null) {
                p65Var.Y(-1014168049);
                r28 r28VarJ = kng.J(o28Var, "action");
                zk7 zk7VarC2 = dy0.c(ar0Var, false);
                int iS3 = w2g.s(p65Var);
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarJ);
                p65Var.c0();
                i2 = 8;
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS3))) {
                    lv8.w(iS3, p65Var, iS3, cuVar3);
                }
                tp7.B(p65Var, cuVar4, r28VarR3);
                mkdVar2 = mkdVar;
                b55Var3 = b55Var;
                k40.d(new o10[]{b09.q(j, c82.a), jjd.a.a(mkdVar2)}, b55Var3, p65Var, 8 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
                p65Var.p(true);
                z = false;
                p65Var.p(false);
            } else {
                b55Var3 = b55Var;
                mkdVar2 = mkdVar;
                z = false;
                i2 = 8;
                p65Var.Y(-1013852841);
                p65Var.p(false);
            }
            if (b55Var2 != null) {
                p65Var.Y(-1013804481);
                r28 r28VarJ2 = kng.J(o28Var, "dismissAction");
                zk7 zk7VarC3 = dy0.c(ar0Var, z);
                int iS4 = w2g.s(p65Var);
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarJ2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC3);
                tp7.B(p65Var, cuVar2, i89VarL4);
                if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS4))) {
                    lv8.w(iS4, p65Var, iS4, cuVar3);
                }
                tp7.B(p65Var, cuVar4, r28VarR4);
                j3 = j2;
                o10 o10VarQ = b09.q(j3, c82.a);
                int i4 = i2 | ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                b55Var4 = b55Var2;
                k40.c(o10VarQ, b55Var4, p65Var, i4);
                z2 = true;
                p65Var.p(true);
                p65Var.p(false);
            } else {
                b55Var4 = b55Var2;
                j3 = j2;
                z2 = true;
                p65Var.Y(-1013535401);
                p65Var.p(z);
            }
            p65Var.p(z2);
        } else {
            b55Var3 = b55Var;
            b55Var4 = b55Var2;
            mkdVar2 = mkdVar;
            j3 = j2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final long j4 = j3;
            final mkd mkdVar3 = mkdVar2;
            final b55 b55Var5 = b55Var4;
            final b55 b55Var6 = b55Var3;
            mwaVarS.d = new b55(b55Var6, b55Var5, mkdVar3, j, j4, i) { // from class: thc
                public final /* synthetic */ b55 b;
                public final /* synthetic */ b55 c;
                public final /* synthetic */ mkd d;
                public final /* synthetic */ long e;
                public final /* synthetic */ long f;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    dl7.b(this.a, this.b, this.c, this.d, this.e, this.f, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(final ol9 ol9Var, final ek8 ek8Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-195854637);
        int i2 = (p65Var.f(ol9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = ol9Var.a;
            String str = ol9Var.e;
            mx mxVar = new mx(ol9Var.c);
            Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
            mz1 mz1VarE = pxf.E(2092518554, new so1(23, ol9Var), p65Var);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i4 = i2 & 14;
            boolean z2 = (i3 == 32) | (i4 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new m45() { // from class: pl9
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i5 = i;
                        c1e c1eVar = c1e.a;
                        ol9 ol9Var2 = ol9Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i5) {
                            case 0:
                                ek8Var2.j(ol9Var2.f, ol9Var2.g);
                                break;
                            default:
                                ek8Var2.k(ol9Var2.b, ol9Var2.g);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            int i5 = (i3 == 32 ? 1 : 0) | (i4 == 4 ? 1 : 0);
            Object objM2 = p65Var.M();
            if (i5 != 0 || objM2 == uobVar) {
                final int i6 = 1;
                objM2 = new m45() { // from class: pl9
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i52 = i6;
                        c1e c1eVar = c1e.a;
                        ol9 ol9Var2 = ol9Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i52) {
                            case 0:
                                ek8Var2.j(ol9Var2.f, ol9Var2.g);
                                break;
                            default:
                                ek8Var2.k(ol9Var2.b, ol9Var2.g);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            rv8.g(z, str, numValueOf, mxVar, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(ol9Var, ek8Var, i, 10);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0128  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0210  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x0223  */
    /* JADX WARN: Removed duplicated region for block: B:163:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0041  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0046  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0101  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(final defpackage.r28 r25, defpackage.b55 r26, defpackage.b55 r27, defpackage.m3c r28, long r29, long r31, long r33, long r35, final defpackage.mz1 r37, defpackage.x12 r38, final int r39, final int r40) {
        /*
            Method dump skipped, instruction units count: 564
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dl7.d(r28, b55, b55, m3c, long, long, long, long, mz1, x12, int, int):void");
    }

    public static final void e(final ihc ihcVar, r28 r28Var, m3c m3cVar, long j, long j2, long j3, long j4, long j5, x12 x12Var, final int i) {
        int i2;
        p65 p65Var;
        final r28 r28Var2;
        final m3c m3cVar2;
        final long j6;
        final long j7;
        final long j8;
        final long j9;
        final long j10;
        long jD;
        r28 r28Var3;
        long j11;
        long j12;
        long j13;
        long j14;
        m3c m3cVar3;
        int i3;
        mz1 mz1Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(274621471);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(ihcVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i4 = i2 | 432;
        if ((i & 3072) == 0) {
            i4 = i2 | 1456;
        }
        if ((i & 24576) == 0) {
            i4 |= 8192;
        }
        if ((196608 & i) == 0) {
            i4 |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i4 |= 524288;
        }
        if ((12582912 & i) == 0) {
            i4 |= 4194304;
        }
        if ((100663296 & i) == 0) {
            i4 |= 33554432;
        }
        int i5 = 0;
        int i6 = 1;
        if (p65Var2.P(i4 & 1, (38347923 & i4) != 38347922)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                m3c m3cVarA = z4c.a(cic.e, p65Var2);
                long jD2 = iv1.d(cic.c, p65Var2);
                long jD3 = iv1.d(cic.g, p65Var2);
                gv1 gv1Var = cic.a;
                jD = iv1.d(gv1Var, p65Var2);
                long jD4 = iv1.d(gv1Var, p65Var2);
                long jD5 = iv1.d(cic.f, p65Var2);
                r28Var3 = o28.b;
                j11 = jD2;
                j12 = jD3;
                j13 = jD4;
                j14 = jD5;
                m3cVar3 = m3cVarA;
                i3 = i4 & (-268434433);
            } else {
                p65Var2.S();
                i3 = i4 & (-268434433);
                r28Var3 = r28Var;
                m3cVar3 = m3cVar;
                j11 = j;
                j12 = j2;
                jD = j3;
                j13 = j4;
                j14 = j5;
            }
            p65Var2.q();
            String strB = ihcVar.a.b();
            mz1 mz1VarE = null;
            if (strB != null) {
                p65Var2.Y(-663815981);
                mz1 mz1VarE2 = pxf.E(-1378313599, new o11(1, jD, ihcVar, strB), p65Var2);
                p65Var2.p(false);
                mz1Var = mz1VarE2;
            } else {
                p65Var2.Y(-663517017);
                p65Var2.p(false);
                mz1Var = null;
            }
            if (ihcVar.a.c()) {
                p65Var2.Y(-663364652);
                mz1VarE = pxf.E(-1812633777, new xhc(ihcVar, i6), p65Var2);
                p65Var2.p(false);
            } else {
                p65Var2.Y(-662974393);
                p65Var2.p(false);
            }
            p65Var = p65Var2;
            d(w2g.C(r28Var3, 12.0f), mz1Var, mz1VarE, m3cVar3, j11, j12, j13, j14, pxf.E(-1266389126, new xhc(ihcVar, i5), p65Var2), p65Var, ((i3 << 3) & 7168) | 805306368, 0);
            r28Var2 = r28Var3;
            j8 = jD;
            m3cVar2 = m3cVar3;
            j6 = j11;
            j7 = j12;
            j9 = j13;
            j10 = j14;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            m3cVar2 = m3cVar;
            j6 = j;
            j7 = j2;
            j8 = j3;
            j9 = j4;
            j10 = j5;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: rhc
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i | 1);
                    dl7.e(ihcVar, r28Var2, m3cVar2, j6, j7, j8, j9, j10, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void f(String str, mkd mkdVar, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        mkd mkdVar2 = mkdVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1648412027);
        if ((i & 6) == 0) {
            i2 = i | (p65Var2.f(str) ? 4 : 2);
        } else {
            i2 = i;
        }
        int i3 = i2 | (p65Var2.f(mkdVar2) ? 32 : 16);
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarE = w2g.E(o28.b, 24.0f, 0.0f, 2);
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
            int i5 = (i3 << 18) & 29360128;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVar, p65Var2, i3 & 14, i5, 131070);
            jjd.b("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sodales sodales libero, at lobortis dolor finibus non. Etiam convallis, eros nec dictum placerat, turpis ex efficitur nulla, sed pellentesque dui diam et lectus.", null, 0L, 0L, 0L, null, null, 0L, 2, false, 3, 0, null, mkdVar, p65Var2, 6, i5 | 24960, 110590);
            mkdVar2 = mkdVar;
            p65Var = p65Var2;
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cu7(str, mkdVar2, i, 0);
        }
    }

    public static final void g(x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(963059837);
        if (p65Var.P(i & 1, i != 0)) {
            o28 o28Var = o28.b;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(new h70(16.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j = p65Var.T;
            int i2 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i2));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            f("Title XL", rz5.D(p65Var).a, p65Var, 6);
            f("Title L", rz5.D(p65Var).b, p65Var, 6);
            f("Title M", rz5.D(p65Var).c, p65Var, 6);
            f("Title S", rz5.D(p65Var).d, p65Var, 6);
            f("Title XS", rz5.D(p65Var).e, p65Var, 6);
            f("Heading XL", rz5.D(p65Var).f, p65Var, 6);
            f("Heading L", rz5.D(p65Var).g, p65Var, 6);
            f("Heading M", rz5.D(p65Var).h, p65Var, 6);
            f("Heading S", rz5.D(p65Var).i, p65Var, 6);
            f("Heading XS", rz5.D(p65Var).j, p65Var, 6);
            f("Detail XL", rz5.D(p65Var).k, p65Var, 6);
            f("Detail L", rz5.D(p65Var).l, p65Var, 6);
            f("Detail M", rz5.D(p65Var).m, p65Var, 6);
            f("Detail S", rz5.D(p65Var).n, p65Var, 6);
            f("Detail XS", rz5.D(p65Var).o, p65Var, 6);
            f("Subtitle L", rz5.D(p65Var).p, p65Var, 6);
            f("Subtitle M", rz5.D(p65Var).q, p65Var, 6);
            f("Subtitle S", rz5.D(p65Var).r, p65Var, 6);
            f("Body M", rz5.D(p65Var).s, p65Var, 6);
            f("Body S", rz5.D(p65Var).t, p65Var, 6);
            Locale locale = Locale.ROOT;
            String upperCase = "Overline L".toUpperCase(locale);
            upperCase.getClass();
            f(upperCase, rz5.D(p65Var).u, p65Var, 0);
            String upperCase2 = "Overline M".toUpperCase(locale);
            upperCase2.getClass();
            f(upperCase2, rz5.D(p65Var).v, p65Var, 0);
            String upperCase3 = "Overline S".toUpperCase(locale);
            upperCase3.getClass();
            f(upperCase3, rz5.D(p65Var).w, p65Var, 0);
            f("Quote L", rz5.D(p65Var).x, p65Var, 6);
            f("Quote M", rz5.D(p65Var).y, p65Var, 6);
            f("Quote S", rz5.D(p65Var).z, p65Var, 6);
            f("Brand XXXL", rz5.D(p65Var).A, p65Var, 6);
            f("Brand XXL", rz5.D(p65Var).B, p65Var, 6);
            f("Brand XL", rz5.D(p65Var).C, p65Var, 6);
            f("Brand L", rz5.D(p65Var).D, p65Var, 6);
            f("Brand M", rz5.D(p65Var).E, p65Var, 6);
            f("Brand S", rz5.D(p65Var).F, p65Var, 6);
            f("Brand XS", rz5.D(p65Var).G, p65Var, 6);
            lv8.y(o28Var, 16.0f, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 22);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:69:0x03b2 A[PHI: r9
      0x03b2: PHI (r9v35 ihe) = (r9v33 ihe), (r9v36 ihe) binds: [B:68:0x03b0, B:64:0x03a9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x03ce A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:82:0x03d0  */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v5 */
    /* JADX WARN: Type inference failed for: r2v6, types: [boolean, int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void h(defpackage.uge r61, defpackage.ihe r62, defpackage.r28 r63, defpackage.x12 r64, int r65) {
        /*
            Method dump skipped, instruction units count: 1705
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dl7.h(uge, ihe, r28, x12, int):void");
    }

    public static final void i(int i, long j, x12 x12Var, r28 r28Var) {
        p65 p65Var;
        r28 r28Var2;
        r28 r28Var3;
        long j2 = j;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(33437195);
        int i2 = i | 6;
        if ((i & 48) == 0) {
            i2 |= p65Var2.e(j2) ? 32 : 16;
        }
        int i3 = i2;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var2.U();
            int i4 = i & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var2.z()) {
                r28Var3 = o28Var;
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
            }
            p65Var2.q();
            r28 r28VarD = jfc.d(w2g.D(r28Var3, 24.0f, 16.0f), 1.0f);
            rz5 rz5Var = qb8.c;
            yq0 yq0Var = z46.p;
            wv1 wv1VarA = uv1.a(rz5Var, yq0Var, p65Var2, 0);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, ombVarA);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28Var4 = r28Var3;
            d46.d(hl0.L, null, j2, p65Var2, ((i3 << 3) & 896) | 6, 2);
            hp7.t(p65Var2, jfc.l(o28Var, 16.0f));
            wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, p65Var2, 0);
            long j5 = p65Var2.T;
            int i7 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i7, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            sn3 sn3Var = jt7.c;
            int i8 = ((i3 << 6) & 7168) | 48;
            ok7.r(240.0f, i8, 4, j, p65Var2, null, ((bu7) p65Var2.j(sn3Var)).h);
            ok7.r(220.0f, i8, 4, j, p65Var2, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var2, sn3Var)).l);
            j2 = j;
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
            ((jp7) p65Var.j(kt7.a)).getClass();
            hp7.t(p65Var, flb.a0(jfc.e(w2g.G(jp7.a(p65Var) == ip7.COMPACT ? jfc.d(o28Var, 1.0f) : jfc.d(jfc.q(o28Var, 0.0f, 264.0f, 1), 1.0f), 0.0f, 20.0f, 0.0f, 0.0f, 13), 38.0f), j2, bmb.a(it4.M.m115getCornerSizeD9Ej5fM())));
            p65Var.p(true);
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sa0(r28Var2, j2, i, 15);
        }
    }

    public static final void j(qfe qfeVar, r28 r28Var, x12 x12Var, int i) {
        long j;
        uob uobVar;
        long j2;
        l78 l78Var;
        qfe qfeVar2 = qfeVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2024959866);
        int i2 = (p65Var.f(qfeVar2) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16);
        int i3 = 0;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            r28 r28VarN = bgf.N(r28Var, "verified_author_intro_card");
            sn3 sn3Var = kt7.b;
            long j3 = ((zo7) p65Var.j(sn3Var)).a;
            nr5 nr5Var = rv8.r;
            r28 r28VarY = r40.y(jfc.d(flb.a0(r28VarN, j3, nr5Var), 1.0f), bmb.a(4.0f));
            if (yi2.N(p65Var)) {
                p65Var.Y(366259539);
                j = ((zo7) p65Var.j(sn3Var)).c;
                p65Var.p(false);
            } else {
                p65Var.Y(366260523);
                p65Var.p(false);
                j = op8.j(1304748799);
            }
            r28 r28VarA0 = flb.a0(r28VarY, j, nr5Var);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z || objM == uobVar2) {
                uobVar = uobVar2;
                objM = new k8e(0, qfeVar2, qfe.class, "onClick", "onClick()V", 0, 23);
                p65Var.j0(objM);
            } else {
                uobVar = uobVar2;
            }
            r28 r28VarR = hlg.r(r28VarA0, false, null, null, (m45) ((qh6) objM), 15);
            if (yi2.N(p65Var)) {
                p65Var.Y(366265135);
                j2 = ((zo7) p65Var.j(sn3Var)).z;
                p65Var.p(false);
            } else {
                p65Var.Y(366266181);
                p65Var.p(false);
                j2 = uu1.g;
            }
            r28 r28VarB = bo.B(r28VarR, 1.0f, j2, nr5Var);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM2 = p65Var.M();
            uob uobVar3 = uobVar;
            if (objM2 == uobVar3) {
                objM2 = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar3) {
                objM3 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar3) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar3) {
                objM5 = b09.s(z52Var, p65Var);
            }
            m62 m62Var = (m62) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar3) {
                objM6 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM6;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar3) {
                ftc ftcVar = new ftc(l78Var3, hl7Var, m62Var, l78Var2, 6);
                l78Var = l78Var2;
                p65Var.j0(ftcVar);
                objM7 = ftcVar;
            } else {
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) objM7;
            Object objM8 = p65Var.M();
            int i4 = 6;
            if (objM8 == uobVar3) {
                objM8 = new gtc(l78Var, m62Var, i4);
                p65Var.j0(objM8);
            }
            m45 m45Var = (m45) objM8;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM9 = p65Var.M();
            if (zH2 || objM9 == uobVar3) {
                objM9 = new htc(hl7Var, i4);
                p65Var.j0(objM9);
            }
            r28 r28VarA = wxb.a(r28VarB, false, (x45) objM9);
            kj2 kj2Var = new kj2(l78Var3, z52Var, m45Var, qfeVar, 4);
            qfeVar2 = qfeVar;
            hlg.j(r28VarA, pxf.E(1200550679, kj2Var, p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new xre(qfeVar2, r28Var, i, i3);
        }
    }

    public static long k(boolean z, int i, tm0 tm0Var, long j, long j2, int i2, boolean z2, long j3, long j4, long j5, long j6) {
        tm0Var.getClass();
        if (j6 != Long.MAX_VALUE && z2) {
            if (i2 != 0) {
                long j7 = j2 + 900000;
                if (j6 < j7) {
                    return j7;
                }
            }
            return j6;
        }
        if (z) {
            long jScalb = tm0Var == tm0.LINEAR ? j * ((long) i) : (long) Math.scalb(j, i - 1);
            if (jScalb > 18000000) {
                jScalb = 18000000;
            }
            return j2 + jScalb;
        }
        if (z2) {
            long j8 = i2 == 0 ? j2 + j3 : j2 + j5;
            return (j4 == j5 || i2 != 0) ? j8 : (j5 - j4) + j8;
        }
        if (j2 == -1) {
            return Long.MAX_VALUE;
        }
        return j2 + j3;
    }

    public static final zwa l(q28 q28Var, boolean z, boolean z2) {
        if (!q28Var.a.n) {
            return zwa.e;
        }
        if (z) {
            return flb.t0(q28Var, 8).k1();
        }
        eh8 eh8VarT0 = flb.t0(q28Var, 8);
        return sgg.K(eh8VarT0).H(eh8VarT0, z2);
    }

    public static final mkd m(mkd mkdVar) {
        mkdVar.getClass();
        return mkd.a(mkdVar, 0L, 0L, null, null, null, 0L, 0L, null, 0, 0L, new bb9(true), null, 16252927);
    }

    public static final ArrayList n(y66 y66Var) {
        y66Var.getClass();
        aq6 aq6VarV0 = ((fb7) y66Var).v0();
        boolean zV = v(aq6VarV0);
        v68 v68Var = (v68) aq6VarV0.o();
        o78 o78Var = (o78) v68Var.b;
        ArrayList arrayList = new ArrayList(o78Var.c);
        int i = o78Var.c;
        for (int i2 = 0; i2 < i; i2++) {
            aq6 aq6Var = (aq6) v68Var.get(i2);
            arrayList.add(zV ? aq6Var.l() : aq6Var.m());
        }
        return arrayList;
    }

    public static xp p(TypedArray typedArray, XmlPullParser xmlPullParser, Resources.Theme theme, String str, int i) {
        xp xpVarH;
        if (t(xmlPullParser, str)) {
            TypedValue typedValue = new TypedValue();
            typedArray.getValue(i, typedValue);
            int i2 = typedValue.type;
            if (i2 >= 28 && i2 <= 31) {
                return new xp((Shader) null, (ColorStateList) null, typedValue.data);
            }
            try {
                xpVarH = xp.h(typedArray.getResources(), typedArray.getResourceId(i, 0), theme);
            } catch (Exception e2) {
                Log.e("ComplexColorCompat", "Failed to inflate ComplexColor.", e2);
                xpVarH = null;
            }
            if (xpVarH != null) {
                return xpVarH;
            }
        }
        return new xp((Shader) null, (ColorStateList) null, 0);
    }

    public static String q(TypedArray typedArray, XmlPullParser xmlPullParser, String str, int i) {
        if (t(xmlPullParser, str)) {
            return typedArray.getString(i);
        }
        return null;
    }

    public static final PagingOptions r(PagingParamsData pagingParamsData) {
        String from = pagingParamsData.getFrom();
        zv8 yv8Var = xv8.a;
        zv8 yv8Var2 = from == null ? yv8Var : new yv8(from);
        List<String> ignoredIds = pagingParamsData.getIgnoredIds();
        zv8 yv8Var3 = ignoredIds == null ? yv8Var : new yv8(ignoredIds);
        Integer limit = pagingParamsData.getLimit();
        zv8 yv8Var4 = limit == null ? yv8Var : new yv8(limit);
        String order = pagingParamsData.getOrder();
        zv8 yv8Var5 = order == null ? yv8Var : new yv8(order);
        Integer page = pagingParamsData.getPage();
        zv8 yv8Var6 = page == null ? yv8Var : new yv8(page);
        Long since = pagingParamsData.getSince();
        zv8 yv8Var7 = since == null ? yv8Var : new yv8(since);
        String source = pagingParamsData.getSource();
        zv8 yv8Var8 = source == null ? yv8Var : new yv8(source);
        String to = pagingParamsData.getTo();
        if (to != null) {
            yv8Var = new yv8(to);
        }
        return new PagingOptions(yv8Var2, yv8Var3, yv8Var4, yv8Var5, yv8Var6, yv8Var7, yv8Var8, yv8Var);
    }

    public static final int s(anb anbVar) {
        anbVar.getClass();
        gnb gnbVarB0 = anbVar.B0("SELECT changes()");
        try {
            gnbVarB0.w0();
            int i = (int) gnbVarB0.getLong(0);
            xz5.F(gnbVarB0, null);
            return i;
        } finally {
        }
    }

    public static boolean t(XmlPullParser xmlPullParser, String str) {
        return xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", str) != null;
    }

    public static final void u(xxb xxbVar) {
        flb.v0(xxbVar).F();
    }

    public static final boolean v(aq6 aq6Var) {
        int i = cl7.a[aq6Var.G.d.ordinal()];
        if (i == 1 || i == 2) {
            return true;
        }
        if (i != 3 && i != 4) {
            if (i == 5) {
                aq6 aq6VarV = aq6Var.v();
                if (aq6VarV != null) {
                    return v(aq6VarV);
                }
                ay0.e("no parent for idle node");
                return false;
            }
            ygf.a();
        }
        return false;
    }

    public static TypedArray w(Resources resources, Resources.Theme theme, AttributeSet attributeSet, int[] iArr) {
        return theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
    }

    public static n98 x(n98 n98Var, String str, String str2, int i) {
        char cCharAt;
        char cCharAt2;
        Object next;
        boolean z = (i & 4) != 0;
        if ((i & 8) != 0) {
            str2 = null;
        }
        if (!n98Var.b) {
            String strC = n98Var.c();
            if (tuc.N(strC, str, false) && strC.length() != str.length() && ('a' > (cCharAt = strC.charAt(str.length())) || cCharAt >= '{')) {
                if (str2 != null) {
                    return n98.e(str2.concat(muc.j0(str, strC)));
                }
                if (!z) {
                    return n98Var;
                }
                String strJ0 = muc.j0(str, strC);
                if (strJ0.length() != 0 && sgg.Q(0, strJ0)) {
                    if (strJ0.length() != 1 && sgg.Q(1, strJ0)) {
                        Iterator it2 = new n46(0, strJ0.length() - 1, 1).iterator();
                        while (true) {
                            if (!((m46) it2).c) {
                                next = null;
                                break;
                            }
                            next = ((g46) it2).next();
                            if (!sgg.Q(((Number) next).intValue(), strJ0)) {
                                break;
                            }
                        }
                        Integer num = (Integer) next;
                        if (num != null) {
                            int iIntValue = num.intValue() - 1;
                            strJ0 = sgg.a0(strJ0.substring(0, iIntValue)).concat(strJ0.substring(iIntValue));
                        } else {
                            strJ0 = sgg.a0(strJ0);
                        }
                    } else if (strJ0.length() != 0 && 'A' <= (cCharAt2 = strJ0.charAt(0)) && cCharAt2 < '[') {
                        strJ0 = Character.toLowerCase(cCharAt2) + strJ0.substring(1);
                    }
                }
                if (n98.f(strJ0)) {
                    return n98.e(strJ0);
                }
            }
        }
        return null;
    }

    public static ft2 y(c99 c99Var) {
        if (TextUtils.isEmpty(c99Var.e)) {
            String str = c99Var.a;
            String str2 = c99Var.b;
            boolean z = c99Var.d;
            ft2 ft2Var = new ft2();
            vp7.n(str);
            ft2Var.b = str;
            vp7.n(str2);
            ft2Var.d = str2;
            ft2Var.a = z;
            return ft2Var;
        }
        String str3 = c99Var.c;
        String str4 = c99Var.e;
        boolean z2 = c99Var.d;
        ft2 ft2Var2 = new ft2();
        vp7.n(str3);
        ft2Var2.c = str3;
        vp7.n(str4);
        ft2Var2.e = str4;
        ft2Var2.a = z2;
        return ft2Var2;
    }

    public static Bundle z(q2g q2gVar, u8g u8gVar) {
        Bundle bundle = new Bundle();
        bundle.putByteArray("REQUEST_METADATA", q2gVar.b());
        bundle.putByteArray("REQUEST_PARAMS", u8gVar.b());
        return bundle;
    }

    public static String B(Object obj) {
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
            ka1.C(sb, ZVsviyDAr.drPC, strS, " threw ", name2);
            sb.append(">");
            return sb.toString();
        }
    }

    public static ColorStateList o(TypedArray typedArray, XmlPullParser xmlPullParser, Resources.Theme theme) {
        if (t(xmlPullParser, "tint")) {
            TypedValue typedValue = new TypedValue();
            typedArray.getValue(1, typedValue);
            int i = typedValue.type;
            if (i != 2) {
                if (i >= 28 && i <= 31) {
                    return ColorStateList.valueOf(typedValue.data);
                }
                Resources resources = typedArray.getResources();
                int resourceId = typedArray.getResourceId(1, 0);
                ThreadLocal threadLocal = ov1.a;
                try {
                    return ov1.a(resources, resources.getXml(resourceId), theme);
                } catch (Exception e2) {
                    Log.e("CSLCompat", "Failed to inflate ColorStateList.", e2);
                    return null;
                }
            }
            ywb.i(mgKMENwrbHf.vOsiaNxmVoJIv, typedValue);
        }
        return null;
    }
}
