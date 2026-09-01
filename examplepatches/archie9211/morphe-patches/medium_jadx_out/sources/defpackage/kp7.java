package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.os.Build;
import android.os.Bundle;
import android.text.Spannable;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.LocaleSpan;
import android.text.style.RelativeSizeSpan;
import android.view.View;
import android.view.ViewTreeObserver;
import androidx.credentials.exceptions.CreateCredentialException;
import com.apollographql.apollo.exception.CacheMissException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.core.share.PostShareData;
import com.medium.android.graphql.type.ResponseSortType;
import com.medium.android.postpage.share.a;
import com.medium.reader.R;
import com.squareup.wire.internal.MathMethodsKt;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kp7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    public static final void A(Spannable spannable, long j, m73 m73Var, int i, int i2) {
        long jB = qkd.b(j);
        if (rkd.a(jB, 4294967296L)) {
            spannable.setSpan(new AbsoluteSizeSpan(nk7.w0(m73Var.p0(j)), false), i, i2, 33);
        } else if (rkd.a(jB, 8589934592L)) {
            spannable.setSpan(new RelativeSizeSpan(qkd.c(j)), i, i2, 33);
        }
    }

    public static final void B(Spannable spannable, h67 h67Var, int i, int i2) {
        LocaleSpan localeSpan;
        if (h67Var != null) {
            List list = h67Var.a;
            if (Build.VERSION.SDK_INT >= 24) {
                ArrayList arrayList = new ArrayList(cu1.k0(h67Var, 10));
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((f67) it2.next()).a);
                }
                Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
                localeSpan = cm0.b(cm0.a((Locale[]) Arrays.copyOf(localeArr, localeArr.length)));
            } else {
                localeSpan = new LocaleSpan((list.isEmpty() ? ka9.a.f().d() : h67Var.d()).a);
            }
            spannable.setSpan(localeSpan, i, i2, 33);
        }
    }

    public static void C(Activity activity) {
        View viewE;
        int iHashCode = activity.hashCode();
        HashMap map = null;
        if (!ec2.a.contains(a08.class)) {
            try {
                map = a08.e;
            } catch (Throwable th) {
                ec2.a(a08.class, th);
            }
        }
        Integer numValueOf = Integer.valueOf(iHashCode);
        Object a08Var = map.get(numValueOf);
        if (a08Var == null) {
            a08Var = new a08(activity);
            map.put(numValueOf, a08Var);
        }
        a08 a08Var2 = (a08) a08Var;
        Set set = ec2.a;
        if (set.contains(a08.class)) {
            return;
        }
        try {
        } catch (Throwable th2) {
            ec2.a(a08.class, th2);
        }
        if (set.contains(a08Var2)) {
            return;
        }
        try {
            if (!a08Var2.d.getAndSet(true) && (viewE = r40.E((Activity) a08Var2.c.get())) != null) {
                ViewTreeObserver viewTreeObserver = viewE.getViewTreeObserver();
                if (viewTreeObserver.isAlive()) {
                    viewTreeObserver.addOnGlobalFocusChangeListener(a08Var2);
                    return;
                }
                return;
                ec2.a(a08.class, th2);
            }
        } catch (Throwable th3) {
            ec2.a(a08Var2, th3);
        }
    }

    public static final String D(ResponseSortType responseSortType, x12 x12Var) {
        int i = ofb.a[responseSortType.ordinal()];
        if (i == 1 || i == 2) {
            p65 p65Var = (p65) x12Var;
            return km4.w(p65Var, -894729441, R.string.response_sorting_item_most_relevant, p65Var, false);
        }
        if (i == 3) {
            p65 p65Var2 = (p65) x12Var;
            return km4.w(p65Var2, -894726275, R.string.response_sorting_item_most_recent, p65Var2, false);
        }
        p65 p65Var3 = (p65) x12Var;
        p65Var3.Y(-894723995);
        p65Var3.p(false);
        rd6.s("SortType: ", responseSortType, " is not supported");
        return null;
    }

    public static final k44 E(y21 y21Var, c8 c8Var, yl2 yl2Var, l44 l44Var) {
        y21Var.getClass();
        c8Var.getClass();
        yl2Var.getClass();
        LinkedHashMap linkedHashMap = y21Var.a;
        ey3 ey3Var = ey3.a;
        Object objA = y21Var.a(linkedHashMap.get(ey3Var), ey3Var);
        objA.getClass();
        sh7 sh7Var = new sh7((Map) objA);
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        linkedHashMap2.putAll(yl2Var.c);
        Set set = yl2Var.b;
        Map map = l44Var.a;
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            if (g76.L(entry.getValue(), Boolean.FALSE)) {
                linkedHashMap3.put(entry.getKey(), entry.getValue());
            }
        }
        return (k44) c8Var.fromJson(sh7Var, new yl2(linkedHashMap2, linkedHashMap3.keySet(), set));
    }

    public static final String F(vqf vqfVar) {
        int iZza = vqfVar.zza();
        return b09.A(new StringBuilder(String.valueOf(iZza).length() + 1), iZza, "c");
    }

    public static boolean G(byte b2) {
        return b2 > -65;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:43:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final java.lang.String r14, final defpackage.hl0 r15, defpackage.r28 r16, defpackage.xd r17, defpackage.w82 r18, float r19, int r20, defpackage.m3c r21, defpackage.x12 r22, final int r23, final int r24) {
        /*
            Method dump skipped, instruction units count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kp7.a(java.lang.String, hl0, r28, xd, w82, float, int, m3c, x12, int, int):void");
    }

    public static final void b(final kra kraVar, final ek8 ek8Var, x12 x12Var, int i) {
        String str = kraVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(391431689);
        int i2 = (p65Var.f(kraVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = kraVar.a;
            String str2 = kraVar.e;
            kx kxVarW = ho2.w(p65Var, -1791249865);
            String strQ = vo7.Q(R.string.notification_type_quote_simple, new Object[]{str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_quote);
                mz1 mz1VarE = pxf.E(-667545520, new so1(29, kraVar), p65Var);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: lra
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            kra kraVar2 = kraVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.j(kraVar2.f, kraVar2.l);
                                    break;
                                default:
                                    ek8Var2.k(kraVar2.c, kraVar2.l);
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
                    objM2 = new m45() { // from class: lra
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            kra kraVar2 = kraVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.j(kraVar2.f, kraVar2.l);
                                    break;
                                default:
                                    ek8Var2.k(kraVar2.c, kraVar2.l);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.g(z, str2, numValueOf, mxVarC, mz1VarE, 2, m45Var, (m45) objM2, p65Var, 221184, 0);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(kraVar, ek8Var, i, 3);
        }
    }

    public static final void c(List list, ResponseSortType responseSortType, x45 x45Var, r28 r28Var, x12 x12Var, int i) {
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1048688616);
        int i2 = i | (p65Var.h(list) ? 4 : 2) | (p65Var.d(responseSortType.ordinal()) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            amb ambVarA = bmb.a(100.0f);
            r28 r28VarN = bgf.N(r28Var, "response_sorting_item");
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
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var.j(sn3Var)).z;
            o28 o28Var = o28.b;
            r28 r28VarR2 = jfc.r(jfc.d(r40.y(bo.B(o28Var, 1.0f, j2, ambVarA), ambVarA), 1.0f), 3);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new z7b(l78Var, 9);
                p65Var.j0(objM2);
            }
            r28 r28VarR3 = hlg.r(r28VarR2, false, null, null, (m45) objM2, 15);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarR3);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            jjd.b(D(responseSortType, p65Var), bgf.N(w2g.G(o28Var, 20.0f, 10.0f, 0.0f, 10.0f, 4).b(new sq6(1.0f, true)), "response_sorting_item_text"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).n, p65Var, 0, 0, 131068);
            qv5.b(vn7.J(R.drawable.ic_baseline_arrow_drop_down_24, 0, p65Var), null, w2g.G(o28Var, 0.0f, 10.0f, 16.0f, 10.0f, 1), ((zo7) p65Var.j(sn3Var)).n, p65Var, 56, 0);
            p65Var.p(true);
            p65Var.p(true);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(8.0f)) & 4294967295L) | (((long) Float.floatToRawIntBits(0.0f)) << 32);
            hd9 hd9Var = new hd9(14);
            r28 r28VarN2 = bgf.N(jfc.r(jfc.d(o28Var, 1.0f), 3), "response_sorting_item_dropdown");
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new z7b(l78Var, 10);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, r28VarN2, jFloatToRawIntBits, null, hd9Var, null, 0L, 0.0f, pxf.E(352888151, new gab(list, x45Var, l78Var, 2), p65Var), p65Var, 200112, 2000);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 1, list, responseSortType, x45Var, r28Var);
        }
    }

    public static final void d(int i, String str, String str2, m45 m45Var, String str3, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1739654675);
        int i3 = i2 | (p65Var.d(i) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(str2) ? 256 : 128) | (p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            r28 r28VarF = w2g.F(bgf.N(hlg.r(r40.y(jfc.k(), bmb.a(4.0f)), false, str2, new vkb(0), m45Var, 9), str3), 12.0f, 21.0f, 12.0f, 21.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarF);
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
            c09 c09VarJ = vn7.J(i, i3 & 14, p65Var);
            o28 o28Var = o28.b;
            qv5.b(c09VarJ, null, jfc.l(o28Var, 24.0f), ((zo7) p65Var.j(kt7.b)).n, p65Var, 440, 0);
            hp7.t(p65Var, jfc.e(o28Var, 8.0f));
            jjd.b(str, null, 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 2, 2, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, (i3 >> 3) & 14, 221568, 76798);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, str, str2, m45Var, str3, i2);
        }
    }

    public static final void e(h6c h6cVar, w5c w5cVar, m45 m45Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        o28 o28Var;
        int i3;
        uob uobVar;
        int i4;
        boolean z;
        w5c w5cVar2;
        boolean z2;
        h6cVar.getClass();
        w5cVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1808219087);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(h6cVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.f(w5cVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        int i5 = i2;
        if (p65Var2.P(i5 & 1, (i5 & 147) != 146)) {
            o28 o28Var2 = o28.b;
            r28 r28VarV = wgf.v(jfc.d(o28Var2, 1.0f), wgf.K(p65Var2));
            omb ombVarA = nmb.a(qb8.e, z46.m, p65Var2, 6);
            long j = p65Var2.T;
            int i6 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarV);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            String strN = y30.n(16.0f, R.string.share_post_cta_copy_link, p65Var2, p65Var2, o28Var2);
            String strR = vo7.R(p65Var2, R.string.share_post_cta_copy_link);
            int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i7 == 32;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                o28Var = o28Var2;
                i3 = i7;
                uobVar = uobVar2;
                j5c j5cVar = new j5c(0, w5cVar, w5c.class, "onCopyLinkClicked", "onCopyLinkClicked()V", 0, 6);
                p65Var2.j0(j5cVar);
                objM = j5cVar;
            } else {
                o28Var = o28Var2;
                i3 = i7;
                uobVar = uobVar2;
            }
            d(R.drawable.ic_link_24, strN, strR, (m45) ((qh6) objM), "copy_link", p65Var2, 24576);
            if (h6cVar.f) {
                p65Var2.Y(10261172);
                String strR2 = vo7.R(p65Var2, R.string.share_post_cta_friend_link);
                String strR3 = vo7.R(p65Var2, R.string.share_post_cta_friend_link);
                boolean z4 = i3 == 32;
                Object objM2 = p65Var2.M();
                if (z4 || objM2 == uobVar) {
                    i4 = -10486291;
                    objM2 = new j5c(0, w5cVar, w5c.class, "onShareFriendLinkClicked", "onShareFriendLinkClicked()V", 0, 7);
                    p65Var2.j0(objM2);
                } else {
                    i4 = -10486291;
                }
                d(R.drawable.ic_friend_link, strR2, strR3, (m45) ((qh6) objM2), "friend_link", p65Var2, 24576);
                z = false;
            } else {
                i4 = -10486291;
                z = false;
                p65Var2.Y(-10486291);
            }
            p65Var2.p(z);
            String strR4 = vo7.R(p65Var2, R.string.share_post_cta_share_link_via);
            String strR5 = vo7.R(p65Var2, R.string.share_post_cta_share_link_via);
            boolean z5 = i3 == 32;
            Object objM3 = p65Var2.M();
            if (z5 || objM3 == uobVar) {
                objM3 = new j5c(0, w5cVar, w5c.class, "onShareLinkClicked", "onShareLinkClicked()V", 0, 8);
                w5cVar2 = w5cVar;
                p65Var2.j0(objM3);
            } else {
                w5cVar2 = w5cVar;
            }
            d(R.drawable.ic_share_24, strR4, strR5, (m45) ((qh6) objM3), "share_link", p65Var2, 24576);
            String strR6 = vo7.R(p65Var2, R.string.share_post_cta_share_image_via);
            String strR7 = vo7.R(p65Var2, R.string.share_post_cta_share_image_via);
            boolean z6 = ((i5 & 896) == 256) | (i3 == 32);
            Object objM4 = p65Var2.M();
            if (z6 || objM4 == uobVar) {
                objM4 = new nbb(w5cVar2, 6, m45Var);
                p65Var2.j0(objM4);
            }
            d(R.drawable.ic_editor_image, strR6, strR7, (m45) objM4, "share_image", p65Var2, 24576);
            String strR8 = vo7.R(p65Var2, R.string.share_post_cta_save_image);
            String strR9 = vo7.R(p65Var2, R.string.share_post_cta_save_image);
            boolean z7 = i3 == 32;
            Object objM5 = p65Var2.M();
            if (z7 || objM5 == uobVar) {
                objM5 = new j5c(0, w5cVar, w5c.class, "onSaveImageClicked", "onSaveImageClicked()V", 0, 9);
                p65Var2.j0(objM5);
            }
            d(R.drawable.ic_download_24, strR8, strR9, (m45) ((qh6) objM5), "save_image", p65Var2, 24576);
            if (h6cVar.d) {
                p65Var2.Y(11709244);
                String strR10 = vo7.R(p65Var2, R.string.share_post_cta_instagram_stories);
                String strR11 = vo7.R(p65Var2, R.string.share_post_cta_instagram_stories);
                boolean z8 = i3 == 32;
                Object objM6 = p65Var2.M();
                if (z8 || objM6 == uobVar) {
                    objM6 = new j5c(0, w5cVar, w5c.class, "onShareToInstagramStoriesClicked", "onShareToInstagramStoriesClicked()V", 0, 10);
                    p65Var2.j0(objM6);
                }
                p65Var = p65Var2;
                d(R.drawable.ic_instagram, strR10, strR11, (m45) ((qh6) objM6), "instagram_stories", p65Var, 24576);
                z2 = false;
            } else {
                p65Var = p65Var2;
                z2 = false;
                p65Var.Y(i4);
            }
            p65Var.p(z2);
            lv8.y(o28Var, 16.0f, p65Var, true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i, 0, h6cVar, w5cVar, m45Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13 */
    /* JADX WARN: Type inference failed for: r11v16 */
    /* JADX WARN: Type inference failed for: r13v10 */
    /* JADX WARN: Type inference failed for: r13v11 */
    /* JADX WARN: Type inference failed for: r13v12 */
    /* JADX WARN: Type inference failed for: r13v13 */
    /* JADX WARN: Type inference failed for: r13v2, types: [p65] */
    /* JADX WARN: Type inference failed for: r13v4, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r13v8, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r13v9, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r2v47 */
    /* JADX WARN: Type inference failed for: r2v48, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r2v50 */
    /* JADX WARN: Type inference failed for: r5v13, types: [x12] */
    /* JADX WARN: Type inference failed for: r7v23 */
    /* JADX WARN: Type inference failed for: r7v24 */
    /* JADX WARN: Type inference failed for: r7v28 */
    public static final void f(h6c h6cVar, nhc nhcVar, w5c w5cVar, b55 b55Var, x45 x45Var, x45 x45Var2, r28 r28Var, x12 x12Var, int i, int i2) {
        int i3;
        b55 b55Var2;
        x45 x45Var3;
        r28 r28Var2;
        r28 r28Var3;
        ?? r13;
        uob uobVar;
        int i4;
        of5 of5Var;
        boolean z;
        Object obj;
        c6c c6cVar;
        int i5;
        Object obj2;
        rz5 rz5Var;
        r28 r28Var4;
        boolean z2;
        int i6;
        int i7;
        h6c h6cVar2;
        d13 d13Var;
        ?? r132;
        ?? r11;
        ?? r2;
        Object obj3;
        Object obj4;
        h6cVar.getClass();
        List list = h6cVar.c;
        nhcVar.getClass();
        w5cVar.getClass();
        b55Var.getClass();
        x45Var.getClass();
        x45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(650813789);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(h6cVar) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.f(nhcVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= p65Var.f(w5cVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            b55Var2 = b55Var;
            i3 |= p65Var.h(b55Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            b55Var2 = b55Var;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var.h(x45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            x45Var3 = x45Var2;
            i3 |= p65Var.h(x45Var3) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            x45Var3 = x45Var2;
        }
        int i8 = i2 & 64;
        if (i8 != 0) {
            i3 |= 1572864;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            if ((i & 1572864) == 0) {
                i3 |= p65Var.f(r28Var2) ? 1048576 : 524288;
            }
        }
        if (p65Var.P(i3 & 1, (i3 & 599187) != 599186)) {
            o28 o28Var = o28.b;
            if (i8 != 0) {
                r28Var2 = o28Var;
            }
            Context context = (Context) p65Var.j(eo.b);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            Object obj5 = objM;
            if (objM == uobVar2) {
                sb2 sb2VarM = kyd.M(p65Var);
                p65Var.j0(sb2VarM);
                obj5 = sb2VarM;
            }
            sb2 sb2Var = (sb2) obj5;
            int i9 = sf5.b;
            lf5 lf5Var = (lf5) p65Var.j(z22.g);
            Object objM2 = p65Var.M();
            Object obj6 = objM2;
            if (objM2 == uobVar2) {
                mf5 mf5Var = new mf5(lf5Var);
                p65Var.j0(mf5Var);
                obj6 = mf5Var;
            }
            of5 of5Var2 = ((mf5) obj6).b;
            Object objM3 = p65Var.M();
            Object obj7 = objM3;
            if (objM3 == uobVar2) {
                k49 k49VarU = qo7.u(null);
                p65Var.j0(k49VarU);
                obj7 = k49VarU;
            }
            l78 l78Var = (l78) obj7;
            g7 g7Var = new g7(3);
            int i10 = i3 & 57344;
            boolean z3 = i10 == 16384;
            Object objM4 = p65Var.M();
            Object obj8 = objM4;
            if (z3 || objM4 == uobVar2) {
                rp1 rp1Var = new rp1(l78Var, x45Var);
                p65Var.j0(rp1Var);
                obj8 = rp1Var;
            }
            ug7 ug7VarT = sgg.T(g7Var, (x45) obj8, p65Var, 0);
            int i11 = i3;
            boolean z4 = (i10 == 16384) | ((i3 & 7168) == 2048) | ((i3 & 896) == 256) | ((i11 & 458752) == 131072);
            Object objM5 = p65Var.M();
            if (z4 || objM5 == uobVar2) {
                uobVar = uobVar2;
                b55 b55Var3 = b55Var2;
                i4 = i11;
                of5Var = of5Var2;
                z = false;
                c6c c6cVar2 = new c6c(w5cVar, sb2Var, b55Var3, of5Var, context, ug7VarT, x45Var, l78Var, x45Var3);
                sb2Var = sb2Var;
                p65Var.j0(c6cVar2);
                obj = c6cVar2;
            } else {
                uobVar = uobVar2;
                i4 = i11;
                of5Var = of5Var2;
                z = false;
                obj = objM5;
            }
            c6c c6cVar3 = (c6c) obj;
            Object objM6 = p65Var.M();
            Object obj9 = objM6;
            if (objM6 == uobVar) {
                dsb dsbVar = new dsb(10);
                p65Var.j0(dsbVar);
                obj9 = dsbVar;
            }
            r28 r28VarY = r40.y(wxb.a(r28Var2, z, (x45) obj9), bmb.c(16.0f, 16.0f, 0.0f, 0.0f, 12));
            zk7 zk7VarC = dy0.c(z46.d, z);
            long j = p65Var.T;
            int i12 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarY);
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
            Integer numValueOf = Integer.valueOf(i12);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            rz5 rz5Var2 = qb8.c;
            sb2 sb2Var2 = sb2Var;
            yq0 yq0Var = z46.p;
            r28 r28Var5 = r28Var2;
            wv1 wv1VarA = uv1.a(rz5Var2, yq0Var, p65Var, 0);
            of5 of5Var3 = of5Var;
            long j2 = p65Var.T;
            int i13 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i13, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, R.string.common_share);
            boolean zF = p65Var.f(c6cVar3);
            Object objM7 = p65Var.M();
            if (zF || objM7 == uobVar) {
                objM7 = new j5c(0, c6cVar3, c6c.class, "onClose", "onClose()V", 0, 11);
                c6cVar = c6cVar3;
                p65Var.j0(objM7);
            } else {
                c6cVar = c6cVar3;
            }
            qk7.b(null, strR, (m45) ((qh6) objM7), null, vn7.J(R.drawable.ic_close_24, 0, p65Var), null, 0L, uu1.g, p65Var, 12615680, PanasonicMakernoteDirectory.TAG_COUNTRY);
            ?? r133 = p65Var;
            r28 r28VarY2 = r40.y(o28Var, bmb.a(16.0f));
            int i14 = h6cVar.a;
            int i15 = i4 & 14;
            boolean z5 = i15 == 4;
            Object objM8 = r133.M();
            if (z5 || objM8 == uobVar) {
                i5 = i15;
                i5b i5bVar = new i5b(23, h6cVar);
                r133.j0(i5bVar);
                obj2 = i5bVar;
            } else {
                i5 = i15;
                obj2 = objM8;
            }
            c6c c6cVar4 = c6cVar;
            d13 d13VarB = jz8.b(i14, (m45) obj2, r133, 0, 2);
            kv6 kv6VarA = pv6.a(r133);
            if (list.isEmpty()) {
                rz5Var = rz5Var2;
                r28Var4 = r28VarY2;
                z2 = false;
                r133.Y(1245517801);
            } else {
                r133.Y(1257970811);
                Integer numValueOf2 = Integer.valueOf(d13VarB.k());
                boolean zF2 = r133.f(d13VarB) | r133.f(kv6VarA);
                Object objM9 = r133.M();
                if (zF2 || objM9 == uobVar) {
                    rz5Var = rz5Var2;
                    r28Var4 = r28VarY2;
                    eub eubVar = new eub(d13VarB, kv6VarA, null, 4);
                    r133.j0(eubVar);
                    obj4 = eubVar;
                } else {
                    rz5Var = rz5Var2;
                    r28Var4 = r28VarY2;
                    obj4 = objM9;
                }
                kyd.k(r133, (b55) obj4, numValueOf2);
                z2 = false;
            }
            r133.p(z2);
            r28 r28VarB = xv1.b(1.0f, jfc.o(jfc.d(o28Var, 1.0f), 0.0f, 0.0f, 350.0f, 622.0f, 3), z2);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC2 = dy0.c(ar0Var, z2);
            long j3 = r133.T;
            int i16 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = r133.l();
            r28 r28VarR3 = gx1.R(r133, r28VarB);
            r133.c0();
            if (r133.S) {
                r133.k(ot2Var);
            } else {
                r133.m0();
            }
            tp7.B(r133, cuVar, zk7VarC2);
            tp7.B(r133, cuVar2, i89VarL3);
            ka1.z(i16, r133, cuVar3, r133, fnVar);
            tp7.B(r133, cuVar4, r28VarR3);
            if (list.isEmpty()) {
                r133.Y(873047450);
                r28 r28VarD2 = jfc.d(o28Var, 1.0f);
                zk7 zk7VarC3 = dy0.c(ar0Var, false);
                long j4 = r133.T;
                int i17 = (int) (j4 ^ (j4 >>> 32));
                i89 i89VarL4 = r133.l();
                r28 r28VarR4 = gx1.R(r133, r28VarD2);
                r133.c0();
                if (r133.S) {
                    r133.k(ot2Var);
                } else {
                    r133.m0();
                }
                tp7.B(r133, cuVar, zk7VarC3);
                tp7.B(r133, cuVar2, i89VarL4);
                ka1.z(i17, r133, cuVar3, r133, fnVar);
                tp7.B(r133, cuVar4, r28VarR4);
                b5c b5cVar = h6cVar.b;
                boolean zH = r133.h(of5Var3);
                Object objM10 = r133.M();
                if (zH || objM10 == uobVar) {
                    r2 = 0;
                    x5c x5cVar = new x5c(of5Var3, false ? 1 : 0);
                    r133.j0(x5cVar);
                    obj3 = x5cVar;
                } else {
                    r2 = 0;
                    obj3 = objM10;
                }
                ep7.m(b5cVar, op8.K(0.5625f, jfc.o(guc.C(r28Var4, (x45) obj3), 0.0f, 0.0f, 350.0f, 622.0f, 3), true), r133, r2);
                r133.p(true);
                r133.p(r2);
                h6cVar2 = h6cVar;
                r11 = r2;
                d13Var = d13VarB;
                i7 = i5;
                i6 = 4;
                r132 = r133;
            } else {
                r28 r28Var6 = r28Var4;
                r133.Y(874156041);
                wv1 wv1VarA2 = uv1.a(rz5Var, yq0Var, r133, 0);
                long j5 = r133.T;
                int i18 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL5 = r133.l();
                r28 r28VarR5 = gx1.R(r133, o28Var);
                r133.c0();
                if (r133.S) {
                    r133.k(ot2Var);
                } else {
                    r133.m0();
                }
                tp7.B(r133, cuVar, wv1VarA2);
                tp7.B(r133, cuVar2, i89VarL5);
                ka1.z(i18, r133, cuVar3, r133, fnVar);
                tp7.B(r133, cuVar4, r28VarR5);
                i6 = 4;
                boolean z6 = false;
                i7 = i5;
                h6cVar2 = h6cVar;
                kk7.c(d13VarB, xv1.b(1.0f, o28Var, false), null, null, null, null, false, null, null, null, pxf.E(-8821702, new vx4(r28Var6, d13VarB, of5Var3, h6cVar, 8), r133), r133, 0, 16380);
                d13Var = d13VarB;
                r28 r28VarP = jfc.p(w2g.G(o28Var, 32.0f, 24.0f, 32.0f, 0.0f, 8), 120.0f);
                yq0 yq0Var2 = z46.q;
                r28 r28VarA = xv1.a(yq0Var2, r28VarP);
                h70 h70Var = new h70(16.0f, true, new f70(z6 ? 1 : 0, yq0Var2));
                boolean zF3 = r133.f(d13Var) | r133.h(sb2Var2);
                Object objM11 = r133.M();
                Object obj10 = objM11;
                if (zF3 || objM11 == uobVar) {
                    pda pdaVar = new pda(d13Var, 14, sb2Var2);
                    r133.j0(pdaVar);
                    obj10 = pdaVar;
                }
                k40.u(r28VarA, kv6VarA, null, h70Var, null, null, false, null, (x45) obj10, r133, 24576, 492);
                ?? r134 = r133;
                r134.p(true);
                boolean zF4 = r134.f(d13Var) | (i7 == 4);
                Object objM12 = r134.M();
                Object obj11 = objM12;
                if (zF4 || objM12 == uobVar) {
                    eub eubVar2 = new eub(h6cVar2, d13Var, (n92) null);
                    r134.j0(eubVar2);
                    obj11 = eubVar2;
                }
                kyd.k(r134, (b55) obj11, c1e.a);
                r134.p(false);
                r11 = z6;
                r132 = r134;
            }
            r132.p(true);
            hp7.t(r132, jfc.e(o28Var, 32.0f));
            int i19 = (r132.f(d13Var) ? 1 : 0) | (i7 == i6 ? 1 : r11);
            Object objM13 = r132.M();
            Object obj12 = objM13;
            if (i19 != 0 || objM13 == uobVar) {
                nbb nbbVar = new nbb(d13Var, 7, h6cVar2);
                r132.j0(nbbVar);
                obj12 = nbbVar;
            }
            e(h6cVar2, c6cVar4, (m45) obj12, r132, i7);
            r132.p(true);
            br7.k(nhcVar, iy0.a.a(o28Var, z46.k), 0.0f, vv2.f, r132, ((i4 >> 3) & 14) | 3072, 4);
            r132.p(true);
            r28Var3 = r28Var5;
            r13 = r132;
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
            r13 = p65Var;
        }
        mwa mwaVarS = r13.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oe(h6cVar, nhcVar, w5cVar, b55Var, x45Var, x45Var2, r28Var3, i, i2, 4);
        }
    }

    public static final void g(PostShareData postShareData, String str, String str2, String str3, a aVar, r28 r28Var, j6c j6cVar, x12 x12Var, int i) {
        r28 r28Var2;
        j6c j6cVar2;
        int i2;
        r28 r28Var3;
        final j6c j6cVar3;
        h6c h6cVar;
        j6c j6cVar4;
        b55 b55Var;
        Resources resources;
        postShareData.getClass();
        str.getClass();
        str2.getClass();
        str3.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1345756866);
        int i3 = i | (p65Var.f(postShareData) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(str2) ? 256 : 128) | (p65Var.f(str3) ? 2048 : 1024) | (p65Var.f(aVar) ? 16384 : 8192) | 720896;
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var.U();
            int i4 = i & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 896) == 256) | ((i3 & 7168) == 2048);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    iu iuVar = new iu(postShareData, str, str2, str3, 23);
                    p65Var.j0(iuVar);
                    objM = iuVar;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                j6c j6cVar5 = (j6c) to7.z(n1b.a.b(j6c.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i2 = i3 & (-3670017);
                r28Var3 = o28.b;
                j6cVar3 = j6cVar5;
            } else {
                p65Var.S();
                i2 = i3 & (-3670017);
                r28Var3 = r28Var;
                j6cVar3 = j6cVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(j6cVar3.m, p65Var, 0);
            final nhc nhcVarF = mk7.F(p65Var);
            final Resources resources2 = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            final sb2 sb2Var = (sb2) objM2;
            String strR = vo7.R(p65Var, R.string.common_post_content);
            String string = postShareData.getShareUri().toString();
            string.getClass();
            int i5 = i2 & 57344;
            boolean zF = (i5 == 16384) | p65Var.f(j6cVar3) | p65Var.f(strR) | p65Var.f(string);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new b6c(aVar, strR, string, j6cVar3);
                p65Var.j0(objM3);
            }
            b6c b6cVar = (b6c) objM3;
            h6c h6cVar2 = (h6c) l78VarZ.getValue();
            boolean zH = p65Var.h(sb2Var) | p65Var.h(j6cVar3) | p65Var.f(nhcVarF) | p65Var.h(resources2);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new g9b(sb2Var, j6cVar3, nhcVarF, resources2, 4);
                p65Var.j0(objM4);
            }
            b55 b55Var2 = (b55) objM4;
            boolean zH2 = p65Var.h(sb2Var) | p65Var.h(j6cVar3) | p65Var.f(nhcVarF) | p65Var.h(resources2);
            Object objM5 = p65Var.M();
            if (zH2 || objM5 == uobVar) {
                final int i6 = 0;
                x45 x45Var2 = new x45() { // from class: z5c
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i7 = i6;
                        c1e c1eVar = c1e.a;
                        sb2 sb2Var2 = sb2Var;
                        switch (i7) {
                            case 0:
                                Bitmap bitmap = (Bitmap) obj;
                                bitmap.getClass();
                                vx0.c0(sb2Var2, null, null, new a6c(j6cVar3, bitmap, nhcVarF, resources2, null, 0), 3);
                                break;
                            default:
                                Bitmap bitmap2 = (Bitmap) obj;
                                bitmap2.getClass();
                                vx0.c0(sb2Var2, null, null, new a6c(j6cVar3, bitmap2, nhcVarF, resources2, null, 1), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(x45Var2);
                objM5 = x45Var2;
            }
            x45 x45Var3 = (x45) objM5;
            boolean zH3 = p65Var.h(sb2Var) | p65Var.h(j6cVar3) | p65Var.f(nhcVarF) | p65Var.h(resources2);
            Object objM6 = p65Var.M();
            if (zH3 || objM6 == uobVar) {
                final int i7 = 1;
                x45 x45Var4 = new x45() { // from class: z5c
                    @Override // defpackage.x45
                    public final Object invoke(Object obj) {
                        int i72 = i7;
                        c1e c1eVar = c1e.a;
                        sb2 sb2Var2 = sb2Var;
                        switch (i72) {
                            case 0:
                                Bitmap bitmap = (Bitmap) obj;
                                bitmap.getClass();
                                vx0.c0(sb2Var2, null, null, new a6c(j6cVar3, bitmap, nhcVarF, resources2, null, 0), 3);
                                break;
                            default:
                                Bitmap bitmap2 = (Bitmap) obj;
                                bitmap2.getClass();
                                vx0.c0(sb2Var2, null, null, new a6c(j6cVar3, bitmap2, nhcVarF, resources2, null, 1), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                h6cVar = h6cVar2;
                j6cVar4 = j6cVar3;
                b55Var = b55Var2;
                resources = resources2;
                p65Var.j0(x45Var4);
                objM6 = x45Var4;
            } else {
                h6cVar = h6cVar2;
                j6cVar4 = j6cVar3;
                b55Var = b55Var2;
                resources = resources2;
            }
            r28 r28Var4 = r28Var3;
            f(h6cVar, nhcVarF, b6cVar, b55Var, x45Var3, (x45) objM6, r28Var4, p65Var, 1572864, 0);
            boolean zH4 = p65Var.h(j6cVar4) | (i5 == 16384);
            Object objM7 = p65Var.M();
            if (zH4 || objM7 == uobVar) {
                objM7 = new eub(aVar, j6cVar4, null, 3);
                p65Var.j0(objM7);
            }
            kyd.k(p65Var, (b55) objM7, aVar);
            boolean zH5 = p65Var.h(j6cVar4) | p65Var.f(nhcVarF) | p65Var.h(resources) | (i5 == 16384);
            Object objM8 = p65Var.M();
            if (zH5 || objM8 == uobVar) {
                rna rnaVar = new rna(j6cVar4, nhcVarF, resources, aVar, null, 18);
                j6cVar2 = j6cVar4;
                p65Var.j0(rnaVar);
                objM8 = rnaVar;
            } else {
                j6cVar2 = j6cVar4;
            }
            kyd.k(p65Var, (b55) objM8, c1e.a);
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            j6cVar2 = j6cVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(postShareData, str, str2, str3, aVar, r28Var2, j6cVar2, i);
        }
    }

    public static final void h(wua wuaVar, uua uuaVar, hwc hwcVar, x12 x12Var, int i) {
        hwc hwcVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1347155876);
        int i2 = i | (p65Var.h(wuaVar) ? 4 : 2) | (p65Var.h(uuaVar) ? 32 : 16) | (p65Var.f(hwcVar) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            String strQ = vo7.Q(R.string.subscribe_to_newsletter_title, new Object[]{((mwc) guc.z(wuaVar, p65Var, i2 & 14).getValue()).a}, p65Var);
            int i3 = i2 & 896;
            boolean z = i3 == 256;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                joc jocVar = new joc(0, hwcVar, hwc.class, "onClose", "onClose()V", 0, 7);
                p65Var.j0(jocVar);
                objM = jocVar;
            }
            m45 m45Var = (m45) ((qh6) objM);
            String strR = vo7.R(p65Var, R.string.subscribe_to_newsletter_description);
            String strR2 = vo7.R(p65Var, R.string.common_confirm);
            boolean z2 = i3 == 256;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                joc jocVar2 = new joc(0, hwcVar, hwc.class, "subscribeToNewsletter", "subscribeToNewsletter()V", 0, 8);
                p65Var.j0(jocVar2);
                objM2 = jocVar2;
            }
            m45 m45Var2 = (m45) ((qh6) objM2);
            String strR3 = vo7.R(p65Var, R.string.common_cancel);
            boolean z3 = i3 == 256;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                joc jocVar3 = new joc(0, hwcVar, hwc.class, "onClose", "onClose()V", 0, 9);
                p65Var.j0(jocVar3);
                objM3 = jocVar3;
            }
            hwcVar2 = hwcVar;
            ek7.h(strQ, m45Var, null, strR, strR2, m45Var2, strR3, (m45) ((qh6) objM3), p65Var, 0, 4);
            boolean zH = p65Var.h(uuaVar) | (i3 == 256);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new eub(hwcVar2, uuaVar, null, 22);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
        } else {
            hwcVar2 = hwcVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 26, wuaVar, uuaVar, hwcVar2);
        }
    }

    public static final void i(dpd dpdVar, fv9 fv9Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-767301953);
        int i2 = (p65Var2.f(dpdVar) ? 4 : 2) | i | (p65Var2.f(fv9Var) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            String str = dpdVar.a;
            String str2 = dpdVar.b;
            String str3 = dpdVar.d;
            str.getClass();
            str2.getClass();
            sw9 sw9Var = fv9Var.a;
            if (sw9Var.J0.add(str2)) {
                sw9Var.o.g(str2, sw9Var.d, str3, sw9Var.D0);
            }
            String str4 = dpdVar.c;
            r28 r28VarA0 = flb.a0(r40.y(o28.b, bmb.a), ((zo7) p65Var2.j(kt7.b)).b, rv8.r);
            boolean z = ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i2 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new nbb(fv9Var, 22, dpdVar);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            jjd.b(str4, w2g.F(hlg.r(r28VarA0, false, null, null, (m45) objM, 15), 16.0f, 8.0f, 16.0f, 8.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).m, p65Var, 0, 0, 131068);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(dpdVar, fv9Var, i, 18);
        }
    }

    public static final void j(spd spdVar, fv9 fv9Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1150162035);
        int i2 = (p65Var.f(spdVar) ? 4 : 2) | i | (p65Var.f(fv9Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
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
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            m40.p(w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10), new h70(8.0f, true, new f70(0, z46.p)), new h70(8.0f, false, new f70(1, z46.m)), null, 0, 0, pxf.E(260120539, new dyc(spdVar, 6, fv9Var), p65Var), p65Var, 1573302, 56);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(spdVar, fv9Var, i, 17);
        }
    }

    public static final Set k(Collection collection) {
        if (collection == null) {
            return ny3.a;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            bu1.n0(((twa) it2.next()).a(), arrayList);
        }
        return bu1.q1(arrayList);
    }

    public static final db8 l(View view) {
        view.getClass();
        db8 db8Var = (db8) szb.H0(szb.N0(szb.K0(view, new hb8(2)), new hb8(3)));
        if (db8Var != null) {
            return db8Var;
        }
        rd6.w("View ", view, " does not have a NavController set");
        return null;
    }

    public static final String m(long j) {
        return String.format("%6s", Arrays.copyOf(new Object[]{j <= -999500000 ? ev6.t((j - 500000000) / MathMethodsKt.NANOS_PER_SECOND, " s ", new StringBuilder()) : j <= -999500 ? ev6.t((j - 500000) / 1000000, " ms", new StringBuilder()) : j <= 0 ? ev6.t((j - 500) / 1000, " µs", new StringBuilder()) : j < 999500 ? ev6.t((j + 500) / 1000, " µs", new StringBuilder()) : j < 999500000 ? ev6.t((j + 500000) / 1000000, " ms", new StringBuilder()) : ev6.t((j + 500000000) / MathMethodsKt.NANOS_PER_SECOND, " s ", new StringBuilder())}, 1));
    }

    public static final void n(Logger logger, ufd ufdVar, bgd bgdVar, String str) {
        logger.fine(bgdVar.b + ' ' + String.format("%-22s", Arrays.copyOf(new Object[]{str}, 1)) + ": " + ufdVar.a);
    }

    public static final LinkedHashMap o(m44 m44Var, k44 k44Var, yl2 yl2Var, y3b y3bVar, String str) {
        yl2Var.getClass();
        str.getClass();
        wh7 wh7Var = new wh7();
        ((sv0) m44Var.adapter()).toJson(wh7Var, yl2Var, k44Var);
        hx4 hx4Var = new hx4(o7f.L(m44Var, yl2Var), str, y3bVar);
        Object objM = wh7Var.m();
        objM.getClass();
        List list = m44Var.rootField().f;
        String str2 = m44Var.rootField().b.H().u;
        list.getClass();
        hx4Var.d((Map) objM, str, list, str2);
        return (LinkedHashMap) hx4Var.c;
    }

    public static final LinkedHashMap p(hv8 hv8Var, du8 du8Var, yl2 yl2Var, y3b y3bVar) {
        hv8Var.getClass();
        du8Var.getClass();
        yl2Var.getClass();
        return o(hv8Var, du8Var, yl2Var, y3bVar, i31.b.a);
    }

    public static kg3 q(Context context) {
        Object ajbVar;
        try {
            ajbVar = kg3.I(new File(context.getCacheDir(), "metrics"), ((t0) mp7.getEntries()).getSize());
        } catch (Throwable th) {
            ajbVar = new ajb(th);
        }
        Throwable thB = bjb.b(ajbVar);
        if (thB != null) {
            wld.a.e(thB, "unable to open cache metrics", new Object[0]);
        }
        if (ajbVar instanceof ajb) {
            ajbVar = null;
        }
        return (kg3) ajbVar;
    }

    public static PorterDuff.Mode r(int i) {
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        if (i == 3) {
            return PorterDuff.Mode.SRC_OVER;
        }
        if (i != 5) {
            if (i == 9) {
                return PorterDuff.Mode.SRC_ATOP;
            }
            switch (i) {
                case 14:
                    return PorterDuff.Mode.MULTIPLY;
                case 15:
                    return PorterDuff.Mode.SCREEN;
                case 16:
                    return PorterDuff.Mode.ADD;
            }
        }
        return mode;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0087  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void s(java.util.HashMap r5, java.lang.String r6, java.lang.String r7) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kp7.s(java.util.HashMap, java.lang.String, java.lang.String):void");
    }

    public static final List t(gnb gnbVar) {
        int iQ = en7.q(gnbVar, "id");
        int iQ2 = en7.q(gnbVar, "seq");
        int iQ3 = en7.q(gnbVar, "from");
        int iQ4 = en7.q(gnbVar, "to");
        f17 f17VarB = d46.B();
        while (gnbVar.w0()) {
            f17VarB.add(new l05(gnbVar.d0(iQ3), (int) gnbVar.getLong(iQ), (int) gnbVar.getLong(iQ2), gnbVar.d0(iQ4)));
        }
        return bu1.e1(d46.w(f17VarB));
    }

    public static final r7d u(anb anbVar, String str, boolean z) {
        gnb gnbVarB0 = anbVar.B0("PRAGMA index_xinfo(`" + str + "`)");
        try {
            int iQ = en7.q(gnbVarB0, "seqno");
            int iQ2 = en7.q(gnbVarB0, "cid");
            int iQ3 = en7.q(gnbVarB0, "name");
            int iQ4 = en7.q(gnbVarB0, "desc");
            if (iQ != -1 && iQ2 != -1 && iQ3 != -1 && iQ4 != -1) {
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                while (gnbVarB0.w0()) {
                    if (((int) gnbVarB0.getLong(iQ2)) >= 0) {
                        int i = (int) gnbVarB0.getLong(iQ);
                        String strD0 = gnbVarB0.d0(iQ3);
                        String str2 = gnbVarB0.getLong(iQ4) > 0 ? "DESC" : "ASC";
                        linkedHashMap.put(Integer.valueOf(i), strD0);
                        linkedHashMap2.put(Integer.valueOf(i), str2);
                    }
                }
                List listF1 = bu1.f1(linkedHashMap.entrySet(), new lva(1));
                ArrayList arrayList = new ArrayList(cu1.k0(listF1, 10));
                Iterator it2 = listF1.iterator();
                while (it2.hasNext()) {
                    arrayList.add((String) ((Map.Entry) it2.next()).getValue());
                }
                List listM1 = bu1.m1(arrayList);
                List listF12 = bu1.f1(linkedHashMap2.entrySet(), new lva(2));
                ArrayList arrayList2 = new ArrayList(cu1.k0(listF12, 10));
                Iterator it3 = listF12.iterator();
                while (it3.hasNext()) {
                    arrayList2.add((String) ((Map.Entry) it3.next()).getValue());
                }
                r7d r7dVar = new r7d(str, z, listM1, bu1.m1(arrayList2));
                xz5.F(gnbVarB0, null);
                return r7dVar;
            }
            xz5.F(gnbVarB0, null);
            return null;
        } finally {
        }
    }

    public static final y21 v(m44 m44Var, i31 i31Var, vv8 vv8Var, cd7 cd7Var, f31 f31Var, l44 l44Var) {
        Map linkedHashMap;
        String str = i31Var.a;
        List list = m44Var.rootField().f;
        String str2 = m44Var.rootField().b.H().u;
        str.getClass();
        f31Var.getClass();
        list.getClass();
        ing ingVar = new ing();
        ingVar.a = vv8Var;
        ingVar.b = l44Var;
        ingVar.c = cd7Var;
        ingVar.d = f31Var;
        ingVar.e = new LinkedHashMap();
        ingVar.f = new ArrayList();
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) ingVar.e;
        ArrayList arrayList = (ArrayList) ingVar.f;
        arrayList.add(new z21(str, ey3.a, list, str2));
        while (!arrayList.isEmpty()) {
            vv8 vv8Var2 = (vv8) ingVar.a;
            ArrayList<String> arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                arrayList2.add(((z21) it2.next()).a);
            }
            f31 f31Var2 = (f31) ingVar.d;
            f31Var2.getClass();
            ex7 ex7Var = vv8Var2.a;
            fy3 fy3Var = fy3.a;
            if (ex7Var != null) {
                Collection collectionG = ex7Var.g(arrayList2, f31Var2);
                int iP = ei7.P(cu1.k0(collectionG, 10));
                if (iP < 16) {
                    iP = 16;
                }
                linkedHashMap = new LinkedHashMap(iP);
                for (Object obj : collectionG) {
                    linkedHashMap.put(((twa) obj).a, obj);
                }
            } else {
                linkedHashMap = fy3Var;
            }
            ArrayList arrayList3 = new ArrayList();
            for (String str3 : arrayList2) {
                twa twaVar = (twa) linkedHashMap.get(str3);
                uv8 uv8Var = (uv8) vv8Var2.b.get(str3);
                if (uv8Var != null && (twaVar == null || (twaVar = (twa) twaVar.b(uv8Var.a).a) == null)) {
                    twaVar = uv8Var.a;
                }
                if (twaVar != null) {
                    arrayList3.add(twaVar);
                }
            }
            int iP2 = ei7.P(cu1.k0(arrayList3, 10));
            LinkedHashMap linkedHashMap3 = new LinkedHashMap(iP2 >= 16 ? iP2 : 16);
            for (Object obj2 : arrayList3) {
                linkedHashMap3.put(((twa) obj2).a, obj2);
            }
            List<z21> listM1 = bu1.m1(arrayList);
            arrayList.clear();
            for (z21 z21Var : listM1) {
                String str4 = z21Var.a;
                String str5 = z21Var.a;
                List list2 = z21Var.b;
                Object twaVar2 = linkedHashMap3.get(str4);
                if (twaVar2 == null) {
                    if (!g76.L(str5, i31.b.a)) {
                        throw new CacheMissException(str5, null);
                    }
                    twaVar2 = new twa(str5, fy3Var, null);
                }
                List list3 = z21Var.c;
                String str6 = z21Var.d;
                twa twaVar3 = (twa) twaVar2;
                Object obj3 = twaVar3.get("__typename");
                ArrayList<nx1> arrayListC = ing.c(list3, str6, l44Var, obj3 instanceof String ? (String) obj3 : null);
                ArrayList arrayList4 = new ArrayList();
                for (nx1 nx1Var : arrayListC) {
                    nx1Var.getClass();
                    Iterator it3 = nx1Var.d.iterator();
                    if (it3.hasNext()) {
                        throw ev6.q(it3);
                    }
                    Object objB = ((cd7) ingVar.c).B(nx1Var, l44Var, (Map) twaVar2, twaVar3.a);
                    ingVar.g(objB, bu1.R0(list2, nx1Var.b()), nx1Var.f, nx1Var.b.H().u);
                    arrayList4.add(new f09(nx1Var.b(), objB));
                    linkedHashMap3 = linkedHashMap3;
                }
                linkedHashMap2.put(list2, ei7.V(arrayList4));
                linkedHashMap3 = linkedHashMap3;
            }
        }
        return new y21(linkedHashMap2);
    }

    public static final float w(long j, float f, m73 m73Var) {
        float fC;
        long jB = qkd.b(j);
        if (rkd.a(jB, 4294967296L)) {
            if (m73Var.U() <= 1.05d) {
                return m73Var.p0(j);
            }
            fC = qkd.c(j) / qkd.c(m73Var.J(f));
        } else {
            if (!rkd.a(jB, 8589934592L)) {
                return Float.NaN;
            }
            fC = qkd.c(j);
        }
        return fC * f;
    }

    public static CreateCredentialException x(Intent intent) {
        if (Build.VERSION.SDK_INT >= 34) {
            return m4.d(intent);
        }
        int i = CreateCredentialException.a;
        Bundle bundleExtra = intent.getBundleExtra("android.service.credentials.extra.CREATE_CREDENTIAL_EXCEPTION");
        if (bundleExtra == null) {
            return null;
        }
        String string = bundleExtra.getString("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_TYPE");
        if (string != null) {
            return qb8.d0(bundleExtra.getCharSequence("androidx.credentials.provider.extra.CREATE_CREDENTIAL_EXCEPTION_MESSAGE"), string);
        }
        ay0.e("Bundle was missing exception type.");
        return null;
    }

    public static bf2 y(Intent intent, String str) {
        String string;
        Bundle bundle;
        if (Build.VERSION.SDK_INT >= 34) {
            return m4.e(intent, str);
        }
        Bundle bundleExtra = intent.getBundleExtra("android.service.credentials.extra.CREATE_CREDENTIAL_RESPONSE");
        if (bundleExtra == null || (string = bundleExtra.getString("androidx.credentials.provider.extra.CREATE_CREDENTIAL_RESPONSE_TYPE")) == null || (bundle = bundleExtra.getBundle("androidx.credentials.provider.extra.CREATE_CREDENTIAL_REQUEST_DATA")) == null) {
            return null;
        }
        return w2g.p(string, bundle);
    }

    public static final void z(Spannable spannable, long j, int i, int i2) {
        if (j != 16) {
            spannable.setSpan(new ForegroundColorSpan(op8.n0(j)), i, i2, 33);
        }
    }
}
