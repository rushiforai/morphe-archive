package defpackage;

import android.R;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.LinearGradient;
import android.os.Build;
import android.provider.ContactsContract;
import android.util.Log;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.facebook.AuthenticationTokenManager$CurrentAuthenticationTokenChangedBroadcastReceiver;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.data.settings.Frequency;
import gen.model.SourceParameter;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Provider;
import java.security.Security;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class n01 implements y92 {
    public static final int[] b = {R.attr.name, R.attr.tint, R.attr.height, R.attr.width, R.attr.alpha, R.attr.autoMirrored, R.attr.tintMode, R.attr.viewportWidth, R.attr.viewportHeight};
    public static final int[] c = {R.attr.name, R.attr.pivotX, R.attr.pivotY, R.attr.scaleX, R.attr.scaleY, R.attr.rotation, R.attr.translateX, R.attr.translateY};
    public static final int[] d = {R.attr.name, R.attr.fillColor, R.attr.pathData, R.attr.strokeColor, R.attr.strokeWidth, R.attr.trimPathStart, R.attr.trimPathEnd, R.attr.trimPathOffset, R.attr.strokeLineCap, R.attr.strokeLineJoin, R.attr.strokeMiterLimit, R.attr.strokeAlpha, R.attr.fillAlpha, R.attr.fillType};
    public static final int[] e = {R.attr.name, R.attr.pathData};
    public static final mz1 f = new mz1(new e02(15), false, -484136878);
    public static final mz1 g = new mz1(new e02(16), false, -1173968368);
    public static final mz1 h = new mz1(new p02(9), false, -1226624533);
    public static final mz1 i = new mz1(new p02(10), false, -1571540278);
    public static final mz1 j = new mz1(new a02(24), false, -135525896);
    public static final mz1 k = new mz1(new m02(5), false, 638831989);
    public static final Object l = new Object();
    public static final hpe m = new hpe(21);
    public static final cld n = new cld(0, new long[0], new Object[0]);
    public static final String[] o = {"GmsCore_OpenSSL", "AndroidOpenSSL", "Conscrypt"};
    public static final /* synthetic */ int p = 0;
    public static final /* synthetic */ int q = 0;
    public final /* synthetic */ int a;

    public /* synthetic */ n01(int i2) {
        this.a = i2;
    }

    public static final void A(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(427849897);
        int i3 = (i2 & 6) == 0 ? (p65Var.f(r28Var) ? 4 : 2) | i2 : i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarB = r28Var.b(jfc.c);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new cq4(10);
                p65Var.j0(objM);
            }
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(wxb.a(r28VarB, false, (x45) objM), "following_screen"), 3, 1.0f);
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
            p65Var.Y(-1828162008);
            for (int i7 = 0; i7 < 8; i7++) {
                tr7.g(0, 1, p65Var, null);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 9);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void C(defpackage.nza r13, defpackage.zx4 r14, defpackage.obe r15, defpackage.cs1 r16, defpackage.e9d r17, defpackage.r28 r18, defpackage.x12 r19, int r20, int r21) {
        /*
            Method dump skipped, instruction units count: 260
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.C(nza, zx4, obe, cs1, e9d, r28, x12, int, int):void");
    }

    public static final void D(String str, uza uzaVar, nhc nhcVar, r28 r28Var, sza szaVar, x12 x12Var, int i2) {
        r28 r28Var2;
        sza szaVar2;
        int i3;
        sza szaVar3;
        r28 r28Var3;
        Object nzVar;
        sza szaVar4;
        str.getClass();
        nhcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1647810170);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(uzaVar) ? 32 : 16) | (p65Var.f(nhcVar) ? 256 : 128) | 11264;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 24);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                sza szaVar5 = (sza) to7.z(n1b.a.b(sza.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i3 = i4 & (-57345);
                szaVar3 = szaVar5;
                r28Var3 = o28.b;
            } else {
                p65Var.S();
                r28Var3 = r28Var;
                i3 = i4 & (-57345);
                szaVar3 = szaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(szaVar3.y, p65Var, 0);
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i6 == 32) | p65Var.f(szaVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new cy4(szaVar3, uzaVar);
                p65Var.j0(objM2);
            }
            cy4 cy4Var = (cy4) objM2;
            boolean zF2 = (i6 == 32) | p65Var.f(szaVar3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new yx4(szaVar3, uzaVar);
                p65Var.j0(objM3);
            }
            yx4 yx4Var = (yx4) objM3;
            boolean zF3 = (i6 == 32) | p65Var.f(szaVar3);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar) {
                objM4 = new by4(szaVar3, uzaVar);
                p65Var.j0(objM4);
            }
            by4 by4Var = (by4) objM4;
            boolean zF4 = (i6 == 32) | p65Var.f(szaVar3);
            Object objM5 = p65Var.M();
            if (zF4 || objM5 == uobVar) {
                objM5 = new zx4(szaVar3, uzaVar);
                p65Var.j0(objM5);
            }
            int i7 = i3;
            C((nza) l78VarZ.getValue(), (zx4) objM5, cy4Var, yx4Var, by4Var, r28Var3, p65Var, 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = kyd.M(p65Var);
                p65Var.j0(objM6);
            }
            sb2 sb2Var = (sb2) objM6;
            boolean zH = p65Var.h(szaVar3) | ((i7 & 896) == 256) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(yx4Var) | p65Var.f(cy4Var) | p65Var.f(by4Var);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                szaVar4 = szaVar3;
                nzVar = new nz(szaVar4, nhcVar, sb2Var, resources, yx4Var, cy4Var, by4Var, null, 7);
                p65Var.j0(nzVar);
            } else {
                nzVar = objM7;
                szaVar4 = szaVar3;
            }
            kyd.k(p65Var, (b55) nzVar, c1e.a);
            r28Var2 = r28Var3;
            szaVar2 = szaVar4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            szaVar2 = szaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, uzaVar, nhcVar, r28Var2, szaVar2, i2, 22);
        }
    }

    public static final void E(Frequency frequency, az5 az5Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1904510169);
        int i3 = i2 | (p65Var.d(frequency.ordinal()) ? 4 : 2) | (p65Var.f(az5Var) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var2, 12);
                p65Var.j0(objM2);
            }
            o28 o28Var = o28.b;
            r28 r28VarD = w2g.D(hlg.r(o28Var, false, null, null, (m45) objM2, 15), 24.0f, 16.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
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
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            omb ombVarA = nmb.a(qb8.a, z46.m, p65Var, 0);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            String strR = vo7.R(p65Var, com.medium.reader.R.string.frequency);
            sq6 sq6Var = new sq6(1.0f, true);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, sq6Var, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).l, p65Var, 0, 0, 131068);
            String strA0 = a0(frequency, p65Var);
            mkd mkdVar = ((bu7) p65Var.j(sn3Var)).l;
            sn3 sn3Var2 = kt7.b;
            jjd.b(strA0, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(mkdVar, ((zo7) p65Var.j(sn3Var2)).r, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            qv5.b(vn7.J(com.medium.reader.R.drawable.ic_chevron_down_24, 0, p65Var), null, null, ((zo7) p65Var.j(sn3Var2)).r, p65Var, 56, 4);
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                l78Var = l78Var2;
                objM3 = new vs(l78Var, 13);
                p65Var.j0(objM3);
            } else {
                l78Var = l78Var2;
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(1324559852, new ov2(az5Var, frequency, x45Var, l78Var, 2), p65Var), p65Var, 48, 2044);
            p65Var.p(true);
            p65Var.p(true);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            jjd.b(vo7.R(p65Var, com.medium.reader.R.string.adjust_frequency), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(sn3Var2)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 28, frequency, az5Var, x45Var, r28Var2);
        }
    }

    public static final void F(int i2, int i3, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1472974229);
        int i4 = (p65Var.d(i2) ? 4 : 2) | i3 | 48;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).c;
            r28Var2 = o28.b;
            r28 r28VarD = w2g.D(r28Var2, 24.0f, 16.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            sq6 sq6Var = new sq6(1.0f, true);
            zk7 zk7VarC = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, sq6Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            ok7.s(0.0f, 0, 4, j2, p65Var, jfc.p(r28Var2, gq7.c(i2).c(48, 240)), ((bu7) p65Var.j(jt7.c)).l);
            p65Var.p(true);
            dy0.a(flb.a0(jfc.l(r28Var2, 24.0f), j2, rv8.r), p65Var, 0);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(i2, r28Var2, i3, 4);
        }
    }

    public static final void G(kc4 kc4Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1391195349);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(kc4Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        int i4 = i3 | 48;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var, 26);
                p65Var.j0(objM2);
            }
            mz1 mz1VarE = pxf.E(1014472380, new wb4(l78Var, i5), p65Var);
            mz1 mz1VarE2 = pxf.E(1138607058, new l23(11, kc4Var), p65Var);
            int i6 = (i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 14156160;
            r28Var = o28.b;
            ok7.b(zBooleanValue, r28Var, (m45) objM2, null, 0.0f, null, mz1VarE, mz1VarE2, p65Var, i6, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(kc4Var, r28Var, i2, 12);
        }
    }

    public static final void H(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(422282917);
        int i3 = 2;
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f2 = r1.widthPixels / context.getResources().getDisplayMetrics().density;
            oe1 oe1Var = (vj3.a(f2, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f2, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            kv6 kv6VarA = pv6.a(p65Var);
            oe1 oe1Var2 = oe1Var;
            h70 h70Var = new h70(24.0f, true, new z10(21));
            jy8 jy8VarG = w2g.g(1, 0.0f);
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, i4 & 14), "loading_state");
            boolean zD = p65Var.d(oe1Var2.ordinal());
            Object objM = p65Var.M();
            if (zD || objM == w12.a) {
                objM = new fv4(oe1Var2, i3);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, kv6VarA, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var, 24960, 488);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 10);
        }
    }

    public static final void I(ke7 ke7Var, ee7 ee7Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2117520121);
        int i3 = i2 | (p65Var.f(ke7Var) ? 4 : 2) | (p65Var.f(ee7Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "content"), 3, 1.0f);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
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
            String strR = vo7.R(p65Var, com.medium.reader.R.string.magic_link_title);
            sn3 sn3Var = jt7.c;
            jjd.b(strR, bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "title"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).F, p65Var, 48, 0, 130044);
            y30.y(o28Var, 1.0f, 24.0f, p65Var);
            jjd.b(vo7.Q(com.medium.reader.R.string.magic_link_text, new Object[]{ke7Var.a, vo7.R(p65Var, ke7Var.b == SusiOperation.LOGIN ? com.medium.reader.R.string.magic_link_text_sign_in : com.medium.reader.R.string.magic_link_text_sign_up)}, p65Var), bgf.N(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), "text"), 0L, 0L, 0L, null, new jgd(3), 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 48, 0, 130044);
            p65Var = p65Var;
            y30.y(o28Var, 1.0f, 48.0f, p65Var);
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ek5 ek5Var = new ek5(0, ee7Var, ee7.class, "onResendMagicLinkClicked", "onResendMagicLinkClicked()V", 0, 23);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            }
            fo7.i((m45) ((qh6) objM), vo7.R(p65Var, com.medium.reader.R.string.magic_link_resend), xn7.M, bgf.N(w2g.E(jfc.d(jfc.q(o28Var, 0.0f, 348.0f, 1), 1.0f), 24.0f, 0.0f, 2), "resend_button"), ke7Var.c, p65Var, 3456, 0);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 6, ke7Var, ee7Var, r28Var);
        }
    }

    public static final void J(ke7 ke7Var, nhc nhcVar, ee7 ee7Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        ke7Var.getClass();
        nhcVar.getClass();
        ee7Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(775198039);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(ke7Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nhcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(ee7Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new be7(i5);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM), "magic_link_screen"), pxf.E(151507547, new ce7(ee7Var), p65Var2), null, pxf.E(171048669, new w87(nhcVar, i4), p65Var2), null, 0, 0L, 0L, null, pxf.E(1917909990, new g64(ke7Var, 20, ee7Var), p65Var2), p65Var, 805309488, 500);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i2, 0, ke7Var, nhcVar, ee7Var, r28Var);
        }
    }

    public static final void K(final String str, final String str2, final String str3, final SusiOperation susiOperation, final SusiDestination susiDestination, final boolean z, final zm7 zm7Var, r28 r28Var, me7 me7Var, x12 x12Var, final int i2) {
        final r28 r28Var2;
        final me7 me7Var2;
        int i3;
        int i4;
        r28 r28Var3;
        str.getClass();
        str3.getClass();
        susiOperation.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1835831571);
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(str3) ? 256 : 128) | (p65Var.d(susiOperation.ordinal()) ? 2048 : 1024) | (p65Var.f(susiDestination) ? 16384 : 8192) | (p65Var.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(zm7Var) ? 1048576 : 524288) | 46137344;
        if (p65Var.P(i5 & 1, (38347923 & i5) != 38347922)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z2 = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 896) == 256) | ((57344 & i5) == 16384) | ((i5 & 7168) == 2048) | ((458752 & i5) == 131072);
                Object objM = p65Var.M();
                if (z2 || objM == uobVar) {
                    i3 = 0;
                    ex0 ex0Var = new ex0(str, susiOperation, susiDestination, str2, str3, z);
                    p65Var.j0(ex0Var);
                    objM = ex0Var;
                } else {
                    i3 = 0;
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                me7 me7Var3 = (me7) to7.z(n1b.a.b(me7.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                i4 = i5 & (-234881025);
                r28Var3 = o28.b;
                me7Var2 = me7Var3;
            } else {
                p65Var.S();
                i4 = i5 & (-234881025);
                r28Var3 = r28Var;
                me7Var2 = me7Var;
                i3 = 0;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(me7Var2.o, p65Var, i3);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = ((i4 & 3670016) != 1048576 ? i3 : 1) | (p65Var.f(me7Var2) ? 1 : 0);
            Object objM2 = p65Var.M();
            Object obj = objM2;
            if (i7 != 0 || objM2 == uobVar) {
                ee7 ee7Var = new ee7(zm7Var, me7Var2);
                p65Var.j0(ee7Var);
                obj = ee7Var;
            }
            J((ke7) l78VarZ.getValue(), nhcVarF, (ee7) obj, r28Var3, p65Var, 3072);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(me7Var2) | p65Var.f(nhcVarF) | p65Var.h(resources);
            Object objM3 = p65Var.M();
            n92 n92Var = null;
            if (zH || objM3 == uobVar) {
                mo5 mo5Var = new mo5(me7Var2, nhcVarF, resources, n92Var, 9);
                p65Var.j0(mo5Var);
                objM3 = mo5Var;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM3, c1eVar);
            boolean zH2 = p65Var.h(me7Var2);
            Object objM4 = p65Var.M();
            Object obj2 = objM4;
            if (zH2 || objM4 == uobVar) {
                lo5 lo5Var = new lo5(me7Var2, n92Var, 6);
                p65Var.j0(lo5Var);
                obj2 = lo5Var;
            }
            kyd.k(p65Var, (b55) obj2, c1eVar);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            me7Var2 = me7Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(str, str2, str3, susiOperation, susiDestination, z, zm7Var, r28Var2, me7Var2, i2) { // from class: ae7
                public final /* synthetic */ String a;
                public final /* synthetic */ String b;
                public final /* synthetic */ String c;
                public final /* synthetic */ SusiOperation d;
                public final /* synthetic */ SusiDestination e;
                public final /* synthetic */ boolean f;
                public final /* synthetic */ zm7 g;
                public final /* synthetic */ r28 h;
                public final /* synthetic */ me7 i;

                @Override // defpackage.b55
                public final Object invoke(Object obj3, Object obj4) {
                    ((Integer) obj4).getClass();
                    int iY = tr7.y(1);
                    n01.K(this.a, this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i, (x12) obj3, iY);
                    return c1e.a;
                }
            };
        }
    }

    public static final void M(m45 m45Var, boolean z, it4 it4Var, vu4 vu4Var, r28 r28Var, r28 r28Var2, x12 x12Var, int i2) {
        int i3;
        long j2;
        long j3;
        long j4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(622113179);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(m45Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.d(it4Var.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.d(vu4Var.ordinal()) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var.f(r28Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var.P(i3 & 1, (74899 & i3) != 74898)) {
            vu4 vu4Var2 = vu4.DEFAULT;
            if (vu4Var == vu4Var2 || z) {
                p65Var.Y(590161734);
                p65Var.p(false);
                j2 = uu1.g;
            } else {
                p65Var.Y(590201352);
                j2 = ((zo7) p65Var.j(kt7.b)).d;
                p65Var.p(false);
            }
            upc upcVarA = wec.a(j2, null, "Background color animation", p65Var, 384, 10);
            if (z) {
                p65Var.Y(850331760);
                j3 = ((zo7) p65Var.j(kt7.b)).z;
                p65Var.p(false);
            } else if (vu4Var == vu4Var2) {
                p65Var.Y(850335153);
                j3 = ((zo7) p65Var.j(kt7.b)).y;
                p65Var.p(false);
            } else {
                p65Var.Y(850336582);
                p65Var.p(false);
                j3 = uu1.g;
            }
            upc upcVarA2 = wec.a(j3, null, "Border color animation", p65Var, 384, 10);
            if (vu4Var == vu4Var2 || z) {
                p65Var.Y(590878795);
                j4 = ((zo7) p65Var.j(kt7.b)).n;
                p65Var.p(false);
            } else {
                p65Var.Y(590944298);
                j4 = ((zo7) p65Var.j(kt7.b)).p;
                p65Var.p(false);
            }
            upc upcVarA3 = wec.a(j4, null, "Content color animation", p65Var, 384, 10);
            upc upcVarA4 = zu.a(z ? 4.0f : 0.0f, null, "End padding animation", p65Var, 384, 10);
            float fD = it4Var.getContentPadding().d();
            float fA = it4Var.getContentPadding().a();
            hy8 contentPadding = it4Var.getContentPadding();
            sn3 sn3Var = z22.n;
            jy8 jy8Var = new jy8(w2g.o(contentPadding, (ip6) p65Var.j(sn3Var)), fD, w2g.n(it4Var.getContentPadding(), (ip6) p65Var.j(sn3Var)) - ((vj3) upcVarA4.getValue()).a, fA);
            r28 r28VarN = bgf.N(jfc.b(r28Var, 0.0f, 24.0f, 1), "follow_button");
            amb ambVarA = bmb.a(it4Var.m115getCornerSizeD9Ej5fM());
            cu0 cu0VarB = k40.b(1.0f, ((uu1) upcVarA2.getValue()).a);
            jy8 jy8Var2 = h11.a;
            f76.g(m45Var, r28VarN, true, ambVarA, h11.a(((uu1) upcVarA.getValue()).a, ((uu1) upcVarA3.getValue()).a, 0L, 0L, p65Var, 12), null, cu0VarB, jy8Var, pxf.E(-1896262261, new nb(it4Var, upcVarA3, z, r28Var2), p65Var), p65Var, (i3 & 14) | 805503360, 256);
            p65Var = p65Var;
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new jp0(m45Var, z, it4Var, vu4Var, r28Var, r28Var2, i2);
        }
    }

    public static final void N(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-20758445);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var, com.medium.reader.R.string.push_notification), new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            qv5.b(vn7.J(com.medium.reader.R.drawable.ic_chevron_forward, 0, p65Var), null, null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 56, 4);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 17);
        }
    }

    public static final void O(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-610255331);
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
            mwaVarS.d = new qb(str, m45Var, r28Var2, i2, 2);
        }
    }

    public static final void P(final wce wceVar, final nce nceVar, final dce dceVar, final kv6 kv6Var, final nhc nhcVar, final zbe zbeVar, final mya myaVar, final r28 r28Var, final boolean z, final float f2, x12 x12Var, final int i2) {
        int i3;
        final mya myaVar2;
        final float f3;
        p65 p65Var;
        int i4;
        int i5;
        m45 m45Var;
        zbe zbeVar2;
        int i6;
        String str;
        wceVar.getClass();
        kv6Var.getClass();
        nhcVar.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(95659725);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(wceVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(nceVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(dceVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(kv6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(nhcVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(zbeVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            myaVar2 = myaVar;
            i3 |= p65Var2.f(myaVar2) ? 1048576 : 524288;
        } else {
            myaVar2 = myaVar;
        }
        if ((12582912 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= p65Var2.g(z) ? 67108864 : 33554432;
        }
        if ((805306368 & i2) == 0) {
            f3 = f2;
            i3 |= p65Var2.c(f3) ? 536870912 : 268435456;
        } else {
            f3 = f2;
        }
        if (p65Var2.P(i3 & 1, (i3 & 306783379) != 306783378)) {
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new tjd(17);
                p65Var2.j0(objM);
            }
            int i7 = i3;
            pr7.b(bgf.N(wxb.a(r28Var, false, (x45) objM).b(jfc.c), "user_lists_screen"), null, null, pxf.E(1650510471, new eyc(nhcVar, 10), p65Var2), null, 0, 0L, 0L, qb8.p, pxf.E(-1780250274, new c55() { // from class: ybe
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    hy8 hy8Var = (hy8) obj;
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    hy8Var.getClass();
                    if ((iIntValue & 6) == 0) {
                        iIntValue |= ((p65) x12Var2).f(hy8Var) ? 4 : 2;
                    }
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                        r28 r28VarB = w2g.B(jfc.c, hy8Var);
                        wce wceVar2 = wceVar;
                        boolean z2 = wceVar2 instanceof tce;
                        zbe zbeVar3 = zbeVar;
                        if (z2) {
                            p65Var3.Y(-1179528816);
                            n01.g((tce) wceVar2, zbeVar3, myaVar2, kv6Var, f3, z, r28VarB, p65Var3, 0);
                            p65Var3.p(false);
                        } else if (wceVar2 instanceof uce) {
                            p65Var3.Y(-1423509203);
                            n01.m((uce) wceVar2, zbeVar3, r28VarB, p65Var3, 0);
                            p65Var3.p(false);
                        } else {
                            if (!(wceVar2 instanceof vce)) {
                                throw ho2.L(p65Var3, -1423524671, false);
                            }
                            p65Var3.Y(-1423502919);
                            n01.H(r28VarB, p65Var3, 0);
                            p65Var3.p(false);
                        }
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var2), p65Var2, 805309440, 246);
            if (nceVar instanceof lce) {
                p65Var2.Y(-2057701000);
                String str2 = ((lce) nceVar).a;
                int i8 = i7 & 458752;
                boolean z2 = i8 == 131072;
                Object objM2 = p65Var2.M();
                if (z2 || objM2 == uobVar) {
                    i4 = 458752;
                    i6 = i8;
                    i5 = i7;
                    str = str2;
                    hgb hgbVar = new hgb(1, zbeVar, pbe.class, "onRemoveDownloadedListsCatalog", "onRemoveDownloadedListsCatalog(Ljava/lang/String;)V", 0, 17);
                    p65Var2.j0(hgbVar);
                    objM2 = hgbVar;
                } else {
                    str = str2;
                    i6 = i8;
                    i4 = 458752;
                    i5 = i7;
                }
                x45 x45Var = (x45) ((qh6) objM2);
                boolean z3 = i6 == 131072;
                Object objM3 = p65Var2.M();
                if (z3 || objM3 == uobVar) {
                    objM3 = new k8e(0, zbeVar, pbe.class, "onDialogClosed", "onDialogClosed()V", 0, 8);
                    p65Var2.j0(objM3);
                }
                tp7.l(str, x45Var, (m45) ((qh6) objM3), null, p65Var2, 0);
                p65Var2.p(false);
            } else {
                i4 = 458752;
                i5 = i7;
                if (nceVar instanceof kce) {
                    p65Var2.Y(1734748593);
                    p65Var2.p(false);
                } else if (nceVar instanceof mce) {
                    p65Var2.Y(1734752237);
                    int i9 = i5 & 458752;
                    boolean z4 = (i9 == 131072) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                    Object objM4 = p65Var2.M();
                    if (z4 || objM4 == uobVar) {
                        objM4 = new nbb(zbeVar, 29, nceVar);
                        p65Var2.j0(objM4);
                    }
                    m45 m45Var2 = (m45) objM4;
                    boolean z5 = i9 == 131072;
                    Object objM5 = p65Var2.M();
                    if (z5 || objM5 == uobVar) {
                        m45Var = m45Var2;
                        k8e k8eVar = new k8e(0, zbeVar, pbe.class, "onDialogClosed", "onDialogClosed()V", 0, 4);
                        p65Var2.j0(k8eVar);
                        objM5 = k8eVar;
                    } else {
                        m45Var = m45Var2;
                    }
                    guc.e(m45Var, (m45) ((qh6) objM5), null, p65Var2, 0);
                    p65Var2.p(false);
                } else {
                    if (nceVar != null) {
                        throw ho2.L(p65Var2, 1734735308, false);
                    }
                    p65Var2.Y(1734758769);
                    p65Var2.p(false);
                }
            }
            if (dceVar != null) {
                p65Var2.Y(1734762637);
                int i10 = i5 & i4;
                boolean z6 = i10 == 131072;
                Object objM6 = p65Var2.M();
                if (z6 || objM6 == uobVar) {
                    zbeVar2 = zbeVar;
                    k8e k8eVar2 = new k8e(0, zbeVar2, pbe.class, "goToDeviceStorageSettingsScreen", "goToDeviceStorageSettingsScreen()V", 0, 5);
                    p65Var2.j0(k8eVar2);
                    objM6 = k8eVar2;
                } else {
                    zbeVar2 = zbeVar;
                }
                m45 m45Var3 = (m45) ((qh6) objM6);
                boolean z7 = (i10 == 131072) | ((i5 & 896) == 256);
                Object objM7 = p65Var2.M();
                if (z7 || objM7 == uobVar) {
                    objM7 = new ube(zbeVar2, 0, dceVar);
                    p65Var2.j0(objM7);
                }
                m45 m45Var4 = (m45) objM7;
                boolean z8 = i10 == 131072;
                Object objM8 = p65Var2.M();
                if (z8 || objM8 == uobVar) {
                    k8e k8eVar3 = new k8e(0, zbeVar2, pbe.class, "onBottomSheetClosed", "onBottomSheetClosed()V", 0, 6);
                    p65Var2.j0(k8eVar3);
                    objM8 = k8eVar3;
                }
                p65Var = p65Var2;
                br7.d(m45Var3, m45Var4, (m45) ((qh6) objM8), null, p65Var, 0);
                p65Var.p(false);
            } else {
                p65Var = p65Var2;
                if (dceVar != null) {
                    throw ho2.L(p65Var, 1734759782, false);
                }
                p65Var.Y(1734775121);
                p65Var.p(false);
            }
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: vbe
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    n01.P(wceVar, nceVar, dceVar, kv6Var, nhcVar, zbeVar, myaVar, r28Var, z, f2, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void Q(final String str, final String str2, final qbe qbeVar, final r28 r28Var, final bo4 bo4Var, final boolean z, float f2, x12 x12Var, final int i2, final int i3) {
        float f3;
        int i4;
        p65 p65Var;
        final float f4;
        ide ideVar;
        str2.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(336465626);
        int i5 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(qbeVar) ? 256 : 128) | (p65Var2.h(bo4Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        int i6 = i3 & 64;
        if (i6 != 0) {
            i4 = i5 | 1572864;
            f3 = f2;
        } else {
            f3 = f2;
            i4 = i5 | (p65Var2.c(f3) ? 1048576 : 524288);
        }
        boolean z2 = true;
        if (p65Var2.P(i4 & 1, (599187 & i4) != 599186)) {
            float f5 = i6 != 0 ? 24.0f : f3;
            boolean z3 = (((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var2.f(str2)) || (i4 & 48) == 32;
            if ((((i4 & 14) ^ 6) <= 4 || !p65Var2.f(str)) && (i4 & 6) != 4) {
                z2 = false;
            }
            boolean z4 = z3 | z2;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z4 || objM == uobVar) {
                objM = new bb0(str2, str, 25);
                p65Var2.j0(objM);
            }
            x45 x45Var = (x45) objM;
            wue wueVarA = e67.a(p65Var2);
            if (wueVarA == null) {
                ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                return;
            }
            ide ideVar2 = (ide) to7.z(n1b.a.b(ide.class), wueVarA, t40.E(wueVarA, p65Var2), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var2);
            Resources resources = (Resources) p65Var2.j(eo.c);
            l78 l78VarZ = guc.z(ideVar2.t, p65Var2, 0);
            l78 l78VarZ2 = guc.z(ideVar2.x, p65Var2, 0);
            l78 l78VarZ3 = guc.z(ideVar2.z, p65Var2, 0);
            kv6 kv6VarA = pv6.a(p65Var2);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = y30.j(p65Var2);
            }
            nhc nhcVar = (nhc) objM2;
            zbe zbeVar = new zbe(ideVar2, qbeVar);
            mya myaVar = new mya(ideVar2, 19, qbeVar);
            P((wce) l78VarZ.getValue(), (nce) l78VarZ2.getValue(), (dce) l78VarZ3.getValue(), kv6VarA, nhcVar, zbeVar, myaVar, r28Var, z, f5, p65Var2, 113270784 | ((i4 << 9) & 1879048192));
            p65Var = p65Var2;
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean zH = p65Var.h(ideVar2) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(zbeVar) | p65Var.f(myaVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                objM4 = new yu(ideVar2, nhcVar, sb2Var, zbeVar, resources, myaVar, null, 25);
                ideVar = ideVar2;
                p65Var.j0(objM4);
            } else {
                ideVar = ideVar2;
            }
            c1e c1eVar = c1e.a;
            kyd.k(p65Var, (b55) objM4, c1eVar);
            boolean zF = p65Var.f(kv6VarA) | p65Var.h(ideVar);
            Object objM5 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM5 == uobVar) {
                objM5 = new cfd(kv6VarA, ideVar, n92Var, 11);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, kv6VarA);
            boolean zH2 = p65Var.h(bo4Var) | p65Var.h(ideVar) | p65Var.f(kv6VarA);
            Object objM6 = p65Var.M();
            if (zH2 || objM6 == uobVar) {
                j5d j5dVar = new j5d(bo4Var, ideVar, kv6VarA, n92Var, 11);
                p65Var.j0(j5dVar);
                objM6 = j5dVar;
            }
            kyd.k(p65Var, (b55) objM6, c1eVar);
            f4 = f5;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            f4 = f3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(str, str2, qbeVar, r28Var, bo4Var, z, f4, i2, i3) { // from class: xbe
                public final /* synthetic */ String a;
                public final /* synthetic */ String b;
                public final /* synthetic */ qbe c;
                public final /* synthetic */ r28 d;
                public final /* synthetic */ bo4 e;
                public final /* synthetic */ boolean f;
                public final /* synthetic */ float g;
                public final /* synthetic */ int h;

                {
                    this.h = i3;
                }

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(199681);
                    n01.Q(this.a, this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY, this.h);
                    return c1e.a;
                }
            };
        }
    }

    public static final k65 R(k65 k65Var) {
        if (k65Var == null) {
            k65Var = null;
        }
        if (k65Var != null) {
            return k65Var;
        }
        b22.b("Inconsistent composition");
        z72.b();
        return null;
    }

    public static void T(Object obj, String str, String str2) {
        String strZ = Z(str);
        if (Log.isLoggable(strZ, 3)) {
            Log.d(strZ, String.format(str2, obj));
        }
    }

    public static void U(Exception exc, String str, String str2) {
        String strZ = Z(str);
        if (Log.isLoggable(strZ, 6)) {
            Log.e(strZ, str2, exc);
        }
    }

    public static final ib2 W(elb elbVar, boolean z, p92 p92Var) {
        hrd hrdVar = (hrd) p92Var.getContext().o0(hrd.b);
        ib2 ib2Var = hrdVar != null ? hrdVar.a : null;
        if (!elbVar.k()) {
            ib2 ib2VarH = elbVar.h();
            if (ib2Var == null) {
                ib2Var = zx3.a;
            }
            return ib2VarH.j0(ib2Var);
        }
        if (ib2Var != null) {
            return elbVar.h().j0(ib2Var);
        }
        if (!z) {
            return elbVar.h();
        }
        ib2 ib2Var2 = elbVar.b;
        if (ib2Var2 != null) {
            return ib2Var2;
        }
        g76.g0("transactionContext");
        throw null;
    }

    public static String Z(String str) {
        if (Build.VERSION.SDK_INT >= 26) {
            return "TRuntime.".concat(str);
        }
        String strConcat = "TRuntime.".concat(str);
        return strConcat.length() > 23 ? strConcat.substring(0, 23) : strConcat;
    }

    public static final LinearGradient a(long j2, long j3, List list, List list2) {
        int i2;
        float[] fArr;
        float f2;
        int[] iArr;
        int i3;
        int i4;
        float f3;
        int i5;
        int i6;
        int i7;
        float[] fArrK1;
        float[] fArr2 = null;
        if (list2 == null) {
            if (list.size() < 2) {
                ay0.e("colors must have length of at least 2 if colorStops is omitted.");
                return null;
            }
        } else if (list.size() != list2.size()) {
            ay0.e("colors and colorStops arguments must have equal length.");
            return null;
        }
        int i8 = 1;
        if (Build.VERSION.SDK_INT >= 26) {
            i2 = 0;
        } else {
            int size = list.size() - 1;
            i2 = 0;
            for (int i9 = 1; i9 < size; i9++) {
                if (uu1.c(((uu1) list.get(i9)).a) == 0.0f) {
                    i2++;
                }
            }
        }
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j2 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j2 & 4294967295L));
        float fIntBitsToFloat3 = Float.intBitsToFloat((int) (j3 >> 32));
        float fIntBitsToFloat4 = Float.intBitsToFloat((int) (j3 & 4294967295L));
        if (Build.VERSION.SDK_INT >= 26) {
            int size2 = list.size();
            iArr = new int[size2];
            int i10 = 0;
            while (i10 < size2) {
                iArr[i10] = op8.n0(((uu1) list.get(i10)).a);
                i10++;
                fIntBitsToFloat3 = fIntBitsToFloat3;
                fArr2 = fArr2;
            }
            fArr = fArr2;
            f2 = fIntBitsToFloat3;
        } else {
            fArr = null;
            f2 = fIntBitsToFloat3;
            iArr = new int[list.size() + i2];
            int size3 = list.size() - 1;
            int size4 = list.size();
            int i11 = 0;
            int i12 = 0;
            while (i11 < size4) {
                int i13 = i11;
                long j4 = ((uu1) list.get(i11)).a;
                if (uu1.c(j4) == 0.0f) {
                    if (i13 == 0) {
                        i7 = i12 + 1;
                        i4 = i8;
                        f3 = fIntBitsToFloat2;
                        iArr[i12] = op8.n0(uu1.b(0.0f, ((uu1) list.get(i8)).a));
                        i5 = i13;
                        i6 = size3;
                        i3 = size4;
                    } else {
                        i4 = i8;
                        f3 = fIntBitsToFloat2;
                        i5 = i13;
                        if (i5 == size3) {
                            i7 = i12 + 1;
                            i6 = size3;
                            i3 = size4;
                            iArr[i12] = op8.n0(uu1.b(0.0f, ((uu1) list.get(i5 - 1)).a));
                        } else {
                            i6 = size3;
                            i3 = size4;
                            int i14 = i12 + 1;
                            iArr[i12] = op8.n0(uu1.b(0.0f, ((uu1) list.get(i5 - 1)).a));
                            i12 += 2;
                            iArr[i14] = op8.n0(uu1.b(0.0f, ((uu1) list.get(i5 + 1)).a));
                        }
                    }
                    i12 = i7;
                } else {
                    i3 = size4;
                    i4 = i8;
                    f3 = fIntBitsToFloat2;
                    i5 = i13;
                    i6 = size3;
                    iArr[i12] = op8.n0(j4);
                    i12++;
                }
                i11 = i5 + 1;
                size3 = i6;
                size4 = i3;
                i8 = i4;
                fIntBitsToFloat2 = f3;
            }
        }
        int i15 = i8;
        float f4 = fIntBitsToFloat2;
        if (i2 == 0) {
            if (list2 != null) {
                fArrK1 = bu1.k1(list2);
            }
            return new LinearGradient(fIntBitsToFloat, f4, f2, fIntBitsToFloat4, iArr, fArr, yi2.R(0));
        }
        fArrK1 = new float[list.size() + i2];
        fArrK1[0] = list2 != null ? ((Number) list2.get(0)).floatValue() : 0.0f;
        int size5 = list.size() - i15;
        int i16 = i15;
        int i17 = i16;
        while (i16 < size5) {
            long j5 = ((uu1) list.get(i16)).a;
            float fFloatValue = list2 != null ? ((Number) list2.get(i16)).floatValue() : i16 / (list.size() - i15);
            int i18 = i17 + 1;
            fArrK1[i17] = fFloatValue;
            if (uu1.c(j5) == 0.0f) {
                i17 += 2;
                fArrK1[i18] = fFloatValue;
            } else {
                i17 = i18;
            }
            i16++;
        }
        fArrK1[i17] = list2 != null ? ((Number) list2.get(list.size() - i15)).floatValue() : 1.0f;
        fArr = fArrK1;
        return new LinearGradient(fIntBitsToFloat, f4, f2, fIntBitsToFloat4, iArr, fArr, yi2.R(0));
    }

    public static final String a0(Frequency frequency, x12 x12Var) {
        int i2;
        int i3 = vd3.a[frequency.ordinal()];
        if (i3 == 1) {
            i2 = com.medium.reader.R.string.daily;
        } else if (i3 == 2) {
            i2 = com.medium.reader.R.string.weekly;
        } else {
            if (i3 != 3) {
                ygf.a();
                return null;
            }
            i2 = com.medium.reader.R.string.off;
        }
        return vo7.R(x12Var, i2);
    }

    public static final void b(lf lfVar, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1394688736);
        int i3 = i2 | (p65Var.f(lfVar) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            iq7.a(lfVar.a, iy0.a.a(jfc.d(o28Var, 1.0f), ar0Var), null, null, null, null, m45Var, null, p65Var, (i3 << 15) & 3670016, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 9, lfVar, m45Var, r28Var);
        }
    }

    public static void b0(PackageInfo packageInfo, File file) {
        try {
            DataOutputStream dataOutputStream = new DataOutputStream(new FileOutputStream(new File(file, "profileinstaller_profileWrittenFor_lastUpdateTime.dat")));
            try {
                dataOutputStream.writeLong(packageInfo.lastUpdateTime);
                dataOutputStream.close();
            } finally {
            }
        } catch (IOException unused) {
        }
    }

    public static final void c(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-238925772);
        int i3 = 2;
        int i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
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
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
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
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            p65Var.Y(279721460);
            for (int i8 = 0; i8 < 12; i8++) {
                vn7.g(null, p65Var, 0);
            }
            ho2.N(p65Var, false, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, i3);
        }
    }

    public static final Object c0(elb elbVar, boolean z, boolean z2, x45 x45Var) {
        elbVar.getClass();
        ThreadLocal threadLocal = elbVar.i;
        elbVar.a();
        if (elbVar.k() && !elbVar.l()) {
            ib2 ib2Var = (ib2) threadLocal.get();
            if ((ib2Var != null ? (hrd) ib2Var.o0(hrd.b) : null) != null) {
                ygf.f("Cannot access database on a different coroutine context inherited from a suspending transaction.");
                return null;
            }
        }
        ib2 ib2Var2 = (ib2) threadLocal.get();
        if (ib2Var2 == null) {
            ib2Var2 = zx3.a;
        }
        return lk7.E(new qm2(ib2Var2, elbVar, z2, z, x45Var, null));
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00c4  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0136  */
    /* JADX WARN: Removed duplicated region for block: B:81:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void d(defpackage.nf r25, defpackage.nhc r26, defpackage.zg7 r27, defpackage.e9d r28, defpackage.m45 r29, defpackage.m45 r30, defpackage.m45 r31, defpackage.r28 r32, defpackage.x12 r33, int r34, int r35) {
        /*
            Method dump skipped, instruction units count: 334
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.d(nf, nhc, zg7, e9d, m45, m45, m45, r28, x12, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object d0(defpackage.n92 r14, defpackage.elb r15, boolean r16, boolean r17, defpackage.x45 r18) throws java.lang.Throwable {
        /*
            boolean r0 = r14 instanceof defpackage.rm2
            if (r0 == 0) goto L14
            r0 = r14
            rm2 r0 = (defpackage.rm2) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.g = r1
        L12:
            r14 = r0
            goto L1a
        L14:
            rm2 r0 = new rm2
            r0.<init>(r14)
            goto L12
        L1a:
            java.lang.Object r0 = r14.f
            tb2 r7 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r14.g
            r2 = 0
            r3 = 3
            r4 = 2
            r8 = 1
            if (r1 == 0) goto L4a
            if (r1 == r8) goto L46
            if (r1 == r4) goto L36
            if (r1 != r3) goto L30
            defpackage.br7.v(r0)
            return r0
        L30:
            java.lang.String r14 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r14)
            return r2
        L36:
            boolean r1 = r14.e
            boolean r4 = r14.d
            x45 r5 = r14.c
            elb r6 = r14.b
            defpackage.br7.v(r0)
            r12 = r1
            r11 = r4
            r13 = r5
            r10 = r6
            goto L95
        L46:
            defpackage.br7.v(r0)
            return r0
        L4a:
            defpackage.br7.v(r0)
            boolean r0 = r15.k()
            if (r0 == 0) goto L79
            boolean r0 = r15.o()
            if (r0 == 0) goto L79
            boolean r0 = r15.l()
            if (r0 == 0) goto L79
            om2 r0 = new om2
            r4 = 0
            r6 = 1
            r3 = r15
            r2 = r16
            r1 = r17
            r5 = r18
            r0.<init>(r1, r2, r3, r4, r5, r6)
            r1 = r2
            r2 = r0
            r14.g = r8
            java.lang.Object r14 = r15.r(r1, r2, r14)
            if (r14 != r7) goto L78
            goto La9
        L78:
            return r14
        L79:
            r1 = r16
            r5 = r17
            r14.b = r15
            r6 = r18
            r14.c = r6
            r14.d = r1
            r14.e = r5
            r14.g = r4
            ib2 r4 = W(r15, r5, r14)
            if (r4 != r7) goto L90
            goto La9
        L90:
            r10 = r15
            r11 = r1
            r0 = r4
            r12 = r5
            r13 = r6
        L95:
            ib2 r0 = (defpackage.ib2) r0
            pm2 r8 = new pm2
            r9 = 0
            r8.<init>(r9, r10, r11, r12, r13)
            r14.b = r2
            r14.c = r2
            r14.g = r3
            java.lang.Object r14 = defpackage.vx0.m0(r0, r8, r14)
            if (r14 != r7) goto Laa
        La9:
            return r7
        Laa:
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.d0(n92, elb, boolean, boolean, x45):java.lang.Object");
    }

    public static final void e(String str, int i2, zg7 zg7Var, r28 r28Var, qf qfVar, x12 x12Var, int i3) {
        qf qfVar2;
        qf qfVar3;
        int i4;
        qf qfVar4;
        Object obj;
        qf qfVar5;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(960525086);
        int i5 = i3 | (p65Var.f(str) ? 4 : 2) | (p65Var.d(i2) ? 32 : 16) | (p65Var.f(zg7Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            p65Var.U();
            int i6 = i3 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                Object obj2 = objM;
                if (z || objM == uobVar) {
                    ne neVar = new ne(str, i2, i);
                    p65Var.j0(neVar);
                    obj2 = neVar;
                }
                x45 x45Var = (x45) obj2;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    qfVar3 = (qf) to7.z(n1b.a.b(qf.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i4 = i5 & (-57345);
                }
            } else {
                p65Var.S();
                i4 = i5 & (-57345);
                qfVar3 = qfVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(qfVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            int i7 = i4 & 896;
            int i8 = (p65Var.f(qfVar3) ? 1 : 0) | (i7 != 256 ? 0 : 1);
            Object objM2 = p65Var.M();
            Object obj3 = objM2;
            if (i8 != 0 || objM2 == uobVar) {
                cf cfVar = new cf(zg7Var, qfVar3);
                p65Var.j0(cfVar);
                obj3 = cfVar;
            }
            cf cfVar2 = (cf) obj3;
            nf nfVar = (nf) l78VarZ.getValue();
            boolean zH = p65Var.h(qfVar3);
            Object objM3 = p65Var.M();
            if (zH || objM3 == uobVar) {
                x8 x8Var = new x8(0, qfVar3, qf.class, "refresh", "refresh()V", 0, 25);
                p65Var.j0(x8Var);
                objM3 = x8Var;
            }
            m45 m45Var = (m45) ((qh6) objM3);
            boolean zH2 = p65Var.h(qfVar3);
            Object objM4 = p65Var.M();
            if (zH2 || objM4 == uobVar) {
                x8 x8Var2 = new x8(0, qfVar3, qf.class, "loadMore", "loadMore()V", 0, 26);
                p65Var.j0(x8Var2);
                objM4 = x8Var2;
            }
            m45 m45Var2 = (m45) ((qh6) objM4);
            boolean zH3 = p65Var.h(qfVar3);
            Object objM5 = p65Var.M();
            if (zH3 || objM5 == uobVar) {
                qfVar4 = qfVar3;
                x8 x8Var3 = new x8(0, qfVar4, qf.class, "reportScreenViewed", "reportScreenViewed()V", 0, 27);
                p65Var.j0(x8Var3);
                obj = x8Var3;
            } else {
                qfVar4 = qfVar3;
                obj = objM5;
            }
            int i9 = i7 | ((i4 << 12) & 29360128);
            qf qfVar6 = qfVar4;
            d(nfVar, nhcVarF, zg7Var, cfVar2, m45Var, m45Var2, (m45) ((qh6) obj), r28Var, p65Var, i9, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH4 = p65Var.h(qfVar6) | p65Var.f(nhcVarF) | p65Var.h(resources) | p65Var.f(cfVar2);
            Object objM6 = p65Var.M();
            if (zH4 || objM6 == uobVar) {
                ra raVar = new ra(qfVar6, nhcVarF, resources, cfVar2, null, 4);
                qfVar5 = qfVar6;
                p65Var.j0(raVar);
                objM6 = raVar;
            } else {
                qfVar5 = qfVar6;
            }
            kyd.k(p65Var, (b55) objM6, c1e.a);
            qfVar2 = qfVar5;
        } else {
            p65Var.S();
            qfVar2 = qfVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(str, i2, zg7Var, r28Var, qfVar2, i3, 2);
        }
    }

    public static List e0(Context context) throws IOException {
        u72 u72Var;
        context.getClass();
        ContentResolver contentResolver = context.getContentResolver();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Cursor cursorQuery = contentResolver.query(ContactsContract.CommonDataKinds.Email.CONTENT_URI, new String[]{"contact_id", "data1"}, null, null, null);
        if (cursorQuery != null) {
            try {
                int columnIndex = cursorQuery.getColumnIndex("contact_id");
                int columnIndex2 = cursorQuery.getColumnIndex("data1");
                if (columnIndex >= 0 && columnIndex2 >= 0) {
                    while (cursorQuery.moveToNext()) {
                        long j2 = cursorQuery.getLong(columnIndex);
                        String string = cursorQuery.getString(columnIndex2);
                        if (string != null && !muc.b0(string)) {
                            u72 u72Var2 = (u72) linkedHashMap.get(Long.valueOf(j2));
                            Long lValueOf = Long.valueOf(j2);
                            if (u72Var2 != null) {
                                u72Var = new u72(u72Var2.a, bu1.R0(u72Var2.b, string));
                            } else {
                                u72Var = new u72(j2, d46.Q(string));
                            }
                            linkedHashMap.put(lValueOf, u72Var);
                        }
                    }
                    cursorQuery.close();
                }
                wld.a.n(null, "Invalid column indices: contactId=" + columnIndex + ", email=" + columnIndex2, new Object[0]);
                List listM1 = bu1.m1(linkedHashMap.values());
                cursorQuery.close();
                return listM1;
            } finally {
            }
        }
        return bu1.m1(linkedHashMap.values());
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0076  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:50:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void f(defpackage.rg1 r14, defpackage.ye1 r15, defpackage.r28 r16, defpackage.oe1 r17, defpackage.x12 r18, int r19, int r20) {
        /*
            r5 = r19
            r14.getClass()
            r15.getClass()
            r17.getClass()
            r0 = r18
            p65 r0 = (defpackage.p65) r0
            r1 = -1728718658(0xffffffff98f5d8be, float:-6.354987E-24)
            r0.a0(r1)
            r1 = r5 & 6
            if (r1 != 0) goto L24
            boolean r2 = r0.f(r14)
            if (r2 == 0) goto L21
            r2 = 4
            goto L22
        L21:
            r2 = 2
        L22:
            r2 = r2 | r5
            goto L25
        L24:
            r2 = r5
        L25:
            r3 = r5 & 48
            if (r3 != 0) goto L35
            boolean r3 = r0.f(r15)
            if (r3 == 0) goto L32
            r3 = 32
            goto L34
        L32:
            r3 = 16
        L34:
            r2 = r2 | r3
        L35:
            r3 = r20 & 4
            if (r3 == 0) goto L3e
            r2 = r2 | 384(0x180, float:5.38E-43)
        L3b:
            r4 = r16
            goto L50
        L3e:
            r4 = r5 & 384(0x180, float:5.38E-43)
            if (r4 != 0) goto L3b
            r4 = r16
            boolean r6 = r0.f(r4)
            if (r6 == 0) goto L4d
            r6 = 256(0x100, float:3.59E-43)
            goto L4f
        L4d:
            r6 = 128(0x80, float:1.8E-43)
        L4f:
            r2 = r2 | r6
        L50:
            r6 = r5 & 3072(0xc00, float:4.305E-42)
            if (r6 != 0) goto L64
            int r6 = r17.ordinal()
            boolean r6 = r0.d(r6)
            if (r6 == 0) goto L61
            r6 = 2048(0x800, float:2.87E-42)
            goto L63
        L61:
            r6 = 1024(0x400, float:1.435E-42)
        L63:
            r2 = r2 | r6
        L64:
            r6 = r2 & 1171(0x493, float:1.641E-42)
            r7 = 1170(0x492, float:1.64E-42)
            r12 = 0
            r13 = 1
            if (r6 == r7) goto L6e
            r6 = r13
            goto L6f
        L6e:
            r6 = r12
        L6f:
            r2 = r2 & r13
            boolean r2 = r0.P(r2, r6)
            if (r2 == 0) goto L96
            if (r3 == 0) goto L7c
            o28 r2 = defpackage.o28.b
            r9 = r2
            goto L7d
        L7c:
            r9 = r4
        L7d:
            swe r6 = new swe
            r11 = 18
            r7 = r14
            r8 = r15
            r10 = r17
            r6.<init>(r7, r8, r9, r10, r11)
            r1 = -1040029711(0xffffffffc20267f1, float:-32.601505)
            mz1 r1 = defpackage.pxf.E(r1, r6, r0)
            r2 = 48
            defpackage.jt7.a(r12, r1, r0, r2, r13)
            r3 = r9
            goto L9a
        L96:
            r0.S()
            r3 = r4
        L9a:
            mwa r8 = r0.s()
            if (r8 == 0) goto Lae
            de1 r0 = new de1
            r7 = 0
            r1 = r14
            r2 = r15
            r4 = r17
            r6 = r20
            r0.<init>(r1, r2, r3, r4, r5, r6, r7)
            r8.d = r0
        Lae:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.f(rg1, ye1, r28, oe1, x12, int, int):void");
    }

    public static s01 f0(InputStream inputStream) {
        DataInputStream dataInputStream = new DataInputStream(inputStream);
        n46 n46Var = new n46(1, dataInputStream.readInt(), 1);
        ArrayList arrayList = new ArrayList(cu1.k0(n46Var, 10));
        Iterator it2 = n46Var.iterator();
        while (((m46) it2).c) {
            ((g46) it2).nextInt();
            arrayList.add(Integer.valueOf(dataInputStream.readInt()));
        }
        int[] iArrL1 = bu1.l1(arrayList);
        int[] iArrCopyOf = Arrays.copyOf(iArrL1, iArrL1.length);
        return new s01(Arrays.copyOf(iArrCopyOf, iArrCopyOf.length));
    }

    public static final void g(tce tceVar, zbe zbeVar, final mya myaVar, final kv6 kv6Var, final float f2, boolean z, r28 r28Var, x12 x12Var, int i2) {
        tce tceVar2;
        final az5 az5Var;
        final az5 az5Var2;
        boolean z2;
        int i3;
        boolean z3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-383895658);
        int i4 = i2 | (p65Var.f(tceVar) ? 4 : 2) | (p65Var.f(zbeVar) ? 32 : 16) | (p65Var.f(myaVar) ? 256 : 128) | (p65Var.f(kv6Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.c(f2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.g(z) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(r28Var) ? 1048576 : 524288);
        if (p65Var.P(i4 & 1, (i4 & 599187) != 599186)) {
            az5 az5Var3 = tceVar.b;
            boolean z4 = tceVar.d;
            az5 az5Var4 = tceVar.c;
            Context context = (Context) p65Var.j(eo.b);
            context.getClass();
            float f3 = r8.widthPixels / context.getResources().getDisplayMetrics().density;
            final oe1 oe1Var = (vj3.a(f3, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f3, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED) == ip7.COMPACT ? oe1.S : oe1.M;
            boolean z5 = z && z4;
            int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z6 = i5 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z6 || objM == uobVar) {
                az5Var = az5Var3;
                az5Var2 = az5Var4;
                z2 = z4;
                i3 = i5;
                k8e k8eVar = new k8e(0, zbeVar, pbe.class, "onRefresh", "onRefresh()V", 0, 2);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            } else {
                az5Var = az5Var3;
                z2 = z4;
                az5Var2 = az5Var4;
                i3 = i5;
            }
            er7.d(z5, (m45) ((qh6) objM), bgf.N(rv8.J(r28Var, jq7.t(p65Var), null), "content_state"), null, 0L, 0L, z, 0.0f, null, null, pxf.E(1084028616, new c55() { // from class: wbe
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    ((hy0) obj).getClass();
                    p65 p65Var2 = (p65) x12Var2;
                    if (p65Var2.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                        h70 h70Var = new h70(24.0f, true, new z10(21));
                        jy8 jy8VarH = w2g.h(0.0f, 24.0f, 0.0f, f2, 5);
                        rh4 rh4Var = jfc.c;
                        az5 az5Var5 = az5Var;
                        boolean zF = p65Var2.f(az5Var5);
                        mya myaVar2 = myaVar;
                        boolean zF2 = zF | p65Var2.f(myaVar2);
                        oe1 oe1Var2 = oe1Var;
                        boolean zD = zF2 | p65Var2.d(oe1Var2.ordinal());
                        az5 az5Var6 = az5Var2;
                        boolean zF3 = zD | p65Var2.f(az5Var6);
                        Object objM2 = p65Var2.M();
                        if (zF3 || objM2 == w12.a) {
                            objM2 = new iu(az5Var5, myaVar2, oe1Var2, az5Var6, 26);
                            p65Var2.j0(objM2);
                        }
                        k40.t(rh4Var, kv6Var, jy8VarH, h70Var, null, null, false, null, (x45) objM2, p65Var2, 24582, 488);
                    } else {
                        p65Var2.S();
                    }
                    return c1e.a;
                }
            }, p65Var), p65Var, (i4 << 3) & 3670016, 952);
            ide ideVar = zbeVar.a;
            if (ideVar.n) {
                z3 = true;
            } else {
                z3 = true;
                ideVar.n = true;
                ideVar.l.j(ideVar.b, gp7.u(ideVar.p), ideVar.o);
            }
            Boolean boolValueOf = Boolean.valueOf(z2);
            boolean z7 = (i3 == 32 ? z3 : false) | ((i4 & 14) == 4 ? z3 : false);
            Object objM2 = p65Var.M();
            if (z7 || objM2 == uobVar) {
                tceVar2 = tceVar;
                objM2 = new n79(zbeVar, tceVar2, null, 26);
                p65Var.j0(objM2);
            } else {
                tceVar2 = tceVar;
            }
            kyd.k(p65Var, (b55) objM2, boolValueOf);
        } else {
            tceVar2 = tceVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yr7(tceVar2, zbeVar, myaVar, kv6Var, f2, z, r28Var, i2);
        }
    }

    public static final boolean g0(mn6 mn6Var) {
        co1 co1VarA = mn6Var.j0().a();
        if (co1VarA != null && ((g26.b(co1VarA) && g26.e(co1VarA) && !f93.g((y28) co1VarA).equals(mnc.h)) || g26.f(mn6Var))) {
            return true;
        }
        co1 co1VarA2 = mn6Var.j0().a();
        swd swdVar = co1VarA2 instanceof swd ? (swd) co1VarA2 : null;
        return swdVar != null && g0(ok7.C(swdVar));
    }

    public static final void h(final gr1 gr1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        int i3;
        String str = gr1Var.h;
        String str2 = gr1Var.g;
        String str3 = gr1Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1413130425);
        int i4 = (p65Var.f(gr1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            String str4 = gr1Var.e;
            boolean z = gr1Var.a;
            kx kxVarW = ho2.w(p65Var, 808683066);
            String strQ = vo7.Q(com.medium.reader.R.string.notification_type_collection_draft_submitted, new Object[]{str3, str2, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str3, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str3.length() + iZ);
                int iZ2 = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2, str2.length() + iZ2);
                int iZ3 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ3, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ3);
                p65Var.p(false);
                long j2 = gr1Var.b;
                int i5 = i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i6 = i4 & 14;
                boolean z2 = (i5 == 32) | (i6 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: hr1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i7 = i;
                            c1e c1eVar = c1e.a;
                            gr1 gr1Var2 = gr1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i7) {
                                case 0:
                                    ek8Var2.m(gr1Var2.f, gr1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(gr1Var2.c, gr1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i7 = (i5 == 32 ? 1 : 0) | (i6 == 4 ? 1 : 0);
                Object objM2 = p65Var.M();
                if (i7 != 0 || objM2 == uobVar) {
                    final int i8 = 1;
                    objM2 = new m45() { // from class: hr1
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i72 = i8;
                            c1e c1eVar = c1e.a;
                            gr1 gr1Var2 = gr1Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i72) {
                                case 0:
                                    ek8Var2.m(gr1Var2.f, gr1Var2.i);
                                    break;
                                default:
                                    ek8Var2.k(gr1Var2.c, gr1Var2.i);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                i3 = 2;
                rv8.f(z, str4, null, mxVarC, j2, 0, m45Var, (m45) objM2, p65Var, 0, 36);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            i3 = 2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(gr1Var, ek8Var, i2, i3);
        }
    }

    public static void h0(ce0 ce0Var) {
        z46 z46Var = m50.g;
        m50 m50Var = m50.h;
        boolean zEquals = true;
        char c2 = 1;
        if (m50Var == null) {
            synchronized (z46Var) {
                m50Var = m50.h;
                if (m50Var == null) {
                    m50 m50Var2 = new m50(iq1.C(f94.a()), new dsc(2), c2 == true ? 1 : 0);
                    m50.h = m50Var2;
                    m50Var = m50Var2;
                }
            }
        }
        ce0 ce0Var2 = (ce0) m50Var.d;
        m50Var.d = ce0Var;
        dsc dscVar = (dsc) m50Var.c;
        if (ce0Var != null) {
            try {
                dscVar.a.edit().putString("com.facebook.AuthenticationManager.CachedAuthenticationToken", ce0Var.a().toString()).apply();
            } catch (JSONException unused) {
            }
        } else {
            dscVar.a.edit().remove("com.facebook.AuthenticationManager.CachedAuthenticationToken").apply();
            epe.c(f94.a());
        }
        if (ce0Var2 != null) {
            zEquals = ce0Var2.equals(ce0Var);
        } else if (ce0Var != null) {
            zEquals = false;
        }
        if (zEquals) {
            return;
        }
        Intent intent = new Intent(f94.a(), (Class<?>) AuthenticationTokenManager$CurrentAuthenticationTokenChangedBroadcastReceiver.class);
        intent.setAction("com.facebook.sdk.ACTION_CURRENT_AUTHENTICATION_TOKEN_CHANGED");
        intent.putExtra("com.facebook.sdk.EXTRA_OLD_AUTHENTICATION_TOKEN", ce0Var2);
        intent.putExtra("com.facebook.sdk.EXTRA_NEW_AUTHENTICATION_TOKEN", ce0Var);
        ((iq1) m50Var.b).O(intent);
    }

    public static final void i(kf kfVar, m45 m45Var, m45 m45Var2, m45 m45Var3, e9d e9dVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1365943499);
        int i3 = i2 | (p65Var2.f(kfVar) ? 4 : 2) | (p65Var2.h(m45Var) ? 32 : 16) | (p65Var2.h(m45Var2) ? 256 : 128) | (p65Var2.h(m45Var3) ? 2048 : 1024) | (p65Var2.f(e9dVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            er7.d(kfVar.b, m45Var, r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-415686915, new fd3(pv6.a(p65Var2), (Object) kfVar, (Object) e9dVar, (Object) m45Var2, 14), p65Var2), p65Var2, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 >> 9) & 896), PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z = (i3 & 7168) == 2048;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new qe(m45Var3, null, i4);
                p65Var.j0(objM);
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 1, r28Var, kfVar, m45Var, m45Var2, m45Var3, e9dVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01a6  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x01be  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x01d0 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0221  */
    /* JADX WARN: Removed duplicated region for block: B:159:0x0225  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x02d7  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x02eb A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:248:0x02ef  */
    /* JADX WARN: Removed duplicated region for block: B:271:0x0107 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x0172 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:298:0x01d7 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0156  */
    /* JADX WARN: Type inference failed for: r7v10 */
    /* JADX WARN: Type inference failed for: r7v11 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v18 */
    /* JADX WARN: Type inference failed for: r7v20 */
    /* JADX WARN: Type inference failed for: r7v21 */
    /* JADX WARN: Type inference failed for: r7v22, types: [boolean] */
    /* JADX WARN: Type inference failed for: r7v23 */
    /* JADX WARN: Type inference failed for: r7v24 */
    /* JADX WARN: Type inference failed for: r7v25 */
    /* JADX WARN: Type inference failed for: r7v26, types: [java.io.ByteArrayOutputStream, java.io.OutputStream] */
    /* JADX WARN: Type inference failed for: r7v27, types: [int] */
    /* JADX WARN: Type inference failed for: r7v28 */
    /* JADX WARN: Type inference failed for: r7v29 */
    /* JADX WARN: Type inference failed for: r7v34 */
    /* JADX WARN: Type inference failed for: r7v35 */
    /* JADX WARN: Type inference failed for: r7v4 */
    /* JADX WARN: Type inference failed for: r7v41 */
    /* JADX WARN: Type inference failed for: r7v42 */
    /* JADX WARN: Type inference failed for: r7v43 */
    /* JADX WARN: Type inference failed for: r7v44 */
    /* JADX WARN: Type inference failed for: r7v45 */
    /* JADX WARN: Type inference failed for: r7v46 */
    /* JADX WARN: Type inference failed for: r7v47 */
    /* JADX WARN: Type inference failed for: r7v48 */
    /* JADX WARN: Type inference failed for: r7v49 */
    /* JADX WARN: Type inference failed for: r7v5, types: [java.io.FileInputStream, java.io.InputStream] */
    /* JADX WARN: Type inference failed for: r7v50 */
    /* JADX WARN: Type inference failed for: r7v51 */
    /* JADX WARN: Type inference failed for: r7v52 */
    /* JADX WARN: Type inference failed for: r7v53 */
    /* JADX WARN: Type inference failed for: r7v54 */
    /* JADX WARN: Type inference failed for: r7v55 */
    /* JADX WARN: Type inference failed for: r7v56 */
    /* JADX WARN: Type inference failed for: r7v57 */
    /* JADX WARN: Type inference failed for: r7v58 */
    /* JADX WARN: Type inference failed for: r7v59 */
    /* JADX WARN: Type inference failed for: r7v6 */
    /* JADX WARN: Type inference failed for: r7v7 */
    /* JADX WARN: Type inference failed for: r7v8 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /* JADX WARN: Type inference failed for: r9v8, types: [boolean] */
    /* JADX WARN: Type inference failed for: r9v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void i0(android.content.Context r18, java.util.concurrent.Executor r19, defpackage.u2a r20, boolean r21) {
        /*
            Method dump skipped, instruction units count: 766
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.i0(android.content.Context, java.util.concurrent.Executor, u2a, boolean):void");
    }

    public static final void j(be3 be3Var, zm7 zm7Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1547871611);
        int i4 = 2;
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(be3Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(zm7Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(x45Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var = p65Var2;
            pr7.b(r28Var, pxf.E(924181119, new l23(6, zm7Var), p65Var2), null, null, null, 0, 0L, 0L, null, pxf.E(-1604383734, new nh(be3Var, x45Var, zm7Var, i4), p65Var2), p65Var, ((i3 >> 9) & 14) | 805306416, 508);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 16, be3Var, zm7Var, x45Var, r28Var);
        }
    }

    public static Provider j0() {
        for (int i2 = 0; i2 < 3; i2++) {
            Provider provider = Security.getProvider(o[i2]);
            if (provider != null) {
                return provider;
            }
        }
        return null;
    }

    public static final void k(String str, zm7 zm7Var, r28 r28Var, ce3 ce3Var, x12 x12Var, int i2) {
        ce3 ce3Var2;
        int i3;
        ce3 ce3Var3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1348137044);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(zm7Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new mb(str, 14);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    ce3Var3 = (ce3) to7.z(n1b.a.b(ce3.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                ce3Var3 = ce3Var;
            }
            p65Var.q();
            be3 be3Var = (be3) guc.z(ce3Var3.g, p65Var, 0).getValue();
            boolean zH = p65Var.h(ce3Var3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                k0 k0Var = new k0(1, ce3Var3, ce3.class, "onFrequencyChanged", "onFrequencyChanged(Lcom/medium/android/data/settings/Frequency;)V", 0, 12);
                p65Var.j0(k0Var);
                objM2 = k0Var;
            }
            j(be3Var, zm7Var, (x45) ((qh6) objM2), r28Var, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 3) & 7168));
            ce3Var2 = ce3Var3;
        } else {
            p65Var.S();
            ce3Var2 = ce3Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new adf(str, zm7Var, r28Var, ce3Var2, i2);
        }
    }

    public static final void l(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-339373523);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            jjd.b(vo7.R(p65Var, com.medium.reader.R.string.email_notification), new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).l, p65Var, 0, 0, 131068);
            p65Var = p65Var;
            qv5.b(vn7.J(com.medium.reader.R.drawable.ic_arrow_external_24, 0, p65Var), null, null, ((zo7) p65Var.j(kt7.b)).o, p65Var, 56, 4);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 16);
        }
    }

    public static final void m(uce uceVar, zbe zbeVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object k8eVar;
        float f2;
        uce uceVar2 = uceVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(128187268);
        int i3 = i2 | (p65Var.f(uceVar2) ? 4 : 2) | (p65Var.f(zbeVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            uceVar2 = uceVar;
            b24 b24Var = uceVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                k8eVar = new k8e(0, zbeVar, pbe.class, "onRefresh", "onRefresh()V", 0, 3);
                p65Var.j0(k8eVar);
            } else {
                k8eVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) k8eVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 15, uceVar2, zbeVar, r28Var);
        }
    }

    public static final void n(nc4 nc4Var, xb4 xb4Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-722531262);
        int i3 = i2 | (p65Var.f(nc4Var) ? 4 : 2) | (p65Var.f(xb4Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            String str = null;
            if (!g76.L(nc4Var, lc4.a) && !g76.L(nc4Var, mc4.a)) {
                if (!(nc4Var instanceof kc4)) {
                    ygf.a();
                    return;
                }
                str = ((kc4) nc4Var).a;
            }
            String str2 = str;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                hq3 hq3Var = new hq3(0, xb4Var, xb4.class, "onClose", "onClose()V", 0, 27);
                p65Var.j0(hq3Var);
                objM = hq3Var;
            }
            o28 o28Var = o28.b;
            qk7.g(o28Var, str2, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 6, 504);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 10, nc4Var, xb4Var, r28Var2);
        }
    }

    public static final void o(kc4 kc4Var, xb4 xb4Var, s26 s26Var, r28 r28Var, x12 x12Var, int i2) {
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-669469336);
        int i3 = i2 | (p65Var.f(kc4Var) ? 4 : 2) | (p65Var.f(xb4Var) ? 32 : 16) | (p65Var.f(s26Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            boolean z = (i3 & 14) == 4;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = z | (i4 == 32) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (z2 || objM2 == uobVar) {
                iu iuVar = new iu(kc4Var, xb4Var, l78Var2, s26Var, 6);
                l78Var = l78Var2;
                p65Var.j0(iuVar);
                objM2 = iuVar;
            } else {
                l78Var = l78Var2;
            }
            k40.t(r28Var, kv6VarA, null, null, null, null, false, null, (x45) objM2, p65Var, (i3 >> 9) & 14, 508);
            boolean zF = p65Var.f(kv6VarA) | (i4 == 32);
            Object objM3 = p65Var.M();
            if (zF || objM3 == uobVar) {
                objM3 = new ku2(kv6VarA, xb4Var, l78Var, null, 14);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, kv6VarA);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 2, r28Var, (Object) kc4Var, (Object) xb4Var, (Object) s26Var);
        }
    }

    public static final void p(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1638513820);
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
            iq7.b(iy0.a.a(o28Var, z46.e), null, null, null, null, null, null, p65Var, 0, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 23);
        }
    }

    public static final void r(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-810229468);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).o;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            sn3 sn3Var = jt7.c;
            ok7.s(0.6f, 432, 0, j2, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), ((bu7) p65Var.j(sn3Var)).h);
            ok7.s(0.3f, 432, 0, j2, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), ((bu7) lv8.n(o28Var, 24.0f, p65Var, sn3Var)).n);
            ok7.s(0.1f, 432, 0, j2, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).f);
            ok7.s(1.0f, 432, 0, j2, p65Var, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), ((bu7) lv8.n(o28Var, 4.0f, p65Var, sn3Var)).n);
            lv8.y(o28Var, 40.0f, p65Var, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 24);
        }
    }

    public static final void s(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-737384976);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
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
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            o28 o28Var = o28.b;
            r(m40.V(o28Var, p65Var, 6), p65Var, 0);
            dy0.a(flb.a0(m40.V(r40.y(jfc.e(jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f), 38.0f), bmb.a), p65Var, 0), ((zo7) p65Var.j(kt7.b)).o, rv8.r), p65Var, 0);
            p65Var.Y(-159160253);
            for (int i5 = 0; i5 < 10; i5++) {
                g01.e(null, p65Var, 0);
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 22);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008b  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void t(defpackage.nc4 r22, defpackage.nhc r23, defpackage.xb4 r24, defpackage.s26 r25, defpackage.r28 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 266
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.t(nc4, nhc, xb4, s26, r28, x12, int, int):void");
    }

    public static final void u(String str, String str2, rz2 rz2Var, r28 r28Var, uc4 uc4Var, x12 x12Var, int i2) {
        uc4 uc4Var2;
        uc4 uc4Var3;
        int i3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(983622258);
        int i4 = 2;
        int i5 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(rz2Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i5 & 1, (i5 & 9363) != 9362)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean z = ((i5 & 14) == 4) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    uc4Var3 = (uc4) to7.z(n1b.a.b(uc4.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i5 & (-57345);
                }
            } else {
                p65Var.S();
                i3 = i5 & (-57345);
                uc4Var3 = uc4Var;
            }
            p65Var.q();
            int i7 = 23;
            t((nc4) guc.z(uc4Var3.p, p65Var, 0).getValue(), mk7.F(p65Var), new xb4(rz2Var, uc4Var3), new s26(rz2Var, i7, str), r28Var, p65Var, 57344 & (i3 << 3), 0);
            boolean zH = p65Var.h(uc4Var3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                objM2 = new z8(uc4Var3, null, i7);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            uc4Var2 = uc4Var3;
        } else {
            p65Var.S();
            uc4Var2 = uc4Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(str, str2, rz2Var, r28Var, uc4Var2, i2, 19);
        }
    }

    public static final void w(kc4 kc4Var, xb4 xb4Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        int i3;
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1959219319);
        int i5 = i2 | (p65Var.f(kc4Var) ? 4 : 2) | (p65Var.f(xb4Var) ? 32 : 16) | 384;
        if (p65Var.P(i5 & 1, (i5 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            zk7 zk7VarC = dy0.c(z46.d, false);
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
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            int i7 = yb4.a[kc4Var.g.ordinal()];
            if (i7 == 1) {
                i3 = 2143170862;
                i4 = com.medium.reader.R.string.common_sort_latest;
            } else {
                if (i7 != 2) {
                    throw ho2.L(p65Var, 2143167802, false);
                }
                i3 = 2143174542;
                i4 = com.medium.reader.R.string.common_sort_oldest;
            }
            nwb nwbVar = new nwb(km4.w(p65Var, i3, i4, p65Var, false));
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new vs(l78Var, 27);
                p65Var.j0(objM2);
            }
            tr7.a(nwbVar, (m45) objM2, bgf.N(o28Var, "featured_posts_sort_filter"), 0L, 0, 0, 0, p65Var, 48, 120);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new vs(l78Var, 28);
                p65Var.j0(objM3);
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(-1842825880, new nh(kc4Var, xb4Var, l78Var, 24), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 11, kc4Var, xb4Var, r28Var2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:166:0x0322  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x0333  */
    /* JADX WARN: Removed duplicated region for block: B:171:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0106  */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r21v1, types: [n92] */
    /* JADX WARN: Type inference failed for: r21v10 */
    /* JADX WARN: Type inference failed for: r21v3 */
    /* JADX WARN: Type inference failed for: r21v4 */
    /* JADX WARN: Type inference failed for: r21v5, types: [java.lang.Boolean] */
    /* JADX WARN: Type inference failed for: r21v6 */
    /* JADX WARN: Type inference failed for: r21v8 */
    /* JADX WARN: Type inference failed for: r21v9 */
    /* JADX WARN: Type inference failed for: r24v0 */
    /* JADX WARN: Type inference failed for: r24v1, types: [p65] */
    /* JADX WARN: Type inference failed for: r24v2 */
    /* JADX WARN: Type inference failed for: r7v1, types: [p65, x12] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void x(final defpackage.wu4 r28, final defpackage.it4 r29, final defpackage.jt4 r30, defpackage.r28 r31, defpackage.r28 r32, defpackage.r28 r33, defpackage.vu4 r34, long r35, defpackage.x12 r37, final int r38, final int r39) {
        /*
            Method dump skipped, instruction units count: 835
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.x(wu4, it4, jt4, r28, r28, r28, vu4, long, x12, int, int):void");
    }

    public static final void y(final String str, final String str2, final jt4 jt4Var, cg8 cg8Var, final SourceParameter sourceParameter, final m45 m45Var, x12 x12Var, int i2) {
        p65 p65Var;
        int i3;
        int i4;
        boolean z;
        boolean z2;
        p65 p65Var2;
        uob uobVar;
        boolean z3;
        Object obj;
        uob uobVar2;
        int i5;
        String str3;
        int i6;
        p65 p65Var3;
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(2083083593);
        int i7 = i2 | (p65Var4.f(str) ? 4 : 2) | (p65Var4.f(str2) ? 32 : 16) | (p65Var4.f(jt4Var) ? 256 : 128) | (p65Var4.f(cg8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var4.f(sourceParameter) ? 16384 : 8192);
        if (p65Var4.P(i7 & 1, (74899 & i7) != 74898)) {
            final String strA = cg8Var.a();
            boolean z4 = cg8Var instanceof bg8;
            uob uobVar3 = w12.a;
            if (str2 != null) {
                p65Var4.Y(-838586590);
                String strR = vo7.R(p65Var4, com.medium.reader.R.string.follow_subscribe_email_notifications_on);
                boolean z5 = !z4;
                int i8 = i7 & 896;
                int i9 = i7 & 14;
                boolean z6 = (i8 == 256) | (i9 == 4);
                int i10 = i7 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                boolean zF = z6 | (i10 == 32) | p65Var4.f(strA);
                int i11 = i7 & 57344;
                boolean z7 = zF | (i11 == 16384);
                Object objM = p65Var4.M();
                if (z7 || objM == uobVar3) {
                    z3 = z4;
                    final int i12 = 0;
                    uobVar2 = uobVar3;
                    i5 = i8;
                    obj = new m45() { // from class: ft4
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i13 = i12;
                            c1e c1eVar = c1e.a;
                            m45 m45Var2 = m45Var;
                            SourceParameter sourceParameter2 = sourceParameter;
                            String str4 = strA;
                            String str5 = str2;
                            String str6 = str;
                            jt4 jt4Var2 = jt4Var;
                            switch (i13) {
                                case 0:
                                    jt4Var2.O(sourceParameter2, str6, str5, str4);
                                    m45Var2.invoke();
                                    return c1eVar;
                                default:
                                    if (str4 == null) {
                                        ay0.e("Newsletter ID cannot be null");
                                        return null;
                                    }
                                    jt4Var2.L(sourceParameter2, str6, str5, str4);
                                    m45Var2.invoke();
                                    return c1eVar;
                            }
                        }
                    };
                    str3 = strA;
                    p65Var4.j0(obj);
                } else {
                    z3 = z4;
                    obj = objM;
                    uobVar2 = uobVar3;
                    i5 = i8;
                    str3 = strA;
                }
                boolean z8 = z3;
                z(com.medium.reader.R.drawable.ic_notifications_plus_24, strR, z8, z5, (m45) obj, null, null, p65Var4, 0, 96);
                tp7.c(0.0f, 0, 7, 0L, p65Var4, null);
                String strR2 = vo7.R(p65Var4, com.medium.reader.R.string.follow_subscribe_email_notifications_off);
                boolean z9 = z8 && str3 != null;
                int i13 = i5;
                boolean zF2 = (i13 == 256) | (i9 == 4) | (i10 == 32) | p65Var4.f(str3) | (i11 == 16384);
                Object objM2 = p65Var4.M();
                uob uobVar4 = uobVar2;
                if (zF2 || objM2 == uobVar4) {
                    final String str4 = str3;
                    final int i14 = 1;
                    i6 = i13;
                    i3 = 4;
                    p65Var3 = p65Var4;
                    m45 m45Var2 = new m45() { // from class: ft4
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i132 = i14;
                            c1e c1eVar = c1e.a;
                            m45 m45Var22 = m45Var;
                            SourceParameter sourceParameter2 = sourceParameter;
                            String str42 = str4;
                            String str5 = str2;
                            String str6 = str;
                            jt4 jt4Var2 = jt4Var;
                            switch (i132) {
                                case 0:
                                    jt4Var2.O(sourceParameter2, str6, str5, str42);
                                    m45Var22.invoke();
                                    return c1eVar;
                                default:
                                    if (str42 == null) {
                                        ay0.e("Newsletter ID cannot be null");
                                        return null;
                                    }
                                    jt4Var2.L(sourceParameter2, str6, str5, str42);
                                    m45Var22.invoke();
                                    return c1eVar;
                            }
                        }
                    };
                    str3 = str4;
                    p65Var3.j0(m45Var2);
                    objM2 = m45Var2;
                } else {
                    p65Var3 = p65Var4;
                    i6 = i13;
                    i3 = 4;
                }
                p65 p65Var5 = p65Var3;
                z(com.medium.reader.R.drawable.ic_notifications_minus_24, strR2, z5, z9, (m45) objM2, null, null, p65Var5, 0, 96);
                z2 = z8;
                i4 = i7;
                uobVar = uobVar4;
                tp7.c(0.0f, 0, 7, 0L, p65Var5, null);
                p65Var2 = p65Var5;
                boolean zF3 = p65Var2.f(str3) | (i6 == 256) | (i11 == 16384);
                Object objM3 = p65Var2.M();
                if (zF3 || objM3 == uobVar) {
                    String str5 = str3;
                    lm1 lm1Var = new lm1(jt4Var, str5, sourceParameter, null, 6);
                    strA = str5;
                    p65Var2.j0(lm1Var);
                    objM3 = lm1Var;
                } else {
                    strA = str3;
                }
                kyd.k(p65Var2, (b55) objM3, c1e.a);
                z = false;
            } else {
                i3 = 4;
                i4 = i7;
                z = false;
                z2 = z4;
                p65Var2 = p65Var4;
                uobVar = uobVar3;
                p65Var2.Y(-847732551);
            }
            p65Var2.p(z);
            String strR3 = vo7.R(p65Var2, com.medium.reader.R.string.follow_subscribe_unfollow);
            jy8 jy8Var = h11.a;
            final boolean z10 = z2;
            long j2 = uu1.g;
            sn3 sn3Var = kt7.b;
            long j3 = ((zo7) p65Var2.j(sn3Var)).u;
            long j4 = ((zo7) p65Var2.j(sn3Var)).u;
            p65 p65Var6 = p65Var2;
            int i15 = i4;
            uob uobVar5 = uobVar;
            int i16 = i3;
            g11 g11VarA = h11.a(j2, j3, j2, j4, p65Var6, 0);
            boolean zG = ((i15 & 14) == i16 ? true : z) | ((i15 & 896) == 256 ? true : z) | p65Var6.g(z10) | p65Var6.f(strA) | ((i15 & 57344) != 16384 ? z : true);
            Object objM4 = p65Var6.M();
            if (zG || objM4 == uobVar5) {
                final String str6 = strA;
                m45 m45Var3 = new m45() { // from class: gt4
                    @Override // defpackage.m45
                    public final Object invoke() {
                        String str7;
                        boolean z11 = z10;
                        jt4 jt4Var2 = jt4Var;
                        String str8 = str;
                        SourceParameter sourceParameter2 = sourceParameter;
                        if (!z11 || (str7 = str6) == null) {
                            jt4Var2.U(str8, sourceParameter2);
                        } else {
                            jt4Var2.N(sourceParameter2, str7, str8);
                        }
                        m45Var.invoke();
                        return c1e.a;
                    }
                };
                p65Var6.j0(m45Var3);
                objM4 = m45Var3;
            }
            p65Var = p65Var6;
            z(com.medium.reader.R.drawable.ic_notifications_cancel_24, strR3, false, true, (m45) objM4, null, g11VarA, p65Var, 3456, 32);
        } else {
            p65Var = p65Var4;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(str, str2, jt4Var, cg8Var, sourceParameter, m45Var, i2, 8);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:38:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:69:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void z(final int r22, final java.lang.String r23, final boolean r24, final boolean r25, final defpackage.m45 r26, defpackage.r28 r27, defpackage.g11 r28, defpackage.x12 r29, final int r30, final int r31) {
        /*
            Method dump skipped, instruction units count: 325
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n01.z(int, java.lang.String, boolean, boolean, m45, r28, g11, x12, int, int):void");
    }

    public abstract String S();

    public Object V(int i2) {
        v66 v66VarP = X().p(i2);
        return v66VarP.c.getType().invoke(Integer.valueOf(i2 - v66VarP.a));
    }

    public abstract xp X();

    public Object Y(int i2) {
        Object objInvoke;
        v66 v66VarP = X().p(i2);
        int i3 = i2 - v66VarP.a;
        x45 key = v66VarP.c.getKey();
        return (key == null || (objInvoke = key.invoke(Integer.valueOf(i3))) == null) ? new e03(i2) : objInvoke;
    }

    public String toString() {
        switch (this.a) {
            case 27:
                return S();
            default:
                return super.toString();
        }
    }

    public static final void B(nza nzaVar, zx4 zx4Var, obe obeVar, cs1 cs1Var, e9d e9dVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        zx4 zx4Var2;
        obe obeVar2;
        cs1 cs1Var2;
        p65 p65Var;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1430232934);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(nzaVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            zx4Var2 = zx4Var;
            i3 |= p65Var2.f(zx4Var2) ? 32 : 16;
        } else {
            zx4Var2 = zx4Var;
        }
        if ((i2 & 384) == 0) {
            obeVar2 = obeVar;
            i3 |= p65Var2.f(obeVar2) ? 256 : 128;
        } else {
            obeVar2 = obeVar;
        }
        if ((i2 & 3072) == 0) {
            cs1Var2 = cs1Var;
            i3 |= p65Var2.f(cs1Var2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            cs1Var2 = cs1Var;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(e9dVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            boolean z2 = nzaVar.a;
            boolean z3 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z3 || objM == w12.a) {
                z = z2;
                gi4 gi4Var = new gi4(0, zx4Var2, zx4.class, "refresh", PdtluglzAX.sqRmHIWkk, 0, 19);
                p65Var2.j0(gi4Var);
                objM = gi4Var;
            } else {
                z = z2;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) objM), r28Var.b(jfc.c), null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1005683764, new g91(nzaVar, zx4Var, obeVar2, cs1Var2, e9dVar, 1), p65Var2), p65Var, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(nzaVar, zx4Var, obeVar, cs1Var, e9dVar, r28Var, i2, 3);
        }
    }

    public static final void L(ee7 ee7Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1131890088);
        int i3 = (p65Var2.f(ee7Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            c09 c09VarJ = vn7.J(com.medium.reader.R.drawable.ic_close_24, 0, p65Var2);
            String strR = vo7.R(p65Var2, com.medium.reader.R.string.common_close);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new ek5(0, ee7Var, ee7.class, "onBackPressed", ivbZv.qTeQnFptpbU, 0, 24);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, null, (m45) ((qh6) objM), null, c09VarJ, strR, 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_SPATIAL_QUALITY);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ce7(ee7Var, i2);
        }
    }

    public static final void q(kc4 kc4Var, r28 r28Var, x12 x12Var, int i2) {
        Object obj;
        String string;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(272914148);
        int i3 = i2 | (p65Var.f(kc4Var) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            String strN = y30.n(32.0f, com.medium.reader.R.string.featured_posts_header_title, p65Var, p65Var, o28Var);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            sn3 sn3Var = jt7.c;
            jjd.b(strN, r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).h, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            jjd.b(String.valueOf(kc4Var.b), w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).f, p65Var, 48, 0, 131068);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            hp7.t(p65Var, jfc.l(o28Var, 24.0f));
            int i6 = kc4Var.b;
            jjd.b(vo7.D(com.medium.reader.R.plurals.featured_stories_available_capitalized, i6, new Object[]{String.valueOf(i6)}, p65Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).n, p65Var, 0, 0, 131070);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            G(kc4Var, null, p65Var, i3 & 14);
            lv8.y(o28Var, 24.0f, p65Var, true);
            hp7.t(p65Var, jfc.l(o28Var, 4.0f));
            if (kc4Var.d) {
                string = km4.w(p65Var, -1502693653, com.medium.reader.R.string.featured_posts_header_maximum_number_of_featured_stories, p65Var, false);
            } else {
                p65Var.Y(-1502576225);
                Context context = (Context) p65Var.j(eo.b);
                Long l2 = kc4Var.f;
                if (l2 == null) {
                    ay0.e(ivbZv.ztgtu);
                    return;
                }
                long jLongValue = l2.longValue();
                context.getClass();
                long jCurrentTimeMillis = jLongValue - System.currentTimeMillis();
                if (jCurrentTimeMillis < 0) {
                    jCurrentTimeMillis = 0;
                }
                int i7 = in3.d;
                mn3 mn3Var = mn3.HOURS;
                if (jCurrentTimeMillis <= in3.d(hlg.T(1, mn3Var))) {
                    string = context.getString(com.medium.reader.R.string.featured_posts_header_next_featured_story_available_in_hour);
                    string.getClass();
                } else if (jCurrentTimeMillis <= in3.d(hlg.T(24, mn3Var))) {
                    int iJ = ((int) in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3Var)) + 1;
                    String quantityString = context.getResources().getQuantityString(com.medium.reader.R.plurals.n_hours, iJ, String.valueOf(iJ));
                    quantityString.getClass();
                    string = context.getString(com.medium.reader.R.string.featured_posts_header_next_featured_story_available_in_duration, quantityString);
                    string.getClass();
                } else {
                    int iJ2 = ((int) in3.j(hlg.U(jCurrentTimeMillis, mn3.MILLISECONDS), mn3.DAYS)) + 1;
                    String quantityString2 = context.getResources().getQuantityString(com.medium.reader.R.plurals.n_days, iJ2, String.valueOf(iJ2));
                    quantityString2.getClass();
                    string = context.getString(com.medium.reader.R.string.featured_posts_header_next_featured_story_available_in_duration, quantityString2);
                    string.getClass();
                }
                p65Var.p(false);
            }
            o28 o28Var2 = o28Var;
            jjd.b(string, w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).n, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 48, 0, 131068);
            p65Var = p65Var;
            lv8.y(o28Var2, 40.0f, p65Var, true);
            obj = o28Var2;
        } else {
            p65Var.S();
            obj = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(kc4Var, obj, i2, 25);
        }
    }
}
