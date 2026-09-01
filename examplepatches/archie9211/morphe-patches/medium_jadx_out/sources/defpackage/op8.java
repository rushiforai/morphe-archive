package defpackage;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.content.pm.ResolveInfo;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.os.Build;
import android.util.Base64;
import android.util.Log;
import android.view.KeyEvent;
import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Proxy;
import java.net.URL;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class op8 {
    public static final mz1 a = new mz1(new p02(24), false, 572827912);
    public static final mz1 b = new mz1(new c02(15), false, 1345228288);
    public static final mz1 c = new mz1(new c02(16), false, 952229343);
    public static final mz1 d = new mz1(new zz1(8), false, -351519535);
    public static final d1g e;
    public static final d1g f;
    public static final /* synthetic */ int g = 0;
    public static final /* synthetic */ int h = 0;
    public static final /* synthetic */ int i = 0;
    public static final /* synthetic */ int j = 0;
    public static final /* synthetic */ int k = 0;

    public static final void A(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(568834345);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
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
            o28 o28Var = o28.b;
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
            r28 r28VarV = m40.V(o28Var, p65Var, 6);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarV);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(-572147437);
            for (int i6 = 0; i6 < 10; i6++) {
                il7.l(stc.S, null, ((zo7) p65Var.j(kt7.b)).b, null, p65Var, 6, 10);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 19);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:150:0x02f9  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x0306  */
    /* JADX WARN: Removed duplicated region for block: B:155:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void B(defpackage.pta r39, java.lang.String r40, java.lang.String r41, defpackage.bo4 r42, defpackage.r28 r43, defpackage.nhc r44, defpackage.nua r45, defpackage.x12 r46, int r47, int r48) {
        /*
            Method dump skipped, instruction units count: 785
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.B(pta, java.lang.String, java.lang.String, bo4, r28, nhc, nua, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:67:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(defpackage.iua r23, defpackage.kv6 r24, defpackage.nhc r25, defpackage.vta r26, defpackage.sh9 r27, defpackage.r28 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 294
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.C(iua, kv6, nhc, vta, sh9, r28, x12, int, int):void");
    }

    public static final void D(iua iuaVar, kv6 kv6Var, sh9 sh9Var, vta vtaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-810937517);
        int i3 = i2 | (p65Var.f(iuaVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128) | (p65Var.f(vtaVar) ? 2048 : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            eua euaVar = iuaVar instanceof eua ? (eua) iuaVar : null;
            boolean z = euaVar != null ? euaVar.b : false;
            boolean z2 = (i3 & 7168) == 2048;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                uta utaVar = new uta(0, vtaVar, vta.class, "refresh", "refresh()V", 0, 1);
                p65Var.j0(utaVar);
                objM = utaVar;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1237072773, new sta(iuaVar, kv6Var, sh9Var, vtaVar, 0), p65Var), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(iuaVar, kv6Var, sh9Var, vtaVar, r28Var, i2, 22);
        }
    }

    public static final void E(e4d e4dVar, r28 r28Var, x12 x12Var, int i2) {
        boolean z;
        o28 o28Var;
        int i3;
        float f2;
        e4d e4dVar2 = e4dVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-781458388);
        int i4 = i2 | (p65Var.f(e4dVar2) ? 4 : 2) | (p65Var.f(r28Var) ? 32 : 16);
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
            o28 o28Var2 = o28.b;
            r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 448.0f, 0.0f, 11), 1.0f);
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
            r28 r28VarD3 = w2g.D(wgf.R(jfc.c, wgf.K(p65Var), false, 14), 24.0f, 32.0f);
            yq0 yq0Var = z46.q;
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD3);
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
            c09 c09VarJ = vn7.J(R.drawable.ic_logo_medium_wordmark, 0, p65Var);
            String strR = vo7.R(p65Var, R.string.common_cd_medium_logo);
            r28 r28VarN = bgf.N(jfc.e(jfc.p(o28Var2, 144.0f), 32.0f), "welcome_logo");
            sn3 sn3Var = kt7.b;
            qv5.b(c09VarJ, strR, r28VarN, ((zo7) p65Var.j(sn3Var)).n, p65Var, 392, 0);
            hp7.t(p65Var, jfc.e(o28Var2, 40.0f));
            r28 r28VarD4 = jfc.d(new sq6(1.0f, true), 1.0f);
            wv1 wv1VarA2 = uv1.a(qb8.e, yq0Var, p65Var, 54);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD4);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            String strR2 = vo7.R(p65Var, R.string.susi_auth_title);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR2, bgf.N(jfc.d(o28Var2, 1.0f), "welcome_title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var2)).C, p65Var, 48, 0, 130044);
            hp7.t(p65Var, jfc.e(o28Var2, 40.0f));
            qv5.b(vn7.J(2131231091, 0, p65Var), null, bgf.N(o28Var2, "welcome_illustration"), 0L, p65Var, 440, 8);
            hp7.t(p65Var, jfc.e(o28Var2, 40.0f));
            jjd.b(vo7.R(p65Var, R.string.susi_auth_subtitle), bgf.N(jfc.d(o28Var2, 1.0f), "welcome_subtitle"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).l, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 130044);
            p65Var.p(true);
            hp7.t(p65Var, jfc.e(o28Var2, 40.0f));
            int i9 = i4 & 14;
            boolean z2 = i9 == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                z = false;
                o28Var = o28Var2;
                i3 = 4;
                f2 = 24.0f;
                joc jocVar = new joc(0, e4dVar, e4d.class, "onLogInClicked", "onLogInClicked()V", 0, 21);
                p65Var.j0(jocVar);
                objM = jocVar;
            } else {
                i3 = 4;
                o28Var = o28Var2;
                z = false;
                f2 = 24.0f;
            }
            m45 m45Var = (m45) ((qh6) objM);
            String strR3 = vo7.R(p65Var, R.string.susi_welcome_log_in);
            xn7 xn7Var = xn7.L;
            fo7.i(m45Var, strR3, xn7Var, bgf.N(jfc.d(o28Var, 1.0f), "welcome_log_in_button"), false, p65Var, 3456, 16);
            hp7.t(p65Var, jfc.e(o28Var, f2));
            boolean z3 = i9 == i3 ? true : z;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                e4dVar2 = e4dVar;
                objM2 = new joc(0, e4dVar2, e4d.class, "onCreateAccountClicked", "onCreateAccountClicked()V", 0, 22);
                p65Var.j0(objM2);
            } else {
                e4dVar2 = e4dVar;
            }
            int i10 = i3;
            fo7.j((m45) ((qh6) objM2), vo7.R(p65Var, R.string.susi_welcome_create_account), xn7Var, bgf.N(jfc.d(o28Var, 1.0f), "welcome_create_account_button"), false, null, p65Var, 3456, 48);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
            boolean z4 = i9 == i10 ? true : z;
            Object objM3 = p65Var.M();
            if (z4 || objM3 == uobVar) {
                objM3 = new obb(e4dVar2, null, 13);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(e4dVar2, r28Var, i2, 8);
        }
    }

    public static final void F(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1510421959);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            xz5.o(bgf.N(iy0.a.a(o28.b, z46.h), "loading"), null, 0.0f, 0L, 0L, 0, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 28);
        }
    }

    public static final void G(i4d i4dVar, e4d e4dVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        i4dVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1049285567);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(i4dVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(e4dVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarN = bgf.N(r28Var.b(jfc.c), "susi_welcome_screen");
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new d3d(i4);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(wxb.a(r28VarN, false, (x45) objM), null, null, null, null, 0, ((zo7) p65Var2.j(kt7.b)).a, 0L, null, pxf.E(-1557157616, new ec(i4dVar, 9, e4dVar), p65Var2), p65Var, 805306368, 446);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 11, i4dVar, e4dVar, r28Var);
        }
    }

    public static final void H(String str, d4d d4dVar, r28 r28Var, j4d j4dVar, x12 x12Var, int i2) {
        int i3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2127666913);
        int i4 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.f(d4dVar) ? 32 : 16) | 1408;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new nmc(str, 3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    j4dVar = (j4d) to7.z(n1b.a.b(j4d.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-7169);
                    r28Var = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
            }
            p65Var.q();
            G((i4d) guc.z(j4dVar.j, p65Var, 0).getValue(), new e4d(d4dVar, j4dVar), r28Var, p65Var, 384);
            boolean zH = p65Var.h(j4dVar) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new eub(j4dVar, d4dVar, null, 25);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        r28 r28Var2 = r28Var;
        j4d j4dVar2 = j4dVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 11, r28Var2, (Object) str, (Object) d4dVar, (Object) j4dVar2);
        }
    }

    public static final void I(vq5 vq5Var, final nhc nhcVar, bo4 bo4Var, final rq5 rq5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        Object mo5Var;
        int i4;
        uob uobVar;
        j78 j78Var;
        j78 j78Var2;
        d13 d13Var;
        int i5;
        int i6;
        final vq5 vq5Var2 = vq5Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1732771247);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(vq5Var2) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(bo4Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(rq5Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = k40.x(0, 7, null);
                p65Var2.j0(objM);
            }
            final j78 j78Var3 = (j78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar2) {
                objM2 = k40.x(0, 7, null);
                p65Var2.j0(objM2);
            }
            final j78 j78Var4 = (j78) objM2;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j2 = p65Var2.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28Var);
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i7));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            p65Var2.Y(-262248273);
            List list = vq5Var2.a;
            int i8 = vq5Var2.j;
            ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                int i9 = tq5.a[((uq5) it2.next()).ordinal()];
                if (i9 == 1) {
                    i5 = 1171142762;
                    i6 = R.string.home_for_you_tab_for_you;
                } else {
                    if (i9 != 2) {
                        throw ho2.L(p65Var2, 1171141406, false);
                    }
                    i5 = 1171145515;
                    i6 = R.string.home_for_you_tab_featured;
                }
                arrayList.add(km4.w(p65Var2, i5, i6, p65Var2, false));
            }
            p65Var2.p(false);
            d13 d13VarB = jz8.b(i8, new kv4(0, 4, List.class, arrayList, "size", "size()I"), p65Var2, 0, 2);
            jp7 jp7Var = (jp7) p65Var2.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var2.T;
            int i10 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL2);
            Integer numValueOf = Integer.valueOf(i10);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var2.T;
            int i11 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var2);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i11, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            int i12 = vq5Var2.j;
            int i13 = i3 & 7168;
            int i14 = i3 & 14;
            boolean z = (i13 == 2048) | (i14 == 4);
            Object objM3 = p65Var2.M();
            if (z || objM3 == uobVar2) {
                objM3 = new si3(rq5Var, 17, vq5Var2);
                p65Var2.j0(objM3);
            }
            ns7.a(0.0f, i12, 0, 504, 0L, 0L, p65Var2, (x45) objM3, null, null, null, arrayList);
            p65Var2.p(true);
            p65Var2.p(true);
            n92 n92Var = null;
            kk7.c(d13VarB, jfc.c, null, null, null, null, false, null, null, null, pxf.E(-851537144, new d55() { // from class: oq5
                @Override // defpackage.d55
                public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
                    int iIntValue = ((Integer) obj2).intValue();
                    ((Integer) obj4).getClass();
                    ((zy8) obj).getClass();
                    p65 p65Var3 = (p65) ((x12) obj3);
                    if (((Boolean) p65Var3.j(l36.a)).booleanValue()) {
                        p65Var3.Y(-2086509990);
                    } else {
                        p65Var3.Y(-2066106100);
                        vq5 vq5Var3 = vq5Var2;
                        int i15 = tq5.a[((uq5) vq5Var3.a.get(iIntValue)).ordinal()];
                        nhc nhcVar2 = nhcVar;
                        rq5 rq5Var2 = rq5Var;
                        uob uobVar3 = w12.a;
                        if (i15 == 1) {
                            p65Var3.Y(2011563256);
                            String str = vq5Var3.g;
                            boolean zF = p65Var3.f(rq5Var2);
                            Object objM4 = p65Var3.M();
                            if (zF || objM4 == uobVar3) {
                                ek5 ek5Var = new ek5(0, rq5Var2, rq5.class, "onContentScrolled", "onContentScrolled()V", 0, 10);
                                p65Var3.j0(ek5Var);
                                objM4 = ek5Var;
                            }
                            qb8.n(str, j78Var3, nhcVar2, rq5Var2, (m45) ((qh6) objM4), null, null, p65Var3, 0);
                            p65Var3.p(false);
                        } else {
                            if (i15 != 2) {
                                throw ho2.L(p65Var3, 2011561398, false);
                            }
                            p65Var3.Y(2011576384);
                            String str2 = vq5Var3.g;
                            boolean zF2 = p65Var3.f(rq5Var2);
                            Object objM5 = p65Var3.M();
                            if (zF2 || objM5 == uobVar3) {
                                ek5 ek5Var2 = new ek5(0, rq5Var2, rq5.class, "onContentScrolled", "onContentScrolled()V", 0, 11);
                                p65Var3.j0(ek5Var2);
                                objM5 = ek5Var2;
                            }
                            nk7.w(str2, j78Var4, nhcVar2, rq5Var2, (m45) ((qh6) objM5), null, null, p65Var3, 0);
                            p65Var3.p(false);
                        }
                    }
                    p65Var3.p(false);
                    return c1e.a;
                }
            }, p65Var2), p65Var2, 48, 16380);
            p65Var = p65Var2;
            Integer numValueOf2 = Integer.valueOf(i8);
            boolean zF = p65Var.f(d13VarB) | (i14 == 4);
            Object objM4 = p65Var.M();
            if (zF || objM4 == uobVar2) {
                objM4 = new xs3(d13VarB, vq5Var2, n92Var, 19);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, numValueOf2);
            boolean zF2 = p65Var.f(d13VarB) | (i13 == 2048) | (i14 == 4);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar2) {
                i4 = 4;
                uobVar = uobVar2;
                j78Var = j78Var4;
                j78Var2 = j78Var3;
                mo5Var = new mo5(d13VarB, rq5Var, vq5Var2, n92Var, 2);
                d13Var = d13VarB;
                vq5Var2 = vq5Var2;
                p65Var.j0(mo5Var);
            } else {
                j78Var2 = j78Var3;
                i4 = 4;
                d13Var = d13VarB;
                uobVar = uobVar2;
                mo5Var = objM5;
                j78Var = j78Var4;
            }
            kyd.k(p65Var, (b55) mo5Var, d13Var);
            uq5 uq5Var = vq5Var2.b;
            boolean zH = p65Var.h(bo4Var) | (i14 == i4) | p65Var.h(j78Var2) | p65Var.h(j78Var);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                zo5 zo5Var = new zo5(bo4Var, vq5Var2, j78Var2, j78Var, null, 2);
                p65Var.j0(zo5Var);
                objM6 = zo5Var;
            }
            kyd.k(p65Var, (b55) objM6, uq5Var);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(vq5Var, nhcVar, bo4Var, rq5Var, r28Var, i2, 8);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00e6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long J(float r17, float r18, float r19, float r20, defpackage.jv1 r21) {
        /*
            Method dump skipped, instruction units count: 335
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.J(float, float, float, float, jv1):long");
    }

    public static final r28 K(float f2, r28 r28Var, boolean z) {
        return r28Var.b(new n80(f2, z));
    }

    public static final int L(long j2, long j3) {
        boolean zD0 = d0(j2);
        if (zD0 != d0(j3)) {
            return zD0 ? -1 : 1;
        }
        return (Math.min(W(j2), W(j3)) >= 0.0f && c0(j2) != c0(j3)) ? c0(j2) ? -1 : 1 : (int) Math.signum(W(j2) - W(j3));
    }

    public static final long M(long j2, long j3) {
        float f2;
        float f3;
        long jA = uu1.a(j2, uu1.e(j3));
        float fC = uu1.c(j3);
        float fC2 = uu1.c(jA);
        float f4 = 1.0f - fC2;
        float f5 = (fC * f4) + fC2;
        float fG = uu1.g(jA);
        float fG2 = uu1.g(j3);
        float f6 = 0.0f;
        if (f5 == 0.0f) {
            f2 = 0.0f;
        } else {
            f2 = (((fG2 * fC) * f4) + (fG * fC2)) / f5;
        }
        float f7 = uu1.f(jA);
        float f8 = uu1.f(j3);
        if (f5 == 0.0f) {
            f3 = 0.0f;
        } else {
            f3 = (((f8 * fC) * f4) + (f7 * fC2)) / f5;
        }
        float fD = uu1.d(jA);
        float fD2 = uu1.d(j3);
        if (f5 != 0.0f) {
            f6 = (((fD2 * fC) * f4) + (fD * fC2)) / f5;
        }
        return J(f2, f3, f6, f5, uu1.e(j3));
    }

    public static final r28 N(r28 r28Var, hl4 hl4Var) {
        return r28Var.b(new z0e(hl4Var));
    }

    public static final long O(FileInputStream fileInputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[8192];
        int i2 = fileInputStream.read(bArr);
        long j2 = 0;
        while (i2 >= 0) {
            outputStream.write(bArr, 0, i2);
            j2 += (long) i2;
            i2 = fileInputStream.read(bArr);
        }
        return j2;
    }

    public static nz4 P(Context context) {
        ProviderInfo providerInfo;
        lz4 lz4Var;
        ApplicationInfo applicationInfo;
        int i2 = 15;
        y3b vy2Var = Build.VERSION.SDK_INT >= 28 ? new vy2(i2) : new y3b(i2);
        PackageManager packageManager = context.getPackageManager();
        jq7.h("Package manager required to locate emoji font provider", packageManager);
        Iterator<ResolveInfo> it2 = packageManager.queryIntentContentProviders(new Intent("androidx.content.action.LOAD_EMOJI_FONT"), 0).iterator();
        while (true) {
            if (!it2.hasNext()) {
                providerInfo = null;
                break;
            }
            providerInfo = it2.next().providerInfo;
            if (providerInfo != null && (applicationInfo = providerInfo.applicationInfo) != null && (applicationInfo.flags & 1) == 1) {
                break;
            }
        }
        if (providerInfo == null) {
            lz4Var = null;
        } else {
            try {
                String str = providerInfo.authority;
                String str2 = providerInfo.packageName;
                Signature[] signatureArrU = vy2Var.u(packageManager, str2);
                ArrayList arrayList = new ArrayList();
                for (Signature signature : signatureArrU) {
                    arrayList.add(signature.toByteArray());
                }
                lz4Var = new lz4(str, str2, "emojicompat-emoji-font", Collections.singletonList(arrayList), null, null);
            } catch (PackageManager.NameNotFoundException e2) {
                Log.wtf("emoji2.text.DefaultEmojiConfig", e2);
                lz4Var = null;
            }
        }
        if (lz4Var == null) {
            return null;
        }
        return new nz4(new mz4(context, lz4Var));
    }

    public static final Object Q(Class cls, Map map, List list) {
        cls.getClass();
        list.getClass();
        w5d w5dVar = new w5d(new v2(3, map));
        Object objNewProxyInstance = Proxy.newProxyInstance(cls.getClassLoader(), new Class[]{cls}, new wx(cls, map, new w5d(new a3(cls, map, false, 2)), w5dVar, list));
        objNewProxyInstance.getClass();
        return objNewProxyInstance;
    }

    public static int R(String str, int i2, int i3, boolean z) {
        while (i2 < i3) {
            char cCharAt = str.charAt(i2);
            if (((cCharAt < ' ' && cCharAt != '\t') || cCharAt >= 127 || ('0' <= cCharAt && cCharAt < ':') || (('a' <= cCharAt && cCharAt < '{') || (('A' <= cCharAt && cCharAt < '[') || cCharAt == ':'))) == (!z)) {
                return i2;
            }
            i2++;
        }
        return i3;
    }

    public static byte[] S(String str) {
        if (str == null) {
            return null;
        }
        return Base64.decode(str, 11);
    }

    public static boolean T(String str, String str2) {
        return g76.L(str, str2) || (tuc.F(str, str2, false) && str.charAt((str.length() - str2.length()) - 1) == '.' && !cgf.a.c(str));
    }

    public static String U(byte[] bArr) {
        if (bArr == null) {
            return null;
        }
        return Base64.encodeToString(bArr, 11);
    }

    public static Object V(Class cls, Object obj) {
        if (obj instanceof z65) {
            return cls.cast(obj);
        }
        if (obj instanceof a75) {
            return V(cls, ((a75) obj).c());
        }
        throw new IllegalStateException("Given component holder " + obj.getClass() + " does not implement " + z65.class + " or " + a75.class);
    }

    public static final float W(long j2) {
        return Float.intBitsToFloat((int) (j2 >> 32));
    }

    public static nr0 X(int i2, Collection collection) {
        Iterator it2 = collection.iterator();
        int i3 = 0;
        while (it2.hasNext()) {
            nr0 nr0Var = (nr0) it2.next();
            nr0Var.getClass();
            int i4 = 1 + i3;
            if (i4 > i2) {
                int i5 = i2 - i3;
                if (i5 == 0) {
                    return nr0Var;
                }
                z10.i(ev6.w("Wanted item at position ", i5, " but an Item is a Group of size 1"));
                return null;
            }
            i3 = i4;
        }
        z10.i(ev6.s(i2, i3, "Wanted item at ", " but there are only ", " items"));
        return null;
    }

    public static int Y(ArrayList arrayList) {
        Iterator it2 = arrayList.iterator();
        int i2 = 0;
        while (it2.hasNext()) {
            ((nr0) it2.next()).getClass();
            i2++;
        }
        return i2;
    }

    public static final int Z(KeyEvent keyEvent) {
        return (keyEvent.isAltPressed() ? 1 : 0) | (keyEvent.isCtrlPressed() ? 2 : 0) | (keyEvent.isMetaPressed() ? 4 : 0) | (keyEvent.isShiftPressed() ? 8 : 0);
    }

    public static final void a(q qVar, b55 b55Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(635546380);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(qVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(b55Var) ? 32 : 16;
        }
        int i4 = 0;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(-1589965236, new r(b55Var, i4, qVar), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(qVar, b55Var, i2, i4);
        }
    }

    public static final PublicKey a0(String str) throws InvalidKeySpecException {
        byte[] bArrDecode = Base64.decode(tuc.L(tuc.L(tuc.L(str, "\n", ""), "-----BEGIN PUBLIC KEY-----", ""), "-----END PUBLIC KEY-----", ""), 0);
        bArrDecode.getClass();
        PublicKey publicKeyGeneratePublic = KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(bArrDecode));
        publicKeyGeneratePublic.getClass();
        return publicKeyGeneratePublic;
    }

    public static final void b(List list, b55 b55Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        b55 b55Var2;
        r28 r28Var2;
        list.getClass();
        b55Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1924490449);
        int i3 = i2 | (p65Var2.h(list) ? 4 : 2) | (p65Var2.h(b55Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var2, 48);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarG);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28Var2 = o28Var;
            jjd.b(vo7.R(p65Var2, R.string.publication_about_connect), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(jt7.c)).l, p65Var2, 0, 0, 131070);
            p65Var = p65Var2;
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28Var2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            p65Var.Y(690572465);
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                a((q) it2.next(), b55Var, p65Var, i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            }
            b55Var2 = b55Var;
            b09.H(p65Var, false, true, true);
        } else {
            p65Var = p65Var2;
            b55Var2 = b55Var;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 2, list, b55Var2, r28Var2);
        }
    }

    public static final String b0(String str) {
        str.getClass();
        URL url = new URL("https", "www." + f94.s, "/.well-known/oauth/openid/keys/");
        ReentrantLock reentrantLock = new ReentrantLock();
        Condition conditionNewCondition = reentrantLock.newCondition();
        rya ryaVar = new rya();
        f94.c().execute(new ep0(url, ryaVar, str, reentrantLock, conditionNewCondition, 3));
        reentrantLock.lock();
        try {
            conditionNewCondition.await(5000L, TimeUnit.MILLISECONDS);
            reentrantLock.unlock();
            return (String) ryaVar.a;
        } catch (Throwable th) {
            reentrantLock.unlock();
            throw th;
        }
    }

    public static final void c(sh shVar, oh ohVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object vfVar;
        float f2;
        sh shVar2 = shVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2064919356);
        int i3 = i2 | (p65Var.f(shVar2) ? 4 : 2) | (p65Var.f(ohVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
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
            shVar2 = shVar;
            b24 b24Var = shVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                vfVar = new vf(0, ohVar, oh.class, "refresh", "refresh()V", 0, 10);
                p65Var.j0(vfVar);
            } else {
                vfVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) vfVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 13, shVar2, ohVar, r28Var);
        }
    }

    public static final boolean c0(long j2) {
        return (j2 & 2) != 0;
    }

    public static final void d(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1523921176);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
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
            p65Var.Y(657181826);
            for (int i7 = 0; i7 < 10; i7++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 6);
        }
    }

    public static final boolean d0(long j2) {
        return (j2 & 1) != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void e(defpackage.uh r22, defpackage.nhc r23, defpackage.oh r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 248
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.e(uh, nhc, oh, obe, r28, x12, int, int):void");
    }

    public static final boolean e0(int i2, int i3, long j2) {
        int iJ = f72.j(j2);
        if (i2 > f72.h(j2) || iJ > i2) {
            return false;
        }
        return i3 <= f72.g(j2) && f72.i(j2) <= i3;
    }

    public static final void f(String str, md5 md5Var, r28 r28Var, bi biVar, x12 x12Var, int i2) {
        bi biVar2;
        int i3;
        bi biVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(349322363);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(md5Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 3);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    biVar3 = (bi) to7.z(n1b.a.b(bi.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                biVar3 = biVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(biVar3.n, p65Var, 0);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i6 == 32) | p65Var.f(biVar3);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ph(biVar3, md5Var);
                p65Var.j0(objM3);
            }
            ph phVar = (ph) objM3;
            boolean zF2 = p65Var.f(biVar3) | (i6 == 32);
            Object objM4 = p65Var.M();
            if (zF2 || objM4 == uobVar) {
                objM4 = new oh(biVar3, md5Var);
                p65Var.j0(objM4);
            }
            e((uh) l78VarZ.getValue(), nhcVar, (oh) objM4, phVar, r28Var, p65Var, ((i3 << 6) & 57344) | 48, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = kyd.M(p65Var);
                p65Var.j0(objM5);
            }
            sb2 sb2Var = (sb2) objM5;
            boolean zH = p65Var.h(biVar3) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(phVar);
            Object objM6 = p65Var.M();
            if (zH || objM6 == uobVar) {
                b9 b9Var = new b9((que) biVar3, nhcVar, sb2Var, resources, (Object) phVar, (n92) null, 4);
                p65Var.j0(b9Var);
                objM6 = b9Var;
            }
            kyd.k(p65Var, (b55) objM6, c1e.a);
            biVar2 = biVar3;
        } else {
            p65Var.S();
            biVar2 = biVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 6, str, md5Var, r28Var, biVar2);
        }
    }

    public static final float f0(long j2) {
        jv1 jv1VarE = uu1.e(j2);
        if (!rv8.y(jv1VarE.b, 12884901888L)) {
            a26.a("The specified color must be encoded in an RGB color space. The supplied color space is " + ((Object) rv8.S(jv1VarE.b)));
        }
        zjb zjbVar = ((dkb) jv1VarE).p;
        double dA = zjbVar.a(uu1.g(j2));
        float fA = (float) ((zjbVar.a(uu1.d(j2)) * 0.0722d) + (zjbVar.a(uu1.f(j2)) * 0.7152d) + (dA * 0.2126d));
        if (fA < 0.0f) {
            fA = 0.0f;
        }
        if (fA > 1.0f) {
            return 1.0f;
        }
        return fA;
    }

    public static final void g(tce tceVar, kv6 kv6Var, b98 b98Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(828583481);
        int i3 = i2 | (p65Var2.f(tceVar) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(b98Var) ? 256 : 128) | (p65Var2.f(ye1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            Context context = (Context) p65Var2.j(eo.b);
            context.getClass();
            float f2 = r6.widthPixels / context.getResources().getDisplayMetrics().density;
            oe1 oe1Var = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            az5 az5Var = tceVar.b;
            az5 az5Var2 = tceVar.c;
            boolean z2 = tceVar.d;
            boolean z3 = (i3 & 896) == 256;
            Object objM = p65Var2.M();
            if (z3 || objM == w12.a) {
                z = z2;
                qv7 qv7Var = new qv7(0, b98Var, b98.class, "onRefresh", "onRefresh()V", 0, 7);
                p65Var2.j0(qv7Var);
                objM = qv7Var;
            } else {
                z = z2;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) objM), bgf.N(r28Var, "content_state"), null, 0L, 0L, false, 0.0f, null, null, pxf.E(1756994759, new c98(kv6Var, tceVar, b98Var, az5Var, ye1Var, oe1Var, az5Var2), p65Var2), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(tceVar, kv6Var, b98Var, ye1Var, r28Var, i2, 0);
        }
    }

    public static final r28 g0(r28 r28Var, x45 x45Var) {
        return r28Var.b(new q72(x45Var));
    }

    public static final void h(vta vtaVar, x12 x12Var, int i2) {
        vta vtaVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1345146249);
        int i3 = i2 | (p65Var.f(vtaVar) ? 4 : 2);
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(flb.a0(jfc.d(w2g.C(o28Var, 16.0f), 1.0f), ((zo7) p65Var.j(kt7.b)).c, rv8.r), 16.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var, R.string.clear_reading_history_label), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 0, 131070);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.l(o28Var, 16.0f));
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                vtaVar2 = vtaVar;
                objM = new yj8(25, vtaVar2);
                p65Var.j0(objM);
            } else {
                vtaVar2 = vtaVar;
            }
            fo7.l((m45) objM, vo7.R(p65Var, R.string.clear_reading_history), xn7.M, bgf.N(o28Var, "clear_history_button"), false, p65Var, 3456, 16);
            p65Var.p(true);
        } else {
            vtaVar2 = vtaVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v08(i2, 27, vtaVar2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x009a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long h0(int r13, java.lang.String r14) {
        /*
            Method dump skipped, instruction units count: 305
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.h0(int, java.lang.String):long");
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x0170  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x01b7  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0101  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0117  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long i(float r21, float r22, float r23, float r24, defpackage.jv1 r25) {
        /*
            Method dump skipped, instruction units count: 479
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.i(float, float, float, float, jv1):long");
    }

    public static final byte[] i0(FileInputStream fileInputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(Math.max(8192, fileInputStream.available()));
        O(fileInputStream, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        byteArray.getClass();
        return byteArray;
    }

    public static final long j(int i2) {
        long j2 = ((long) i2) << 32;
        int i3 = uu1.i;
        return j2;
    }

    public static final String j0(Intent intent) {
        String stringExtra = intent.getStringExtra("referrer_source");
        if (stringExtra != null) {
            return stringExtra;
        }
        ywb.g("Extra: referrer_source not found in intent");
        return null;
    }

    public static final long k(int i2, int i3, int i4, int i5) {
        return j(((i2 & 255) << 16) | ((i5 & 255) << 24) | ((i3 & 255) << 8) | (i4 & 255));
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x008a A[Catch: all -> 0x0069, DONT_GENERATE, TryCatch #2 {all -> 0x0069, blocks: (B:16:0x0049, B:18:0x0057, B:20:0x005d, B:33:0x008d, B:23:0x006b, B:25:0x0079, B:30:0x0084, B:32:0x008a, B:38:0x009a, B:41:0x00a3, B:40:0x00a0, B:28:0x007f), top: B:54:0x0049, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void k0(defpackage.n92 r9, java.lang.Object r10) throws kotlinx.coroutines.DispatchException {
        /*
            boolean r0 = r9 instanceof defpackage.rg3
            if (r0 == 0) goto Lae
            rg3 r9 = (defpackage.rg3) r9
            kb2 r0 = r9.d
            p92 r1 = r9.e
            java.lang.Throwable r2 = defpackage.bjb.b(r10)
            if (r2 != 0) goto L12
            r3 = r10
            goto L18
        L12:
            cy1 r3 = new cy1
            r4 = 0
            r3.<init>(r2, r4)
        L18:
            ib2 r2 = r1.getContext()
            boolean r2 = m0(r0, r2)
            r4 = 1
            if (r2 == 0) goto L2f
            r9.f = r3
            r9.c = r4
            ib2 r10 = r1.getContext()
            l0(r0, r10, r9)
            return
        L2f:
            k34 r0 = defpackage.ald.a()
            long r5 = r0.c
            r7 = 4294967296(0x100000000, double:2.121995791E-314)
            int r2 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r2 < 0) goto L46
            r9.f = r3
            r9.c = r4
            r0.J0(r9)
            goto La8
        L46:
            r0.K0(r4)
            ib2 r2 = r1.getContext()     // Catch: java.lang.Throwable -> L69
            cd7 r3 = defpackage.cd7.g     // Catch: java.lang.Throwable -> L69
            gb2 r2 = r2.o0(r3)     // Catch: java.lang.Throwable -> L69
            va6 r2 = (defpackage.va6) r2     // Catch: java.lang.Throwable -> L69
            if (r2 == 0) goto L6b
            boolean r3 = r2.f()     // Catch: java.lang.Throwable -> L69
            if (r3 != 0) goto L6b
            java.util.concurrent.CancellationException r10 = r2.L()     // Catch: java.lang.Throwable -> L69
            ajb r10 = defpackage.br7.n(r10)     // Catch: java.lang.Throwable -> L69
            r9.resumeWith(r10)     // Catch: java.lang.Throwable -> L69
            goto L8d
        L69:
            r10 = move-exception
            goto La4
        L6b:
            java.lang.Object r2 = r9.g     // Catch: java.lang.Throwable -> L69
            ib2 r3 = r1.getContext()     // Catch: java.lang.Throwable -> L69
            java.lang.Object r2 = defpackage.gx1.f0(r3, r2)     // Catch: java.lang.Throwable -> L69
            d1g r5 = defpackage.gx1.o     // Catch: java.lang.Throwable -> L69
            if (r2 == r5) goto L7e
            uzd r5 = defpackage.guc.a0(r1, r3, r2)     // Catch: java.lang.Throwable -> L69
            goto L7f
        L7e:
            r5 = 0
        L7f:
            r1.resumeWith(r10)     // Catch: java.lang.Throwable -> L97
            if (r5 == 0) goto L8a
            boolean r10 = r5.m0()     // Catch: java.lang.Throwable -> L69
            if (r10 == 0) goto L8d
        L8a:
            defpackage.gx1.Z(r3, r2)     // Catch: java.lang.Throwable -> L69
        L8d:
            boolean r10 = r0.M0()     // Catch: java.lang.Throwable -> L69
            if (r10 != 0) goto L8d
        L93:
            r0.I0(r4)
            goto La8
        L97:
            r10 = move-exception
            if (r5 == 0) goto La0
            boolean r1 = r5.m0()     // Catch: java.lang.Throwable -> L69
            if (r1 == 0) goto La3
        La0:
            defpackage.gx1.Z(r3, r2)     // Catch: java.lang.Throwable -> L69
        La3:
            throw r10     // Catch: java.lang.Throwable -> L69
        La4:
            r9.g(r10)     // Catch: java.lang.Throwable -> La9
            goto L93
        La8:
            return
        La9:
            r9 = move-exception
            r0.I0(r4)
            throw r9
        Lae:
            r9.resumeWith(r10)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.k0(n92, java.lang.Object):void");
    }

    public static final long l(long j2) {
        long j3 = j2 << 32;
        int i2 = uu1.i;
        return j3;
    }

    public static final void l0(kb2 kb2Var, ib2 ib2Var, Runnable runnable) throws DispatchException {
        try {
            kb2Var.E0(ib2Var, runnable);
        } catch (Throwable th) {
            throw new DispatchException(th, kb2Var, ib2Var);
        }
    }

    public static final boolean m0(kb2 kb2Var, ib2 ib2Var) throws DispatchException {
        try {
            return kb2Var.G0(ib2Var);
        } catch (Throwable th) {
            throw new DispatchException(th, kb2Var, ib2Var);
        }
    }

    public static final void n(rh rhVar, obe obeVar, oh ohVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        oh ohVar2 = ohVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2102326001);
        int i3 = i2 | (p65Var.f(rhVar) ? 4 : 2) | (p65Var.f(obeVar) ? 32 : 16) | (p65Var.f(ohVar2) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = rhVar.b;
            kv6 kv6VarA = pv6.a(p65Var);
            int i4 = i3 & 896;
            boolean z2 = i4 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, ohVar2, oh.class, "refresh", "refresh()V", 0, 12);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(2063360035, new fd3(kv6VarA, (Object) rhVar, (Object) obeVar, (Object) ohVar, 18), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i4 == 256;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                ohVar2 = ohVar;
                objM2 = new z8(ohVar2, null, 7);
                p65Var.j0(objM2);
            } else {
                ohVar2 = ohVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 7, rhVar, obeVar, ohVar2, r28Var);
        }
    }

    public static final int n0(long j2) {
        float[] fArr = lv1.a;
        return (int) (uu1.a(j2, lv1.e) >>> 32);
    }

    public static final void o(uce uceVar, b98 b98Var, r28 r28Var, x12 x12Var, int i2) {
        uce uceVar2 = uceVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1981807453);
        int i3 = i2 | (p65Var.f(uceVar2) ? 4 : 2) | (p65Var.f(b98Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            uceVar2 = uceVar;
            b24 b24Var = uceVar2.a;
            boolean z = b24Var instanceof x14;
            String strR = vo7.R(p65Var, (z && uceVar2.b) ? R.string.error_offline_mode_without_stories : z ? R.string.common_error_network_error_message : R.string.error_unable_to_load_your_lists);
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                qv7 qv7Var = new qv7(0, b98Var, b98.class, "onRefresh", "onRefresh()V", 0, 9);
                p65Var.j0(qv7Var);
                objM = qv7Var;
            }
            iq7.a(b24Var, jfc.c, strR, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, NikonType2MakernoteDirectory.TAG_FILE_INFO);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 14, uceVar2, b98Var, r28Var);
        }
    }

    public static final boolean o0(PublicKey publicKey, String str, String str2) {
        str2.getClass();
        try {
            java.security.Signature signature = java.security.Signature.getInstance("SHA256withRSA");
            signature.initVerify(publicKey);
            byte[] bytes = str.getBytes(wk1.a);
            bytes.getClass();
            signature.update(bytes);
            byte[] bArrDecode = Base64.decode(str2, 8);
            bArrDecode.getClass();
            return signature.verify(bArrDecode);
        } catch (Exception unused) {
            return false;
        }
    }

    public static final void p(vq5 vq5Var, rq5 rq5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        vq5 vq5Var2;
        rq5 rq5Var2 = rq5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1557207682);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(vq5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(rq5Var2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
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
            int i5 = i3;
            ar0 ar0Var = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
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
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            qv5.b(vn7.J(R.drawable.medium_wordmark, 0, p65Var), null, w2g.G(o28Var, 24.0f, 0.0f, 0.0f, 0.0f, 14), ((zo7) p65Var.j(kt7.b)).n, p65Var, 440, 0);
            hp7.t(p65Var, new sq6(1.0f, true));
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                vq5Var2 = vq5Var;
                rq5Var2 = rq5Var;
                objM = new nq5(rq5Var2, vq5Var2, 0);
                p65Var.j0(objM);
            } else {
                vq5Var2 = vq5Var;
                rq5Var2 = rq5Var;
            }
            f49.l((m45) objM, jfc.l(w2g.G(o28Var, 0.0f, 0.0f, 16.0f, 0.0f, 11), 48.0f), false, null, null, pxf.E(-1923658359, new l23(25, vq5Var2), p65Var), p65Var, 1572912, 60);
            p65Var = p65Var;
            ho2.N(p65Var, true, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ac(i2, 28, vq5Var, rq5Var2, r28Var);
        }
    }

    public static final r28 p0(r28 r28Var, y3f y3fVar) {
        return r28Var.b(new h36(y3fVar));
    }

    public static final void q(vq5 vq5Var, nhc nhcVar, bo4 bo4Var, rq5 rq5Var, r28 r28Var, x12 x12Var, int i2) {
        boolean z;
        rq5 rq5Var2;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(300541521);
        int i3 = i2 | (p65Var.f(vq5Var) ? 4 : 2) | (p65Var.h(bo4Var) ? 256 : 128) | (p65Var.f(rq5Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            m73 m73Var = (m73) p65Var.j(z22.h);
            p65Var.Y(1057601774);
            WeakHashMap weakHashMap = f5f.w;
            float fN = m73Var.N(tr7.o(p65Var).f.e().b);
            p65Var.p(false);
            Object[] objArr = new Object[0];
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new e73(14);
                p65Var.j0(objM);
            }
            g49 g49Var = (g49) hp7.E(objArr, (m45) objM, p65Var, 48);
            Object[] objArr2 = new Object[0];
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new e73(13);
                p65Var.j0(objM2);
            }
            g49 g49Var2 = (g49) hp7.E(objArr2, (m45) objM2, p65Var, 48);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new qq5(g49Var2, g49Var);
                p65Var.j0(objM3);
            }
            r28 r28VarJ = rv8.J(r28Var.b(jfc.c), (qq5) objM3, null);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 0.0f, fN, 0.0f, 0.0f, 13);
            boolean zF = p65Var.f(g49Var);
            Object objM4 = p65Var.M();
            if (zF || objM4 == uobVar) {
                objM4 = new w35(g49Var, 1);
                p65Var.j0(objM4);
            }
            r28 r28VarV = pwd.V(r28VarG, (x45) objM4);
            boolean zF2 = p65Var.f(g49Var2);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new w35(g49Var2, 2);
                p65Var.j0(objM5);
            }
            r28 r28VarR2 = guc.R(r28VarV, (x45) objM5);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarR2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            zib zibVar = vq5Var.d;
            if (zibVar == null) {
                p65Var.Y(-823224160);
                z = false;
                p65Var.p(false);
                rq5Var2 = rq5Var;
                r28Var2 = null;
            } else {
                z = false;
                p65Var.Y(-823224159);
                rq5Var2 = rq5Var;
                r28Var2 = null;
                qq7.d(zibVar, new pq5(rq5Var2, vq5Var), null, p65Var, 0);
                p65Var.p(false);
            }
            xn8 xn8Var = vq5Var.e;
            if (xn8Var == null) {
                p65Var.Y(-822093745);
            } else {
                p65Var.Y(-822093744);
                no7.c(xn8Var, rq5Var2, r28Var2, p65Var, (i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            }
            p65Var.p(z);
            p(vq5Var, rq5Var2, w2g.G(o28Var, 0.0f, (zibVar == null && xn8Var == null) ? 32.0f : 24.0f, 0.0f, 20.0f, 5), p65Var, (i3 & 14) | ((i3 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
            p65Var.p(true);
            float fG = g49Var2.g() + g49Var.g();
            if (fG < 0.0f) {
                fG = 0.0f;
            }
            I(vq5Var, nhcVar, bo4Var, rq5Var2, w2g.G(o28Var, 0.0f, m73Var.Q(fG) + fN, 0.0f, 0.0f, 13), p65Var, i3 & 8190);
            dy0.a(jfc.e(jfc.d(flb.a0(o28Var, ((zo7) p65Var.j(kt7.b)).a, rv8.r), 1.0f), fN), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(vq5Var, nhcVar, bo4Var, rq5Var, r28Var, i2, 25);
        }
    }

    public static final void r(vq5 vq5Var, bo4 bo4Var, rq5 rq5Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        vq5Var.getClass();
        bo4Var.getClass();
        rq5Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(977673532);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(vq5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(bo4Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(rq5Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = 0;
        int i5 = 1;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new cq4(26);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, false, (x45) objM), "home_screen");
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var);
            }
            nhc nhcVar = (nhc) objM2;
            pr7.b(null, null, null, pxf.E(-1270002692, new u8(nhcVar, 29), p65Var), pxf.E(1987848027, new hm4(vq5Var, 13, rq5Var), p65Var), 0, 0L, 0L, qb8.p, pxf.E(234718611, new ov2(vq5Var, nhcVar, bo4Var, rq5Var, 7), p65Var), p65Var, 805334016, 231);
            p65Var = p65Var;
            boolean z = vq5Var.i;
            r28 r28VarA = iy0.a.a(o28.b, z46.k);
            Object objM3 = p65Var.M();
            int i7 = 22;
            if (objM3 == uobVar) {
                objM3 = new be7(i7);
                p65Var.j0(objM3);
            }
            hud hudVar = sz3.a;
            Map map = qwe.a;
            zz3 zz3VarA = new zz3(new esd((i94) null, new pfc(new rz3(i4, (x45) objM3), f76.P(0.0f, 400.0f, new k46(4294967297L), 1)), (uj1) null, (gp7) null, (LinkedHashMap) null, 125)).a(sz3.c(null, 3));
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new be7(i7);
                p65Var.j0(objM4);
            }
            vv2.c(z, r28VarA, zz3VarA, new k54(new esd((i94) null, new pfc(new rz3(i5, (x45) objM4), f76.P(0.0f, 400.0f, new k46(4294967297L), 1)), (uj1) null, (gp7) null, (LinkedHashMap) null, 125)).a(sz3.d(null, 3)), null, pxf.E(2092311706, new g64(vq5Var, 15, rq5Var), p65Var), p65Var, 200064, 16);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 24, vq5Var, bo4Var, rq5Var, r28Var);
        }
    }

    public static final void s(String str, bo4 bo4Var, gq5 gq5Var, r28 r28Var, ar5 ar5Var, x12 x12Var, int i2) {
        ar5 ar5Var2;
        int i3;
        ar5 ar5Var3;
        str.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2001876721);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(gq5Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                Object objJ = p65Var.j(r57.a);
                objJ.getClass();
                xy1 xy1Var = (xy1) objJ;
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 29);
                    p65Var.j0(objM);
                }
                ar5 ar5Var4 = (ar5) to7.z(n1b.a.b(ar5.class), xy1Var, t40.E(xy1Var, p65Var), r40.N(xy1Var.getDefaultViewModelCreationExtras(), (x45) objM), p65Var);
                i3 = i4 & (-57345);
                ar5Var3 = ar5Var4;
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                ar5Var3 = ar5Var;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ar5Var3.s, p65Var, 0);
            boolean zF = ((i3 & 896) == 256) | p65Var.f(ar5Var3) | ((i3 & 14) == 4);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new rq5(ar5Var3, gq5Var, str);
                p65Var.j0(objM2);
            }
            r((vq5) l78VarZ.getValue(), bo4Var, (rq5) objM2, r28Var, p65Var, i3 & 7280);
            ar5Var2 = ar5Var3;
        } else {
            p65Var.S();
            ar5Var2 = ar5Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, bo4Var, gq5Var, r28Var, ar5Var2, i2, 26);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:115:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x01eb  */
    /* JADX WARN: Removed duplicated region for block: B:120:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(final defpackage.ymc r20, defpackage.r28 r21, final defpackage.pw6 r22, final defpackage.jy8 r23, defpackage.g70 r24, defpackage.dn4 r25, boolean r26, defpackage.fx8 r27, final defpackage.x45 r28, defpackage.x12 r29, final int r30, final int r31, final int r32) {
        /*
            Method dump skipped, instruction units count: 510
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.op8.t(ymc, r28, pw6, jy8, g70, dn4, boolean, fx8, x45, x12, int, int, int):void");
    }

    public static final void u(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1921506117);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f2 = r13.widthPixels / context.getResources().getDisplayMetrics().density;
            oe1 oe1Var = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            kv6 kv6VarA = pv6.a(p65Var);
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarG = w2g.g(1, 0.0f);
            r28 r28VarN = bgf.N(m40.V(r28Var.b(jfc.c), p65Var, 0), "loading_state");
            boolean zD = p65Var.d(oe1Var.ordinal());
            Object objM = p65Var.M();
            if (zD || objM == w12.a) {
                objM = new fv4(oe1Var, i4);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, kv6VarA, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var, 12607872, 360);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 22);
        }
    }

    public static final void v(int i2, x12 x12Var, bo4 bo4Var, r28 r28Var, uef uefVar, String str) {
        m98 m98Var;
        str.getClass();
        bo4Var.getClass();
        uefVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1911756311);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(uefVar) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = (((i3 & 14) ^ 6) > 4 && p65Var.f(str)) || (i3 & 6) == 4;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new ov5(str, 8);
                p65Var.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            m98 m98Var2 = (m98) to7.z(n1b.a.b(m98.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            Resources resources = (Resources) p65Var.j(eo.c);
            l78 l78VarZ = guc.z(m98Var2.t, p65Var, 0);
            l78 l78VarZ2 = guc.z(m98Var2.x, p65Var, 0);
            l78 l78VarZ3 = guc.z(m98Var2.z, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            nhc nhcVarF = mk7.F(p65Var);
            int i4 = i3 & 896;
            boolean zF = p65Var.f(m98Var2) | (i4 == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new i98(m98Var2, uefVar);
                p65Var.j0(objM2);
            }
            i98 i98Var = (i98) objM2;
            boolean zF2 = p65Var.f(m98Var2) | (i4 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new h98(m98Var2, uefVar);
                p65Var.j0(objM3);
            }
            h98 h98Var = (h98) objM3;
            w((wce) l78VarZ.getValue(), (nce) l78VarZ2.getValue(), (dce) l78VarZ3.getValue(), kv6VarA, nhcVarF, i98Var, h98Var, r28Var, p65Var, 12582912);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = kyd.M(p65Var);
                p65Var.j0(objM4);
            }
            sb2 sb2Var = (sb2) objM4;
            boolean zH = p65Var.h(m98Var2) | p65Var.f(nhcVarF) | p65Var.f(i98Var) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(h98Var);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                yu yuVar = new yu(m98Var2, nhcVarF, i98Var, sb2Var, resources, h98Var, null, 12);
                m98Var = m98Var2;
                p65Var.j0(yuVar);
                objM5 = yuVar;
            } else {
                m98Var = m98Var2;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM5, c1eVar);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM6 = p65Var.M();
            int i5 = 7;
            n92 n92Var = null;
            if (zH2 || objM6 == uobVar) {
                objM6 = new wi1(bo4Var, kv6VarA, n92Var, i5);
                p65Var.j0(objM6);
            }
            kyd.k(p65Var, (b55) objM6, c1eVar);
            boolean zF3 = p65Var.f(kv6VarA) | p65Var.h(m98Var);
            Object objM7 = p65Var.M();
            if (zF3 || objM7 == uobVar) {
                objM7 = new kd7(kv6VarA, m98Var, n92Var, i5);
                p65Var.j0(objM7);
            }
            kyd.k(p65Var, (b55) objM7, kv6VarA);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gv4(str, bo4Var, uefVar, r28Var, i2, 1);
        }
    }

    public static final void w(wce wceVar, nce nceVar, dce dceVar, kv6 kv6Var, nhc nhcVar, b98 b98Var, ye1 ye1Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        kv6 kv6Var2;
        p65 p65Var;
        int i4;
        uob uobVar;
        Object qv7Var;
        m45 m45Var;
        boolean z;
        int i5;
        Object qv7Var2;
        m45 m45Var2;
        b98 b98Var2;
        int i6;
        uob uobVar2;
        String str;
        wceVar.getClass();
        kv6Var.getClass();
        nhcVar.getClass();
        b98Var.getClass();
        ye1Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(731925625);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(wceVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i7 = 16;
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nceVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(dceVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            kv6Var2 = kv6Var;
            i3 |= p65Var2.f(kv6Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            kv6Var2 = kv6Var;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(nhcVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(b98Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.f(ye1Var) ? 1048576 : 524288;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 8388608 : 4194304;
        }
        int i8 = i3;
        if (p65Var2.P(i8 & 1, (4793491 & i8) != 4793490)) {
            Object objM = p65Var2.M();
            uob uobVar3 = w12.a;
            if (objM == uobVar3) {
                objM = new ss7(i7);
                p65Var2.j0(objM);
            }
            pr7.b(bgf.N(rv8.J(wxb.a(r28Var, false, (x45) objM), jq7.t(p65Var2), null).b(jfc.c), "my_lists_screen"), null, null, pxf.E(-224125185, new w87(nhcVar, 3), p65Var2), null, 0, 0L, 0L, qb8.p, pxf.E(540989832, new fd3(wceVar, kv6Var2, b98Var, ye1Var, 3), p65Var2), p65Var2, 805309440, 246);
            if (nceVar instanceof lce) {
                p65Var2.Y(-994057954);
                String str2 = ((lce) nceVar).a;
                int i9 = i8 & 458752;
                boolean z2 = i9 == 131072;
                Object objM2 = p65Var2.M();
                if (z2 || objM2 == uobVar3) {
                    i4 = 458752;
                    i6 = i9;
                    uobVar2 = uobVar3;
                    str = str2;
                    g98 g98Var = new g98(1, b98Var, b98.class, "onRemoveDownloadedListsCatalog", "onRemoveDownloadedListsCatalog(Ljava/lang/String;)V", 0, 0);
                    p65Var2.j0(g98Var);
                    objM2 = g98Var;
                } else {
                    str = str2;
                    uobVar2 = uobVar3;
                    i4 = 458752;
                    i6 = i9;
                }
                x45 x45Var = (x45) ((qh6) objM2);
                boolean z3 = i6 == 131072;
                Object objM3 = p65Var2.M();
                uobVar = uobVar2;
                if (z3 || objM3 == uobVar) {
                    objM3 = new qv7(0, b98Var, b98.class, "onDialogClosed", "onDialogClosed()V", 0, 16);
                    p65Var2.j0(objM3);
                }
                tp7.l(str, x45Var, (m45) ((qh6) objM3), null, p65Var2, 0);
                p65Var2.p(false);
            } else {
                i4 = 458752;
                uobVar = uobVar3;
                if (nceVar instanceof kce) {
                    p65Var2.Y(-994047280);
                    boolean z4 = ((kce) nceVar).a;
                    int i10 = i8 & 458752;
                    boolean z5 = i10 == 131072;
                    Object objM4 = p65Var2.M();
                    if (z5 || objM4 == uobVar) {
                        z = z4;
                        i5 = i10;
                        qv7 qv7Var3 = new qv7(0, b98Var, b98.class, "onOfflineModeEducationalNegativeButtonClicked", "onOfflineModeEducationalNegativeButtonClicked()V", 0, 10);
                        p65Var2.j0(qv7Var3);
                        objM4 = qv7Var3;
                    } else {
                        z = z4;
                        i5 = i10;
                    }
                    m45 m45Var3 = (m45) ((qh6) objM4);
                    boolean z6 = i5 == 131072;
                    Object objM5 = p65Var2.M();
                    if (z6 || objM5 == uobVar) {
                        m45Var2 = m45Var3;
                        qv7Var2 = new qv7(0, b98Var, b98.class, "onOfflineModeEducationalPositiveButtonClicked", "onOfflineModeEducationalPositiveButtonClicked()V", 0, 11);
                        p65Var2.j0(qv7Var2);
                    } else {
                        qv7Var2 = objM5;
                        m45Var2 = m45Var3;
                    }
                    to7.c(z, m45Var2, (m45) ((qh6) qv7Var2), p65Var2, 0);
                    p65Var2.p(false);
                } else if (nceVar instanceof mce) {
                    p65Var2.Y(-994034427);
                    int i11 = i8 & 458752;
                    boolean z7 = ((i8 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | (i11 == 131072);
                    Object objM6 = p65Var2.M();
                    if (z7 || objM6 == uobVar) {
                        objM6 = new ps5(b98Var, 15, nceVar);
                        p65Var2.j0(objM6);
                    }
                    m45 m45Var4 = (m45) objM6;
                    boolean z8 = i11 == 131072;
                    Object objM7 = p65Var2.M();
                    if (z8 || objM7 == uobVar) {
                        m45Var = m45Var4;
                        qv7Var = new qv7(0, b98Var, b98.class, "onDialogClosed", "onDialogClosed()V", 0, 12);
                        p65Var2.j0(qv7Var);
                    } else {
                        qv7Var = objM7;
                        m45Var = m45Var4;
                    }
                    guc.e(m45Var, (m45) ((qh6) qv7Var), null, p65Var2, 0);
                    p65Var2.p(false);
                } else {
                    if (nceVar != null) {
                        throw ho2.L(p65Var2, -994060563, false);
                    }
                    p65Var2.Y(-994027523);
                    p65Var2.p(false);
                }
            }
            if (dceVar != null) {
                p65Var2.Y(-994023239);
                int i12 = i8 & i4;
                boolean z9 = i12 == 131072;
                Object objM8 = p65Var2.M();
                if (z9 || objM8 == uobVar) {
                    b98Var2 = b98Var;
                    objM8 = new qv7(0, b98Var2, b98.class, "goToDeviceStorageSettingsScreen", "goToDeviceStorageSettingsScreen()V", 0, 13);
                    p65Var2.j0(objM8);
                } else {
                    b98Var2 = b98Var;
                }
                m45 m45Var5 = (m45) ((qh6) objM8);
                boolean z10 = ((i8 & 896) == 256) | (i12 == 131072);
                Object objM9 = p65Var2.M();
                if (z10 || objM9 == uobVar) {
                    objM9 = new ps5(b98Var2, 14, dceVar);
                    p65Var2.j0(objM9);
                }
                m45 m45Var6 = (m45) objM9;
                boolean z11 = i12 == 131072;
                Object objM10 = p65Var2.M();
                if (z11 || objM10 == uobVar) {
                    qv7 qv7Var4 = new qv7(0, b98Var2, b98.class, "onBottomSheetClosed", "onBottomSheetClosed()V", 0, 14);
                    p65Var2.j0(qv7Var4);
                    objM10 = qv7Var4;
                }
                p65Var = p65Var2;
                br7.d(m45Var5, m45Var6, (m45) ((qh6) objM10), null, p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var = p65Var2;
                if (dceVar != null) {
                    throw ho2.L(p65Var, -994026466, false);
                }
                p65Var.Y(-994009763);
                p65Var.p(false);
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ey4(wceVar, nceVar, dceVar, kv6Var, nhcVar, b98Var, ye1Var, r28Var, i2);
        }
    }

    public static final void x(eua euaVar, kv6 kv6Var, sh9 sh9Var, vta vtaVar, r28 r28Var, x12 x12Var, int i2) {
        vta vtaVar2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-49236313);
        int i3 = i2 | (p65Var.f(euaVar) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128) | (p65Var.f(vtaVar) ? 2048 : 1024);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 40.0f, 7);
            int i4 = i3 & 7168;
            boolean zD = ((i3 & 14) == 4) | (i4 == 2048) | p65Var.d(stcVar.ordinal()) | ((i3 & 896) == 256);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zD || objM == uobVar) {
                iu iuVar = new iu(euaVar, vtaVar, stcVar, sh9Var, 22);
                p65Var.j0(iuVar);
                objM = iuVar;
            }
            vtaVar2 = vtaVar;
            k40.t(r28Var, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 390, 504);
            boolean z = i4 == 2048;
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                objM2 = new tta(vtaVar2, null, 0);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            vtaVar2 = vtaVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(euaVar, kv6Var, sh9Var, vtaVar2, r28Var, i2, 21);
        }
    }

    public static final void y(vta vtaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        uob uobVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2050005687);
        int i4 = (p65Var2.f(vtaVar) ? 4 : 2) | i2;
        if (p65Var2.P(i4 & 1, (i4 & 19) != 18)) {
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var2, R.string.empty_state_history);
            String strR2 = vo7.R(p65Var2, R.string.empty_state_history_content);
            String strR3 = vo7.R(p65Var2, R.string.tab_title_explore);
            int i7 = i4 & 14;
            boolean z = i7 == 4;
            Object objM = p65Var2.M();
            uob uobVar2 = w12.a;
            if (z || objM == uobVar2) {
                i3 = 4;
                uobVar = uobVar2;
                c9a c9aVar = new c9a(0, vtaVar, vta.class, "navigateToExplore", "navigateToExplore()V", 0, 27);
                p65Var2.j0(c9aVar);
                objM = c9aVar;
            } else {
                i3 = 4;
                uobVar = uobVar2;
            }
            int i8 = 1;
            int i9 = i3;
            gq7.a(wgf.R(jfc.c, wgf.K(p65Var2), false, 14), null, strR, strR2, 0L, strR3, (m45) ((qh6) objM), null, null, 0.0f, 0.0f, p65Var2, 0, 0, 1938);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
            boolean z2 = i7 == i9;
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                objM2 = new tta(vtaVar, null, i8);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pma(vtaVar, r28Var, i2, 7);
        }
    }

    public static final void z(gua guaVar, vta vtaVar, r28 r28Var, x12 x12Var, int i2) {
        gua guaVar2 = guaVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-166645107);
        int i3 = i2 | (p65Var.f(guaVar2) ? 4 : 2) | (p65Var.f(vtaVar) ? 32 : 16);
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
            guaVar2 = guaVar;
            b24 b24Var = guaVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                c9a c9aVar = new c9a(0, vtaVar, vta.class, "refresh", "refresh()V", 0, 28);
                p65Var.j0(c9aVar);
                objM = c9aVar;
            }
            iq7.a(b24Var, jfc.c, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 22, guaVar2, vtaVar, r28Var);
        }
    }

    static {
        boolean z = false;
        int i2 = 16;
        e = new d1g(i2, "UNDEFINED", z);
        f = new d1g(i2, bPUi.UZVBlsv, z);
    }
}
