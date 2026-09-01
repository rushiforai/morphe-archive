package defpackage;

import android.content.Context;
import android.graphics.Path;
import android.os.Bundle;
import android.view.View;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yo7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;
    public static final /* synthetic */ int c = 0;
    public static final /* synthetic */ int d = 0;

    public static final void a(mq9 mq9Var, iq9 iq9Var, x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-424719230);
        int i2 = (p65Var2.f(mq9Var) ? 4 : 2) | i | (p65Var2.f(iq9Var) ? 32 : 16);
        if (p65Var2.P(i2 & 1, (i2 & 19) != 18)) {
            boolean z = (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new bo9(0, iq9Var, iq9.class, "onAudioSelected", "onAudioSelected()V", 0, 10);
                p65Var2.j0(objM);
            }
            f49.l((m45) ((qh6) objM), null, false, null, null, pxf.E(-2044988896, new v08(14, mq9Var), p65Var2), p65Var2, 1572864, 62);
            p65Var = p65Var2;
            e(mq9Var, iq9Var, null, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fq9(mq9Var, iq9Var, i);
        }
    }

    public static final void b(m78 m78Var, l78 l78Var, yrb yrbVar, r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        yn3 yn3Var;
        cud cudVarQ;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1077393800);
        int i2 = i | (p65Var.f(m78Var) ? 4 : 2) | (p65Var.f(yrbVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(mz1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            dsd dsdVarK0 = k40.K0(m78Var, "DropDownMenu", p65Var, (i2 & 14) | 48);
            hud hudVar = d46.i;
            b2 b2Var = dsdVarK0.a;
            k49 k49Var = dsdVarK0.d;
            boolean zBooleanValue = ((Boolean) b2Var.o0()).booleanValue();
            p65Var.Y(-1833869404);
            float f = zBooleanValue ? 1.0f : 0.8f;
            p65Var.p(false);
            Float fValueOf = Float.valueOf(f);
            boolean zBooleanValue2 = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(-1833869404);
            float f2 = zBooleanValue2 ? 1.0f : 0.8f;
            p65Var.p(false);
            Float fValueOf2 = Float.valueOf(f2);
            zrd zrdVarF = dsdVarK0.f();
            p65Var.Y(445475263);
            Boolean bool = Boolean.FALSE;
            Boolean bool2 = Boolean.TRUE;
            if (zrdVarF.b(bool, bool2)) {
                cudVarQ = f76.Q(120, 0, ao3.b, 2);
                z = false;
                yn3Var = null;
            } else {
                yn3Var = null;
                cudVarQ = f76.Q(1, 74, null, 4);
                z = false;
            }
            p65Var.p(z);
            yn3 yn3Var2 = yn3Var;
            bsd bsdVarW = k40.W(dsdVarK0, fValueOf, fValueOf2, cudVarQ, hudVar, p65Var, 0);
            boolean zBooleanValue3 = ((Boolean) dsdVarK0.a.o0()).booleanValue();
            p65Var.Y(-1578341192);
            float f3 = zBooleanValue3 ? 1.0f : 0.0f;
            p65Var.p(false);
            Float fValueOf3 = Float.valueOf(f3);
            boolean zBooleanValue4 = ((Boolean) k49Var.getValue()).booleanValue();
            p65Var.Y(-1578341192);
            float f4 = zBooleanValue4 ? 1.0f : 0.0f;
            p65Var.p(false);
            Float fValueOf4 = Float.valueOf(f4);
            zrd zrdVarF2 = dsdVarK0.f();
            p65Var.Y(701003475);
            cud cudVarQ2 = zrdVarF2.b(bool, bool2) ? f76.Q(30, 0, yn3Var2, 6) : f76.Q(75, 0, yn3Var2, 6);
            p65Var.p(false);
            bsd bsdVarW2 = k40.W(dsdVarK0, fValueOf3, fValueOf4, cudVarQ2, hudVar, p65Var, 0);
            boolean zF = p65Var.f(bsdVarW) | p65Var.f(bsdVarW2);
            Object objM = p65Var.M();
            if (zF || objM == w12.a) {
                objM = new o8(l78Var, bsdVarW, bsdVarW2, 24);
                p65Var.j0(objM);
            }
            r28 r28VarW = xz5.W(o28.b, (x45) objM);
            mz1 mz1VarE = pxf.E(-707086267, new ho5(r28Var, yrbVar, mz1Var), p65Var);
            amb ambVar = ((x4c) p65Var.j(a5c.a)).b;
            long jE = ((sv1) p65Var.j(tv1.a)).e();
            br7.i(r28VarW, ambVar, jE, tv1.b(jE, p65Var), 8.0f, mz1VarE, p65Var, 1769472, 0);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jq(m78Var, l78Var, yrbVar, r28Var, mz1Var, i);
        }
    }

    public static final void c(m45 m45Var, r28 r28Var, hy8 hy8Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-674391690);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.g(true) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(hy8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.f(null) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.h(mz1Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i2 & 1, (74899 & i2) != 74898)) {
            r28 r28VarB = w2g.B(jfc.o(jfc.d(hlg.p(r28Var, null, rkb.a(6, 0L, true), true, null, m45Var, 24), 1.0f), 112.0f, 48.0f, 280.0f, 0.0f, 8), hy8Var);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            int iS = w2g.s(p65Var);
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            kjd.a(((myd) p65Var.j(qyd.b)).g, pxf.E(-77738101, new dd(mz1Var, 11), p65Var), p65Var, 48);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(m45Var, r28Var, hy8Var, mz1Var, i, 1);
        }
    }

    public static final void d(r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-639605526);
        int i2 = i | 6;
        boolean z = false;
        int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            o28 o28Var = o28.b;
            float f = 1.0f;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), wgf.K(p65Var), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            p65Var.Y(475854040);
            for (f09 f09Var : ((zo7) p65Var.j(kt7.b)).a()) {
                String str = (String) f09Var.a;
                long j2 = ((uu1) f09Var.b).a;
                p65 p65Var2 = p65Var;
                kjd.b(str, w2g.E(flb.a0(jfc.d(o28Var, f), j2, rv8.r), 0.0f, 2.0f, i3), op8.f0(j2) > 0.5f ? uu1.b : uu1.d, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, (mkd) p65Var.j(kjd.a), p65Var2, 0, 0, 65016);
                z = z;
                p65Var = p65Var2;
                f = f;
                o28Var = o28Var;
                i3 = 1;
            }
            p65Var.p(z);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i, 18);
        }
    }

    public static final void e(mq9 mq9Var, iq9 iq9Var, r28 r28Var, x12 x12Var, int i) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-252897836);
        int i2 = 4;
        int i3 = i | (p65Var.f(mq9Var) ? 4 : 2) | (p65Var.f(iq9Var) ? 32 : 16) | 384;
        byte b2 = 0;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j = p65Var.T;
            int i4 = (int) ((j >>> 32) ^ j);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            String strW = mq9Var.b;
            if (strW == null) {
                strW = km4.w(p65Var, -256878436, R.string.common_untitled_story, p65Var, false);
            } else {
                p65Var.Y(-256879087);
                p65Var.p(false);
            }
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var, 18);
                p65Var.j0(objM2);
            }
            f49.l((m45) objM2, null, false, null, null, pxf.E(-1533887312, new pb(strW, i2, b2), p65Var), p65Var, 1572870, 62);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new dq7(l78Var, 19);
                p65Var.j0(objM3);
            }
            mz1 mz1VarE = pxf.E(963337203, new ov2(mq9Var, iq9Var, strW, l78Var, 12), p65Var);
            p65Var = p65Var;
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 3, mq9Var, iq9Var, r28Var2);
        }
    }

    public static final void f(mq9 mq9Var, iq9 iq9Var, r28 r28Var, x12 x12Var, int i, int i2) {
        r28 r28Var2;
        int i3;
        iq9 iq9Var2;
        r28 r28Var3;
        iq9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1758787778);
        int i4 = 2;
        int i5 = i | (p65Var.f(mq9Var) ? 4 : 2);
        if ((i & 48) == 0) {
            i5 |= p65Var.f(iq9Var) ? 32 : 16;
        }
        int i6 = i2 & 4;
        if (i6 != 0) {
            i3 = i5 | 384;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i3 = i5 | (p65Var.f(r28Var2) ? 256 : 128);
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28Var4 = i6 != 0 ? o28.b : r28Var2;
            mz1 mz1VarE = pxf.E(1488524221, new fq9(mq9Var, iq9Var), p65Var);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                bo9 bo9Var = new bo9(0, iq9Var, iq9.class, "onBackPressed", "onBackPressed()V", 0, 11);
                iq9Var2 = iq9Var;
                p65Var.j0(bo9Var);
                objM = bo9Var;
            } else {
                iq9Var2 = iq9Var;
            }
            r28Var3 = r28Var4;
            qk7.c(mz1VarE, r28Var3, (m45) ((qh6) objM), pxf.E(-1771580750, new qg9(mq9Var, i4, iq9Var2), p65Var), null, null, 0L, 0L, null, p65Var, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3078);
        } else {
            iq9Var2 = iq9Var;
            p65Var.S();
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(mq9Var, iq9Var2, r28Var3, i, i2, 8);
        }
    }

    public static final void g(m45 m45Var, m45 m45Var2, r28 r28Var, x12 x12Var, int i) {
        int i2;
        m45 m45Var3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1243211824);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(m45Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            m45Var3 = m45Var2;
            i2 |= p65Var.h(m45Var3) ? 32 : 16;
        } else {
            m45Var3 = m45Var2;
        }
        if ((i & 384) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            ek7.h(vo7.R(p65Var, R.string.push_notification_permission_request_title), m45Var, r28Var2, vo7.R(p65Var, R.string.push_notification_permission_request_description), vo7.R(p65Var, R.string.push_notification_permission_request_positive), m45Var3, vo7.R(p65Var, R.string.push_notification_permission_request_negative), m45Var, p65Var, ((i2 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i2 & 896) | ((i2 << 12) & 458752) | ((i2 << 21) & 29360128), 0);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new zk4(m45Var, m45Var2, r28Var, i, 3);
        }
    }

    public static final void h(spa spaVar, r28 r28Var, wpa wpaVar, x12 x12Var, int i) {
        r28 r28Var2;
        wpa wpaVar2;
        int i2;
        int i3;
        m45 m45Var;
        spa spaVar2 = spaVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-463556436);
        int i4 = (p65Var.f(spaVar2) ? 4 : 2) | i | 176;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            p65Var.U();
            int i5 = i & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                Object objM = p65Var.M();
                if (objM == uobVar) {
                    objM = new qna(3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i2 = i4 & (-897);
                    wpaVar2 = (wpa) to7.z(n1b.a.b(wpa.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var2 = o28.b;
                }
            } else {
                p65Var.S();
                i2 = i4 & (-897);
                r28Var2 = r28Var;
                wpaVar2 = wpaVar;
            }
            p65Var.q();
            boolean zH = p65Var.h(wpaVar2);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new lo5(wpaVar2, null, 28);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            int i6 = i2 & 14;
            boolean z = i6 == 4;
            Object objM3 = p65Var.M();
            if (z || objM3 == uobVar) {
                i3 = i6;
                c9a c9aVar = new c9a(0, spaVar2, spa.class, "close", "close()V", 0, 21);
                p65Var.j0(c9aVar);
                objM3 = c9aVar;
            } else {
                i3 = i6;
            }
            m45 m45Var2 = (m45) ((qh6) objM3);
            boolean z2 = i3 == 4;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                m45Var = m45Var2;
                spaVar2 = spaVar;
                objM4 = new c9a(0, spaVar2, spa.class, "requestPermissionAndClose", "requestPermissionAndClose()V", 0, 22);
                p65Var.j0(objM4);
            } else {
                spaVar2 = spaVar;
                m45Var = m45Var2;
            }
            g(m45Var, (m45) ((qh6) objM4), r28Var2, p65Var, 384);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            wpaVar2 = wpaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(spaVar2, r28Var2, wpaVar2, i);
        }
    }

    public static final void i(final sdb sdbVar, final ek8 ek8Var, x12 x12Var, int i) {
        int i2;
        int i3;
        final int i4;
        String str = sdbVar.h;
        String strD = sdbVar.f;
        int i5 = sdbVar.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1776379764);
        int i6 = (p65Var.f(sdbVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i6 & 1, (i6 & 19) != 18)) {
            String str2 = sdbVar.d;
            boolean z = sdbVar.a;
            kx kxVarW = ho2.w(p65Var, -1998924397);
            if (i5 == 1) {
                p65Var.Y(869712759);
                p65Var.p(false);
                i3 = 1;
            } else {
                i3 = 1;
                p65Var.Y(869714223);
                int i7 = i5 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i7, new Object[]{strD, Integer.valueOf(i7)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i3] = str;
            String strQ = vo7.Q(R.string.notification_type_response_created, objArr, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, strD, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, strD.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = sdbVar.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_response);
                int i8 = i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i9 = i6 & 14;
                int i10 = (i8 == 32 ? i3 : 0) | (i9 == 4 ? i3 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i10 != 0 || objM == uobVar) {
                    i4 = 0;
                    objM = new m45() { // from class: tdb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i11 = i4;
                            c1e c1eVar = c1e.a;
                            sdb sdbVar2 = sdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i11) {
                                case 0:
                                    ek8Var2.n(sdbVar2.c, sdbVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(sdbVar2.e, sdbVar2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                } else {
                    i4 = 0;
                }
                m45 m45Var = (m45) objM;
                int i11 = i8 == 32 ? i3 : i4;
                if (i9 == 4) {
                    i4 = i3;
                }
                int i12 = i11 | i4;
                Object objM2 = p65Var.M();
                if (i12 != 0 || objM2 == uobVar) {
                    final int i13 = i3;
                    objM2 = new m45() { // from class: tdb
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i112 = i13;
                            c1e c1eVar = c1e.a;
                            sdb sdbVar2 = sdbVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i112) {
                                case 0:
                                    ek8Var2.n(sdbVar2.c, sdbVar2.i);
                                    break;
                                default:
                                    ek8Var2.k(sdbVar2.e, sdbVar2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                i2 = 18;
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i2 = 18;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(sdbVar, ek8Var, i, i2);
        }
    }

    public static final void j(x2c x2cVar, m45 m45Var, m45 m45Var2, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        x2cVar.getClass();
        m45Var.getClass();
        m45Var2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1639622584);
        if ((i & 6) == 0) {
            i2 = (p65Var2.d(x2cVar.ordinal()) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.h(m45Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.h(m45Var2) ? 256 : 128;
        }
        if (p65Var2.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var = p65Var2;
            hlg.a(m45Var2, pxf.E(1863770736, new c60(21, m45Var), p65Var2), null, pxf.E(-1860924754, new c60(22, m45Var2), p65Var2), null, pxf.E(-1290652948, new h9b(15, x2cVar), p65Var2), qb8.m, null, 0L, 0L, 0L, 0L, null, p65Var, ((i2 >> 6) & 14) | 1772592, 0, 16276);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(x2cVar, m45Var, m45Var2, i);
        }
    }

    public static final void k(kq9 kq9Var, SourceParameter sourceParameter, iq9 iq9Var, x12 x12Var, int i) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1459459906);
        int i2 = (p65Var.f(kq9Var) ? 4 : 2) | i | (p65Var.f(sourceParameter) ? 32 : 16) | (p65Var.f(iq9Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            String str = kq9Var.c;
            if (str == null) {
                p65Var.Y(816341781);
            } else {
                p65Var.Y(816341782);
                boolean z = true;
                String str2 = kq9Var.b;
                boolean z2 = ((i2 & 14) == 4) | ((i2 & 896) == 256);
                if ((i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) != 32) {
                    z = false;
                }
                boolean z3 = z2 | z;
                Object objM = p65Var.M();
                if (z3 || objM == w12.a) {
                    objM = new i16(iq9Var, kq9Var, sourceParameter, 15);
                    p65Var.j0(objM);
                }
                fo7.w(0, 4, p65Var, (m45) objM, null, str, str2);
            }
            p65Var.p(false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i, 4, kq9Var, sourceParameter, iq9Var);
        }
    }

    public static final nnd l(boolean z) {
        return z ? nnd.On : nnd.Off;
    }

    public static final void m(final vne vneVar, final ek8 ek8Var, x12 x12Var, int i) {
        String str = vneVar.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1096949987);
        int i2 = (p65Var.f(vneVar) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str2 = vneVar.e;
            boolean z = vneVar.a;
            kx kxVarW = ho2.w(p65Var, 1901961386);
            String strQ = vo7.Q(R.string.notification_type_users_email_subscribed, new Object[]{str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ);
                p65Var.p(false);
                long j = vneVar.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_follow);
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: wne
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            vne vneVar2 = vneVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.k(vneVar2.c, vneVar2.f);
                                    break;
                                default:
                                    ek8Var2.k(vneVar2.c, vneVar2.f);
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
                    objM2 = new m45() { // from class: wne
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            vne vneVar2 = vneVar;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.k(vneVar2.c, vneVar2.f);
                                    break;
                                default:
                                    ek8Var2.k(vneVar2.c, vneVar2.f);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str2, numValueOf, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(vneVar, ek8Var, i, 28);
        }
    }

    public static void n(iq8 iq8Var, iy6 iy6Var, x45 x45Var) {
        iq8Var.getClass();
        iq8Var.a(iy6Var, new ul0(x45Var));
    }

    public static void o(Appendable appendable, Object obj, x45 x45Var) {
        if (x45Var != null) {
            appendable.append((CharSequence) x45Var.invoke(obj));
            return;
        }
        if (obj == null ? true : obj instanceof CharSequence) {
            appendable.append((CharSequence) obj);
        } else if (obj instanceof Character) {
            appendable.append(((Character) obj).charValue());
        } else {
            appendable.append(obj.toString());
        }
    }

    public static final boolean p(Bundle bundle, Bundle bundle2) {
        if (bundle == bundle2) {
            return true;
        }
        if (bundle.size() != bundle2.size()) {
            return false;
        }
        for (String str : bundle.keySet()) {
            Object obj = bundle.get(str);
            Object obj2 = bundle2.get(str);
            if (obj != obj2 && !g76.L(obj, obj2)) {
                if (obj != null && obj2 != null) {
                    if ((obj instanceof Bundle) && (obj2 instanceof Bundle)) {
                        if (!p((Bundle) obj, (Bundle) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof Object[]) && (obj2 instanceof Object[])) {
                        if (!k80.e0((Object[]) obj, (Object[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof byte[]) && (obj2 instanceof byte[])) {
                        if (!Arrays.equals((byte[]) obj, (byte[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof short[]) && (obj2 instanceof short[])) {
                        if (!Arrays.equals((short[]) obj, (short[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof int[]) && (obj2 instanceof int[])) {
                        if (!Arrays.equals((int[]) obj, (int[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof long[]) && (obj2 instanceof long[])) {
                        if (!Arrays.equals((long[]) obj, (long[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof float[]) && (obj2 instanceof float[])) {
                        if (!Arrays.equals((float[]) obj, (float[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof double[]) && (obj2 instanceof double[])) {
                        if (!Arrays.equals((double[]) obj, (double[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof char[]) && (obj2 instanceof char[])) {
                        if (!Arrays.equals((char[]) obj, (char[]) obj2)) {
                            return false;
                        }
                    } else if ((obj instanceof boolean[]) && (obj2 instanceof boolean[])) {
                        if (!Arrays.equals((boolean[]) obj, (boolean[]) obj2)) {
                            return false;
                        }
                    } else if (!obj.equals(obj2)) {
                    }
                }
                return false;
            }
        }
        return true;
    }

    public static final int q(Bundle bundle) {
        Iterator<String> it2 = bundle.keySet().iterator();
        int iQ = 1;
        while (it2.hasNext()) {
            Object obj = bundle.get(it2.next());
            iQ = (iQ * 31) + (obj instanceof Bundle ? q((Bundle) obj) : obj instanceof Object[] ? Arrays.deepHashCode((Object[]) obj) : obj instanceof byte[] ? Arrays.hashCode((byte[]) obj) : obj instanceof short[] ? Arrays.hashCode((short[]) obj) : obj instanceof int[] ? Arrays.hashCode((int[]) obj) : obj instanceof long[] ? Arrays.hashCode((long[]) obj) : obj instanceof float[] ? Arrays.hashCode((float[]) obj) : obj instanceof double[] ? Arrays.hashCode((double[]) obj) : obj instanceof char[] ? Arrays.hashCode((char[]) obj) : obj instanceof boolean[] ? Arrays.hashCode((boolean[]) obj) : obj != null ? obj.hashCode() : 0);
        }
        return iQ;
    }

    public static final db8 r(Context context) {
        context.getClass();
        db8 db8Var = new db8(context);
        ka8 ka8Var = db8Var.b;
        tc8 tc8Var = ka8Var.s;
        tc8Var.a(new b12(tc8Var));
        tc8 tc8Var2 = ka8Var.s;
        tc8Var2.a(new d12());
        tc8Var2.a(new ob3());
        return db8Var;
    }

    public static final void s(br brVar, double d2, double d3, double d4, double d5, double d6, double d7, double d8, boolean z, boolean z2) {
        double d9;
        double d10;
        double d11 = d6;
        double d12 = (d8 / 180.0d) * 3.141592653589793d;
        double dCos = Math.cos(d12);
        double dSin = Math.sin(d12);
        double d13 = ((d3 * dSin) + (d2 * dCos)) / d11;
        double d14 = ((d3 * dCos) + ((-d2) * dSin)) / d7;
        double d15 = ((d5 * dSin) + (d4 * dCos)) / d11;
        double d16 = ((d5 * dCos) + ((-d4) * dSin)) / d7;
        double d17 = d13 - d15;
        double d18 = d14 - d16;
        double d19 = (d13 + d15) / 2.0d;
        double d20 = (d14 + d16) / 2.0d;
        double d21 = (d18 * d18) + (d17 * d17);
        if (d21 == 0.0d) {
            return;
        }
        double d22 = (1.0d / d21) - 0.25d;
        if (d22 < 0.0d) {
            double dSqrt = (float) (Math.sqrt(d21) / 1.99999d);
            s(brVar, d2, d3, d4, d5, d11 * dSqrt, d7 * dSqrt, d8, z, z2);
            return;
        }
        double dSqrt2 = Math.sqrt(d22);
        double d23 = d17 * dSqrt2;
        double d24 = dSqrt2 * d18;
        if (z == z2) {
            d9 = d19 - d24;
            d10 = d20 + d23;
        } else {
            d9 = d19 + d24;
            d10 = d20 - d23;
        }
        double dAtan2 = Math.atan2(d14 - d10, d13 - d9);
        double dAtan22 = Math.atan2(d16 - d10, d15 - d9) - dAtan2;
        if (z2 != (dAtan22 >= 0.0d)) {
            dAtan22 = dAtan22 > 0.0d ? dAtan22 - 6.283185307179586d : dAtan22 + 6.283185307179586d;
        }
        double d25 = d9 * d11;
        double d26 = d10 * d7;
        double d27 = (d25 * dCos) - (d26 * dSin);
        double d28 = (d26 * dCos) + (d25 * dSin);
        int iCeil = (int) Math.ceil(Math.abs((dAtan22 * 4.0d) / 3.141592653589793d));
        double dCos2 = Math.cos(d12);
        double dSin2 = Math.sin(d12);
        double dCos3 = Math.cos(dAtan2);
        double dSin3 = Math.sin(dAtan2);
        double d29 = -d11;
        double d30 = d29 * dCos2;
        double d31 = d7 * dSin2;
        double d32 = (d30 * dSin3) - (d31 * dCos3);
        double d33 = d29 * dSin2;
        double d34 = d7 * dCos2;
        double d35 = (dCos3 * d34) + (dSin3 * d33);
        double d36 = dAtan22 / ((double) iCeil);
        double d37 = dAtan2;
        double d38 = d32;
        int i = 0;
        double d39 = d35;
        double d40 = d3;
        while (i < iCeil) {
            double d41 = d37 + d36;
            double dSin4 = Math.sin(d41);
            double dCos4 = Math.cos(d41);
            int i2 = iCeil;
            double d42 = (((d11 * dCos2) * dCos4) + d27) - (d31 * dSin4);
            double d43 = (d34 * dSin4) + (d11 * dSin2 * dCos4) + d28;
            double d44 = (d30 * dSin4) - (d31 * dCos4);
            double d45 = (dCos4 * d34) + (dSin4 * d33);
            double d46 = d41 - d37;
            double dTan = Math.tan(d46 / 2.0d);
            double dSqrt3 = ((Math.sqrt(((dTan * 3.0d) * dTan) + 4.0d) - 1.0d) * Math.sin(d46)) / 3.0d;
            brVar.a.cubicTo((float) ((d38 * dSqrt3) + d2), (float) ((d39 * dSqrt3) + d40), (float) (d42 - (dSqrt3 * d44)), (float) (d43 - (dSqrt3 * d45)), (float) d42, (float) d43);
            d36 = d36;
            dSin2 = dSin2;
            d27 = d27;
            d2 = d42;
            i++;
            d33 = d33;
            d37 = d41;
            d39 = d45;
            d38 = d44;
            iCeil = i2;
            d40 = d43;
            d11 = d6;
        }
    }

    public static final wve t(View view) {
        wve wveVar;
        Object tag = view.getTag(R.id.coil3_request_manager);
        wve wveVar2 = tag instanceof wve ? (wve) tag : null;
        if (wveVar2 != null) {
            return wveVar2;
        }
        synchronized (view) {
            try {
                Object tag2 = view.getTag(R.id.coil3_request_manager);
                wveVar = tag2 instanceof wve ? (wve) tag2 : null;
                if (wveVar == null) {
                    wveVar = new wve();
                    view.addOnAttachStateChangeListener(wveVar);
                    view.setTag(R.id.coil3_request_manager, wveVar);
                }
            } finally {
            }
        }
        return wveVar;
    }

    public static final boolean u(float f, float f2, br brVar) {
        zwa zwaVar = new zwa(f - 0.005f, f2 - 0.005f, f + 0.005f, f2 + 0.005f);
        br brVarA = er.a();
        b09.m(brVarA, zwaVar);
        br brVarA2 = er.a();
        brVarA2.e(brVar, brVarA, 1);
        boolean zIsEmpty = brVarA2.a.isEmpty();
        brVarA2.f();
        brVarA.f();
        return !zIsEmpty;
    }

    public static final boolean v(float f, float f2, long j, float f3, float f4) {
        float f5 = f - f3;
        float f6 = f2 - f4;
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j & 4294967295L));
        return ((f6 * f6) / (fIntBitsToFloat2 * fIntBitsToFloat2)) + ((f5 * f5) / (fIntBitsToFloat * fIntBitsToFloat)) <= 1.0f;
    }

    public static final void w(List list, br brVar) {
        Path path;
        int i;
        float f;
        int i2;
        h69 h69Var;
        float f2;
        float f3;
        float f4;
        float f5;
        float f6;
        float f7;
        float f8;
        float f9;
        float f10;
        float f11;
        List list2 = list;
        br brVar2 = brVar;
        Path path2 = brVar2.a;
        int i3 = path2.getFillType() == Path.FillType.EVEN_ODD ? 1 : 0;
        path2.rewind();
        brVar2.g(i3);
        h69 h69Var2 = list2.isEmpty() ? p59.c : (h69) list2.get(0);
        int size = list2.size();
        float f12 = 0.0f;
        int i4 = 0;
        float f13 = 0.0f;
        float f14 = 0.0f;
        float f15 = 0.0f;
        float f16 = 0.0f;
        float f17 = 0.0f;
        float f18 = 0.0f;
        while (i4 < size) {
            h69 h69Var3 = (h69) list2.get(i4);
            if (h69Var3 instanceof p59) {
                brVar2.a();
                path = path2;
                i = size;
                f = f12;
                i2 = i4;
                h69Var = h69Var3;
                f13 = f17;
                f15 = f13;
                f14 = f18;
                f16 = f14;
            } else {
                if (h69Var3 instanceof b69) {
                    b69 b69Var = (b69) h69Var3;
                    float f19 = b69Var.c;
                    f15 += f19;
                    float f20 = b69Var.d;
                    f16 += f20;
                    path2.rMoveTo(f19, f20);
                    path = path2;
                    i = size;
                    f = f12;
                    i2 = i4;
                    f17 = f15;
                    f18 = f16;
                } else {
                    if (h69Var3 instanceof t59) {
                        t59 t59Var = (t59) h69Var3;
                        float f21 = t59Var.c;
                        float f22 = t59Var.d;
                        brVar2.d(f21, f22);
                        path = path2;
                        f16 = f22;
                        f18 = f16;
                        f15 = f21;
                        f17 = f15;
                    } else {
                        if (h69Var3 instanceof a69) {
                            a69 a69Var = (a69) h69Var3;
                            float f23 = a69Var.d;
                            float f24 = a69Var.c;
                            path2.rLineTo(f24, f23);
                            f15 += f24;
                            f16 += f23;
                        } else if (h69Var3 instanceof s59) {
                            s59 s59Var = (s59) h69Var3;
                            float f25 = s59Var.d;
                            float f26 = s59Var.c;
                            brVar2.c(f26, f25);
                            path = path2;
                            f15 = f26;
                            f16 = f25;
                        } else if (h69Var3 instanceof z59) {
                            float f27 = ((z59) h69Var3).c;
                            path2.rLineTo(f27, f12);
                            f15 += f27;
                        } else if (h69Var3 instanceof r59) {
                            float f28 = ((r59) h69Var3).c;
                            brVar2.c(f28, f16);
                            path = path2;
                            f15 = f28;
                        } else if (h69Var3 instanceof f69) {
                            float f29 = ((f69) h69Var3).c;
                            path2.rLineTo(f12, f29);
                            f16 += f29;
                        } else if (h69Var3 instanceof g69) {
                            float f30 = ((g69) h69Var3).c;
                            brVar2.c(f15, f30);
                            path = path2;
                            f16 = f30;
                        } else {
                            if (h69Var3 instanceof y59) {
                                y59 y59Var = (y59) h69Var3;
                                path2.rCubicTo(y59Var.c, y59Var.d, y59Var.e, y59Var.f, y59Var.g, y59Var.h);
                                f4 = y59Var.e + f15;
                                f5 = y59Var.f + f16;
                                f15 += y59Var.g;
                                f11 = y59Var.h;
                            } else {
                                if (h69Var3 instanceof q59) {
                                    q59 q59Var = (q59) h69Var3;
                                    path2.cubicTo(q59Var.c, q59Var.d, q59Var.e, q59Var.f, q59Var.g, q59Var.h);
                                    f4 = q59Var.e;
                                    f6 = q59Var.f;
                                    f7 = q59Var.g;
                                    f8 = q59Var.h;
                                } else if (h69Var3 instanceof d69) {
                                    if (h69Var2.a) {
                                        f9 = f15 - f13;
                                        f10 = f16 - f14;
                                    } else {
                                        f9 = f12;
                                        f10 = f9;
                                    }
                                    d69 d69Var = (d69) h69Var3;
                                    path2.rCubicTo(f9, f10, d69Var.c, d69Var.d, d69Var.e, d69Var.f);
                                    f4 = d69Var.c + f15;
                                    f5 = d69Var.d + f16;
                                    f15 += d69Var.e;
                                    f11 = d69Var.f;
                                } else if (h69Var3 instanceof v59) {
                                    if (h69Var2.a) {
                                        f15 = (f15 * 2.0f) - f13;
                                        f16 = (2.0f * f16) - f14;
                                    }
                                    v59 v59Var = (v59) h69Var3;
                                    path2.cubicTo(f15, f16, v59Var.c, v59Var.d, v59Var.e, v59Var.f);
                                    f4 = v59Var.c;
                                    f6 = v59Var.d;
                                    f7 = v59Var.e;
                                    f8 = v59Var.f;
                                } else if (h69Var3 instanceof c69) {
                                    c69 c69Var = (c69) h69Var3;
                                    float f31 = c69Var.f;
                                    float f32 = c69Var.e;
                                    float f33 = c69Var.d;
                                    float f34 = c69Var.c;
                                    path2.rQuadTo(f34, f33, f32, f31);
                                    float f35 = f34 + f15;
                                    float f36 = f33 + f16;
                                    f15 += f32;
                                    f16 += f31;
                                    path = path2;
                                    f13 = f35;
                                    f14 = f36;
                                } else if (h69Var3 instanceof u59) {
                                    u59 u59Var = (u59) h69Var3;
                                    float f37 = u59Var.f;
                                    float f38 = u59Var.e;
                                    float f39 = u59Var.d;
                                    f4 = u59Var.c;
                                    path2.quadTo(f4, f39, f38, f37);
                                    path = path2;
                                    f16 = f37;
                                    f15 = f38;
                                    f14 = f39;
                                    i = size;
                                    f = f12;
                                    i2 = i4;
                                    h69Var = h69Var3;
                                    f13 = f4;
                                } else if (h69Var3 instanceof e69) {
                                    if (h69Var2.b) {
                                        f2 = f15 - f13;
                                        f3 = f16 - f14;
                                    } else {
                                        f2 = f12;
                                        f3 = f2;
                                    }
                                    e69 e69Var = (e69) h69Var3;
                                    float f40 = e69Var.d;
                                    float f41 = e69Var.c;
                                    path2.rQuadTo(f2, f3, f41, f40);
                                    f4 = f2 + f15;
                                    f5 = f3 + f16;
                                    f15 += f41;
                                    f16 += f40;
                                    path = path2;
                                    f14 = f5;
                                    i = size;
                                    f = f12;
                                    i2 = i4;
                                    h69Var = h69Var3;
                                    f13 = f4;
                                } else if (h69Var3 instanceof w59) {
                                    if (h69Var2.b) {
                                        f15 = (f15 * 2.0f) - f13;
                                        f16 = (2.0f * f16) - f14;
                                    }
                                    w59 w59Var = (w59) h69Var3;
                                    float f42 = w59Var.d;
                                    float f43 = w59Var.c;
                                    path2.quadTo(f15, f16, f43, f42);
                                    path = path2;
                                    i = size;
                                    f = f12;
                                    i2 = i4;
                                    f14 = f16;
                                    h69Var = h69Var3;
                                    f16 = f42;
                                    f13 = f15;
                                    f15 = f43;
                                } else if (h69Var3 instanceof x59) {
                                    x59 x59Var = (x59) h69Var3;
                                    float f44 = x59Var.h + f15;
                                    float f45 = x59Var.i + f16;
                                    i = size;
                                    f = 0.0f;
                                    path = path2;
                                    i2 = i4;
                                    s(brVar, f15, f16, f44, f45, x59Var.c, x59Var.d, x59Var.e, x59Var.f, x59Var.g);
                                    f13 = f44;
                                    f15 = f13;
                                    f14 = f45;
                                    f16 = f14;
                                    h69Var = h69Var3;
                                } else {
                                    path = path2;
                                    i = size;
                                    f = f12;
                                    i2 = i4;
                                    if (!(h69Var3 instanceof o59)) {
                                        ygf.a();
                                        return;
                                    }
                                    o59 o59Var = (o59) h69Var3;
                                    float f46 = o59Var.i;
                                    float f47 = o59Var.h;
                                    h69Var = h69Var3;
                                    s(brVar, f15, f16, f47, f46, o59Var.c, o59Var.d, o59Var.e, o59Var.f, o59Var.g);
                                    f14 = f46;
                                    f16 = f14;
                                    f13 = f47;
                                    f15 = f13;
                                }
                                path = path2;
                                f15 = f7;
                                f16 = f8;
                                i = size;
                                f = f12;
                                i2 = i4;
                                h69Var = h69Var3;
                                f14 = f6;
                                f13 = f4;
                            }
                            f16 += f11;
                            path = path2;
                            f14 = f5;
                            i = size;
                            f = f12;
                            i2 = i4;
                            h69Var = h69Var3;
                            f13 = f4;
                        }
                        path = path2;
                    }
                    i = size;
                    f = f12;
                    i2 = i4;
                }
                h69Var = h69Var3;
            }
            i4 = i2 + 1;
            list2 = list;
            brVar2 = brVar;
            size = i;
            path2 = path;
            h69Var2 = h69Var;
            f12 = f;
        }
    }

    public static String x(a6g a6gVar) {
        StringBuilder sb = new StringBuilder(a6gVar.m());
        for (int i = 0; i < a6gVar.m(); i++) {
            byte bD = a6gVar.d(i);
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

    public static guf y(Object obj, Object obj2) {
        guf gufVarB = (guf) obj;
        guf gufVar = (guf) obj2;
        if (!gufVar.isEmpty()) {
            if (!gufVarB.a) {
                gufVarB = gufVarB.b();
            }
            gufVarB.c();
            if (!gufVar.isEmpty()) {
                gufVarB.putAll(gufVar);
            }
        }
        return gufVarB;
    }

    public static void z(Object obj) {
    }
}
