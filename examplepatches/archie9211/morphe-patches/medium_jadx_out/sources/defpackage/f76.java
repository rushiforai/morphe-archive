package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.susi.ui.apple.a;
import com.medium.reader.R;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.zip.DataFormatException;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import java.util.zip.Inflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class f76 implements kwb {
    public static final hpe l;
    public static final zi5 n;
    public static final /* synthetic */ int o = 0;
    public static final /* synthetic */ int p = 0;
    public static final /* synthetic */ int q = 0;
    public static final /* synthetic */ int r = 0;
    public static final mz1 a = new mz1(new e02(25), false, 228091511);
    public static final mz1 b = new mz1(new e02(26), false, -1967137355);
    public static final mz1 c = new mz1(new p02(21), false, -1766823088);
    public static final mz1 d = new mz1(new f02(8), false, 1027410276);
    public static final mz1 e = new mz1(new f02(9), false, 1079742570);
    public static final mz1 f = new mz1(new n02(14), false, 341174478);
    public static final mz1 g = new mz1(new n02(15), false, -270094580);
    public static final mz1 h = new mz1(new m02(17), false, -1520680409);
    public static final mz1 i = new mz1(new m02(18), false, -1826314938);
    public static final v93 j = new v93();
    public static final char[] k = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    public static final Object m = new Object();

    static {
        int i2 = 23;
        l = new hpe(i2);
        n = new zi5(i2);
    }

    public static byte[] A(byte[] bArr) {
        Deflater deflater = new Deflater(1);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            DeflaterOutputStream deflaterOutputStream = new DeflaterOutputStream(byteArrayOutputStream, deflater);
            try {
                deflaterOutputStream.write(bArr);
                deflaterOutputStream.close();
                deflater.end();
                return byteArrayOutputStream.toByteArray();
            } finally {
            }
        } catch (Throwable th) {
            deflater.end();
            throw th;
        }
    }

    public static long B(int i2, int i3) {
        return (((long) i3) & 4294967295L) | (((long) i2) << 32);
    }

    public static Application C(Context context) {
        if (context instanceof Application) {
            return (Application) context;
        }
        Context baseContext = context;
        while (baseContext instanceof ContextWrapper) {
            baseContext = ((ContextWrapper) baseContext).getBaseContext();
            if (baseContext instanceof Application) {
                return (Application) baseContext;
            }
        }
        ik4.o("Could not find an Application in the given context: ", context);
        return null;
    }

    public static final wg6 D(ih6 ih6Var) {
        if (ih6Var instanceof wg6) {
            return (wg6) ih6Var;
        }
        Object obj = null;
        if (!(ih6Var instanceof xj6)) {
            rd6.r("Cannot calculate JVM erasure for type: ", ih6Var);
            return null;
        }
        k1b k1bVar = ((xj6) ih6Var).b;
        fj6 fj6Var = xj6.d[0];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        List list = (List) objInvoke;
        Iterator it2 = list.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            ih6 ih6VarR = ((qj6) next).r();
            dh6 dh6Var = ih6VarR instanceof dh6 ? (dh6) ih6VarR : null;
            if (dh6Var != null && dh6Var.E() != pn1.INTERFACE && dh6Var.E() != pn1.ANNOTATION_CLASS) {
                obj = next;
                break;
            }
        }
        qj6 qj6Var = (qj6) obj;
        if (qj6Var == null) {
            qj6Var = (qj6) bu1.z0(list);
        }
        return qj6Var != null ? E(qj6Var) : n1b.a.b(Object.class);
    }

    public static final wg6 E(qj6 qj6Var) {
        ih6 ih6VarR = qj6Var.r();
        if (ih6VarR != null) {
            return D(ih6VarR);
        }
        rd6.r("Cannot calculate JVM erasure for type: ", qj6Var);
        return null;
    }

    public static final gp1 F(que queVar) {
        gp1 gp1Var;
        queVar.getClass();
        synchronized (n) {
            gp1Var = (gp1) queVar.c("androidx.lifecycle.viewmodel.internal.ViewModelCoroutineScope.JOB_KEY");
            if (gp1Var == null) {
                ib2 ib2Var = zx3.a;
                try {
                    r13 r13Var = xg3.a;
                    ib2Var = ff7.a.f;
                } catch (ei8 | IllegalStateException unused) {
                }
                gp1 gp1Var2 = new gp1(ib2Var.j0(qq7.h()));
                queVar.a("androidx.lifecycle.viewmodel.internal.ViewModelCoroutineScope.JOB_KEY", gp1Var2);
                gp1Var = gp1Var2;
            }
        }
        return gp1Var;
    }

    public static k16 G(jn3 jn3Var, v4b v4bVar, long j2, int i2) {
        if ((i2 & 2) != 0) {
            v4bVar = v4b.Restart;
        }
        if ((i2 & 4) != 0) {
            j2 = 0;
        }
        return new k16(jn3Var, v4bVar, j2);
    }

    public static final al6 H(x45 x45Var) {
        zk6 zk6Var = new zk6();
        x45Var.invoke(zk6Var);
        return new al6(zk6Var);
    }

    public static byte[] K(InputStream inputStream, int i2) throws IOException {
        byte[] bArr = new byte[i2];
        int i3 = 0;
        while (i3 < i2) {
            int i4 = inputStream.read(bArr, i3, i2 - i3);
            if (i4 < 0) {
                ygf.f(b09.w(i2, "Not enough bytes to read: "));
                return null;
            }
            i3 += i4;
        }
        return bArr;
    }

    public static byte[] L(FileInputStream fileInputStream, int i2, int i3) {
        Inflater inflater = new Inflater();
        try {
            byte[] bArr = new byte[i3];
            byte[] bArr2 = new byte[RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH];
            int i4 = 0;
            int iInflate = 0;
            while (!inflater.finished() && !inflater.needsDictionary() && i4 < i2) {
                int i5 = fileInputStream.read(bArr2);
                if (i5 < 0) {
                    throw new IllegalStateException("Invalid zip data. Stream ended after $totalBytesRead bytes. Expected " + i2 + " bytes");
                }
                inflater.setInput(bArr2, 0, i5);
                try {
                    iInflate += inflater.inflate(bArr, iInflate, i3 - iInflate);
                    i4 += i5;
                } catch (DataFormatException e2) {
                    throw new IllegalStateException(e2.getMessage());
                }
            }
            if (i4 == i2) {
                if (inflater.finished()) {
                    return bArr;
                }
                throw new IllegalStateException("Inflater did not finish");
            }
            throw new IllegalStateException("Didn't read enough bytes during decompression. expected=" + i2 + " actual=" + i4);
        } finally {
            inflater.end();
        }
    }

    public static Object M(Parcel parcel, Parcelable.Creator creator) {
        if (parcel.readInt() != 0) {
            return creator.createFromParcel(parcel);
        }
        return null;
    }

    public static long N(InputStream inputStream, int i2) {
        byte[] bArrK = K(inputStream, i2);
        long j2 = 0;
        for (int i3 = 0; i3 < i2; i3++) {
            j2 += ((long) (bArrK[i3] & 255)) << (i3 * 8);
        }
        return j2;
    }

    public static Object O(ub7 ub7Var, bc7 bc7Var, float f2, p4d p4dVar, int i2) {
        if ((i2 & 1) != 0) {
            bc7Var = (bc7) ub7Var.i.getValue();
        }
        Object objA = z78.a(ub7Var.n, new tb7(ub7Var, bc7Var, f2, (i2 & 4) != 0 ? ub7Var.d() : 1, !(f2 == ub7Var.e()), null), p4dVar);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public static wlc P(float f2, float f3, Object obj, int i2) {
        if ((i2 & 1) != 0) {
            f2 = 1.0f;
        }
        if ((i2 & 2) != 0) {
            f3 = 1500.0f;
        }
        if ((i2 & 4) != 0) {
            obj = null;
        }
        return new wlc(f2, f3, obj);
    }

    public static cud Q(int i2, int i3, yn3 yn3Var, int i4) {
        if ((i4 & 1) != 0) {
            i2 = 300;
        }
        if ((i4 & 2) != 0) {
            i3 = 0;
        }
        if ((i4 & 4) != 0) {
            yn3Var = ao3.a;
        }
        return new cud(i2, i3, yn3Var);
    }

    public static final void R(ae6 ae6Var, Object obj) {
        if (obj == null) {
            ae6Var.s0();
            return;
        }
        if (obj instanceof Map) {
            ae6Var.i();
            for (Map.Entry entry : ((Map) obj).entrySet()) {
                Object key = entry.getKey();
                Object value = entry.getValue();
                ae6Var.t0(String.valueOf(key));
                R(ae6Var, value);
            }
            ae6Var.e();
            return;
        }
        if (obj instanceof List) {
            ae6Var.n();
            Iterator it2 = ((Iterable) obj).iterator();
            while (it2.hasNext()) {
                R(ae6Var, it2.next());
            }
            ae6Var.k();
            return;
        }
        if (obj instanceof Boolean) {
            ae6Var.V(((Boolean) obj).booleanValue());
            return;
        }
        if (obj instanceof Integer) {
            ae6Var.u(((Number) obj).intValue());
            return;
        }
        if (obj instanceof Long) {
            ae6Var.t(((Number) obj).longValue());
            return;
        }
        if (obj instanceof Double) {
            ae6Var.z(((Number) obj).doubleValue());
            return;
        }
        if (obj instanceof rc6) {
            ae6Var.x((rc6) obj);
            return;
        }
        if (obj instanceof String) {
            ae6Var.E((String) obj);
            return;
        }
        StringBuilder sb = new StringBuilder("Cannot write ");
        sb.append(obj);
        wg6 wg6VarB = n1b.a.b(obj.getClass());
        sb.append(" of class '");
        sb.append(wg6VarB);
        sb.append("' to Json");
        throw new IllegalStateException(sb.toString().toString());
    }

    public static void S(OutputStream outputStream, long j2, int i2) {
        byte[] bArr = new byte[i2];
        for (int i3 = 0; i3 < i2; i3++) {
            bArr[i3] = (byte) ((j2 >> (i3 * 8)) & 255);
        }
        outputStream.write(bArr);
    }

    public static void T(ByteArrayOutputStream byteArrayOutputStream, int i2) {
        S(byteArrayOutputStream, i2, 2);
    }

    public static final void a(a aVar, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        r28 r28Var2;
        l78 l78Var;
        boolean z;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-760640882);
        int i3 = (p65Var2.f(aVar) ? 4 : 2) | i2 | 48;
        int i4 = 1;
        if (p65Var2.P(i3 & 1, (i3 & 19) != 18)) {
            boolean zBooleanValue = ((Boolean) p65Var2.j(l36.a)).booleanValue();
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = y30.j(p65Var2);
            }
            nhc nhcVar = (nhc) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(zBooleanValue ? "Apple Auth" : "");
                p65Var2.j0(objM2);
            }
            l78 l78Var2 = (l78) objM2;
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = qo7.u(zBooleanValue ? "apple.com" : "");
                p65Var2.j0(objM3);
            }
            l78 l78Var3 = (l78) objM3;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                g49 g49Var = new g49(zBooleanValue ? 0.42f : 0.0f);
                p65Var2.j0(g49Var);
                objM4 = g49Var;
            }
            g49 g49Var2 = (g49) objM4;
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = qo7.u(null);
                p65Var2.j0(objM5);
            }
            l78 l78Var4 = (l78) objM5;
            Object objM6 = p65Var2.M();
            if (objM6 == uobVar) {
                objM6 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM6);
            }
            l78 l78Var5 = (l78) objM6;
            Uri uri = Uri.parse("https://medium.com/m/callback/apple");
            Uri.Builder builderAppendQueryParameter = Uri.parse("https://appleid.apple.com/auth/authorize").buildUpon().appendQueryParameter("redirect_uri", "https://medium.com/m/redirect/apple").appendQueryParameter("client_id", "com.medium").appendQueryParameter("response_type", bu1.F0(ld5.a, " ", null, null, null, 62)).appendQueryParameter("response_mode", "form_post");
            byte[] bArr = new byte[16];
            new SecureRandom().nextBytes(bArr);
            String strEncodeToString = Base64.encodeToString(bArr, 11);
            strEncodeToString.getClass();
            Uri uriBuild = builderAppendQueryParameter.appendQueryParameter("state", strEncodeToString).appendQueryParameter("scope", bu1.F0(ld5.b, " ", null, null, null, 62)).build();
            Object objM7 = p65Var2.M();
            if (objM7 == uobVar) {
                objM7 = qo7.u(uriBuild.toString());
                p65Var2.j0(objM7);
            }
            l78 l78Var6 = (l78) objM7;
            if (zBooleanValue) {
                l78Var = l78Var6;
                z = false;
                p65Var2.Y(-6532108);
            } else {
                p65Var2.Y(-3706396);
                boolean zBooleanValue2 = ((Boolean) l78Var5.getValue()).booleanValue();
                Object objM8 = p65Var2.M();
                if (objM8 == uobVar) {
                    objM8 = new vs(l78Var4, i4);
                    p65Var2.j0(objM8);
                }
                l78Var = l78Var6;
                z = false;
                nk7.a(zBooleanValue2, (m45) objM8, p65Var2, 48, 0);
            }
            p65Var2.p(z);
            y0e y0eVarV = hk7.v(p65Var2);
            WeakHashMap weakHashMap = f5f.w;
            y0e y0eVar = new y0e(y0eVarV, tr7.o(p65Var2).c);
            Object objM9 = p65Var2.M();
            if (objM9 == uobVar) {
                objM9 = new nx(3);
                p65Var2.j0(objM9);
            }
            o28 o28Var = o28.b;
            p65Var = p65Var2;
            pr7.b(bgf.N(wxb.a(o28Var, false, (x45) objM9), "apple_auth").b(jfc.c), pxf.E(1168186258, new b45((Object) aVar, l78Var2, (Object) l78Var3, 18), p65Var2), null, pxf.E(-1727827436, new u8(nhcVar, 13), p65Var2), null, 0, 0L, 0L, y0eVar, pxf.E(-436016099, new p60(l78Var2, l78Var3, l78Var, l78Var5, l78Var4, g49Var2, uri, aVar, zBooleanValue), p65Var2), p65Var, 805309488, 244);
            r28Var2 = o28Var;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new r(aVar, r28Var2, i2, 15);
        }
    }

    public static final void b(String str, String str2, a aVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1608339515);
        int i3 = i2 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.f(str2) ? 32 : 16) | (p65Var2.f(aVar) ? 256 : 128);
        int i4 = 0;
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            mz1 mz1VarE = pxf.E(-1629905709, new q60(str, str2, i4), p65Var2);
            boolean z = (i3 & 896) == 256;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                vf vfVar = new vf(0, aVar, o60.class, "close", "close()V", 0, 27);
                p65Var2.j0(vfVar);
                objM = vfVar;
            }
            p65Var = p65Var2;
            qk7.f(mz1VarE, null, (m45) ((qh6) objM), null, vn7.J(R.drawable.ic_close_24, 0, p65Var2), vo7.R(p65Var2, R.string.common_close), 0L, 0L, null, p65Var, PanasonicMakernoteDirectory.TAG_WB_BLUE_LEVEL, 458);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 19, str, str2, aVar);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:105:0x027c A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x02b5  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x02c9  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x02e0  */
    /* JADX WARN: Removed duplicated region for block: B:116:? A[ADDED_TO_REGION, REMOVE, RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01e9 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0226  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void c(java.lang.String r24, defpackage.hl0 r25, defpackage.r28 r26, defpackage.zw7 r27, defpackage.xd r28, defpackage.w82 r29, float r30, int r31, defpackage.m3c r32, defpackage.x12 r33, int r34, int r35) {
        /*
            Method dump skipped, instruction units count: 794
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.c(java.lang.String, hl0, r28, zw7, xd, w82, float, int, m3c, x12, int, int):void");
    }

    public static final void d(x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1134324869);
        boolean z = false;
        boolean z2 = true;
        if (p65Var.P(i2 & 1, i2 != 0)) {
            yrb yrbVarK = wgf.K(p65Var);
            o28 o28Var = o28.b;
            r28 r28VarR = wgf.R(jfc.d(o28Var, 1.0f), yrbVarK, false, 14);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i3));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR2);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var, 1.0f), 8.0f));
            p65Var.Y(-1782907493);
            for (hl0 hl0Var : hl0.getEntries()) {
                p65 p65Var2 = p65Var;
                kjd.b(hl0Var.name(), w2g.G(o28Var, 24.0f, 0.0f, 0.0f, 0.0f, 14), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).h, p65Var2, 48, 0, 65532);
                p65Var = p65Var2;
                e(hl0Var, p65Var, 0);
                z = false;
                o28Var = o28Var;
                z2 = true;
            }
            p65Var.p(z);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new p02(i2, 3);
        }
    }

    public static final void e(hl0 hl0Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1567682102);
        int i3 = (p65Var.d(hl0Var.ordinal()) ? 4 : 2) | i2;
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            o28 o28Var = o28.b;
            m40.p(jfc.d(o28Var, 1.0f), null, null, null, 0, 0, pxf.E(1729581361, new xk0(hl0Var, i4), p65Var), p65Var, 1572870, 62);
            y30.y(o28Var, 1.0f, 8.0f, p65Var);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yk0(hl0Var, i2, i4);
        }
    }

    public static final void f(hl0 hl0Var, r28 r28Var, long j2, x12 x12Var, int i2) {
        long j3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1955784685);
        int i3 = (p65Var.d(hl0Var.ordinal()) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16) | 128;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                j3 = ((zo7) p65Var.j(kt7.b)).c;
            } else {
                p65Var.S();
                j3 = j2;
            }
            p65Var.q();
            dy0.a(flb.a0(jfc.l(r28Var, hl0Var.m114getSizeD9Ej5fM()), j3, bmb.a), p65Var, 0);
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qo(hl0Var, r28Var, j3, i2, 1);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:159:0x0297  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x02a4  */
    /* JADX WARN: Removed duplicated region for block: B:164:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x00bf  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e7  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x00f8  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0104  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.m45 r25, defpackage.r28 r26, boolean r27, defpackage.m3c r28, defpackage.g11 r29, defpackage.d46 r30, defpackage.cu0 r31, defpackage.hy8 r32, defpackage.c55 r33, defpackage.x12 r34, int r35, int r36) {
        /*
            Method dump skipped, instruction units count: 700
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.g(m45, r28, boolean, m3c, g11, d46, cu0, hy8, c55, x12, int, int):void");
    }

    public static final void h(final rf1 rf1Var, final ek8 ek8Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-227350300);
        int i3 = (p65Var.f(rf1Var) ? 4 : 2) | i2 | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            boolean z = rf1Var.a;
            String str = rf1Var.e;
            mx mxVar = new mx(rf1Var.c);
            Integer numValueOf = Integer.valueOf(R.drawable.ic_notifications_clap);
            mz1 mz1VarE = pxf.E(-1067799811, new so1(6, rf1Var), p65Var);
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            int i5 = i3 & 14;
            boolean z2 = (i4 == 32) | (i5 == 4);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                objM = new m45() { // from class: sf1
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i6 = i;
                        c1e c1eVar = c1e.a;
                        rf1 rf1Var2 = rf1Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i6) {
                            case 0:
                                ek8Var2.o(rf1Var2.f, rf1Var2.g);
                                break;
                            default:
                                ek8Var2.k(rf1Var2.b, rf1Var2.g);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            m45 m45Var = (m45) objM;
            int i6 = (i4 == 32 ? 1 : 0) | (i5 == 4 ? 1 : 0);
            Object objM2 = p65Var.M();
            if (i6 != 0 || objM2 == uobVar) {
                final int i7 = 1;
                objM2 = new m45() { // from class: sf1
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i62 = i7;
                        c1e c1eVar = c1e.a;
                        rf1 rf1Var2 = rf1Var;
                        ek8 ek8Var2 = ek8Var;
                        switch (i62) {
                            case 0:
                                ek8Var2.o(rf1Var2.f, rf1Var2.g);
                                break;
                            default:
                                ek8Var2.k(rf1Var2.b, rf1Var2.g);
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
            mwaVarS.d = new r(rf1Var, ek8Var, i2, 27);
        }
    }

    public static final void i(gw4 gw4Var, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        long j2;
        boolean z = gw4Var.b;
        x45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1149837183);
        int i3 = i2 | (p65Var2.f(gw4Var) ? 4 : 2) | (p65Var2.h(x45Var) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        if (p65Var2.P(i3 & 1, (i3 & 147) != 146)) {
            amb ambVarA = bmb.a(18.0f);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j3 = p65Var2.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            o28 o28Var = o28.b;
            r28 r28VarF = jfc.f(o28Var, 38.0f, 0.0f, 2);
            if (z) {
                p65Var2.Y(75580323);
                j2 = rz5.A(p65Var2).y;
                p65Var2.p(false);
            } else {
                p65Var2.Y(75675524);
                j2 = rz5.A(p65Var2).z;
                p65Var2.p(false);
            }
            r28 r28VarY = r40.y(bo.B(r28VarF, 1.0f, j2, ambVarA), ambVarA);
            vkb vkbVar = new vkb(0);
            boolean z2 = ((i3 & 14) == 4) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new gd3(x45Var, 16, gw4Var);
                p65Var2.j0(objM);
            }
            r28 r28VarF2 = w2g.F(hlg.r(r28VarY, false, null, vkbVar, (m45) objM, 11), 16.0f, 9.0f, 16.0f, 9.0f);
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j4 = p65Var2.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, r28VarF2);
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
            jjd.b(vo7.R(p65Var2, gw4Var.a.getDisplayName()), iy0.a.a(o28Var, z46.h), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, rz5.D(p65Var2).m, p65Var2, 0, 0, 131068);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.Y(74185757);
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 21, gw4Var, x45Var, r28Var);
        }
    }

    public static final void j(pha phaVar, jha jhaVar, kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var;
        jha jhaVar2;
        jha jhaVar3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1543804792);
        int i3 = i2 | (p65Var2.f(phaVar) ? 4 : 2) | (p65Var2.f(jhaVar) ? 32 : 16) | (p65Var2.f(kv6Var) ? 256 : 128) | (p65Var2.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var2.P(i3 & 1, (i3 & 1171) != 1170)) {
            boolean z = phaVar.b;
            int i4 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z2 = i4 == 32;
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (z2 || objM == uobVar) {
                c9a c9aVar = new c9a(0, jhaVar, jha.class, "refresh", "refresh()V", 0, 10);
                jhaVar3 = jhaVar;
                p65Var2.j0(c9aVar);
                objM = c9aVar;
            } else {
                jhaVar3 = jhaVar;
            }
            r28 r28VarB = r28Var.b(jfc.c);
            mz1 mz1VarE = pxf.E(-75880518, new gx4(kv6Var, phaVar, jhaVar3, 24), p65Var2);
            jhaVar2 = jhaVar;
            er7.d(z, (m45) ((qh6) objM), r28VarB, null, 0L, 0L, false, 0.0f, null, null, mz1VarE, p65Var2, 0, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            p65Var = p65Var2;
            boolean z3 = i4 == 32;
            Object objM2 = p65Var.M();
            if (z3 || objM2 == uobVar) {
                objM2 = new lo5(jhaVar2, null, 23);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var = p65Var2;
            jhaVar2 = jhaVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 27, r28Var, (Object) phaVar, (Object) jhaVar2, (Object) kv6Var);
        }
    }

    public static final void k(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1783807652);
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
            gq7.a(iy0.a.a(o28Var, ar0Var), null, vo7.R(p65Var, R.string.followers_empty_state_title), null, 0L, null, null, null, null, 0.0f, 0.0f, p65Var, 0, 0, 2042);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 11);
        }
    }

    public static final void l(rha rhaVar, jha jhaVar, r28 r28Var, x12 x12Var, int i2) {
        ar0 ar0Var;
        Object c9aVar;
        rha rhaVar2 = rhaVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(695106295);
        int i3 = i2 | (p65Var.f(rhaVar2) ? 4 : 2) | (p65Var.f(jhaVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var.b(jfc.c), 3, 1.0f);
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
            rhaVar2 = rhaVar;
            b24 b24Var = rhaVar2.a;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ar0Var = ar0Var2;
                c9aVar = new c9a(0, jhaVar, jha.class, "refresh", "refresh()V", 0, 11);
                p65Var.j0(c9aVar);
            } else {
                c9aVar = objM;
                ar0Var = ar0Var2;
            }
            iq7.a(b24Var, iy0.a.a(o28Var, ar0Var), null, null, null, null, (m45) ((qh6) c9aVar), null, p65Var, 0, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 13, rhaVar2, jhaVar, r28Var);
        }
    }

    public static final void m(kv6 kv6Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2014363522);
        int i3 = (p65Var.f(kv6Var) ? 4 : 2) | i2 | (p65Var.f(r28Var) ? 32 : 16);
        int i4 = 1;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            r28 r28VarB = r28Var.b(jfc.c);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new mr9(23);
                p65Var.j0(objM);
            }
            k40.t(r28VarB, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, ((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 817889280, 380);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mw4(kv6Var, r28Var, i2, i4);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:82:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void n(defpackage.tha r22, defpackage.jha r23, defpackage.r28 r24, defpackage.nhc r25, defpackage.kv6 r26, defpackage.x12 r27, int r28, int r29) {
        /*
            Method dump skipped, instruction units count: 315
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.n(tha, jha, r28, nhc, kv6, x12, int, int):void");
    }

    public static final void o(jha jhaVar, x12 x12Var, int i2) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1577723784);
        int i3 = (p65Var2.f(jhaVar) ? 4 : 2) | i2;
        if (p65Var2.P(i3 & 1, (i3 & 3) != 2)) {
            String strR = vo7.R(p65Var2, R.string.common_followers);
            boolean z = (i3 & 14) == 4;
            Object objM = p65Var2.M();
            if (z || objM == w12.a) {
                objM = new c9a(0, jhaVar, jha.class, "onBackPressed", "onBackPressed()V", 0, 12);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            qk7.g(null, strR, (m45) ((qh6) objM), null, null, null, 0L, 0L, null, p65Var, 0, 505);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kha(jhaVar, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:108:0x0144  */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x01dd A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:151:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:162:0x024e  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0254  */
    /* JADX WARN: Removed duplicated region for block: B:170:0x0263 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:171:0x0265  */
    /* JADX WARN: Removed duplicated region for block: B:174:0x0276  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x0295  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x02dc  */
    /* JADX WARN: Removed duplicated region for block: B:190:0x02e2  */
    /* JADX WARN: Removed duplicated region for block: B:196:0x02f6  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x02fd  */
    /* JADX WARN: Removed duplicated region for block: B:204:0x0313  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x0319  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x0334  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x033a  */
    /* JADX WARN: Removed duplicated region for block: B:220:0x034e  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x0354  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x0368  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x036e  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0382  */
    /* JADX WARN: Removed duplicated region for block: B:238:0x0388  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x03a2 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:247:0x03af  */
    /* JADX WARN: Removed duplicated region for block: B:250:0x03cd  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x03d1  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x03d6  */
    /* JADX WARN: Removed duplicated region for block: B:267:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x045c  */
    /* JADX WARN: Removed duplicated region for block: B:272:0x046f  */
    /* JADX WARN: Removed duplicated region for block: B:274:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void p(final defpackage.r28 r38, defpackage.kv6 r39, final defpackage.hy8 r40, final boolean r41, final defpackage.dn4 r42, final boolean r43, final defpackage.fx8 r44, defpackage.wd r45, defpackage.j70 r46, defpackage.zq0 r47, defpackage.g70 r48, final defpackage.x45 r49, defpackage.x12 r50, final int r51, final int r52, final int r53) {
        /*
            Method dump skipped, instruction units count: 1168
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.p(r28, kv6, hy8, boolean, dn4, boolean, fx8, wd, j70, zq0, g70, x45, x12, int, int, int):void");
    }

    public static final void q(final uid uidVar, final x45 x45Var, final r28 r28Var, final boolean z, final ht7 ht7Var, final int i2, final sk6 sk6Var, final pk6 pk6Var, final String str, final mx mxVar, final String str2, final Integer num, final c55 c55Var, final c55 c55Var2, final mkd mkdVar, final int i3, x12 x12Var, final int i4, final int i5) {
        int i6;
        x45 x45Var2;
        boolean z2;
        int i7;
        int i8;
        int i9;
        int i10;
        p65 p65Var;
        y3b y3bVar;
        uid uidVarB;
        boolean z3;
        o28 o28Var;
        long j2;
        long j3;
        y3b y3bVar2;
        c1e c1eVar;
        l78 l78Var;
        l78 l78Var2;
        sn3 sn3Var;
        m62 m62Var;
        z52 z52Var;
        o28 o28Var2;
        float f2;
        Object fr0Var;
        m62 m62Var2;
        l78 l78Var3;
        y3b y3bVar3 = y3b.h;
        x45Var.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-365112745);
        if ((i4 & 6) == 0) {
            i6 = (p65Var2.f(uidVar) ? 4 : 2) | i4;
        } else {
            i6 = i4;
        }
        if ((i4 & 48) == 0) {
            x45Var2 = x45Var;
            i6 |= p65Var2.h(x45Var2) ? 32 : 16;
        } else {
            x45Var2 = x45Var;
        }
        if ((i4 & 384) == 0) {
            i6 |= p65Var2.f(r28Var) ? 256 : 128;
        }
        if ((i4 & 3072) == 0) {
            z2 = z;
            i6 |= p65Var2.g(z2) ? 2048 : 1024;
        } else {
            z2 = z;
        }
        if ((i4 & 24576) == 0) {
            i6 |= p65Var2.g(false) ? 16384 : 8192;
        }
        int i11 = i4 & 196608;
        int i12 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (i11 == 0) {
            i6 |= p65Var2.g(false) ? 131072 : 65536;
        }
        if ((i4 & 1572864) == 0) {
            i7 = 196608;
            i6 |= p65Var2.d(ht7Var == null ? -1 : ht7Var.ordinal()) ? 1048576 : 524288;
        } else {
            i7 = 196608;
        }
        if ((i4 & 12582912) == 0) {
            i8 = 12582912;
            i9 = i2;
            i6 |= p65Var2.d(i9) ? 8388608 : 4194304;
        } else {
            i8 = 12582912;
            i9 = i2;
        }
        if ((i4 & 100663296) == 0) {
            i6 |= p65Var2.f(sk6Var) ? 67108864 : 33554432;
        }
        if ((i4 & 805306368) == 0) {
            i6 |= p65Var2.f(pk6Var) ? 536870912 : 268435456;
        }
        if ((i5 & 6) == 0) {
            i10 = i5 | (p65Var2.f(str) ? 4 : 2);
        } else {
            i10 = i5;
        }
        if ((i5 & 48) == 0) {
            i10 |= p65Var2.f(mxVar) ? 32 : 16;
        }
        if ((i5 & 384) == 0) {
            i10 |= p65Var2.f(str2) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i10 |= p65Var2.f(num) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i10 |= p65Var2.h(c55Var) ? 16384 : 8192;
        }
        if ((i5 & i7) == 0) {
            if (p65Var2.h(c55Var2)) {
                i12 = 131072;
            }
            i10 |= i12;
        }
        if ((i5 & 1572864) == 0) {
            i10 |= p65Var2.f(mkdVar) ? 1048576 : 524288;
        }
        if ((i5 & i8) == 0) {
            i10 |= p65Var2.d(i3) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i6 & 1, ((i6 & 306783379) == 306783378 && (i10 & 4793491) == 4793490) ? false : true)) {
            p65Var2.U();
            if ((i4 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            if (num != null) {
                y3bVar = y3bVar3;
                uidVarB = uid.b(uidVar, muc.x0(num.intValue(), uidVar.a.b), 0L, 6);
            } else {
                y3bVar = y3bVar3;
                uidVarB = uidVar;
            }
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var4 = (l78) objM;
            y3b y3bVar4 = y3bVar;
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            uid uidVar2 = uidVarB;
            long j4 = p65Var2.T;
            int i13 = (int) (j4 ^ (j4 >>> 32));
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
            tp7.B(p65Var2, q12.g, Integer.valueOf(i13));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            o28 o28Var3 = o28.b;
            if (str != null) {
                p65Var2.Y(-162203204);
                kjd.b(str, bgf.N(w2g.G(jfc.d(o28Var3, 1.0f), 0.0f, 0.0f, 0.0f, 12.0f, 7), "label"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, dl7.m(((eu7) p65Var2.j(kt7.c)).m), p65Var2, (i10 & 14) | 48, 0, 65532);
                z3 = false;
            } else {
                z3 = false;
                p65Var2.Y(-166869355);
            }
            p65Var2.p(z3);
            amb ambVarA = bmb.a(4.0f);
            if (((Boolean) l78Var4.getValue()).booleanValue()) {
                p65Var2.Y(-559407037);
                o28Var = o28Var3;
                j2 = ((zo7) p65Var2.j(kt7.b)).y;
                p65Var2.p(false);
            } else {
                o28Var = o28Var3;
                if (ht7Var == ht7.ERROR) {
                    p65Var2.Y(-559403937);
                    j2 = ((zo7) p65Var2.j(kt7.b)).D;
                    p65Var2.p(false);
                } else if (ht7Var == ht7.ACCENT) {
                    p65Var2.Y(-559400928);
                    j2 = ((zo7) p65Var2.j(kt7.b)).A;
                    p65Var2.p(false);
                } else {
                    p65Var2.Y(-559399336);
                    p65Var2.p(false);
                    j2 = uu1.g;
                }
            }
            upc upcVarA = wec.a(j2, null, "Border color", p65Var2, 384, 10);
            if (((Boolean) l78Var4.getValue()).booleanValue()) {
                p65Var2.Y(-161344535);
                j3 = z46.h(p65Var2).c;
                p65Var2.p(false);
            } else {
                p65Var2.Y(-161263160);
                j3 = z46.h(p65Var2).b;
                p65Var2.p(false);
            }
            upc upcVarA2 = wec.a(j3, null, "Background color", p65Var2, 384, 10);
            o28 o28Var4 = o28Var;
            r28 r28VarN = bgf.N(flb.a0(bo.B(jfc.f(jfc.d(o28Var4, 1.0f), 40.0f, 0.0f, 2), 1.0f, ((uu1) upcVarA.getValue()).a, ambVarA), ((uu1) upcVarA2.getValue()).a, ambVarA), "container");
            p65Var2.Y(-1003410150);
            p65Var2.Y(212064437);
            p65Var2.p(false);
            sn3 sn3Var2 = z22.h;
            m73 m73Var = (m73) p65Var2.j(sn3Var2);
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = b09.t(m73Var, p65Var2);
            }
            hl7 hl7Var = (hl7) objM2;
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = b09.r(p65Var2);
            }
            z52 z52Var2 = (z52) objM3;
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM4);
            }
            l78 l78Var5 = (l78) objM4;
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = b09.s(z52Var2, p65Var2);
            }
            m62 m62Var3 = (m62) objM5;
            Object objM6 = p65Var2.M();
            c1e c1eVar2 = c1e.a;
            if (objM6 == uobVar) {
                y3bVar2 = y3bVar4;
                objM6 = b09.v(c1eVar2, y3bVar2, p65Var2);
            } else {
                y3bVar2 = y3bVar4;
            }
            l78 l78Var6 = (l78) objM6;
            boolean zH = p65Var2.h(hl7Var) | p65Var2.d(257);
            Object objM7 = p65Var2.M();
            if (zH || objM7 == uobVar) {
                objM7 = new fr0(l78Var6, hl7Var, m62Var3, l78Var5, 16);
                c1eVar = c1eVar2;
                l78Var = l78Var6;
                l78Var2 = l78Var5;
                sn3Var = sn3Var2;
                m62Var = m62Var3;
                p65Var2.j0(objM7);
            } else {
                c1eVar = c1eVar2;
                l78Var = l78Var6;
                l78Var2 = l78Var5;
                sn3Var = sn3Var2;
                m62Var = m62Var3;
            }
            zk7 zk7Var = (zk7) objM7;
            Object objM8 = p65Var2.M();
            if (objM8 == uobVar) {
                z52Var = z52Var2;
                objM8 = new gr0(l78Var2, m62Var, 16);
                p65Var2.j0(objM8);
            } else {
                z52Var = z52Var2;
            }
            m45 m45Var = (m45) objM8;
            boolean zH2 = p65Var2.h(hl7Var);
            Object objM9 = p65Var2.M();
            if (zH2 || objM9 == uobVar) {
                objM9 = new hr0(hl7Var, 16);
                p65Var2.j0(objM9);
            }
            r28 r28VarA = wxb.a(r28VarN, false, (x45) objM9);
            y3b y3bVar5 = y3bVar2;
            c1e c1eVar3 = c1eVar;
            sn3 sn3Var3 = sn3Var;
            et7 et7Var = new et7(l78Var, z52Var, m45Var, mkdVar, i3, uidVar2, num, x45Var2, z2, sk6Var, pk6Var, i9, str2, uidVar, ht7Var, c55Var, c55Var2, l78Var4);
            p65Var = p65Var2;
            hlg.j(r28VarA, pxf.E(1200550679, et7Var, p65Var), zk7Var, p65Var, 48);
            p65Var.p(false);
            mkd mkdVarM = dl7.m(z46.n(p65Var).n);
            if (mxVar == null && num == null) {
                p65Var.Y(-166869355);
                p65Var.p(false);
                o28Var2 = o28Var4;
                f2 = 1.0f;
            } else {
                p65Var.Y(-156041675);
                o28Var2 = o28Var4;
                f2 = 1.0f;
                hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 12.0f));
                p65Var.p(false);
            }
            r28 r28VarD = jfc.d(o28Var2, f2);
            p65Var.Y(-1003410150);
            p65Var.Y(212064437);
            p65Var.p(false);
            m73 m73Var2 = (m73) p65Var.j(sn3Var3);
            Object objM10 = p65Var.M();
            if (objM10 == uobVar) {
                objM10 = b09.t(m73Var2, p65Var);
            }
            hl7 hl7Var2 = (hl7) objM10;
            Object objM11 = p65Var.M();
            if (objM11 == uobVar) {
                objM11 = b09.r(p65Var);
            }
            z52 z52Var3 = (z52) objM11;
            Object objM12 = p65Var.M();
            if (objM12 == uobVar) {
                objM12 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM12);
            }
            l78 l78Var7 = (l78) objM12;
            Object objM13 = p65Var.M();
            if (objM13 == uobVar) {
                objM13 = b09.s(z52Var3, p65Var);
            }
            m62 m62Var4 = (m62) objM13;
            Object objM14 = p65Var.M();
            if (objM14 == uobVar) {
                objM14 = b09.v(c1eVar3, y3bVar5, p65Var);
            }
            l78 l78Var8 = (l78) objM14;
            boolean zH3 = p65Var.h(hl7Var2) | p65Var.d(257);
            Object objM15 = p65Var.M();
            if (zH3 || objM15 == uobVar) {
                fr0Var = new fr0(l78Var8, hl7Var2, m62Var4, l78Var7, 17);
                m62Var2 = m62Var4;
                l78Var3 = l78Var7;
                p65Var.j0(fr0Var);
            } else {
                fr0Var = objM15;
                m62Var2 = m62Var4;
                l78Var3 = l78Var7;
            }
            zk7 zk7Var2 = (zk7) fr0Var;
            Object objM16 = p65Var.M();
            int i14 = 17;
            if (objM16 == uobVar) {
                objM16 = new gr0(l78Var3, m62Var2, 17);
                p65Var.j0(objM16);
            }
            m45 m45Var2 = (m45) objM16;
            boolean zH4 = p65Var.h(hl7Var2);
            Object objM17 = p65Var.M();
            if (zH4 || objM17 == uobVar) {
                objM17 = new hr0(hl7Var2, i14);
                p65Var.j0(objM17);
            }
            hlg.j(wxb.a(r28VarD, false, (x45) objM17), pxf.E(1200550679, new zs7(l78Var8, z52Var3, m45Var2, ht7Var, mxVar, mkdVarM, num, uidVar2, 1), p65Var), zk7Var2, p65Var, 48);
            p65Var.p(false);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: dt7
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i4 | 1);
                    int iY2 = tr7.y(i5);
                    f76.q(uidVar, x45Var, r28Var, z, ht7Var, i2, sk6Var, pk6Var, str, mxVar, str2, num, c55Var, c55Var2, mkdVar, i3, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0162  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x018a  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x01af  */
    /* JADX WARN: Removed duplicated region for block: B:141:0x01b2  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x01d1  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x01d8  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x01f1  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x01f6  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x020a  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0210  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x022b  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x036f  */
    /* JADX WARN: Removed duplicated region for block: B:246:0x0392  */
    /* JADX WARN: Removed duplicated region for block: B:248:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x009e  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00dd  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00e2  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0119  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0120  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(final java.lang.String r39, final defpackage.x45 r40, defpackage.r28 r41, boolean r42, defpackage.ht7 r43, int r44, defpackage.sk6 r45, defpackage.pk6 r46, java.lang.String r47, defpackage.mx r48, java.lang.String r49, java.lang.Integer r50, defpackage.c55 r51, defpackage.c55 r52, defpackage.mkd r53, int r54, defpackage.x12 r55, final int r56, final int r57, final int r58) {
        /*
            Method dump skipped, instruction units count: 935
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.r(java.lang.String, x45, r28, boolean, ht7, int, sk6, pk6, java.lang.String, mx, java.lang.String, java.lang.Integer, c55, c55, mkd, int, x12, int, int, int):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00ce  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00d0  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:95:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void s(defpackage.m45 r22, defpackage.r28 r23, boolean r24, defpackage.m3c r25, defpackage.g11 r26, defpackage.cu0 r27, defpackage.hy8 r28, defpackage.mz1 r29, defpackage.x12 r30, int r31, int r32) {
        /*
            Method dump skipped, instruction units count: 301
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.s(m45, r28, boolean, m3c, g11, cu0, hy8, mz1, x12, int, int):void");
    }

    public static final void t(String str, String str2, hha hhaVar, r28 r28Var, zha zhaVar, x12 x12Var, int i2) {
        zha zhaVar2;
        int i3;
        zha zhaVar3;
        str.getClass();
        str2.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(14829317);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(str2) ? 32 : 16) | (p65Var.f(hhaVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | 8192;
        if (p65Var.P(i4 & 1, (i4 & 9363) != 9362)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new bb0(str, str2, 11);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-57345);
                    zhaVar3 = (zha) to7.z(n1b.a.b(zha.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-57345);
                zhaVar3 = zhaVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(zhaVar3.o, p65Var, 0);
            nhc nhcVarF = mk7.F(p65Var);
            kv6 kv6VarA = pv6.a(p65Var);
            boolean zF = p65Var.f(zhaVar3) | ((i3 & 896) == 256);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new lha(hhaVar, zhaVar3);
                p65Var.j0(objM2);
            }
            lha lhaVar = (lha) objM2;
            n((tha) l78VarZ.getValue(), lhaVar, r28Var, nhcVarF, kv6VarA, p65Var, (i3 >> 3) & 896, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = kyd.M(p65Var);
                p65Var.j0(objM3);
            }
            sb2 sb2Var = (sb2) objM3;
            boolean zH = p65Var.h(zhaVar3) | p65Var.f(nhcVarF) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(lhaVar);
            Object objM4 = p65Var.M();
            if (zH || objM4 == uobVar) {
                uk8 uk8Var = new uk8(zhaVar3, nhcVarF, sb2Var, resources, lhaVar, (n92) null, 13);
                p65Var.j0(uk8Var);
                objM4 = uk8Var;
            }
            kyd.k(p65Var, (b55) objM4, c1e.a);
            boolean zF2 = p65Var.f(kv6VarA) | p65Var.f(lhaVar);
            Object objM5 = p65Var.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new nx9(kv6VarA, lhaVar, null, 13);
                p65Var.j0(objM5);
            }
            kyd.k(p65Var, (b55) objM5, kv6VarA);
            zhaVar2 = zhaVar3;
        } else {
            p65Var.S();
            zhaVar2 = zhaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d98((Object) str, (Object) str2, (Object) hhaVar, r28Var, (que) zhaVar2, i2, 15);
        }
    }

    public static final void u(r28 r28Var, b55 b55Var, x12 x12Var, int i2, int i3) {
        int i4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1298353104);
        int i5 = i3 & 1;
        if (i5 != 0) {
            i4 = i2 | 6;
        } else if ((i2 & 6) == 0) {
            i4 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var.h(b55Var) ? 32 : 16;
        }
        if (p65Var.P(i4 & 1, (i4 & 19) != 18)) {
            if (i5 != 0) {
                r28Var = o28.b;
            }
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new kvc(uob.f);
                p65Var.j0(objM);
            }
            v((kvc) objM, r28Var, b55Var, p65Var, (i4 << 3) & PhotoshopDirectory.TAG_CAPTION);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fvc(r28Var, b55Var, i2, i3);
        }
    }

    public static final void v(kvc kvcVar, r28 r28Var, b55 b55Var, x12 x12Var, int i2) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-511989831);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.h(kvcVar) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(b55Var) ? 256 : 128;
        }
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            n65 n65VarH = w2g.H(p65Var);
            r28 r28VarR = gx1.R(p65Var, r28Var);
            i89 i89VarL = p65Var.l();
            ot2 ot2Var = ot2.C;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, kvcVar.c, kvcVar);
            tp7.B(p65Var, kvcVar.d, n65VarH);
            tp7.B(p65Var, kvcVar.e, b55Var);
            r12.W.getClass();
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            p65Var.p(true);
            if (p65Var.B()) {
                p65Var.Y(-1259187287);
                p65Var.p(false);
            } else {
                p65Var.Y(-1259245908);
                boolean zH = p65Var.h(kvcVar);
                Object objM = p65Var.M();
                if (zH || objM == w12.a) {
                    objM = new bd9(24, kvcVar);
                    p65Var.j0(objM);
                }
                kyd.v((m45) objM, p65Var);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new gvc(kvcVar, r28Var, b55Var, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:122:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00dc  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x00ec  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00f5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void w(defpackage.m45 r22, defpackage.r28 r23, boolean r24, defpackage.m3c r25, defpackage.g11 r26, defpackage.hy8 r27, defpackage.c55 r28, defpackage.x12 r29, int r30, int r31) {
        /*
            Method dump skipped, instruction units count: 400
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.w(m45, r28, boolean, m3c, g11, hy8, c55, x12, int, int):void");
    }

    public static final void x(r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-70875271);
        int i4 = i2 | 6;
        int i5 = 2;
        if (p65Var.P(i4 & 1, (i4 & 3) != 2)) {
            yrb yrbVarK = wgf.K(p65Var);
            o28 o28Var = o28.b;
            r28 r28VarC = w2g.C(wgf.R(o28Var, yrbVarK, false, 14).b(jfc.c), 24.0f);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i6 = (int) (j2 ^ (j2 >>> 32));
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i6));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sn3 sn3Var = kt7.c;
            kjd.b("Default", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(sn3Var)).h, p65Var, 6, 0, 65534);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var, 1.0f), 16.0f));
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new ss7(i5);
                p65Var.j0(objM);
            }
            r("", (x45) objM, null, false, null, 0, null, null, "Label", null, null, null, null, null, null, 0, p65Var, 54, 6, 261116);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var, 1.0f), 16.0f));
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ss7(3);
                p65Var.j0(objM2);
            }
            o28 o28Var2 = o28Var;
            r("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at purus nec ante mattis lacinia. Morbi et cursus leo.", (x45) objM2, null, false, null, 0, null, null, "Label", null, null, 90, null, null, null, 0, p65Var, 54, 3078, 252924);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            String str = "Optional description";
            mx mxVar = new mx(str);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new ss7(4);
                p65Var.j0(objM3);
            }
            r("", (x45) objM3, null, false, null, 0, null, null, "Label", mxVar, "Placeholder text", 90, null, null, null, 0, p65Var, 54, 3510, 246780);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            mx mxVar2 = new mx(str);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = new ss7(5);
                p65Var.j0(objM4);
            }
            r("Default text", (x45) objM4, null, false, null, 0, null, null, "Label", mxVar2, "Placeholder text", 90, h02.a, null, null, 0, p65Var, 54, 28086, 230396);
            y30.y(o28Var2, 1.0f, 16.0f, p65Var);
            vp7.b(0.0f, 0, 7, 0L, p65Var, null);
            kjd.b("Error", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(sn3Var)).h, p65Var, 6, 0, 65534);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            mx mxVar3 = new mx(str);
            ht7 ht7Var = ht7.ERROR;
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new ss7(6);
                p65Var.j0(objM5);
            }
            r("", (x45) objM5, null, false, ht7Var, 0, null, null, "Label", mxVar3, "Placeholder text", 90, null, h02.b, null, 0, p65Var, 1572918, 200118, 213948);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            mx mxVar4 = new mx(str);
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = new ss7(7);
                p65Var.j0(objM6);
            }
            r("Negative text", (x45) objM6, null, false, ht7Var, 0, null, null, "Label", mxVar4, "Placeholder text", 90, null, h02.c, null, 0, p65Var, 1572918, 200118, 213948);
            y30.y(o28Var2, 1.0f, 16.0f, p65Var);
            vp7.b(0.0f, 0, 7, 0L, p65Var, null);
            kjd.b("Accent", null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(sn3Var)).h, p65Var, 6, 0, 65534);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            mx mxVar5 = new mx(str);
            ht7 ht7Var2 = ht7.ACCENT;
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = new ss7(8);
                p65Var.j0(objM7);
            }
            r("", (x45) objM7, null, false, ht7Var2, 0, null, null, "Label", mxVar5, "Placeholder text", 90, null, h02.d, null, 0, p65Var, 1572918, 200118, 213948);
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            mx mxVar6 = new mx(str);
            Object objM8 = p65Var.M();
            if (objM8 == uobVar) {
                i3 = 1;
                objM8 = new ss7(i3);
                p65Var.j0(objM8);
            } else {
                i3 = 1;
            }
            r("Positive text", (x45) objM8, null, false, ht7Var2, 0, null, null, "Label", mxVar6, "Placeholder text", 90, null, h02.e, null, 0, p65Var, 1572918, 200118, 213948);
            p65Var = p65Var;
            hp7.t(p65Var, jfc.e(jfc.d(o28Var2, 1.0f), 16.0f));
            p65Var.p(true);
            r28Var2 = o28Var2;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var2, i2, 21);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object y(defpackage.ub7 r14, defpackage.bc7 r15, float r16, defpackage.ac7 r17, float r18, defpackage.zb7 r19, defpackage.p4d r20, int r21) {
        /*
            r6 = r17
            r0 = r21
            int r2 = r14.d()
            r1 = r0 & 4
            if (r1 == 0) goto L1a
            k49 r1 = r14.c
            java.lang.Object r1 = r1.getValue()
            java.lang.Number r1 = (java.lang.Number) r1
            int r1 = r1.intValue()
        L18:
            r3 = r1
            goto L1e
        L1a:
            r1 = 2147483647(0x7fffffff, float:NaN)
            goto L18
        L1e:
            r1 = r0 & 8
            if (r1 == 0) goto L30
            k49 r1 = r14.d
            java.lang.Object r1 = r1.getValue()
            java.lang.Boolean r1 = (java.lang.Boolean) r1
            boolean r1 = r1.booleanValue()
        L2e:
            r4 = r1
            goto L32
        L30:
            r1 = 0
            goto L2e
        L32:
            r1 = r0 & 16
            if (r1 == 0) goto L3c
            float r1 = r14.f()
            r5 = r1
            goto L3e
        L3c:
            r5 = r16
        L3e:
            r1 = r0 & 64
            if (r1 == 0) goto L61
            r1 = 0
            int r7 = (r5 > r1 ? 1 : (r5 == r1 ? 0 : -1))
            if (r7 >= 0) goto L4a
            if (r15 != 0) goto L4a
            goto L56
        L4a:
            if (r15 != 0) goto L4d
            goto L5f
        L4d:
            if (r7 >= 0) goto L59
            if (r6 == 0) goto L56
            float r1 = r6.a(r15)
            goto L5f
        L56:
            r1 = 1065353216(0x3f800000, float:1.0)
            goto L5f
        L59:
            if (r6 == 0) goto L5f
            float r1 = r6.b(r15)
        L5f:
            r8 = r1
            goto L63
        L61:
            r8 = r18
        L63:
            r0 = r0 & 256(0x100, float:3.59E-43)
            if (r0 == 0) goto L6b
            zb7 r0 = defpackage.zb7.Immediately
            r11 = r0
            goto L6d
        L6b:
            r11 = r19
        L6d:
            z78 r13 = r14.n
            qb7 r0 = new qb7
            r12 = 0
            r9 = 0
            r10 = 0
            r1 = r14
            r7 = r15
            r0.<init>(r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12)
            r14 = r20
            java.lang.Object r14 = defpackage.z78.a(r13, r0, r14)
            tb2 r15 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r14 != r15) goto L84
            return r14
        L84:
            c1e r14 = defpackage.c1e.a
            return r14
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f76.y(ub7, bc7, float, ac7, float, zb7, p4d, int):java.lang.Object");
    }

    public static String z(byte[] bArr) {
        int length = bArr.length;
        StringBuilder sb = new StringBuilder(length + length);
        for (int i2 = 0; i2 < length; i2++) {
            int i3 = (bArr[i2] & 240) >>> 4;
            char[] cArr = k;
            sb.append(cArr[i3]);
            sb.append(cArr[bArr[i2] & 15]);
        }
        return sb.toString();
    }

    public abstract int I(int i2);

    public abstract int J(int i2);

    @Override // defpackage.kwb
    public int W(int i2) {
        int I = I(i2);
        if (I == -1 || I(I) == -1) {
            return -1;
        }
        return I;
    }

    @Override // defpackage.kwb
    public int Y(int i2) {
        int iJ = J(i2);
        if (iJ == -1 || J(iJ) == -1) {
            return -1;
        }
        return iJ;
    }

    @Override // defpackage.kwb
    public int h0(int i2) {
        return J(i2);
    }

    @Override // defpackage.kwb
    public int i0(int i2) {
        return I(i2);
    }
}
