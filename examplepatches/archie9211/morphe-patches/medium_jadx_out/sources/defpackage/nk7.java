package defpackage;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcelable;
import android.provider.Settings;
import android.view.KeyEvent;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.workers.ConstraintTrackingWorker;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.explore.ui.vAWg.OphtYB;
import com.medium.android.graphql.type.MembershipType;
import com.medium.android.payments.ui.subscription.SubscriptionViewModel;
import com.medium.reader.R;
import gen.model.SourceParameter;
import j$.util.DesugarCollections;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes4.dex */
public abstract class nk7 {
    public static final h1c a;
    public static final hpe b;
    public static final mz1 c = new mz1(new e02(27), false, 1989212427);
    public static final mz1 d = new mz1(new e02(28), false, 213137353);
    public static final mz1 e = new mz1(new p02(22), false, 1482758180);
    public static final mz1 f = new mz1(new c02(7), false, -1811653840);
    public static final mz1 g = new mz1(new c02(8), false, 371356154);
    public static final mz1 h = new mz1(new c02(9), false, -443385110);
    public static final mz1 i;
    public static final mz1 j;
    public static final /* synthetic */ int k = 0;
    public static final /* synthetic */ int l = 0;
    public static final /* synthetic */ int m = 0;

    static {
        int i2 = 11;
        a = new h1c(i2);
        b = new hpe(i2);
        new mz1(new c02(10), false, -1644088982);
        i = new mz1(new c02(11), false, 467885724);
        new mz1(new c02(12), false, 811297301);
        j = new mz1(new n02(16), false, 1890101041);
    }

    public static final void A(bc7 bc7Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1331239405);
        n4b n4bVar = n4b.AUTOMATIC;
        ar0 ar0Var = z46.h;
        t90 t90Var = t90.AUTOMATIC;
        p65Var.Z(683659508);
        zb7 zb7Var = zb7.Immediately;
        if (Float.isInfinite(1.0f) || Float.isNaN(1.0f)) {
            throw new IllegalArgumentException(("Speed must be a finite number. It is 1.0.").toString());
        }
        ub7 ub7VarA0 = g76.a0(p65Var);
        p65Var.Z(-180606964);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = qo7.u(true);
            p65Var.j0(objM);
        }
        p65Var.p(false);
        p65Var.Z(-180606834);
        Context context = (Context) p65Var.j(eo.b);
        Matrix matrix = gpe.a;
        float f2 = 1.0f / Settings.Global.getFloat(context.getContentResolver(), "animator_duration_scale", 1.0f);
        p65Var.p(false);
        kyd.m(new Object[]{bc7Var, true, null, Float.valueOf(f2), Integer.MAX_VALUE}, new av(ub7VarA0, bc7Var, f2, zb7Var, (l78) objM, null), p65Var);
        p65Var.p(false);
        p65Var.Z(185157769);
        boolean zF = p65Var.f(ub7VarA0);
        Object objM2 = p65Var.M();
        if (zF || objM2 == uobVar) {
            objM2 = new ir(25, ub7VarA0);
            p65Var.j0(objM2);
        }
        p65Var.p(false);
        z(bc7Var, (m45) objM2, r28Var, false, false, true, false, n4bVar, false, ar0Var, v82.b, true, false, null, t90Var, false, p65Var, 1073742216, 32768, 0);
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new lo(bc7Var, r28Var, n4bVar, t90Var, i2);
        }
    }

    public static final Map A0(Map map) {
        int size = map.size();
        if (size == 0) {
            return fy3.a;
        }
        if (size != 1) {
            return DesugarCollections.unmodifiableMap(new LinkedHashMap(map));
        }
        Map.Entry entry = (Map.Entry) bu1.w0(map.entrySet());
        return Collections.singletonMap(entry.getKey(), entry.getValue());
    }

    public static final void B(szc szcVar, String str, String str2, String str3, boolean z, bw7 bw7Var, lyc lycVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        m62 m62Var;
        l78 l78Var;
        z52 z52Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1138423054);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(szcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(str != null ? new ax5(str) : null) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(str2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(str3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.g(z) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(bw7Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var.f(lycVar) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var.f(r28Var) ? 8388608 : 4194304;
        }
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            cu0 cu0VarB = k40.b(1.0f, ((zo7) p65Var.j(kt7.b)).z);
            r28 r28VarC = w2g.C(bo.C(r28Var, cu0VarB.a, cu0VarB.b, bmb.a(4.0f)), 32.0f);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarC);
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
            r28 r28VarA = iy0.a.a(jfc.c, ar0Var);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var2 = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var2 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var2, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var3 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                objM6 = new ftc(l78Var3, hl7Var, m62Var2, l78Var2, 2);
                m62Var = m62Var2;
                l78Var = l78Var2;
                p65Var.j0(objM6);
            } else {
                m62Var = m62Var2;
                l78Var = l78Var2;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                z52Var = z52Var2;
                objM7 = new gtc(l78Var, m62Var, 2);
                p65Var.j0(objM7);
            } else {
                z52Var = z52Var2;
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new htc(hl7Var, 2);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarA, false, (x45) objM8), pxf.E(1200550679, new hyc(l78Var3, z52Var, m45Var, szcVar, str, z, lycVar, str2, str3, bw7Var), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new rl1(szcVar, str, str2, str3, z, bw7Var, lycVar, r28Var, i2);
        }
    }

    public static int B0(xe3 xe3Var, dqb dqbVar) {
        if (xe3Var instanceof ue3) {
            return ((ue3) xe3Var).a;
        }
        int i2 = hw2.a[dqbVar.ordinal()];
        if (i2 == 1) {
            return Integer.MIN_VALUE;
        }
        if (i2 == 2) {
            return Integer.MAX_VALUE;
        }
        ygf.a();
        return 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:42:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(java.lang.String r23, defpackage.r28 r24, defpackage.mkd r25, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 313
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.C(java.lang.String, r28, mkd, x12, int, int):void");
    }

    public static final long C0(long j2) {
        return (((long) Float.floatToRawIntBits((int) (j2 & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits((int) (j2 >> 32)) << 32);
    }

    public static final c8f D0(List list, c8f c8fVar) {
        c8f c8fVarB;
        list.getClass();
        boolean zB = c8fVar.e.b("androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME");
        boolean zB2 = c8fVar.e.b("androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_PACKAGE_NAME");
        boolean zB3 = c8fVar.e.b("androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_CLASS_NAME");
        if (!zB && zB2 && zB3) {
            String str = c8fVar.c;
            ct2 ct2Var = new ct2(0, false);
            dt2 dt2Var = c8fVar.e;
            dt2Var.getClass();
            ct2Var.e(dt2Var.a);
            ct2Var.a.put("androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME", str);
            c8fVarB = c8f.b(c8fVar, null, null, "androidx.work.multiprocess.RemoteListenableDelegatingWorker", ct2Var.a(), 0, 0L, 0, 0, 0L, 0, 33554411);
        } else {
            c8fVarB = c8fVar;
        }
        if (Build.VERSION.SDK_INT <= 25) {
            e72 e72Var = c8fVarB.j;
            String str2 = c8fVarB.c;
            if (!g76.L(str2, ConstraintTrackingWorker.class.getName()) && (e72Var.e || e72Var.f)) {
                ct2 ct2Var2 = new ct2(0, false);
                dt2 dt2Var2 = c8fVarB.e;
                dt2Var2.getClass();
                ct2Var2.e(dt2Var2.a);
                ct2Var2.a.put("androidx.work.impl.workers.ConstraintTrackingWorker.ARGUMENT_CLASS_NAME", str2);
                return c8f.b(c8fVarB, null, null, ConstraintTrackingWorker.class.getName(), ct2Var2.a(), 0, 0L, 0, 0, 0L, 0, 33554411);
            }
        }
        return c8fVarB;
    }

    public static final void E(v88 v88Var, n88 n88Var, boolean z, i88 i88Var, obe obeVar, cs1 cs1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-762555588);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(v88Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(n88Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.g(z) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(i88Var) ? 2048 : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(obeVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(cs1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 1048576 : 524288;
        }
        if (p65Var2.P(i3 & 1, (599187 & i3) != 599186)) {
            boolean z2 = (i3 & 7168) == 2048;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                qv7 qv7Var = new qv7(0, i88Var, i88.class, "refresh", "refresh()V", 0, 3);
                p65Var2.j0(qv7Var);
                objM = qv7Var;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) objM), r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(445856750, new g91(n88Var, v88Var, i88Var, obeVar, cs1Var, 2), p65Var2), p65Var, (i3 >> 6) & 14, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gu0(v88Var, n88Var, z, i88Var, obeVar, cs1Var, r28Var, i2, 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x01ea  */
    /* JADX WARN: Removed duplicated region for block: B:93:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void F(defpackage.v88 r26, defpackage.i88 r27, defpackage.obe r28, defpackage.cs1 r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 509
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.F(v88, i88, obe, cs1, r28, x12, int, int):void");
    }

    public static final void G(String str, uza uzaVar, nhc nhcVar, r28 r28Var, x88 x88Var, x12 x12Var, int i2) {
        r28 r28Var2;
        x88 x88Var2;
        int i3;
        x88 x88Var3;
        r28 r28Var3;
        Object yuVar;
        x88 x88Var4;
        str.getClass();
        nhcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(878293779);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(uzaVar) ? 32 : 16) | (p65Var.f(nhcVar) ? 256 : 128) | 11264;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ov5(str, 7);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                x88 x88Var5 = (x88) to7.z(n1b.a.b(x88.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i3 = i4 & (-57345);
                x88Var3 = x88Var5;
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                i3 = i4 & (-57345);
                x88Var3 = x88Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(x88Var3.t, p65Var, 0);
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i6 == 32) | p65Var.f(x88Var3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new h88(x88Var3, uzaVar);
                p65Var.j0(objM2);
            }
            h88 h88Var = (h88) objM2;
            boolean zF2 = (i6 == 32) | p65Var.f(x88Var3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new j88(x88Var3, uzaVar);
                p65Var.j0(objM3);
            }
            j88 j88Var = (j88) objM3;
            boolean zF3 = (i6 == 32) | p65Var.f(x88Var3);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar) {
                objM4 = new i88(x88Var3, uzaVar);
                p65Var.j0(objM4);
            }
            int i7 = i3;
            F((v88) l78VarZ.getValue(), (i88) objM4, j88Var, h88Var, r28Var3, p65Var, 24576, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = kyd.M(p65Var);
                p65Var.j0(objM5);
            }
            sb2 sb2Var = (sb2) objM5;
            boolean zH = p65Var.h(x88Var3) | ((i7 & 896) == 256) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(h88Var) | p65Var.f(j88Var);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                x88Var4 = x88Var3;
                yuVar = new yu(x88Var4, nhcVar, sb2Var, resources, h88Var, j88Var, null, 11);
                p65Var.j0(yuVar);
            } else {
                yuVar = objM6;
                x88Var4 = x88Var3;
            }
            kyd.k(p65Var, (b55) yuVar, c1e.a);
            r28Var2 = r28Var3;
            x88Var2 = x88Var4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            x88Var2 = x88Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, uzaVar, nhcVar, r28Var2, x88Var2, i2, 29);
        }
    }

    public static final void H(dr9 dr9Var, ig5 ig5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        float f2;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1172033456);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dr9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.d(ig5Var.ordinal()) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            int[] iArr = pg5.a;
            int i5 = iArr[ig5Var.ordinal()];
            if (i5 == 1) {
                f2 = 1.5f;
            } else {
                if (i5 != 2) {
                    ygf.a();
                    return;
                }
                f2 = 2.0f;
            }
            r28 r28VarY = r40.y(op8.K(f2, jfc.d(r28Var, 1.0f), false), bmb.a(2.0f));
            if (dr9Var.b != null) {
                p65Var.Y(2035941371);
                k40.c(u57.a.a(bo.a0(p65Var)), pxf.E(-1195925653, new lg5(dr9Var, ((m73) p65Var.j(z22.h)).Z(2.0f), r28VarY), p65Var), p65Var, 56);
                p65Var.p(false);
            } else {
                p65Var.Y(2036754067);
                int i6 = iArr[ig5Var.ordinal()];
                if (i6 == 1) {
                    i4 = R.drawable.grid_post_preview_picture_placerholder_3_for_2;
                } else {
                    if (i6 != 2) {
                        ygf.a();
                        return;
                    }
                    i4 = R.drawable.grid_post_preview_picture_placeholder_2_for_1;
                }
                w2g.e(vn7.J(i4, 0, p65Var), null, r28VarY, null, v82.d, 0.0f, null, p65Var, 24632, 104);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 23, dr9Var, ig5Var, r28Var);
        }
    }

    public static final void I(uo5 uo5Var, kv6 kv6Var, bo4 bo4Var, no5 no5Var, md3 md3Var, x12 x12Var, int i2) {
        no5 no5Var2;
        float f2;
        uob uobVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1814400859);
        int i3 = i2 | (p65Var.f(uo5Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(no5Var) ? 2048 : 1024) | (p65Var.f(md3Var) ? 16384 : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            sn3 sn3Var = kt7.a;
            ((jp7) p65Var.j(sn3Var)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            ((jp7) p65Var.j(sn3Var)).getClass();
            int i4 = po5.a[jp7.a(p65Var).ordinal()];
            if (i4 == 1) {
                f2 = 0.0f;
            } else {
                if (i4 != 2 && i4 != 3) {
                    ygf.a();
                    return;
                }
                f2 = 24.0f;
            }
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 88.0f, 7);
            int i5 = i3 & 7168;
            boolean zC = ((i3 & 14) == 4) | p65Var.c(f2) | p65Var.d(stcVar.ordinal()) | ((57344 & i3) == 16384) | (i5 == 2048);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (zC || objM == uobVar2) {
                stc stcVar2 = stcVar;
                uobVar = uobVar2;
                ko5 ko5Var = new ko5(uo5Var, f2, stcVar2, md3Var, no5Var, 0);
                p65Var.j0(ko5Var);
                objM = ko5Var;
            } else {
                uobVar = uobVar2;
            }
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            uob uobVar3 = uobVar;
            no5Var2 = no5Var;
            k40.t(null, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, i6 | 384, 505);
            boolean z = (i5 == 2048) | (i6 == 32);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z || objM2 == uobVar3) {
                objM2 = new xs3(kv6Var, no5Var2, n92Var, 15);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar3) {
                objM3 = bjc.b(new f91(kv6Var, 3));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z2 = i5 == 2048;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar3) {
                objM4 = new rc0(no5Var2, upcVar, n92Var, 16);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | (i6 == 32);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar3) {
                objM5 = new wi1(bo4Var, kv6Var, n92Var, 6);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
        } else {
            no5Var2 = no5Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(uo5Var, kv6Var, bo4Var, no5Var2, md3Var, i2, 23);
        }
    }

    public static final void J(xna xnaVar, obe obeVar, sna snaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        uob uobVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-271559704);
        int i4 = i2 | (p65Var2.f(xnaVar) ? 4 : 2) | (p65Var2.f(obeVar) ? 32 : 16) | (p65Var2.f(snaVar) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            boolean z = xnaVar.c;
            int i5 = i4 & 896;
            boolean z2 = i5 == 256;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                i3 = i5;
                uobVar = uobVar2;
                c9a c9aVar = new c9a(0, snaVar, sna.class, "refresh", "refresh()V", 0, 18);
                p65Var2.j0(c9aVar);
                objM = c9aVar;
            } else {
                i3 = i5;
                uobVar = uobVar2;
            }
            int i6 = 27;
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(771307418, new gx4(kv6VarA, xnaVar, obeVar, i6), p65Var2), p65Var2, (i4 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            int i7 = i3;
            boolean zF = p65Var.f(kv6VarA) | (i7 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            uob uobVar3 = uobVar;
            if (zF || objM2 == uobVar3) {
                objM2 = new nx9(kv6VarA, snaVar, n92Var, 17);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            boolean z3 = i7 == 256;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar3) {
                objM3 = new lo5(snaVar, n92Var, i6);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 28, r28Var, (Object) xnaVar, (Object) obeVar, (Object) snaVar);
        }
    }

    public static final void K(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1379408057);
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
            gq7.a(iy0.a.a(o28Var, ar0Var), null, vo7.R(p65Var, R.string.publication_writers_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 17);
        }
    }

    public static final void L(vna vnaVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-861174366);
        int i4 = (p65Var.f(vnaVar) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            iq7.a(vnaVar.a, null, null, null, null, null, null, null, p65Var, 0, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
            i3 = 1;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(vnaVar, r28Var, i2, i3);
        }
    }

    public static final void M(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1237253802);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarD = jfc.d(jfc.r(m40.V(r28Var, p65Var, i3 & 14), 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD2);
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
            p65Var.Y(1520949957);
            for (int i7 = 0; i7 < 10; i7++) {
                imc.b(0, 0L, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 16);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void N(defpackage.yna r22, defpackage.nhc r23, defpackage.sna r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.N(yna, nhc, sna, obe, r28, x12, int, int):void");
    }

    public static final void O(String str, String str2, my6 my6Var, r28 r28Var, eoa eoaVar, x12 x12Var, int i2) {
        eoa eoaVar2;
        int i3;
        eoa eoaVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(802017930);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(my6Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 14);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    eoaVar3 = (eoa) to7.z(n1b.a.b(eoa.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                eoaVar3 = eoaVar;
            }
            p65Var.q();
            nhc nhcVarF = mk7.F(p65Var);
            l78 l78VarZ = guc.z(eoaVar3.l, p65Var, 0);
            sna snaVar = new sna(my6Var, eoaVar3);
            gg5 gg5Var = new gg5(eoaVar3, 28, my6Var);
            N((yna) l78VarZ.getValue(), nhcVarF, snaVar, gg5Var, r28Var, p65Var, (i3 << 3) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH = p65Var.h(eoaVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(gg5Var);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                uk8 uk8Var = new uk8(eoaVar3, nhcVarF, sb2Var, resources, gg5Var, (n92) null, 18);
                p65Var.j0(uk8Var);
                objM3 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            eoaVar2 = eoaVar3;
        } else {
            p65Var.S();
            eoaVar2 = eoaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) my6Var, r28Var, (que) eoaVar2, i2, 20);
        }
    }

    public static final void P(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-437611555);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            xn7 xn7Var = xn7.M;
            o28 o28Var = o28.b;
            fo7.k(((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 >> 3) & 14) | 384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, m45Var, xn7Var, w2g.G(o28Var, 8.0f, 16.0f, 0.0f, 0.0f, 12), str, false, false);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qb(str, m45Var, r28Var2, i2, 3);
        }
    }

    public static final void Q(c0d c0dVar, yrb yrbVar, hu7 hu7Var, lyc lycVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1545224715);
        int i3 = i2 | (p65Var.f(c0dVar) ? 4 : 2) | (p65Var.f(yrbVar) ? 32 : 16) | (p65Var.f(hu7Var) ? 256 : 128) | (p65Var.f(lycVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 24576;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = c0dVar instanceof uzc;
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(1097743341);
                W(lycVar, p65Var, (i3 >> 9) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
                p65Var.p(false);
            } else if (c0dVar instanceof vzc) {
                p65Var.Y(1097749479);
                X((vzc) c0dVar, lycVar, p65Var, ((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i3 & 14) | 384);
                p65Var.p(false);
            } else if (c0dVar instanceof xzc) {
                p65Var.Y(1097758940);
                c0(p65Var, 6);
                p65Var.p(false);
            } else if (c0dVar instanceof b0d) {
                p65Var.Y(1097762374);
                d0((b0d) c0dVar, p65Var, (i3 & 14) | 48);
                p65Var.p(false);
            } else if (c0dVar instanceof gzc) {
                p65Var.Y(-328938829);
                U(p65Var, 6);
                p65Var.p(false);
            } else if (c0dVar instanceof tzc) {
                p65Var.Y(-328822486);
                V((tzc) c0dVar, yrbVar, hu7Var, lycVar, p65Var, i3 & 65534);
                p65Var.p(false);
            } else if (c0dVar instanceof wzc) {
                p65Var.Y(1097781764);
                Y(p65Var, 6);
                p65Var.p(false);
            } else if (c0dVar instanceof fzc) {
                p65Var.Y(1097785644);
                T((fzc) c0dVar, lycVar, p65Var, ((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i3 & 14) | 384);
                p65Var.p(false);
            } else if (c0dVar instanceof dzc) {
                p65Var.Y(1097792567);
                e(o28Var, p65Var, 6);
                p65Var.p(false);
            } else if (c0dVar instanceof yyc) {
                p65Var.Y(1097795960);
                c((yyc) c0dVar, lycVar, p65Var, ((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i3 & 14) | 384);
                p65Var.p(false);
            } else {
                if (!(c0dVar instanceof czc)) {
                    throw ho2.L(p65Var, 1097742355, false);
                }
                p65Var.Y(1097802365);
                d((czc) c0dVar, lycVar, o28Var, p65Var, ((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i3 & 14) | 384);
                p65Var.p(false);
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(c0dVar, yrbVar, hu7Var, lycVar, r28Var2, i2, 1);
        }
    }

    public static final void R(int i2, x12 x12Var, r28 r28Var, String str, String str2) {
        int i3;
        String strR;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(679196141);
        int i5 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                strR = vo7.R(p65Var, R.string.subscription_error_title);
                i4 = i3 & (-897);
            } else {
                p65Var.S();
                i4 = i3 & (-897);
                strR = str2;
            }
            p65Var.q();
            S(r28Var, strR, pxf.E(871432242, new ba1(str, i5), p65Var), p65Var, ((i4 >> 3) & 14) | 384, 0);
        } else {
            p65Var.S();
            strR = str2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 10, str, r28Var, strR);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00ba  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void S(defpackage.r28 r29, java.lang.String r30, defpackage.mz1 r31, defpackage.x12 r32, int r33, int r34) {
        /*
            Method dump skipped, instruction units count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.S(r28, java.lang.String, mz1, x12, int, int):void");
    }

    public static final void T(fzc fzcVar, lyc lycVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(590120349);
        int i4 = 4;
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(fzcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lycVar) ? 32 : 16;
        }
        int i5 = i2 & 384;
        o28 o28Var = o28.b;
        if (i5 == 0) {
            i3 |= p65Var.f(o28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            S(o28Var, vo7.R(p65Var, R.string.subscription_error_launch_billing_flow_title), pxf.E(-1615834696, new qg9(fzcVar, 29, lycVar), p65Var), p65Var, ((i3 >> 6) & 14) | 384, 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(fzcVar, lycVar, i2, i4);
        }
    }

    public static final void U(x12 x12Var, int i2) {
        int i3;
        ip7 ip7Var;
        cu cuVar;
        fn fnVar;
        cu cuVar2;
        cu cuVar3;
        o28 o28Var;
        cu cuVar4;
        ot2 ot2Var;
        o28 o28Var2;
        float f2;
        float f3;
        o28 o28Var3;
        yq0 yq0Var = z46.q;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1464233421);
        int i4 = i2 & 6;
        o28 o28Var4 = o28.b;
        if (i4 == 0) {
            i3 = (p65Var.f(o28Var4) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            ip7 ip7VarA = jp7.a(p65Var);
            amb ambVarA = bmb.a(4.0f);
            r28 r28VarV = m40.V(w2g.G(jfc.c, 0.0f, 0.0f, 0.0f, 40.0f, 7), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarV);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar5 = q12.f;
            tp7.B(p65Var, cuVar5, wv1VarA);
            cu cuVar6 = q12.e;
            tp7.B(p65Var, cuVar6, i89VarL);
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar7 = q12.g;
            tp7.B(p65Var, cuVar7, numValueOf);
            fn fnVar2 = q12.h;
            tp7.y(p65Var, fnVar2);
            cu cuVar8 = q12.d;
            tp7.B(p65Var, cuVar8, r28VarR);
            ip7 ip7Var2 = ip7.COMPACT;
            if (ip7VarA == ip7Var2) {
                p65Var.Y(12847270);
                cuVar2 = cuVar7;
                cuVar3 = cuVar8;
                ip7Var = ip7Var2;
                cuVar = cuVar6;
                fnVar = fnVar2;
                dy0.a(flb.a0(jfc.m(w2g.G(o28Var4, 24.0f, 0.0f, 24.0f, 0.0f, 10), 380.0f, 32.0f), t0(p65Var), ambVarA), p65Var, 0);
                dy0.a(flb.a0(w2g.G(jfc.m(w2g.G(o28Var4, 24.0f, 0.0f, 24.0f, 0.0f, 10), 300.0f, 32.0f), 0.0f, 8.0f, 0.0f, 0.0f, 13), t0(p65Var), ambVarA), p65Var, 0);
                p65Var.p(false);
                o28Var = o28Var4;
            } else {
                ip7Var = ip7Var2;
                cuVar = cuVar6;
                fnVar = fnVar2;
                cuVar2 = cuVar7;
                cuVar3 = cuVar8;
                p65Var.Y(13408773);
                o28Var = o28Var4;
                dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var4, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), 32.0f), t0(p65Var), ambVarA), p65Var, 0);
                p65Var.p(false);
            }
            ip7 ip7Var3 = ip7Var;
            if (ip7VarA == ip7Var3) {
                p65Var.Y(13790073);
                o28 o28Var5 = o28Var;
                cuVar4 = cuVar;
                ot2Var = ot2Var2;
                kr0.c(0, 0L, p65Var, jfc.d(w2g.G(o28Var5, 24.0f, 40.0f, 24.0f, 0.0f, 8), 1.0f));
                p65Var.p(false);
                o28Var2 = o28Var5;
                f2 = 40.0f;
            } else {
                cuVar4 = cuVar;
                ot2Var = ot2Var2;
                p65Var.Y(13993309);
                o28Var2 = o28Var;
                f2 = 40.0f;
                kr0.c(0, 0L, p65Var, ka1.i(yq0Var, jfc.p(w2g.G(o28Var2, 0.0f, 40.0f, 0.0f, 0.0f, 13), 280.0f)));
                p65Var.p(false);
            }
            if (ip7VarA == ip7Var3) {
                p65Var.Y(14317817);
                f3 = f2;
                dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var2, 24.0f, f2, 24.0f, 0.0f, 8), 1.0f), 354.0f), t0(p65Var), ambVarA), p65Var, 0);
                dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var2, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f), 354.0f), t0(p65Var), ambVarA), p65Var, 0);
                p65Var.p(false);
                o28Var3 = o28Var2;
            } else {
                f3 = f2;
                p65Var.Y(14906972);
                o28Var3 = o28Var2;
                r28 r28VarD = jfc.d(w2g.G(o28Var2, 24.0f, 24.0f, 24.0f, 0.0f, 8), 1.0f);
                omb ombVarA = nmb.a(new h70(24.0f, true, new f70(i5, yq0Var)), z46.m, p65Var, 6);
                long j3 = p65Var.T;
                int i7 = (int) (j3 ^ (j3 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, ombVarA);
                tp7.B(p65Var, cuVar4, i89VarL2);
                ka1.z(i7, p65Var, cuVar2, p65Var, fnVar);
                tp7.B(p65Var, cuVar3, r28VarR2);
                if (1.0f <= 0.0d) {
                    z16.a("invalid weight; must be greater than zero");
                }
                dy0.a(flb.a0(jfc.e(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 398.0f), t0(p65Var), ambVarA), p65Var, 0);
                if (1.0f <= 0.0d) {
                    z16.a("invalid weight; must be greater than zero");
                }
                dy0.a(flb.a0(jfc.e(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 398.0f), t0(p65Var), ambVarA), p65Var, 0);
                p65Var.p(true);
                p65Var.p(false);
            }
            dy0.a(flb.a0(ka1.i(yq0Var, jfc.e(jfc.p(w2g.G(o28Var3, 0.0f, f3, 0.0f, 0.0f, 13), 398.0f), 28.0f)), t0(p65Var), ambVarA), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jd3(i2, 3);
        }
    }

    public static final void V(tzc tzcVar, yrb yrbVar, hu7 hu7Var, lyc lycVar, x12 x12Var, int i2) {
        int i3;
        l78 l78Var;
        l78 l78Var2;
        bw7 bw7Var;
        m62 m62Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(988707099);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(tzcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(yrbVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(hu7Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(lycVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i2 & 24576;
        o28 o28Var = o28.b;
        if (i4 == 0) {
            i3 |= p65Var.f(o28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            ip7 ip7VarA = jp7.a(p65Var);
            boolean z = ip7VarA == ip7.COMPACT;
            ozc ozcVar = tzcVar.e;
            bw7 bw7VarS0 = s0(ozcVar != null ? ozcVar.c : null, p65Var);
            r28 r28VarG = w2g.G(wgf.R(bgf.N(o28Var, "main"), yrbVar, false, 14).b(jfc.c), 0.0f, 0.0f, 0.0f, 40.0f, 7);
            wgd.w(-1003410150, 212064437, p65Var, false);
            m73 m73Var = (m73) p65Var.j(z22.h);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = b09.t(m73Var, p65Var);
            }
            hl7 hl7Var = (hl7) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = b09.r(p65Var);
            }
            z52 z52Var = (z52) objM2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM3);
            }
            l78 l78Var3 = (l78) objM3;
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = b09.s(z52Var, p65Var);
            }
            m62 m62Var2 = (m62) objM4;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = b09.v(c1e.a, y3b.h, p65Var);
            }
            l78 l78Var4 = (l78) objM5;
            boolean zH = p65Var.h(hl7Var) | p65Var.d(257);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                objM6 = new ftc(l78Var4, hl7Var, m62Var2, l78Var3, 4);
                l78Var = l78Var3;
                l78Var2 = l78Var4;
                bw7Var = bw7VarS0;
                m62Var = m62Var2;
                p65Var.j0(objM6);
            } else {
                l78Var2 = l78Var4;
                l78Var = l78Var3;
                bw7Var = bw7VarS0;
                m62Var = m62Var2;
            }
            zk7 zk7Var = (zk7) objM6;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = new gtc(l78Var, m62Var, 4);
                p65Var.j0(objM7);
            }
            m45 m45Var = (m45) objM7;
            boolean zH2 = p65Var.h(hl7Var);
            Object objM8 = p65Var.M();
            if (zH2 || objM8 == uobVar) {
                objM8 = new htc(hl7Var, 4);
                p65Var.j0(objM8);
            }
            hlg.j(wxb.a(r28VarG, false, (x45) objM8), pxf.E(1200550679, new iyc(l78Var2, z52Var, m45Var, tzcVar, bw7Var, z, ip7VarA, lycVar, hu7Var), p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i2, 22, tzcVar, yrbVar, hu7Var, lycVar);
        }
    }

    public static final void W(lyc lycVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1917973955);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(lycVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i2 & 48;
        o28 o28Var = o28.b;
        if (i4 == 0) {
            i3 |= p65Var.f(o28Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            S(o28Var, null, pxf.E(1990607240, new nra(7, lycVar), p65Var), p65Var, ((i3 >> 3) & 14) | 384, 2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i2, 13, lycVar);
        }
    }

    public static final void X(vzc vzcVar, lyc lycVar, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1167297644);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(vzcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lycVar) ? 32 : 16;
        }
        int i4 = i2 & 384;
        o28 o28Var = o28.b;
        if (i4 == 0) {
            i3 |= p65Var.f(o28Var) ? 256 : 128;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            S(o28Var, null, pxf.E(163201689, new dyc(vzcVar, i5, lycVar), p65Var), p65Var, ((i3 >> 6) & 14) | 384, 2);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(vzcVar, lycVar, i2, 5);
        }
    }

    public static final void Y(x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2078017783);
        int i4 = i2 & 6;
        o28 o28Var = o28.b;
        int i5 = 2;
        if (i4 == 0) {
            i3 = (p65Var.f(o28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            R((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, p65Var, o28Var, vo7.R(p65Var, R.string.subscription_error_pending_purchase), null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jd3(i2, i5);
        }
    }

    public static final void Z(c0d c0dVar, nhc nhcVar, hu7 hu7Var, lyc lycVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        c0dVar.getClass();
        nhcVar.getClass();
        lycVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2024065876);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(c0dVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(hu7Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(lycVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            yrb yrbVarK = wgf.K(p65Var2);
            r28 r28VarJ = rv8.J(bgf.N(r28Var.b(jfc.c), "subscription_screen"), jq7.t(p65Var2), null);
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new dsb(24);
                p65Var2.j0(objM);
            }
            r28 r28VarA = wxb.a(r28VarJ, false, (x45) objM);
            hl4 hl4Var = qb8.p;
            sn3 sn3Var = kt7.b;
            p65Var = p65Var2;
            pr7.b(r28VarA, pxf.E(313390376, new q6b(c0dVar, yrbVarK, lycVar, 29), p65Var2), null, pxf.E(-559020186, new eyc(nhcVar, i4), p65Var2), null, 0, ((zo7) p65Var2.j(sn3Var)).a, ((zo7) p65Var2.j(sn3Var)).n, hl4Var, pxf.E(1601318077, new fd3(c0dVar, yrbVarK, hu7Var, lycVar, 7), p65Var2), p65Var, 805309488, 52);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(c0dVar, nhcVar, hu7Var, lycVar, r28Var, i2);
        }
    }

    public static final void a(boolean z, m45 m45Var, x12 x12Var, int i2, int i3) {
        boolean z2;
        int i4;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-361453782);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            z2 = z;
        } else {
            z2 = z;
            i4 = i2 | (p65Var.g(z2) ? 4 : 2);
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.h(m45Var) ? 32 : 16;
        }
        int i6 = 0;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            boolean z4 = i5 != 0 ? true : z2;
            Object objA = z57.a(p65Var);
            if (objA == null) {
                p65Var.Y(535274673);
                objA = a67.a(p65Var);
            } else {
                p65Var.Y(535271790);
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
            long j2 = p65Var.T;
            boolean zF2 = p65Var.f(vl0Var) | p65Var.e(j2);
            Object objM2 = p65Var.M();
            Object obj = objM2;
            if (zF2 || objM2 == uobVar) {
                x02 x02Var = new x02(new wl0(j2, objA));
                x02Var.c = new n7(22);
                p65Var.j0(x02Var);
                obj = x02Var;
            }
            x02 x02Var2 = (x02) obj;
            p65Var.Y(-585307852);
            boolean zH = p65Var.h(x02Var2) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM3 = p65Var.M();
            int i7 = 13;
            if (zH || objM3 == uobVar) {
                objM3 = new n(x02Var2, i7, m45Var);
                p65Var.j0(objM3);
            }
            kyd.v((m45) objM3, p65Var);
            Boolean boolValueOf = Boolean.valueOf(z4);
            int i8 = i4 & 14;
            boolean zH2 = p65Var.h(x02Var2) | (i8 == 4);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new xl0(x02Var2, z4, i6);
                p65Var.j0(objM4);
            }
            kyd.n(boolValueOf, x02Var2, null, (x45) objM4, p65Var, i8);
            boolean zH3 = p65Var.h(vl0Var) | p65Var.h(x02Var2);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                objM5 = new i0(vl0Var, i7, x02Var2);
                p65Var.j0(objM5);
            }
            kyd.i(vl0Var, x02Var2, (x45) objM5, p65Var);
            p65Var.p(false);
            z3 = z4;
        } else {
            p65Var.S();
            z3 = z2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yl0(z3, m45Var, i2, i3, 0);
        }
    }

    public static final void a0(UpsellInfo upsellInfo, String str, MembershipType membershipType, hu7 hu7Var, cr0 cr0Var, cyc cycVar, r28 r28Var, SubscriptionViewModel subscriptionViewModel, x12 x12Var, int i2) {
        int i3;
        hu7 hu7Var2;
        p65 p65Var;
        r28 r28Var2;
        SubscriptionViewModel subscriptionViewModel2;
        SubscriptionViewModel subscriptionViewModel3;
        int i4;
        r28 r28Var3;
        SubscriptionViewModel subscriptionViewModel4;
        c1e c1eVar;
        upsellInfo.getClass();
        str.getClass();
        hu7Var.getClass();
        cr0Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1145493808);
        if ((i2 & 6) == 0) {
            i3 = ((i2 & 8) == 0 ? p65Var2.f(upsellInfo) : p65Var2.h(upsellInfo) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(str) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.d(membershipType == null ? -1 : membershipType.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            hu7Var2 = hu7Var;
            i3 |= p65Var2.f(hu7Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            hu7Var2 = hu7Var;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(cr0Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(cycVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i5 = 1572864 | i3;
        if ((12582912 & i2) == 0) {
            i5 = 5767168 | i3;
        }
        if (p65Var2.P(i5 & 1, (4793491 & i5) != 4793490)) {
            p65Var2.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var2.z()) {
                boolean z = ((i5 & 14) == 4 || ((i5 & 8) != 0 && p65Var2.h(upsellInfo))) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 896) == 256);
                Object objM = p65Var2.M();
                if (z || objM == uobVar) {
                    objM = new pi9((Parcelable) upsellInfo, str, (Object) membershipType, 10);
                    p65Var2.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var2);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    subscriptionViewModel3 = (SubscriptionViewModel) to7.z(n1b.a.b(SubscriptionViewModel.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
                    i4 = i5 & (-29360129);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
                i4 = i5 & (-29360129);
                subscriptionViewModel3 = subscriptionViewModel;
            }
            p65Var2.q();
            Object objJ = p65Var2.j(r57.a);
            if (objJ == null) {
                ay0.e("Required value was null.");
                return;
            }
            Activity activity = (Activity) objJ;
            l78 l78VarZ = guc.z(subscriptionViewModel3.w, p65Var2, 0);
            nhc nhcVarF = mk7.F(p65Var2);
            int i7 = i4 & 458752;
            int i8 = i4;
            int i9 = i8 & 57344;
            boolean zF = (i7 == 131072) | p65Var2.f(subscriptionViewModel3) | (i9 == 16384) | p65Var2.f(activity);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                objM2 = new lyc(subscriptionViewModel3, cycVar, cr0Var, activity);
                p65Var2.j0(objM2);
            }
            r28 r28Var4 = r28Var3;
            Z((c0d) l78VarZ.getValue(), nhcVarF, hu7Var2, (lyc) objM2, r28Var4, p65Var2, ((i8 >> 3) & 896) | ((i8 >> 6) & 57344));
            p65Var = p65Var2;
            c0d c0dVar = (c0d) l78VarZ.getValue();
            n92 n92Var = null;
            tzc tzcVar = c0dVar instanceof tzc ? (tzc) c0dVar : null;
            c1e c1eVar2 = c1e.a;
            if (tzcVar != null) {
                p65Var.Y(-1886198372);
                boolean zH = p65Var.h(subscriptionViewModel3) | p65Var.f(tzcVar);
                Object objM3 = p65Var.M();
                if (zH || objM3 == uobVar) {
                    objM3 = new n79(subscriptionViewModel3, tzcVar, n92Var, 19);
                    p65Var.j0(objM3);
                }
                kyd.k(p65Var, (b55) objM3, c1eVar2);
            } else {
                p65Var.Y(-1894603278);
            }
            p65Var.p(false);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH2 = (i9 == 16384) | p65Var.h(subscriptionViewModel3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.h(activity);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                subscriptionViewModel4 = subscriptionViewModel3;
                c1eVar = c1eVar2;
                kyc kycVar = new kyc(subscriptionViewModel4, nhcVarF, resources, cr0Var, activity, (n92) null, 0);
                p65Var.j0(kycVar);
                objM4 = kycVar;
            } else {
                subscriptionViewModel4 = subscriptionViewModel3;
                c1eVar = c1eVar2;
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
            boolean zF2 = p65Var.f(l78VarZ) | p65Var.h(subscriptionViewModel4) | (i7 == 131072);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new i16(subscriptionViewModel4, cycVar, l78VarZ, 26);
                p65Var.j0(objM5);
            }
            a(false, (m45) objM5, p65Var, 0, 1);
            subscriptionViewModel2 = subscriptionViewModel4;
            r28Var2 = r28Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            subscriptionViewModel2 = subscriptionViewModel;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(i2, 5, r28Var2, upsellInfo, str, membershipType, hu7Var, cr0Var, cycVar, subscriptionViewModel2);
        }
    }

    public static final void b(final cg1 cg1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        final int i3;
        int i4;
        String strD = cg1Var.f;
        int i5 = cg1Var.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(440630603);
        int i6 = (p65Var.f(cg1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i6 & 1, (i6 & 19) != 18)) {
            String str = cg1Var.d;
            boolean z = cg1Var.a;
            kx kxVarW = ho2.w(p65Var, -1755740010);
            String strA = af1.a(cg1Var.h, p65Var);
            if (i5 == 1) {
                p65Var.Y(-1387527748);
                p65Var.p(false);
                i4 = 1;
            } else {
                i4 = 1;
                p65Var.Y(-1387526284);
                int i7 = i5 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i7, new Object[]{strD, Integer.valueOf(i7)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i4] = strA;
            String strQ = vo7.Q(R.string.notification_type_catalog_response_created, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, strA, 0, false, 6);
                mx mxVarC = ka1.c(strA, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j2 = cg1Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
                int i8 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i9 = i6 & 14;
                int i10 = (i8 == 32 ? i4 : 0) | (i9 == 4 ? i4 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i10 != 0 || objM == uobVar) {
                    objM = new m45() { // from class: dg1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i11 = i;
                            c1e c1eVar = c1e.a;
                            cg1 cg1Var2 = cg1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i11) {
                                case 0:
                                    ek8Var2.n(cg1Var2.c, cg1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(cg1Var2.e, cg1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i11 = (i8 == 32 ? i4 : 0) | (i9 == 4 ? i4 : 0);
                Object objM2 = p65Var.M();
                if (i11 != 0 || objM2 == uobVar) {
                    i3 = i4;
                    objM2 = new m45() { // from class: dg1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i112 = i3;
                            c1e c1eVar = c1e.a;
                            cg1 cg1Var2 = cg1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i112) {
                                case 0:
                                    ek8Var2.n(cg1Var2.c, cg1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(cg1Var2.e, cg1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                } else {
                    i3 = i4;
                }
                rv8.f(z, str, numValueOf, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(cg1Var, ek8Var, i2, i3);
        }
    }

    public static final void b0(int i2, x12 x12Var, m45 m45Var, r28 r28Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1078653208);
        int i3 = (p65Var.h(m45Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            qk7.b(r28Var, null, m45Var, null, vn7.J(R.drawable.ic_close_24, 0, p65Var), vo7.R(p65Var, R.string.common_close), 0L, 0L, p65Var, ((i3 << 6) & 896) | ((i3 >> 3) & 14) | 32768, Mp4VideoDirectory.TAG_TEMPORAL_QUALITY);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(m45Var, r28Var, i2, 7);
        }
    }

    public static final void c(yyc yycVar, lyc lycVar, x12 x12Var, int i2) {
        int i3;
        lyc lycVar2;
        int i4;
        boolean z;
        String strW;
        boolean z2;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1075436830);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(yycVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lycVar) ? 32 : 16;
        }
        int i5 = i2 & 384;
        o28 o28Var2 = o28.b;
        if (i5 == 0) {
            i3 |= p65Var.f(o28Var2) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            bzc bzcVar = yycVar.e;
            zw7 zw7Var = yycVar.b;
            boolean z3 = yycVar.d;
            if (bzcVar.equals(azc.a)) {
                i4 = z3 ? R.string.subscription_confirmation_cta_default_onboarding : R.string.subscription_confirmation_cta_default;
            } else {
                if (!bzcVar.equals(zyc.a)) {
                    ygf.a();
                    return;
                }
                i4 = R.string.subscription_confirmation_cta_back_to_post;
            }
            r28 r28VarN = bgf.N(w2g.E(o28Var2, 24.0f, 0.0f, 2), "main");
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
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
            d46.a(yycVar.a, hl0.XL, bgf.N(o28Var2, "avatar"), yycVar.b, null, null, null, 0.0f, 0, null, null, p65Var, 432, 0, 4080);
            String strR = vo7.R(p65Var, yycVar.c ? R.string.subscription_confirmation_header_free_trial : zw7Var == zw7.PREMIUM ? R.string.subscription_confirmation_header_premium : z3 ? R.string.subscription_confirmation_header_regular_onboarding : R.string.subscription_confirmation_header_regular);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, bgf.N(w2g.G(jfc.d(o28Var2, 1.0f), 0.0f, 24.0f, 0.0f, 0.0f, 13), "header"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).F, p65Var, 48, 0, 130044);
            int i7 = myc.a[zw7Var.ordinal()];
            if (i7 == 1) {
                z = false;
                strW = km4.w(p65Var, -382575725, R.string.subscription_confirmation_body_premium, p65Var, false);
            } else if (i7 == 2) {
                z = false;
                p65Var.Y(-382572070);
                strW = vo7.R(p65Var, z3 ? R.string.subscription_confirmation_body_regular_onboarding : R.string.subscription_confirmation_body_regular);
                p65Var.p(false);
            } else {
                if (i7 != 3) {
                    throw ho2.L(p65Var, -382578019, false);
                }
                p65Var.Y(1025498922);
                z = false;
                p65Var.p(false);
                strW = "";
            }
            jjd.b(strW, bgf.N(w2g.G(jfc.d(o28Var2, 1.0f), 0.0f, 24.0f, 0.0f, 0.0f, 13), "body"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 48, 0, 130044);
            String strR2 = vo7.R(p65Var, i4);
            xn7 xn7Var = xn7.L;
            if ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) {
                z = true;
            }
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                z2 = true;
                o28Var = o28Var2;
                objM = new joc(0, lycVar, lyc.class, "onConfirmationNavigate", "onConfirmationNavigate()V", 0, 14);
                p65Var.j0(objM);
            } else {
                z2 = true;
                o28Var = o28Var2;
            }
            lycVar2 = lycVar;
            p65Var = p65Var;
            fo7.i((m45) ((qh6) objM), strR2, xn7Var, bgf.N(w2g.G(o28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13), "cta"), false, p65Var, 3456, 16);
            p65Var.p(z2);
        } else {
            lycVar2 = lycVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new meb(yycVar, lycVar2, i2, 6);
        }
    }

    public static final void c0(x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(842979877);
        int i4 = i2 & 6;
        int i5 = 4;
        o28 o28Var = o28.b;
        if (i4 == 0) {
            i3 = (p65Var.f(o28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            R((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, p65Var, o28Var, vo7.R(p65Var, R.string.common_oops), null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jd3(i2, i5);
        }
    }

    public static final void d(czc czcVar, lyc lycVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1474054653);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(czcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(lycVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            b24 b24Var = czcVar.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                joc jocVar = new joc(0, lycVar, lyc.class, "refresh", "refresh()V", 0, 15);
                p65Var.j0(jocVar);
                objM = jocVar;
            }
            iq7.a(b24Var, bgf.N(r28Var, "error"), null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 8, czcVar, lycVar, r28Var);
        }
    }

    public static final void d0(b0d b0dVar, x12 x12Var, int i2) {
        int i3;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1024603203);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(b0dVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i5 = i2 & 48;
        o28 o28Var = o28.b;
        if (i5 == 0) {
            i3 |= p65Var.f(o28Var) ? 32 : 16;
        }
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            a0d a0dVar = b0dVar.a;
            if (a0dVar.equals(zzc.a)) {
                i4 = R.string.subscription_error_upgrade_not_allowed_use_web;
            } else {
                if (!a0dVar.equals(yzc.a)) {
                    ygf.a();
                    return;
                }
                i4 = R.string.subscription_error_upgrade_not_allowed_use_ios;
            }
            R(i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, p65Var, o28Var, vo7.R(p65Var, i4), null);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s8(i2, 12, b0dVar);
        }
    }

    public static final void e(r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(362645941);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarB = r28Var.b(jfc.c);
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            xz5.o(iy0.a.a(jfc.s(bgf.N(o28.b, "loading"), null, 3), z46.h), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 17);
        }
    }

    public static final void e0(s2f s2fVar, o2f o2fVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1738901967);
        int i3 = i2 | (p65Var.f(s2fVar) ? 4 : 2) | (p65Var.f(o2fVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            rh4 rh4Var = jfc.c;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, rh4Var);
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
            jy8 jy8VarG = w2g.g(2, 24.0f);
            String strR = vo7.R(p65Var, R.string.onboarding_welcome_title);
            sn3 sn3Var = jt7.c;
            flb.D(strR, w2g.G(w2g.B(jfc.d(bgf.N(o28Var, "welcome_title"), 1.0f), jy8VarG), 0.0f, 64.0f, 0.0f, 0.0f, 13), mkd.a(((bu7) p65Var.j(sn3Var)).C, 0L, 0L, null, null, null, 0L, 0L, null, 3, 0L, null, null, 16744447), null, 2, false, 1, 0, null, cd7.h(en7.B(11), ((bu7) p65Var.j(sn3Var)).C.a.b), p65Var, 1597488, 424);
            String strR2 = vo7.R(p65Var, R.string.onboarding_welcome_subtitle);
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).l;
            sn3 sn3Var2 = kt7.b;
            flb.D(strR2, w2g.G(w2g.B(jfc.d(bgf.N(o28Var, "welcome_subtitle"), 1.0f), jy8VarG), 0.0f, 12.0f, 0.0f, 0.0f, 13), mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 3, 0L, null, null, 16744446), null, 2, false, 1, 0, null, cd7.h(en7.B(11), ((bu7) p65Var.j(sn3Var)).l.a.b), p65Var, 1597488, 424);
            tp7.c(0.0f, 6, 6, 0L, p65Var, w2g.G(w2g.B(bgf.N(o28Var, "welcome_divider"), jy8VarG), 0.0f, 28.0f, 0.0f, 0.0f, 13));
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f2 = r3.widthPixels / context.getResources().getDisplayMetrics().density;
            boolean z = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.EXPANDED;
            long j5 = ((zo7) p65Var.j(sn3Var2)).b;
            amb ambVar = bmb.a;
            r28 r28VarB = bo.B(r40.y(jfc.l(w2g.D(o28Var, z ? 24.0f : 8.0f, z ? 16.0f : 8.0f), z ? 120.0f : 64.0f), ambVar), 1.0f, gsa.a0(p65Var), ambVar);
            r28 r28VarD2 = w2g.D(jfc.d(bgf.N(o28Var, "welcome_authors").b(new sq6(1.0f, true)), 1.0f), !z ? 24.0f : 0.0f, 12.0f);
            zi5 zi5Var = qb8.e;
            m40.p(r28VarD2, zi5Var, zi5Var, null, 4, 0, pxf.E(492064025, new do7(2, j5, s2fVar, r28VarB), p65Var), p65Var, 1597872, 40);
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                k8e k8eVar = new k8e(0, o2fVar, o2f.class, "onCallToActionClicked", "onCallToActionClicked()V", 0, 25);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            }
            kyd.f((m45) ((qh6) objM), w2g.G(ka1.i(z46.q, bgf.N(o28Var, "welcome_continue_button")), 0.0f, 0.0f, 0.0f, 24.0f, 7), false, null, p65Var, 0, 12);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new n2f(i2, 0, r28Var, s2fVar, o2fVar);
        }
    }

    public static final void f(r92 r92Var, SourceParameter sourceParameter, rq5 rq5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r92Var.getClass();
        sourceParameter.getClass();
        rq5Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-235179737);
        int i3 = i2 | (p65Var2.f(r92Var) ? 4 : 2) | (p65Var2.f(sourceParameter) ? 32 : 16) | (p65Var2.f(rq5Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            boolean z = ((i3 & 14) == 4) | ((i3 & 896) == 256) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new le0(rq5Var, r92Var, sourceParameter, 12);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            g3d.a(bgf.N(hlg.r(r28VarD, false, null, null, (m45) objM, 15), "continue_reading_banner"), bmb.a(4.0f), ((zo7) p65Var2.j(kt7.b)).a, 0L, 0.0f, 8.0f, null, pxf.E(1984433772, new k6c(26, r92Var), p65Var2), p65Var, 12779520, 88);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 21, r92Var, sourceParameter, rq5Var, r28Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:46:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f0(defpackage.s2f r20, defpackage.o2f r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            r1 = r20
            r2 = r21
            r4 = r24
            r1.getClass()
            r0 = r23
            p65 r0 = (defpackage.p65) r0
            r3 = -128407370(0xfffffffff858a8b6, float:-1.7577469E34)
            r0.a0(r3)
            r3 = r4 & 6
            if (r3 != 0) goto L22
            boolean r3 = r0.f(r1)
            if (r3 == 0) goto L1f
            r3 = 4
            goto L20
        L1f:
            r3 = 2
        L20:
            r3 = r3 | r4
            goto L23
        L22:
            r3 = r4
        L23:
            r5 = r4 & 48
            if (r5 != 0) goto L33
            boolean r5 = r0.f(r2)
            if (r5 == 0) goto L30
            r5 = 32
            goto L32
        L30:
            r5 = 16
        L32:
            r3 = r3 | r5
        L33:
            r5 = r25 & 4
            if (r5 == 0) goto L3c
            r3 = r3 | 384(0x180, float:5.38E-43)
        L39:
            r6 = r22
            goto L4e
        L3c:
            r6 = r4 & 384(0x180, float:5.38E-43)
            if (r6 != 0) goto L39
            r6 = r22
            boolean r7 = r0.f(r6)
            if (r7 == 0) goto L4b
            r7 = 256(0x100, float:3.59E-43)
            goto L4d
        L4b:
            r7 = 128(0x80, float:1.8E-43)
        L4d:
            r3 = r3 | r7
        L4e:
            r7 = r3 & 147(0x93, float:2.06E-43)
            r8 = 146(0x92, float:2.05E-43)
            r9 = 0
            r10 = 1
            if (r7 == r8) goto L58
            r7 = r10
            goto L59
        L58:
            r7 = r9
        L59:
            r3 = r3 & r10
            boolean r3 = r0.P(r3, r7)
            if (r3 == 0) goto La8
            if (r5 == 0) goto L65
            o28 r3 = defpackage.o28.b
            goto L66
        L65:
            r3 = r6
        L66:
            java.lang.Object r5 = r0.M()
            uob r6 = defpackage.w12.a
            if (r5 != r6) goto L78
            sqe r5 = new sqe
            r6 = 17
            r5.<init>(r6)
            r0.j0(r5)
        L78:
            x45 r5 = (defpackage.x45) r5
            r28 r5 = defpackage.wxb.a(r3, r9, r5)
            java.lang.String r6 = "onboarding_welcome"
            r28 r5 = defpackage.bgf.N(r5, r6)
            mz1 r6 = defpackage.r40.d
            ec r7 = new ec
            r8 = 12
            r7.<init>(r1, r8, r2)
            r8 = -475484987(0xffffffffe3a8acc5, float:-6.223005E21)
            mz1 r16 = defpackage.pxf.E(r8, r7, r0)
            r18 = 805306416(0x30000030, float:4.6566395E-10)
            r19 = 508(0x1fc, float:7.12E-43)
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            r11 = 0
            r13 = 0
            r15 = 0
            r17 = r0
            defpackage.pr7.b(r5, r6, r7, r8, r9, r10, r11, r13, r15, r16, r17, r18, r19)
            goto Lae
        La8:
            r17 = r0
            r17.S()
            r3 = r6
        Lae:
            mwa r7 = r17.s()
            if (r7 == 0) goto Lbf
            oc0 r0 = new oc0
            r6 = 21
            r5 = r25
            r0.<init>(r1, r2, r3, r4, r5, r6)
            r7.d = r0
        Lbf:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.f0(s2f, o2f, r28, x12, int, int):void");
    }

    public static final void g(ie3 ie3Var, kv6 kv6Var, ld3 ld3Var, sh9 sh9Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1449571573);
        int i3 = i2 | (p65Var.f(ie3Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(ld3Var) ? 256 : 128) | (p65Var.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            String str = ie3Var.a;
            int i4 = i3 & 896;
            int i5 = i3 & 14;
            boolean z = (i4 == 256) | (i5 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new rc0(ld3Var, ie3Var, null, 8);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, str);
            boolean z2 = (i5 == 4) | (i4 == 256) | ((i3 & 7168) == 2048);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new o8(ie3Var, ld3Var, sh9Var, 11);
                p65Var.j0(objM2);
            }
            k40.t(r28Var, kv6Var, null, null, null, null, false, null, (x45) objM2, p65Var, ((i3 >> 12) & 14) | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 508);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(ie3Var, kv6Var, ld3Var, sh9Var, r28Var, i2, 15);
        }
    }

    public static final void g0(String str, qlb qlbVar, r28 r28Var, t2f t2fVar, x12 x12Var, int i2) {
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-32258580);
        int i3 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.f(qlbVar) ? 32 : 16) | 1408;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            int i4 = i2 & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = (i3 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new nmc(str, 11);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    t2fVar = (t2f) to7.z(n1b.a.b(t2f.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var = o28.b;
                }
            } else {
                p65Var.S();
            }
            r28 r28Var2 = r28Var;
            p65Var.q();
            f0((s2f) guc.z(t2fVar.g, p65Var, 0).getValue(), new o2f(qlbVar, t2fVar), r28Var2, p65Var, 384, 0);
            boolean zH = p65Var.h(t2fVar);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new obb(t2fVar, null, 27);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var = r28Var2;
        } else {
            p65Var.S();
        }
        t2f t2fVar2 = t2fVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 28, r28Var, (Object) str, (Object) qlbVar, (Object) t2fVar2);
        }
    }

    public static final void h(je3 je3Var, ld3 ld3Var, r28 r28Var, x12 x12Var, int i2) {
        je3 je3Var2 = je3Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(320090241);
        int i3 = i2 | (p65Var.f(je3Var2) ? 4 : 2) | (p65Var.f(ld3Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            je3Var2 = je3Var;
            b24 b24Var = je3Var2.a;
            Integer numF = f49.F(b24Var);
            String strR = vo7.R(p65Var, numF != null ? numF.intValue() : R.string.digest_no_digest_title);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                gu1 gu1Var = new gu1(0, ld3Var, ld3.class, "refresh", "refresh()V", 0, 14);
                p65Var.j0(gu1Var);
                objM = gu1Var;
            }
            iq7.a(b24Var, jfc.c, null, strR, null, null, (m45) ((qh6) objM), null, p65Var, 48, 180);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 22, je3Var2, ld3Var, r28Var);
        }
    }

    public static final void h0(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-105639061);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            mz1 mz1Var = r40.e;
            o28 o28Var = o28.b;
            qk7.f(mz1Var, o28Var, null, null, null, null, 0L, 0L, null, p65Var, 54, 508);
            r28Var = o28Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 17);
        }
    }

    public static final void i(SourceParameter sourceParameter, ld3 ld3Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1756967038);
        int i3 = i2 | (p65Var.f(sourceParameter) ? 4 : 2) | (p65Var.f(ld3Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            sn3 sn3Var = kt7.b;
            long j2 = ((zo7) p65Var.j(sn3Var)).c;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(flb.a0(o28Var, j2, nr5Var), 0.0f, 16.0f, 0.0f, 0.0f, 13);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            tp7.c(0.0f, 0, 5, ((zo7) p65Var.j(sn3Var)).z, p65Var, null);
            boolean z = false;
            jjd.b(vo7.R(p65Var, R.string.digest_footer_text), w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 48.0f, 24.0f, 0.0f, 8), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).G, p65Var, 48, 0, 130044);
            p65Var = p65Var;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            if ((i3 & 14) == 4) {
                z = true;
            }
            boolean z3 = z2 | z;
            Object objM = p65Var.M();
            if (z3 || objM == w12.a) {
                objM = new gd3(ld3Var, 1, sourceParameter);
                p65Var.j0(objM);
            }
            fo7.i((m45) objM, vo7.R(p65Var, R.string.digest_footer_action), xn7.M, jfc.d(w2g.F(o28Var, 24.0f, 19.0f, 24.0f, 19.0f), 1.0f), false, p65Var, 3456, 16);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 20, sourceParameter, ld3Var, r28Var2);
        }
    }

    public static final r28 i0(r28 r28Var, p65 p65Var) {
        ((jp7) p65Var.j(kt7.a)).getClass();
        ip7 ip7VarA = jp7.a(p65Var);
        ip7 ip7Var = ip7.COMPACT;
        o28 o28Var = o28.b;
        return r28Var.b(ip7VarA == ip7Var ? jfc.d(o28Var, 1.0f) : jfc.d(jfc.q(o28Var, 0.0f, 264.0f, 1), 1.0f));
    }

    public static final void j(final ie3 ie3Var, final ld3 ld3Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1486991765);
        int i3 = i2 | (p65Var.f(ie3Var) ? 4 : 2) | (p65Var.f(ld3Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 12.0f, 0.0f, 8);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            amb ambVar = bmb.a;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarF = jfc.f(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 38.0f, 0.0f, 2);
            sn3 sn3Var = kt7.b;
            r28 r28VarY = r40.y(bo.B(r28VarF, 1.0f, ((zo7) p65Var.j(sn3Var)).z, ambVar), ambVar);
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i6 = i3 & 14;
            boolean z = (i5 == 32) | (i6 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                final int i7 = 0;
                objM = new m45() { // from class: ed3
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i8 = i7;
                        c1e c1eVar = c1e.a;
                        ie3 ie3Var2 = ie3Var;
                        ld3 ld3Var2 = ld3Var;
                        switch (i8) {
                            case 0:
                                ld3Var2.a(ie3Var2.e, ie3Var2.a, ie3Var2.d, ie3Var2.f);
                                break;
                            default:
                                SourceParameter sourceParameter = ie3Var2.e;
                                sourceParameter.getClass();
                                ld3Var2.a.a(sourceParameter);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            r28 r28VarR2 = hlg.r(r28VarY, false, null, null, (m45) objM, 15);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarR2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            String str = new SimpleDateFormat("MMMM d, yyyy", Locale.US).format(Long.valueOf(ie3Var.b));
            str.getClass();
            r28 r28VarG2 = w2g.G(o28Var, 16.0f, 0.0f, 16.0f, 0.0f, 10);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            jjd.b(str, r28VarG2.b(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true)), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 24960, 110588);
            qv5.b(vn7.J(R.drawable.ic_chevron_down_16, 0, p65Var), null, jfc.l(w2g.G(o28Var, 0.0f, 0.0f, 12.0f, 0.0f, 11), 16.0f), ((zo7) p65Var.j(sn3Var)).n, p65Var, 440, 0);
            p65Var = p65Var;
            final int i9 = 1;
            ka1.B(p65Var, true, o28Var, 8.0f, p65Var);
            boolean z2 = (i5 == 32) | (i6 == 4);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new m45() { // from class: ed3
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i82 = i9;
                        c1e c1eVar = c1e.a;
                        ie3 ie3Var2 = ie3Var;
                        ld3 ld3Var2 = ld3Var;
                        switch (i82) {
                            case 0:
                                ld3Var2.a(ie3Var2.e, ie3Var2.a, ie3Var2.d, ie3Var2.f);
                                break;
                            default:
                                SourceParameter sourceParameter = ie3Var2.e;
                                sourceParameter.getClass();
                                ld3Var2.a.a(sourceParameter);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, o28Var, false, null, null, qb8.h, p65Var, 1572912, 60);
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 21, ie3Var, ld3Var, obj);
        }
    }

    public static final void j0(WorkDatabase workDatabase, r32 r32Var, b7f b7fVar) {
        int i2;
        workDatabase.getClass();
        r32Var.getClass();
        if (Build.VERSION.SDK_INT < 24) {
            return;
        }
        ArrayList arrayListT = d46.T(b7fVar);
        int i3 = 0;
        while (!arrayListT.isEmpty()) {
            List list = ((b7f) bu1.U0(arrayListT)).d;
            list.getClass();
            if (list.isEmpty()) {
                i2 = 0;
            } else {
                Iterator it2 = list.iterator();
                i2 = 0;
                while (it2.hasNext()) {
                    if (((y7f) it2.next()).b.j.b() && (i2 = i2 + 1) < 0) {
                        d46.h0();
                        throw null;
                    }
                }
            }
            i3 += i2;
        }
        if (i3 == 0) {
            return;
        }
        int iIntValue = ((Number) n01.c0(workDatabase.x().a, true, false, new sqe(29))).intValue();
        if (iIntValue + i3 <= 8) {
            return;
        }
        ay0.e(ev6.s(iIntValue, i3, "Too many workers with contentUriTriggers are enqueued:\ncontentUriTrigger workers limit: 8;\nalready enqueued count: ", ";\ncurrent enqueue operation count: ", ".\nTo address this issue you can: \n1. enqueue less workers or batch some of workers with content uri triggers together;\n2. increase limit via Configuration.Builder.setContentUriTriggerWorkersLimit;\nPlease beware that workers with content uri triggers immediately occupy slots in JobScheduler so no updates to content uris are missed."));
    }

    public static final void k(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        int i3;
        long j4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1848180779);
        int i4 = i2 | (p65Var.f(r28Var) ? 4 : 2) | 16;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                i3 = i4 & (-113);
                j4 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                i3 = i4 & (-113);
                j4 = j2;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), m40.V(r28Var, p65Var, i3 & 14), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i5);
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
            int i6 = (int) (j6 ^ (j6 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j7 = p65Var.T;
            int i7 = (int) (j7 ^ (j7 >>> 32));
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
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 24.0f, 24.0f, 0.0f, 8);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j8 = p65Var.T;
            int i8 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarG);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarE = jfc.e(new sq6(1.0f, true), 38.0f);
            amb ambVar = bmb.a;
            r28 r28VarY = r40.y(r28VarE, ambVar);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarY, j4, nr5Var), p65Var, 0);
            hp7.t(p65Var, jfc.l(o28Var, 8.0f));
            dy0.a(flb.a0(r40.y(jfc.l(o28Var, 38.0f), ambVar), j4, nr5Var), p65Var, 0);
            p65Var.p(true);
            long j9 = j4;
            ok7.s(0.6f, 432, 0, j9, p65Var, w2g.G(o28Var, 24.0f, 40.0f, 24.0f, 0.0f, 8), ((bu7) p65Var.j(jt7.c)).F);
            r(null, j9, false, p65Var, 0, 5);
            p65Var = p65Var;
            p65Var.Y(253658778);
            for (int i9 = 0; i9 < 9; i9++) {
                il7.l(stc.M, null, j9, null, p65Var, 6, 10);
            }
            ho2.N(p65Var, false, true, true, true);
            j3 = j9;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var, j3, i2, 8);
        }
    }

    public static final long k0(int i2, int i3, cfc cfcVar, dqb dqbVar, cfc cfcVar2) {
        int i4;
        int i5;
        if (!g76.L(cfcVar, cfc.c)) {
            i2 = B0(cfcVar.a, dqbVar);
            i3 = B0(cfcVar.b, dqbVar);
        }
        xe3 xe3Var = cfcVar2.a;
        xe3 xe3Var2 = cfcVar2.b;
        if ((xe3Var instanceof ue3) && i2 != Integer.MIN_VALUE && i2 != Integer.MAX_VALUE && i2 > (i5 = ((ue3) xe3Var).a)) {
            i2 = i5;
        }
        if ((xe3Var2 instanceof ue3) && i3 != Integer.MIN_VALUE && i3 != Integer.MAX_VALUE && i3 > (i4 = ((ue3) xe3Var2).a)) {
            i3 = i4;
        }
        return f76.B(i2, i3);
    }

    public static final void l(int i2, x12 x12Var, m45 m45Var, r28 r28Var) {
        int i3;
        m45 m45Var2 = m45Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1314244637);
        int i4 = i2 | (p65Var.f(r28Var) ? 4 : 2) | (p65Var.h(m45Var2) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            m45Var2 = m45Var;
            i3 = 1;
            gq7.a(null, null, vo7.R(p65Var, R.string.digest_no_digest_title), vo7.R(p65Var, R.string.digest_no_digest_description), 0L, vo7.R(p65Var, R.string.digest_view_history), m45Var2, null, null, 0.0f, 0.0f, p65Var, (i4 << 15) & 3670016, 0, 1939);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            i3 = 1;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new va(r28Var, m45Var2, i2, i3);
        }
    }

    public static final double l0(int i2, int i3, int i4, int i5, dqb dqbVar) {
        double d2 = ((double) i4) / ((double) i2);
        double d3 = ((double) i5) / ((double) i3);
        int i6 = hw2.a[dqbVar.ordinal()];
        if (i6 == 1) {
            return Math.max(d2, d3);
        }
        if (i6 == 2) {
            return Math.min(d2, d3);
        }
        ygf.a();
        return 0.0d;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:81:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m(defpackage.me3 r23, defpackage.kv6 r24, defpackage.ld3 r25, defpackage.sh9 r26, defpackage.r28 r27, defpackage.nhc r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 316
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.m(me3, kv6, ld3, sh9, r28, nhc, x12, int, int):void");
    }

    public static final dx m0(dx dxVar) {
        dx dxVarC = dxVar.c();
        int iB = dxVarC.b();
        for (int i2 = 0; i2 < iB; i2++) {
            dxVarC.e(i2, dxVar.a(i2));
        }
        return dxVarC;
    }

    public static final void n(String str, String str2, bo4 bo4Var, uef uefVar, r28 r28Var, x12 x12Var, int i2) {
        str2.getClass();
        bo4Var.getClass();
        uefVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1230681632);
        int i3 = 2;
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(uefVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i5 = 1;
        int i6 = 0;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            boolean z = ((((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var.f(str2)) || (i4 & 48) == 32) | ((((i4 & 14) ^ 6) > 4 && p65Var.f(str)) || (i4 & 6) == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new bb0(str, str2, i5);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            qe3 qe3Var = (qe3) to7.z(n1b.a.b(qe3.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            l78 l78VarZ = guc.z(qe3Var.m, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            nhc nhcVarF = mk7.F(p65Var);
            ld3 ld3Var = new ld3(uefVar, qe3Var);
            md3 md3Var = new md3(uefVar, i6, qe3Var);
            m((me3) l78VarZ.getValue(), kv6VarA, ld3Var, md3Var, r28Var, nhcVarF, p65Var, 24576, 0);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new wi1(bo4Var, kv6VarA, null, i3);
                p65Var.j0(objM2);
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM2, c1eVar);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean zH2 = p65Var.h(qe3Var) | p65Var.h(sb2Var) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                objM4 = new b9((Object) qe3Var, (Object) sb2Var, nhcVarF, resources, (Object) md3Var, (n92) null, 16);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, c1eVar);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, str2, bo4Var, uefVar, r28Var, i2, 14);
        }
    }

    public static final void n0(byte[] bArr, byte[] bArr2, int i2, int i3, f66 f66Var) {
        bArr.getClass();
        f66Var.getClass();
        if (i2 + i3 > bArr2.length) {
            f49.K(f66Var, d66.WARN, e66.MAINTAINER, co.s, null, false, 56);
        } else if (i3 > bArr.length) {
            f49.K(f66Var, d66.WARN, e66.MAINTAINER, co.t, null, false, 56);
        } else {
            System.arraycopy(bArr, 0, bArr2, i2, i3);
        }
    }

    public static final void o(String str, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(552731960);
        int i3 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(r28Var) ? 32 : 16);
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var = p65Var2;
            jjd.b(str, w2g.G(jfc.d(r28Var, 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).F, p65Var, i3 & 14, 0, 131068);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fe(str, r28Var, i2, 2);
        }
    }

    public static final float o0(kv6 kv6Var) {
        kv6Var.getClass();
        if (kv6Var.h() != 0) {
            return 4.0f;
        }
        vj3 vj3Var = new vj3(kv6Var.i());
        vj3 vj3Var2 = new vj3(4.0f);
        if (vj3Var.compareTo(vj3Var2) > 0) {
            vj3Var = vj3Var2;
        }
        return vj3Var.a;
    }

    public static final void p(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2060685414);
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
            g3d.a(bgf.N(jfc.d(w2g.G(o28Var, 8.0f, 0.0f, 8.0f, 16.0f, 2), 1.0f), "post_page_first_repost_snackbar"), bmb.a(4.0f), ((zo7) p65Var.j(kt7.b)).d, 0L, 0.0f, 6.0f, null, pxf.E(-584791201, new ag1(m45Var2, 29, m45Var), p65Var), p65Var, 12779520, 88);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk4(m45Var, m45Var2, r28Var2, i2, 0);
        }
    }

    public static final long p0(KeyEvent keyEvent) {
        return rv8.m(keyEvent.getKeyCode());
    }

    /* JADX WARN: Removed duplicated region for block: B:134:0x02f8  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x0304  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0334  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x034a  */
    /* JADX WARN: Removed duplicated region for block: B:144:0x03a3  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x040a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void q(defpackage.dr9 r61, defpackage.ig5 r62, defpackage.sh9 r63, defpackage.r28 r64, defpackage.hy8 r65, defpackage.x12 r66, int r67, int r68) {
        /*
            Method dump skipped, instruction units count: 1133
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.q(dr9, ig5, sh9, r28, hy8, x12, int, int):void");
    }

    public static final int q0(KeyEvent keyEvent) {
        int action = keyEvent.getAction();
        if (action != 0) {
            return action != 1 ? 0 : 1;
        }
        return 2;
    }

    public static final void r(r28 r28Var, long j2, boolean z, x12 x12Var, int i2, int i3) {
        r28 r28Var2;
        int i4;
        r28 r28Var3;
        boolean z2;
        boolean z3;
        r28 r28Var4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1350843707);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            r28Var2 = r28Var;
        } else if ((i2 & 6) == 0) {
            r28Var2 = r28Var;
            i4 = i2 | (p65Var.f(r28Var2) ? 4 : 2);
        } else {
            r28Var2 = r28Var;
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.e(j2) ? 32 : 16;
        }
        int i6 = i4 | 384;
        if (p65Var.P(i6 & 1, (i6 & 147) != 146)) {
            p65Var.U();
            int i7 = i2 & 1;
            o28 o28Var = o28.b;
            if (i7 == 0 || p65Var.z()) {
                if (i5 != 0) {
                    r28Var2 = o28Var;
                }
                z3 = true;
            } else {
                p65Var.S();
                z3 = z;
            }
            r28 r28VarG = r28Var2;
            p65Var.q();
            if (z3) {
                r28Var4 = r28VarG;
                r28VarG = w2g.G(r28VarG, 12.0f, 0.0f, 12.0f, 0.0f, 10);
            } else {
                r28Var4 = r28VarG;
            }
            r28 r28VarG2 = w2g.G(r28VarG, 0.0f, 32.0f, 0.0f, 20.0f, 5);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i8 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarG2);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i8));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            r28 r28VarE = jfc.e(jfc.d(w2g.G(o28Var, 12.0f, 0.0f, 12.0f, 0.0f, 10), 1.0f), 200.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(flb.a0(r28VarE, j2, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 12.0f, 20.0f, 12.0f, 0.0f, 8), 288.0f), 16.0f), j2, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 12.0f, 12.0f, 12.0f, 0.0f, 8), 158.0f), 32.0f), j2, nr5Var), p65Var, 0);
            y30.y(o28Var, 1.0f, 16.0f, p65Var);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 12.0f, 8.0f, 12.0f, 0.0f, 8), 288.0f), 16.0f), j2, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 12.0f, 8.0f, 12.0f, 0.0f, 8), 296.0f), 16.0f), j2, nr5Var), p65Var, 0);
            dy0.a(flb.a0(jfc.e(jfc.p(w2g.G(o28Var, 12.0f, 8.0f, 12.0f, 0.0f, 8), 224.0f), 16.0f), j2, nr5Var), p65Var, 0);
            p65Var.p(true);
            z2 = z3;
            r28Var3 = r28Var4;
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
            z2 = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mg5(r28Var3, j2, z2, i2, i3, 0);
        }
    }

    public static Object r0(kv6 kv6Var, x45 x45Var, m45 m45Var, n92 n92Var, int i2) {
        if ((i2 & 2) != 0) {
            x45Var = new vx5(12);
        }
        Object objB = m40.J(new nv6(no7.E(new ps5(kv6Var, 5, x45Var)), 3, 0)).b(new aq(16, m45Var), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    public static final void s(SourceParameter sourceParameter, no5 no5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        SourceParameter sourceParameter2 = sourceParameter;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2033449356);
        int i3 = i2 | (p65Var2.f(sourceParameter2) ? 4 : 2) | (p65Var2.f(no5Var) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var2, R.string.home_featured_empty_state_title);
            String strR2 = vo7.R(p65Var2, R.string.home_featured_empty_state_message);
            String strR3 = vo7.R(p65Var2, R.string.home_featured_empty_state_action);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                sourceParameter2 = sourceParameter;
                objM = new gd3(no5Var, 28, sourceParameter2);
                p65Var2.j0(objM);
            } else {
                sourceParameter2 = sourceParameter;
            }
            gq7.a(null, null, strR, strR2, 0L, null, null, strR3, (m45) objM, 0.0f, 0.0f, p65Var2, 0, 0, 1651);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 1, sourceParameter2, no5Var, r28Var);
        }
    }

    public static final bw7 s0(aw7 aw7Var, x12 x12Var) {
        if ((aw7Var == null ? -1 : myc.d[aw7Var.ordinal()]) == 1) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(252764895);
            long j2 = xo7.B;
            bw7 bw7Var = new bw7(j2, ep7.t(p65Var), ep7.t(p65Var), j2);
            p65Var.p(false);
            return bw7Var;
        }
        p65 p65Var2 = (p65) x12Var;
        p65Var2.Y(252774825);
        sn3 sn3Var = kt7.b;
        bw7 bw7Var2 = new bw7(((zo7) p65Var2.j(sn3Var)).d, ((zo7) p65Var2.j(sn3Var)).p, ((zo7) p65Var2.j(sn3Var)).p, ((zo7) p65Var2.j(sn3Var)).d);
        p65Var2.p(false);
        return bw7Var2;
    }

    public static final void t(so5 so5Var, no5 no5Var, r28 r28Var, x12 x12Var, int i2) {
        so5 so5Var2 = so5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2003453441);
        int i3 = i2 | (p65Var.f(so5Var2) ? 4 : 2) | (p65Var.f(no5Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            so5Var2 = so5Var;
            b24 b24Var = so5Var2.a;
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ek5 ek5Var = new ek5(0, no5Var, no5.class, "onRefresh", "onRefresh()V", 0, 4);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 0, so5Var2, no5Var, r28Var);
        }
    }

    public static final long t0(x12 x12Var) {
        return ((zo7) ((p65) x12Var).j(kt7.b)).c;
    }

    public static final void u(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1415955975);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        boolean z2 = false;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-1410895167);
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
                il7.l(stcVar, null, 0L, null, p65Var, 0, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = true;
                z2 = false;
            }
            p65Var.p(z2);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 7);
        }
    }

    public static String u0(p9f p9fVar) {
        StringBuffer stringBuffer = new StringBuffer();
        if (p9fVar.i) {
            DecimalFormat decimalFormat = new DecimalFormat("0000", new DecimalFormatSymbols(Locale.ENGLISH));
            stringBuffer.append(decimalFormat.format(p9fVar.a));
            if (p9fVar.b == 0) {
                return stringBuffer.toString();
            }
            decimalFormat.applyPattern("'-'00");
            stringBuffer.append(decimalFormat.format(p9fVar.b));
            int i2 = p9fVar.c;
            if (i2 == 0) {
                return stringBuffer.toString();
            }
            stringBuffer.append(decimalFormat.format(i2));
            if (p9fVar.j) {
                stringBuffer.append('T');
                decimalFormat.applyPattern("00");
                stringBuffer.append(decimalFormat.format(p9fVar.d));
                stringBuffer.append(':');
                stringBuffer.append(decimalFormat.format(p9fVar.e));
                int i3 = p9fVar.f;
                if (i3 != 0 || p9fVar.h != 0) {
                    double d2 = ((double) p9fVar.h) / 1.0E9d;
                    decimalFormat.applyPattern(":00.#########");
                    stringBuffer.append(decimalFormat.format(d2 + ((double) i3)));
                }
                if (p9fVar.k) {
                    int offset = p9fVar.g.getOffset(p9fVar.a().getTimeInMillis());
                    if (offset == 0) {
                        stringBuffer.append('Z');
                    } else {
                        int i4 = offset / 3600000;
                        int iAbs = Math.abs((offset % 3600000) / 60000);
                        decimalFormat.applyPattern("+00;-00");
                        stringBuffer.append(decimalFormat.format(i4));
                        decimalFormat.applyPattern(":00");
                        stringBuffer.append(decimalFormat.format(iAbs));
                    }
                }
            }
        }
        return stringBuffer.toString();
    }

    public static final void v(uo5 uo5Var, kv6 kv6Var, bo4 bo4Var, no5 no5Var, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        boolean z;
        int i3;
        uob uobVar;
        no5 no5Var2 = no5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(85054762);
        int i4 = i2 | (p65Var.f(uo5Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(no5Var2) ? 2048 : 1024) | (p65Var.f(md3Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            boolean z2 = uo5Var.b;
            int i5 = i4 & 7168;
            boolean z3 = i5 == 2048;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                z = z2;
                i3 = i5;
                uobVar = uobVar2;
                ek5 ek5Var = new ek5(0, no5Var2, no5.class, "onRefresh", "onRefresh()V", 0, 5);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            } else {
                z = z2;
                i3 = i5;
                uobVar = uobVar2;
            }
            int i6 = (i4 >> 9) & 896;
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1552979036, new g91(uo5Var, kv6Var, bo4Var, no5Var, md3Var, 14), p65Var), p65Var, i6, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z4 = i3 == 2048;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                no5Var2 = no5Var;
                objM2 = new lo5(no5Var2, null, 0);
                p65Var.j0(objM2);
            } else {
                no5Var2 = no5Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 13, r28Var, uo5Var, kv6Var, bo4Var, no5Var2, md3Var);
        }
    }

    public static final void w(String str, bo4 bo4Var, nhc nhcVar, rq5 rq5Var, m45 m45Var, r28 r28Var, ap5 ap5Var, x12 x12Var, int i2) {
        r28 r28Var2;
        ap5 ap5Var2;
        int i3;
        ap5 ap5Var3;
        r28 r28Var3;
        uob uobVar;
        str.getClass();
        bo4Var.getClass();
        nhcVar.getClass();
        rq5Var.getClass();
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-297129040);
        int i4 = 2;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(nhcVar) ? 256 : 128) | (p65Var.f(rq5Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 720896;
        if (p65Var.P(i5 & 1, (599187 & i5) != 599186)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar2 = w12.a;
            if (i6 == 0 || p65Var.z()) {
                Object objJ = p65Var.j(r57.a);
                objJ.getClass();
                xy1 xy1Var = (xy1) objJ;
                boolean z = (i5 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar2) {
                    objM = new mb(str, 27);
                    p65Var.j0(objM);
                }
                i3 = i5 & (-3670017);
                ap5Var3 = (ap5) to7.z(n1b.a.b(ap5.class), xy1Var, t40.E(xy1Var, p65Var), r40.N(xy1Var.getDefaultViewModelCreationExtras(), (x45) objM), p65Var);
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                i3 = i5 & (-3670017);
                r28Var3 = r28Var;
                ap5Var3 = ap5Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ap5Var3.m, p65Var, 0);
            int i7 = i3;
            kv6 kv6VarA = pv6.a(p65Var);
            no5 no5Var = new no5(ap5Var3, m45Var, rq5Var);
            md3 md3Var = new md3(rq5Var, i4, ap5Var3);
            y((vo5) l78VarZ.getValue(), kv6VarA, bo4Var, no5Var, md3Var, r28Var3, p65Var, ((i7 << 3) & 896) | 196608);
            r28 r28Var4 = r28Var3;
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(ap5Var3) | ((i7 & 896) == 256) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar2) {
                uobVar = uobVar2;
                fl2 fl2Var = new fl2(ap5Var3, nhcVar, resources, md3Var, null, 29);
                p65Var.j0(fl2Var);
                objM2 = fl2Var;
            } else {
                uobVar = uobVar2;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM2, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(ap5Var3) | p65Var.f(kv6VarA);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                mo5 mo5Var = new mo5(bo4Var, ap5Var3, kv6VarA, null, 0);
                p65Var.j0(mo5Var);
                objM3 = mo5Var;
            }
            kyd.k(p65Var, (b55) objM3, c1eVar);
            r28Var2 = r28Var4;
            ap5Var2 = ap5Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            ap5Var2 = ap5Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, bo4Var, nhcVar, rq5Var, m45Var, r28Var2, ap5Var2, i2, 3);
        }
    }

    public static int w0(float f2) {
        if (!Float.isNaN(f2)) {
            return Math.round(f2);
        }
        ay0.e("Cannot round NaN value.");
        return 0;
    }

    public static final long x(int i2, int i3) {
        return (((long) i3) & 4294967295L) | (((long) i2) << 32);
    }

    public static long x0(double d2) {
        if (!Double.isNaN(d2)) {
            return Math.round(d2);
        }
        ay0.e("Cannot round NaN value.");
        return 0L;
    }

    public static final void y(vo5 vo5Var, kv6 kv6Var, bo4 bo4Var, no5 no5Var, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(399916041);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(vo5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(kv6Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(bo4Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(no5Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(md3Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new cq4(24);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(rv8.J(wxb.a(r28Var, false, (x45) objM), jq7.t(p65Var2), null), "home_featured"), null, null, null, null, 0, 0L, 0L, qb8.p, pxf.E(-1329332648, new g91((Object) vo5Var, (Object) no5Var, kv6Var, (Object) bo4Var, (Object) md3Var, 13), p65Var2), p65Var, 805306368, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(vo5Var, kv6Var, bo4Var, no5Var, md3Var, r28Var, i2, 4);
        }
    }

    public static final int y0(mwb mwbVar, int i2) {
        int i3;
        int[] iArr = mwbVar.f;
        int i4 = i2 + 1;
        int length = mwbVar.e.length - 1;
        int i5 = 0;
        while (true) {
            if (i5 <= length) {
                i3 = (i5 + length) >>> 1;
                int i6 = iArr[i3];
                if (i6 >= i4) {
                    if (i6 <= i4) {
                        break;
                    }
                    length = i3 - 1;
                } else {
                    i5 = i3 + 1;
                }
            } else {
                i3 = (-i5) - 1;
                break;
            }
        }
        return i3 >= 0 ? i3 : ~i3;
    }

    public static final void z(bc7 bc7Var, m45 m45Var, r28 r28Var, boolean z, boolean z2, boolean z3, boolean z4, n4b n4bVar, boolean z5, xd xdVar, w82 w82Var, boolean z6, boolean z7, Map map, t90 t90Var, boolean z8, x12 x12Var, int i2, int i3, int i4) {
        m45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(382909894);
        boolean z9 = (i4 & 8) != 0 ? false : z;
        boolean z10 = (i4 & 16) != 0 ? false : z2;
        boolean z11 = (i4 & 32) != 0 ? true : z3;
        boolean z12 = (i4 & 64) != 0 ? false : z4;
        n4b n4bVar2 = (i4 & 128) != 0 ? n4b.AUTOMATIC : n4bVar;
        boolean z13 = (i4 & 256) != 0 ? false : z5;
        xd xdVar2 = (i4 & 1024) != 0 ? z46.h : xdVar;
        w82 w82Var2 = (i4 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? v82.b : w82Var;
        boolean z14 = (i4 & 4096) != 0 ? true : z6;
        boolean z15 = (i4 & 8192) != 0 ? false : z7;
        Map map2 = (i4 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : map;
        t90 t90Var2 = (i4 & 32768) != 0 ? t90.AUTOMATIC : t90Var;
        boolean z16 = (i4 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? false : z8;
        p65Var.Z(185152185);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new rc7();
            p65Var.j0(objM);
        }
        rc7 rc7Var = (rc7) objM;
        p65Var.p(false);
        p65Var.Z(185152232);
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = new Matrix();
            p65Var.j0(objM2);
        }
        Matrix matrix = (Matrix) objM2;
        p65Var.p(false);
        p65Var.Z(185152312);
        boolean zF = p65Var.f(bc7Var);
        Object objM3 = p65Var.M();
        if (zF || objM3 == uobVar) {
            objM3 = qo7.u(null);
            p65Var.j0(objM3);
        }
        l78 l78Var = (l78) objM3;
        p65Var.p(false);
        p65Var.Z(185152364);
        if (bc7Var == null || bc7Var.b() == 0.0f) {
            Map map3 = map2;
            boolean z17 = z12;
            n4b n4bVar3 = n4bVar2;
            boolean z18 = z10;
            boolean z19 = z13;
            t90 t90Var3 = t90Var2;
            boolean z20 = z15;
            boolean z21 = z16;
            dy0.a(r28Var, p65Var, (i2 >> 6) & 14);
            p65Var.p(false);
            mwa mwaVarS = p65Var.s();
            if (mwaVarS != null) {
                mwaVarS.d = new vb7(bc7Var, m45Var, r28Var, z9, z18, z11, z17, n4bVar3, z19, xdVar2, w82Var2, z14, z20, map3, t90Var3, z21, i2, i3, i4, 0);
                return;
            }
            return;
        }
        p65Var.p(false);
        xd xdVar3 = xdVar2;
        Rect rect = bc7Var.k;
        Context context = (Context) p65Var.j(eo.b);
        int iWidth = rect.width();
        int iHeight = rect.height();
        r28Var.getClass();
        r28 r28VarB = r28Var.b(new xb7(iWidth, iHeight));
        w82 w82Var3 = w82Var2;
        boolean z22 = z11;
        Map map4 = map2;
        boolean z23 = z12;
        n4b n4bVar4 = n4bVar2;
        t90 t90Var4 = t90Var2;
        boolean z24 = z16;
        boolean z25 = z14;
        boolean z26 = z9;
        wb7 wb7Var = new wb7(rect, w82Var3, xdVar3, matrix, rc7Var, z23, z24, n4bVar4, t90Var4, bc7Var, map4, z26, z10, z22, z13, z25, z15, context, m45Var, l78Var);
        boolean z27 = z13;
        boolean z28 = z10;
        boolean z29 = z15;
        pxf.a(r28VarB, wb7Var, p65Var, 0);
        mwa mwaVarS2 = p65Var.s();
        if (mwaVarS2 != null) {
            mwaVarS2.d = new vb7(bc7Var, m45Var, r28Var, z26, z28, z22, z23, n4bVar4, z27, xdVar3, w82Var3, z25, z29, map4, t90Var4, z24, i2, i3, i4, 1);
        }
    }

    public static final List z0(List list) {
        int size = list.size();
        return size != 0 ? size != 1 ? DesugarCollections.unmodifiableList(new ArrayList(list)) : Collections.singletonList(bu1.x0(list)) : ey3.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:71:0x020d  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0211  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void D(defpackage.tzc r29, defpackage.lyc r30, defpackage.ip7 r31, defpackage.r28 r32, defpackage.x12 r33, int r34) {
        /*
            Method dump skipped, instruction units count: 624
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nk7.D(tzc, lyc, ip7, r28, x12, int):void");
    }

    public static int v0(double d2) {
        if (!Double.isNaN(d2)) {
            if (d2 > 2.147483647E9d) {
                return Integer.MAX_VALUE;
            }
            if (d2 < -2.147483648E9d) {
                return Integer.MIN_VALUE;
            }
            return (int) Math.round(d2);
        }
        ay0.e(OphtYB.WtuitQP);
        return 0;
    }
}
