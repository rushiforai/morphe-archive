package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.net.NetworkRequest;
import android.net.Uri;
import android.os.Build;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import android.os.StrictMode;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.MetricAffectingSpan;
import android.util.Log;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.medium.android.graphql.type.PublicationSubmissionStatus;
import com.medium.reader.R;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.interfaces.ECPrivateKey;
import java.security.interfaces.ECPublicKey;
import java.security.spec.ECParameterSpec;
import java.security.spec.ECPoint;
import java.security.spec.ECPublicKeySpec;
import java.security.spec.EllipticCurve;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CancellationException;
import javax.crypto.KeyAgreement;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class en7 {
    public static final /* synthetic */ int a = 0;
    public static final /* synthetic */ int b = 0;

    public static final long A(double d) {
        return M((float) d, 4294967296L);
    }

    public static final long B(int i) {
        return M(i, 4294967296L);
    }

    public static File C(Context context) {
        File cacheDir = context.getCacheDir();
        if (cacheDir == null) {
            return null;
        }
        String str = ".font" + Process.myPid() + "-" + Process.myTid() + "-";
        for (int i = 0; i < 100; i++) {
            File file = new File(cacheDir, b09.w(i, str));
            if (file.createNewFile()) {
                return file;
            }
        }
        return null;
    }

    public static final qjd D(txb txbVar) {
        x45 x45Var;
        ArrayList arrayList = new ArrayList();
        Object objG = txbVar.a.g(sxb.a);
        if (objG == null) {
            objG = null;
        }
        i4 i4Var = (i4) objG;
        if (i4Var == null || (x45Var = (x45) i4Var.b) == null || !((Boolean) x45Var.invoke(arrayList)).booleanValue()) {
            return null;
        }
        return (qjd) arrayList.get(0);
    }

    public static final tm0 E(int i) {
        if (i == 0) {
            return tm0.EXPONENTIAL;
        }
        if (i == 1) {
            return tm0.LINEAR;
        }
        ay0.e(ev6.w("Could not convert ", i, " to BackoffPolicy"));
        return null;
    }

    public static final te8 F(int i) {
        if (i == 0) {
            return te8.NOT_REQUIRED;
        }
        if (i == 1) {
            return te8.CONNECTED;
        }
        if (i == 2) {
            return te8.UNMETERED;
        }
        if (i == 3) {
            return te8.NOT_ROAMING;
        }
        if (i == 4) {
            return te8.METERED;
        }
        if (Build.VERSION.SDK_INT >= 30 && i == 5) {
            return te8.TEMPORARILY_UNMETERED;
        }
        ay0.e(ev6.w("Could not convert ", i, " to NetworkType"));
        return null;
    }

    public static final lw8 G(int i) {
        if (i == 0) {
            return lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST;
        }
        if (i == 1) {
            return lw8.DROP_WORK_REQUEST;
        }
        ay0.e(ev6.w("Could not convert ", i, " to OutOfQuotaPolicy"));
        return null;
    }

    public static final j7f H(int i) {
        if (i == 0) {
            return j7f.ENQUEUED;
        }
        if (i == 1) {
            return j7f.RUNNING;
        }
        if (i == 2) {
            return j7f.SUCCEEDED;
        }
        if (i == 3) {
            return j7f.FAILED;
        }
        if (i == 4) {
            return j7f.BLOCKED;
        }
        if (i == 5) {
            return j7f.CANCELLED;
        }
        ay0.e(ev6.w("Could not convert ", i, " to State"));
        return null;
    }

    public static final boolean I(PublicationSubmissionStatus publicationSubmissionStatus) {
        publicationSubmissionStatus.getClass();
        return publicationSubmissionStatus == PublicationSubmissionStatus.ACCEPTED || publicationSubmissionStatus == PublicationSubmissionStatus.CHANGES_MADE || publicationSubmissionStatus == PublicationSubmissionStatus.CHANGES_REQUESTED || publicationSubmissionStatus == PublicationSubmissionStatus.IN_REVIEW || publicationSubmissionStatus == PublicationSubmissionStatus.OPEN;
    }

    public static final e41 J(b6a b6aVar) {
        int i = b6aVar == null ? -1 : o7a.a[b6aVar.ordinal()];
        return i != 1 ? i != 2 ? i != 3 ? i != 4 ? e41.DECLARATION : e41.SYNTHESIZED : e41.DELEGATION : e41.FAKE_OVERRIDE : e41.DECLARATION;
    }

    public static MappedByteBuffer K(Context context, Uri uri) {
        ParcelFileDescriptor parcelFileDescriptorOpenFileDescriptor;
        try {
            parcelFileDescriptorOpenFileDescriptor = context.getContentResolver().openFileDescriptor(uri, "r", null);
        } catch (IOException unused) {
        }
        if (parcelFileDescriptorOpenFileDescriptor == null) {
            if (parcelFileDescriptorOpenFileDescriptor != null) {
                parcelFileDescriptorOpenFileDescriptor.close();
                return null;
            }
            return null;
        }
        try {
            FileInputStream fileInputStream = new FileInputStream(parcelFileDescriptorOpenFileDescriptor.getFileDescriptor());
            try {
                FileChannel channel = fileInputStream.getChannel();
                MappedByteBuffer map = channel.map(FileChannel.MapMode.READ_ONLY, 0L, channel.size());
                fileInputStream.close();
                parcelFileDescriptorOpenFileDescriptor.close();
                return map;
            } finally {
            }
        } finally {
        }
    }

    public static final int L(te8 te8Var) {
        te8Var.getClass();
        int i = j8f.c[te8Var.ordinal()];
        if (i == 1) {
            return 0;
        }
        if (i == 2) {
            return 1;
        }
        if (i == 3) {
            return 2;
        }
        if (i == 4) {
            return 3;
        }
        if (i == 5) {
            return 4;
        }
        if (Build.VERSION.SDK_INT >= 30 && te8Var == te8.TEMPORARILY_UNMETERED) {
            return 5;
        }
        rd6.s("Could not convert ", te8Var, " to int");
        return 0;
    }

    public static final long M(float f, long j) {
        long jFloatToRawIntBits = j | (((long) Float.floatToRawIntBits(f)) & 4294967295L);
        rkd[] rkdVarArr = qkd.b;
        return jFloatToRawIntBits;
    }

    public static void N(gn6 gn6Var, Annotation annotation) {
        Class clsT = vx0.T(vx0.P(annotation));
        en6 en6VarI = gn6Var.i(e0b.a(clsT), new d0b(annotation));
        if (en6VarI != null) {
            O(en6VarI, annotation, clsT);
        }
    }

    public static void O(en6 en6Var, Annotation annotation, Class cls) {
        Method[] declaredMethods = cls.getDeclaredMethods();
        declaredMethods.getClass();
        for (Method method : declaredMethods) {
            try {
                Object objInvoke = method.invoke(annotation, null);
                objInvoke.getClass();
                n98 n98VarE = n98.e(method.getName());
                Class<?> enclosingClass = objInvoke.getClass();
                if (enclosingClass.equals(Class.class)) {
                    en6Var.j(n98VarE, o((Class) objInvoke));
                } else if (i1b.a.contains(enclosingClass)) {
                    en6Var.g(n98VarE, objInvoke);
                } else {
                    List list = e0b.a;
                    if (Enum.class.isAssignableFrom(enclosingClass)) {
                        if (!enclosingClass.isEnum()) {
                            enclosingClass = enclosingClass.getEnclosingClass();
                        }
                        enclosingClass.getClass();
                        en6Var.n(n98VarE, e0b.a(enclosingClass), n98.e(((Enum) objInvoke).name()));
                    } else if (Annotation.class.isAssignableFrom(enclosingClass)) {
                        Class<?>[] interfaces = enclosingClass.getInterfaces();
                        interfaces.getClass();
                        Class cls2 = (Class) k80.K0(interfaces);
                        cls2.getClass();
                        en6 en6VarP = en6Var.p(e0b.a(cls2), n98VarE);
                        if (en6VarP != null) {
                            O(en6VarP, (Annotation) objInvoke, cls2);
                        }
                    } else {
                        if (!enclosingClass.isArray()) {
                            throw new UnsupportedOperationException("Unsupported annotation argument value (" + enclosingClass + "): " + objInvoke);
                        }
                        fn6 fn6VarM = en6Var.m(n98VarE);
                        if (fn6VarM != null) {
                            Class<?> componentType = enclosingClass.getComponentType();
                            if (componentType.isEnum()) {
                                mn1 mn1VarA = e0b.a(componentType);
                                for (Object obj : (Object[]) objInvoke) {
                                    obj.getClass();
                                    fn6VarM.f(mn1VarA, n98.e(((Enum) obj).name()));
                                }
                            } else if (componentType.equals(Class.class)) {
                                for (Object obj2 : (Object[]) objInvoke) {
                                    obj2.getClass();
                                    fn6VarM.r(o((Class) obj2));
                                }
                            } else if (Annotation.class.isAssignableFrom(componentType)) {
                                for (Object obj3 : (Object[]) objInvoke) {
                                    en6 en6VarC = fn6VarM.c(e0b.a(componentType));
                                    if (en6VarC != null) {
                                        obj3.getClass();
                                        O(en6VarC, (Annotation) obj3, componentType);
                                    }
                                }
                            } else {
                                for (Object obj4 : (Object[]) objInvoke) {
                                    fn6VarM.e(obj4);
                                }
                            }
                            fn6VarM.b();
                        }
                    }
                }
            } catch (IllegalAccessException unused) {
            }
        }
        en6Var.b();
    }

    public static final zt P(gu guVar, int i) {
        Object next;
        Iterator<T> it2 = guVar.getLayoutNodeToHolder().entrySet().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (((aq6) ((Map.Entry) next).getKey()).b == i) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        if (entry != null) {
            return (zt) entry.getValue();
        }
        return null;
    }

    public static final byte[] Q(Set set) throws IOException {
        if (set.isEmpty()) {
            return new byte[0];
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            try {
                objectOutputStream.writeInt(set.size());
                Iterator it2 = set.iterator();
                while (it2.hasNext()) {
                    d72 d72Var = (d72) it2.next();
                    objectOutputStream.writeUTF(d72Var.a.toString());
                    objectOutputStream.writeBoolean(d72Var.b);
                }
                objectOutputStream.close();
                byteArrayOutputStream.close();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArray.getClass();
                return byteArray;
            } finally {
            }
        } finally {
        }
    }

    public static final int R(j7f j7fVar) {
        j7fVar.getClass();
        switch (j8f.a[j7fVar.ordinal()]) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            default:
                ygf.a();
                break;
        }
        return 0;
    }

    public static final le8 T(byte[] bArr) throws IOException {
        bArr.getClass();
        if (Build.VERSION.SDK_INT < 28 || bArr.length == 0) {
            return new le8(null);
        }
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
            try {
                int i = objectInputStream.readInt();
                int[] iArr = new int[i];
                for (int i2 = 0; i2 < i; i2++) {
                    iArr[i2] = objectInputStream.readInt();
                }
                int i3 = objectInputStream.readInt();
                int[] iArr2 = new int[i3];
                for (int i4 = 0; i4 < i3; i4++) {
                    iArr2[i4] = objectInputStream.readInt();
                }
                le8 le8VarH = uy.h(iArr2, iArr);
                objectInputStream.close();
                byteArrayInputStream.close();
                return le8VarH;
            } finally {
            }
        } finally {
        }
    }

    public static int U(EllipticCurve ellipticCurve) {
        return (nfg.a(ellipticCurve).subtract(BigInteger.ONE).bitLength() + 7) / 8;
    }

    public static String V(String str) {
        try {
            Object objInvoke = Class.forName("android.os.SystemProperties").getDeclaredMethod("get", String.class).invoke(null, str);
            if (objInvoke instanceof String) {
                return (String) objInvoke;
            }
        } catch (Exception unused) {
        }
        return null;
    }

    public static BigInteger W(BigInteger bigInteger, boolean z, EllipticCurve ellipticCurve) throws GeneralSecurityException {
        BigInteger bigIntegerA = nfg.a(ellipticCurve);
        BigInteger bigIntegerMod = bigInteger.multiply(bigInteger).add(ellipticCurve.getA()).multiply(bigInteger).add(ellipticCurve.getB()).mod(bigIntegerA);
        if (bigIntegerA.signum() != 1) {
            throw new InvalidAlgorithmParameterException("p must be positive");
        }
        BigInteger bigIntegerMod2 = bigIntegerMod.mod(bigIntegerA);
        BigInteger bigIntegerAdd = BigInteger.ZERO;
        if (!bigIntegerMod2.equals(bigIntegerAdd)) {
            if (bigIntegerA.testBit(0) && bigIntegerA.testBit(1)) {
                bigIntegerAdd = bigIntegerMod2.modPow(bigIntegerA.add(BigInteger.ONE).shiftRight(2), bigIntegerA);
            } else if (!bigIntegerA.testBit(0) || bigIntegerA.testBit(1)) {
                bigIntegerAdd = null;
            } else {
                bigIntegerAdd = BigInteger.ONE;
                BigInteger bigIntegerShiftRight = bigIntegerA.subtract(bigIntegerAdd).shiftRight(1);
                int i = 0;
                while (true) {
                    BigInteger bigIntegerMod3 = bigIntegerAdd.multiply(bigIntegerAdd).subtract(bigIntegerMod2).mod(bigIntegerA);
                    if (bigIntegerMod3.equals(BigInteger.ZERO)) {
                        break;
                    }
                    BigInteger bigIntegerModPow = bigIntegerMod3.modPow(bigIntegerShiftRight, bigIntegerA);
                    BigInteger bigIntegerMod4 = BigInteger.ONE;
                    if (bigIntegerModPow.add(bigIntegerMod4).equals(bigIntegerA)) {
                        BigInteger bigIntegerShiftRight2 = bigIntegerA.add(bigIntegerMod4).shiftRight(1);
                        BigInteger bigIntegerMod5 = bigIntegerAdd;
                        for (int iBitLength = bigIntegerShiftRight2.bitLength() - 2; iBitLength >= 0; iBitLength--) {
                            BigInteger bigIntegerMultiply = bigIntegerMod5.multiply(bigIntegerMod4);
                            bigIntegerMod5 = bigIntegerMod5.multiply(bigIntegerMod5).add(bigIntegerMod4.multiply(bigIntegerMod4).mod(bigIntegerA).multiply(bigIntegerMod3)).mod(bigIntegerA);
                            BigInteger bigIntegerMod6 = bigIntegerMultiply.add(bigIntegerMultiply).mod(bigIntegerA);
                            if (bigIntegerShiftRight2.testBit(iBitLength)) {
                                BigInteger bigIntegerMod7 = bigIntegerMod5.multiply(bigIntegerAdd).add(bigIntegerMod6.multiply(bigIntegerMod3)).mod(bigIntegerA);
                                bigIntegerMod4 = bigIntegerAdd.multiply(bigIntegerMod6).add(bigIntegerMod5).mod(bigIntegerA);
                                bigIntegerMod5 = bigIntegerMod7;
                            } else {
                                bigIntegerMod4 = bigIntegerMod6;
                            }
                        }
                        bigIntegerAdd = bigIntegerMod5;
                    } else {
                        if (!bigIntegerModPow.equals(bigIntegerMod4)) {
                            throw new InvalidAlgorithmParameterException("p is not prime");
                        }
                        bigIntegerAdd = bigIntegerAdd.add(bigIntegerMod4);
                        i++;
                        if (i == 128 && !bigIntegerA.isProbablePrime(80)) {
                            throw new InvalidAlgorithmParameterException("p is not prime");
                        }
                    }
                }
            }
            if (bigIntegerAdd != null && bigIntegerAdd.multiply(bigIntegerAdd).mod(bigIntegerA).compareTo(bigIntegerMod2) != 0) {
                ygf.l("Could not find a modular square root");
                return null;
            }
        }
        return z != bigIntegerAdd.testBit(0) ? bigIntegerA.subtract(bigIntegerAdd).mod(bigIntegerA) : bigIntegerAdd;
    }

    public static ECParameterSpec X(xug xugVar) throws NoSuchAlgorithmException {
        int iOrdinal = xugVar.ordinal();
        if (iOrdinal == 0) {
            return nfg.a;
        }
        if (iOrdinal == 1) {
            return nfg.b;
        }
        if (iOrdinal == 2) {
            return nfg.c;
        }
        throw new NoSuchAlgorithmException("curve not implemented:".concat(String.valueOf(xugVar)));
    }

    public static ECPoint Y(EllipticCurve ellipticCurve, zug zugVar, byte[] bArr) throws GeneralSecurityException {
        int iU = U(ellipticCurve);
        int iOrdinal = zugVar.ordinal();
        boolean z = false;
        if (iOrdinal == 0) {
            if (bArr.length != (iU * 2) + 1) {
                ygf.l("invalid point size");
                return null;
            }
            if (bArr[0] != 4) {
                ygf.l("invalid point format");
                return null;
            }
            int i = iU + 1;
            ECPoint eCPoint = new ECPoint(new BigInteger(1, Arrays.copyOfRange(bArr, 1, i)), new BigInteger(1, Arrays.copyOfRange(bArr, i, bArr.length)));
            nfg.g(eCPoint, ellipticCurve);
            return eCPoint;
        }
        if (iOrdinal != 1) {
            if (iOrdinal != 2) {
                throw new GeneralSecurityException("invalid format:".concat(String.valueOf(zugVar)));
            }
            if (bArr.length != iU * 2) {
                ygf.l("invalid point size");
                return null;
            }
            ECPoint eCPoint2 = new ECPoint(new BigInteger(1, Arrays.copyOf(bArr, iU)), new BigInteger(1, Arrays.copyOfRange(bArr, iU, bArr.length)));
            nfg.g(eCPoint2, ellipticCurve);
            return eCPoint2;
        }
        BigInteger bigIntegerA = nfg.a(ellipticCurve);
        if (bArr.length != iU + 1) {
            ygf.l("compressed point has wrong length");
            return null;
        }
        byte b2 = bArr[0];
        if (b2 != 2) {
            if (b2 != 3) {
                ygf.l("invalid format");
                return null;
            }
            z = true;
        }
        BigInteger bigInteger = new BigInteger(1, Arrays.copyOfRange(bArr, 1, bArr.length));
        if (bigInteger.signum() != -1 && bigInteger.compareTo(bigIntegerA) < 0) {
            return new ECPoint(bigInteger, W(bigInteger, z, ellipticCurve));
        }
        ygf.l("x is out of range");
        return null;
    }

    public static final g1g Z(m1g m1gVar, ktf ktfVar) {
        etf etfVar = (etf) ktfVar.i();
        int iZza = m1gVar.zza();
        etfVar.c();
        ((ktf) etfVar.b).z(iZza);
        return new g1g(m1gVar.zza(), (ktf) etfVar.e());
    }

    public static final void a(String str, String str2, long j, long j2, r28 r28Var, x12 x12Var, int i) {
        int i2;
        String str3;
        p65 p65Var;
        r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1449832044);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(str) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            str3 = str2;
            i2 |= p65Var2.f(str3) ? 32 : 16;
        } else {
            str3 = str2;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.e(j) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i3 = i2 | 24576;
        if (p65Var2.P(i3 & 1, (i3 & 9363) != 9362)) {
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var2, 54);
            long j3 = p65Var2.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
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
            tp7.B(p65Var2, q12.f, ombVarA);
            tp7.B(p65Var2, q12.e, i89VarL);
            tp7.B(p65Var2, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var2, q12.h);
            tp7.B(p65Var2, q12.d, r28VarR);
            r28 r28VarL = jfc.l(o28Var, 10.0f);
            nr5 nr5Var = rv8.r;
            dy0.a(w2g.C(flb.a0(r28VarL, j, nr5Var), 2.0f), p65Var2, 0);
            hp7.t(p65Var2, jfc.l(o28Var, 8.0f));
            sn3 sn3Var = jt7.c;
            o28 o28Var2 = o28Var;
            jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var2.j(sn3Var)).l, p65Var2, i3 & 14, 0, 131070);
            hp7.t(p65Var2, jfc.l(o28Var2, 32.0f));
            dy0.a(w2g.C(flb.a0(jfc.l(o28Var2, 10.0f), j2, nr5Var), 2.0f), p65Var2, 0);
            jjd.b(str3, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) lv8.n(o28Var2, 8.0f, p65Var2, sn3Var)).l, p65Var2, (i3 >> 3) & 14, 0, 131070);
            p65Var = p65Var2;
            p65Var.p(true);
            r28Var2 = o28Var2;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new d4a(str, str2, j, j2, r28Var2, i);
        }
    }

    public static byte[] a0(ECPrivateKey eCPrivateKey, ECPublicKey eCPublicKey) throws GeneralSecurityException {
        try {
            if (!nfg.h(eCPublicKey.getParams(), eCPrivateKey.getParams())) {
                throw new GeneralSecurityException("invalid public key spec");
            }
            ECPoint w = eCPublicKey.getW();
            nfg.g(w, eCPrivateKey.getParams().getCurve());
            PublicKey publicKeyGeneratePublic = ((KeyFactory) cvg.f.a.a("EC")).generatePublic(new ECPublicKeySpec(w, eCPrivateKey.getParams()));
            KeyAgreement keyAgreement = (KeyAgreement) cvg.d.a.a("ECDH");
            keyAgreement.init(eCPrivateKey);
            try {
                keyAgreement.doPhase(publicKeyGeneratePublic, true);
                byte[] bArrGenerateSecret = keyAgreement.generateSecret();
                EllipticCurve curve = eCPrivateKey.getParams().getCurve();
                BigInteger bigInteger = new BigInteger(1, bArrGenerateSecret);
                if (bigInteger.signum() == -1 || bigInteger.compareTo(nfg.a(curve)) >= 0) {
                    throw new GeneralSecurityException("shared secret is out of range");
                }
                W(bigInteger, true, curve);
                return bArrGenerateSecret;
            } catch (IllegalStateException e) {
                throw new GeneralSecurityException(e);
            }
        } catch (IllegalArgumentException | NullPointerException e2) {
            throw new GeneralSecurityException(e2);
        }
    }

    public static final void b(final kn9 kn9Var, final ek8 ek8Var, x12 x12Var, int i) {
        String str = kn9Var.g;
        String str2 = kn9Var.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1675954209);
        int i2 = (p65Var.f(kn9Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16);
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            String str3 = kn9Var.e;
            boolean z = kn9Var.a;
            kx kxVarW = ho2.w(p65Var, 20750210);
            String strQ = vo7.Q(R.string.notification_type_post_reposted, new Object[]{str2, str}, p65Var);
            sn3 sn3Var = kt7.b;
            int iH = kxVarW.h(new skc(((zo7) p65Var.j(sn3Var)).o, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534));
            try {
                kxVarW.d(strQ);
                kxVarW.f(iH);
                int iZ = muc.Z(strQ, str2, 0, false, 6);
                kxVarW.b(new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ, str2.length() + iZ);
                int iZ2 = muc.Z(strQ, str, 0, false, 6);
                mx mxVarC = ka1.c(str, iZ2, kxVarW, new skc(((zo7) p65Var.j(sn3Var)).n, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65534), iZ2);
                p65Var.p(false);
                long j = kn9Var.b;
                int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
                int i4 = i2 & 14;
                boolean z2 = (i3 == 32) | (i4 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new m45() { // from class: ln9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i5 = i;
                            c1e c1eVar = c1e.a;
                            kn9 kn9Var2 = kn9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i5) {
                                case 0:
                                    ek8Var2.j(kn9Var2.f, kn9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(kn9Var2.c, kn9Var2.h);
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
                    objM2 = new m45() { // from class: ln9
                        @Override // defpackage.m45
                        public final Object invoke() {
                            int i52 = i6;
                            c1e c1eVar = c1e.a;
                            kn9 kn9Var2 = kn9Var;
                            ek8 ek8Var2 = ek8Var;
                            switch (i52) {
                                case 0:
                                    ek8Var2.j(kn9Var2.f, kn9Var2.h);
                                    break;
                                default:
                                    ek8Var2.k(kn9Var2.c, kn9Var2.h);
                                    break;
                            }
                            return c1eVar;
                        }
                    };
                    p65Var.j0(objM2);
                }
                rv8.f(z, str3, null, mxVarC, j, 0, m45Var, (m45) objM2, p65Var, 0, 36);
            } catch (Throwable th) {
                kxVarW.f(iH);
                throw th;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new sn8(kn9Var, ek8Var, i, 12);
        }
    }

    public static final b1g b0(m1g m1gVar, ctf ctfVar) {
        btf btfVar = (btf) ctfVar.i();
        int iZza = m1gVar.zza();
        btfVar.c();
        ((ctf) btfVar.b).w(iZza);
        return new b1g(m1gVar.zza(), (ctf) btfVar.e());
    }

    public static final void c(bo4 bo4Var, nab nabVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        boolean z;
        o28 o28Var;
        c1e c1eVar;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-705220485);
        if ((i & 6) == 0) {
            i2 = i | (p65Var.h(bo4Var) ? 4 : 2);
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(nabVar) ? 32 : 16;
        }
        int i3 = i2 | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            wu4 wu4Var = (wu4) guc.x(bo4Var, null, p65Var, (i3 & 14) | 48).getValue();
            o28 o28Var2 = o28.b;
            if (wu4Var == null) {
                p65Var.Y(1756804511);
                p65Var.p(false);
                c1eVar = null;
                z = false;
                o28Var = o28Var2;
            } else {
                p65Var.Y(1756804512);
                z = false;
                int i4 = ((i3 << 3) & 896) | 48;
                o28Var = o28Var2;
                n01.x(wu4Var, it4.S, nabVar, null, bgf.N(o28Var2, "cta"), null, null, 0L, p65Var, i4, 232);
                p65Var.p(false);
                c1eVar = c1e.a;
            }
            if (c1eVar == null) {
                p65Var.Y(887962425);
                hp7.t(p65Var, jfc.e(o28Var, 48.0f));
                p65Var.p(z);
            } else {
                p65Var.Y(887954396);
                p65Var.p(z);
            }
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new vt6(i, 24, bo4Var, nabVar, r28Var2);
        }
    }

    public static final void d(cab cabVar, nab nabVar, r28 r28Var, x12 x12Var, int i) {
        nab nabVar2;
        nabVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1882177169);
        int i2 = i | (p65Var.f(cabVar) ? 4 : 2) | (p65Var.f(nabVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            hne hneVar = cabVar.a;
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            int i3 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean zF = (i3 == 32) | p65Var.f(hneVar);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = new ui9(nabVar, 29, hneVar);
                p65Var.j0(objM);
            }
            r28 r28VarN = bgf.N(w2g.F(hlg.r(r28VarD, false, null, null, (m45) objM, 15), 24.0f, 24.0f, 24.0f, 24.0f), "reposter_without_note_item");
            zq0 zq0Var = z46.n;
            fa4 fa4Var = qb8.a;
            omb ombVarA = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j = p65Var.T;
            int i4 = (int) (j ^ (j >>> 32));
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
            k40.c(u57.a.a(bo.h0(p65Var)), pxf.E(1215271115, new h9b(2, cabVar), p65Var), p65Var, 56);
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            r28 r28VarG = w2g.G(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, true), 8.0f, 0.0f, 8.0f, 0.0f, 10);
            omb ombVarA2 = nmb.a(fa4Var, zq0Var, p65Var, 48);
            long j2 = p65Var.T;
            int i5 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarG);
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
            String str = hneVar.c;
            mkd mkdVar = ((bu7) p65Var.j(jt7.c)).j;
            if (1.0f <= 0.0d) {
                z16.a("invalid weight; must be greater than zero");
            }
            jjd.b(str, bgf.N(new sq6(1.0f > Float.MAX_VALUE ? Float.MAX_VALUE : 1.0f, false), "name"), 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkdVar, p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            if (hneVar.g) {
                p65Var.Y(1310567490);
                w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var), vo7.R(p65Var, R.string.book_author), w2g.G(bgf.N(o28.b, "book_author"), 2.0f, 0.0f, 0.0f, 0.0f, 14), null, null, 0.0f, null, p65Var, 392, 120);
            } else {
                p65Var.Y(1306628475);
            }
            p65Var.p(false);
            p65Var.p(true);
            gne gneVar = hneVar.e;
            n92 n92Var = null;
            if (gneVar instanceof ene) {
                p65Var.Y(-258227127);
                nabVar2 = nabVar;
                c(((ene) gneVar).a, nabVar2, null, p65Var, i3);
                p65Var.p(false);
            } else {
                nabVar2 = nabVar;
                if (!(gneVar instanceof fne)) {
                    throw ho2.L(p65Var, -258229731, false);
                }
                p65Var.Y(-258221681);
                p65Var.p(false);
            }
            p65Var.p(true);
            boolean zF2 = p65Var.f(hneVar) | (i3 == 32);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new n79(nabVar2, hneVar, n92Var, 12);
                p65Var.j0(objM2);
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            nabVar2 = nabVar;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new q6b(i, 6, cabVar, nabVar2, r28Var);
        }
    }

    public static final void e(dr9 dr9Var, stc stcVar, y9 y9Var, r28 r28Var, hy8 hy8Var, x12 x12Var, int i) {
        int i2;
        hy8 hy8Var2;
        hy8 jy8Var;
        stcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1494135105);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(dr9Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.d(stcVar.ordinal()) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(y9Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= 8192;
        }
        if (p65Var.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                jy8Var = new jy8(22.0f, 28.0f, 12.0f, 20.0f);
            } else {
                p65Var.S();
                jy8Var = hy8Var;
            }
            p65Var.q();
            jt7.a(false, pxf.E(-979810702, new d98(dr9Var, stcVar, y9Var, r28Var, jy8Var), p65Var), p65Var, 48, 1);
            hy8Var2 = jy8Var;
        } else {
            p65Var.S();
            hy8Var2 = hy8Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ob((Object) dr9Var, (Object) stcVar, (Object) y9Var, r28Var, (Object) hy8Var2, i, 15);
        }
    }

    public static final void f(ybd ybdVar, xbd xbdVar, e9d e9dVar, r28 r28Var, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1258015842);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(ybdVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(xbdVar) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(e9dVar) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            l78 l78VarX = guc.x(xbdVar.a, bt4.NOT_FOLLOWING, p65Var, 48);
            int i3 = x8d.a[((bt4) l78VarX.getValue()).ordinal()];
            if (i3 == 1 || i3 == 2) {
                p65Var.Y(2067425883);
                boolean z = ((bt4) l78VarX.getValue()) == bt4.FOLLOWING;
                tw8 tw8Var = tw8.S;
                int i4 = i2 & 896;
                int i5 = i2 & 14;
                boolean z2 = (i4 == 256) | (i5 == 4);
                Object objM = p65Var.M();
                uob uobVar = w12.a;
                if (z2 || objM == uobVar) {
                    objM = new w8d(e9dVar, ybdVar, i);
                    p65Var.j0(objM);
                }
                m45 m45Var = (m45) objM;
                int i6 = (i4 == 256 ? 1 : 0) | (i5 != 4 ? 0 : 1);
                Object objM2 = p65Var.M();
                if (i6 != 0 || objM2 == uobVar) {
                    objM2 = new w8d(e9dVar, ybdVar, 2);
                    p65Var.j0(objM2);
                }
                pr7.f(z, tw8Var, m45Var, (m45) objM2, r28Var, false, p65Var, ((i2 << 3) & 57344) | 48, 32);
                p65Var.p(false);
            } else {
                if (i3 != 3 && i3 != 4) {
                    throw ho2.L(p65Var, 2067422808, false);
                }
                p65Var.Y(2067447974);
                p65Var.p(false);
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new de7(i, 23, ybdVar, xbdVar, e9dVar, r28Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x0390  */
    /* JADX WARN: Removed duplicated region for block: B:116:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0056  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0058  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0061  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void g(defpackage.ybd r41, defpackage.e9d r42, defpackage.r28 r43, defpackage.x12 r44, int r45, int r46) {
        /*
            Method dump skipped, instruction units count: 930
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.en7.g(ybd, e9d, r28, x12, int, int):void");
    }

    public static final void h(final List list, final String str, final String str2, r28 r28Var, float f, xk1 xk1Var, x12 x12Var, final int i) {
        p65 p65Var;
        final r28 r28Var2;
        final float f2;
        final xk1 xk1Var2;
        int i2;
        float f3;
        final xk1 xk1Var3;
        r28 r28Var3;
        Object obj;
        xk1 xk1Var4;
        str.getClass();
        str2.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-95549140);
        int i3 = i | (p65Var2.h(list) ? 4 : 2) | (p65Var2.f(str) ? 32 : 16) | (p65Var2.f(str2) ? 256 : 128) | 93184;
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var2.U();
            int i4 = i & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var2.z()) {
                long j = xo7.V;
                long j2 = xo7.B;
                xk1 xk1Var5 = new xk1(j, j, j2, j2);
                i2 = i3 & (-458753);
                f3 = 258.0f;
                xk1Var3 = xk1Var5;
                r28Var3 = o28Var;
            } else {
                p65Var2.S();
                i2 = i3 & (-458753);
                r28Var3 = r28Var;
                f3 = f;
                xk1Var3 = xk1Var;
            }
            int i5 = i2;
            p65Var2.q();
            r28 r28VarE = jfc.e(r28Var3, f3);
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
            long j3 = p65Var2.T;
            int i6 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarE);
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
            final Resources resources = (Resources) p65Var2.j(eo.c);
            sn3 sn3Var = kt7.b;
            final long j4 = ((zo7) p65Var2.j(sn3Var)).x;
            final xjd xjdVarK = ek7.K(p65Var2);
            final mkd mkdVarA = mkd.a(((bu7) p65Var2.j(jt7.c)).n, ((zo7) p65Var2.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214);
            r28 r28VarU = km4.u(1.0f, jfc.d(o28Var, 1.0f), true);
            boolean zH = p65Var2.h(list) | p65Var2.f(xjdVarK) | p65Var2.h(resources) | p65Var2.f(mkdVarA) | p65Var2.e(j4) | p65Var2.f(xk1Var3);
            Object objM = p65Var2.M();
            if (zH || objM == w12.a) {
                obj = new x45() { // from class: tse
                    @Override // defpackage.x45
                    public final Object invoke(Object obj2) {
                        Long lValueOf;
                        tse tseVar = this;
                        zl3 zl3Var = (zl3) obj2;
                        zl3Var.getClass();
                        char c = ' ';
                        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32));
                        long j5 = 4294967295L;
                        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L));
                        List list2 = list;
                        Iterator it2 = list2.iterator();
                        if (it2.hasNext()) {
                            vse vseVar = (vse) it2.next();
                            lValueOf = Long.valueOf(vseVar.b + vseVar.a);
                            while (it2.hasNext()) {
                                vse vseVar2 = (vse) it2.next();
                                Long lValueOf2 = Long.valueOf(vseVar2.b + vseVar2.a);
                                if (lValueOf.compareTo(lValueOf2) < 0) {
                                    lValueOf = lValueOf2;
                                }
                            }
                        } else {
                            lValueOf = null;
                        }
                        long jMax = Math.max(lValueOf != null ? lValueOf.longValue() : 9L, 1L);
                        float fZ = zl3Var.Z(20.0f);
                        float fZ2 = zl3Var.Z(19.0f);
                        int i7 = ((vse) bu1.x0(list2)).c;
                        Resources resources2 = resources;
                        String string = resources2.getString(i7);
                        string.getClass();
                        xjd xjdVar = xjdVarK;
                        mkd mkdVar = mkdVarA;
                        xjd xjdVar2 = xjdVar;
                        mkd mkdVar2 = mkdVar;
                        float f4 = (int) (xjd.a(xjdVar, string, mkdVar, 0, 0L, 1020).c & 4294967295L);
                        float f5 = fIntBitsToFloat2 - f4;
                        float fZ3 = f5 - zl3Var.Z(8.0f);
                        float f6 = jMax;
                        float fMax = Math.max((float) Math.rint(f6 / 3.0f), 1.0f);
                        ArrayList arrayList = new ArrayList();
                        for (float f7 = 0.0f; arrayList.size() < 4 && f7 <= f6; f7 += fMax) {
                            arrayList.add(Integer.valueOf((int) f7));
                        }
                        if (arrayList.isEmpty() || ((Number) bu1.H0(arrayList)).intValue() < f6) {
                            Integer num = (Integer) bu1.I0(arrayList);
                            arrayList.add(Integer.valueOf((num != null ? num.intValue() : 0) + ((int) fMax)));
                        }
                        int iIntValue = ((Number) bu1.L0(arrayList)).intValue();
                        float fZ4 = (fZ3 - zl3Var.Z(16.0f)) / (iIntValue < 1 ? 1 : iIntValue);
                        float f8 = (int) (xjd.a(xjdVar2, String.valueOf(iIntValue), mkdVar2, 0, 0L, 1020).c >> 32);
                        float size = ((fIntBitsToFloat - f8) - ((list2.size() + 1) * fZ)) / list2.size();
                        float f9 = 4.0f;
                        float fZ5 = zl3Var.Z(4.0f) + f8;
                        Iterator it3 = arrayList.iterator();
                        while (it3.hasNext()) {
                            int iIntValue2 = ((Number) it3.next()).intValue();
                            float fZ6 = (fZ3 - (iIntValue2 * fZ4)) - zl3Var.Z(f9);
                            char c2 = c;
                            long j6 = j5;
                            ho2.n(zl3Var, j4, (((long) Float.floatToRawIntBits(fZ6)) & j5) | (((long) Float.floatToRawIntBits(fZ5)) << c), (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << c2) | (((long) Float.floatToRawIntBits(fZ6)) & j5), 1.0f, 0, 496);
                            kk7.u(zl3Var, xjdVar2, dq1.g(Integer.valueOf(iIntValue2)), (((long) Float.floatToRawIntBits(0.0f)) << c2) | (((long) Float.floatToRawIntBits(fZ6)) & j6), mkdVar2, zl3Var.f(), 368);
                            f4 = f4;
                            fZ3 = fZ3;
                            resources2 = resources2;
                            f9 = 4.0f;
                            fIntBitsToFloat = fIntBitsToFloat;
                            c = c2;
                            f8 = f8;
                            j5 = j6;
                        }
                        float f10 = fZ3;
                        float f11 = f8;
                        char c3 = c;
                        long j7 = j5;
                        float f12 = f4;
                        Resources resources3 = resources2;
                        int i8 = 0;
                        for (Object obj3 : list2) {
                            int i9 = i8 + 1;
                            if (i8 < 0) {
                                d46.i0();
                                throw null;
                            }
                            vse vseVar3 = (vse) obj3;
                            float f13 = (i9 * fZ) + (i8 * size) + f11;
                            float f14 = f13 + size;
                            br brVarA = er.a();
                            br brVarA2 = er.a();
                            float f15 = f10 - (vseVar3.a * fZ4);
                            brVarA.d(f13, f10);
                            brVarA.c(f13, f15);
                            brVarA.c(f14, f15);
                            brVarA.c(f14, f10);
                            float f16 = f15 - (vseVar3.b * fZ4);
                            brVarA2.d(f13, f16);
                            brVarA2.c(f13, f10);
                            brVarA2.c(f14, f10);
                            brVarA2.c(f14, f16);
                            brVarA2.a();
                            brVarA.a();
                            xk1 xk1Var6 = xk1Var3;
                            ho2.p(zl3Var, brVarA2, xk1Var6.a, 0.0f, null, 60);
                            ho2.p(zl3Var, brVarA, xk1Var6.c, 0.0f, null, 60);
                            String string2 = resources3.getString(vseVar3.c);
                            string2.getClass();
                            xjd xjdVar3 = xjdVar2;
                            float fMin = Math.min((int) (xjd.a(xjdVar2, string2, mkdVar2, 0, 0L, 1020).c >> c3), size + fZ2);
                            mkd mkdVar3 = mkdVar2;
                            mkdVar2 = mkdVar3;
                            kk7.u(zl3Var, xjdVar3, string2, (((long) Float.floatToRawIntBits(((size / 2.0f) + f13) - (fMin / 2.0f))) << c3) | (((long) Float.floatToRawIntBits(f5)) & j7), mkd.a(mkdVar3, 0L, 0L, null, null, null, 0L, 0L, null, 3, 0L, null, null, 16744447), (((long) Float.floatToRawIntBits(fMin)) << c3) | (((long) Float.floatToRawIntBits(f12)) & j7), 288);
                            tseVar = this;
                            xjdVar2 = xjdVar3;
                            i8 = i9;
                        }
                        return c1e.a;
                    }
                };
                xk1Var4 = xk1Var3;
                p65Var2.j0(obj);
            } else {
                obj = objM;
                xk1Var4 = xk1Var3;
            }
            pxf.a(r28VarU, (x45) obj, p65Var2, 0);
            hp7.t(p65Var2, jfc.l(o28Var, 16.0f));
            p65Var = p65Var2;
            a(str, str2, xk1Var4.c, xk1Var4.a, null, p65Var, (i5 >> 3) & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(true);
            xk1Var2 = xk1Var4;
            r28Var2 = r28Var3;
            f2 = f3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            f2 = f;
            xk1Var2 = xk1Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(list, str, str2, r28Var2, f2, xk1Var2, i) { // from class: use
                public final /* synthetic */ List a;
                public final /* synthetic */ String b;
                public final /* synthetic */ String c;
                public final /* synthetic */ r28 d;
                public final /* synthetic */ float e;
                public final /* synthetic */ xk1 f;

                @Override // defpackage.b55
                public final Object invoke(Object obj2, Object obj3) {
                    ((Integer) obj3).getClass();
                    int iY = tr7.y(1);
                    en7.h(this.a, this.b, this.c, this.d, this.e, this.f, (x12) obj2, iY);
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object i(defpackage.xrb r10, float r11, defpackage.xw r12, defpackage.xv2 r13, defpackage.x45 r14, defpackage.p92 r15) {
        /*
            boolean r0 = r15 instanceof defpackage.kic
            if (r0 == 0) goto L13
            r0 = r15
            kic r0 = (defpackage.kic) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            kic r0 = new kic
            r0.<init>(r15)
        L18:
            java.lang.Object r15 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            float r11 = r0.b
            oya r10 = r0.d
            xw r12 = r0.c
            defpackage.br7.v(r15)
            goto L69
        L2d:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            r10 = 0
            return r10
        L34:
            defpackage.br7.v(r15)
            oya r6 = new oya
            r6.<init>()
            java.lang.Object r15 = r12.c()
            java.lang.Number r15 = (java.lang.Number) r15
            float r15 = r15.floatValue()
            r2 = 0
            int r15 = (r15 > r2 ? 1 : (r15 == r2 ? 0 : -1))
            if (r15 != 0) goto L4d
            r15 = r3
            goto L4e
        L4d:
            r15 = 0
        L4e:
            r15 = r15 ^ r3
            jic r4 = new jic
            r9 = 0
            r7 = r10
            r5 = r11
            r8 = r14
            r4.<init>(r5, r6, r7, r8, r9)
            r0.c = r12
            r0.d = r6
            r0.b = r5
            r0.f = r3
            java.lang.Object r10 = defpackage.tr7.l(r12, r13, r15, r4, r0)
            if (r10 != r1) goto L67
            return r1
        L67:
            r11 = r5
            r10 = r6
        L69:
            tw r13 = new tw
            float r10 = r10.a
            float r11 = r11 - r10
            java.lang.Float r10 = new java.lang.Float
            r10.<init>(r11)
            r13.<init>(r10, r12)
            return r13
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.en7.i(xrb, float, xw, xv2, x45, p92):java.lang.Object");
    }

    public static final void j(vw vwVar, xrb xrbVar, x45 x45Var, float f) {
        float fA;
        try {
            fA = xrbVar.a(f);
        } catch (CancellationException unused) {
            vwVar.a();
            fA = 0.0f;
        }
        x45Var.invoke(Float.valueOf(fA));
        if (Math.abs(f - fA) > 0.5f) {
            vwVar.a();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object k(defpackage.xrb r16, float r17, float r18, defpackage.xw r19, defpackage.ww r20, defpackage.x45 r21, defpackage.p92 r22) {
        /*
            r0 = r17
            r1 = r22
            boolean r2 = r1 instanceof defpackage.lic
            if (r2 == 0) goto L18
            r2 = r1
            lic r2 = (defpackage.lic) r2
            int r3 = r2.g
            r4 = -2147483648(0xffffffff80000000, float:-0.0)
            r5 = r3 & r4
            if (r5 == 0) goto L18
            int r3 = r3 - r4
            r2.g = r3
        L16:
            r8 = r2
            goto L1e
        L18:
            lic r2 = new lic
            r2.<init>(r1)
            goto L16
        L1e:
            java.lang.Object r1 = r8.f
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r8.g
            r9 = 0
            r4 = 1
            if (r3 == 0) goto L3f
            if (r3 != r4) goto L38
            float r0 = r8.c
            float r2 = r8.b
            oya r3 = r8.e
            xw r4 = r8.d
            defpackage.br7.v(r1)
            r1 = r0
            r0 = r2
            goto L90
        L38:
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r0)
            r0 = 0
            return r0
        L3f:
            defpackage.br7.v(r1)
            oya r12 = new oya
            r12.<init>()
            java.lang.Object r1 = r19.c()
            java.lang.Number r1 = (java.lang.Number) r1
            float r1 = r1.floatValue()
            java.lang.Float r3 = new java.lang.Float
            r3.<init>(r0)
            java.lang.Object r5 = r19.c()
            java.lang.Number r5 = (java.lang.Number) r5
            float r5 = r5.floatValue()
            int r5 = (r5 > r9 ? 1 : (r5 == r9 ? 0 : -1))
            if (r5 != 0) goto L66
            r5 = r4
            goto L67
        L66:
            r5 = 0
        L67:
            r6 = r5 ^ 1
            jic r10 = new jic
            r15 = 1
            r13 = r16
            r11 = r18
            r14 = r21
            r10.<init>(r11, r12, r13, r14, r15)
            r5 = r3
            r3 = r19
            r8.d = r3
            r8.e = r12
            r8.b = r0
            r8.c = r1
            r8.g = r4
            r4 = r5
            r7 = r10
            r5 = r20
            java.lang.Object r4 = defpackage.tr7.m(r3, r4, r5, r6, r7, r8)
            if (r4 != r2) goto L8d
            return r2
        L8d:
            r4 = r19
            r3 = r12
        L90:
            java.lang.Object r2 = r4.c()
            java.lang.Number r2 = (java.lang.Number) r2
            float r2 = r2.floatValue()
            float r1 = p(r2, r1)
            tw r2 = new tw
            float r3 = r3.a
            float r0 = r0 - r3
            java.lang.Float r3 = new java.lang.Float
            r3.<init>(r0)
            r0 = 29
            xw r0 = defpackage.g76.T(r4, r9, r1, r0)
            r2.<init>(r3, r0)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.en7.k(xrb, float, float, xw, ww, x45, p92):java.lang.Object");
    }

    public static final LinkedHashSet l(byte[] bArr) throws IOException {
        bArr.getClass();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        if (bArr.length == 0) {
            return linkedHashSet;
        }
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        try {
            try {
                ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
                try {
                    int i = objectInputStream.readInt();
                    for (int i2 = 0; i2 < i; i2++) {
                        Uri uri = Uri.parse(objectInputStream.readUTF());
                        boolean z = objectInputStream.readBoolean();
                        uri.getClass();
                        linkedHashSet.add(new d72(z, uri));
                    }
                    objectInputStream.close();
                } finally {
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            byteArrayInputStream.close();
            return linkedHashSet;
        } finally {
        }
    }

    public static final void m(long j) {
        rkd[] rkdVarArr = qkd.b;
        if ((j & 1095216660480L) == 0) {
            d26.a("Cannot perform operation for Unspecified type.");
        }
    }

    public static final void n(long j, long j2) {
        rkd[] rkdVarArr = qkd.b;
        if ((j & 1095216660480L) == 0 || (1095216660480L & j2) == 0) {
            d26.a("Cannot perform operation for Unspecified type.");
        }
        if (rkd.a(qkd.b(j), qkd.b(j2))) {
            return;
        }
        d26.a("Cannot perform operation for " + ((Object) rkd.b(qkd.b(j))) + " and " + ((Object) rkd.b(qkd.b(j2))));
    }

    public static rn1 o(Class cls) {
        int i = 0;
        while (cls.isArray()) {
            i++;
            cls = cls.getComponentType();
            cls.getClass();
        }
        if (!cls.isPrimitive()) {
            mn1 mn1VarA = e0b.a(cls);
            String str = s96.a;
            mn1 mn1VarF = s96.f(mn1VarA.a());
            if (mn1VarF != null) {
                mn1VarA = mn1VarF;
            }
            return new rn1(mn1VarA, i);
        }
        if (cls.equals(Void.TYPE)) {
            y05 y05VarI = lnc.d.i();
            return new rn1(new mn1(y05VarI.b(), y05VarI.a.g()), i);
        }
        x0a primitiveType = pf6.get(cls.getName()).getPrimitiveType();
        primitiveType.getClass();
        if (i > 0) {
            y05 arrayTypeFqName = primitiveType.getArrayTypeFqName();
            arrayTypeFqName.getClass();
            return new rn1(new mn1(arrayTypeFqName.b(), arrayTypeFqName.a.g()), i - 1);
        }
        y05 typeFqName = primitiveType.getTypeFqName();
        typeFqName.getClass();
        return new rn1(new mn1(typeFqName.b(), typeFqName.a.g()), i);
    }

    public static final float p(float f, float f2) {
        if (f2 == 0.0f) {
            return 0.0f;
        }
        return (f2 <= 0.0f ? f >= f2 : f <= f2) ? f : f2;
    }

    public static final int q(gnb gnbVar, String str) {
        gnbVar.getClass();
        int columnCount = gnbVar.getColumnCount();
        int i = 0;
        while (true) {
            if (i >= columnCount) {
                i = -1;
                break;
            }
            if (str.equals(gnbVar.getColumnName(i))) {
                break;
            }
            i++;
        }
        if (i >= 0) {
            return i;
        }
        String strT = wgd.t('`', "`", str);
        int columnCount2 = gnbVar.getColumnCount();
        int i2 = 0;
        while (true) {
            if (i2 >= columnCount2) {
                i2 = -1;
                break;
            }
            if (strT.equals(gnbVar.getColumnName(i2))) {
                break;
            }
            i2++;
        }
        if (i2 >= 0) {
            return i2;
        }
        if (Build.VERSION.SDK_INT <= 25 && str.length() != 0) {
            int columnCount3 = gnbVar.getColumnCount();
            String strConcat = ".".concat(str);
            String strT2 = wgd.t('`', ".", str);
            for (int i3 = 0; i3 < columnCount3; i3++) {
                String columnName = gnbVar.getColumnName(i3);
                if (columnName.length() >= str.length() + 2 && (tuc.F(columnName, strConcat, false) || (columnName.charAt(0) == '`' && tuc.F(columnName, strT2, false)))) {
                    return i3;
                }
            }
        }
        return -1;
    }

    public static boolean r(File file, Resources resources, int i) throws Throwable {
        InputStream inputStreamOpenRawResource;
        try {
            inputStreamOpenRawResource = resources.openRawResource(i);
        } catch (Throwable th) {
            th = th;
            inputStreamOpenRawResource = null;
        }
        try {
            boolean zS = s(file, inputStreamOpenRawResource);
            if (inputStreamOpenRawResource != null) {
                try {
                    inputStreamOpenRawResource.close();
                } catch (IOException unused) {
                }
            }
            return zS;
        } catch (Throwable th2) {
            th = th2;
            if (inputStreamOpenRawResource != null) {
                try {
                    inputStreamOpenRawResource.close();
                } catch (IOException unused2) {
                }
            }
            throw th;
        }
    }

    public static boolean s(File file, InputStream inputStream) throws Throwable {
        FileOutputStream fileOutputStream;
        StrictMode.ThreadPolicy threadPolicyAllowThreadDiskWrites = StrictMode.allowThreadDiskWrites();
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                fileOutputStream = new FileOutputStream(file, false);
            } catch (IOException e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            byte[] bArr = new byte[1024];
            while (true) {
                int i = inputStream.read(bArr);
                if (i != -1) {
                    fileOutputStream.write(bArr, 0, i);
                } else {
                    try {
                        break;
                    } catch (IOException unused) {
                    }
                }
            }
            fileOutputStream.close();
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskWrites);
            return true;
        } catch (IOException e2) {
            e = e2;
            fileOutputStream2 = fileOutputStream;
            Log.e("TypefaceCompatUtil", "Error copying resource contents to temp file: " + e.getMessage());
            if (fileOutputStream2 != null) {
                try {
                    fileOutputStream2.close();
                } catch (IOException unused2) {
                }
            }
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskWrites);
            return false;
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream2 = fileOutputStream;
            if (fileOutputStream2 != null) {
                try {
                    fileOutputStream2.close();
                } catch (IOException unused3) {
                }
            }
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskWrites);
            throw th;
        }
    }

    public static final g93 t(g7a g7aVar) {
        switch (g7aVar == null ? -1 : o7a.b[g7aVar.ordinal()]) {
            case 1:
                g93 g93Var = h93.d;
                g93Var.getClass();
                return g93Var;
            case 2:
                g93 g93Var2 = h93.a;
                g93Var2.getClass();
                return g93Var2;
            case 3:
                g93 g93Var3 = h93.b;
                g93Var3.getClass();
                return g93Var3;
            case 4:
                g93 g93Var4 = h93.c;
                g93Var4.getClass();
                return g93Var4;
            case 5:
                g93 g93Var5 = h93.e;
                g93Var5.getClass();
                return g93Var5;
            case 6:
                g93 g93Var6 = h93.f;
                g93Var6.getClass();
                return g93Var6;
            default:
                g93 g93Var7 = h93.a;
                g93Var7.getClass();
                return g93Var7;
        }
    }

    public static boolean u(Object obj, Object obj2) {
        if (obj != obj2) {
            return obj != null && obj.equals(obj2);
        }
        return true;
    }

    public static gv7 v(n01 n01Var) {
        if (n01Var instanceof jf6) {
            jf6 jf6Var = (jf6) n01Var;
            String str = jf6Var.r;
            String str2 = jf6Var.s;
            str.getClass();
            str2.getClass();
            return new gv7(str.concat(str2));
        }
        if (!(n01Var instanceof if6)) {
            ygf.a();
            return null;
        }
        if6 if6Var = (if6) n01Var;
        String str3 = if6Var.r;
        String str4 = if6Var.s;
        str3.getClass();
        str4.getClass();
        return new gv7(ev6.r('#', str3, str4));
    }

    public static final byte[] w(le8 le8Var) throws IOException {
        int[] iArrL1;
        int[] iArrL12;
        int i = Build.VERSION.SDK_INT;
        if (i < 28) {
            return new byte[0];
        }
        NetworkRequest networkRequest = (NetworkRequest) le8Var.a;
        if (networkRequest == null) {
            return new byte[0];
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
            try {
                if (i >= 31) {
                    iArrL1 = io.t(networkRequest);
                } else {
                    int[] iArr = {2, 0, 3, 6, 10, 9, 8, 4, 1, 5};
                    ArrayList arrayList = new ArrayList();
                    for (int i2 = 0; i2 < 10; i2++) {
                        int i3 = iArr[i2];
                        if (uy.A(networkRequest, i3)) {
                            arrayList.add(Integer.valueOf(i3));
                        }
                    }
                    iArrL1 = bu1.l1(arrayList);
                }
                if (Build.VERSION.SDK_INT >= 31) {
                    iArrL12 = io.a(networkRequest);
                } else {
                    int[] iArr2 = {17, 5, 2, 10, 29, 19, 3, 32, 7, 4, 12, 36, 23, 0, 33, 20, 11, 13, 18, 21, 15, 35, 34, 8, 1, 25, 14, 16, 6, 9};
                    ArrayList arrayList2 = new ArrayList();
                    for (int i4 = 0; i4 < 30; i4++) {
                        int i5 = iArr2[i4];
                        if (uy.z(networkRequest, i5)) {
                            arrayList2.add(Integer.valueOf(i5));
                        }
                    }
                    iArrL12 = bu1.l1(arrayList2);
                }
                objectOutputStream.writeInt(iArrL1.length);
                for (int i6 : iArrL1) {
                    objectOutputStream.writeInt(i6);
                }
                objectOutputStream.writeInt(iArrL12.length);
                for (int i7 : iArrL12) {
                    objectOutputStream.writeInt(i7);
                }
                objectOutputStream.close();
                byteArrayOutputStream.close();
                byte[] byteArray = byteArrayOutputStream.toByteArray();
                byteArray.getClass();
                return byteArray;
            } finally {
            }
        } finally {
        }
    }

    public static fn7 x(String str) {
        str.getClass();
        ij7 ij7VarA = fn7.d.a(0, str);
        if (ij7VarA == null) {
            ay0.e(wgd.t('\"', "No subtype found for: \"", str));
            return null;
        }
        String str2 = (String) ((gj7) ij7VarA.a()).get(1);
        Locale locale = Locale.ROOT;
        String lowerCase = str2.toLowerCase(locale);
        lowerCase.getClass();
        String lowerCase2 = ((String) ((gj7) ij7VarA.a()).get(2)).toLowerCase(locale);
        lowerCase2.getClass();
        ArrayList arrayList = new ArrayList();
        int i = ij7VarA.b().b;
        while (true) {
            int i2 = i + 1;
            if (i2 >= str.length()) {
                return new fn7(str, lowerCase, lowerCase2, (String[]) arrayList.toArray(new String[0]));
            }
            ij7 ij7VarA2 = fn7.e.a(i2, str);
            if (ij7VarA2 == null) {
                rd6.e(34, "Parameter is not formatted correctly: \"", str.substring(i2), "\" for: \"", str);
                return null;
            }
            hj7 hj7Var = ij7VarA2.c;
            cj7 cj7VarD = hj7Var.d(1);
            String str3 = cj7VarD != null ? cj7VarD.a : null;
            if (str3 == null) {
                i = ij7VarA2.b().b;
            } else {
                cj7 cj7VarD2 = hj7Var.d(2);
                String strSubstring = cj7VarD2 != null ? cj7VarD2.a : null;
                if (strSubstring == null) {
                    cj7 cj7VarD3 = hj7Var.d(3);
                    cj7VarD3.getClass();
                    strSubstring = cj7VarD3.a;
                } else if (muc.q0(strSubstring, '\'') && muc.U(strSubstring, '\'') && strSubstring.length() > 2) {
                    strSubstring = strSubstring.substring(1, strSubstring.length() - 1);
                }
                arrayList.add(str3);
                arrayList.add(strSubstring);
                i = ij7VarA2.b().b;
            }
        }
    }

    public static final Rect y(TextPaint textPaint, CharSequence charSequence, int i, int i2) {
        int i3 = i;
        if (charSequence instanceof Spanned) {
            Spanned spanned = (Spanned) charSequence;
            if (spanned.nextSpanTransition(i3 - 1, i2, MetricAffectingSpan.class) != i2) {
                Rect rect = new Rect();
                Rect rect2 = new Rect();
                TextPaint textPaint2 = new TextPaint();
                while (i3 < i2) {
                    int iNextSpanTransition = spanned.nextSpanTransition(i3, i2, MetricAffectingSpan.class);
                    MetricAffectingSpan[] metricAffectingSpanArr = (MetricAffectingSpan[]) spanned.getSpans(i3, iNextSpanTransition, MetricAffectingSpan.class);
                    textPaint2.set(textPaint);
                    for (MetricAffectingSpan metricAffectingSpan : metricAffectingSpanArr) {
                        if (spanned.getSpanStart(metricAffectingSpan) != spanned.getSpanEnd(metricAffectingSpan)) {
                            metricAffectingSpan.updateMeasureState(textPaint2);
                        }
                    }
                    if (Build.VERSION.SDK_INT >= 29) {
                        nm.q(textPaint2, charSequence, i3, iNextSpanTransition, rect2);
                    } else {
                        textPaint2.getTextBounds(charSequence.toString(), i3, iNextSpanTransition, rect2);
                    }
                    rect.right = rect2.width() + rect.right;
                    rect.top = Math.min(rect.top, rect2.top);
                    rect.bottom = Math.max(rect.bottom, rect2.bottom);
                    i3 = iNextSpanTransition;
                }
                return rect;
            }
        }
        Rect rect3 = new Rect();
        if (Build.VERSION.SDK_INT >= 29) {
            nm.q(textPaint, charSequence, i3, i2, rect3);
            return rect3;
        }
        textPaint.getTextBounds(charSequence.toString(), i3, i2, rect3);
        return rect3;
    }

    public static final long z(double d) {
        return M((float) d, 8589934592L);
    }

    public static final String S(int i) {
        if (i == 0) {
            return "android.widget.Button";
        }
        if (i == 1) {
            return "android.widget.CheckBox";
        }
        if (i == 3) {
            return "android.widget.RadioButton";
        }
        if (i == 5) {
            return "android.widget.ImageView";
        }
        if (i == 6) {
            return "android.widget.Spinner";
        }
        if (i == 7) {
            return fiHTiFJ.QEpKMmBqNu;
        }
        return null;
    }
}
