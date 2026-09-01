package defpackage;

import android.app.Notification;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.models.EntityType;
import com.medium.android.data.post.model.ReportPostReason;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class rr7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static void D(ti8 ti8Var) {
        int i = Build.VERSION.SDK_INT;
        Notification notification = ti8Var.s;
        if (i > 23) {
            notification.icon = R.drawable.ic_app_notification_24;
        } else {
            notification.icon = R.mipmap.ic_launcher_wordmark;
        }
    }

    public static void F(Object obj, Object obj2) {
        if (obj == null) {
            z72.c("null key in entry: null=".concat(String.valueOf(obj2)));
        } else {
            if (obj2 != null) {
                return;
            }
            z72.c(ev6.x("null value in entry: ", obj.toString(), "=null"));
        }
    }

    public static byte[] G(byte[] bArr) {
        int length;
        int i = 0;
        while (true) {
            length = bArr.length;
            if (i >= length || bArr[i] != 0) {
                break;
            }
            i++;
        }
        if (i == length) {
            i = length - 1;
        }
        int i2 = (bArr[i] & 128) == 128 ? 1 : 0;
        int i3 = length - i;
        byte[] bArr2 = new byte[i3 + i2];
        System.arraycopy(bArr, i, bArr2, i2, i3);
        return bArr2;
    }

    public static /* synthetic */ void a(int i) {
        Object[] objArr = new Object[3];
        switch (i) {
            case 1:
            case 4:
                objArr[0] = "b";
                break;
            case 2:
            case 7:
                objArr[0] = "typeCheckingProcedure";
                break;
            case 3:
            default:
                objArr[0] = "a";
                break;
            case 5:
            case 10:
                objArr[0] = "subtype";
                break;
            case 6:
            case 11:
                objArr[0] = "supertype";
                break;
            case 8:
                objArr[0] = "type";
                break;
            case 9:
                objArr[0] = "typeProjection";
                break;
        }
        objArr[1] = "kotlin/reflect/jvm/internal/impl/types/checker/TypeCheckerProcedureCallbacksImpl";
        switch (i) {
            case 3:
            case 4:
                objArr[2] = "assertEqualTypeConstructors";
                break;
            case 5:
            case 6:
            case 7:
                objArr[2] = "assertSubtype";
                break;
            case 8:
            case 9:
                objArr[2] = "capture";
                break;
            case 10:
            case 11:
                objArr[2] = "noCorrespondingSupertype";
                break;
            default:
                objArr[2] = "assertEqualTypes";
                break;
        }
        throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", objArr));
    }

    public static final void b(String str, String str2, mz1 mz1Var, x12 x12Var, int i) {
        mz1 mz1Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1319207862);
        int i2 = i | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            mkd mkdVarW = to7.w(p65Var2);
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            jjd.b(str, bgf.N(o28Var, "block_data_title"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarW, p65Var, (i2 & 14) | 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            jjd.b(str2, bgf.N(o28Var, "block_data_description"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.v(p65Var), p65Var, ((i2 >> 3) & 14) | 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            int i3 = 21;
            mz1Var2 = mz1Var;
            m40.p(jfc.d(o28Var, 1.0f), new h70(16.0f, true, new z10(i3)), new h70(16.0f, true, new z10(i3)), null, 2, 0, pxf.E(1302454555, new un7(mz1Var2, 3), p65Var), p65Var, 1597878, 40);
        } else {
            mz1Var2 = mz1Var;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 13, str, str2, mz1Var2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x021c  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0226  */
    /* JADX WARN: Removed duplicated region for block: B:65:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(java.lang.String r55, java.lang.String r56, defpackage.r28 r57, java.lang.String r58, defpackage.x12 r59, int r60, int r61) {
        /*
            Method dump skipped, instruction units count: 570
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rr7.c(java.lang.String, java.lang.String, r28, java.lang.String, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01c7  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01ef  */
    /* JADX WARN: Removed duplicated region for block: B:91:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.r28 r30, boolean r31, defpackage.cqb r32, defpackage.b55 r33, defpackage.b55 r34, defpackage.c55 r35, defpackage.b55 r36, int r37, boolean r38, defpackage.m3c r39, float r40, long r41, long r43, long r45, long r47, long r49, final defpackage.mz1 r51, defpackage.x12 r52, final int r53, final int r54) {
        /*
            Method dump skipped, instruction units count: 516
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rr7.d(r28, boolean, cqb, b55, b55, c55, b55, int, boolean, m3c, float, long, long, long, long, long, mz1, x12, int, int):void");
    }

    public static final void e(q38 q38Var, b55 b55Var, m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        b55Var.getClass();
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(496122981);
        int i2 = i | (p65Var.f(q38Var) ? 4 : 2) | (p65Var.h(b55Var) ? 32 : 16) | (p65Var.h(m45Var) ? 256 : 128) | (p65Var.h(m45Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(w2g.E(o28Var, 24.0f, 0.0f, 2), "monthly_stats_section");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            jjd.b(vo7.R(p65Var, R.string.post_stats_monthly_stats_title), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.u(p65Var), p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            jjd.b(vo7.Q(R.string.stats_from_to_utc_updated_hourly, new Object[]{vo7.v(q38Var.a(), p65Var), vo7.v(q38Var.b(), p65Var)}, p65Var), bgf.N(o28Var, "date_range_text"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, to7.t(p65Var), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            if (q38Var instanceof p38) {
                p65Var.Y(-1169141837);
                h((p38) q38Var, b55Var, m45Var, null, p65Var, i2 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
                p65Var.p(false);
            } else if (q38Var instanceof o38) {
                p65Var.Y(-1169134197);
                g(0, 0L, p65Var, null);
                p65Var.p(false);
            } else {
                if (!(q38Var instanceof n38)) {
                    throw ho2.L(p65Var, -1169143601, false);
                }
                p65Var.Y(-1169131831);
                f(((n38) q38Var).c, m45Var2, null, p65Var, (i2 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                p65Var.p(false);
            }
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(q38Var, b55Var, m45Var, m45Var2, r28Var2, i, 28);
        }
    }

    public static final void f(b24 b24Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-537310223);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.f(b24Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(m45Var) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            iq7.a(b24Var, jfc.d(o28Var, 1.0f), null, null, null, null, m45Var, null, p65Var, (i3 & 14) | ((i3 << 15) & 3670016), 188);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 5, b24Var, m45Var, r28Var2);
        }
    }

    public static final void g(int i, long j, x12 x12Var, r28 r28Var) {
        long j2;
        r28 r28Var2;
        long j3;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2066596345);
        int i2 = i | 22;
        boolean z = false;
        boolean z2 = true;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var.U();
            int i3 = i & 1;
            o28 o28Var = o28.b;
            if (i3 == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j3 = j;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarV = m40.V(r28Var3, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            long j5 = j3;
            d46.h(0, 1, j5, p65Var, null);
            p65Var = p65Var;
            long j6 = j5;
            p65Var.Y(-779412851);
            int i5 = 0;
            while (i5 < 4) {
                hp7.t(p65Var, jfc.l(o28Var, 32.0f));
                sn3 sn3Var = jt7.c;
                ok7.r(120.0f, 48, 4, j6, p65Var, null, ((bu7) p65Var.j(sn3Var)).i);
                ok7.r(294.0f, 48, 4, j6, p65Var, null, ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).l);
                long j7 = j6;
                hp7.t(p65Var, jfc.l(o28Var, 32.0f));
                int i6 = 21;
                p65 p65Var2 = p65Var;
                m40.p(jfc.d(o28Var, 1.0f), new h70(16.0f, z2, new z10(i6)), new h70(16.0f, z2, new z10(i6)), null, 2, 0, pxf.E(-1144701848, new bl0(3, j7), p65Var), p65Var2, 1597878, 40);
                p65Var = p65Var2;
                hp7.t(p65Var, jfc.l(o28Var, 32.0f));
                dy0.a(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 180.0f), j7, rv8.r), p65Var, 0);
                hp7.t(p65Var, jfc.l(o28Var, 16.0f));
                i5++;
                j6 = j7;
                r28Var3 = r28Var3;
                z2 = true;
                z = false;
            }
            p65Var.p(z);
            p65Var.p(true);
            j2 = j6;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j2 = j;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j2, i, 12);
        }
    }

    public static final void h(p38 p38Var, b55 b55Var, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        Object obj;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1486720872);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(p38Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(b55Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var) ? 256 : 128;
        }
        int i4 = i2 | 3072;
        int i5 = 1;
        int i6 = 0;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i7 = (int) ((j >>> 32) ^ j);
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            d46.g(p38Var.c, jfc.d(o28Var, 1.0f), null, b55Var, p65Var, ((i4 << 6) & 7168) | 48, 4);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            Float f = p38Var.p;
            uob uobVar = w12.a;
            if (f == null || p38Var.q == null) {
                p65Var.Y(-1666206828);
                p65Var.p(false);
            } else {
                p65Var.Y(-1662903220);
                Object objM = p65Var.M();
                if (objM == uobVar) {
                    objM = qo7.u(null);
                    p65Var.j0(objM);
                }
                b(vo7.R(p65Var, R.string.stats_earnings), vo7.R(p65Var, R.string.post_stats_monthly_stats_earnings_description), pxf.E(-1681603500, new m38(p38Var, (l78) objM, m45Var, i6), p65Var), p65Var, 384);
                lv8.y(o28Var, 32.0f, p65Var, false);
            }
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(null);
                p65Var.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(null);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            b(vo7.R(p65Var, R.string.stats_views), vo7.R(p65Var, R.string.post_stats_monthly_stats_views_subtitle), pxf.E(-1265871431, new m38(p38Var, l78Var, l78Var2, i5), p65Var), p65Var, 384);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            ArrayList arrayList = p38Var.r;
            String strR = vo7.R(p65Var, R.string.post_stats_monthly_stats_members);
            String strR2 = vo7.R(p65Var, R.string.post_stats_monthly_stats_non_members);
            long j2 = xo7.W;
            long j3 = xo7.U;
            long j4 = xo7.C;
            long j5 = xo7.z;
            xk1 xk1Var = new xk1(j2, j3, j4, j5);
            gr5 gr5VarK0 = flb.k0(p65Var);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new mf2(l78Var, l78Var2, i5);
                p65Var.j0(objM4);
            }
            pxf.e(arrayList, strR, null, strR2, 0.0f, true, xk1Var, gr5VarK0, (x45) objM4, p65Var, 100859904, 20);
            hp7.t(p65Var, jfc.l(o28Var, 48.0f));
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = qo7.u(null);
                p65Var.j0(objM5);
            }
            l78 l78Var3 = (l78) objM5;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = qo7.u(null);
                p65Var.j0(objM6);
            }
            l78 l78Var4 = (l78) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = qo7.u(null);
                p65Var.j0(objM7);
            }
            l78 l78Var5 = (l78) objM7;
            b(vo7.R(p65Var, R.string.stats_reads), vo7.R(p65Var, R.string.post_stats_monthly_stats_reads_subtitle), pxf.E(-555989200, new vx4(p38Var, l78Var5, l78Var3, l78Var4, 5), p65Var), p65Var, 384);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            ArrayList arrayList2 = p38Var.s;
            String strR3 = vo7.R(p65Var, R.string.post_stats_monthly_stats_members);
            String strR4 = vo7.R(p65Var, R.string.post_stats_monthly_stats_non_members);
            xk1 xk1Var2 = new xk1(j2, j3, j4, j5);
            gr5 gr5VarK02 = flb.k0(p65Var);
            boolean z = (i4 & 14) == 4;
            Object objM8 = p65Var.M();
            if (z || objM8 == uobVar) {
                i3 = 384;
                objM8 = new iu(p38Var, l78Var3, l78Var4, l78Var5, 14);
                p65Var.j0(objM8);
            } else {
                i3 = 384;
            }
            o28 o28Var2 = o28Var;
            pxf.e(arrayList2, strR3, null, strR4, 0.0f, true, xk1Var2, gr5VarK02, (x45) objM8, p65Var, 196608, 20);
            b(y30.n(48.0f, R.string.post_stats_monthly_stats_engagement_title, p65Var, p65Var, o28Var2), vo7.R(p65Var, R.string.post_stats_monthly_stats_engagement_subtitle), pxf.E(22776945, new zq(6, p38Var), p65Var), p65Var, i3);
            hp7.t(p65Var, jfc.l(o28Var2, 32.0f));
            en7.h(p38Var.t, vo7.R(p65Var, R.string.post_stats_monthly_stats_members), vo7.R(p65Var, R.string.post_stats_monthly_stats_non_members), null, 0.0f, null, p65Var, 0);
            p65Var = p65Var;
            lv8.y(o28Var2, 32.0f, p65Var, true);
            obj = o28Var2;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 2, p38Var, b55Var, m45Var, obj);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void i(final az5 az5Var, r28 r28Var, final int i, x12 x12Var, final int i2, final int i3) {
        az5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(253564537);
        int i4 = 2;
        int i5 = (p65Var.f(az5Var) ? 4 : 2) | i2;
        int i6 = i5 | 48;
        int i7 = i3 & 4;
        if (i7 != 0) {
            i6 = i5 | 432;
        } else if ((i2 & 384) == 0) {
            i6 |= p65Var.d(i) ? 256 : 128;
        }
        int i8 = 0;
        if (p65Var.P(i6 & 1, (i6 & 147) != 146)) {
            if (i7 != 0) {
                i = 4;
            }
            if (((t0) az5Var).isEmpty()) {
                mwa mwaVarS = p65Var.s();
                if (mwaVarS != null) {
                    mwaVarS.d = new b55() { // from class: ww8
                        @Override // defpackage.b55
                        public final Object invoke(Object obj, Object obj2) {
                            ((Integer) obj2).getClass();
                            rr7.i(az5Var, o28.b, i, (x12) obj, tr7.y(i2 | 1), i3);
                            return c1e.a;
                        }
                    };
                    return;
                }
                return;
            }
            k40.c(u57.a.a(new l90((Resources) p65Var.j(eo.c), i4)), pxf.E(-1924814023, new xw8(bu1.Y0(bu1.g1(az5Var, i)), i8), p65Var), p65Var, 56);
            r28Var = o28.b;
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        int i9 = i;
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new ta0(az5Var, r28Var2, i9, i2, i3);
        }
    }

    public static final void j(x6b x6bVar, m6b m6bVar, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1793854525);
        int i2 = (p65Var.f(x6bVar) ? 4 : 2) | i | (p65Var.f(m6bVar) ? 32 : 16);
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
                objM = new ui9(m6bVar, 24, x6bVar);
                p65Var.j0(objM);
            }
            fo7.l((m45) objM, vo7.R(p65Var, R.string.common_report), xn7.L, bgf.N(jfc.d(w2g.F(o28Var, 24.0f, 21.0f, 24.0f, 21.0f), 1.0f), "button_report"), x6bVar.d, p65Var, 3456, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(x6bVar, m6bVar, i, 10);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void k(x6b x6bVar, final m6b m6bVar, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        boolean z;
        p65 p65Var2;
        o28 o28Var;
        Object obj;
        final int i2;
        Object obj2;
        x6b x6bVar2 = x6bVar;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(855378087);
        int i3 = i | (p65Var3.f(x6bVar2) ? 4 : 2) | (p65Var3.f(m6bVar) ? 32 : 16) | (p65Var3.f(r28Var) ? 256 : 128);
        if (p65Var3.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var3.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var3.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarJ);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var3, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var3, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var3.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, r28VarD);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, zk7VarC2);
            tp7.B(p65Var3, cuVar2, i89VarL2);
            ka1.z(i5, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(r28Var, wgf.K(p65Var3), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j3 = p65Var3.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var3.l();
            r28 r28VarR4 = gx1.R(p65Var3, r28VarR3);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, wv1VarA);
            tp7.B(p65Var3, cuVar2, i89VarL3);
            ka1.z(i6, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR4);
            hp7.t(p65Var3, jfc.l(o28Var2, 16.0f));
            x6bVar2 = x6bVar;
            ReportPostReason reportPostReason = x6bVar2.a;
            boolean z2 = reportPostReason == ReportPostReason.HARASSMENT;
            String strR = vo7.R(p65Var3, R.string.report_response_reason_harassment);
            int i7 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i7 == 32;
            Object objM = p65Var3.M();
            Object obj3 = w12.a;
            Object obj4 = objM;
            if (z3 || objM == obj3) {
                final int i8 = 0;
                Object obj5 = new m45() { // from class: r6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i9 = i8;
                        c1e c1eVar = c1e.a;
                        m6b m6bVar2 = m6bVar;
                        switch (i9) {
                            case 0:
                                m6bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 1:
                                m6bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                m6bVar2.a(ReportPostReason.SPAM);
                                break;
                            default:
                                m6bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(obj5);
                obj4 = obj5;
            }
            final int i9 = 3;
            aq7.e(z2, strR, (m45) obj4, bgf.N(o28Var2, "radio_button_harassment"), p65Var3, 3072);
            boolean z4 = reportPostReason == ReportPostReason.RULES_VIOLATION;
            String strR2 = vo7.R(p65Var3, R.string.report_response_reason_rules_violation);
            boolean z5 = i7 == 32;
            Object objM2 = p65Var3.M();
            Object obj6 = objM2;
            if (z5 || objM2 == obj3) {
                final int i10 = 1;
                Object obj7 = new m45() { // from class: r6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i10;
                        c1e c1eVar = c1e.a;
                        m6b m6bVar2 = m6bVar;
                        switch (i92) {
                            case 0:
                                m6bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 1:
                                m6bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                m6bVar2.a(ReportPostReason.SPAM);
                                break;
                            default:
                                m6bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(obj7);
                obj6 = obj7;
            }
            aq7.e(z4, strR2, (m45) obj6, bgf.N(o28Var2, "radio_button_rules_violation"), p65Var3, 3072);
            boolean z6 = reportPostReason == ReportPostReason.SPAM;
            String strR3 = vo7.R(p65Var3, R.string.report_response_reason_spam);
            boolean z7 = i7 == 32;
            Object objM3 = p65Var3.M();
            Object obj8 = objM3;
            if (z7 || objM3 == obj3) {
                final int i11 = 2;
                Object obj9 = new m45() { // from class: r6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i11;
                        c1e c1eVar = c1e.a;
                        m6b m6bVar2 = m6bVar;
                        switch (i92) {
                            case 0:
                                m6bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 1:
                                m6bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                m6bVar2.a(ReportPostReason.SPAM);
                                break;
                            default:
                                m6bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(obj9);
                obj8 = obj9;
            }
            aq7.e(z6, strR3, (m45) obj8, bgf.N(o28Var2, "radio_button_spam"), p65Var3, 3072);
            boolean z8 = reportPostReason == ReportPostReason.AI_GENERATED_CONTENT;
            String strR4 = vo7.R(p65Var3, R.string.report_response_reason_ai_generated_content);
            boolean z9 = i7 == 32;
            Object objM4 = p65Var3.M();
            Object obj10 = objM4;
            if (z9 || objM4 == obj3) {
                Object obj11 = new m45() { // from class: r6b
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i92 = i9;
                        c1e c1eVar = c1e.a;
                        m6b m6bVar2 = m6bVar;
                        switch (i92) {
                            case 0:
                                m6bVar2.a(ReportPostReason.HARASSMENT);
                                break;
                            case 1:
                                m6bVar2.a(ReportPostReason.RULES_VIOLATION);
                                break;
                            case 2:
                                m6bVar2.a(ReportPostReason.SPAM);
                                break;
                            default:
                                m6bVar2.a(ReportPostReason.AI_GENERATED_CONTENT);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(obj11);
                obj10 = obj11;
            }
            aq7.e(z8, strR4, (m45) obj10, bgf.N(o28Var2, "radio_button_ai_generated_content"), p65Var3, 3072);
            hp7.t(p65Var3, jfc.l(o28Var2, 16.0f));
            if (x6bVar2.e) {
                p65Var3.Y(-1519994509);
                boolean z10 = x6bVar2.c;
                String strR5 = vo7.R(p65Var3, R.string.report_response_hide_response);
                boolean z11 = i7 == 32;
                Object objM5 = p65Var3.M();
                if (z11 || objM5 == obj3) {
                    i2 = 0;
                    Object obj12 = new x45() { // from class: o6b
                        @Override // defpackage.x45
                        public final Object invoke(Object obj13) {
                            int i12 = i2;
                            c1e c1eVar = c1e.a;
                            m6b m6bVar2 = m6bVar;
                            Boolean bool = (Boolean) obj13;
                            bool.getClass();
                            switch (i12) {
                                case 0:
                                    m6bVar2.a.g0().h.d("hide_response", bool);
                                    break;
                                default:
                                    m6bVar2.a.g0().h.d("block_author", bool);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var3.j0(obj12);
                    obj2 = obj12;
                } else {
                    i2 = 0;
                    obj2 = objM5;
                }
                z = i2;
                bgf.i(z10, strR5, (x45) obj2, bgf.N(o28Var2, "checkbox_hide_response"), false, p65Var3, 3072);
                p65Var2 = p65Var3;
            } else {
                z = 0;
                p65Var3.Y(-1527164034);
                p65Var2 = p65Var3;
            }
            p65Var2.p(z);
            boolean z12 = x6bVar2.b;
            String strR6 = vo7.R(p65Var2, R.string.report_response_block_author);
            boolean z13 = i7 == 32 ? true : z ? 1 : 0;
            Object objM6 = p65Var2.M();
            Object obj13 = objM6;
            if (z13 || objM6 == obj3) {
                final int i12 = 1;
                Object obj14 = new x45() { // from class: o6b
                    @Override // defpackage.x45
                    public final Object invoke(Object obj132) {
                        int i122 = i12;
                        c1e c1eVar = c1e.a;
                        m6b m6bVar2 = m6bVar;
                        Boolean bool = (Boolean) obj132;
                        bool.getClass();
                        switch (i122) {
                            case 0:
                                m6bVar2.a.g0().h.d("hide_response", bool);
                                break;
                            default:
                                m6bVar2.a.g0().h.d("block_author", bool);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var2.j0(obj14);
                obj13 = obj14;
            }
            p65 p65Var4 = p65Var2;
            bgf.i(z12, strR6, (x45) obj13, bgf.N(o28Var2, "checkbox_block_author"), false, p65Var4, 3072);
            hp7.t(p65Var4, jfc.l(o28Var2, 25.0f));
            tp7.c(0.0f, 0, 7, 0L, p65Var4, null);
            String strN = y30.n(24.0f, R.string.report_response_report_violation, p65Var4, p65Var4, o28Var2);
            boolean z14 = i7 == 32 ? true : z ? 1 : 0;
            Object objM7 = p65Var4.M();
            if (z14 || objM7 == obj3) {
                o28Var = o28Var2;
                Object utaVar = new uta(0, m6bVar, m6b.class, "goToReportViolationScreen", "goToReportViolationScreen()V", 0, 9);
                p65Var4.j0(utaVar);
                obj = utaVar;
            } else {
                o28Var = o28Var2;
                obj = objM7;
            }
            o(3072, 2, p65Var4, (m45) ((qh6) obj), bgf.N(o28Var, "row_report_violation"), strN, null);
            String strR7 = vo7.R(p65Var4, R.string.report_response_read_our_rules_title);
            String strR8 = vo7.R(p65Var4, R.string.report_response_read_our_rules_description);
            boolean z15 = z;
            if (i7 == 32) {
                z15 = true;
            }
            Object objM8 = p65Var4.M();
            if (z15 || objM8 == obj3) {
                Object utaVar2 = new uta(0, m6bVar, m6b.class, "goToMediumRulesScreen", "goToMediumRulesScreen()V", 0, 10);
                p65Var4.j0(utaVar2);
                objM8 = utaVar2;
            }
            o(3072, 0, p65Var4, (m45) ((qh6) objM8), bgf.N(o28Var, "row_rules"), strR7, strR8);
            p65 p65Var5 = p65Var4;
            b09.H(p65Var5, true, true, true);
            p65Var = p65Var5;
        } else {
            p65Var3.S();
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 29, x6bVar2, m6bVar, r28Var);
        }
    }

    public static final void l(vpc vpcVar, bo4 bo4Var, m6b m6bVar, x12 x12Var, int i) {
        p65 p65Var;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-105791986);
        int i2 = i | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(m6bVar) ? 256 : 128);
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i2 & 14);
            nhc nhcVarF = mk7.F(p65Var2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new qna(12);
                p65Var2.j0(objM);
            }
            pr7.b(bgf.N(new l60((x45) objM, false), "report_response_screen"), pxf.E(437557642, new p6b(m6bVar), p65Var2), pxf.E(44558697, new pma(m6bVar, 11, l78VarZ), p65Var2), pxf.E(-348440248, new w87(nhcVarF, 20), p65Var2), null, 0, 0L, 0L, null, pxf.E(-1923290273, new qg9(m6bVar, 15, l78VarZ), p65Var2), p65Var2, 805309872, 496);
            p65Var = p65Var2;
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | p65Var.f(nhcVarF) | p65Var.h(resources) | ((i2 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                rna rnaVar = new rna(bo4Var, nhcVarF, resources, m6bVar, null, 8);
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
            mwaVarS.d = new q6b(i, 0, vpcVar, bo4Var, m6bVar);
        }
    }

    public static final void m(m6b m6bVar, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-517520225);
        int i2 = (p65Var2.f(m6bVar) ? 4 : 2) | i;
        if (p65Var2.P(i2 & 1, (i2 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.report_response_title);
            boolean z = (i2 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new uta(0, m6bVar, m6b.class, "onClose", "onClose()V", 0, 11);
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
            mwaVarS.d = new p6b(m6bVar, i);
        }
    }

    public static final void n(tvb tvbVar, iv9 iv9Var, x12 x12Var, int i) {
        iv9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-16845855);
        int i2 = (p65Var.f(tvbVar) ? 4 : 2) | i | (p65Var.f(iv9Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            long j = ((zo7) p65Var.j(kt7.b)).c;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), flb.a0(o28Var, j, nr5Var), 3, 1.0f);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            m40.p(w2g.F(jfc.d(o28Var, 1.0f), 24.0f, 24.0f, 24.0f, 72.0f), new h70(16.0f, true, new f70(0, z46.p)), new h70(16.0f, false, new f70(1, z46.m)), null, 0, 0, pxf.E(-1471563565, new qg9(tvbVar, 18, iv9Var), p65Var), p65Var, 1573302, 56);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(tvbVar, iv9Var, i, 27);
        }
    }

    public static final void o(int i, int i2, x12 x12Var, m45 m45Var, r28 r28Var, String str, String str2) {
        String str3;
        int i3;
        String str4;
        String str5;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1348236869);
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
                p65Var.Y(1124786628);
                str5 = str6;
                jjd.b(str5, w2g.G(o28Var, 24.0f, 0.0f, 64.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, ((i6 >> 3) & 14) | 48, 0, 131068);
                p65Var = p65Var;
                z = false;
            } else {
                str5 = str6;
                p65Var.Y(1115017319);
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
            mwaVarS.d = new rma(str, str4, m45Var, r28Var, i, i2, 3);
        }
    }

    public static final void q(int i, int i2, r28 r28Var, x12 x12Var, int i3) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(813660673);
        int i4 = (p65Var.d(i) ? 4 : 2) | i3 | (p65Var.d(i2) ? 32 : 16) | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(new h70(16.0f, true, new z10(21)), z46.q, p65Var, 54);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            w2g.e(vn7.J(i, i4 & 14, p65Var), null, null, null, null, 0.0f, null, p65Var, 56, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            jjd.b(vo7.R(p65Var, i2), null, 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 130046);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new voc(i, r28Var2, i2, i3);
        }
    }

    public static final void r(String str, ene eneVar, SourceParameter sourceParameter, obe obeVar, r28 r28Var, x12 x12Var, int i) {
        String str2;
        int i2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1880652957);
        if ((i & 6) == 0) {
            str2 = str;
            i2 = (p65Var2.f(str2) ? 4 : 2) | i;
        } else {
            str2 = str;
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(eneVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.f(sourceParameter) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(obeVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var = p65Var2;
            n01.x((wu4) guc.x(eneVar.a, new wu4(str2, null, EntityType.AUTHOR, bt4.NOT_FOLLOWING, new ag8(null), sourceParameter), p65Var2, 0).getValue(), it4.S, obeVar, null, jfc.q(r28Var, 100.0f, 0.0f, 2), null, null, 0L, p65Var, ((i2 >> 3) & 896) | 48, 232);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(str, eneVar, sourceParameter, obeVar, r28Var, i, 21);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x039b  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x03a7  */
    /* JADX WARN: Removed duplicated region for block: B:105:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.hne r36, defpackage.obe r37, defpackage.r28 r38, boolean r39, defpackage.x12 r40, int r41, int r42) {
        /*
            Method dump skipped, instruction units count: 950
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rr7.s(hne, obe, r28, boolean, x12, int, int):void");
    }

    public static final void t(final String str, fne fneVar, final SourceParameter sourceParameter, final obe obeVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1143220787);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(fneVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(sourceParameter) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(obeVar) ? 2048 : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            l78 l78VarX = guc.x(fneVar.a, d88.NOT_MUTED, p65Var, 48);
            int i3 = mbe.a[((d88) l78VarX.getValue()).ordinal()];
            if (i3 == 1 || i3 == 2) {
                p65Var.Y(876464077);
                boolean z = ((d88) l78VarX.getValue()) == d88.MUTED;
                xn7 xn7Var = xn7.S;
                int i4 = i2 & 7168;
                int i5 = i2 & 14;
                int i6 = i2 & 896;
                boolean z2 = (i4 == 2048) | (i5 == 4) | (i6 == 256);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    final int i7 = 0;
                    objM = new m45() { // from class: lbe
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i8 = i7;
                            c1e c1eVar = c1e.a;
                            SourceParameter sourceParameter2 = sourceParameter;
                            String str2 = str;
                            obe obeVar2 = obeVar;
                            switch (i8) {
                                case 0:
                                    obeVar2.A(sourceParameter2, str2, true);
                                    break;
                                default:
                                    obeVar2.A(sourceParameter2, str2, false);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                boolean z3 = (i5 == 4) | (i4 == 2048) | (i6 == 256);
                Object objM2 = p65Var.M();
                if (z3 || objM2 == uobVar) {
                    final int i8 = 1;
                    objM2 = new m45() { // from class: lbe
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i82 = i8;
                            c1e c1eVar = c1e.a;
                            SourceParameter sourceParameter2 = sourceParameter;
                            String str2 = str;
                            obe obeVar2 = obeVar;
                            switch (i82) {
                                case 0:
                                    obeVar2.A(sourceParameter2, str2, true);
                                    break;
                                default:
                                    obeVar2.A(sourceParameter2, str2, false);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                ok7.c(z, xn7Var, m45Var, (m45) objM2, r28Var, false, p65Var, (i2 & 57344) | 48);
                p65Var.p(false);
            } else {
                if (i3 != 3 && i3 != 4) {
                    throw ho2.L(p65Var, 876461453, false);
                }
                p65Var.Y(876484232);
                hp7.t(p65Var, r28Var);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(str, fneVar, sourceParameter, obeVar, r28Var, i, 22);
        }
    }

    public static void u(igc igcVar, List list, q22 q22Var) {
        if (list.isEmpty()) {
            return;
        }
        int size = list.size();
        for (int i = 0; i < size; i++) {
            int iC = igcVar.c((k65) list.get(i));
            int iM = igcVar.M(igcVar.q(iC), igcVar.b);
            Object obj = iM < igcVar.f(igcVar.q(iC + 1), igcVar.b) ? igcVar.c[igcVar.g(iM)] : w12.a;
            mwa mwaVar = obj instanceof mwa ? (mwa) obj : null;
            if (mwaVar != null) {
                mwaVar.a = q22Var;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x003b -> B:18:0x003e). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object v(defpackage.u4d r7, defpackage.kn0 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.gkb
            if (r0 == 0) goto L13
            r0 = r8
            gkb r0 = (defpackage.gkb) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            gkb r0 = new gkb
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            u4d r7 = r0.b
            defpackage.br7.v(r8)
            goto L3e
        L29:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L30:
            defpackage.br7.v(r8)
        L33:
            r0.b = r7
            r0.d = r3
            java.lang.Object r8 = defpackage.y30.b(r7, r0)
            if (r8 != r1) goto L3e
            return r1
        L3e:
            lb9 r8 = (defpackage.lb9) r8
            int r2 = r8.d
            java.util.List r8 = r8.a
            r2 = r2 & 66
            if (r2 == 0) goto L33
            int r2 = r8.size()
            r4 = 0
            r5 = r4
        L4e:
            if (r5 >= r2) goto L60
            java.lang.Object r6 = r8.get(r5)
            rb9 r6 = (defpackage.rb9) r6
            boolean r6 = defpackage.mq7.u(r6)
            if (r6 != 0) goto L5d
            goto L33
        L5d:
            int r5 = r5 + 1
            goto L4e
        L60:
            java.lang.Object r7 = r8.get(r4)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rr7.v(u4d, kn0):java.lang.Object");
    }

    public static final void w(View view) {
        view.getClass();
        nzb nzbVarF = vn7.F(new cp(view, null, 4));
        while (nzbVarF.hasNext()) {
            ArrayList arrayList = z((View) nzbVarF.next()).a;
            int size = arrayList.size();
            while (true) {
                size--;
                if (-1 < size) {
                    ((xte) arrayList.get(size)).a.e();
                }
            }
        }
    }

    public static final String x(zvd zvdVar) {
        StringBuilder sb = new StringBuilder("type: " + zvdVar);
        sb.append('\n');
        sb.append("hashCode: " + zvdVar.hashCode());
        sb.append('\n');
        sb.append("javaClass: " + zvdVar.getClass().getCanonicalName());
        sb.append('\n');
        for (yv2 yv2VarA = zvdVar.a(); yv2VarA != null; yv2VarA = yv2VarA.h()) {
            sb.append("fqName: ".concat(w83.c.v(yv2VarA)));
            sb.append('\n');
            sb.append("javaClass: " + yv2VarA.getClass().getCanonicalName());
            sb.append('\n');
        }
        return sb.toString();
    }

    public static String y(f21 f21Var) {
        StringBuilder sb = new StringBuilder(f21Var.size());
        for (int i = 0; i < f21Var.size(); i++) {
            byte bD = f21Var.d(i);
            if (bD == 34) {
                sb.append("\\\"");
            } else if (bD == 39) {
                sb.append("\\'");
            } else if (bD != 92) {
                switch (bD) {
                    case 7:
                        sb.append("\\a");
                        break;
                    case 8:
                        sb.append("\\b");
                        break;
                    case 9:
                        sb.append("\\t");
                        break;
                    case 10:
                        sb.append("\\n");
                        break;
                    case 11:
                        sb.append("\\v");
                        break;
                    case 12:
                        sb.append("\\f");
                        break;
                    case 13:
                        sb.append("\\r");
                        break;
                    default:
                        if (bD < 32 || bD > 126) {
                            sb.append('\\');
                            sb.append((char) (((bD >>> 6) & 3) + 48));
                            sb.append((char) (((bD >>> 3) & 7) + 48));
                            sb.append((char) ((bD & 7) + 48));
                        } else {
                            sb.append((char) bD);
                        }
                        break;
                }
            } else {
                sb.append("\\\\");
            }
        }
        return sb.toString();
    }

    public static final vc9 z(View view) {
        vc9 vc9Var = (vc9) view.getTag(R.id.pooling_container_listener_holder_tag);
        if (vc9Var != null) {
            return vc9Var;
        }
        vc9 vc9Var2 = new vc9();
        view.setTag(R.id.pooling_container_listener_holder_tag, vc9Var2);
        return vc9Var2;
    }

    public abstract boolean A();

    public void B(boolean z) {
    }

    public abstract void C(boolean z);

    public big E(String str) {
        p4g p4gVar;
        Charset charset = StandardCharsets.UTF_8;
        mig migVar = (mig) this;
        boolean z = migVar.f;
        int i = migVar.e;
        MessageDigest messageDigest = migVar.d;
        if (z) {
            try {
                p4gVar = new p4g((MessageDigest) messageDigest.clone(), i, 1);
            } catch (CloneNotSupportedException unused) {
                try {
                    p4gVar = new p4g(MessageDigest.getInstance(messageDigest.getAlgorithm()), i, 1);
                } catch (NoSuchAlgorithmException e) {
                    ay0.d(e);
                    return null;
                }
            }
        } else {
            p4gVar = new p4g(MessageDigest.getInstance(messageDigest.getAlgorithm()), i, 1);
        }
        byte[] bytes = str.toString().getBytes(charset);
        bytes.getClass();
        int length = bytes.length;
        jq7.y("Cannot re-use a Hasher after calling hash() on it", !p4gVar.c);
        MessageDigest messageDigest2 = p4gVar.a;
        messageDigest2.update(bytes, 0, length);
        jq7.y("Cannot re-use a Hasher after calling hash() on it", !p4gVar.c);
        p4gVar.c = true;
        int digestLength = messageDigest2.getDigestLength();
        int i2 = p4gVar.b;
        return i2 == digestLength ? new yhg(messageDigest2.digest()) : new yhg(Arrays.copyOf(messageDigest2.digest(), i2));
    }

    public static final void p(int i, x12 x12Var, m45 m45Var, r28 r28Var) {
        int i2;
        p65 p65Var;
        r28 r28Var2;
        m45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-12701210);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = i2 | 48;
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            pb3 pb3Var = new pb3(4);
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.q(o28Var, 0.0f, 280.0f, 1), eoLmc.TzsGCCltV);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new tkc(i4);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            hlg.a((m45) objM, pxf.E(510781998, new c60(23, m45Var), p65Var2), r28VarN, null, null, null, f49.o, null, 0L, 0L, 0L, 0L, pb3Var, p65Var, 1572918, 3072, 8120);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gw5(m45Var, r28Var2, i, 3);
        }
    }
}
