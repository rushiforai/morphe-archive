package defpackage;

import android.app.ActionBar;
import android.app.Activity;
import android.app.Dialog;
import android.content.ComponentName;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.UninitializedPropertyAccessException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class g76 {
    public static final float[] a = new float[91];
    public static final mz1 b = new mz1(new wz1(0), false, 636288403);
    public static final mz1 c = new mz1(new wz1(1), false, -1357803046);
    public static final mz1 d;
    public static final mz1 e;
    public static final js4 f;
    public static final ku3 g;
    public static ku3 h = null;
    public static final Object i;
    public static zwe j = null;
    public static final /* synthetic */ int k = 0;
    public static final /* synthetic */ int l = 0;
    public static boolean m = false;
    public static Method n = null;
    public static boolean o = false;
    public static Field p;

    static {
        new mz1(new f02(10), false, -238983578);
        d = new mz1(new f02(11), false, -866963645);
        new mz1(new f02(12), false, -632559800);
        new mz1(new f02(13), false, 1435174175);
        e = new mz1(new p02(0), false, -70554093);
        f = new js4(18);
        Object obj = null;
        g = new ku3(obj, obj, obj, 20);
        i = new Object();
    }

    public static final void A(String str, String str2, qlb qlbVar, r28 r28Var, qxc qxcVar, x12 x12Var, int i2) {
        qxc qxcVar2;
        qxc qxcVar3;
        int i3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(218656363);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(qlbVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new bb0(str, str2, 19);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    qxcVar3 = (qxc) to7.z(n1b.a.b(qxc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-57345);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                qxcVar3 = qxcVar;
            }
            p65Var.q();
            z((nxc) guc.z(qxcVar3.i, p65Var, 0).getValue(), new gxc(qlbVar, qxcVar3), r28Var, p65Var, (i3 >> 3) & 896, 0);
            qxcVar2 = qxcVar3;
        } else {
            p65Var.S();
            qxcVar2 = qxcVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(str, str2, qlbVar, r28Var, qxcVar2, i2, 0);
        }
    }

    public static final void B(jxc jxcVar, gxc gxcVar, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1960916089);
        int i3 = i2 | (p65Var.f(jxcVar) ? 4 : 2) | (p65Var.f(gxcVar) ? 32 : 16) | 384;
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
            obj = r28Var;
        } else {
            if (jxcVar.e.isEmpty()) {
                ygf.f("Subscribers list should not be empty");
                return;
            }
            if (jxcVar.b <= 0) {
                ygf.f("Subscriber count should be greater than 0");
                return;
            }
            p65Var.Y(-1050258872);
            m73 m73Var = (m73) p65Var.j(z22.h);
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
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
            r40.h(null, null, pxf.E(-1224100888, new nh(jxcVar, m73Var, gxcVar, 6), p65Var), p65Var, 3072, 7);
            b09.H(p65Var, true, true, false);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new obb(gxcVar, null, 11);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
            obj = o28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 28, jxcVar, gxcVar, obj);
        }
    }

    public static final void C(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1016809166);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            rh4 rh4Var = jfc.c;
            ((jp7) p65Var.j(kt7.a)).getClass();
            r28 r28VarD = jfc.d(jfc.r(rh4Var, 3), 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            gq7.a(iy0.a.a(o28Var, ar0Var), null, vo7.R(p65Var, R.string.subscribers_list_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var2, i2, 27);
        }
    }

    public static final void D(lxc lxcVar, gxc gxcVar, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        Object jocVar;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1749970409);
        int i3 = i2 | (p65Var.f(lxcVar) ? 4 : 2) | (p65Var.f(gxcVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var2 = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var2, 3, 1.0f);
            ar0 ar0Var = z46.h;
            zk7 zk7VarC = dy0.c(ar0Var, false);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            b24 b24Var = lxcVar.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                o28Var = o28Var2;
                jocVar = new joc(0, gxcVar, gxc.class, "onRefresh", "onRefresh()V", 0, 12);
                p65Var.j0(jocVar);
            } else {
                jocVar = objM;
                o28Var = o28Var2;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, (m45) ((qh6) jocVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
            obj = o28Var;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 27, lxcVar, gxcVar, obj);
        }
    }

    public static final void E(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        r28 r28Var2;
        long j4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(143617514);
        int i3 = i2 | 22;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).c;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.B(m40.V(r28Var3, p65Var, 6), w2g.h(24.0f, 32.0f, 24.0f, 0.0f, 8)), 3, 1.0f);
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
            sn3 sn3Var = jt7.c;
            long j8 = j4;
            ok7.r(140.0f, 48, 4, j8, p65Var, null, ((bu7) p65Var.j(sn3Var)).h);
            ok7.r(208.0f, 48, 4, j8, p65Var, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).n);
            ok7.r(100.0f, 48, 4, j8, p65Var, null, ((bu7) lv8.n(o28Var, 8.0f, p65Var, sn3Var)).n);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            int i8 = 21;
            m40.p(null, new h70(16.0f, true, new z10(i8)), new h70(16.0f, true, new z10(i8)), null, 2, 0, pxf.E(-128526334, new bl0(5, j8), p65Var), p65Var, 1597872, 41);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
            r28Var2 = r28Var3;
            j3 = j8;
        } else {
            p65Var.S();
            j3 = j2;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j3, i2, 21);
        }
    }

    public static final void F(gxc gxcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1487080115);
        int i3 = (p65Var2.f(gxcVar) ? 4 : 2) | i2 | 48;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            String strR = vo7.R(p65Var2, R.string.subscribers_list_title);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new joc(0, gxcVar, gxc.class, "onBackPressed", "onBackPressed()V", 0, 13);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            r28Var2 = o28.b;
            qk7.g(r28Var2, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 6, 504);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new l6c(gxcVar, r28Var2, i2, 6);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0028  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002a  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0033  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:42:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void G(int r21, int r22, long r23, defpackage.x12 r25, defpackage.r28 r26) {
        /*
            Method dump skipped, instruction units count: 349
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.G(int, int, long, x12, r28):void");
    }

    public static final void H(m45 m45Var, r28 r28Var, boolean z, amb ambVar, ay2 ay2Var, hy8 hy8Var, mz1 mz1Var, x12 x12Var, int i2, int i3) {
        if ((i3 & 2) != 0) {
            r28Var = o28.b;
        }
        r28 r28Var2 = r28Var;
        if ((i3 & 4) != 0) {
            z = true;
        }
        boolean z2 = z;
        if ((i3 & 32) != 0) {
            ambVar = ((x4c) ((p65) x12Var).j(a5c.a)).a;
        }
        f(m45Var, r28Var2, z2, null, ambVar, null, (i3 & 128) != 0 ? i11.b(0L, x12Var, 7) : ay2Var, (i3 & 256) != 0 ? i11.c : hy8Var, mz1Var, x12Var, i2 & 2147483646, 0);
    }

    public static boolean I(float f2, Float f3) {
        return f3 != null && f2 == f3.floatValue();
    }

    public static boolean J(Float f2, float f3) {
        return f2 != null && f2.floatValue() == f3;
    }

    public static boolean K(Float f2, Float f3) {
        return f2 == null ? f3 == null : f3 != null && f2.floatValue() == f3.floatValue();
    }

    public static boolean L(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final Object M(ArrayList arrayList, p4d p4dVar) {
        if (arrayList.isEmpty()) {
            return ey3.a;
        }
        n33[] n33VarArr = (n33[]) arrayList.toArray(new n33[0]);
        ll0 ll0Var = new ll0(n33VarArr);
        x51 x51Var = new x51(1, pwd.Q(p4dVar));
        x51Var.s();
        int length = n33VarArr.length;
        jl0[] jl0VarArr = new jl0[length];
        for (int i2 = 0; i2 < length; i2++) {
            n33 n33Var = n33VarArr[i2];
            ((db6) n33Var).start();
            jl0 jl0Var = new jl0(ll0Var, x51Var);
            jl0Var.f = bo.U(n33Var, true, jl0Var);
            jl0VarArr[i2] = jl0Var;
        }
        kl0 kl0Var = new kl0(jl0VarArr);
        for (int i3 = 0; i3 < length; i3++) {
            jl0 jl0Var2 = jl0VarArr[i3];
            jl0Var2.getClass();
            m80.a.putObjectVolatile(jl0Var2, jl0.h, kl0Var);
        }
        if (x51Var.x()) {
            kl0Var.a();
        } else {
            x51Var.w(kl0Var);
        }
        return x51Var.q();
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Not found exit edge by exit block: B:36:0x00e9
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.checkLoopExits(LoopRegionMaker.java:226)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeLoopRegion(LoopRegionMaker.java:196)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:63)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:96)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:282)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:65)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:125)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:102)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:125)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    public static defpackage.ac3 N(defpackage.h30 r24) {
        /*
            Method dump skipped, instruction units count: 671
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.N(h30):ac3");
    }

    public static final float O(xv2 xv2Var, float f2, float f3) {
        ln4 ln4Var = xv2Var.a;
        zw zwVar = new zw(0.0f);
        int iB = zwVar.b();
        int i2 = 0;
        while (i2 < iB) {
            zwVar.e(i2, ln4Var.p(i2 == 0 ? f2 : 0.0f, i2 == 0 ? f3 : 0.0f));
            i2++;
        }
        return zwVar.a;
    }

    public static final long P(yua yuaVar, h21 h21Var, int i2, long j2, long j3) {
        h21 h21Var2;
        kz0 kz0Var = yuaVar.b;
        h21Var.getClass();
        long j4 = i2;
        dm2.A(h21Var.e(), 0L, j4);
        if (yuaVar.c) {
            ygf.f("closed");
            return 0L;
        }
        long jMax = j2;
        int i3 = i2;
        h21 h21Var3 = h21Var;
        loop0: while (true) {
            long jA = b.a(kz0Var, h21Var3, jMax, j3, i3);
            long j5 = jMax;
            if (jA == -1) {
                long j6 = kz0Var.b;
                long j7 = (j6 - j4) + 1;
                if (j7 >= j3) {
                    break;
                }
                if (j6 >= j3) {
                    int iMax = (int) Math.max(1L, (j6 - j3) + 1);
                    int iMin = ((int) Math.min(j4, (kz0Var.b - j5) + 1)) - 1;
                    if (iMax > iMin) {
                        break;
                    }
                    while (true) {
                        h21Var2 = h21Var;
                        if (!kz0Var.R(iMin, kz0Var.b - ((long) iMin), h21Var2)) {
                            if (iMin == iMax) {
                                break loop0;
                            }
                            iMin--;
                        } else {
                            break;
                        }
                    }
                } else {
                    h21Var2 = h21Var;
                }
                if (yuaVar.a.q0(kz0Var, 8192L) == -1) {
                    break;
                }
                i3 = i2;
                jMax = Math.max(j5, j7);
                h21Var3 = h21Var2;
            } else {
                return jA;
            }
        }
        return -1L;
    }

    public static int Q(int i2, int i3) {
        if (i2 < i3) {
            return -1;
        }
        return i2 == i3 ? 0 : 1;
    }

    public static int R(long j2, long j3) {
        if (j2 < j3) {
            return -1;
        }
        return j2 == j3 ? 0 : 1;
    }

    public static void S(Intent intent) {
        synchronized (i) {
            try {
                if (j != null && intent.getBooleanExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", false)) {
                    intent.putExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", false);
                    j.c();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static xw T(xw xwVar, float f2, float f3, int i2) {
        if ((i2 & 1) != 0) {
            f2 = ((Number) xwVar.b.getValue()).floatValue();
        }
        if ((i2 & 2) != 0) {
            f3 = ((zw) xwVar.c).a;
        }
        return new xw(xwVar.a, Float.valueOf(f2), new zw(f3), xwVar.d, xwVar.e, xwVar.f);
    }

    public static boolean U(ik6 ik6Var, View view, Window.Callback callback, KeyEvent keyEvent) {
        DialogInterface.OnKeyListener onKeyListener;
        boolean zBooleanValue = false;
        if (ik6Var != null) {
            if (Build.VERSION.SDK_INT >= 28) {
                return ik6Var.superDispatchKeyEvent(keyEvent);
            }
            if (callback instanceof Activity) {
                Activity activity = (Activity) callback;
                activity.onUserInteraction();
                Window window = activity.getWindow();
                if (window.hasFeature(8)) {
                    ActionBar actionBar = activity.getActionBar();
                    if (keyEvent.getKeyCode() == 82 && actionBar != null) {
                        if (!m) {
                            try {
                                n = actionBar.getClass().getMethod("onMenuKeyEvent", KeyEvent.class);
                            } catch (NoSuchMethodException unused) {
                            }
                            m = true;
                        }
                        Method method = n;
                        if (method != null) {
                            try {
                                Object objInvoke = method.invoke(actionBar, keyEvent);
                                if (objInvoke != null) {
                                    zBooleanValue = ((Boolean) objInvoke).booleanValue();
                                }
                            } catch (IllegalAccessException | InvocationTargetException unused2) {
                            }
                        }
                        if (zBooleanValue) {
                            return true;
                        }
                    }
                }
                if (window.superDispatchKeyEvent(keyEvent)) {
                    return true;
                }
                View decorView = window.getDecorView();
                if (ute.c(decorView, keyEvent)) {
                    return true;
                }
                return keyEvent.dispatch(activity, decorView != null ? decorView.getKeyDispatcherState() : null, activity);
            }
            if (callback instanceof Dialog) {
                Dialog dialog = (Dialog) callback;
                if (!o) {
                    try {
                        Field declaredField = Dialog.class.getDeclaredField("mOnKeyListener");
                        p = declaredField;
                        declaredField.setAccessible(true);
                    } catch (NoSuchFieldException unused3) {
                    }
                    o = true;
                }
                Field field = p;
                if (field != null) {
                    try {
                        onKeyListener = (DialogInterface.OnKeyListener) field.get(dialog);
                    } catch (IllegalAccessException unused4) {
                        onKeyListener = null;
                    }
                } else {
                    onKeyListener = null;
                }
                if (onKeyListener != null && onKeyListener.onKey(dialog, keyEvent.getKeyCode(), keyEvent)) {
                    return true;
                }
                Window window2 = dialog.getWindow();
                if (window2.superDispatchKeyEvent(keyEvent)) {
                    return true;
                }
                View decorView2 = window2.getDecorView();
                if (ute.c(decorView2, keyEvent)) {
                    return true;
                }
                return keyEvent.dispatch(dialog, decorView2 != null ? decorView2.getKeyDispatcherState() : null, dialog);
            }
            if ((view != null && ute.c(view, keyEvent)) || ik6Var.superDispatchKeyEvent(keyEvent)) {
                return true;
            }
        }
        return false;
    }

    public static final void V(zl3 zl3Var, of5 of5Var) {
        of5Var.c(zl3Var.b0().x(), (of5) zl3Var.b0().c);
    }

    public static final Drawable W(Context context, int i2) {
        Drawable drawableE = guc.E(context, i2);
        if (drawableE != null) {
            return drawableE;
        }
        lg8.i(b09.w(i2, "Invalid resource ID: "));
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object X(java.util.List r5, defpackage.p92 r6) {
        /*
            boolean r0 = r6 instanceof defpackage.pl0
            if (r0 == 0) goto L13
            r0 = r6
            pl0 r0 = (defpackage.pl0) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            pl0 r0 = new pl0
            r0.<init>(r6)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            int r5 = r0.c
            java.util.Iterator r2 = r0.b
            java.util.Iterator r2 = (java.util.Iterator) r2
            defpackage.br7.v(r6)
            goto L3e
        L2d:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L34:
            defpackage.br7.v(r6)
            java.util.Iterator r5 = r5.iterator()
            r6 = 0
            r2 = r5
            r5 = r6
        L3e:
            boolean r6 = r2.hasNext()
            if (r6 == 0) goto L5a
            java.lang.Object r6 = r2.next()
            va6 r6 = (defpackage.va6) r6
            r4 = r2
            java.util.Iterator r4 = (java.util.Iterator) r4
            r0.b = r4
            r0.c = r5
            r0.e = r3
            java.lang.Object r6 = r6.z0(r0)
            if (r6 != r1) goto L3e
            return r1
        L5a:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.X(java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:17:0x0054 -> B:19:0x0057). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object Y(defpackage.va6[] r6, defpackage.p92 r7) {
        /*
            boolean r0 = r7 instanceof defpackage.ol0
            if (r0 == 0) goto L13
            r0 = r7
            ol0 r0 = (defpackage.ol0) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            ol0 r0 = new ol0
            r0.<init>(r7)
        L18:
            java.lang.Object r7 = r0.f
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 1
            if (r2 == 0) goto L39
            if (r2 != r3) goto L32
            int r6 = r0.e
            int r2 = r0.d
            int r4 = r0.c
            java.lang.Object[] r5 = r0.b
            va6[] r5 = (defpackage.va6[]) r5
            defpackage.br7.v(r7)
            r7 = r5
            goto L57
        L32:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            r6 = 0
            return r6
        L39:
            defpackage.br7.v(r7)
            int r7 = r6.length
            r2 = 0
            r4 = r7
            r7 = r6
            r6 = r4
            r4 = r2
        L42:
            if (r2 >= r6) goto L59
            r5 = r7[r2]
            r0.b = r7
            r0.c = r4
            r0.d = r2
            r0.e = r6
            r0.g = r3
            java.lang.Object r5 = r5.z0(r0)
            if (r5 != r1) goto L57
            return r1
        L57:
            int r2 = r2 + r3
            goto L42
        L59:
            c1e r6 = defpackage.c1e.a
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.Y(va6[], p92):java.lang.Object");
    }

    public static Object Z(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() != 0) {
            return creator.createFromParcel(parcel);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:60:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.eh r22, defpackage.nhc r23, defpackage.wg r24, defpackage.obe r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 261
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.a(eh, nhc, wg, obe, r28, x12, int, int):void");
    }

    public static final ub7 a0(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Z(2024497114);
        p65Var.Z(-610207850);
        Object objM = p65Var.M();
        if (objM == w12.a) {
            objM = new ub7();
            p65Var.j0(objM);
        }
        ub7 ub7Var = (ub7) objM;
        p65Var.p(false);
        p65Var.p(false);
        return ub7Var;
    }

    public static final void b(String str, int i2, zg7 zg7Var, r28 r28Var, gh ghVar, x12 x12Var, int i3) {
        gh ghVar2;
        int i4;
        gh ghVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1564611574);
        int i5 = 4;
        int i6 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(zg7Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i6 & 1, (i6 & 9363) != 9362)) {
            p65Var.U();
            int i7 = i3 & 1;
            uob uobVar = w12.a;
            if (i7 == 0 || p65Var.z()) {
                boolean z = ((i6 & 14) == 4) | ((i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ne(str, i2, i5);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i4 = i6 & (-57345);
                    ghVar3 = (gh) to7.z(n1b.a.b(gh.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i4 = i6 & (-57345);
                ghVar3 = ghVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ghVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i8 = i4 & 896;
            boolean zF = (i8 == 256) | p65Var.f(ghVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new xg(ghVar3, zg7Var);
                p65Var.j0(objM2);
            }
            xg xgVar = (xg) objM2;
            boolean zF2 = p65Var.f(ghVar3) | (i8 == 256);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new wg(ghVar3, zg7Var);
                p65Var.j0(objM3);
            }
            a((eh) l78VarZ.getValue(), nhcVarF, (wg) objM3, xgVar, r28Var, p65Var, (i4 << 3) & 57344, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(ghVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(xgVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                ra raVar = new ra(ghVar3, nhcVarF, resources, xgVar, null, 10);
                p65Var.j0(raVar);
                objM4 = raVar;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            ghVar2 = ghVar3;
        } else {
            p65Var.S();
            ghVar2 = ghVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(str, i2, zg7Var, r28Var, ghVar2, i3, 5);
        }
    }

    public static final void b0(x51 x51Var, n92 n92Var, boolean z) {
        Object objR = x51Var.r();
        Throwable thE = x51Var.e(objR);
        Object ajbVar = thE != null ? new ajb(thE) : x51Var.f(objR);
        if (!z) {
            n92Var.resumeWith(ajbVar);
            return;
        }
        n92Var.getClass();
        rg3 rg3Var = (rg3) n92Var;
        p92 p92Var = rg3Var.e;
        Object obj = rg3Var.g;
        ib2 context = p92Var.getContext();
        Object objF0 = gx1.f0(context, obj);
        uzd uzdVarA0 = objF0 != gx1.o ? guc.a0(p92Var, context, objF0) : null;
        try {
            p92Var.resumeWith(ajbVar);
            if (uzdVarA0 == null || uzdVarA0.m0()) {
                gx1.Z(context, objF0);
            }
        } catch (Throwable th) {
            if (uzdVarA0 == null || uzdVarA0.m0()) {
                gx1.Z(context, objF0);
            }
            throw th;
        }
    }

    public static final void c(ch chVar, wg wgVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(259191292);
        int i3 = i2 | (p65Var.f(chVar) ? 4 : 2) | (p65Var.f(wgVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
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
            b24 b24Var = chVar.a;
            r28 r28VarA = iy0.a.a(o28Var, ar0Var);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                vf vfVar = new vf(0, wgVar, wg.class, "refresh", "refresh()V", 0, 7);
                p65Var.j0(vfVar);
                objM = vfVar;
            }
            iq7.a(b24Var, r28VarA, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 12, chVar, wgVar, r28Var);
        }
    }

    public static final o46 c0(zwa zwaVar) {
        return new o46(Math.round(zwaVar.a), Math.round(zwaVar.b), Math.round(zwaVar.c), Math.round(zwaVar.d));
    }

    public static final void d(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1970745241);
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
            p65Var.Y(-814423501);
            for (int i7 = 0; i7 < 10; i7++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 5);
        }
    }

    public static void d0(RuntimeException runtimeException, String str) {
        StackTraceElement[] stackTrace = runtimeException.getStackTrace();
        int length = stackTrace.length;
        int i2 = -1;
        for (int i3 = 0; i3 < length; i3++) {
            if (str.equals(stackTrace[i3].getClassName())) {
                i2 = i3;
            }
        }
        runtimeException.setStackTrace((StackTraceElement[]) Arrays.copyOfRange(stackTrace, i2 + 1, length));
    }

    public static xw e(float f2, float f3, int i2) {
        if ((i2 & 2) != 0) {
            f3 = 0.0f;
        }
        return new xw(d46.i, Float.valueOf(f2), new zw(f3), Long.MIN_VALUE, Long.MIN_VALUE, false);
    }

    public static void e0(Context context, z6f z6fVar, Intent intent) {
        synchronized (i) {
            try {
                if (j == null) {
                    zwe zweVar = new zwe(context, "wake:com.google.firebase.iid.WakeLockHolder");
                    j = zweVar;
                    zweVar.d(true);
                }
                boolean booleanExtra = intent.getBooleanExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", false);
                intent.putExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", true);
                if (!booleanExtra) {
                    j.a(60000L);
                }
                z6fVar.b(intent).a(new o19(13, intent));
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:162:0x02d1  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x02db  */
    /* JADX WARN: Removed duplicated region for block: B:167:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x00f8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.m45 r29, defpackage.r28 r30, boolean r31, defpackage.qb8 r32, defpackage.m3c r33, defpackage.cu0 r34, defpackage.ay2 r35, defpackage.hy8 r36, defpackage.mz1 r37, defpackage.x12 r38, int r39, int r40) {
        /*
            Method dump skipped, instruction units count: 758
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.f(m45, r28, boolean, qb8, m3c, cu0, ay2, hy8, mz1, x12, int, int):void");
    }

    public static ComponentName f0(Context context, Intent intent) {
        synchronized (i) {
            try {
                if (j == null) {
                    zwe zweVar = new zwe(context, "wake:com.google.firebase.iid.WakeLockHolder");
                    j = zweVar;
                    zweVar.d(true);
                }
                boolean booleanExtra = intent.getBooleanExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", false);
                intent.putExtra("com.google.firebase.iid.WakeLockHolder.wakefulintent", true);
                ComponentName componentNameStartService = context.startService(intent);
                if (componentNameStartService == null) {
                    return null;
                }
                if (!booleanExtra) {
                    j.a(60000L);
                }
                return componentNameStartService;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static final void g(final tf1 tf1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        int i3;
        String strD = tf1Var.f;
        int i4 = tf1Var.g;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-865981737);
        int i5 = (p65Var.f(tf1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i5 & 1, (i5 & 19) != 18)) {
            String str = tf1Var.d;
            boolean z = tf1Var.a;
            kx kxVarW = ho2.w(p65Var, 1015218577);
            String strA = af1.a(tf1Var.h, p65Var);
            if (i4 == 1) {
                p65Var.Y(1595558088);
                p65Var.p(false);
                i3 = 1;
            } else {
                i3 = 1;
                p65Var.Y(1595559552);
                int i6 = i4 - 1;
                strD = vo7.D(R.plurals.notification_rollup_plus, i6, new Object[]{strD, Integer.valueOf(i6)}, p65Var);
                p65Var.p(false);
            }
            Object[] objArr = new Object[2];
            objArr[0] = strD;
            objArr[i3] = strA;
            String strQ = vo7.Q(R.string.notification_type_post_recommended, objArr, p65Var);
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
                long j2 = tf1Var.b;
                Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
                int i7 = i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i8 = i5 & 14;
                int i9 = (i7 == 32 ? i3 : 0) | (i8 == 4 ? i3 : 0);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (i9 != 0 || objM == uobVar) {
                    objM = new m45() { // from class: uf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i10 = i;
                            c1e c1eVar = c1e.a;
                            tf1 tf1Var2 = tf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i10) {
                                case 0:
                                    ek8Var2.n(tf1Var2.c, tf1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(tf1Var2.e, tf1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i10 = (i7 == 32 ? i3 : 0) | (i8 == 4 ? i3 : 0);
                Object objM2 = p65Var.M();
                if (i10 != 0 || objM2 == uobVar) {
                    final int i11 = i3;
                    objM2 = new m45() { // from class: uf1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i102 = i11;
                            c1e c1eVar = c1e.a;
                            tf1 tf1Var2 = tf1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i102) {
                                case 0:
                                    ek8Var2.n(tf1Var2.c, tf1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(tf1Var2.e, tf1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str, numValueOf, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 0, 32);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(tf1Var, ek8Var, i2, 28);
        }
    }

    public static void g0(String str) {
        UninitializedPropertyAccessException uninitializedPropertyAccessException = new UninitializedPropertyAccessException(ev6.x("lateinit property ", str, " has not been initialized"));
        d0(uninitializedPropertyAccessException, g76.class.getName());
        throw uninitializedPropertyAccessException;
    }

    public static final void h(bh bhVar, wg wgVar, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        wg wgVar2 = wgVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(159720266);
        int i3 = i2 | (p65Var.f(bhVar) ? 4 : 2) | (p65Var.f(wgVar2) ? 32 : 16) | (p65Var.f(obeVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z = bhVar.b;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i4 == 32;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                vf vfVar = new vf(0, wgVar, wg.class, "refresh", "refresh()V", 0, 8);
                p65Var.j0(vfVar);
                objM = vfVar;
            } else {
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1704843516, new fd3(kv6VarA, (Object) bhVar, (Object) obeVar, (Object) wgVar, 17), p65Var), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i4 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                wgVar2 = wgVar;
                objM2 = new z8(wgVar2, null, 6);
                p65Var.j0(objM2);
            } else {
                wgVar2 = wgVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 5, bhVar, wgVar2, obeVar, r28Var);
        }
    }

    /* JADX WARN: Path cross not found for [B:30:0x0086, B:24:0x0070], limit reached: 43 */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:40:0x00dc -> B:41:0x00e4). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object h0(defpackage.xy3 r11, defpackage.rx5 r12, defpackage.ew8 r13, defpackage.z46 r14, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.h0(xy3, rx5, ew8, z46, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r15v1 */
    /* JADX WARN: Type inference failed for: r15v2, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r15v3 */
    public static final void i(jw4 jw4Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var;
        long j2;
        float f2;
        ?? r15;
        p65 p65Var2;
        long j3;
        jw4 jw4Var2 = jw4Var;
        boolean z = jw4Var2.d;
        m45Var.getClass();
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-2038321177);
        int i3 = i2 | (p65Var3.f(jw4Var2) ? 4 : 2) | (p65Var3.h(m45Var) ? 32 : 16) | 384;
        if (p65Var3.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            float f3 = 4.0f;
            r28 r28VarN = bgf.N(w2g.G(hlg.r(r40.y(jfc.p(o28Var, 72.0f), bmb.a(4.0f)), false, null, new vkb(0), m45Var, 11), 0.0f, 0.0f, 0.0f, 4.0f, 7), "writer_" + jw4Var2.a);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j4 = p65Var3.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarN);
            r12.W.getClass();
            m45 m45Var2 = q12.b;
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var2);
            } else {
                p65Var3.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var3, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var3, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            r28 r28VarL = jfc.l(o28Var, 72.0f);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j5 = p65Var3.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var3.l();
            r28 r28VarR2 = gx1.R(p65Var3, r28VarL);
            p65Var3.c0();
            if (p65Var3.S) {
                p65Var3.k(m45Var2);
            } else {
                p65Var3.m0();
            }
            tp7.B(p65Var3, cuVar, zk7VarC);
            tp7.B(p65Var3, cuVar2, i89VarL2);
            ka1.z(i5, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR2);
            amb ambVar = bmb.a;
            r28 r28VarC = w2g.C(jfc.l(o28Var, 72.0f), 3.0f);
            if (z) {
                p65Var3.Y(-1610055623);
                j2 = ((zo7) p65Var3.j(kt7.b)).y;
                p65Var3.p(false);
            } else {
                p65Var3.Y(-1610054546);
                p65Var3.p(false);
                j2 = uu1.g;
            }
            r28 r28VarB = bo.B(w2g.C(bo.B(r28VarC, 1.0f, j2, ambVar), 5.0f), 1.0f, gsa.b0(p65Var3), ambVar);
            if (((Boolean) p65Var3.j(l36.a)).booleanValue()) {
                jw4Var2 = jw4Var;
                f2 = 3.0f;
                r15 = 0;
                p65Var3.Y(1628595807);
                w2g.e(vn7.J(R.drawable.avatar_fallback, 0, p65Var3), null, r28VarB, null, null, 0.0f, null, p65Var3, 56, 120);
                p65Var3.p(false);
                p65Var2 = p65Var3;
            } else {
                p65Var3.Y(1628244639);
                nx5 nx5Var = new nx5((Context) p65Var3.j(eo.b));
                String str = jw4Var.c;
                nx5Var.c = str != null ? new ax5(str) : null;
                hlg.W(nx5Var);
                rx5 rx5VarA = nx5Var.a();
                r15 = 0;
                f2 = 3.0f;
                jw4Var2 = jw4Var;
                ur7.a(rx5VarA, null, r28VarB, null, null, 0.0f, null, 0, p65Var3, 48, 2040);
                p65 p65Var4 = p65Var3;
                p65Var4.p(false);
                p65Var2 = p65Var4;
            }
            if (!jw4Var2.e || z) {
                p65Var2.Y(1625349983);
            } else {
                p65Var2.Y(1628889749);
                f3 = 4.0f;
                r28 r28VarL2 = jfc.l(w2g.G(iy0.a.a(o28Var, z46.f), 0.0f, 2.0f, 4.0f, 0.0f, 9), 18.0f);
                sn3 sn3Var = kt7.b;
                dy0.a(flb.a0(w2g.C(flb.a0(r28VarL2, ((zo7) p65Var2.j(sn3Var)).a, ambVar), 6.0f), ((zo7) p65Var2.j(sn3Var)).r, ambVar), p65Var2, r15);
            }
            p65Var2.p(r15);
            p65Var2.p(true);
            String strW = jw4Var2.b;
            if (strW == null) {
                strW = km4.w(p65Var2, 332459977, R.string.common_unknown_user, p65Var2, r15);
            } else {
                p65Var2.Y(332459481);
                p65Var2.p(r15);
            }
            String str2 = strW;
            if (z) {
                p65Var2.Y(1716425633);
                j3 = rz5.A(p65Var2).n;
                p65Var2.p(r15);
            } else {
                p65Var2.Y(1716499103);
                j3 = rz5.A(p65Var2).o;
                p65Var2.p(r15);
            }
            float f4 = f2;
            p65 p65Var5 = p65Var2;
            jjd.b(str2, jfc.d(w2g.G(o28Var, f4, f3, f2, 0.0f, 8), 1.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 2, false, 1, 0, null, mkd.a(rz5.D(p65Var2).o, j3, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var5, 48, 24960, 109564);
            p65 p65Var6 = p65Var5;
            p65Var6.p(true);
            r28Var2 = o28Var;
            p65Var = p65Var6;
        } else {
            p65Var3.S();
            r28Var2 = r28Var;
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 22, jw4Var2, m45Var, r28Var2);
        }
    }

    public static final int i0(cv6 cv6Var) {
        List list = cv6Var.k;
        if (list.isEmpty()) {
            return 0;
        }
        int size = list.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            i2 += ((dv6) list.get(i3)).p;
        }
        return (i2 / list.size()) + cv6Var.q;
    }

    public static final void j(int i2, int i3, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1545930067);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i4 = (p65Var.f(r28Var2) ? 4 : 2) | i2;
        }
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28Var3 = i5 != 0 ? o28Var : r28Var2;
            r28 r28VarG = w2g.G(jfc.p(r28Var3, 72.0f), 0.0f, 0.0f, 0.0f, 4.0f, 7);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            dy0.a(flb.a0(w2g.C(jfc.l(o28Var, 72.0f), 8.0f), ((zo7) p65Var.j(kt7.b)).c, bmb.a), p65Var, 0);
            ok7.r(56.0f, 48, 8, 0L, p65Var, w2g.G(new dr5(z46.q), 3.0f, 4.0f, 3.0f, 0.0f, 8), ((bu7) p65Var.j(jt7.c)).o);
            p65Var.p(true);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var2, i2, i3, 7);
        }
    }

    public static final void k(int i2, kl5 kl5Var, sl5 sl5Var, r28 r28Var, x12 x12Var, int i3) {
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-231443525);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.d(i2) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.f(kl5Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.f(sl5Var) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i4 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(w2g.F(r28Var, 24.0f, i2 > 0 ? 10.0f : 24.0f, 24.0f, 10.0f), 1.0f);
            boolean z = ((i4 & 896) == 256) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new gd3(sl5Var, 26, kl5Var);
                p65Var.j0(objM);
            }
            no7.b(r28VarD, 0L, null, (m45) objM, false, pxf.E(-94218952, new l23(23, kl5Var), p65Var), p65Var, 1572864, 46);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new oc0(i2, kl5Var, sl5Var, r28Var, i3);
        }
    }

    public static final void l(int i2, int i3, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(644378326);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i4 = (p65Var.f(r28Var2) ? 4 : 2) | i2;
        }
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            r28Var3 = i5 != 0 ? o28.b : r28Var2;
            final long j2 = ((zo7) p65Var.j(kt7.b)).o;
            final amb ambVarA = bmb.a(2.0f);
            final oya oyaVar = new oya();
            final oya oyaVar2 = new oya();
            final oya oyaVar3 = new oya();
            p65Var.Y(772288467);
            m73 m73Var = (m73) p65Var.j(z22.h);
            sn3 sn3Var = jt7.c;
            oyaVar.a = m73Var.z(((bu7) p65Var.j(sn3Var)).t.a.b);
            oyaVar2.a = m73Var.z(((bu7) p65Var.j(sn3Var)).t.b.c) - oyaVar.a;
            oyaVar3.a = m73Var.z(((bu7) p65Var.j(sn3Var)).o.b.c);
            p65Var.p(false);
            no7.b(jfc.d(r28Var3, 1.0f), 0L, null, null, false, pxf.E(-932490925, new b55() { // from class: ql5
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    x12 x12Var2 = (x12) obj;
                    int iIntValue = ((Integer) obj2).intValue();
                    p65 p65Var2 = (p65) x12Var2;
                    if (p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                        o28 o28Var = o28.b;
                        r28 r28VarD = jfc.d(w2g.C(o28Var, 16.0f), 1.0f);
                        wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                        long j3 = p65Var2.T;
                        int i6 = (int) (j3 ^ (j3 >>> 32));
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
                        tp7.B(p65Var2, q12.f, wv1VarA);
                        tp7.B(p65Var2, q12.e, i89VarL);
                        tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
                        tp7.y(p65Var2, q12.h);
                        tp7.B(p65Var2, q12.d, r28VarR);
                        oya oyaVar4 = oyaVar2;
                        r28 r28VarD2 = jfc.d(w2g.G(o28Var, 0.0f, oyaVar4.a, 0.0f, 0.0f, 13), 1.0f);
                        oya oyaVar5 = oyaVar;
                        r28 r28VarE = jfc.e(r28VarD2, oyaVar5.a);
                        long j4 = j2;
                        amb ambVar = ambVarA;
                        dy0.a(flb.a0(r28VarE, j4, ambVar), p65Var2, 0);
                        dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 0.0f, oyaVar4.a, 0.0f, 0.0f, 13), 1.0f), oyaVar5.a), j4, ambVar), p65Var2, 0);
                        dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 0.0f, oyaVar4.a, 0.0f, 0.0f, 13), 0.3f), oyaVar5.a), j4, ambVar), p65Var2, 0);
                        dy0.a(flb.a0(jfc.e(jfc.d(w2g.G(o28Var, 0.0f, 10.0f, 0.0f, 0.0f, 13), 0.5f), oyaVar3.a), j4, ambVar), p65Var2, 0);
                        p65Var2.p(true);
                    } else {
                        p65Var2.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, 1572864, 62);
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var3, i2, i3, 11);
        }
    }

    public static final void m(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1288293503);
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
            qv5.b(vn7.J(R.drawable.empty_state, 0, p65Var), "", ka1.i(z46.q, w2g.G(o28Var, 0.0f, 50.0f, 0.0f, 0.0f, 13)), ((zo7) p65Var.j(kt7.b)).n, p65Var, 56, 0);
            jjd.b(vo7.R(p65Var, R.string.empty_state_highlighted), w2g.C(jfc.d(o28Var, 1.0f), 16.0f), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 48, 0, 130044);
            p65Var = p65Var;
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 6);
        }
    }

    public static final void n(xl5 xl5Var, sl5 sl5Var, r28 r28Var, x12 x12Var, int i2) {
        xl5 xl5Var2 = xl5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1636604018);
        int i3 = i2 | (p65Var.f(xl5Var2) ? 4 : 2) | (p65Var.f(sl5Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            xl5Var2 = xl5Var;
            b24 b24Var = xl5Var2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ek5 ek5Var = new ek5(0, sl5Var, sl5.class, "refresh", "refresh()V", 0, 1);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            }
            iq7.a(b24Var, jfc.c, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 28, xl5Var2, sl5Var, r28Var);
        }
    }

    public static final void o(yl5 yl5Var, kv6 kv6Var, sl5 sl5Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        sl5 sl5Var2;
        Object ek5Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1180719583);
        int i3 = i2 | (p65Var2.f(yl5Var) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(sl5Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = yl5Var.c;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                ek5Var = new ek5(0, sl5Var, sl5.class, "refresh", "refresh()V", 0, 2);
                sl5Var2 = sl5Var;
                p65Var2.j0(ek5Var);
            } else {
                ek5Var = objM;
                sl5Var2 = sl5Var;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) ek5Var), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-634473583, new nh(kv6Var, yl5Var, sl5Var2, 3), p65Var2), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            sl5Var2 = sl5Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 10, r28Var, (Object) yl5Var, (Object) kv6Var, (Object) sl5Var2);
        }
    }

    public static final void p(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-302674894);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            float f2 = 24.0f;
            r28 r28VarV = m40.V(w2g.G(r28Var, 0.0f, 24.0f, 0.0f, 0.0f, 13).b(jfc.c), p65Var, 0);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            p65Var.Y(-1322326472);
            int iR = 0;
            while (iR < 8) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> 32));
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
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                float f3 = f2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> 32));
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
                l(0, 0, p65Var, w2g.G(o28Var, f3, iR > 0 ? 20.0f : 0.0f, f3, 0.0f, 8));
                iR = wgd.r(p65Var, true, true, iR, 1);
                z = true;
                f2 = f3;
            }
            p65Var.p(false);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:53:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void q(defpackage.am5 r21, defpackage.kv6 r22, defpackage.sl5 r23, defpackage.r28 r24, defpackage.x12 r25, int r26, int r27) {
        /*
            Method dump skipped, instruction units count: 219
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.q(am5, kv6, sl5, r28, x12, int, int):void");
    }

    public static final void r(uef uefVar, bo4 bo4Var, r28 r28Var, x12 x12Var, int i2) {
        uefVar.getClass();
        bo4Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(464921892);
        int i3 = i2 | (p65Var.f(uefVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            wue wueVarA = e67.a(p65Var);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            dm5 dm5Var = (dm5) to7.z(n1b.a.b(dm5.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? ((pi5) wueVarA).getDefaultViewModelCreationExtras() : og2.b, p65Var);
            l78 l78VarZ = guc.z(dm5Var.e, p65Var, 0);
            kv6 kv6VarA = pv6.a(p65Var);
            q((am5) l78VarZ.getValue(), kv6VarA, new sl5(dm5Var, uefVar), r28Var, p65Var, 3072, 0);
            boolean zF = p65Var.f(kv6VarA) | p65Var.h(dm5Var);
            Object objM = p65Var.M();
            n92 n92Var = null;
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new xs3(kv6VarA, dm5Var, n92Var, 14);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, kv6VarA);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new wi1(bo4Var, kv6VarA, n92Var, 5);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 29, uefVar, bo4Var, r28Var);
        }
    }

    public static final o46 s(long j2, long j3) {
        int i2 = (int) (j2 >> 32);
        int i3 = (int) (j2 & 4294967295L);
        return new o46(i2, i3, ((int) (j3 >> 32)) + i2, ((int) (j3 & 4294967295L)) + i3);
    }

    public static final void t(ija ijaVar, ip7 ip7Var, qia qiaVar, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        uob uobVar;
        int i3;
        qia qiaVar2 = qiaVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1860011703);
        int i4 = i2 | (p65Var.f(ijaVar) ? 4 : 2) | (p65Var.d(ip7Var.ordinal()) ? 32 : 16) | (p65Var.f(qiaVar2) ? 256 : 128) | (p65Var.f(md3Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            kv6 kv6VarA = pv6.a(p65Var);
            boolean z = ijaVar.c;
            int i5 = i4 & 896;
            boolean z2 = i5 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z2 || objM == uobVar2) {
                uobVar = uobVar2;
                i3 = i5;
                c9a c9aVar = new c9a(0, qiaVar2, qia.class, "onRefresh", "onRefresh()V", 0, 14);
                p65Var.j0(c9aVar);
                objM = c9aVar;
            } else {
                i3 = i5;
                uobVar = uobVar2;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-651599365, new g91(kv6VarA, (Object) ijaVar, (Object) md3Var, (Object) qiaVar, (Object) ip7Var, 20), p65Var), p65Var, (i4 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z3 = i3 == 256;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                qiaVar2 = qiaVar;
                objM2 = new lo5(qiaVar2, null, 24);
                p65Var.j0(objM2);
            } else {
                qiaVar2 = qiaVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98(ijaVar, ip7Var, qiaVar2, md3Var, r28Var, i2, 17);
        }
    }

    public static final void u(jja jjaVar, qia qiaVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        jja jjaVar2 = jjaVar;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2127604721);
        int i3 = i2 | (p65Var2.f(jjaVar2) ? 4 : 2) | (p65Var2.f(qiaVar) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD2);
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
            String strR = vo7.R(p65Var2, R.string.publication_home_empty_title);
            String strR2 = vo7.R(p65Var2, R.string.publication_home_empty_action);
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                jjaVar2 = jjaVar;
                objM = new ui9(qiaVar, 15, jjaVar2);
                p65Var2.j0(objM);
            } else {
                jjaVar2 = jjaVar;
            }
            gq7.a(null, null, strR, null, 0L, null, null, strR2, (m45) objM, 0.0f, 0.0f, p65Var2, 0, 0, 1659);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 15, jjaVar2, qiaVar, r28Var);
        }
    }

    public static final void v(kja kjaVar, qia qiaVar, r28 r28Var, x12 x12Var, int i2) {
        kja kjaVar2 = kjaVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1931641319);
        int i3 = i2 | (p65Var.f(kjaVar2) ? 4 : 2) | (p65Var.f(qiaVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarD = jfc.d(jfc.r(r28Var, 3), 1.0f);
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
            r28 r28VarD2 = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
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
            rh4 rh4Var = jfc.c;
            kjaVar2 = kjaVar;
            b24 b24Var = kjaVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                c9a c9aVar = new c9a(0, qiaVar, qia.class, "onRefresh", "onRefresh()V", 0, 15);
                p65Var.j0(c9aVar);
                objM = c9aVar;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 16, kjaVar2, qiaVar, r28Var);
        }
    }

    public static final void w(int i2, int i3, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        int i4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(137646257);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
            r28Var2 = r28Var;
        } else {
            r28Var2 = r28Var;
            i4 = (p65Var.f(r28Var2) ? 4 : 2) | i2;
        }
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28Var4 = i5 != 0 ? o28Var : r28Var2;
            r28 r28VarD = jfc.d(jfc.r(r28Var4, 3), 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 728.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            qk7.j(null, p65Var, 0);
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            p65Var.Y(-1657398964);
            int i9 = 0;
            while (i9 < 10) {
                r28 r28Var5 = r28Var4;
                stc stcVar2 = stcVar;
                il7.l(stcVar2, null, 0L, null, p65Var, 0, 14);
                i9++;
                stcVar = stcVar2;
                r28Var4 = r28Var5;
            }
            r28Var3 = r28Var4;
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
            r28Var3 = r28Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var3, i2, i3, 12);
        }
    }

    public static final void x(mja mjaVar, nhc nhcVar, qia qiaVar, md3 md3Var, r28 r28Var, x12 x12Var, int i2) {
        mja mjaVar2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2007130697);
        if ((i2 & 6) == 0) {
            mjaVar2 = mjaVar;
            i3 = (p65Var.f(mjaVar2) ? 4 : 2) | i2;
        } else {
            mjaVar2 = mjaVar;
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= (i2 & 512) == 0 ? p65Var.f(qiaVar) : p65Var.h(qiaVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(md3Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            ip7 ip7VarA = jp7.a(p65Var);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new mr9(27);
                p65Var.j0(objM);
            }
            pr7.b(wxb.a(r28Var, false, (x45) objM), null, null, pxf.E(-715734653, new w87(nhcVar, 12), p65Var), null, 0, 0L, 0L, qb8.p, pxf.E(-202815078, new ov2(mjaVar2, qiaVar, ip7VarA, md3Var, 17), p65Var), p65Var, 805309440, 246);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob(mjaVar, nhcVar, qiaVar, md3Var, r28Var, i2, 13);
        }
    }

    public static final void y(String str, String str2, my6 my6Var, r28 r28Var, rja rjaVar, x12 x12Var, int i2) {
        r28 r28Var2;
        rja rjaVar2;
        rja rjaVar3;
        r28 r28Var3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1549811443);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(my6Var) ? 256 : 128) | 11264;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            int i4 = i2 & 1;
            uob uobVar = w12.a;
            if (i4 == 0 || p65Var.z()) {
                boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 12);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    rjaVar3 = (rja) to7.z(n1b.a.b(rja.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                rjaVar3 = rjaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(rjaVar3.h, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            qia qiaVar = new qia(rjaVar3, my6Var);
            md3 md3Var = new md3(my6Var, 6, rjaVar3);
            x((mja) l78VarZ.getValue(), nhcVarF, qiaVar, md3Var, r28Var3, p65Var, 24576);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(rjaVar3) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(md3Var);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                zo5 zo5Var = new zo5(rjaVar3, nhcVarF, resources, md3Var, null, 26);
                p65Var.j0(zo5Var);
                objM2 = zo5Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = r28Var3;
            rjaVar2 = rjaVar3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            rjaVar2 = rjaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) my6Var, r28Var2, (que) rjaVar2, i2, 16);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:49:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void z(defpackage.nxc r20, defpackage.gxc r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g76.z(nxc, gxc, r28, x12, int, int):void");
    }
}
