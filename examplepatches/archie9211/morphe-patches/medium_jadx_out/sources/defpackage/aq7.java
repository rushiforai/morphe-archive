package defpackage;

import android.os.Bundle;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.google.android.recaptcha.internal.zzfx;
import com.google.protobuf.InvalidProtocolBufferException;
import com.medium.android.core.models.BillingPeriod;
import com.medium.reader.R;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlinx.coroutines.TimeoutCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class aq7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;

    public static final String A(String str, String str2, m45 m45Var, m45 m45Var2, x45 x45Var) {
        str.getClass();
        str2.getClass();
        x45Var.getClass();
        String str3 = (String) m45Var.invoke();
        String strD = D(str, km4.y(str3, "Mutable"), str2, str3, km4.y(str3, "(Mutable)"));
        if (strD != null) {
            return strD;
        }
        String strD2 = D(str, str3.concat("MutableMap.MutableEntry"), str2, str3.concat("Map.Entry"), str3.concat("(Mutable)Map.(Mutable)Entry"));
        if (strD2 != null) {
            return strD2;
        }
        String str4 = (String) m45Var2.invoke();
        String strD3 = D(str, str4 + ((String) x45Var.invoke("Array<")), str2, str4 + ((String) x45Var.invoke("Array<out ")), str4 + ((String) x45Var.invoke("Array<(out) ")));
        if (strD3 != null) {
            return strD3;
        }
        return null;
    }

    public static final String B(List list) {
        StringBuilder sb = new StringBuilder();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            n98 n98Var = (n98) it2.next();
            if (sb.length() > 0) {
                sb.append(".");
            }
            sb.append(z(n98Var));
        }
        return sb.toString();
    }

    public static final int C(BillingPeriod billingPeriod, boolean z) {
        int i = byc.a[billingPeriod.ordinal()];
        if (i == 1) {
            return z ? R.string.subscription_legal_renewal_price_premium_monthly : R.string.subscription_legal_renewal_price_regular_monthly;
        }
        if (i == 2) {
            return z ? R.string.subscription_legal_renewal_price_premium_yearly : R.string.subscription_legal_renewal_price_regular_yearly;
        }
        ygf.a();
        return 0;
    }

    public static final String D(String str, String str2, String str3, String str4, String str5) {
        b09.I(str, str3, str4);
        if (!tuc.N(str, str2, false) || !tuc.N(str3, str4, false)) {
            return null;
        }
        String strSubstring = str.substring(str2.length());
        String strSubstring2 = str3.substring(str4.length());
        String strConcat = str5.concat(strSubstring);
        if (strSubstring.equals(strSubstring2)) {
            return strConcat;
        }
        if (F(strSubstring, strSubstring2)) {
            return strConcat.concat("!");
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0103 A[LOOP:2: B:32:0x00fd->B:34:0x0103, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0169 A[PHI: r3
      0x0169: PHI (r3v12 boolean) = (r3v14 boolean), (r3v15 boolean) binds: [B:44:0x0167, B:41:0x0163] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0171  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.util.ArrayList E(java.util.List r64, gen.model.SourceParameter r65, boolean r66, boolean r67) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 590
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aq7.E(java.util.List, gen.model.SourceParameter, boolean, boolean):java.util.ArrayList");
    }

    public static final boolean F(String str, String str2) {
        str.getClass();
        str2.getClass();
        if (str.equals(tuc.L(str2, "?", ""))) {
            return true;
        }
        if (tuc.F(str2, "?", false) && str.concat("?").equals(str2)) {
            return true;
        }
        StringBuilder sb = new StringBuilder("(");
        sb.append(str);
        sb.append(")?");
        return sb.toString().equals(str2);
    }

    public static final void G(zxb zxbVar, int i, zda zdaVar) {
        zxb zxbVar2;
        o78 o78Var = new o78(new zxb[16]);
        List listI = zxbVar.i(false, false);
        while (true) {
            o78Var.e(o78Var.c, listI);
            while (true) {
                int i2 = o78Var.c;
                if (i2 == 0) {
                    return;
                }
                zxbVar2 = (zxb) o78Var.m(i2 - 1);
                boolean zH = kng.H(zxbVar2);
                txb txbVar = zxbVar2.d;
                f78 f78Var = txbVar.a;
                if (!zH && !f78Var.c(eyb.j)) {
                    eh8 eh8VarD = zxbVar2.d();
                    if (eh8VarD == null) {
                        throw lv8.v("Expected semantics node to have a coordinator.");
                    }
                    o46 o46VarC0 = g76.c0(sgg.B(eh8VarD, true));
                    if (o46VarC0.a < o46VarC0.c && o46VarC0.b < o46VarC0.d) {
                        Object objG = txbVar.a.g(sxb.e);
                        if (objG == null) {
                            objG = null;
                        }
                        b55 b55Var = (b55) objG;
                        Object objG2 = f78Var.g(eyb.w);
                        lrb lrbVar = (lrb) (objG2 != null ? objG2 : null);
                        if (b55Var == null || lrbVar == null || ((Number) lrbVar.b.invoke()).floatValue() <= 0.0f) {
                            break;
                        }
                        int i3 = 1 + i;
                        zdaVar.invoke(new mrb(zxbVar2, i3, o46VarC0, eh8VarD));
                        G(zxbVar2, i3, zdaVar);
                    }
                }
            }
            listI = zxbVar2.i(false, false);
        }
    }

    public static final zzfx H(Exception exc, zzfx zzfxVar) {
        return exc instanceof TimeoutCancellationException ? new zzfx(d87.T0, d87.f, exc.getMessage(), 8) : exc instanceof zzfx ? (zzfx) exc : zzfxVar;
    }

    public static final void a(String str, r28 r28Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-900755440);
        int i2 = i | (p65Var2.f(str) ? 4 : 2);
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            p65Var = p65Var2;
            jjd.b(str, jfc.d(w2g.G(r28Var, 12.0f, 16.0f, 12.0f, 0.0f, 8), 1.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).n, p65Var, i2 & 14, 0, 131068);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var, i, 5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:70:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(final defpackage.bq7 r22, final defpackage.m45 r23, defpackage.r28 r24, long r25, long r27, defpackage.x12 r29, final int r30, final int r31) {
        /*
            Method dump skipped, instruction units count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aq7.b(bq7, m45, r28, long, long, x12, int, int):void");
    }

    public static final void c(r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(790527681);
        int i3 = 4;
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                k49 k49Var = new k49(null, y3b.h);
                p65Var.j0(k49Var);
                objM = k49Var;
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 10);
                p65Var.j0(objM2);
            }
            m45 m45Var = (m45) objM2;
            hd9 hd9Var = n23.a;
            uo0 uo0VarV = gsa.V(g76.c, p65Var, 6);
            k40.d(new o10[]{ihd.b.a(s42.Z(m45Var, p65Var, 2)), ihd.a.a(uo0VarV)}, pxf.E(1070596993, new d98(r28Var, l78Var, mz1Var, uo0VarV, m45Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new us(r28Var, mz1Var, i, i3);
        }
    }

    public static final void d(r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(155925518);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(r28Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        int i3 = 3;
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = p65Var.j(ihd.a) != null;
            boolean z2 = p65Var.j(ihd.b) != null;
            if (z && z2) {
                p65Var.Y(-1977187922);
                zk7 zk7VarC = dy0.c(z46.d, true);
                long j = p65Var.T;
                int i4 = (int) (j ^ (j >>> 32));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, r28Var);
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
                mz1Var.invoke(p65Var, Integer.valueOf((i2 >> 3) & 14));
                p65Var.p(true);
                p65Var.p(false);
            } else if (z) {
                p65Var.Y(-1976997706);
                s42.C(r28Var, mz1Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var.p(false);
            } else if (z2) {
                p65Var.Y(-1976846922);
                n23.d(r28Var, mz1Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var.p(false);
            } else {
                p65Var.Y(-1976716505);
                c(r28Var, mz1Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new us(r28Var, mz1Var, i, i3);
        }
    }

    public static final void e(boolean z, String str, m45 m45Var, r28 r28Var, x12 x12Var, int i) {
        int i2;
        str.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1095620317);
        if ((i & 6) == 0) {
            i2 = (p65Var.g(z) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(m45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            r28 r28VarQ = hlg.Q(jfc.d(r28Var, 1.0f), z, new vkb(3), m45Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarQ);
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
            o28 o28Var = o28.b;
            int i4 = i2 >> 3;
            mr7.a(z, m45Var, w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), false, null, null, p65Var, (i2 & 14) | 384 | (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 56);
            jjd.b(str, w2g.G(o28Var, 4.0f, 0.0f, 24.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, (i4 & 14) | 48, 0, 131068);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b41(z, str, m45Var, r28Var, i);
        }
    }

    public static final void f(mz1 mz1Var, mz1 mz1Var2, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1638052976);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.h(mz1Var2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            r28 r28VarN = bgf.N(r28Var, "shared_width_row");
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new l6c(mz1Var, i3, mz1Var2);
                p65Var.j0(objM);
            }
            f76.u(r28VarN, (b55) objM, p65Var, 0, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 1, mz1Var, mz1Var2, r28Var);
        }
    }

    public static final void g(nzc nzcVar, hu7 hu7Var, lyc lycVar, r28 r28Var, x12 x12Var, int i) {
        String strT;
        lycVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(473002661);
        int i2 = i | (p65Var.f(nzcVar) ? 4 : 2) | (p65Var.f(hu7Var) ? 32 : 16) | (p65Var.f(lycVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i3 = (int) ((j >>> 32) ^ j);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
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
            k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(-600709201, new l6c(lycVar, 7, hu7Var), p65Var), p65Var, 56);
            boolean z = nzcVar instanceof hzc;
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(1507017034);
                hzc hzcVar = (hzc) nzcVar;
                BillingPeriod billingPeriod = hzcVar.a;
                String str = hzcVar.b;
                String str2 = hzcVar.c;
                String strQ = vo7.Q(C(billingPeriod, false), new Object[]{str}, p65Var);
                p65Var.Y(2110657124);
                String strQ2 = vo7.Q(R.string.subscription_legal_price_clause_join, new Object[]{strQ, vo7.Q(C(billingPeriod, true), new Object[]{str2}, p65Var)}, p65Var);
                p65Var.p(false);
                a(vo7.Q(R.string.subscription_legal_details_free_trial, new Object[]{strQ2}, p65Var), bgf.N(o28Var, "legal_details_text_all_offers_free_trial"), p65Var, 48);
                p65Var.p(false);
            } else if (nzcVar instanceof izc) {
                p65Var.Y(1507670359);
                String strR = vo7.R(p65Var, R.string.subscription_legal_intro_prefix);
                izc izcVar = (izc) nzcVar;
                BillingPeriod billingPeriod2 = izcVar.a;
                String strT2 = t(billingPeriod2, vo7.R(p65Var, R.string.subscription_legal_membership_name_regular), izcVar.b, p65Var);
                lzc lzcVar = izcVar.c;
                if (lzcVar == null) {
                    p65Var.Y(1508102343);
                    p65Var.p(false);
                    strT = null;
                } else {
                    p65Var.Y(1508102344);
                    strT = t(billingPeriod2, vo7.R(p65Var, R.string.subscription_legal_membership_name_premium), lzcVar, p65Var);
                    p65Var.p(false);
                }
                a(b09.y(strR, "\n\n", bu1.F0(k80.s0(new String[]{strT2, strT}), " ", null, null, null, 62)), bgf.N(o28Var, "legal_details_text_intro_offer"), p65Var, 48);
                p65Var.p(false);
            } else {
                if (!(nzcVar instanceof mzc)) {
                    throw ho2.L(p65Var, -644124801, false);
                }
                p65Var.Y(-644064330);
                a(vo7.R(p65Var, R.string.subscription_legal_details_text_control), bgf.N(o28Var, "legal_detail_text_control"), p65Var, 48);
                p65Var.p(false);
            }
            a(vo7.R(p65Var, R.string.subscription_legal_disclosure_text_control), bgf.N(o28Var, "legal_disclosure_text_control"), p65Var, 48);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 9, nzcVar, hu7Var, lycVar, r28Var);
        }
    }

    public static void h(pv8 pv8Var, String str, String str2, Bundle bundle, ov8 ov8Var) {
        pv8Var.getClass();
        str.getClass();
        str2.getClass();
        int i = nv8.a[r(pv8Var, str).ordinal()];
        if (i == 1) {
            bundle.putCharSequence(str, str2);
            return;
        }
        if (i == 2) {
            ov8Var.a(pv8Var, str, str2);
        } else {
            if (i != 3) {
                return;
            }
            ov8Var.a(pv8Var, str, str2);
            bundle.putCharSequence(str, str2);
        }
    }

    public static f09 i(pv8 pv8Var, String str, String str2, Bundle bundle, ov8 ov8Var) {
        pv8Var.getClass();
        int i = nv8.a[r(pv8Var, str).ordinal()];
        if (i == 1) {
            if (bundle == null) {
                bundle = new Bundle();
            }
            bundle.putCharSequence(str, str2);
        } else if (i == 2) {
            if (ov8Var == null) {
                ov8Var = new ov8();
            }
            ov8Var.a(pv8Var, str, str2);
        } else if (i == 3) {
            if (ov8Var == null) {
                ov8Var = new ov8();
            }
            if (bundle == null) {
                bundle = new Bundle();
            }
            ov8Var.a(pv8Var, str, str2);
            bundle.putCharSequence(str, str2);
        }
        return new f09(bundle, ov8Var);
    }

    public static final Object j(jrg jrgVar, p92 p92Var) {
        if (!jrgVar.j()) {
            x51 x51Var = new x51(1, pwd.Q(p92Var));
            x51Var.s();
            jrgVar.b(bf3.b, new zg2(x51Var));
            return x51Var.q();
        }
        Exception excH = jrgVar.h();
        if (excH != null) {
            throw excH;
        }
        if (!jrgVar.d) {
            return jrgVar.i();
        }
        throw new CancellationException("Task " + jrgVar + " was cancelled normally.");
    }

    public static final String k(BillingPeriod billingPeriod, String str, x12 x12Var) {
        int i = byc.a[billingPeriod.ordinal()];
        if (i == 1) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(377046853);
            String strQ = vo7.Q(R.string.subscription_legal_price_per_month, new Object[]{str}, p65Var);
            p65Var.p(false);
            return strQ;
        }
        if (i != 2) {
            throw ho2.L((p65) x12Var, 377045217, false);
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(377049896);
        p65Var2.p(false);
        return str;
    }

    public static void l(String str, Object obj) {
        if (obj != null) {
            return;
        }
        z72.c(str);
    }

    public static String n(ByteBuffer byteBuffer, int i, int i2) throws InvalidProtocolBufferException {
        if ((i | i2 | ((byteBuffer.limit() - i) - i2)) < 0) {
            throw new ArrayIndexOutOfBoundsException(String.format("buffer limit=%d, index=%d, limit=%d", Integer.valueOf(byteBuffer.limit()), Integer.valueOf(i), Integer.valueOf(i2)));
        }
        int i3 = i + i2;
        char[] cArr = new char[i2];
        int i4 = 0;
        while (i < i3) {
            byte b2 = byteBuffer.get(i);
            if (b2 < 0) {
                break;
            }
            i++;
            cArr[i4] = (char) b2;
            i4++;
        }
        int i5 = i4;
        while (i < i3) {
            int i6 = i + 1;
            byte b3 = byteBuffer.get(i);
            if (b3 >= 0) {
                int i7 = i5 + 1;
                cArr[i5] = (char) b3;
                while (i6 < i3) {
                    byte b4 = byteBuffer.get(i6);
                    if (b4 < 0) {
                        break;
                    }
                    i6++;
                    cArr[i7] = (char) b4;
                    i7++;
                }
                i5 = i7;
                i = i6;
            } else if (b3 < -32) {
                if (i6 >= i3) {
                    throw InvalidProtocolBufferException.b();
                }
                i += 2;
                tp7.t(b3, byteBuffer.get(i6), cArr, i5);
                i5++;
            } else if (b3 < -16) {
                if (i6 >= i3 - 1) {
                    throw InvalidProtocolBufferException.b();
                }
                int i8 = i + 2;
                i += 3;
                tp7.s(b3, byteBuffer.get(i6), byteBuffer.get(i8), cArr, i5);
                i5++;
            } else {
                if (i6 >= i3 - 2) {
                    throw InvalidProtocolBufferException.b();
                }
                byte b5 = byteBuffer.get(i6);
                int i9 = i + 3;
                byte b6 = byteBuffer.get(i + 2);
                i += 4;
                tp7.r(b3, b5, b6, byteBuffer.get(i9), cArr, i5);
                i5 += 2;
            }
        }
        return new String(cArr, 0, i5);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object q(defpackage.pv8 r2, java.lang.String r3, android.os.Bundle r4, defpackage.ov8 r5) {
        /*
            r2.getClass()
            r3.getClass()
            r0 = 0
            if (r5 == 0) goto L1f
            java.util.LinkedHashMap r5 = r5.a
            boolean r1 = r5.containsKey(r2)
            if (r1 != 0) goto L12
            goto L1f
        L12:
            java.lang.Object r2 = r5.get(r2)
            java.util.Map r2 = (java.util.Map) r2
            if (r2 == 0) goto L1f
            java.lang.Object r2 = r2.get(r3)
            goto L20
        L1f:
            r2 = r0
        L20:
            if (r4 == 0) goto L26
            java.lang.CharSequence r0 = r4.getCharSequence(r3)
        L26:
            if (r2 != 0) goto L29
            return r0
        L29:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aq7.q(pv8, java.lang.String, android.os.Bundle, ov8):java.lang.Object");
    }

    public static p39 r(pv8 pv8Var, String str) {
        pv8Var.getClass();
        str.getClass();
        Map map = ov8.b;
        f09 f09Var = (f09) map.get(pv8Var);
        Set set = f09Var != null ? (Set) f09Var.a : null;
        f09 f09Var2 = (f09) map.get(pv8Var);
        Set set2 = f09Var2 != null ? (Set) f09Var2.b : null;
        return (set == null || !set.contains(str)) ? (set2 == null || !set2.contains(str)) ? p39.CustomData : p39.CustomAndOperationalData : p39.OperationalData;
    }

    public static final String t(BillingPeriod billingPeriod, String str, lzc lzcVar, x12 x12Var) {
        String strQ;
        if (!(lzcVar instanceof jzc)) {
            if (!(lzcVar instanceof kzc)) {
                throw ho2.L((p65) x12Var, -1287513490, false);
            }
            p65 p65Var = (p65) x12Var;
            p65Var.Y(-1287498736);
            String strQ2 = vo7.Q(R.string.subscription_legal_membership_auto_renew, new Object[]{str, k(billingPeriod, ((kzc) lzcVar).a, p65Var)}, p65Var);
            p65Var.p(false);
            return strQ2;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(-1287509984);
        jzc jzcVar = (jzc) lzcVar;
        String strK = k(billingPeriod, jzcVar.a, p65Var2);
        String str2 = jzcVar.b;
        int i = byc.a[billingPeriod.ordinal()];
        if (i == 1) {
            p65Var2.Y(10660301);
            strQ = vo7.Q(R.string.subscription_legal_price_per_month, new Object[]{str2}, p65Var2);
            p65Var2.p(false);
        } else {
            if (i != 2) {
                throw ho2.L(p65Var2, 10658725, false);
            }
            p65Var2.Y(10663404);
            strQ = vo7.Q(R.string.subscription_legal_price_per_year, new Object[]{str2}, p65Var2);
            p65Var2.p(false);
        }
        String strQ3 = vo7.Q(R.string.subscription_legal_membership_introductory, new Object[]{str, strK, strQ}, p65Var2);
        p65Var2.p(false);
        return strQ3;
    }

    public static ilc u(String str, String str2, String str3, String str4) {
        return new ilc(str, n98.e(str2), str3, str4);
    }

    public static long x(int i, int i2, int i3, int i4) {
        return (((long) (i2 & 32767)) << 15) | ((long) (i & 32767)) | (((long) (i3 & 32767)) << 30) | (((long) (i4 & 32767)) << 45) | Long.MIN_VALUE;
    }

    public static final String z(n98 n98Var) {
        n98Var.getClass();
        String strB = n98Var.b();
        strB.getClass();
        if (!dl6.a.contains(strB)) {
            int i = 0;
            while (true) {
                if (i < strB.length()) {
                    char cCharAt = strB.charAt(i);
                    if (!Character.isLetterOrDigit(cCharAt) && cCharAt != '_') {
                        break;
                    }
                    i++;
                } else if (strB.length() != 0 && Character.isJavaIdentifierStart(strB.codePointAt(0))) {
                    String strB2 = n98Var.b();
                    strB2.getClass();
                    return strB2;
                }
            }
        }
        String strB3 = n98Var.b();
        strB3.getClass();
        return "`".concat(strB3).concat("`");
    }

    public abstract String m(byte[] bArr, int i, int i2);

    public abstract String o(ByteBuffer byteBuffer, int i, int i2);

    public abstract int p(String str, byte[] bArr, int i, int i2);

    public boolean s(byte[] bArr, int i, int i2) {
        return y(bArr, i, i2) == 0;
    }

    public abstract void v();

    public abstract void w();

    public abstract int y(byte[] bArr, int i, int i2);
}
