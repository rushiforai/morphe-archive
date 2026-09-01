package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.credentials.exceptions.GetCredentialCustomException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.zxing.WriterException;
import com.medium.android.core.navigation.PublicationStatsReference;
import com.medium.reader.R;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ht2 {
    public static final mz1 b = new mz1(new p02(13), false, -1749853377);
    public static final mz1 c = new mz1(new p02(14), false, 231868018);
    public static final mz1 d = new mz1(new a02(28), false, -1613965877);
    public static final mz1 e;
    public static final mz1 f;
    public static final g g;
    public static final int[][] h;
    public static final int[][] i;
    public static final int[][] j;
    public static final int[][] k;
    public static final akg l;
    public static final d2f m;
    public static final byte[] n;
    public static final /* synthetic */ int o = 0;
    public static final /* synthetic */ int p = 0;
    public static final /* synthetic */ int q = 0;

    static {
        new mz1(new a02(29), false, 2063765236);
        e = new mz1(new c02(4), false, -1099886453);
        new mz1(new e02(0), false, -985248567);
        f = new mz1(new m02(14), false, 1431915013);
        g = new g(8);
        h = new int[][]{new int[]{1, 1, 1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 1, 1, 1, 0, 1}, new int[]{1, 0, 0, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1, 1, 1}};
        i = new int[][]{new int[]{1, 1, 1, 1, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 0, 1, 0, 1}, new int[]{1, 0, 0, 0, 1}, new int[]{1, 1, 1, 1, 1}};
        j = new int[][]{new int[]{-1, -1, -1, -1, -1, -1, -1}, new int[]{6, 18, -1, -1, -1, -1, -1}, new int[]{6, 22, -1, -1, -1, -1, -1}, new int[]{6, 26, -1, -1, -1, -1, -1}, new int[]{6, 30, -1, -1, -1, -1, -1}, new int[]{6, 34, -1, -1, -1, -1, -1}, new int[]{6, 22, 38, -1, -1, -1, -1}, new int[]{6, 24, 42, -1, -1, -1, -1}, new int[]{6, 26, 46, -1, -1, -1, -1}, new int[]{6, 28, 50, -1, -1, -1, -1}, new int[]{6, 30, 54, -1, -1, -1, -1}, new int[]{6, 32, 58, -1, -1, -1, -1}, new int[]{6, 34, 62, -1, -1, -1, -1}, new int[]{6, 26, 46, 66, -1, -1, -1}, new int[]{6, 26, 48, 70, -1, -1, -1}, new int[]{6, 26, 50, 74, -1, -1, -1}, new int[]{6, 30, 54, 78, -1, -1, -1}, new int[]{6, 30, 56, 82, -1, -1, -1}, new int[]{6, 30, 58, 86, -1, -1, -1}, new int[]{6, 34, 62, 90, -1, -1, -1}, new int[]{6, 28, 50, 72, 94, -1, -1}, new int[]{6, 26, 50, 74, 98, -1, -1}, new int[]{6, 30, 54, 78, 102, -1, -1}, new int[]{6, 28, 54, 80, 106, -1, -1}, new int[]{6, 32, 58, 84, 110, -1, -1}, new int[]{6, 30, 58, 86, 114, -1, -1}, new int[]{6, 34, 62, 90, 118, -1, -1}, new int[]{6, 26, 50, 74, 98, 122, -1}, new int[]{6, 30, 54, 78, 102, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, -1}, new int[]{6, 26, 52, 78, 104, NikonType2MakernoteDirectory.TAG_ADAPTER, -1}, new int[]{6, 30, 56, 82, 108, NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, -1}, new int[]{6, 34, 60, 86, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 138, -1}, new int[]{6, 30, 58, 86, 114, 142, -1}, new int[]{6, 34, 62, 90, 118, 146, -1}, new int[]{6, 30, 54, 78, 102, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, 150}, new int[]{6, 24, 50, 76, 102, 128, 154}, new int[]{6, 28, 54, 80, 106, NikonType2MakernoteDirectory.TAG_LENS, 158}, new int[]{6, 32, 58, 84, 110, 136, 162}, new int[]{6, 26, 54, 82, 110, 138, NikonType2MakernoteDirectory.TAG_DELETED_IMAGE_COUNT}, new int[]{6, 30, 58, 86, 114, 142, 170}};
        k = new int[][]{new int[]{8, 0}, new int[]{8, 1}, new int[]{8, 2}, new int[]{8, 3}, new int[]{8, 4}, new int[]{8, 5}, new int[]{8, 7}, new int[]{8, 8}, new int[]{7, 8}, new int[]{5, 8}, new int[]{4, 8}, new int[]{3, 8}, new int[]{2, 8}, new int[]{1, 8}, new int[]{0, 8}};
        l = new akg(new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0});
        m = new d2f(new tag(new long[]{0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0}), 24, new long[]{1, 0, 0, 0, 0, 0, 0, 0, 0, 0});
        n = new byte[]{-19, -45, -11, 92, 26, 99, 18, 88, -42, -100, -9, -94, -34, -7, -34, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 16};
    }

    public static final void A(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-399299037);
        int i3 = (p65Var.e(j2) ? 4 : 2) | i2 | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarA0 = flb.a0(jfc.d(o28Var, 1.0f), j2, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var, 48);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
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
            tp7.c(0.0f, 0, 7, 0L, p65Var, null);
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            kyd.g((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, j2, p65Var, null);
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(j2, r28Var2, i2, 20);
        }
    }

    public static final void A0(igc igcVar, int i2, Object obj) {
        int iG = igcVar.g(i2);
        Object[] objArr = igcVar.c;
        Object obj2 = objArr[iG];
        objArr[iG] = w12.a;
        if (obj == obj2) {
            return;
        }
        b22.a("Slot table is out of sync (expected " + obj + ", got " + obj2 + ')');
    }

    public static final void B(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-594678135);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(ff0Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(iv9Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, 6.0f, 2.0f, 0.0f, 0.0f, 12);
            wv1 wv1VarA = uv1.a(qb8.e, z46.p, p65Var, 6);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            m(ff0Var, iv9Var, null, p65Var, i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ye0(ff0Var, iv9Var, r28Var2, i2, 0);
        }
    }

    public static final void B0(int i2, int i3, List list) {
        int iL0 = l0(i2, list);
        if (iL0 < 0) {
            iL0 = -(iL0 + 1);
        }
        while (iL0 < list.size() && ((r76) list.get(iL0)).b < i3) {
        }
    }

    public static final void C(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(376431512);
        int i3 = (i2 & 6) == 0 ? (p65Var.f(r28Var) ? 4 : 2) | i2 : i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).c;
            r28 r28VarV = m40.V(bgf.N(r28Var.b(jfc.c), "loading_state"), p65Var, 0);
            rz5 rz5Var = qb8.c;
            wv1 wv1VarA = uv1.a(rz5Var, z46.p, p65Var, 0);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(jfc.d(o28Var, 1.0f).b(new sq6(1.0f, true)), "starter_packs_content");
            wv1 wv1VarA2 = uv1.a(rz5Var, z46.q, p65Var, 48);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            dy0.a(flb.a0(jfc.l(o28Var, 80.0f), j2, bmb.a), p65Var, 0);
            hp7.t(p65Var, jfc.e(o28Var, 12.0f));
            sn3 sn3Var = jt7.c;
            ok7.r(280.0f, 48, 4, j2, p65Var, null, ((bu7) p65Var.j(sn3Var)).E);
            hp7.t(p65Var, jfc.e(o28Var, 16.0f));
            ok7.r(260.0f, 48, 4, j2, p65Var, null, ((bu7) p65Var.j(sn3Var)).l);
            hp7.t(p65Var, jfc.e(o28Var, 32.0f));
            p65Var.Y(15278188);
            for (int i6 = 0; i6 < 3; i6++) {
                O(0, j2, p65Var, null);
            }
            p65Var.p(false);
            p65Var.p(true);
            A(0, j2, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i2, 16);
        }
    }

    public static final Object C0(File file, Object obj, f66 f66Var, x45 x45Var) {
        try {
            return x45Var.invoke(file);
        } catch (SecurityException e2) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 4), e2, 48);
            return obj;
        } catch (Exception e3) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 5), e3, 48);
            return obj;
        }
    }

    public static final void D(r28 r28Var, final gz8 gz8Var, final hy8 hy8Var, final hw8 hw8Var, final iic iicVar, final boolean z, final fx8 fx8Var, final z46 z46Var, zc8 zc8Var, final zq0 zq0Var, final hpe hpeVar, final mz1 mz1Var, x12 x12Var, final int i2, final int i3) {
        int i4;
        int i5;
        zc8 zc8Var2;
        r28 r28Var2;
        p65 p65Var;
        int i6;
        int i7;
        hw8 hw8Var2;
        ti6 ti6Var;
        r28 r28VarY;
        yq0 yq0Var = z46.q;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-572816025);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.f(r28Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.f(gz8Var) ? 32 : 16;
        }
        int i8 = i4;
        if ((i2 & 384) == 0) {
            i8 |= p65Var2.f(hy8Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i8 |= p65Var2.g(false) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i8 |= p65Var2.d(hw8Var.ordinal()) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        int i9 = i2 & 196608;
        int i10 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (i9 == 0) {
            i8 |= p65Var2.f(iicVar) ? 131072 : 65536;
        }
        if ((i2 & 1572864) == 0) {
            i8 |= p65Var2.g(z) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i8 |= p65Var2.f(fx8Var) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i8 |= p65Var2.d(0) ? 67108864 : 33554432;
        }
        if ((i2 & 805306368) == 0) {
            i8 |= p65Var2.c(0.0f) ? 536870912 : 268435456;
        }
        if ((i3 & 6) == 0) {
            i5 = i3 | (p65Var2.f(z46Var) ? 4 : 2);
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.h(zc8Var) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var2.h(null) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i5 |= p65Var2.f(yq0Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            i5 |= p65Var2.f(zq0Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((i3 & 196608) == 0) {
            if (p65Var2.f(hpeVar)) {
                i10 = 131072;
            }
            i5 |= i10;
        }
        if ((i3 & 1572864) == 0) {
            i5 |= p65Var2.h(mz1Var) ? 1048576 : 524288;
        }
        int i11 = i5;
        if (p65Var2.P(i8 & 1, ((i8 & 306783379) == 306783378 && (599187 & i11) == 599186) ? false : true)) {
            int i12 = i8 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i12 == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new wx4(gz8Var, 1);
                p65Var2.j0(objM);
            }
            m45 m45Var = (m45) objM;
            int i13 = i8 >> 3;
            int i14 = i13 & 14;
            int i15 = i11 >> 15;
            int i16 = i14 | (i15 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i11 & 896);
            l78 l78VarY = qo7.y(mz1Var, p65Var2);
            l78 l78VarY2 = qo7.y(null, p65Var2);
            boolean zF = ((((i16 & 14) ^ 6) > 4 && p65Var2.f(gz8Var)) || (i16 & 6) == 4) | p65Var2.f(l78VarY) | p65Var2.f(l78VarY2) | p65Var2.f(m45Var);
            Object objM2 = p65Var2.M();
            if (zF || objM2 == uobVar) {
                uob uobVar2 = uob.g;
                i16 i16Var = new i16(l78VarY, l78VarY2, m45Var, 1);
                vwa vwaVar = bjc.a;
                objM2 = new kv4(0, 6, upc.class, new j83(new ps5(new j83(i16Var, uobVar2), 4, gz8Var), uobVar2), "value", "getValue()Ljava/lang/Object;");
                p65Var2.j0(objM2);
            }
            ti6 ti6Var2 = (ti6) objM2;
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var2);
                p65Var2.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean z3 = i12 == 32;
            Object objM4 = p65Var2.M();
            if (z3 || objM4 == uobVar) {
                objM4 = new wx4(gz8Var, 2);
                p65Var2.j0(objM4);
            }
            m45 m45Var2 = (m45) objM4;
            int i17 = i8 >> 9;
            int i18 = (i8 & 65520) | (i17 & 458752) | (i17 & 3670016) | ((i11 << 21) & 29360128);
            int i19 = i11 << 15;
            int i20 = i18 | (i19 & 234881024) | (i19 & 1879048192);
            boolean zF2 = ((((i20 & 234881024) ^ 100663296) > 67108864 && p65Var2.f(yq0Var)) || (i20 & 100663296) == 67108864) | ((((i20 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && p65Var2.f(gz8Var)) || (i20 & 48) == 32) | ((((i20 & 896) ^ 384) > 256 && p65Var2.f(hy8Var)) || (i20 & 384) == 256) | ((((i20 & 7168) ^ 3072) > 2048 && p65Var2.g(false)) || (i20 & 3072) == 2048) | ((((57344 & i20) ^ 24576) > 16384 && p65Var2.d(hw8Var.ordinal())) || (i20 & 24576) == 16384) | ((((i20 & 1879048192) ^ 805306368) > 536870912 && p65Var2.f(zq0Var)) || (i20 & 805306368) == 536870912) | ((((i20 & 3670016) ^ 1572864) > 1048576 && p65Var2.c(0.0f)) || (i20 & 1572864) == 1048576) | ((((i20 & 29360128) ^ 12582912) > 8388608 && p65Var2.f(z46Var)) || (i20 & 12582912) == 8388608) | ((((i15 & 14) ^ 6) > 4 && p65Var2.f(hpeVar)) || (i15 & 6) == 4) | p65Var2.f(m45Var2) | ((((i20 & 458752) ^ 196608) > 131072 && p65Var2.d(0)) || (i20 & 196608) == 131072) | p65Var2.f(sb2Var);
            Object objM5 = p65Var2.M();
            if (zF2 || objM5 == uobVar) {
                i6 = 4;
                p65Var = p65Var2;
                i7 = 32;
                hw8Var2 = hw8Var;
                objM5 = new xy8(gz8Var, hw8Var2, hy8Var, z46Var, ti6Var2, m45Var2, zq0Var, hpeVar, sb2Var);
                ti6Var = ti6Var2;
                p65Var.j0(objM5);
            } else {
                i6 = 4;
                p65Var = p65Var2;
                ti6Var = ti6Var2;
                i7 = 32;
                hw8Var2 = hw8Var;
            }
            xt6 xt6Var = (xt6) objM5;
            hw8 hw8Var3 = hw8.Vertical;
            boolean z4 = hw8Var2 == hw8Var3;
            boolean zG = (((i14 ^ 6) > i6 && p65Var.f(gz8Var)) || (i13 & 6) == i6) | p65Var.g(z4);
            Object objM6 = p65Var.M();
            if (zG || objM6 == uobVar) {
                objM6 = new lu6(gz8Var, z4);
                p65Var.j0(objM6);
            }
            ku6 ku6Var = (ku6) objM6;
            boolean z5 = ((i8 & 458752) == 131072) | (i12 == i7);
            Object objM7 = p65Var.M();
            if (z5 || objM7 == uobVar) {
                objM7 = new lz8(iicVar, gz8Var);
                p65Var.j0(objM7);
            }
            lz8 lz8Var = (lz8) objM7;
            xy0 xy0Var = (xy0) p65Var.j(yy0.a);
            ip6 ip6Var = (ip6) p65Var.j(z22.n);
            p65Var.Y(-853904960);
            boolean zF3 = (i12 == i7) | p65Var.f(xy0Var) | p65Var.d(ip6Var.ordinal());
            Object objM8 = p65Var.M();
            if (zF3 || objM8 == uobVar) {
                objM8 = new py8(gz8Var, xy0Var, ip6Var);
                p65Var.j0(objM8);
            }
            py8 py8Var = (py8) objM8;
            p65Var.p(false);
            o28 o28Var = o28.b;
            if (z) {
                p65Var.Y(-853484445);
                int i21 = i14 | ((i8 >> 21) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                boolean z6 = ((((i21 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > i7 && p65Var.d(0)) || (i21 & 48) == i7) | ((((i21 & 14) ^ 6) > i6 && p65Var.f(gz8Var)) || (i21 & 6) == i6);
                Object objM9 = p65Var.M();
                if (z6 || objM9 == uobVar) {
                    objM9 = new oy8(gz8Var);
                    p65Var.j0(objM9);
                }
                r28VarY = bo.Y((oy8) objM9, gz8Var.w, hw8Var2);
                p65Var.p(false);
            } else {
                p65Var.Y(-853054661);
                p65Var.p(false);
                r28VarY = o28Var;
            }
            r28Var2 = r28Var;
            r28 r28VarH = r40.H(r28Var2.b(gz8Var.z).b(gz8Var.x), ti6Var, ku6Var, hw8Var2, z);
            r28 r28VarB = pxf.G((z ? r28VarH.b(wxb.a(o28Var, false, new rb(gz8Var, sb2Var, hw8Var2 == hw8Var3, 3))) : r28VarH.b(o28Var)).b(r28VarY), gz8Var, hw8Var2, fx8Var, z, lz8Var, gz8Var.p, py8Var).b(new q4d(gz8Var, null, new dp(1, gz8Var), 6));
            zc8Var2 = zc8Var;
            yi2.y(ti6Var, rv8.J(r28VarB, zc8Var2, null), gz8Var.u, xt6Var, p65Var, 0);
        } else {
            zc8Var2 = zc8Var;
            r28Var2 = r28Var;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final zc8 zc8Var3 = zc8Var2;
            final r28 r28Var3 = r28Var2;
            mwaVarS.d = new b55() { // from class: bu6
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    ht2.D(r28Var3, gz8Var, hy8Var, hw8Var, iicVar, z, fx8Var, z46Var, zc8Var3, zq0Var, hpeVar, mz1Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void D0(rg6 rg6Var) {
        v41 v41VarV;
        v41 v41VarX;
        if (rg6Var instanceof fi6) {
            fj6 fj6Var = (fj6) rg6Var;
            Field fieldJ = fo7.J(fj6Var);
            if (fieldJ != null) {
                fieldJ.setAccessible(true);
            }
            Method methodK = fo7.K(fj6Var.b());
            if (methodK != null) {
                methodK.setAccessible(true);
            }
            Method methodK2 = fo7.K(((fi6) rg6Var).c());
            if (methodK2 != null) {
                methodK2.setAccessible(true);
                return;
            }
            return;
        }
        if (rg6Var instanceof fj6) {
            fj6 fj6Var2 = (fj6) rg6Var;
            Field fieldJ2 = fo7.J(fj6Var2);
            if (fieldJ2 != null) {
                fieldJ2.setAccessible(true);
            }
            Method methodK3 = fo7.K(fj6Var2.b());
            if (methodK3 != null) {
                methodK3.setAccessible(true);
                return;
            }
            return;
        }
        if (rg6Var instanceof jj6) {
            Field fieldJ3 = fo7.J(((jj6) rg6Var).a());
            if (fieldJ3 != null) {
                fieldJ3.setAccessible(true);
            }
            Method methodK4 = fo7.K((qh6) rg6Var);
            if (methodK4 != null) {
                methodK4.setAccessible(true);
                return;
            }
            return;
        }
        if (rg6Var instanceof lj6) {
            Field fieldJ4 = fo7.J(((lj6) rg6Var).a());
            if (fieldJ4 != null) {
                fieldJ4.setAccessible(true);
            }
            Method methodK5 = fo7.K((qh6) rg6Var);
            if (methodK5 != null) {
                methodK5.setAccessible(true);
                return;
            }
            return;
        }
        if (!(rg6Var instanceof qh6)) {
            StringBuilder sb = new StringBuilder("Unknown callable: ");
            sb.append(rg6Var);
            Class<?> cls = rg6Var.getClass();
            sb.append(" (");
            sb.append(cls);
            sb.append(')');
            throw new UnsupportedOperationException(sb.toString());
        }
        qh6 qh6Var = (qh6) rg6Var;
        Method methodK6 = fo7.K(qh6Var);
        if (methodK6 != null) {
            methodK6.setAccessible(true);
        }
        vg6 vg6VarA = bpe.a(rg6Var);
        Object objB = (vg6VarA == null || (v41VarX = vg6VarA.x()) == null) ? null : v41VarX.b();
        AccessibleObject accessibleObject = objB instanceof AccessibleObject ? (AccessibleObject) objB : null;
        if (accessibleObject != null) {
            accessibleObject.setAccessible(true);
        }
        vg6 vg6VarA2 = bpe.a(qh6Var);
        Member memberB = (vg6VarA2 == null || (v41VarV = vg6VarA2.v()) == null) ? null : v41VarV.b();
        Constructor constructor = memberB instanceof Constructor ? (Constructor) memberB : null;
        if (constructor != null) {
            constructor.setAccessible(true);
        }
    }

    public static final void E(q9a q9aVar, kv6 kv6Var, e9a e9aVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        e9a e9aVar2;
        Object bo9Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-947141928);
        int i3 = i2 | (p65Var2.f(q9aVar) ? 4 : 2) | (p65Var2.f(kv6Var) ? 32 : 16) | (p65Var2.f(e9aVar) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = (q9aVar instanceof f9a) && ((f9a) q9aVar).f;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                bo9Var = new bo9(0, e9aVar, e9a.class, "onRefresh", "onRefresh()V", 0, 24);
                e9aVar2 = e9aVar;
                p65Var2.j0(bo9Var);
            } else {
                bo9Var = objM;
                e9aVar2 = e9aVar;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) bo9Var), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1268934774, new b9a(q9aVar, kv6Var, e9aVar2, i4), p65Var2), p65Var, (i3 >> 3) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            e9aVar2 = e9aVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 21, r28Var, (Object) q9aVar, (Object) kv6Var, (Object) e9aVar2);
        }
    }

    public static byte[] E0(dt2 dt2Var) {
        dt2Var.getClass();
        HashMap map = dt2Var.a;
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
            try {
                dataOutputStream.writeShort(-21521);
                dataOutputStream.writeShort(1);
                dataOutputStream.writeInt(map.size());
                for (Map.Entry entry : map.entrySet()) {
                    F0(dataOutputStream, (String) entry.getKey(), entry.getValue());
                }
                dataOutputStream.flush();
                if (dataOutputStream.size() > 10240) {
                    throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized");
                }
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                dataOutputStream.close();
                byteArray.getClass();
                return byteArray;
            } finally {
            }
        } catch (IOException e2) {
            d87.h().g(su2.a, "Error in Data#toByteArray: ", e2);
            return new byte[0];
        }
    }

    public static final void F(f9a f9aVar, kv6 kv6Var, e9a e9aVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        kv6 kv6Var2 = kv6Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1062842467);
        int i3 = i2 | (p65Var.f(f9aVar) ? 4 : 2) | (p65Var.f(kv6Var2) ? 32 : 16) | (p65Var.f(e9aVar) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarN = bgf.N(jfc.c, "pub_stats_content_state_list");
            int i4 = i3 & 896;
            boolean z = ((i3 & 14) == 4) | (i4 == 256);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new q58(f9aVar, 27, e9aVar);
                p65Var.j0(objM);
            }
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            k40.t(r28VarN, kv6Var2, null, null, null, null, false, null, (x45) objM, p65Var, i5, 508);
            kv6Var2 = kv6Var2;
            boolean z2 = (i5 == 32) | (i4 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z2 || objM2 == uobVar) {
                objM2 = new nx9(kv6Var2, e9aVar, n92Var, 3);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6Var2);
            boolean z3 = i4 == 256;
            Object objM3 = p65Var.M();
            if (z3 || objM3 == uobVar) {
                objM3 = new lo5(e9aVar, n92Var, 19);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = o28.b;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 20, r28Var2, (Object) f9aVar, (Object) kv6Var2, (Object) e9aVar);
        }
    }

    public static final void F0(DataOutputStream dataOutputStream, String str, Object obj) throws IOException {
        int i2;
        if (obj == null) {
            dataOutputStream.writeByte(0);
        } else if (obj instanceof Boolean) {
            dataOutputStream.writeByte(1);
            dataOutputStream.writeBoolean(((Boolean) obj).booleanValue());
        } else if (obj instanceof Byte) {
            dataOutputStream.writeByte(2);
            dataOutputStream.writeByte(((Number) obj).byteValue());
        } else if (obj instanceof Integer) {
            dataOutputStream.writeByte(3);
            dataOutputStream.writeInt(((Number) obj).intValue());
        } else if (obj instanceof Long) {
            dataOutputStream.writeByte(4);
            dataOutputStream.writeLong(((Number) obj).longValue());
        } else if (obj instanceof Float) {
            dataOutputStream.writeByte(5);
            dataOutputStream.writeFloat(((Number) obj).floatValue());
        } else if (obj instanceof Double) {
            dataOutputStream.writeByte(6);
            dataOutputStream.writeDouble(((Number) obj).doubleValue());
        } else if (obj instanceof String) {
            dataOutputStream.writeByte(7);
            dataOutputStream.writeUTF((String) obj);
        } else {
            if (!(obj instanceof Object[])) {
                z72.d("Unsupported value type ", n1b.a.b(obj.getClass()).j());
                return;
            }
            Object[] objArr = (Object[]) obj;
            Class<?> cls = objArr.getClass();
            s1b s1bVar = n1b.a;
            wg6 wg6VarB = s1bVar.b(cls);
            if (wg6VarB.equals(s1bVar.b(Boolean[].class))) {
                i2 = 8;
            } else if (wg6VarB.equals(s1bVar.b(Byte[].class))) {
                i2 = 9;
            } else if (wg6VarB.equals(s1bVar.b(Integer[].class))) {
                i2 = 10;
            } else if (wg6VarB.equals(s1bVar.b(Long[].class))) {
                i2 = 11;
            } else if (wg6VarB.equals(s1bVar.b(Float[].class))) {
                i2 = 12;
            } else if (wg6VarB.equals(s1bVar.b(Double[].class))) {
                i2 = 13;
            } else {
                if (!wg6VarB.equals(s1bVar.b(String[].class))) {
                    z72.d("Unsupported value type ", s1bVar.b(objArr.getClass()).d());
                    return;
                }
                i2 = 14;
            }
            dataOutputStream.writeByte(i2);
            dataOutputStream.writeInt(objArr.length);
            for (Object obj2 : objArr) {
                if (i2 == 8) {
                    Boolean bool = obj2 instanceof Boolean ? (Boolean) obj2 : null;
                    dataOutputStream.writeBoolean(bool != null ? bool.booleanValue() : false);
                } else if (i2 == 9) {
                    Byte b2 = obj2 instanceof Byte ? (Byte) obj2 : null;
                    dataOutputStream.writeByte(b2 != null ? b2.byteValue() : (byte) 0);
                } else if (i2 == 10) {
                    Integer num = obj2 instanceof Integer ? (Integer) obj2 : null;
                    dataOutputStream.writeInt(num != null ? num.intValue() : 0);
                } else if (i2 == 11) {
                    Long l2 = obj2 instanceof Long ? (Long) obj2 : null;
                    dataOutputStream.writeLong(l2 != null ? l2.longValue() : 0L);
                } else if (i2 == 12) {
                    Float f2 = obj2 instanceof Float ? (Float) obj2 : null;
                    dataOutputStream.writeFloat(f2 != null ? f2.floatValue() : 0.0f);
                } else if (i2 == 13) {
                    Double d2 = obj2 instanceof Double ? (Double) obj2 : null;
                    dataOutputStream.writeDouble(d2 != null ? d2.doubleValue() : 0.0d);
                } else if (i2 == 14) {
                    String str2 = obj2 instanceof String ? (String) obj2 : null;
                    if (str2 == null) {
                        str2 = "androidx.work.Data-95ed6082-b8e9-46e8-a73f-ff56f00f5d9d";
                    }
                    dataOutputStream.writeUTF(str2);
                }
            }
        }
        dataOutputStream.writeUTF(str);
    }

    public static final void G(b24 b24Var, e9a e9aVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        Object bo9Var;
        float f2;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-916674487);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(e9aVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var2 = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(o28Var2, "pub_stats_error_state"), 3, 1.0f);
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
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                f2 = 1.0f;
                o28Var = o28Var2;
                bo9Var = new bo9(0, e9aVar, e9a.class, "onRefresh", "onRefresh()V", 0, 26);
                p65Var.j0(bo9Var);
            } else {
                bo9Var = objM;
                o28Var = o28Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) bo9Var), null, p65Var, i3 & 14, 188);
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 9, b24Var, e9aVar, r28Var2);
        }
    }

    public static final x82 G0(zz3 zz3Var, k54 k54Var) {
        return new x82(zz3Var, k54Var, 0.0f, new mfc(cu.i));
    }

    public static final void H(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        ar0 ar0Var = z46.d;
        ar0 ar0Var2 = z46.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2013460513);
        int i3 = i2 | 6;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(m40.V(o28Var, p65Var, 6), "pub_stats_loading_state");
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
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
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            long j3 = ((zo7) p65Var.j(kt7.b)).c;
            sn3 sn3Var = kt7.a;
            r28 r28VarJ = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(ar0Var2, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
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
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            long j6 = j3;
            pr7.c(6, j6, p65Var, null, false);
            p65Var.p(true);
            p65Var.p(true);
            r28 r28VarJ2 = ka1.j((jp7) p65Var.j(sn3Var), o28Var, 3, 1.0f);
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
            long j7 = p65Var.T;
            int i7 = (int) (j7 ^ (j7 >>> 32));
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
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            r28 r28VarD2 = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var3 = ar0Var;
            zk7 zk7VarC4 = dy0.c(ar0Var3, false);
            o28 o28Var2 = o28Var;
            long j8 = p65Var.T;
            int i8 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC4);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            wy6.b(0, j6, p65Var, null);
            p65Var.p(true);
            p65Var.p(true);
            p65Var.Y(1846052913);
            int iR = 0;
            while (iR < 5) {
                o28 o28Var3 = o28Var2;
                r28 r28VarJ3 = ka1.j((jp7) p65Var.j(kt7.a), o28Var3, 3, 1.0f);
                zk7 zk7VarC5 = dy0.c(ar0Var2, false);
                long j9 = p65Var.T;
                int i9 = (int) (j9 ^ (j9 >>> 32));
                i89 i89VarL6 = p65Var.l();
                r28 r28VarR6 = gx1.R(p65Var, r28VarJ3);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar5 = q12.f;
                tp7.B(p65Var, cuVar5, zk7VarC5);
                cu cuVar6 = q12.e;
                tp7.B(p65Var, cuVar6, i89VarL6);
                Integer numValueOf2 = Integer.valueOf(i9);
                cu cuVar7 = q12.g;
                tp7.B(p65Var, cuVar7, numValueOf2);
                fn fnVar2 = q12.h;
                tp7.y(p65Var, fnVar2);
                cu cuVar8 = q12.d;
                tp7.B(p65Var, cuVar8, r28VarR6);
                r28 r28VarD3 = jfc.d(jfc.o(o28Var3, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC6 = dy0.c(ar0Var3, false);
                long j10 = j6;
                long j11 = p65Var.T;
                int i10 = (int) (j11 ^ (j11 >>> 32));
                i89 i89VarL7 = p65Var.l();
                r28 r28VarR7 = gx1.R(p65Var, r28VarD3);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar5, zk7VarC6);
                tp7.B(p65Var, cuVar6, i89VarL7);
                ka1.z(i10, p65Var, cuVar7, p65Var, fnVar2);
                tp7.B(p65Var, cuVar8, r28VarR7);
                j6 = j10;
                kk7.p(384, j6, p65Var, null, false);
                iR = wgd.r(p65Var, true, true, iR, 1);
                ar0Var3 = ar0Var3;
                o28Var2 = o28Var3;
            }
            r28Var2 = o28Var2;
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var2, i2, 3);
        }
    }

    public static final String H0(String str, ArrayList arrayList) {
        Object next;
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (tuc.G(((at5) next).a, str, true)) {
                break;
            }
        }
        at5 at5Var = (at5) next;
        if (at5Var != null) {
            return at5Var.b;
        }
        return null;
    }

    /* JADX WARN: Type inference failed for: r1v4 */
    /* JADX WARN: Type inference failed for: r1v5, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r1v7 */
    public static final void I(q9a q9aVar, e9a e9aVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        e9a e9aVar2;
        p65 p65Var;
        p65 p65Var2;
        int i4;
        ?? r1;
        upc upcVar;
        e9a e9aVar3;
        q9aVar.getClass();
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(1527919088);
        if ((i2 & 6) == 0) {
            i3 = (p65Var3.f(q9aVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= (i2 & 64) == 0 ? p65Var3.f(e9aVar) : p65Var3.h(e9aVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var3.f(r28Var) ? 256 : 128;
        }
        if (p65Var3.P(i3 & 1, (i3 & 147) != 146)) {
            w7c w7cVar = w7c.Hidden;
            Object objM = p65Var3.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new mr9(15);
                p65Var3.j0(objM);
            }
            v7c v7cVarJ = o7f.J(w7cVar, (x45) objM, p65Var3, 438, 0);
            mx0 mx0VarI = o7f.I(v7cVarJ, p65Var3, 2);
            kv6 kv6VarA = pv6.a(p65Var3);
            upc upcVarA = zu.a(nk7.o0(kv6VarA), null, "Scroll elevation", p65Var3, 384, 10);
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z = i5 == 32 || ((i3 & 64) != 0 && p65Var3.h(e9aVar));
            Object objM2 = p65Var3.M();
            if (z || objM2 == uobVar) {
                p65Var2 = p65Var3;
                i4 = i5;
                r1 = 0;
                upcVar = upcVarA;
                bo9 bo9Var = new bo9(0, e9aVar, e9a.class, "collapseEducational", "collapseEducational()V", 0, 27);
                e9aVar3 = e9aVar;
                p65Var2.j0(bo9Var);
                objM2 = bo9Var;
            } else {
                upcVar = upcVarA;
                p65Var2 = p65Var3;
                i4 = i5;
                r1 = 0;
                e9aVar3 = e9aVar;
            }
            qh6 qh6Var = (qh6) objM2;
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new mr9(16);
                p65Var2.j0(objM3);
            }
            r28 r28VarN = bgf.N(wxb.a(r28Var, r1, (x45) objM3), "pub_stats_screen");
            p65 p65Var4 = p65Var2;
            e9aVar2 = e9aVar3;
            vv2.i(pxf.E(-757561099, new so1(25, e9aVar3), p65Var2), r28VarN, r28Var, mx0VarI, 0.0f, null, 0L, 0L, 0.0f, (m45) qh6Var, null, false, pxf.E(1449477355, new se9(q9aVar, e9aVar3, upcVar, 10), p65Var2), null, 0L, 0L, pxf.E(1280228394, new b9a(q9aVar, kv6VarA, e9aVar3, r1), p65Var2), p65Var4, (i3 & 896) | 6, 12585984, 121840);
            p65Var = p65Var4;
            n92 n92Var = null;
            f9a f9aVar = q9aVar instanceof f9a ? (f9a) q9aVar : null;
            boolean z2 = f9aVar != null && f9aVar.c;
            Boolean boolValueOf = Boolean.valueOf(z2);
            boolean zG = p65Var.g(z2) | p65Var.f(v7cVarJ);
            Object objM4 = p65Var.M();
            if (zG || objM4 == uobVar) {
                objM4 = new wd0(z2, v7cVarJ, n92Var, 5);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, boolValueOf);
            boolean zF = p65Var.f(v7cVarJ) | (i4 == 32 || ((i3 & 64) != 0 && p65Var.h(e9aVar2)));
            Object objM5 = p65Var.M();
            if (zF || objM5 == uobVar) {
                objM5 = new nx9(v7cVarJ, e9aVar2, n92Var, 4);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, v7cVarJ);
        } else {
            e9aVar2 = e9aVar;
            p65Var = p65Var3;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i2, 16, q9aVar, e9aVar2, r28Var);
        }
    }

    public static byte[] I0(byte[] bArr) {
        MessageDigest messageDigest = (MessageDigest) wlf.c.a.a("SHA-512");
        messageDigest.update(bArr, 0, 32);
        byte[] bArrDigest = messageDigest.digest();
        bArrDigest[0] = (byte) (bArrDigest[0] & 248);
        int i2 = bArrDigest[31] & 127;
        bArrDigest[31] = (byte) i2;
        bArrDigest[31] = (byte) (i2 | 64);
        return bArrDigest;
    }

    public static final void J(PublicationStatsReference publicationStatsReference, String str, my6 my6Var, r28 r28Var, w9a w9aVar, x12 x12Var, int i2) {
        publicationStatsReference.getClass();
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1876056652);
        int i3 = (p65Var.h(publicationStatsReference) ? 4 : 2) | i2 | (p65Var.f(str) ? 32 : 16) | (p65Var.f(my6Var) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean zH = p65Var.h(publicationStatsReference) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (zH || objM == w12.a) {
                    objM = new q58(publicationStatsReference, 26, str);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                }
                w9aVar = (w9a) to7.z(n1b.a.b(w9a.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
            } else {
                p65Var.S();
            }
            int i4 = i3 & (-57345);
            p65Var.q();
            I((q9a) guc.z(w9aVar.n, p65Var, 0).getValue(), new e9a(my6Var, w9aVar), r28Var, p65Var, (i4 >> 3) & 896);
        } else {
            p65Var.S();
        }
        w9a w9aVar2 = w9aVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) publicationStatsReference, (Object) str, (Object) my6Var, r28Var, (que) w9aVar2, i2, 10);
        }
    }

    public static /* synthetic */ boolean J0(long[] jArr) {
        long[] jArr2 = new long[11];
        System.arraycopy(jArr, 0, jArr2, 0, 10);
        vv2.i0(jArr2);
        byte[] bArrM0 = vv2.m0(jArr2);
        for (int i2 = 0; i2 < 32; i2++) {
            if (bArrM0[i2] != 0) {
                return true;
            }
        }
        return false;
    }

    public static final void K(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        vv2 vv2Var;
        char c2;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(946212154);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(ff0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(iv9Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            kx kxVarW = ho2.w(p65Var2, -1223179887);
            cf0 cf0Var = ff0Var.e;
            vv2 vv2Var2 = ff0Var.h;
            if (cf0Var == null || !cf0Var.d) {
                vv2Var = vv2Var2;
                p65Var2.Y(1934677299);
                c2 = 0;
                p65Var2.p(false);
            } else {
                p65Var2.Y(1943796321);
                kxVarW.d(vo7.R(p65Var2, R.string.author_header_sent_as));
                kxVarW.d(" ");
                p65Var2.Y(2140916250);
                sn3 sn3Var = kt7.b;
                vv2Var = vv2Var2;
                wjd wjdVar = new wjd(new skc(((zo7) p65Var2.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), new skc(((zo7) p65Var2.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, ((zo7) p65Var2.j(sn3Var)).b, (ohd) null, (i3c) null, 63486), 6);
                boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var2.M();
                if (z2 || objM == w12.a) {
                    objM = new bf0(iv9Var, 0, ff0Var);
                    p65Var2.j0(objM);
                }
                kxVarW = kxVarW;
                int iV = ho2.v("cta_sent_as_newsletter", wjdVar, (e07) objM, kxVarW);
                try {
                    kxVarW.d(vo7.R(p65Var2, R.string.author_header_newsletter));
                    kxVarW.f(iV);
                    p65Var2.p(false);
                    kxVarW.d(vo7.R(p65Var2, R.string.author_header_read_time_date_separator));
                    p65Var2.p(false);
                    c2 = 0;
                } catch (Throwable th) {
                    kxVarW.f(iV);
                    throw th;
                }
            }
            Object[] objArr = new Object[1];
            objArr[c2] = String.valueOf(ff0Var.g);
            kxVarW.d(vo7.Q(R.string.author_header_read_time, objArr, p65Var2));
            vv2 vv2Var3 = vv2Var;
            if (g76.L(vv2Var3, df0.u)) {
                p65Var2.Y(1945087502);
                kxVarW.d(vo7.R(p65Var2, R.string.author_header_read_time_date_separator));
                kxVarW.d(vo7.R(p65Var2, R.string.common_draft));
                p65Var2.p(false);
                z = false;
            } else if (vv2Var3 instanceof ef0) {
                p65Var2.Y(1945320591);
                kxVarW.d(vo7.R(p65Var2, R.string.author_header_read_time_date_separator));
                kxVarW.d(vo7.T((Context) p65Var2.j(eo.b), ((ef0) vv2Var3).u));
                z = false;
                p65Var2.p(false);
            } else {
                z = false;
                p65Var2.Y(2140972019);
                p65Var2.p(false);
            }
            mx mxVarI = kxVarW.i();
            p65Var2.p(z);
            p65Var = p65Var2;
            jjd.c(mxVarI, w2g.G(r28Var, 4.0f, 2.0f, 0.0f, 0.0f, 12), 0L, 0L, 0L, null, 0L, 0, false, 0, 0, null, null, mkd.a(((bu7) p65Var2.j(jt7.c)).m, ((zo7) p65Var2.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 262140);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ye0(ff0Var, iv9Var, r28Var, i2, 1);
        }
    }

    public static void K0(d2f d2fVar, zjf zjfVar, akg akgVar) {
        tag tagVar = (tag) zjfVar.b;
        tag tagVar2 = (tag) d2fVar.b;
        long[] jArr = new long[10];
        long[] jArr2 = (long[]) tagVar2.a;
        long[] jArr3 = (long[]) tagVar.b;
        long[] jArr4 = (long[]) tagVar.a;
        vv2.f0(jArr2, jArr3, jArr4);
        long[] jArr5 = (long[]) tagVar2.b;
        vv2.g0(jArr5, jArr3, jArr4);
        vv2.j0(jArr5, jArr5, akgVar.b);
        long[] jArr6 = akgVar.a;
        long[] jArr7 = (long[]) tagVar2.c;
        vv2.j0(jArr7, jArr2, jArr6);
        long[] jArr8 = (long[]) d2fVar.c;
        vv2.j0(jArr8, (long[]) zjfVar.c, akgVar.c);
        akgVar.a(jArr2, (long[]) tagVar.c);
        vv2.f0(jArr, jArr2, jArr2);
        vv2.g0(jArr2, jArr7, jArr5);
        vv2.f0(jArr5, jArr7, jArr5);
        vv2.f0(jArr7, jArr, jArr8);
        vv2.g0(jArr8, jArr, jArr8);
    }

    public static final void L(dpc dpcVar, cpc cpcVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-881162070);
        int i3 = i2 | (p65Var.f(dpcVar) ? 4 : 2) | (p65Var.f(cpcVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            nr8 nr8Var = dpcVar.c;
            long j2 = uu1.b;
            sn3 sn3Var = kt7.a;
            ((jp7) p65Var.j(sn3Var)).getClass();
            boolean z = jp7.a(p65Var) == ip7.COMPACT;
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(sn3Var), w2g.G(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), 0.0f, 0.0f, 0.0f, 16.0f, 7), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
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
            r28 r28VarA0 = flb.a0(r40.y(jfc.d(o28Var, 1.0f), bmb.a(16.0f)), nr8Var.b, rv8.r);
            int i6 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i7 = i3 & 14;
            boolean z2 = (i6 == 32) | (i7 == 4);
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                objM = new zoc(cpcVar, dpcVar, 0);
                p65Var.j0(objM);
            }
            r28 r28VarD2 = w2g.D(hlg.r(r28VarA0, false, null, null, (m45) objM, 15), 24.0f, 16.0f);
            if (z) {
                p65Var.Y(-356487810);
                M(dpcVar, cpcVar, j2, nr8Var.c, r28VarD2, p65Var, i6 | i7 | 384);
                p65Var.p(false);
            } else {
                p65Var.Y(-356189280);
                N(dpcVar, cpcVar, j2, nr8Var.c, r28VarD2, p65Var, i7 | 384 | i6);
                p65Var.p(false);
            }
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 23, dpcVar, cpcVar, r28Var2);
        }
    }

    public static void L0(d2f d2fVar, zjf zjfVar, akg akgVar) {
        tag tagVar = (tag) zjfVar.b;
        tag tagVar2 = (tag) d2fVar.b;
        long[] jArr = new long[10];
        long[] jArr2 = (long[]) tagVar2.a;
        long[] jArr3 = (long[]) tagVar.b;
        long[] jArr4 = (long[]) tagVar.a;
        vv2.f0(jArr2, jArr3, jArr4);
        long[] jArr5 = (long[]) tagVar2.b;
        vv2.g0(jArr5, jArr3, jArr4);
        vv2.j0(jArr5, jArr5, akgVar.a);
        long[] jArr6 = akgVar.b;
        long[] jArr7 = (long[]) tagVar2.c;
        vv2.j0(jArr7, jArr2, jArr6);
        long[] jArr8 = (long[]) d2fVar.c;
        vv2.j0(jArr8, (long[]) zjfVar.c, akgVar.c);
        akgVar.a(jArr2, (long[]) tagVar.c);
        vv2.f0(jArr, jArr2, jArr2);
        vv2.g0(jArr2, jArr7, jArr5);
        vv2.f0(jArr5, jArr7, jArr5);
        vv2.g0(jArr7, jArr, jArr8);
        vv2.f0(jArr8, jArr, jArr8);
    }

    public static final void M(dpc dpcVar, cpc cpcVar, long j2, long j3, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        boolean z;
        cpc cpcVar2 = cpcVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1811258674);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dpcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cpcVar2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.e(j3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            h70 h70Var = new h70(4.0f, true, new z10(21));
            zq0 zq0Var = z46.n;
            omb ombVarA = nmb.a(h70Var, zq0Var, p65Var, 54);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
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
            jjd.b(dpcVar.b, bgf.N(o28Var, "starter_pack_card_" + dpcVar.a), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).j, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131068);
            Q(dpcVar.g, dpcVar.a, j2, p65Var, i3 & 896);
            p65Var = p65Var;
            ka1.B(p65Var, true, o28Var, 4.0f, p65Var);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            omb ombVarA2 = nmb.a(qb8.a, zq0Var, p65Var, 48);
            long j6 = p65Var.T;
            int i6 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (dpcVar.d.isEmpty()) {
                cpcVar2 = cpcVar;
                z = false;
                p65Var.Y(-854605215);
            } else {
                p65Var.Y(-842091042);
                rr7.i(dpcVar.d, null, 0, p65Var, 0, 6);
                hp7.t(p65Var, new sq6(1.0f, true));
                String str = dpcVar.a;
                boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == w12.a) {
                    cpcVar2 = cpcVar;
                    objM = new zoc(cpcVar2, dpcVar, 2);
                    p65Var.j0(objM);
                } else {
                    cpcVar2 = cpcVar;
                }
                P(str, j2, j3, (m45) objM, p65Var, (i3 >> 3) & PhotoshopDirectory.TAG_CAPTION);
                p65Var = p65Var;
                z = false;
            }
            p65Var.p(z);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new apc(dpcVar, cpcVar2, j2, j3, r28Var, i2, 1);
        }
    }

    public static void M0(d2f d2fVar, tag tagVar) {
        tag tagVar2 = (tag) d2fVar.b;
        long[] jArr = (long[]) tagVar2.a;
        long[] jArr2 = (long[]) tagVar.a;
        long[] jArr3 = new long[10];
        vv2.k0(jArr, jArr2);
        long[] jArr4 = (long[]) tagVar2.c;
        long[] jArr5 = (long[]) tagVar.b;
        vv2.k0(jArr4, jArr5);
        long[] jArr6 = (long[]) d2fVar.c;
        vv2.k0(jArr6, (long[]) tagVar.c);
        vv2.f0(jArr6, jArr6, jArr6);
        long[] jArr7 = (long[]) tagVar2.b;
        vv2.f0(jArr7, jArr2, jArr5);
        vv2.k0(jArr3, jArr7);
        vv2.f0(jArr7, jArr4, jArr);
        vv2.g0(jArr4, jArr4, jArr);
        vv2.g0(jArr, jArr3, jArr7);
        vv2.g0(jArr6, jArr6, jArr4);
    }

    public static final void N(dpc dpcVar, cpc cpcVar, long j2, long j3, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-941887014);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dpcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cpcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.e(j3) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            omb ombVarA = nmb.a(new h70(4.0f, true, new z10(21)), z46.n, p65Var, 54);
            long j4 = p65Var.T;
            int i4 = (int) (j4 ^ (j4 >>> 32));
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
            String str = dpcVar.b;
            mkd mkdVarA = mkd.a(((bu7) p65Var.j(jt7.c)).j, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            String str2 = "starter_pack_card_" + dpcVar.a;
            o28 o28Var = o28.b;
            r28 r28VarN = bgf.N(o28Var, str2);
            int i5 = 1;
            jjd.b(str, r28VarN, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 131068);
            if (dpcVar.d.isEmpty()) {
                p65Var.Y(-135015092);
                p65Var.p(false);
            } else {
                km4.F(4.0f, -121346913, p65Var, p65Var, o28Var);
                rr7.i(dpcVar.d, null, 0, p65Var, 0, 6);
                lv8.y(o28Var, 4.0f, p65Var, false);
            }
            Q(dpcVar.g, dpcVar.a, j2, p65Var, i3 & 896);
            hp7.t(p65Var, new sq6(1.0f, true));
            String str3 = dpcVar.a;
            boolean z = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new zoc(cpcVar, dpcVar, i5);
                p65Var.j0(objM);
            }
            P(str3, j2, j3, (m45) objM, p65Var, (i3 >> 3) & PhotoshopDirectory.TAG_CAPTION);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new apc(dpcVar, cpcVar, j2, j3, r28Var, i2, 0);
        }
    }

    public static int N0(int i2, int i3) {
        int i4 = (~(i2 ^ i3)) & 255;
        int i5 = i4 & (i4 << 4);
        int i6 = i5 & (i5 << 2);
        return (i6 & (i6 + i6)) >> 7;
    }

    public static final void O(int i2, long j2, x12 x12Var, r28 r28Var) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1600434357);
        int i3 = i2 | (p65Var.e(j2) ? 4 : 2) | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), w2g.G(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), 0.0f, 0.0f, 0.0f, 16.0f, 7), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
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
            hp7.t(p65Var, w2g.C(flb.a0(jfc.e(jfc.d(o28Var, 1.0f), 120.0f), j2, bmb.a(16.0f)), 24.0f));
            p65Var.p(true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(j2, r28Var2, i2, 19);
        }
    }

    public static void O0(akg akgVar, int i2, byte b2) {
        akg[][] akgVarArr = ekg.d;
        int i3 = (b2 & 255) >> 7;
        int i4 = (-i3) & b2;
        int i5 = b2 - (i4 + i4);
        akgVar.b(akgVarArr[i2][0], N0(i5, 1));
        akgVar.b(akgVarArr[i2][1], N0(i5, 2));
        akgVar.b(akgVarArr[i2][2], N0(i5, 3));
        akgVar.b(akgVarArr[i2][3], N0(i5, 4));
        akgVar.b(akgVarArr[i2][4], N0(i5, 5));
        akgVar.b(akgVarArr[i2][5], N0(i5, 6));
        akgVar.b(akgVarArr[i2][6], N0(i5, 7));
        akgVar.b(akgVarArr[i2][7], N0(i5, 8));
        long[] jArr = akgVar.c;
        long[] jArr2 = akgVar.a;
        long[] jArr3 = akgVar.b;
        long[] jArrCopyOf = Arrays.copyOf(jArr3, 10);
        long[] jArrCopyOf2 = Arrays.copyOf(jArr2, 10);
        long[] jArrCopyOf3 = Arrays.copyOf(jArr, 10);
        for (int i6 = 0; i6 < jArrCopyOf3.length; i6++) {
            jArrCopyOf3[i6] = -jArrCopyOf3[i6];
        }
        lk7.I(jArr2, jArrCopyOf, i3);
        lk7.I(jArr3, jArrCopyOf2, i3);
        lk7.I(jArr, jArrCopyOf3, i3);
    }

    public static final void P(final String str, final long j2, final long j3, final m45 m45Var, x12 x12Var, final int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1154899092);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(str) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.e(j2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j3) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.h(m45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(-1857099732, new qn8(str, j2, j3, m45Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: bpc
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).intValue();
                    ht2.P(str, j2, j3, m45Var, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static byte[] P0(byte[] bArr) {
        int i2;
        byte[] bArr2 = new byte[256];
        for (int i3 = 0; i3 < 256; i3++) {
            bArr2[i3] = (byte) (1 & ((bArr[i3 >> 3] & 255) >> (i3 & 7)));
        }
        for (int i4 = 0; i4 < 256; i4++) {
            if (bArr2[i4] != 0) {
                for (int i5 = 1; i5 <= 6 && (i2 = i4 + i5) < 256; i5++) {
                    byte b2 = bArr2[i2];
                    if (b2 != 0) {
                        byte b3 = bArr2[i4];
                        int i6 = b2 << i5;
                        int i7 = b3 + i6;
                        if (i7 <= 15) {
                            bArr2[i4] = (byte) i7;
                            bArr2[i2] = 0;
                        } else {
                            int i8 = b3 - i6;
                            if (i8 >= -15) {
                                bArr2[i4] = (byte) i8;
                                while (true) {
                                    if (i2 >= 256) {
                                        break;
                                    }
                                    if (bArr2[i2] == 0) {
                                        bArr2[i2] = 1;
                                        break;
                                    }
                                    bArr2[i2] = 0;
                                    i2++;
                                }
                            }
                        }
                    }
                }
            }
        }
        return bArr2;
    }

    public static final void Q(int i2, String str, long j2, x12 x12Var, int i3) {
        int i4;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1531601811);
        if ((i3 & 6) == 0) {
            i4 = (p65Var.d(i2) ? 4 : 2) | i3;
        } else {
            i4 = i3;
        }
        if ((i3 & 48) == 0) {
            i4 |= p65Var.f(str) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i4 |= p65Var.e(j2) ? 256 : 128;
        }
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            if (i2 > 0) {
                p65Var.Y(1783151803);
                mkd mkdVarA = mkd.a(((bu7) p65Var.j(jt7.c)).m, j2, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
                z = false;
                jjd.b(vo7.R(p65Var, R.string.common_interpunct), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 131070);
                o28 o28Var = o28.b;
                jjd.b(vo7.Q(R.string.onboarding_starter_pack_followed_count, new Object[]{Integer.valueOf(i2)}, p65Var), bgf.N(o28Var, "starter_pack_follow_count_" + str), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarA, p65Var, 0, 0, 131068);
                p65Var = p65Var;
                qv5.b(vn7.J(R.drawable.ic_check_mark_16, 0, p65Var), null, jfc.l(o28Var, 12.0f), j2, p65Var, 440 | ((i4 << 3) & 7168), 0);
            } else {
                z = false;
                p65Var.Y(1768667797);
            }
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new pv2(i2, i3, j2, str);
        }
    }

    public static long Q0(int i2, byte[] bArr) {
        return (((long) (bArr[i2 + 2] & 255)) << 16) | (bArr[i2] & 255) | (((long) (bArr[i2 + 1] & 255)) << 8);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0112  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:61:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void R(defpackage.hpc r25, defpackage.cpc r26, defpackage.r28 r27, defpackage.nhc r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 299
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht2.R(hpc, cpc, r28, nhc, x12, int, int):void");
    }

    public static long R0(int i2, byte[] bArr) {
        return (((long) (bArr[i2 + 3] & 255)) << 24) | Q0(i2, bArr);
    }

    public static final void S(String str, yoc yocVar, r28 r28Var, jpc jpcVar, x12 x12Var, int i2) {
        r28 r28Var2;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(286487997);
        int i3 = (p65Var.f(str) ? 4 : 2) | i2 | (p65Var.f(yocVar) ? 32 : 16) | 1408;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                boolean z = (i3 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == w12.a) {
                    objM = new nmc(str, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    jpcVar = (jpc) to7.z(n1b.a.b(jpc.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    r28Var = o28.b;
                }
            } else {
                p65Var.S();
            }
            r28 r28Var3 = r28Var;
            p65Var.q();
            R((hpc) guc.z(jpcVar.k, p65Var, 0).getValue(), new cpc(yocVar, jpcVar), r28Var3, null, p65Var, 384, 8);
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        jpc jpcVar2 = jpcVar;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 7, r28Var2, (Object) str, (Object) yocVar, (Object) jpcVar2);
        }
    }

    public static final void T(hpc hpcVar, cpc cpcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-343912233);
        int i3 = (p65Var.f(hpcVar) ? 4 : 2) | i2 | (p65Var.f(cpcVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (!p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.S();
        } else if (hpcVar instanceof gpc) {
            p65Var.Y(212833551);
            C(r28Var, p65Var, (i3 >> 6) & 14);
            p65Var.p(false);
        } else if (hpcVar instanceof fpc) {
            p65Var.Y(212836147);
            y((fpc) hpcVar, cpcVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        } else {
            if (!(hpcVar instanceof epc)) {
                throw ho2.L(p65Var, 212831652, false);
            }
            p65Var.Y(212841907);
            s((epc) hpcVar, cpcVar, r28Var, p65Var, i3 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 22, hpcVar, cpcVar, r28Var);
        }
    }

    public static final void U(hoe hoeVar, bo4 bo4Var, coe coeVar, obe obeVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1889837069);
        int i3 = 16;
        int i4 = i2 | (p65Var2.f(hoeVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(coeVar) ? 256 : 128) | (p65Var2.f(obeVar) ? 2048 : 1024);
        if (p65Var2.P(i4 & 1, (i4 & 1171) != 1170)) {
            kv6 kv6VarA = pv6.a(p65Var2);
            boolean z = ((i4 & 14) == 4) | ((i4 & 7168) == 2048);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z || objM == uobVar) {
                objM = new vrd(hoeVar, i3, obeVar);
                p65Var2.j0(objM);
            }
            k40.t(null, kv6VarA, null, null, null, null, false, null, (x45) objM, p65Var2, 0, 509);
            p65Var = p65Var2;
            int i5 = i4 & 896;
            boolean zF = p65Var.f(kv6VarA) | (i5 == 256);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (zF || objM2 == uobVar) {
                objM2 = new cfd(kv6VarA, coeVar, n92Var, 19);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, kv6VarA);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = bjc.b(new f91(kv6VarA, 13));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z2 = i5 == 256;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                objM4 = new iie(coeVar, upcVar, n92Var, 2);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
            boolean zH = p65Var.h(bo4Var) | p65Var.f(kv6VarA);
            Object objM5 = p65Var.M();
            if (zH || objM5 == uobVar) {
                objM5 = new wi1(bo4Var, kv6VarA, n92Var, 11);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i2, 27, hoeVar, bo4Var, coeVar, obeVar);
        }
    }

    public static final void V(b24 b24Var, coe coeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1943939412);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.f(coeVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
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
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                k8e k8eVar = new k8e(0, coeVar, coe.class, "onRefresh", "onRefresh()V", 0, 21);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, (i3 & 14) | 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new h5d(i2, 29, b24Var, coeVar, r28Var);
        }
    }

    public static final void W(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1097364146);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
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
            p65Var.Y(1914058374);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, false);
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
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                char c3 = c2;
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, false);
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
                tr7.g(0, 1, p65Var, null);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = true;
            }
            p65Var.p(false);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 15);
        }
    }

    public static final void X(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1982737224);
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
            gq7.a(jfc.c, null, vo7.R(p65Var, R.string.search_people_none_found), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 6, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sed(r28Var, i2, 16);
        }
    }

    public static final void Y(hoe hoeVar, bo4 bo4Var, coe coeVar, obe obeVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-919180082);
        int i3 = i2 | (p65Var.f(hoeVar) ? 4 : 2) | (p65Var.h(bo4Var) ? 32 : 16) | (p65Var.f(coeVar) ? 256 : 128) | (p65Var.f(obeVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            boolean z = hoeVar.b;
            boolean z2 = (i3 & 896) == 256;
            Object objM = p65Var.M();
            if (z2 || objM == w12.a) {
                k8e k8eVar = new k8e(0, coeVar, coe.class, "onRefresh", "onRefresh()V", 0, 22);
                p65Var.j0(k8eVar);
                objM = k8eVar;
            }
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-1859062656, new ov2(hoeVar, bo4Var, coeVar, obeVar, 29), p65Var), p65Var, (i3 >> 6) & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new exc(hoeVar, bo4Var, coeVar, obeVar, r28Var, i2, 16);
        }
    }

    public static final void Z(bo4 bo4Var, String str, bo4 bo4Var2, fub fubVar, r28 r28Var, ooe ooeVar, x12 x12Var, int i2) {
        r28 r28Var2;
        ooe ooeVar2;
        ooe ooeVar3;
        int i3;
        r28 r28Var3;
        ooe ooeVar4;
        str.getClass();
        bo4Var2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(375598307);
        int i4 = 4;
        int i5 = i2 | (p65Var.h(bo4Var) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.h(bo4Var2) ? 256 : 128) | (p65Var.f(fubVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 90112;
        if (p65Var.P(i5 & 1, (74899 & i5) != 74898)) {
            p65Var.U();
            int i6 = i2 & 1;
            uob uobVar = w12.a;
            if (i6 == 0 || p65Var.z()) {
                boolean zH = p65Var.h(bo4Var) | ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (zH || objM == uobVar) {
                    objM = new ui1(bo4Var, str, i4);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    ooeVar3 = (ooe) to7.z(n1b.a.b(ooe.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i5 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i5 & (-458753);
                r28Var3 = r28Var;
                ooeVar3 = ooeVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(ooeVar3.n, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            coe coeVar = new coe(ooeVar3, fubVar);
            a1a a1aVar = new a1a(ooeVar3, 24, fubVar);
            r28 r28Var4 = r28Var3;
            a0((ioe) l78VarZ.getValue(), nhcVarF, bo4Var2, coeVar, a1aVar, r28Var4, p65Var, (i3 & 896) | 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = kyd.M(p65Var);
                p65Var.j0(objM2);
            }
            sb2 sb2Var = (sb2) objM2;
            boolean zH2 = p65Var.h(ooeVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(a1aVar);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                ooeVar4 = ooeVar3;
                kyc kycVar = new kyc((que) ooeVar4, nhcVarF, sb2Var, resources, (Object) a1aVar, (n92) null, 10);
                p65Var.j0(kycVar);
                objM3 = kycVar;
            } else {
                ooeVar4 = ooeVar3;
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            r28Var2 = r28Var4;
            ooeVar2 = ooeVar4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            ooeVar2 = ooeVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gie(bo4Var, str, bo4Var2, fubVar, r28Var2, ooeVar2, i2, 3);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x0098  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0114  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:78:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a0(defpackage.ioe r25, defpackage.nhc r26, defpackage.bo4 r27, defpackage.coe r28, defpackage.obe r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 304
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht2.a0(ioe, nhc, bo4, coe, obe, r28, x12, int, int):void");
    }

    public static final void b0(ms1 ms1Var, ek8 ek8Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1646751498);
        int i3 = (p65Var.f(ms1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            String str = ms1Var.d;
            String strW = ms1Var.i;
            if (strW == null) {
                strW = km4.w(p65Var, 1980232540, R.string.common_unknown_collection, p65Var, false);
            } else {
                p65Var.Y(1980231796);
                p65Var.p(false);
            }
            kx kxVarW = ho2.w(p65Var, 1980236472);
            String strQ = vo7.Q(R.string.notification_type_collection_post_published_writer, new Object[]{strW, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                wjd wjdVar = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i3 & 14;
                boolean z = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z || objM == uobVar) {
                    objM = new ps1(3, ms1Var, ek8Var);
                    p65Var.j0(objM);
                }
                kxVarW.a(new b07("annotation_publication", wjdVar, (e07) objM), 0, strW.length());
                int iZ = muc.Z(strQ, str, 0, false, 6);
                wjd wjdVar2 = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                int i6 = 4;
                boolean z2 = (i5 == 4) | (i4 == 32);
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    objM2 = new ps1(i6, ms1Var, ek8Var);
                    p65Var.j0(objM2);
                }
                kxVarW.a(new b07("annotation_post", wjdVar2, (e07) objM2), iZ, str.length() + iZ);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                rv8.e(ms1Var.a, ms1Var.b, pxf.E(-860045165, new qs1(1, ms1Var, ek8Var), p65Var), mxVarI, p65Var, 384);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ns1(ms1Var, ek8Var, i2, 2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x021f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static void c0(defpackage.qr0 r25, defpackage.e14 r26, defpackage.hse r27, int r28, defpackage.u11 r29) throws com.google.zxing.WriterException {
        /*
            Method dump skipped, instruction units count: 680
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ht2.c0(qr0, e14, hse, int, u11):void");
    }

    public static int d0(int i2, int i3) {
        if (i3 == 0) {
            ay0.e("0 polynomial");
            return 0;
        }
        int iNumberOfLeadingZeros = Integer.numberOfLeadingZeros(i3);
        int i4 = 32 - iNumberOfLeadingZeros;
        int iNumberOfLeadingZeros2 = i2 << (31 - iNumberOfLeadingZeros);
        while (32 - Integer.numberOfLeadingZeros(iNumberOfLeadingZeros2) >= i4) {
            iNumberOfLeadingZeros2 ^= i3 << ((32 - Integer.numberOfLeadingZeros(iNumberOfLeadingZeros2)) - i4);
        }
        return iNumberOfLeadingZeros2;
    }

    public static final void e0(egc egcVar, ArrayList arrayList, int i2) {
        boolean zL = egcVar.l(i2);
        int[] iArr = egcVar.b;
        if (zL) {
            arrayList.add(egcVar.n(i2));
            return;
        }
        int i3 = iArr[(i2 * 5) + 3] + i2;
        for (int i4 = i2 + 1; i4 < i3; i4 += iArr[(i4 * 5) + 3]) {
            e0(egcVar, arrayList, i4);
        }
    }

    public static final void f(dsd dsdVar, r28 r28Var, x45 x45Var, xd xdVar, x45 x45Var2, mz1 mz1Var, x12 x12Var, int i2) {
        int i3;
        x45 x45Var3;
        p65 p65Var;
        b2 b2Var;
        ov ovVar;
        ejc ejcVar;
        ov ovVar2;
        xrd xrdVarU;
        boolean z;
        x45 x45Var4 = x45Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(511725103);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(dsdVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.h(x45Var4) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(xdVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.h(x45Var2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        mz1 mz1Var2 = mz1Var;
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.h(mz1Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            int i4 = i3 & 14;
            boolean z2 = i4 == 4;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new ov(dsdVar, xdVar);
                p65Var2.j0(objM);
            }
            ov ovVar3 = (ov) objM;
            boolean z3 = i4 == 4;
            Object objM2 = p65Var2.M();
            if (z3 || objM2 == uobVar) {
                Object[] objArr = {dsdVar.a.o0()};
                ejc ejcVar2 = new ejc();
                ejcVar2.addAll(k80.Q0(objArr));
                p65Var2.j0(ejcVar2);
                objM2 = ejcVar2;
            }
            ejc ejcVar3 = (ejc) objM2;
            boolean z4 = i4 == 4;
            Object objM3 = p65Var2.M();
            if (z4 || objM3 == uobVar) {
                long[] jArr = hqb.a;
                objM3 = new f78();
                p65Var2.j0(objM3);
            }
            f78 f78Var = (f78) objM3;
            b2 b2Var2 = dsdVar.a;
            k49 k49Var = dsdVar.d;
            if (!ejcVar3.contains(b2Var2.o0())) {
                ejcVar3.clear();
                ejcVar3.add(b2Var2.o0());
            }
            if (g76.L(b2Var2.o0(), k49Var.getValue())) {
                if (ejcVar3.size() != 1 || !g76.L(ejcVar3.get(0), b2Var2.o0())) {
                    ejcVar3.clear();
                    ejcVar3.add(b2Var2.o0());
                }
                if (f78Var.e != 1 || f78Var.c(b2Var2.o0())) {
                    f78Var.a();
                }
                ovVar3.b = xdVar;
            }
            if (g76.L(b2Var2.o0(), k49Var.getValue()) || ejcVar3.contains(k49Var.getValue())) {
                b2Var = b2Var2;
            } else {
                ListIterator listIterator = ejcVar3.listIterator();
                int i5 = 0;
                while (true) {
                    wn5 wn5Var = (wn5) listIterator;
                    b2Var = b2Var2;
                    if (!wn5Var.hasNext()) {
                        i5 = -1;
                        break;
                    } else {
                        if (g76.L(x45Var2.invoke(wn5Var.next()), x45Var2.invoke(k49Var.getValue()))) {
                            break;
                        }
                        i5++;
                        b2Var2 = b2Var;
                    }
                }
                if (i5 == -1) {
                    ejcVar3.add(k49Var.getValue());
                } else {
                    ejcVar3.set(i5, k49Var.getValue());
                }
            }
            if (f78Var.c(k49Var.getValue()) && f78Var.c(b2Var.o0())) {
                p65Var2.Y(1968995539);
                p65Var2.p(false);
                x45Var3 = x45Var4;
                ovVar = ovVar3;
            } else {
                p65Var2.Y(1966410449);
                f78Var.a();
                int size = ejcVar3.size();
                int i6 = 0;
                while (i6 < size) {
                    Object obj = ejcVar3.get(i6);
                    f78Var.m(obj, pxf.E(-23915175, new bv(dsdVar, obj, x45Var4, ovVar3, ejcVar3, mz1Var2), p65Var2));
                    i6++;
                    x45Var4 = x45Var4;
                    mz1Var2 = mz1Var;
                }
                x45Var3 = x45Var4;
                ovVar = ovVar3;
                p65Var2.p(false);
            }
            boolean zF = p65Var2.f(dsdVar.f()) | p65Var2.f(ovVar);
            Object objM4 = p65Var2.M();
            if (zF || objM4 == uobVar) {
                objM4 = (x82) x45Var3.invoke(ovVar);
                p65Var2.j0(objM4);
            }
            x82 x82Var = (x82) objM4;
            dsd dsdVar2 = ovVar.a;
            boolean zF2 = p65Var2.f(ovVar);
            Object objM5 = p65Var2.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM5);
            }
            l78 l78Var = (l78) objM5;
            l78 l78VarY = qo7.y(x82Var.d, p65Var2);
            if (g76.L(dsdVar2.a.o0(), dsdVar2.d.getValue())) {
                l78Var.setValue(Boolean.FALSE);
            } else if (l78VarY.getValue() != null) {
                l78Var.setValue(Boolean.TRUE);
            }
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            r28 r28Var2 = o28.b;
            if (zBooleanValue) {
                p65Var2.Y(1353077497);
                ov ovVar4 = ovVar;
                ejcVar = ejcVar3;
                p65Var = p65Var2;
                ovVar2 = ovVar4;
                xrdVarU = k40.U(ovVar4.a, d46.p, null, p65Var, 0, 2);
                boolean zF3 = p65Var.f(xrdVarU);
                Object objM6 = p65Var.M();
                if (zF3 || objM6 == uobVar) {
                    objM6 = r40.z(r28Var2);
                    p65Var.j0(objM6);
                }
                r28Var2 = (r28) objM6;
                p65Var.p(false);
            } else {
                ejcVar = ejcVar3;
                p65Var = p65Var2;
                ovVar2 = ovVar;
                p65Var.Y(1353343539);
                p65Var.p(false);
                xrdVarU = null;
            }
            r28 r28VarB = r28Var.b(r28Var2.b(new kv(xrdVarU, l78VarY, ovVar2)));
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = new hv(ovVar2);
                p65Var.j0(objM7);
            }
            hv hvVar = (hv) objM7;
            long j2 = p65Var.T;
            int i7 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, hvVar);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.v(p65Var, Integer.valueOf(i7), q12.g);
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-860173498);
            int size2 = ejcVar.size();
            int i8 = 0;
            while (i8 < size2) {
                ejc ejcVar4 = ejcVar;
                Object obj2 = ejcVar4.get(i8);
                p65Var.W(-2026002954, x45Var2.invoke(obj2));
                b55 b55Var = (b55) f78Var.g(obj2);
                if (b55Var == null) {
                    p65Var.Y(1618454323);
                    z = false;
                } else {
                    z = false;
                    p65Var.Y(-2026001778);
                    b55Var.invoke(p65Var, 0);
                }
                p65Var.p(z);
                p65Var.p(z);
                i8++;
                ejcVar = ejcVar4;
            }
            p65Var.p(false);
            p65Var.p(true);
        } else {
            x45Var3 = x45Var4;
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fv(dsdVar, r28Var, x45Var3, xdVar, x45Var2, mz1Var, i2);
        }
    }

    public static GetCredentialException f0(String str, String str2) {
        Exception excZ;
        str.getClass();
        try {
            GetPublicKeyCredentialDomException getPublicKeyCredentialDomException = new GetPublicKeyCredentialDomException(new k(26), null);
            if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_ABORT_ERROR")) {
                excZ = gsa.Z(new k(0), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_CONSTRAINT_ERROR")) {
                excZ = gsa.Z(new k(1), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_DATA_CLONE_ERROR")) {
                excZ = gsa.Z(new k(2), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_DATA_ERROR")) {
                excZ = gsa.Z(new k(3), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_ENCODING_ERROR")) {
                excZ = gsa.Z(new k(4), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_HIERARCHY_REQUEST_ERROR")) {
                excZ = gsa.Z(new k(5), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_IN_USE_ATTRIBUTE_ERROR")) {
                excZ = gsa.Z(new k(6), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_CHARACTER_ERROR")) {
                excZ = gsa.Z(new k(7), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_MODIFICATION_ERROR")) {
                excZ = gsa.Z(new k(8), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_NODE_TYPE_ERROR")) {
                excZ = gsa.Z(new k(9), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_INVALID_STATE_ERROR")) {
                excZ = gsa.Z(new k(10), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NAMESPACE_ERROR")) {
                excZ = gsa.Z(new k(11), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NETWORK_ERROR")) {
                excZ = gsa.Z(new k(12), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NO_MODIFICATION_ALLOWED_ERROR")) {
                excZ = gsa.Z(new k(13), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_ALLOWED_ERROR")) {
                excZ = gsa.Z(new k(14), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_FOUND_ERROR")) {
                excZ = gsa.Z(new k(15), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_READABLE_ERROR")) {
                excZ = gsa.Z(new k(16), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_NOT_SUPPORTED_ERROR")) {
                excZ = gsa.Z(new k(17), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_OPERATION_ERROR")) {
                excZ = gsa.Z(new k(18), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_OPT_OUT_ERROR")) {
                excZ = gsa.Z(new k(19), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_QUOTA_EXCEEDED_ERROR")) {
                excZ = gsa.Z(new k(20), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_READ_ONLY_ERROR")) {
                excZ = gsa.Z(new k(21), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_SECURITY_ERROR")) {
                excZ = gsa.Z(new k(22), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_SYNTAX_ERROR")) {
                excZ = gsa.Z(new k(23), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_TIMEOUT_ERROR")) {
                excZ = gsa.Z(new k(24), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_TRANSACTION_INACTIVE_ERROR")) {
                excZ = gsa.Z(new k(25), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_UNKNOWN_ERROR")) {
                excZ = gsa.Z(new k(26), str2, getPublicKeyCredentialDomException);
            } else if (str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_VERSION_ERROR")) {
                excZ = gsa.Z(new k(27), str2, getPublicKeyCredentialDomException);
            } else {
                if (!str.equals("androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION/androidx.credentials.TYPE_WRONG_DOCUMENT_ERROR")) {
                    throw new FrameworkClassParsingException();
                }
                excZ = gsa.Z(new k(28), str2, getPublicKeyCredentialDomException);
            }
            return (GetCredentialException) excZ;
        } catch (FrameworkClassParsingException unused) {
            return new GetCredentialCustomException(str2, str);
        }
    }

    public static final boolean g0(File file, f66 f66Var) {
        file.getClass();
        f66Var.getClass();
        return ((Boolean) C0(file, Boolean.FALSE, f66Var, zu2.l)).booleanValue();
    }

    public static void h0(int i2, int i3, u11 u11Var) throws WriterException {
        for (int i4 = 0; i4 < 8; i4++) {
            int i5 = i2 + i4;
            if (!t0(u11Var.a(i5, i3))) {
                throw new WriterException();
            }
            u11Var.h(i5, i3, 0);
        }
    }

    public static void i0(int i2, int i3, u11 u11Var) {
        for (int i4 = 0; i4 < 7; i4++) {
            int[] iArr = h[i4];
            for (int i5 = 0; i5 < 7; i5++) {
                u11Var.h(i2 + i5, i3 + i4, iArr[i5]);
            }
        }
    }

    public static void j0(int i2, int i3, u11 u11Var) throws WriterException {
        for (int i4 = 0; i4 < 7; i4++) {
            int i5 = i3 + i4;
            if (!t0(u11Var.a(i2, i5))) {
                throw new WriterException();
            }
            u11Var.h(i2, i5, 0);
        }
    }

    public static final boolean k0(File file, f66 f66Var) {
        file.getClass();
        f66Var.getClass();
        return ((Boolean) C0(file, Boolean.FALSE, f66Var, zu2.m)).booleanValue();
    }

    public static final void l(Object obj, r28 r28Var, x45 x45Var, xd xdVar, String str, x45 x45Var2, x12 x12Var, int i2) {
        r28 r28Var2;
        xd xdVar2;
        String str2;
        x45 x45Var3;
        mz1 mz1Var = bgf.F;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1501828832);
        int i3 = i2 | (p65Var.f(obj) ? 4 : 2) | 224304;
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            ar0 ar0Var = z46.d;
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = fn.o;
                p65Var.j0(objM);
            }
            x45Var3 = (x45) objM;
            dsd dsdVarT0 = k40.T0(obj, "AnimatedContent", p65Var, (i3 & 14) | 48, 0);
            o28 o28Var = o28.b;
            f(dsdVarT0, o28Var, x45Var, ar0Var, x45Var3, mz1Var, p65Var, 224688);
            r28Var2 = o28Var;
            xdVar2 = ar0Var;
            str2 = "AnimatedContent";
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            xdVar2 = xdVar;
            str2 = str;
            x45Var3 = x45Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bv(obj, r28Var2, x45Var, xdVar2, str2, x45Var3, i2);
        }
    }

    public static final int l0(int i2, List list) {
        int size = list.size() - 1;
        int i3 = 0;
        while (i3 <= size) {
            int i4 = (i3 + size) >>> 1;
            int iQ = g76.Q(((r76) list.get(i4)).b, i2);
            if (iQ < 0) {
                i3 = i4 + 1;
            } else {
                if (iQ <= 0) {
                    return i4;
                }
                size = i4 - 1;
            }
        }
        return -(i3 + 1);
    }

    public static final void m(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        o28 o28Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(500236319);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(ff0Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(iv9Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            o28 o28Var2 = o28.b;
            r28 r28VarR = gx1.R(p65Var, o28Var2);
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
            tp7.B(p65Var, q12.d, r28VarR);
            String strW = ff0Var.b;
            if (muc.b0(strW)) {
                strW = null;
            }
            if (strW == null) {
                strW = km4.w(p65Var, 1630137319, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(1630135862);
                p65Var.p(false);
            }
            r28 r28VarY = r40.y(km4.u(1.0f, bgf.N(o28Var2, "cta_author_name"), false), bmb.a(4.0f));
            boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ze0(iv9Var, ff0Var, i5);
                p65Var.j0(objM);
            }
            jjd.b(strW, w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 6.0f, 2.0f, 6.0f, 2.0f), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, ((bu7) p65Var.j(jt7.c)).m, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            if (ff0Var.d) {
                p65Var.Y(-1004504640);
                w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var), vo7.R(p65Var, R.string.book_author), null, null, null, 0.0f, null, p65Var, 8, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            } else {
                p65Var.Y(-1009702937);
            }
            p65Var.p(false);
            wu4 wu4Var = (wu4) guc.x(ff0Var.j, null, p65Var, 48).getValue();
            if (wu4Var != null) {
                p65Var.Y(-1004015770);
                zg7 zg7Var = new zg7(13, iv9Var);
                o28Var = o28Var2;
                hp7.t(p65Var, jfc.l(o28Var, 6.0f));
                k40.c(g56.c.a(new vj3(Float.NaN)), pxf.E(-59142679, new r(wu4Var, 16, zg7Var), p65Var), p65Var, 56);
            } else {
                o28Var = o28Var2;
                p65Var.Y(-1009702937);
            }
            p65Var.p(false);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ye0(ff0Var, iv9Var, r28Var2, i2, 3);
        }
    }

    public static dt2 m0(byte[] bArr) {
        bArr.getClass();
        if (bArr.length > 10240) {
            ygf.f("Data cannot occupy more than 10240 bytes when serialized");
            return null;
        }
        if (bArr.length == 0) {
            return dt2.b;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        try {
            ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
            byte[] bArr2 = new byte[2];
            byteArrayInputStream.read(bArr2);
            int i2 = 0;
            boolean z = bArr2[0] == -84 && bArr2[1] == -19;
            byteArrayInputStream.reset();
            if (z) {
                ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
                try {
                    int i3 = objectInputStream.readInt();
                    while (i2 < i3) {
                        linkedHashMap.put(objectInputStream.readUTF(), objectInputStream.readObject());
                        i2++;
                    }
                    objectInputStream.close();
                } finally {
                }
            } else {
                DataInputStream dataInputStream = new DataInputStream(byteArrayInputStream);
                try {
                    short s = dataInputStream.readShort();
                    if (s == -21521) {
                        short s2 = dataInputStream.readShort();
                        if (s2 != 1) {
                            lg8.i(b09.w(s2, "Unsupported version number: "));
                        }
                    } else {
                        lg8.i(b09.w(s, "Magic number doesn't match: "));
                    }
                    int i4 = dataInputStream.readInt();
                    while (i2 < i4) {
                        linkedHashMap.put(dataInputStream.readUTF(), n0(dataInputStream, dataInputStream.readByte()));
                        i2++;
                    }
                    dataInputStream.close();
                } finally {
                }
            }
        } catch (IOException e2) {
            d87.h().g(su2.a, "Error in Data#fromByteArray: ", e2);
        } catch (ClassNotFoundException e3) {
            d87.h().g(su2.a, "Error in Data#fromByteArray: ", e3);
        }
        return new dt2(linkedHashMap);
    }

    public static final void n(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1273532152);
        int i3 = i2 | (p65Var.f(ff0Var) ? 4 : 2) | (p65Var.f(iv9Var) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new nx(8);
                p65Var.j0(objM);
            }
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(wxb.a(o28Var, false, (x45) objM), "author_header"), 3, 1.0f);
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
            K(ff0Var, iv9Var, w2g.G(jfc.r(jfc.d(o28Var, 1.0f), 3), 20.0f, 12.0f, 20.0f, 0.0f, 8), p65Var, (i3 & 14) | 384 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION));
            o(ff0Var, iv9Var, null, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 0, ff0Var, iv9Var, r28Var2);
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [java.io.Serializable, java.lang.Double[]] */
    /* JADX WARN: Type inference failed for: r0v2, types: [java.io.Serializable, java.lang.Float[]] */
    /* JADX WARN: Type inference failed for: r0v3, types: [java.io.Serializable, java.lang.Long[]] */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.io.Serializable, java.lang.Integer[]] */
    /* JADX WARN: Type inference failed for: r0v5, types: [java.io.Serializable, java.lang.Byte[]] */
    /* JADX WARN: Type inference failed for: r0v6, types: [java.io.Serializable, java.lang.Boolean[]] */
    /* JADX WARN: Type inference failed for: r1v14, types: [java.io.Serializable, java.lang.String[]] */
    public static final Serializable n0(DataInputStream dataInputStream, byte b2) throws IOException {
        if (b2 == 0) {
            return null;
        }
        if (b2 == 1) {
            return Boolean.valueOf(dataInputStream.readBoolean());
        }
        if (b2 == 2) {
            return Byte.valueOf(dataInputStream.readByte());
        }
        if (b2 == 3) {
            return Integer.valueOf(dataInputStream.readInt());
        }
        if (b2 == 4) {
            return Long.valueOf(dataInputStream.readLong());
        }
        if (b2 == 5) {
            return Float.valueOf(dataInputStream.readFloat());
        }
        if (b2 == 6) {
            return Double.valueOf(dataInputStream.readDouble());
        }
        if (b2 == 7) {
            return dataInputStream.readUTF();
        }
        int i2 = 0;
        if (b2 == 8) {
            int i3 = dataInputStream.readInt();
            ?? r0 = new Boolean[i3];
            while (i2 < i3) {
                r0[i2] = Boolean.valueOf(dataInputStream.readBoolean());
                i2++;
            }
            return r0;
        }
        if (b2 == 9) {
            int i4 = dataInputStream.readInt();
            ?? r02 = new Byte[i4];
            while (i2 < i4) {
                r02[i2] = Byte.valueOf(dataInputStream.readByte());
                i2++;
            }
            return r02;
        }
        if (b2 == 10) {
            int i5 = dataInputStream.readInt();
            ?? r03 = new Integer[i5];
            while (i2 < i5) {
                r03[i2] = Integer.valueOf(dataInputStream.readInt());
                i2++;
            }
            return r03;
        }
        if (b2 == 11) {
            int i6 = dataInputStream.readInt();
            ?? r04 = new Long[i6];
            while (i2 < i6) {
                r04[i2] = Long.valueOf(dataInputStream.readLong());
                i2++;
            }
            return r04;
        }
        if (b2 == 12) {
            int i7 = dataInputStream.readInt();
            ?? r05 = new Float[i7];
            while (i2 < i7) {
                r05[i2] = Float.valueOf(dataInputStream.readFloat());
                i2++;
            }
            return r05;
        }
        if (b2 == 13) {
            int i8 = dataInputStream.readInt();
            ?? r06 = new Double[i8];
            while (i2 < i8) {
                r06[i2] = Double.valueOf(dataInputStream.readDouble());
                i2++;
            }
            return r06;
        }
        if (b2 != 14) {
            ygf.f(b09.w(b2, "Unsupported type "));
            return null;
        }
        int i9 = dataInputStream.readInt();
        ?? r1 = new String[i9];
        while (i2 < i9) {
            String utf = dataInputStream.readUTF();
            if (g76.L(utf, "androidx.work.Data-95ed6082-b8e9-46e8-a73f-ff56f00f5d9d")) {
                utf = null;
            }
            r1[i2] = utf;
            i2++;
        }
        return r1;
    }

    public static final void o(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(192226139);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(ff0Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(iv9Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarF = w2g.F(jfc.d(o28Var, 1.0f), 20.0f, 20.0f, 20.0f, 32.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            int i6 = i4 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER;
            p(ff0Var, iv9Var, null, p65Var, i6);
            B(ff0Var, iv9Var, null, p65Var, i6);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ye0(ff0Var, iv9Var, r28Var2, i2, 4);
        }
    }

    public static final i10 o0(Context context) {
        context.getClass();
        while (context != null) {
            if (context instanceof i10) {
                return (i10) context;
            }
            context = context instanceof ContextWrapper ? ((ContextWrapper) context).getBaseContext() : null;
        }
        return null;
    }

    public static final void p(ff0 ff0Var, iv9 iv9Var, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1638831753);
        if ((i2 & 6) == 0) {
            i3 = i2 | (p65Var.f(ff0Var) ? 4 : 2);
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(iv9Var) ? 32 : 16;
        }
        int i4 = i3 | 384;
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 147) != 146)) {
            String str = ff0Var.c;
            hl0 hl0Var = as7.b;
            float f2 = as7.c;
            o28 o28Var = o28.b;
            r28 r28VarG = w2g.G(o28Var, f2, 0.0f, 0.0f, 0.0f, 14);
            boolean z = ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i4 & 14) == 4);
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new ze0(iv9Var, ff0Var, i5);
                p65Var.j0(objM);
            }
            d46.a(str, hl0Var, r28VarG, null, null, null, null, 0.0f, 0, null, (m45) objM, p65Var, 0, 0, 2040);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ye0(ff0Var, iv9Var, r28Var2, i2, 2);
        }
    }

    public static final int p0(Context context) {
        context.getClass();
        return (context.getResources().getConfiguration().uiMode & 48) == 32 ? context.getColor(R.color.white) : context.getColor(R.color.black);
    }

    public static final void q(jf1 jf1Var, fv9 fv9Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        boolean z;
        String str = jf1Var.d;
        fv9Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2080944638);
        int i3 = i2 | (p65Var2.f(jf1Var) ? 4 : 2) | (p65Var2.f(fv9Var) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var2.j(kt7.a), jfc.d(w2g.G(o28Var, 0.0f, 32.0f, 0.0f, 24.0f, 5), 1.0f), 3, 1.0f);
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
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var2.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarD);
            p65Var2.c0();
            String strW = str;
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j4 = p65Var2.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, wv1VarA);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i6, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            String strQ = vo7.Q(R.string.catalog_recirc_header_more_from_the_list, new Object[]{af1.a(jf1Var.b, p65Var2)}, p65Var2);
            r28 r28VarG = w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10);
            sn3 sn3Var = jt7.c;
            jjd.b(strQ, r28VarG, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).j, p65Var2, 48, 0, 131068);
            p65Var = p65Var2;
            if (strW != null) {
                p65Var.Y(-1730588328);
                r28 r28VarG2 = w2g.G(o28Var, 24.0f, 8.0f, 24.0f, 0.0f, 8);
                omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
                long j5 = p65Var.T;
                int i7 = (int) (j5 ^ (j5 >>> 32));
                i89 i89VarL4 = p65Var.l();
                r28 r28VarR4 = gx1.R(p65Var, r28VarG2);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, ombVarA);
                tp7.B(p65Var, cuVar2, i89VarL4);
                ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR4);
                r28Var2 = o28Var;
                jjd.b(vo7.R(p65Var, R.string.catalog_recirc_header_curated_by), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var)).m, ((zo7) p65Var.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
                if (muc.b0(strW)) {
                    strW = null;
                }
                if (strW == null) {
                    strW = km4.w(p65Var, -1433086804, R.string.common_unknown_user, p65Var, false);
                } else {
                    p65Var.Y(-1433088323);
                    p65Var.p(false);
                }
                r28 r28VarY = r40.y(r28Var2, bmb.a(4.0f));
                boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z2 || objM == w12.a) {
                    objM = new n(fv9Var, 25, jf1Var);
                    p65Var.j0(objM);
                }
                jjd.b(strW, w2g.F(hlg.r(r28VarY, false, null, null, (m45) objM, 15), 4.0f, 2.0f, 4.0f, 2.0f), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(sn3Var)).m, p65Var, 0, 0, 131068);
                p65Var = p65Var;
                z = true;
                p65Var.p(true);
            } else {
                r28Var2 = o28Var;
                z = true;
                p65Var.Y(-1732800829);
            }
            p65Var.p(false);
            b09.H(p65Var, z, z, z);
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new af0(i2, 12, jf1Var, fv9Var, r28Var2);
        }
    }

    public static byte[] q0(Context context, String str) throws PackageManager.NameNotFoundException {
        MessageDigest messageDigest;
        PackageInfo packageInfo = e9f.a(context).a.getPackageManager().getPackageInfo(str, 64);
        Signature[] signatureArr = packageInfo.signatures;
        if (signatureArr != null && signatureArr.length == 1) {
            int i2 = 0;
            while (true) {
                if (i2 >= 2) {
                    messageDigest = null;
                    break;
                }
                try {
                    messageDigest = MessageDigest.getInstance("SHA1");
                } catch (NoSuchAlgorithmException unused) {
                }
                if (messageDigest != null) {
                    break;
                }
                i2++;
            }
            if (messageDigest != null) {
                return messageDigest.digest(packageInfo.signatures[0].toByteArray());
            }
        }
        return null;
    }

    public static final void r(ms1 ms1Var, ek8 ek8Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1708396611);
        int i3 = (p65Var.f(ms1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        int i4 = 0;
        if (!p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.S();
        } else if (ms1Var.k) {
            p65Var.Y(519223529);
            x(ms1Var, ek8Var, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else {
            p65Var.Y(519384233);
            b0(ms1Var, ek8Var, p65Var, i3 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ns1(ms1Var, ek8Var, i2, i4);
        }
    }

    public static Object r0(Bundle bundle, String str, Class cls) {
        if (Build.VERSION.SDK_INT >= 34) {
            return v4.i(bundle, str, cls);
        }
        Parcelable parcelable = bundle.getParcelable(str);
        if (cls.isInstance(parcelable)) {
            return parcelable;
        }
        return null;
    }

    public static final void s(epc epcVar, cpc cpcVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        Object jocVar;
        cpc cpcVar2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-808344938);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(epcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(cpcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = epcVar.b;
            boolean z2 = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                jocVar = new joc(0, cpcVar, cpc.class, "refresh", "refresh()V", 0, 1);
                cpcVar2 = cpcVar;
                p65Var2.j0(jocVar);
            } else {
                cpcVar2 = cpcVar;
                jocVar = objM;
            }
            p65Var = p65Var2;
            er7.d(z, (m45) ((qh6) jocVar), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(1792996900, new ec(epcVar, 8, cpcVar2), p65Var2), p65Var, i3 & 896, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 7, epcVar, cpcVar, r28Var);
        }
    }

    public static final boolean s0(rg6 rg6Var) {
        v41 v41VarV;
        v41 v41VarX;
        if (rg6Var instanceof fi6) {
            fj6 fj6Var = (fj6) rg6Var;
            Field fieldJ = fo7.J(fj6Var);
            if (!(fieldJ != null ? fieldJ.isAccessible() : true)) {
                return false;
            }
            Method methodK = fo7.K(fj6Var.b());
            if (!(methodK != null ? methodK.isAccessible() : true)) {
                return false;
            }
            Method methodK2 = fo7.K(((fi6) rg6Var).c());
            if (!(methodK2 != null ? methodK2.isAccessible() : true)) {
                return false;
            }
        } else if (rg6Var instanceof fj6) {
            fj6 fj6Var2 = (fj6) rg6Var;
            Field fieldJ2 = fo7.J(fj6Var2);
            if (!(fieldJ2 != null ? fieldJ2.isAccessible() : true)) {
                return false;
            }
            Method methodK3 = fo7.K(fj6Var2.b());
            if (!(methodK3 != null ? methodK3.isAccessible() : true)) {
                return false;
            }
        } else if (rg6Var instanceof jj6) {
            Field fieldJ3 = fo7.J(((jj6) rg6Var).a());
            if (!(fieldJ3 != null ? fieldJ3.isAccessible() : true)) {
                return false;
            }
            Method methodK4 = fo7.K((qh6) rg6Var);
            if (!(methodK4 != null ? methodK4.isAccessible() : true)) {
                return false;
            }
        } else if (rg6Var instanceof lj6) {
            Field fieldJ4 = fo7.J(((lj6) rg6Var).a());
            if (!(fieldJ4 != null ? fieldJ4.isAccessible() : true)) {
                return false;
            }
            Method methodK5 = fo7.K((qh6) rg6Var);
            if (!(methodK5 != null ? methodK5.isAccessible() : true)) {
                return false;
            }
        } else {
            if (!(rg6Var instanceof qh6)) {
                StringBuilder sb = new StringBuilder("Unknown callable: ");
                sb.append(rg6Var);
                Class<?> cls = rg6Var.getClass();
                sb.append(" (");
                sb.append(cls);
                sb.append(')');
                throw new UnsupportedOperationException(sb.toString());
            }
            qh6 qh6Var = (qh6) rg6Var;
            Method methodK6 = fo7.K(qh6Var);
            if (!(methodK6 != null ? methodK6.isAccessible() : true)) {
                return false;
            }
            vg6 vg6VarA = bpe.a(rg6Var);
            Object objB = (vg6VarA == null || (v41VarX = vg6VarA.x()) == null) ? null : v41VarX.b();
            AccessibleObject accessibleObject = objB instanceof AccessibleObject ? (AccessibleObject) objB : null;
            if (!(accessibleObject != null ? accessibleObject.isAccessible() : true)) {
                return false;
            }
            vg6 vg6VarA2 = bpe.a(qh6Var);
            Member memberB = (vg6VarA2 == null || (v41VarV = vg6VarA2.v()) == null) ? null : v41VarV.b();
            Constructor constructor = memberB instanceof Constructor ? (Constructor) memberB : null;
            if (!(constructor != null ? constructor.isAccessible() : true)) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v16 */
    /* JADX WARN: Type inference failed for: r6v17, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r6v18 */
    public static final void t(se2 se2Var, akc akcVar, final xd2 xd2Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        se2 se2Var2;
        String str;
        r28 r28Var2;
        final int i3;
        m62 m62Var;
        l78 l78Var;
        Object gu1Var;
        Object obj;
        ?? r6;
        float f2;
        sr4 sr4Var;
        int i4;
        float f3;
        p65 p65Var2;
        se2 se2Var3 = se2Var;
        p65 p65Var3 = (p65) x12Var;
        p65Var3.a0(-999596034);
        int i5 = i2 | (p65Var3.f(se2Var3) ? 4 : 2) | (p65Var3.f(akcVar) ? 32 : 16) | (p65Var3.f(xd2Var) ? 256 : 128) | (p65Var3.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var3.P(i5 & 1, (i5 & 1171) != 1170)) {
            Object objM = p65Var3.M();
            Object obj2 = w12.a;
            if (objM == obj2) {
                objM = ka1.g(p65Var3);
            }
            sr4 sr4Var2 = (sr4) objM;
            Object objM2 = p65Var3.M();
            if (objM2 == obj2) {
                objM2 = ka1.g(p65Var3);
            }
            sr4 sr4Var3 = (sr4) objM2;
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var3.j(kt7.a), bgf.N(r28Var.b(rh4Var), "content"), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var3.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var3.l();
            r28 r28VarR = gx1.R(p65Var3, r28VarX);
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
            Integer numValueOf = Integer.valueOf(i6);
            cu cuVar3 = q12.g;
            tp7.B(p65Var3, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var3, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var3, cuVar4, r28VarR);
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var3.T;
            int i7 = (int) (j3 ^ (j3 >>> 32));
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
            ka1.z(i7, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR2);
            r28 r28VarR3 = wgf.R(rh4Var, wgf.K(p65Var3), false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var3, 0);
            long j4 = p65Var3.T;
            int i8 = (int) (j4 ^ (j4 >>> 32));
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
            ka1.z(i8, p65Var3, cuVar3, p65Var3, fnVar);
            tp7.B(p65Var3, cuVar4, r28VarR4);
            hp7.t(p65Var3, jfc.l(o28Var, 16.0f));
            Object objM3 = p65Var3.M();
            if (objM3 == obj2) {
                se2Var2 = se2Var;
                String str2 = se2Var2.a;
                int length = str2.length();
                objM3 = qo7.u(new uid(str2, 4, lk7.q(length, length)));
                p65Var3.j0(objM3);
            } else {
                se2Var2 = se2Var;
            }
            final l78 l78Var2 = (l78) objM3;
            uid uidVar = (uid) l78Var2.getValue();
            String strR = vo7.R(p65Var3, R.string.create_catalog_name);
            String strR2 = vo7.R(p65Var3, R.string.create_catalog_name_placeholder);
            sk6 sk6Var = sk6.f;
            sk6 sk6VarA = sk6.a(3, 0, 6, 118);
            Object objM4 = p65Var3.M();
            if (objM4 == obj2) {
                objM4 = new w8(sr4Var3, 1);
                p65Var3.j0(objM4);
            }
            pk6 pk6Var = new pk6(null, (x45) objM4, null, 59);
            r28 r28VarN = bgf.N(t40.F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var2), "list_title");
            int i9 = i5 & 896;
            boolean z = i9 == 256;
            Object objM5 = p65Var3.M();
            if (z || objM5 == obj2) {
                str = strR;
                r28Var2 = r28VarN;
                i3 = 0;
                objM5 = new x45() { // from class: he2
                    @Override // defpackage.x45
                    public final Object invoke(Object obj3) {
                        int i10 = i3;
                        c1e c1eVar = c1e.a;
                        l78 l78Var3 = l78Var2;
                        xd2 xd2Var2 = xd2Var;
                        uid uidVar2 = (uid) obj3;
                        uidVar2.getClass();
                        switch (i10) {
                            case 0:
                                l78Var3.setValue(uidVar2);
                                String str3 = uidVar2.a.b;
                                str3.getClass();
                                we2 we2Var = xd2Var2.b;
                                we2Var.getClass();
                                we2Var.d = str3;
                                vx0.c0(f76.F(we2Var), null, null, new ve2(we2Var, null, 2), 3);
                                break;
                            default:
                                l78Var3.setValue(uidVar2);
                                String str4 = uidVar2.a.b;
                                str4.getClass();
                                we2 we2Var2 = xd2Var2.b;
                                we2Var2.getClass();
                                we2Var2.e = str4;
                                vx0.c0(f76.F(we2Var2), null, null, new ve2(we2Var2, null, 0), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(objM5);
            } else {
                str = strR;
                r28Var2 = r28VarN;
                i3 = 0;
            }
            int i10 = 1;
            int i11 = i3;
            d46.m(uidVar, (x45) objM5, r28Var2, false, false, null, 1, sk6VarA, pk6Var, str, null, strR2, 60, null, null, null, 0, p65Var3, 12582912, 3072, 247928);
            hp7.t(p65Var3, jfc.l(o28Var, 24.0f));
            Object objM6 = p65Var3.M();
            if (objM6 == obj2) {
                String str3 = se2Var2.b;
                int length2 = str3.length();
                objM6 = qo7.u(new uid(str3, 4, lk7.q(length2, length2)));
                p65Var3.j0(objM6);
            }
            final l78 l78Var3 = (l78) objM6;
            uid uidVar2 = (uid) l78Var3.getValue();
            String strR3 = vo7.R(p65Var3, R.string.create_catalog_description);
            String strR4 = vo7.R(p65Var3, R.string.create_catalog_description_placeholder);
            sk6 sk6VarA2 = sk6.a(3, i11, 7, 118);
            int i12 = (i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32 ? 1 : i11;
            Object objM7 = p65Var3.M();
            if (i12 != 0 || objM7 == obj2) {
                objM7 = new ba(akcVar, i10);
                p65Var3.j0(objM7);
            }
            pk6 pk6Var2 = new pk6((x45) objM7, null, null, 62);
            r28 r28VarN2 = bgf.N(t40.F(w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2), sr4Var3), "list_description");
            boolean z2 = i9 == 256;
            Object objM8 = p65Var3.M();
            if (z2 || objM8 == obj2) {
                final int i13 = 1;
                objM8 = new x45() { // from class: he2
                    @Override // defpackage.x45
                    public final Object invoke(Object obj3) {
                        int i102 = i13;
                        c1e c1eVar = c1e.a;
                        l78 l78Var32 = l78Var3;
                        xd2 xd2Var2 = xd2Var;
                        uid uidVar22 = (uid) obj3;
                        uidVar22.getClass();
                        switch (i102) {
                            case 0:
                                l78Var32.setValue(uidVar22);
                                String str32 = uidVar22.a.b;
                                str32.getClass();
                                we2 we2Var = xd2Var2.b;
                                we2Var.getClass();
                                we2Var.d = str32;
                                vx0.c0(f76.F(we2Var), null, null, new ve2(we2Var, null, 2), 3);
                                break;
                            default:
                                l78Var32.setValue(uidVar22);
                                String str4 = uidVar22.a.b;
                                str4.getClass();
                                we2 we2Var2 = xd2Var2.b;
                                we2Var2.getClass();
                                we2Var2.e = str4;
                                vx0.c0(f76.F(we2Var2), null, null, new ve2(we2Var2, null, 0), 3);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var3.j0(objM8);
            }
            x45 x45Var = (x45) objM8;
            int i14 = 7;
            d46.m(uidVar2, x45Var, r28VarN2, false, false, null, 3, sk6VarA2, pk6Var2, strR3, null, strR4, 280, null, null, null, 0, p65Var3, 12582912, 3072, 247928);
            hp7.t(p65Var3, w2g.E(jfc.l(o28Var, 24.0f), 24.0f, 0.0f, 2));
            r28 r28VarE = w2g.E(jfc.d(o28Var, 1.0f), 24.0f, 0.0f, 2);
            wgd.w(-1003410150, 212064437, p65Var3, false);
            m73 m73Var = (m73) p65Var3.j(z22.h);
            Object objM9 = p65Var3.M();
            if (objM9 == obj2) {
                objM9 = b09.t(m73Var, p65Var3);
            }
            hl7 hl7Var = (hl7) objM9;
            Object objM10 = p65Var3.M();
            if (objM10 == obj2) {
                objM10 = b09.r(p65Var3);
            }
            z52 z52Var = (z52) objM10;
            Object objM11 = p65Var3.M();
            if (objM11 == obj2) {
                objM11 = qo7.u(Boolean.FALSE);
                p65Var3.j0(objM11);
            }
            l78 l78Var4 = (l78) objM11;
            Object objM12 = p65Var3.M();
            if (objM12 == obj2) {
                objM12 = b09.s(z52Var, p65Var3);
            }
            m62 m62Var2 = (m62) objM12;
            Object objM13 = p65Var3.M();
            c1e c1eVar = c1e.a;
            if (objM13 == obj2) {
                objM13 = b09.v(c1eVar, y3b.h, p65Var3);
            }
            l78 l78Var5 = (l78) objM13;
            boolean zD = p65Var3.d(257) | p65Var3.h(hl7Var);
            Object objM14 = p65Var3.M();
            if (zD || objM14 == obj2) {
                objM14 = new fr0(l78Var5, hl7Var, m62Var2, l78Var4, 7);
                m62Var = m62Var2;
                l78Var = l78Var4;
                p65Var3.j0(objM14);
            } else {
                m62Var = m62Var2;
                l78Var = l78Var4;
            }
            zk7 zk7Var = (zk7) objM14;
            Object objM15 = p65Var3.M();
            if (objM15 == obj2) {
                objM15 = new gr0(l78Var, m62Var, i14);
                p65Var3.j0(objM15);
            }
            m45 m45Var2 = (m45) objM15;
            boolean zH = p65Var3.h(hl7Var);
            Object objM16 = p65Var3.M();
            if (zH || objM16 == obj2) {
                objM16 = new hr0(hl7Var, i14);
                p65Var3.j0(objM16);
            }
            se2 se2Var4 = se2Var2;
            se2Var3 = se2Var4;
            hlg.j(wxb.a(r28VarE, false, (x45) objM16), pxf.E(1200550679, new je2(l78Var5, z52Var, m45Var2, se2Var4, xd2Var, 0), p65Var3), zk7Var, p65Var3, 48);
            ka1.B(p65Var3, false, o28Var, 24.0f, p65Var3);
            boolean z3 = i9 == 256;
            Object objM17 = p65Var3.M();
            if (z3 || objM17 == obj2) {
                obj = obj2;
                r6 = 1;
                f2 = 1.0f;
                sr4Var = sr4Var2;
                p65 p65Var4 = p65Var3;
                i4 = 2;
                f3 = 0.0f;
                gu1Var = new gu1(0, xd2Var, xd2.class, "onSubmitClicked", "onSubmitClicked()V", 0, 4);
                p65Var4.j0(gu1Var);
                p65Var2 = p65Var4;
            } else {
                gu1Var = objM17;
                p65Var2 = p65Var3;
                obj = obj2;
                r6 = 1;
                f2 = 1.0f;
                sr4Var = sr4Var2;
                i4 = 2;
                f3 = 0.0f;
            }
            p65 p65Var5 = p65Var2;
            fo7.r((m45) ((qh6) gu1Var), vo7.R(p65Var2, R.string.create_catalog_submit), xn7.M, bgf.N(w2g.E(jfc.d(jfc.q(new dr5(z46.q), f3, 348.0f, r6), f2), 24.0f, f3, i4), "submit"), se2Var3.d, p65Var5, 384, 0);
            p65Var5.p(r6);
            p65Var5.p(r6);
            p65Var5.p(r6);
            Object objM18 = p65Var5.M();
            if (objM18 == obj) {
                objM18 = new y8(sr4Var, null, i4);
                p65Var5.j0(objM18);
            }
            kyd.k(p65Var5, (b55) objM18, c1eVar);
            p65Var = p65Var5;
        } else {
            p65Var3.S();
            p65Var = p65Var3;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 22, se2Var3, akcVar, xd2Var, r28Var);
        }
    }

    public static boolean t0(int i2) {
        return i2 == -1;
    }

    public static final void u(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1820005969);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            rh4 rh4Var = jfc.c;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), bgf.N(r28Var.b(rh4Var), "loading"), 3, 1.0f);
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
            ar0 ar0Var2 = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var2, false);
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
            zk7 zk7VarC3 = dy0.c(ar0Var2, false);
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
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            xz5.o(iy0.a.a(o28Var, ar0Var), ((Boolean) p65Var.j(l36.a)).booleanValue() ? Float.valueOf(0.75f) : null, 0.0f, 0L, 0L, 0, p65Var, 0, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new aa(r28Var, i2, 14);
        }
    }

    public static final long u0(File file, f66 f66Var) {
        file.getClass();
        f66Var.getClass();
        return ((Number) C0(file, 0L, f66Var, zu2.o)).longValue();
    }

    public static final void v(vpc vpcVar, bo4 bo4Var, xd2 xd2Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        vpcVar.getClass();
        bo4Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1841270923);
        int i3 = i2 | (p65Var2.h(vpcVar) ? 4 : 2) | (p65Var2.h(bo4Var) ? 32 : 16) | (p65Var2.f(xd2Var) ? 256 : 128) | 3072;
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            l78 l78VarZ = guc.z(vpcVar, p65Var2, i3 & 14);
            nhc nhcVarF = mk7.F(p65Var2);
            akc akcVar = (akc) p65Var2.j(z22.r);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new ql1(7);
                p65Var2.j0(objM);
            }
            o28 o28Var = o28.b;
            int i4 = 18;
            pr7.b(bgf.N(wxb.a(o28Var, false, (x45) objM), "create_catalog_screen"), pxf.E(1319235471, new ge2(xd2Var), p65Var2), null, pxf.E(1967828241, new u8(nhcVarF, i4), p65Var2), null, 0, 0L, 0L, null, pxf.E(444307098, new nh(akcVar, xd2Var, l78VarZ, i4), p65Var2), p65Var2, 805309488, 500);
            p65Var = p65Var2;
            Resources resources = ((Context) p65Var.j(eo.b)).getResources();
            boolean zH = p65Var.h(bo4Var) | ((i3 & 896) == 256) | p65Var.f(nhcVarF) | p65Var.h(resources);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                ra raVar = new ra(bo4Var, xd2Var, nhcVarF, resources, null, 28);
                p65Var.j0(raVar);
                objM2 = raVar;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new swe(i2, 23, vpcVar, bo4Var, xd2Var, r28Var2);
        }
    }

    public static final File[] v0(File file, f66 f66Var) {
        file.getClass();
        f66Var.getClass();
        try {
            return file.listFiles();
        } catch (SecurityException e2) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 4), e2, 48);
            return null;
        } catch (Exception e3) {
            f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 5), e3, 48);
            return null;
        }
    }

    public static final void w(xd2 xd2Var, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-829308661);
        int i3 = (p65Var2.f(xd2Var) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.create_catalog_title);
            c09 c09VarJ = vn7.J(R.drawable.ic_close_24, 0, p65Var2);
            String strR2 = vo7.R(p65Var2, R.string.common_close);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new gu1(0, xd2Var, xd2.class, "onBackPressed", "onBackPressed()V", 0, 5);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.b(null, strR, (m45) ((qh6) objM), null, c09VarJ, strR2, 0L, 0L, p65Var, 32768, Mp4VideoDirectory.TAG_VENDOR);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ge2(xd2Var, i2);
        }
    }

    public static Bundle w0(String str) {
        Bundle bundle = new Bundle();
        bundle.putLong("1_timestamp_ms", System.currentTimeMillis());
        bundle.putString("0_auth_logger_id", str);
        bundle.putString("3_method", "");
        bundle.putString("2_result", "");
        bundle.putString("5_error_message", "");
        bundle.putString("4_error_code", "");
        bundle.putString("6_extras", "");
        return bundle;
    }

    public static final void x(ms1 ms1Var, ek8 ek8Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-847750320);
        int i3 = (p65Var.f(ms1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            String strW = ms1Var.f;
            if (strW == null) {
                strW = km4.w(p65Var, 1355735164, R.string.common_unknown_user, p65Var, false);
            } else {
                p65Var.Y(1355734575);
                p65Var.p(false);
            }
            String str = ms1Var.d;
            String strW2 = ms1Var.i;
            if (strW2 == null) {
                strW2 = km4.w(p65Var, 1355739330, R.string.common_unknown_collection, p65Var, false);
            } else {
                p65Var.Y(1355738586);
                p65Var.p(false);
            }
            kx kxVarW = ho2.w(p65Var, 1355743987);
            String strQ = vo7.Q(R.string.notification_type_collection_post_published_editor, new Object[]{strW, str, strW2}, p65Var);
            sn3 sn3Var = kt7.b;
            String str2 = strW2;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                wjd wjdVar = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i5 = i3 & 14;
                boolean z = (i4 == 32) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z || objM == uobVar) {
                    objM = new ps1(0, ms1Var, ek8Var);
                    p65Var.j0(objM);
                }
                kxVarW.a(new b07("annotation_editor", wjdVar, (e07) objM), 0, strW.length());
                int iZ = muc.Z(strQ, str, 0, false, 6);
                wjd wjdVar2 = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                boolean z2 = (i4 == 32) | (i5 == 4);
                Object objM2 = p65Var.M();
                if (z2 || objM2 == uobVar) {
                    objM2 = new ps1(1, ms1Var, ek8Var);
                    p65Var.j0(objM2);
                }
                kxVarW.a(new b07("annotation_post", wjdVar2, (e07) objM2), iZ, str.length() + iZ);
                int iZ2 = muc.Z(strQ, str2, 0, false, 6);
                wjd wjdVar3 = new wjd(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), null, 14);
                boolean z3 = (i5 == 4) | (i4 == 32);
                Object objM3 = p65Var.M();
                if (z3 || objM3 == uobVar) {
                    objM3 = new ps1(2, ms1Var, ek8Var);
                    p65Var.j0(objM3);
                }
                kxVarW.a(new b07("annotation_publication", wjdVar3, (e07) objM3), iZ2, str2.length() + iZ2);
                mx mxVarI = kxVarW.i();
                p65Var.p(false);
                rv8.e(ms1Var.a, ms1Var.b, pxf.E(940420313, new qs1(0, ms1Var, ek8Var), p65Var), mxVarI, p65Var, 384);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ns1(ms1Var, ek8Var, i2, 1);
        }
    }

    public static final void y(fpc fpcVar, cpc cpcVar, r28 r28Var, x12 x12Var, int i2) {
        int i3;
        ar0 ar0Var;
        Object jocVar;
        float f2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(280321694);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(fpcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(cpcVar) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.f(r28Var) ? 256 : 128;
        }
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
            int i6 = i3;
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            b24 b24Var = fpcVar.a;
            boolean z = (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                f2 = 1.0f;
                jocVar = new joc(0, cpcVar, cpc.class, "refresh", "refresh()V", 0, 2);
                p65Var.j0(jocVar);
            } else {
                jocVar = objM;
                ar0Var = ar0Var2;
                f2 = 1.0f;
            }
            iq7.a(b24Var, iy0.a.a(jfc.d(o28Var, f2), ar0Var), null, null, null, null, (m45) ((qh6) jocVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new y5c(i2, 6, fpcVar, cpcVar, r28Var);
        }
    }

    public static final void z(epc epcVar, cpc cpcVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1939423700);
        int i3 = i2 | (p65Var2.f(epcVar) ? 4 : 2) | (p65Var2.f(cpcVar) ? 32 : 16) | 384;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            r28 r28VarA0 = flb.a0(jfc.d(o28Var, 1.0f), ((zo7) p65Var2.j(kt7.b)).a, rv8.r);
            wv1 wv1VarA = uv1.a(qb8.c, z46.q, p65Var2, 48);
            long j2 = p65Var2.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarA0);
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
            tp7.c(0.0f, 0, 7, 0L, p65Var2, null);
            hp7.t(p65Var2, jfc.e(o28Var, 16.0f));
            boolean z = ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4);
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new nbb(cpcVar, 12, epcVar);
                p65Var2.j0(objM);
            }
            kyd.f((m45) objM, null, false, vo7.R(p65Var2, epcVar.c ? R.string.common_finish : R.string.common_continue), p65Var2, 0, 6);
            p65Var = p65Var2;
            hp7.t(p65Var, jfc.e(o28Var, 24.0f));
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i2, 24, epcVar, cpcVar, r28Var2);
        }
    }

    public static String z0(File file, f66 f66Var) {
        Charset charset = wk1.a;
        charset.getClass();
        f66Var.getClass();
        if (k0(file, f66Var)) {
            Boolean boolValueOf = Boolean.FALSE;
            try {
                boolValueOf = Boolean.valueOf(file.canRead());
            } catch (SecurityException e2) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 4), e2, 48);
            } catch (Exception e3) {
                f49.L(f66Var, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(file, 5), e3, 48);
            }
            if (boolValueOf.booleanValue()) {
                return (String) C0(file, null, f66Var, new ce(18, charset));
            }
        }
        return null;
    }

    public abstract void x0(Throwable th);

    public abstract void y0(n0c n0cVar);
}
