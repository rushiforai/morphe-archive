package b;

import ads_mobile_sdk.a41;
import ads_mobile_sdk.au;
import ads_mobile_sdk.av0;
import ads_mobile_sdk.bm3;
import ads_mobile_sdk.bq;
import ads_mobile_sdk.bv0;
import ads_mobile_sdk.cu0;
import ads_mobile_sdk.cw0;
import ads_mobile_sdk.d62;
import ads_mobile_sdk.du0;
import ads_mobile_sdk.dv0;
import ads_mobile_sdk.em2;
import ads_mobile_sdk.fg;
import ads_mobile_sdk.gg;
import ads_mobile_sdk.gq;
import ads_mobile_sdk.gt1;
import ads_mobile_sdk.hg;
import ads_mobile_sdk.hq;
import ads_mobile_sdk.hv;
import ads_mobile_sdk.it1;
import ads_mobile_sdk.iu0;
import ads_mobile_sdk.jb1;
import ads_mobile_sdk.ji3;
import ads_mobile_sdk.jn;
import ads_mobile_sdk.jr0;
import ads_mobile_sdk.k61;
import ads_mobile_sdk.kz2;
import ads_mobile_sdk.lk;
import ads_mobile_sdk.lm0;
import ads_mobile_sdk.lw0;
import ads_mobile_sdk.mi3;
import ads_mobile_sdk.mm0;
import ads_mobile_sdk.mn1;
import ads_mobile_sdk.mp;
import ads_mobile_sdk.op1;
import ads_mobile_sdk.pu0;
import ads_mobile_sdk.qu0;
import ads_mobile_sdk.ru0;
import ads_mobile_sdk.sl0;
import ads_mobile_sdk.sq;
import ads_mobile_sdk.su0;
import ads_mobile_sdk.th3;
import ads_mobile_sdk.tu0;
import ads_mobile_sdk.u93;
import ads_mobile_sdk.ug2;
import ads_mobile_sdk.uu0;
import ads_mobile_sdk.v03;
import ads_mobile_sdk.vn3;
import ads_mobile_sdk.vu0;
import ads_mobile_sdk.vv1;
import ads_mobile_sdk.wd1;
import ads_mobile_sdk.wf1;
import ads_mobile_sdk.wu0;
import ads_mobile_sdk.wv0;
import ads_mobile_sdk.x23;
import ads_mobile_sdk.yi1;
import ads_mobile_sdk.yu0;
import ads_mobile_sdk.zu0;
import ads_mobile_sdk.zv1;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.util.Pair;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.gson.Gson;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.FileChannel;
import java.security.DigestException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PublicKey;
import java.security.Signature;
import java.security.SignatureException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.MGF1ParameterSpec;
import java.security.spec.PSSParameterSpec;
import java.security.spec.X509EncodedKeySpec;
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
import java.util.concurrent.CancellationException;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import kotlin.NoWhenBranchMatchedException;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference1Impl;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.math.MathKt;
import kotlin.reflect.KMutableProperty1;
import kotlin.text.Regex;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class t2 {

    /* renamed from: f, reason: collision with root package name */
    public static long f15989f = -1;

    /* renamed from: g, reason: collision with root package name */
    public static long f15990g = -1;

    /* renamed from: h, reason: collision with root package name */
    public static int f15991h = 2;

    public static ByteBuffer A(ByteBuffer byteBuffer) throws IOException {
        if (byteBuffer.remaining() < 4) {
            throw new IOException("Remaining buffer too short to contain length of length-prefixed field. Remaining: " + byteBuffer.remaining());
        }
        int i5 = byteBuffer.getInt();
        if (i5 < 0) {
            throw new IllegalArgumentException("Negative length");
        }
        if (i5 <= byteBuffer.remaining()) {
            return B(byteBuffer, i5);
        }
        StringBuilder sbJ = u4.j(i5, "Length-prefixed field longer than remaining buffer. Field length: ", ", remaining: ");
        sbJ.append(byteBuffer.remaining());
        throw new IOException(sbJ.toString());
    }

    public static ByteBuffer B(ByteBuffer byteBuffer, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(ed.i("size: ", i5));
        }
        int iLimit = byteBuffer.limit();
        int iPosition = byteBuffer.position();
        int i11 = i5 + iPosition;
        if (i11 < iPosition || i11 > iLimit) {
            throw new BufferUnderflowException();
        }
        byteBuffer.limit(i11);
        try {
            ByteBuffer byteBufferSlice = byteBuffer.slice();
            byteBufferSlice.order(byteBuffer.order());
            byteBuffer.position(i11);
            return byteBufferSlice;
        } finally {
            byteBuffer.limit(iLimit);
        }
    }

    public static KMutableProperty1 C(Class cls, String str, String str2) {
        return Reflection.f71864a.mutableProperty1(new MutablePropertyReference1Impl(cls, str, str2, 0));
    }

    public static void D(Context context, String str, ads_mobile_sdk.c7 c7Var) {
        lm0 lm0VarG;
        if (context == null || str == null) {
            return;
        }
        try {
            if (str.trim().isEmpty()) {
                return;
            }
            lk.a(context).getClass();
            mm0 mm0Var = (mm0) lk.f6257d.get(str);
            if (mm0Var == null || !mm0Var.a() || (lm0VarG = i8.g(context, str)) == null) {
                return;
            }
            lm0VarG.a(c7Var);
        } catch (Exception e3) {
            Log.e("OMIDLIB", "Error during attestation with mechanism: ".concat(str), e3);
        }
    }

    public static final void E(Uri.Builder builder, String str, String str2) {
        if (str2 != null) {
            if ((str2.length() > 0 ? str2 : null) != null) {
                builder.appendQueryParameter(str, str2);
            }
        }
    }

    public static final void F(com.google.gson.r rVar, cw0 cw0Var, u93 u93Var) {
        rVar.q(Long.valueOf(Duration.h(u93Var.f10257a)), String.valueOf(cw0Var.getNumber()));
    }

    public static void G(ThreadPoolExecutor threadPoolExecutor, int i5, jr0 flags) {
        Intrinsics.g(flags, "flags");
        Duration.Companion companion = Duration.f72038b;
        threadPoolExecutor.setKeepAliveTime(Duration.h(((Duration) flags.a("gad:thread_keep_alive_time", ed.k(10, DurationUnit.f72046e, "gad:thread_keep_alive_time"), ads_mobile_sdk.u.a$1)).f72041a), TimeUnit.MILLISECONDS);
        if (i5 > threadPoolExecutor.getMaximumPoolSize()) {
            threadPoolExecutor.setMaximumPoolSize(i5);
            threadPoolExecutor.setCorePoolSize(i5);
        } else {
            threadPoolExecutor.setCorePoolSize(i5);
            threadPoolExecutor.setMaximumPoolSize(i5);
        }
    }

    public static boolean H(mn1 mn1Var, double d5) {
        boolean zR = mn1Var.r();
        double dS = mn1Var.s();
        if (mn1Var.y()) {
            return zR ? d5 >= dS : d5 > dS;
        }
        if (mn1Var.z()) {
            return zR ? d5 <= dS : d5 < dS;
        }
        if (mn1Var.w()) {
            return (((long) d5) & ((long) dS)) > 0;
        }
        return dS == d5;
    }

    public static final boolean I(Context context, String str) {
        Intrinsics.g(context, "context");
        return context.checkSelfPermission(str) == 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static boolean J(com.google.gson.p pVar, mn1 mn1Var) {
        if (mn1Var.B()) {
            String strU = mn1Var.u();
            Intrinsics.f(strU, "getStringValue(...)");
            boolean z11 = pVar instanceof com.google.gson.s;
            String strO = (z11 && (pVar.k().f34796a instanceof String)) ? pVar.o() : (z11 && (pVar.k().f34796a instanceof Boolean)) ? pVar.d() ? "1" : "0" : pVar.toString();
            Regex regex = new Regex(strU);
            Intrinsics.d(strO);
            return regex.f(strO);
        }
        if (mn1Var.x()) {
            Boolean boolU = u(pVar, mn1Var.p());
            if (boolU != null) {
                return boolU.booleanValue();
            }
            return false;
        }
        if (mn1Var.A()) {
            boolean z12 = pVar instanceof com.google.gson.s;
            if (z12 && (pVar.k().f34796a instanceof Number)) {
                return H(mn1Var, pVar.n().doubleValue());
            }
            if (z12 && (pVar.k().f34796a instanceof Number)) {
                return H(mn1Var, pVar.d() ? 1.0d : 0.0d);
            }
            String strO2 = (z12 && (pVar.k().f34796a instanceof String)) ? pVar.o() : pVar.toString();
            Intrinsics.d(strO2);
            String lowerCase = strO2.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "toLowerCase(...)");
            Double dR0 = r70.i.r0(lowerCase);
            if (dR0 != null) {
                return H(mn1Var, dR0.doubleValue());
            }
            return false;
        }
        if (!mn1Var.v()) {
            return true;
        }
        mn1 mn1VarO = mn1Var.o();
        Intrinsics.f(mn1VarO, "getArrayContains(...)");
        if (!(pVar instanceof com.google.gson.m)) {
            return false;
        }
        com.google.gson.m mVarH = pVar.h();
        if ((mVarH instanceof Collection) && ((Collection) mVarH).isEmpty()) {
            return false;
        }
        Iterator it = mVarH.f34793a.iterator();
        while (it.hasNext()) {
            com.google.gson.p pVar2 = (com.google.gson.p) it.next();
            if (mn1VarO.t().isEmpty()) {
                Intrinsics.d(pVar2);
                if (J(pVar2, mn1VarO)) {
                    return true;
                }
            } else {
                pVar2.getClass();
                if ((pVar2 instanceof com.google.gson.r) && K(pVar2.j(), mn1VarO)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean K(com.google.gson.r rVar, mn1 mn1Var) {
        if (mn1Var.t().isEmpty()) {
            return false;
        }
        e9 e9VarT = mn1Var.t();
        Intrinsics.f(e9VarT, "getPathList(...)");
        com.google.gson.p pVarU = U(rVar, e9VarT);
        if (pVarU == null) {
            return false;
        }
        return J(pVarU, mn1Var);
    }

    public static boolean L(com.google.gson.r rVar, com.google.gson.r rVar2, cw0 cw0Var) throws Exception {
        try {
            try {
                com.google.gson.p pVarV = rVar.v(String.valueOf(cw0Var.getNumber()));
                Intrinsics.f(pVarV, "get(...)");
                return pVarV.d();
            } catch (Exception unused) {
                if (gq.a() == hq.f4478a) {
                    return false;
                }
                throw new Exception("No default value for signal: " + cw0Var);
            }
        } catch (Exception unused2) {
            com.google.gson.p pVarV2 = rVar2.v(String.valueOf(cw0Var.getNumber()));
            Intrinsics.f(pVarV2, "get(...)");
            return pVarV2.d();
        }
    }

    public static final byte[] M(byte[] bArr, byte[] bArr2) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
        messageDigest.update(new byte[]{0, 0, 0, 16});
        messageDigest.update(bArr);
        messageDigest.update(bArr2);
        byte[] bArrDigest = messageDigest.digest();
        if (bArrDigest.length < 4) {
            return null;
        }
        return new byte[]{0, bArrDigest[0], bArrDigest[1], bArrDigest[2], bArrDigest[3]};
    }

    public static X509Certificate[] N(ByteBuffer byteBuffer, HashMap map, CertificateFactory certificateFactory) throws InvalidKeySpecException, NoSuchAlgorithmException, SignatureException, IOException, InvalidKeyException, InvalidAlgorithmParameterException {
        String str;
        Pair pairCreate;
        ByteBuffer byteBufferA = A(byteBuffer);
        ByteBuffer byteBufferA2 = A(byteBuffer);
        byte[] bArrW = W(byteBuffer);
        ArrayList arrayList = new ArrayList();
        byte[] bArrW2 = null;
        int i5 = 0;
        int i11 = -1;
        byte[] bArrW3 = null;
        while (byteBufferA2.hasRemaining()) {
            i5++;
            try {
                ByteBuffer byteBufferA3 = A(byteBufferA2);
                if (byteBufferA3.remaining() < 8) {
                    throw new SecurityException("Signature record too short");
                }
                int i12 = byteBufferA3.getInt();
                arrayList.add(Integer.valueOf(i12));
                if (i12 != 513 && i12 != 514 && i12 != 769) {
                    switch (i12) {
                        case 257:
                        case 258:
                        case 259:
                        case 260:
                            break;
                        default:
                            continue;
                    }
                }
                if (i11 == -1 || a(i12, i11) > 0) {
                    bArrW3 = W(byteBufferA3);
                    i11 = i12;
                }
            } catch (IOException e3) {
                e = e3;
                throw new SecurityException(ed.i("Failed to parse signature record #", i5), e);
            } catch (BufferUnderflowException e11) {
                e = e11;
                throw new SecurityException(ed.i("Failed to parse signature record #", i5), e);
            }
        }
        if (i11 == -1) {
            if (i5 == 0) {
                throw new SecurityException("No signatures found");
            }
            throw new SecurityException("No supported signatures found");
        }
        if (i11 == 513 || i11 == 514) {
            str = "EC";
        } else if (i11 != 769) {
            switch (i11) {
                case 257:
                case 258:
                case 259:
                case 260:
                    str = "RSA";
                    break;
                default:
                    throw new IllegalArgumentException("Unknown signature algorithm: 0x" + Long.toHexString(i11));
            }
        } else {
            str = "DSA";
        }
        if (i11 == 513) {
            pairCreate = Pair.create("SHA256withECDSA", null);
        } else if (i11 == 514) {
            pairCreate = Pair.create("SHA512withECDSA", null);
        } else if (i11 != 769) {
            switch (i11) {
                case 257:
                    pairCreate = Pair.create("SHA256withRSA/PSS", new PSSParameterSpec("SHA-256", "MGF1", MGF1ParameterSpec.SHA256, 32, 1));
                    break;
                case 258:
                    pairCreate = Pair.create("SHA512withRSA/PSS", new PSSParameterSpec("SHA-512", "MGF1", MGF1ParameterSpec.SHA512, 64, 1));
                    break;
                case 259:
                    pairCreate = Pair.create("SHA256withRSA", null);
                    break;
                case 260:
                    pairCreate = Pair.create("SHA512withRSA", null);
                    break;
                default:
                    throw new IllegalArgumentException("Unknown signature algorithm: 0x" + Long.toHexString(i11));
            }
        } else {
            pairCreate = Pair.create("SHA256withDSA", null);
        }
        String str2 = (String) pairCreate.first;
        AlgorithmParameterSpec algorithmParameterSpec = (AlgorithmParameterSpec) pairCreate.second;
        try {
            PublicKey publicKeyGeneratePublic = KeyFactory.getInstance(str).generatePublic(new X509EncodedKeySpec(bArrW));
            Signature signature = Signature.getInstance(str2);
            signature.initVerify(publicKeyGeneratePublic);
            if (algorithmParameterSpec != null) {
                signature.setParameter(algorithmParameterSpec);
            }
            signature.update(byteBufferA);
            if (!signature.verify(bArrW3)) {
                throw new SecurityException(c0.E(str2, " signature did not verify"));
            }
            byteBufferA.clear();
            ByteBuffer byteBufferA4 = A(byteBufferA);
            ArrayList arrayList2 = new ArrayList();
            int i13 = 0;
            while (byteBufferA4.hasRemaining()) {
                i13++;
                try {
                    ByteBuffer byteBufferA5 = A(byteBufferA4);
                    if (byteBufferA5.remaining() < 8) {
                        throw new IOException("Record too short");
                    }
                    int i14 = byteBufferA5.getInt();
                    arrayList2.add(Integer.valueOf(i14));
                    if (i14 == i11) {
                        bArrW2 = W(byteBufferA5);
                    }
                } catch (IOException e12) {
                    e = e12;
                    throw new IOException(ed.i("Failed to parse digest record #", i13), e);
                } catch (BufferUnderflowException e13) {
                    e = e13;
                    throw new IOException(ed.i("Failed to parse digest record #", i13), e);
                }
            }
            if (!arrayList.equals(arrayList2)) {
                throw new SecurityException("Signature algorithms don't match between digests and signatures records");
            }
            int iB = b(i11);
            byte[] bArr = (byte[]) map.put(Integer.valueOf(iB), bArrW2);
            if (bArr != null && !MessageDigest.isEqual(bArr, bArrW2)) {
                throw new SecurityException(x(iB).concat(" contents digest does not match the digest specified by a preceding signer"));
            }
            ByteBuffer byteBufferA6 = A(byteBufferA);
            ArrayList arrayList3 = new ArrayList();
            int i15 = 0;
            while (byteBufferA6.hasRemaining()) {
                i15++;
                byte[] bArrW4 = W(byteBufferA6);
                try {
                    arrayList3.add(new hg((X509Certificate) certificateFactory.generateCertificate(new ByteArrayInputStream(bArrW4)), bArrW4));
                } catch (CertificateException e14) {
                    throw new SecurityException(ed.i("Failed to decode certificate #", i15), e14);
                }
            }
            if (arrayList3.isEmpty()) {
                throw new SecurityException("No certificates listed");
            }
            if (Arrays.equals(bArrW, ((X509Certificate) arrayList3.get(0)).getPublicKey().getEncoded())) {
                return (X509Certificate[]) arrayList3.toArray(new X509Certificate[arrayList3.size()]);
            }
            throw new SecurityException("Public key mismatch between certificate and signature record");
        } catch (InvalidAlgorithmParameterException e15) {
            e = e15;
            throw new SecurityException(c0.l("Failed to verify ", str2, " signature"), e);
        } catch (InvalidKeyException e16) {
            e = e16;
            throw new SecurityException(c0.l("Failed to verify ", str2, " signature"), e);
        } catch (NoSuchAlgorithmException e17) {
            e = e17;
            throw new SecurityException(c0.l("Failed to verify ", str2, " signature"), e);
        } catch (SignatureException e18) {
            e = e18;
            throw new SecurityException(c0.l("Failed to verify ", str2, " signature"), e);
        } catch (InvalidKeySpecException e19) {
            e = e19;
            throw new SecurityException(c0.l("Failed to verify ", str2, " signature"), e);
        }
    }

    public static byte[][] O(int[] iArr, b2[] b2VarArr) throws DigestException {
        long j11;
        int i5;
        int i11;
        b2[] b2VarArr2 = b2VarArr;
        int length = b2VarArr2.length;
        int i12 = 0;
        long size = 0;
        while (true) {
            j11 = 1048576;
            if (i12 >= length) {
                break;
            }
            size += (b2VarArr2[i12].size() + 1048575) / 1048576;
            i12++;
        }
        if (size >= 2097151) {
            throw new DigestException(u4.g(size, "Too many chunks: "));
        }
        int i13 = (int) size;
        byte[][] bArr = new byte[iArr.length][];
        int i14 = 0;
        while (true) {
            char c11 = 5;
            if (i14 >= iArr.length) {
                byte[] bArr2 = new byte[5];
                bArr2[0] = -91;
                int length2 = iArr.length;
                MessageDigest[] messageDigestArr = new MessageDigest[length2];
                for (int i15 = 0; i15 < iArr.length; i15++) {
                    String strX = x(iArr[i15]);
                    try {
                        messageDigestArr[i15] = MessageDigest.getInstance(strX);
                    } catch (NoSuchAlgorithmException e3) {
                        throw new RuntimeException(strX.concat(" digest not supported"), e3);
                    }
                }
                int length3 = b2VarArr2.length;
                int i16 = 0;
                int i17 = 0;
                int i18 = 0;
                while (i16 < length3) {
                    char c12 = c11;
                    b2 b2Var = b2VarArr2[i16];
                    b2 b2Var2 = b2Var;
                    long size2 = b2Var.size();
                    long j12 = 0;
                    int i19 = i18;
                    while (size2 > 0) {
                        int iMin = (int) Math.min(size2, j11);
                        a(iMin, bArr2);
                        length2 = length2;
                        for (int i21 = 0; i21 < length2; i21++) {
                            messageDigestArr[i21].update(bArr2);
                        }
                        byte[] bArr3 = bArr2;
                        b2 b2Var3 = b2Var2;
                        long j13 = j12;
                        try {
                            b2Var3.a(messageDigestArr, j13, iMin);
                            int i22 = 0;
                            while (i22 < iArr.length) {
                                int i23 = iArr[i22];
                                int i24 = i22;
                                byte[] bArr4 = bArr[i24];
                                int i25 = length2;
                                if (i23 == 1) {
                                    i5 = 32;
                                } else {
                                    if (i23 != 2) {
                                        throw new IllegalArgumentException(ed.i("Unknown content digest algorthm: ", i23));
                                    }
                                    i5 = 64;
                                }
                                MessageDigest messageDigest = messageDigestArr[i24];
                                int i26 = length3;
                                int i27 = i19;
                                byte[][] bArr5 = bArr;
                                int iDigest = messageDigest.digest(bArr4, (i27 * i5) + 5, i5);
                                if (iDigest != i5) {
                                    throw new RuntimeException("Unexpected output size of " + messageDigest.getAlgorithm() + " digest: " + iDigest);
                                }
                                i22 = i24 + 1;
                                i19 = i27;
                                length2 = i25;
                                length3 = i26;
                                bArr = bArr5;
                            }
                            long j14 = iMin;
                            j12 = j13 + j14;
                            size2 -= j14;
                            i19++;
                            b2Var2 = b2Var3;
                            bArr2 = bArr3;
                            length3 = length3;
                            j11 = 1048576;
                        } catch (IOException e11) {
                            throw new DigestException(c0.g(i19, i17, "Failed to digest chunk #", " of section #"), e11);
                        }
                    }
                    i17++;
                    i16++;
                    b2VarArr2 = b2VarArr;
                    i18 = i19;
                    c11 = c12;
                    length3 = length3;
                    j11 = 1048576;
                }
                byte[][] bArr6 = bArr;
                byte[][] bArr7 = new byte[iArr.length][];
                for (int i28 = 0; i28 < iArr.length; i28++) {
                    int i29 = iArr[i28];
                    byte[] bArr8 = bArr6[i28];
                    String strX2 = x(i29);
                    try {
                        bArr7[i28] = MessageDigest.getInstance(strX2).digest(bArr8);
                    } catch (NoSuchAlgorithmException e12) {
                        throw new RuntimeException(strX2.concat(" digest not supported"), e12);
                    }
                }
                return bArr7;
            }
            int i31 = iArr[i14];
            if (i31 == 1) {
                i11 = 32;
            } else {
                if (i31 != 2) {
                    throw new IllegalArgumentException(ed.i("Unknown content digest algorthm: ", i31));
                }
                i11 = 64;
            }
            byte[] bArr9 = new byte[(i11 * i13) + 5];
            bArr9[0] = 90;
            a(i13, bArr9);
            bArr[i14] = bArr9;
            i14++;
        }
    }

    public static X509Certificate[][] P(RandomAccessFile randomAccessFile) throws IOException, gg, CertificateException {
        Pair pairL;
        if (randomAccessFile.length() < 22) {
            pairL = null;
        } else {
            pairL = k9.l(randomAccessFile, 0);
            if (pairL == null) {
                pairL = k9.l(randomAccessFile, 65535);
            }
        }
        if (pairL == null) {
            throw new gg("Not an APK file: ZIP End of Central Directory record not found in file with " + randomAccessFile.length() + " bytes");
        }
        ByteBuffer byteBuffer = (ByteBuffer) pairL.first;
        long jLongValue = ((Long) pairL.second).longValue();
        long j11 = jLongValue - 20;
        if (j11 >= 0) {
            randomAccessFile.seek(j11);
            if (randomAccessFile.readInt() == 1347094023) {
                throw new gg("ZIP64 APK not supported");
            }
        }
        ByteOrder byteOrderOrder = byteBuffer.order();
        ByteOrder byteOrder = ByteOrder.LITTLE_ENDIAN;
        if (byteOrderOrder != byteOrder) {
            throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
        }
        long j12 = byteBuffer.getInt(byteBuffer.position() + 16) & 4294967295L;
        if (j12 >= jLongValue) {
            StringBuilder sbU = c0.u(j12, "ZIP Central Directory offset out of range: ", ". ZIP End of Central Directory offset: ");
            sbU.append(jLongValue);
            throw new gg(sbU.toString());
        }
        if (byteBuffer.order() != byteOrder) {
            throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
        }
        if (j12 + (byteBuffer.getInt(byteBuffer.position() + 12) & 4294967295L) != jLongValue) {
            throw new gg("ZIP Central Directory is not immediately followed by End of Central Directory");
        }
        if (j12 < 32) {
            throw new gg(u4.g(j12, "APK too small for APK Signing Block. ZIP Central Directory offset: "));
        }
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(24);
        byteBufferAllocate.order(byteOrder);
        randomAccessFile.seek(j12 - byteBufferAllocate.capacity());
        randomAccessFile.readFully(byteBufferAllocate.array(), byteBufferAllocate.arrayOffset(), byteBufferAllocate.capacity());
        if (byteBufferAllocate.getLong(8) != 2334950737559900225L || byteBufferAllocate.getLong(16) != 3617552046287187010L) {
            throw new gg("No APK Signing Block before ZIP Central Directory");
        }
        long j13 = byteBufferAllocate.getLong(0);
        if (j13 < byteBufferAllocate.capacity() || j13 > 2147483639) {
            throw new gg(u4.g(j13, "APK Signing Block size out of range: "));
        }
        int i5 = (int) (8 + j13);
        long j14 = j12 - i5;
        if (j14 < 0) {
            throw new gg(u4.g(j14, "APK Signing Block offset out of range: "));
        }
        ByteBuffer byteBufferAllocate2 = ByteBuffer.allocate(i5);
        byteBufferAllocate2.order(byteOrder);
        randomAccessFile.seek(j14);
        randomAccessFile.readFully(byteBufferAllocate2.array(), byteBufferAllocate2.arrayOffset(), byteBufferAllocate2.capacity());
        long j15 = byteBufferAllocate2.getLong(0);
        if (j15 != j13) {
            StringBuilder sbU2 = c0.u(j15, "APK Signing Block sizes in header and footer do not match: ", " vs ");
            sbU2.append(j13);
            throw new gg(sbU2.toString());
        }
        Pair pairCreate = Pair.create(byteBufferAllocate2, Long.valueOf(j14));
        ByteBuffer byteBuffer2 = (ByteBuffer) pairCreate.first;
        long jLongValue2 = ((Long) pairCreate.second).longValue();
        if (byteBuffer2.order() != byteOrder) {
            throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
        }
        int iCapacity = byteBuffer2.capacity() - 24;
        if (iCapacity < 8) {
            throw new IllegalArgumentException(c0.i(iCapacity, "end < start: ", " < 8"));
        }
        int iCapacity2 = byteBuffer2.capacity();
        if (iCapacity > byteBuffer2.capacity()) {
            throw new IllegalArgumentException(c0.g(iCapacity, iCapacity2, "end > capacity: ", " > "));
        }
        int iLimit = byteBuffer2.limit();
        int iPosition = byteBuffer2.position();
        try {
            byteBuffer2.position(0);
            byteBuffer2.limit(iCapacity);
            byteBuffer2.position(8);
            ByteBuffer byteBufferSlice = byteBuffer2.slice();
            byteBufferSlice.order(byteBuffer2.order());
            byteBuffer2.position(0);
            byteBuffer2.limit(iLimit);
            byteBuffer2.position(iPosition);
            int i11 = 0;
            while (byteBufferSlice.hasRemaining()) {
                i11++;
                if (byteBufferSlice.remaining() < 8) {
                    throw new gg(ed.i("Insufficient data to read size of APK Signing Block entry #", i11));
                }
                long j16 = byteBufferSlice.getLong();
                if (j16 < 4 || j16 > 2147483647L) {
                    throw new gg("APK Signing Block entry #" + i11 + " size out of range: " + j16);
                }
                int i12 = (int) j16;
                int iPosition2 = byteBufferSlice.position() + i12;
                if (i12 > byteBufferSlice.remaining()) {
                    StringBuilder sbT = c0.t(i11, "APK Signing Block entry #", " size out of range: ", i12, ", available: ");
                    sbT.append(byteBufferSlice.remaining());
                    throw new gg(sbT.toString());
                }
                if (byteBufferSlice.getInt() == 1896449818) {
                    ByteBuffer byteBufferB = B(byteBufferSlice, i12 - 4);
                    FileChannel channel = randomAccessFile.getChannel();
                    HashMap map = new HashMap();
                    ArrayList arrayList = new ArrayList();
                    try {
                        CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
                        try {
                            ByteBuffer byteBufferA = A(byteBufferB);
                            int i13 = 0;
                            while (byteBufferA.hasRemaining()) {
                                i13++;
                                try {
                                    arrayList.add(N(A(byteBufferA), map, certificateFactory));
                                } catch (IOException | SecurityException | BufferUnderflowException e3) {
                                    throw new SecurityException(c0.i(i13, "Failed to parse/verify signer #", " block"), e3);
                                }
                            }
                            if (i13 < 1) {
                                throw new SecurityException("No signers found");
                            }
                            if (map.isEmpty()) {
                                throw new SecurityException("No content digests found");
                            }
                            if (map.isEmpty()) {
                                throw new SecurityException("No digests provided");
                            }
                            fg fgVar = new fg(channel, 0L, jLongValue2);
                            fg fgVar2 = new fg(channel, j12, jLongValue - j12);
                            ByteBuffer byteBufferDuplicate = byteBuffer.duplicate();
                            ByteOrder byteOrder2 = ByteOrder.LITTLE_ENDIAN;
                            byteBufferDuplicate.order(byteOrder2);
                            if (byteBufferDuplicate.order() != byteOrder2) {
                                throw new IllegalArgumentException("ByteBuffer byte order must be little endian");
                            }
                            int iPosition3 = byteBufferDuplicate.position() + 16;
                            if (jLongValue2 < 0 || jLongValue2 > 4294967295L) {
                                throw new IllegalArgumentException(u4.g(jLongValue2, "uint32 value of out range: "));
                            }
                            byteBufferDuplicate.putInt(byteBufferDuplicate.position() + iPosition3, (int) jLongValue2);
                            au auVar = new au(byteBufferDuplicate);
                            int size = map.size();
                            int[] iArr = new int[size];
                            Iterator it = map.keySet().iterator();
                            int i14 = 0;
                            while (it.hasNext()) {
                                iArr[i14] = ((Integer) it.next()).intValue();
                                i14++;
                            }
                            try {
                                byte[][] bArrO = O(iArr, new b2[]{fgVar, fgVar2, auVar});
                                for (int i15 = 0; i15 < size; i15++) {
                                    int i16 = iArr[i15];
                                    if (!MessageDigest.isEqual((byte[]) map.get(Integer.valueOf(i16)), bArrO[i15])) {
                                        throw new SecurityException(x(i16).concat(" digest of contents did not verify"));
                                    }
                                }
                                return (X509Certificate[][]) arrayList.toArray(new X509Certificate[arrayList.size()][]);
                            } catch (DigestException e11) {
                                throw new SecurityException("Failed to compute digest(s) of contents", e11);
                            }
                        } catch (IOException e12) {
                            throw new SecurityException("Failed to read list of signers", e12);
                        }
                    } catch (CertificateException e13) {
                        throw new RuntimeException("Failed to obtain X.509 CertificateFactory", e13);
                    }
                }
                byteBufferSlice.position(iPosition2);
            }
            throw new gg("No APK Signature Scheme v2 block in APK Signing Block");
        } catch (Throwable th2) {
            byteBuffer2.position(0);
            byteBuffer2.limit(iLimit);
            byteBuffer2.position(iPosition);
            throw th2;
        }
    }

    public static X509Certificate[][] Q(String str) throws IOException {
        RandomAccessFile randomAccessFile = new RandomAccessFile(str, "r");
        try {
            X509Certificate[][] x509CertificateArrP = P(randomAccessFile);
            randomAccessFile.close();
            return x509CertificateArrP;
        } finally {
            try {
                randomAccessFile.close();
            } catch (IOException unused) {
            }
        }
    }

    public static int R(int i5, int i11, com.google.android.gms.internal.measurement.q0 q0Var, byte[] bArr) {
        int i12 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i13 = i11 + 1;
        byte b11 = bArr[i11];
        if (b11 >= 0) {
            q0Var.f32977a = i12 | (b11 << 7);
            return i13;
        }
        int i14 = i12 | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i15 = i11 + 2;
        byte b12 = bArr[i13];
        if (b12 >= 0) {
            q0Var.f32977a = i14 | (b12 << 14);
            return i15;
        }
        int i16 = i14 | ((b12 & AbstractJsonLexerKt.TC_INVALID) << 14);
        int i17 = i11 + 3;
        byte b13 = bArr[i15];
        if (b13 >= 0) {
            q0Var.f32977a = i16 | (b13 << 21);
            return i17;
        }
        int i18 = i16 | ((b13 & AbstractJsonLexerKt.TC_INVALID) << 21);
        int i19 = i11 + 4;
        byte b14 = bArr[i17];
        if (b14 >= 0) {
            q0Var.f32977a = i18 | (b14 << 28);
            return i19;
        }
        int i21 = i18 | ((b14 & AbstractJsonLexerKt.TC_INVALID) << 28);
        while (true) {
            int i22 = i19 + 1;
            if (bArr[i19] >= 0) {
                q0Var.f32977a = i21;
                return i22;
            }
            i19 = i22;
        }
    }

    public static int S(int i5, byte[] bArr) {
        return ((bArr[i5 + 3] & 255) << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
    }

    public static int T(x8 x8Var, int i5, byte[] bArr, int i11, int i12, e9 e9Var, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        cu0 cu0VarA = x8Var.a();
        x8 x8Var2 = x8Var;
        byte[] bArr2 = bArr;
        int i13 = i12;
        com.google.android.gms.internal.measurement.q0 q0Var2 = q0Var;
        int iH = h(cu0VarA, x8Var2, bArr2, i11, i13, q0Var2);
        x8Var2.c(cu0VarA);
        q0Var2.f32979c = cu0VarA;
        e9Var.add(cu0VarA);
        while (iH < i13) {
            int iR = iH + 1;
            byte b11 = bArr2[iH];
            if (b11 >= 0) {
                q0Var2.f32977a = b11;
            } else {
                iR = R(b11, iR, q0Var2, bArr2);
            }
            if (i5 != q0Var2.f32977a) {
                break;
            }
            byte[] bArr3 = bArr2;
            x8 x8Var3 = x8Var2;
            cu0 cu0VarA2 = x8Var3.a();
            com.google.android.gms.internal.measurement.q0 q0Var3 = q0Var2;
            int i14 = i13;
            iH = h(cu0VarA2, x8Var3, bArr3, iR, i14, q0Var3);
            x8Var2 = x8Var3;
            bArr2 = bArr3;
            i13 = i14;
            q0Var2 = q0Var3;
            x8Var2.c(cu0VarA2);
            q0Var2.f32979c = cu0VarA2;
            e9Var.add(cu0VarA2);
        }
        return iH;
    }

    public static com.google.gson.p U(com.google.gson.r rVar, e9 e9Var) {
        Iterator it = e9Var.iterator();
        com.google.gson.p pVarV = null;
        while (it.hasNext()) {
            String str = (String) it.next();
            if (pVarV != null && !(pVarV instanceof com.google.gson.r)) {
                return null;
            }
            if (pVarV == null || (pVarV = pVarV.j().v(str)) == null) {
                pVarV = rVar.v(str);
            }
        }
        return pVarV;
    }

    public static void V(String str) {
        if (Log.isLoggable("InstallReferrerClient", 5)) {
            Log.w("InstallReferrerClient", str);
        }
    }

    public static byte[] W(ByteBuffer byteBuffer) throws IOException {
        int i5 = byteBuffer.getInt();
        if (i5 < 0) {
            throw new IOException("Negative length");
        }
        if (i5 <= byteBuffer.remaining()) {
            byte[] bArr = new byte[i5];
            byteBuffer.get(bArr);
            return bArr;
        }
        StringBuilder sbJ = u4.j(i5, "Underflow while reading length-prefixed value. Length: ", ", available: ");
        sbJ.append(byteBuffer.remaining());
        throw new IOException(sbJ.toString());
    }

    public static final int X(Context context) {
        Intrinsics.g(context, "context");
        if (I(context, "android.permission.READ_PHONE_STATE") || (Build.VERSION.SDK_INT >= 33 && I(context, "android.permission.READ_BASIC_PHONE_STATE"))) {
            return ((TelephonyManager) context.getSystemService(TelephonyManager.class)).getDataNetworkType();
        }
        return 0;
    }

    public static int Y(byte[] bArr, int i5, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        int iB = b(i5, bArr.length, q0Var, bArr);
        int i11 = q0Var.f32977a;
        String strA = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (i11 == 0) {
            q0Var.f32979c = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            return iB;
        }
        if (i11 == 0) {
            k9 k9Var = vn3.f10832a;
        } else {
            strA = vn3.f10832a.a(bArr, iB, i11);
        }
        q0Var.f32979c = strA;
        return iB + i11;
    }

    public static long Z(int i5, byte[] bArr) {
        return ((bArr[i5 + 7] & 255) << 56) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16) | ((bArr[i5 + 3] & 255) << 24) | ((bArr[i5 + 4] & 255) << 32) | ((bArr[i5 + 5] & 255) << 40) | ((bArr[i5 + 6] & 255) << 48);
    }

    public static /* synthetic */ int a(int i5) {
        if (i5 != 0) {
            return i5 - 1;
        }
        throw null;
    }

    public static int a0(byte[] bArr, int i5, com.google.android.gms.internal.measurement.q0 q0Var) {
        int i11 = i5 + 1;
        byte b11 = bArr[i5];
        if (b11 < 0) {
            return R(b11, i11, q0Var, bArr);
        }
        q0Var.f32977a = b11;
        return i11;
    }

    public static int b(int i5, int i11, com.google.android.gms.internal.measurement.q0 q0Var, byte[] bArr) throws yi1 {
        int iA0 = a0(bArr, i5, q0Var);
        int i12 = q0Var.f32977a;
        if (i12 < 0) {
            throw new yi1("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
        }
        if (i12 <= i11 - iA0) {
            return iA0;
        }
        throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public static String b0(com.google.gson.p pVar, a41 a41Var) throws IOException {
        boolean z11 = pVar instanceof com.google.gson.r;
        CharSequence charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (z11) {
            com.google.gson.r rVarJ = pVar.j();
            int iX = a41Var.G() ? a41Var.x() : -1;
            Set setKeySet = rVarJ.f34795a.keySet();
            ArrayList arrayList = new ArrayList();
            Iterator it = ((hn.m) setKeySet).iterator();
            while (((hn.l) it).hasNext()) {
                String str = (String) ((hn.l) it).b().f59928f;
                com.google.gson.p pVarV = rVarJ.v(str);
                Intrinsics.f(pVarV, "get(...)");
                String strB0 = b0(pVarV, a41Var);
                String strM = (a41Var.r() <= 0 || strB0.length() <= a41Var.r()) ? u4.m(str, a41Var.v(), strB0) : null;
                if (strM != null) {
                    arrayList.add(strM);
                }
            }
            String strU = a41Var.u();
            Intrinsics.f(strU, "getItemSeparator(...)");
            String strF1 = b70.g.f1(arrayList, strU, null, null, iX, null, 38);
            int length = strF1.length() - 1;
            if (length >= 0) {
                while (true) {
                    int i5 = length - 1;
                    if (strF1.charAt(length) != a41Var.o().charAt(0)) {
                        charSequenceSubSequence = strF1.subSequence(0, length + 1);
                        break;
                    }
                    if (i5 < 0) {
                        break;
                    }
                    length = i5;
                }
            }
            return charSequenceSubSequence.toString();
        }
        if (!(pVar instanceof com.google.gson.m)) {
            boolean z12 = pVar instanceof com.google.gson.s;
            if (z12 && (pVar.k().f34796a instanceof String)) {
                String strO = pVar.o();
                Intrinsics.d(strO);
                return strO;
            }
            if (z12 && (pVar.k().f34796a instanceof Boolean)) {
                return pVar.k().d() ? "1" : "0";
            }
            String string = pVar.toString();
            Intrinsics.d(string);
            return string;
        }
        com.google.gson.m mVarH = pVar.h();
        int iX2 = a41Var.G() ? a41Var.x() : -1;
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = mVarH.f34793a.iterator();
        while (it2.hasNext()) {
            com.google.gson.p pVar2 = (com.google.gson.p) it2.next();
            Intrinsics.d(pVar2);
            String strB02 = b0(pVar2, a41Var);
            if (a41Var.r() > 0 && strB02.length() > a41Var.r()) {
                strB02 = null;
            }
            if (strB02 != null) {
                arrayList2.add(strB02);
            }
        }
        String strO2 = a41Var.o();
        Intrinsics.f(strO2, "getArraySeparator(...)");
        String strF12 = b70.g.f1(arrayList2, strO2, null, null, iX2, null, 38);
        int length2 = strF12.length() - 1;
        if (length2 >= 0) {
            while (true) {
                int i11 = length2 - 1;
                if (strF12.charAt(length2) != a41Var.o().charAt(0)) {
                    charSequenceSubSequence = strF12.subSequence(0, length2 + 1);
                    break;
                }
                if (i11 < 0) {
                    break;
                }
                length2 = i11;
            }
        }
        return charSequenceSubSequence.toString();
    }

    public static int c(int i5, byte[] bArr, int i11, int i12, bm3 bm3Var, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        if ((i5 >>> 3) == 0) {
            throw new yi1("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            int iC0 = c0(bArr, i11, q0Var);
            bm3Var.a(i5, Long.valueOf(q0Var.f32978b));
            return iC0;
        }
        if (i13 == 1) {
            bm3Var.a(i5, Long.valueOf(Z(i11, bArr)));
            return i11 + 8;
        }
        if (i13 == 2) {
            int iB = b(i11, bArr.length, q0Var, bArr);
            int i14 = q0Var.f32977a;
            if (i14 == 0) {
                bm3Var.a(i5, sq.f9634b);
            } else {
                bm3Var.a(i5, sq.a(iB, i14, bArr));
            }
            return iB + i14;
        }
        if (i13 != 3) {
            if (i13 != 5) {
                throw new yi1("Protocol message contained an invalid tag (zero).");
            }
            bm3Var.a(i5, Integer.valueOf(S(i11, bArr)));
            return i11 + 4;
        }
        bm3 bm3VarB = bm3.b();
        int i15 = (i5 & (-8)) | 4;
        int i16 = q0Var.f32980d + 1;
        q0Var.f32980d = i16;
        if (i16 >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i17 = 0;
        while (true) {
            if (i11 >= i12) {
                break;
            }
            int iA0 = a0(bArr, i11, q0Var);
            int i18 = q0Var.f32977a;
            if (i18 == i15) {
                i17 = i18;
                i11 = iA0;
                break;
            }
            i11 = c(i18, bArr, iA0, i12, bm3VarB, q0Var);
            i17 = i18;
        }
        q0Var.f32980d--;
        if (i11 > i12 || i17 != i15) {
            throw new yi1("Failed to parse the message.");
        }
        bm3Var.a(i5, bm3VarB);
        return i11;
    }

    public static int c0(byte[] bArr, int i5, com.google.android.gms.internal.measurement.q0 q0Var) {
        int i11 = i5 + 1;
        long j11 = bArr[i5];
        if (j11 >= 0) {
            q0Var.f32978b = j11;
            return i11;
        }
        int i12 = i5 + 2;
        byte b11 = bArr[i11];
        long j12 = (j11 & 127) | ((b11 & AbstractJsonLexerKt.TC_INVALID) << 7);
        int i13 = 7;
        while (b11 < 0) {
            int i14 = i12 + 1;
            i13 += 7;
            j12 |= (r10 & AbstractJsonLexerKt.TC_INVALID) << i13;
            b11 = bArr[i12];
            i12 = i14;
        }
        q0Var.f32978b = j12;
        return i12;
    }

    public static int d(int i5, byte[] bArr, int i11, int i12, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        if ((i5 >>> 3) == 0) {
            throw new yi1("Protocol message contained an invalid tag (zero).");
        }
        int i13 = i5 & 7;
        if (i13 == 0) {
            return c0(bArr, i11, q0Var);
        }
        if (i13 == 1) {
            return i11 + 8;
        }
        if (i13 == 2) {
            return b(i11, bArr.length, q0Var, bArr) + q0Var.f32977a;
        }
        if (i13 != 3) {
            if (i13 == 5) {
                return i11 + 4;
            }
            throw new yi1("Protocol message contained an invalid tag (zero).");
        }
        int i14 = (i5 & (-8)) | 4;
        int i15 = q0Var.f32980d + 1;
        q0Var.f32980d = i15;
        if (i15 >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i16 = 0;
        while (i11 < i12) {
            i11 = a0(bArr, i11, q0Var);
            i16 = q0Var.f32977a;
            if (i16 == i14) {
                break;
            }
            i11 = d(i16, bArr, i11, i12, q0Var);
        }
        q0Var.f32980d--;
        if (i11 > i12 || i16 != i14) {
            throw new yi1("Failed to parse the message.");
        }
        return i11;
    }

    public static int d0(byte[] bArr, int i5, e9 e9Var, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        jb1 jb1Var = (jb1) e9Var;
        int iB = b(i5, bArr.length, q0Var, bArr);
        int i11 = q0Var.f32977a + iB;
        while (iB < i11) {
            int i12 = iB + 1;
            byte b11 = bArr[iB];
            if (b11 >= 0) {
                q0Var.f32977a = b11;
                iB = i12;
            } else {
                iB = R(b11, i12, q0Var, bArr);
            }
            jb1Var.b(q0Var.f32977a);
        }
        if (iB == i11) {
            return iB;
        }
        throw new yi1("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }

    public static final int e(Context context) {
        NetworkInfo activeNetworkInfo;
        Intrinsics.g(context, "context");
        if (!I(context, "android.permission.ACCESS_NETWORK_STATE") || (activeNetworkInfo = ((ConnectivityManager) context.getSystemService(ConnectivityManager.class)).getActiveNetworkInfo()) == null) {
            return -1;
        }
        return activeNetworkInfo.getDetailedState().ordinal();
    }

    public static int e0(int i5, byte[] bArr, int i11, int i12, e9 e9Var, com.google.android.gms.internal.measurement.q0 q0Var) {
        jb1 jb1Var = (jb1) e9Var;
        int iA0 = a0(bArr, i11, q0Var);
        jb1Var.b(q0Var.f32977a);
        while (iA0 < i12) {
            int iR = iA0 + 1;
            byte b11 = bArr[iA0];
            if (b11 >= 0) {
                q0Var.f32977a = b11;
            } else {
                iR = R(b11, iR, q0Var, bArr);
            }
            if (i5 != q0Var.f32977a) {
                break;
            }
            iA0 = iR + 1;
            byte b12 = bArr[iR];
            if (b12 >= 0) {
                q0Var.f32977a = b12;
            } else {
                iA0 = R(b12, iA0, q0Var, bArr);
            }
            jb1Var.b(q0Var.f32977a);
        }
        return iA0;
    }

    public static final int f(Context context, NetworkCapabilities networkCapabilities) {
        Intrinsics.g(context, "context");
        if (!I(context, "android.permission.ACCESS_NETWORK_STATE") || networkCapabilities == null) {
            return -1;
        }
        if (networkCapabilities.hasTransport(3)) {
            return 9;
        }
        if (networkCapabilities.hasTransport(1)) {
            return 1;
        }
        return networkCapabilities.hasTransport(0) ? 0 : -1;
    }

    public static int g(Object obj, x8 x8Var, byte[] bArr, int i5, int i11, int i12, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        op1 op1Var = (op1) x8Var;
        int i13 = q0Var.f32980d + 1;
        q0Var.f32980d = i13;
        if (i13 >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int iA = op1Var.a(obj, bArr, i5, i11, i12, q0Var);
        q0Var.f32980d--;
        q0Var.f32979c = obj;
        return iA;
    }

    public static int h(Object obj, x8 x8Var, byte[] bArr, int i5, int i11, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        int iB = b(i5, i11, q0Var, bArr);
        int i12 = q0Var.f32977a;
        int i13 = q0Var.f32980d + 1;
        q0Var.f32980d = i13;
        if (i13 >= 100) {
            throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        int i14 = i12 + iB;
        x8Var.a(obj, bArr, iB, i14, q0Var);
        q0Var.f32980d--;
        q0Var.f32979c = obj;
        return i14;
    }

    public static int i(byte[] bArr, int i5, com.google.android.gms.internal.measurement.q0 q0Var) throws yi1 {
        int iB = b(i5, bArr.length, q0Var, bArr);
        int i11 = q0Var.f32977a;
        if (i11 == 0) {
            q0Var.f32979c = sq.f9634b;
            return iB;
        }
        q0Var.f32979c = sq.a(iB, i11, bArr);
        return iB + i11;
    }

    public static long j(jr0 jr0Var, cw0 signalId) {
        Intrinsics.g(signalId, "signalId");
        com.google.gson.r defaultValue = jr0.C;
        Intrinsics.g(defaultValue, "defaultValue");
        return k((com.google.gson.r) jr0Var.a("gads:signal_source_timeouts_ms", defaultValue, jn.a$19), defaultValue, signalId, u93.f10253c.f10257a);
    }

    public static long k(com.google.gson.r rVar, com.google.gson.r rVar2, cw0 cw0Var, long j11) throws Exception {
        try {
            try {
                Duration.Companion companion = Duration.f72038b;
                com.google.gson.p pVarV = rVar.v(String.valueOf(cw0Var.getNumber()));
                Intrinsics.f(pVarV, "get(...)");
                return DurationKt.h(pVarV.l(), DurationUnit.f72045d);
            } catch (Exception unused) {
                Duration.Companion companion2 = Duration.f72038b;
                com.google.gson.p pVarV2 = rVar2.v(String.valueOf(cw0Var.getNumber()));
                Intrinsics.f(pVarV2, "get(...)");
                return DurationKt.h(pVarV2.l(), DurationUnit.f72045d);
            }
        } catch (Exception unused2) {
            if (gq.a() == hq.f4478a) {
                return j11;
            }
            throw new Exception("No default value for signal: " + cw0Var);
        }
    }

    public static final bq l(String str) {
        u uVarO = bq.o();
        Intrinsics.f(uVarO, "newBuilder(...)");
        List listI1 = str != null ? r70.k.i1(str, new String[]{"."}, 6) : EmptyList.f71733a;
        if (listI1.size() == 3) {
            Long lV0 = r70.i.v0((String) listI1.get(0));
            uVarO.c(lV0 != null ? lV0.longValue() : 0L);
            Long lV02 = r70.i.v0((String) listI1.get(1));
            uVarO.e(lV02 != null ? lV02.longValue() : 0L);
            Long lV03 = r70.i.v0((String) listI1.get(2));
            uVarO.d(lV03 != null ? lV03.longValue() : 0L);
        }
        return (bq) uVarO.a();
    }

    public static ads_mobile_sdk.g2 m(com.google.gson.r rVar) {
        try {
            int iG = rVar.v("width").g();
            int iG2 = rVar.v("height").g();
            com.google.gson.p pVarV = rVar.v("is_fluid_height");
            return new ads_mobile_sdk.g2(iG, iG2, pVarV != null ? pVarV.d() : false);
        } catch (Exception e3) {
            ArrayList arrayList = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static hv n(com.google.gson.r rVar) {
        int i5;
        long j11;
        long j12;
        long j13;
        com.google.gson.r rVar2;
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        mp mpVar;
        com.google.gson.r rVar3;
        int i11;
        boolean z11;
        boolean zD;
        boolean zD2;
        int i12;
        long j14;
        int iG;
        ArrayList arrayList = new ArrayList();
        Duration.f72038b.getClass();
        int iG2 = 1;
        long jG = 0;
        long jL = Duration.l(0L, DurationKt.g(1, DurationUnit.f72046e));
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        objectRef.f71863a = new com.google.gson.r();
        com.google.gson.r rVar4 = new com.google.gson.r();
        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        objectRef2.f71863a = new com.google.gson.r();
        Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
        objectRef3.f71863a = new com.google.gson.r();
        String strO = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (rVar != null) {
            Iterator it = ((hn.m) rVar.f34795a.entrySet()).iterator();
            long jL2 = 0;
            String str6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String str7 = str6;
            String str8 = str7;
            String str9 = str8;
            String str10 = str9;
            int iG3 = 0;
            mp mpVar2 = null;
            zD = false;
            boolean zD3 = false;
            com.google.gson.r rVarA = null;
            zD2 = false;
            while (((hn.l) it).hasNext()) {
                hn.n nVarB = ((hn.l) it).b();
                String str11 = (String) nVarB.getKey();
                com.google.gson.p pVar = (com.google.gson.p) nVarB.getValue();
                if (str11 != null) {
                    i12 = iG2;
                    switch (str11.hashCode()) {
                        case -2068795272:
                            j14 = jL;
                            if (str11.equals("is_persistent_ad_enabled")) {
                                zD3 = pVar.d();
                                break;
                            }
                            break;
                        case -1934789405:
                            j14 = jL;
                            if (str11.equals("adRequestUrl")) {
                                String strO2 = pVar.o();
                                Intrinsics.f(strO2, "getAsString(...)");
                                iG2 = i12;
                                str7 = strO2;
                            }
                            jL = j14;
                            break;
                        case -1664768712:
                            j14 = jL;
                            if (str11.equals("inspector_ad_transaction_extras")) {
                                com.google.gson.r rVarA2 = d62.a(pVar);
                                if (rVarA2 == null) {
                                    try {
                                        rVarA2 = (com.google.gson.r) new Gson().fromJson(pVar.o(), com.google.gson.r.class);
                                    } catch (Exception e3) {
                                        ArrayList arrayList2 = k9.e(e3, e3).f1803s;
                                        String message = e3.getMessage();
                                        if (message == null) {
                                            message = e3.getClass().getName();
                                        }
                                        arrayList2.add(message);
                                        rVarA2 = null;
                                    }
                                    if (rVarA2 == null) {
                                        rVarA2 = (com.google.gson.r) objectRef2.f71863a;
                                    }
                                }
                                objectRef2.f71863a = rVarA2;
                                break;
                            }
                            break;
                        case -1550155393:
                            j14 = jL;
                            if (str11.equals("nofill_urls")) {
                                Iterator it2 = pVar.h().f34793a.iterator();
                                int i13 = 0;
                                while (it2.hasNext()) {
                                    Object next = it2.next();
                                    int i14 = i13 + 1;
                                    if (i13 < 0) {
                                        ul.b.e0();
                                        throw null;
                                    }
                                    com.google.gson.p pVar2 = (com.google.gson.p) next;
                                    Intrinsics.d(pVar2);
                                    String strO3 = pVar2.o();
                                    Intrinsics.f(strO3, "getAsString(...)");
                                    Uri uri = Uri.parse(strO3);
                                    if (uri != null) {
                                        arrayList.add(uri);
                                    }
                                    i13 = i14;
                                }
                                break;
                            }
                            break;
                        case -1076723292:
                            j14 = jL;
                            if (str11.equals("adapter_response_replacement_key")) {
                                String strO4 = pVar.o();
                                Intrinsics.f(strO4, "getAsString(...)");
                                iG2 = i12;
                                str9 = strO4;
                            }
                            jL = j14;
                            break;
                        case -996058782:
                            j14 = jL;
                            if (str11.equals("adResponseHeaders")) {
                                com.google.gson.r rVarA3 = d62.a(pVar);
                                if (rVarA3 == null) {
                                    try {
                                        rVarA3 = (com.google.gson.r) new Gson().fromJson(pVar.o(), com.google.gson.r.class);
                                    } catch (Exception e11) {
                                        ArrayList arrayList3 = k9.e(e11, e11).f1803s;
                                        String message2 = e11.getMessage();
                                        if (message2 == null) {
                                            message2 = e11.getClass().getName();
                                        }
                                        arrayList3.add(message2);
                                        rVarA3 = null;
                                    }
                                    if (rVarA3 == null) {
                                        rVarA3 = (com.google.gson.r) objectRef3.f71863a;
                                    }
                                }
                                objectRef3.f71863a = rVarA3;
                                break;
                            }
                            break;
                        case -878581970:
                            j14 = jL;
                            if (str11.equals("gws_query_id")) {
                                strO = pVar.o();
                                Intrinsics.f(strO, "getAsString(...)");
                                break;
                            }
                            break;
                        case -729197079:
                            j14 = jL;
                            if (str11.equals("is_idless")) {
                                zD = pVar.d();
                                break;
                            }
                            break;
                        case -644504941:
                            j14 = jL;
                            if (str11.equals("max_parallel_renderers")) {
                                iG2 = pVar.g();
                            }
                            jL = j14;
                            break;
                        case -430112607:
                            j14 = jL;
                            if (str11.equals("throttle_configuration")) {
                                rVarA = d62.a(pVar);
                                break;
                            }
                            break;
                        case -46576386:
                            j14 = jL;
                            if (str11.equals("latency")) {
                                jL2 = pVar.l();
                                break;
                            }
                            break;
                        case 532938054:
                            j14 = jL;
                            if (str11.equals("adResponseBody")) {
                                String strO5 = pVar.o();
                                Intrinsics.f(strO5, "getAsString(...)");
                                iG2 = i12;
                                str10 = strO5;
                            }
                            jL = j14;
                            break;
                        case 864007346:
                            if (str11.equals("public_error")) {
                                Intrinsics.d(pVar);
                                if (pVar instanceof com.google.gson.q) {
                                    j14 = jL;
                                } else {
                                    try {
                                        iG = pVar.j().v(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE).g();
                                        j14 = jL;
                                    } catch (Exception e12) {
                                        e = e12;
                                        j14 = jL;
                                    }
                                    try {
                                        String strO6 = pVar.j().v(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION).o();
                                        Intrinsics.f(strO6, "getAsString(...)");
                                        iG2 = i12;
                                        mpVar2 = new mp(strO6, iG);
                                    } catch (Exception e13) {
                                        e = e13;
                                        ArrayList arrayList4 = k9.e(e, e).f1803s;
                                        String message3 = e.getMessage();
                                        if (message3 == null) {
                                            message3 = e.getClass().getName();
                                        }
                                        arrayList4.add(message3);
                                        iG2 = i12;
                                        mpVar2 = null;
                                        jL = j14;
                                    }
                                    jL = j14;
                                }
                                iG2 = i12;
                                mpVar2 = null;
                                jL = j14;
                            }
                            j14 = jL;
                            break;
                        case 868720662:
                            if (!str11.equals("response_info_extras")) {
                                j14 = jL;
                                break;
                            } else {
                                rVar4 = pVar.j();
                                iG2 = i12;
                            }
                        case 961728366:
                            if (!str11.equals("adRequestPostBody")) {
                                j14 = jL;
                                break;
                            } else {
                                String strO7 = pVar.o();
                                Intrinsics.f(strO7, "getAsString(...)");
                                iG2 = i12;
                                str8 = strO7;
                            }
                        case 1128093708:
                            if (!str11.equals("analytics_query_ad_event_id")) {
                                j14 = jL;
                                break;
                            } else {
                                String strO8 = pVar.o();
                                Intrinsics.f(strO8, "getAsString(...)");
                                iG2 = i12;
                                str6 = strO8;
                            }
                        case 1282999366:
                            if (!str11.equals("refresh_load_delay_time_interval")) {
                                j14 = jL;
                                break;
                            } else {
                                Duration.Companion companion = Duration.f72038b;
                                jL = DurationKt.g(pVar.g(), DurationUnit.f72046e);
                                iG2 = i12;
                            }
                        case 1474602697:
                            if (!str11.equals("is_cross_process_ad_enabled")) {
                                j14 = jL;
                                break;
                            } else {
                                zD2 = pVar.d();
                                iG2 = i12;
                            }
                        case 1676268331:
                            if (!str11.equals("response_code")) {
                                j14 = jL;
                                break;
                            } else {
                                iG3 = pVar.g();
                                iG2 = i12;
                            }
                        case 1722800622:
                            if (str11.equals("bidding_data")) {
                                com.google.gson.r rVarA4 = d62.a(pVar);
                                if (rVarA4 == null) {
                                    try {
                                        rVarA4 = (com.google.gson.r) new Gson().fromJson(pVar.o(), com.google.gson.r.class);
                                    } catch (Exception e14) {
                                        ArrayList arrayList5 = k9.e(e14, e14).f1803s;
                                        String message4 = e14.getMessage();
                                        if (message4 == null) {
                                            message4 = e14.getClass().getName();
                                        }
                                        arrayList5.add(message4);
                                        rVarA4 = null;
                                    }
                                    if (rVarA4 == null) {
                                        rVarA4 = (com.google.gson.r) objectRef.f71863a;
                                    }
                                }
                                objectRef.f71863a = rVarA4;
                            }
                            j14 = jL;
                            break;
                        case 1816824233:
                            if (!str11.equals("refresh_interval")) {
                                j14 = jL;
                                break;
                            } else {
                                Duration.Companion companion2 = Duration.f72038b;
                                jG = DurationKt.g(pVar.g(), DurationUnit.f72046e);
                                iG2 = i12;
                            }
                        default:
                            j14 = jL;
                            break;
                    }
                } else {
                    i12 = iG2;
                    j14 = jL;
                }
                iG2 = i12;
                jL = j14;
            }
            long j15 = jL;
            i5 = iG2;
            str = strO;
            j12 = jL2;
            str3 = str7;
            str2 = str8;
            strO = str9;
            str4 = str10;
            i11 = iG3;
            z11 = zD3;
            j13 = jG;
            rVar2 = rVar4;
            str5 = str6;
            mpVar = mpVar2;
            rVar3 = rVarA;
            j11 = j15;
        } else {
            i5 = 1;
            j11 = jL;
            j12 = 0;
            j13 = 0;
            rVar2 = rVar4;
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            str2 = str;
            str3 = str2;
            str4 = str3;
            str5 = str4;
            mpVar = null;
            rVar3 = null;
            i11 = 0;
            z11 = false;
            zD = false;
            zD2 = false;
        }
        return new hv(strO, str2, str3, str4, (com.google.gson.r) objectRef3.f71863a, (com.google.gson.r) objectRef.f71863a, mpVar, str, (com.google.gson.r) objectRef2.f71863a, zD, j12, i5, arrayList, j13, j11, i11, rVar2, str5, z11, rVar3, zD2);
    }

    public static it1 o(f3 nativeAdMapper, ni.b adChoicePlacement) {
        wf1 wf1Var;
        wf1 wf1Var2;
        Intrinsics.g(nativeAdMapper, "nativeAdMapper");
        Intrinsics.g(adChoicePlacement, "adChoicePlacement");
        it1 it1Var = new it1();
        it1Var.f4933b = gt1.f4062a;
        it1Var.f4932a = 6;
        ArrayList arrayListF = nativeAdMapper.f();
        u5 u5Var = arrayListF != null ? (u5) b70.g.Y0(arrayListF) : null;
        if (u5Var != null) {
            Drawable drawableE = u5Var.e();
            Uri uriD = u5Var.d();
            if (uriD == null) {
                uriD = Uri.EMPTY;
            }
            Intrinsics.d(uriD);
            wf1Var = new wf1(drawableE, uriD, u5Var.a(), u5Var.c(), u5Var.b());
        } else {
            wf1Var = null;
        }
        it1Var.f4937f = wf1Var;
        u5 icon = nativeAdMapper.getIcon();
        if (icon != null) {
            Drawable drawableE2 = icon.e();
            Uri uriD2 = icon.d();
            if (uriD2 == null) {
                uriD2 = Uri.EMPTY;
            }
            Intrinsics.d(uriD2);
            wf1Var2 = new wf1(drawableE2, uriD2, icon.a(), icon.c(), icon.b());
        } else {
            wf1Var2 = null;
        }
        it1Var.f4938g = wf1Var2;
        for (Map.Entry entry : MapsKt.j0(new kotlin.Pair("headline", nativeAdMapper.getHeadline()), new kotlin.Pair("body", nativeAdMapper.getBody()), new kotlin.Pair("advertiser", nativeAdMapper.getAdvertiser()), new kotlin.Pair("call_to_action", nativeAdMapper.getCallToAction()), new kotlin.Pair("store", nativeAdMapper.getStore()), new kotlin.Pair("price", nativeAdMapper.getPrice())).entrySet()) {
            String str = (String) entry.getKey();
            String str2 = (String) entry.getValue();
            if (str2 != null) {
                it1Var.f4935d.put(str, str2);
            }
        }
        it1Var.f4942k = nativeAdMapper.a();
        it1Var.f4944m = nativeAdMapper.getHasVideoContent() ? new d62() : null;
        it1Var.f4947r = nativeAdMapper.getExtras();
        it1Var.f4948s = nativeAdMapper.e();
        it1Var.f4949t = nativeAdMapper.c();
        it1Var.f4950u = adChoicePlacement;
        return it1Var;
    }

    public static k61 p(com.google.gson.r rVar, t70.p0 p0Var) {
        com.google.gson.m mVarE;
        com.google.gson.r rVarA;
        com.google.gson.m mVarE2;
        com.google.gson.r rVarA2;
        com.google.gson.r rVarA3;
        com.google.gson.p pVarV = rVar.v("ad_html");
        String strA = null;
        String strO = pVarV != null ? pVarV.o() : null;
        com.google.gson.p pVarV2 = rVar.v("ad_base_url");
        String strO2 = pVarV2 != null ? pVarV2.o() : null;
        com.google.gson.p pVarV3 = rVar.v("ad_json");
        com.google.gson.r rVarJ = pVarV3 != null ? pVarV3.j() : null;
        com.google.gson.p pVarV4 = rVar.v("ad_json");
        com.google.gson.m mVarE3 = d62.e(pVarV4 != null ? pVarV4.j() : null, "ads");
        if (mVarE3 != null && (rVarA3 = d62.a(mVarE3, 0)) != null) {
            strA = d62.a(rVarA3, "ad_mid", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
        com.google.gson.p pVarV5 = rVar.v("ad_json");
        return new k61(strO, p0Var, strO2, rVarJ, strA, (pVarV5 == null || (mVarE = d62.e(pVarV5.j(), "slots")) == null || (rVarA = d62.a(mVarE, 0)) == null || (mVarE2 = d62.e(rVarA, "ads")) == null || (rVarA2 = d62.a(mVarE2, 0)) == null || !(r70.k.U0(d62.a(rVarA2, "ad_mid", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) ^ true)) ? false : true);
    }

    public static ug2 q(com.google.gson.r rVar) {
        Map linkedHashMap;
        try {
            Object objFromJson = new Gson().fromJson(d62.a(rVar, "extra_query_params", "{}"), (Class<Object>) com.google.gson.r.class);
            Intrinsics.f(objFromJson, "fromJson(...)");
            linkedHashMap = new LinkedHashMap();
            Iterator it = ((hn.m) ((com.google.gson.r) objFromJson).f34795a.entrySet()).iterator();
            while (((hn.l) it).hasNext()) {
                hn.n nVarB = ((hn.l) it).b();
                String str = (String) nVarB.getKey();
                com.google.gson.p pVar = (com.google.gson.p) nVarB.getValue();
                Intrinsics.d(str);
                String strO = pVar.o();
                Intrinsics.f(strO, "getAsString(...)");
                linkedHashMap.put(str, strO);
            }
        } catch (Exception e3) {
            ArrayList arrayList = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            linkedHashMap = null;
        }
        if (linkedHashMap == null) {
            linkedHashMap = b70.h.f17594a;
        }
        return new ug2(d62.a(rVar, "enable_prewarming", false), d62.a(rVar, "prefetch_url", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), d62.a(rVar, "skip_offline_notification_flow", false), d62.a(rVar, "enable_hsdp_service", false), d62.a(rVar, "target_package", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), d62.a(rVar, "hsdp_invocation_callback_bitmask", 0), d62.a(rVar, "referrer", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), linkedHashMap);
    }

    public static v03 r(com.google.gson.r rVar) {
        v03 v03Var = null;
        try {
            String strA = d62.a(rVar, "click_string", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            String strA2 = d62.a(rVar, "report_url", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            int i5 = 0;
            boolean zA = d62.a(rVar, "non_malicious_reporting_enabled", false);
            boolean zA2 = d62.a(rVar, "protection_enabled", false);
            com.google.gson.m mVarE = d62.e(rVar, "allowed_headers");
            ArrayList arrayList = new ArrayList();
            if (mVarE != null) {
                Iterator it = mVarE.f34793a.iterator();
                while (it.hasNext()) {
                    Object next = it.next();
                    int i11 = i5 + 1;
                    if (i5 < 0) {
                        ul.b.e0();
                        throw null;
                    }
                    com.google.gson.p pVar = (com.google.gson.p) next;
                    Intrinsics.d(pVar);
                    String strO = pVar.o();
                    if (strO != null) {
                        arrayList.add(strO);
                    }
                    i5 = i11;
                }
            }
            v03Var = new v03(strA, strA2, zA, zA2, arrayList);
        } catch (Exception e3) {
            ArrayList arrayList2 = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList2.add(message);
        }
        return v03Var == null ? new v03() : v03Var;
    }

    public static vv1 s(kz2 rootTraceCreator, mi3 traceMetaSet, zv1 nativeAdUtil, FrameLayout frameLayout, Map assetViews, ImageView.ScaleType mediaviewScaleType) {
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(nativeAdUtil, "nativeAdUtil");
        Intrinsics.g(assetViews, "assetViews");
        Intrinsics.g(mediaviewScaleType, "mediaviewScaleType");
        wv0 wv0Var = wv0.CUI_NAME_NATIVE_AD_SIGNAL;
        EmptyList emptyList = EmptyList.f71733a;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(rootTraceCreator, wv0Var, emptyList, traceMetaSet);
            try {
                vv1 vv1Var = new vv1(nativeAdUtil.a(frameLayout, mediaviewScaleType, assetViews), nativeAdUtil.c(frameLayout), nativeAdUtil.b(frameLayout), nativeAdUtil.a(frameLayout), nativeAdUtil.a());
                em2VarA.close();
                return vv1Var;
            } catch (Throwable th2) {
                try {
                    em2VarA.b(th2);
                    if (th2 instanceof a4) {
                        throw th2;
                    }
                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                        em2VarA.a(th2);
                    }
                    if (th2 instanceof TimeoutCancellationException) {
                        throw new lw0(th2);
                    }
                    if (th2 instanceof CancellationException) {
                        throw new du0(th2);
                    }
                    if (th2 instanceof dv0) {
                        throw th2;
                    }
                    throw new iu0(th2);
                } finally {
                }
            }
        } else {
            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
            try {
                vv1 vv1Var2 = new vv1(nativeAdUtil.a(frameLayout, mediaviewScaleType, assetViews), nativeAdUtil.c(frameLayout), nativeAdUtil.b(frameLayout), nativeAdUtil.a(frameLayout), nativeAdUtil.a());
                th3VarA.close();
                return vv1Var2;
            } catch (Throwable th3) {
                try {
                    th3VarA.b(th3);
                    if (th3 instanceof a4) {
                        throw th3;
                    }
                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                        th3VarA.a(th3);
                    }
                    if (th3 instanceof TimeoutCancellationException) {
                        throw new lw0(th3);
                    }
                    if (th3 instanceof CancellationException) {
                        throw new du0(th3);
                    }
                    if (th3 instanceof dv0) {
                        throw th3;
                    }
                    throw new iu0(th3);
                } finally {
                }
            }
        }
    }

    public static x23 t(com.google.gson.r rVar) {
        try {
            String strO = rVar.v(PendingUpgradeStore.KEY_NAME).o();
            Intrinsics.f(strO, "getAsString(...)");
            com.google.gson.p pVarV = rVar.v("info");
            return new x23(pVarV != null ? pVarV.j() : null, strO);
        } catch (Exception e3) {
            ArrayList arrayList = k9.e(e3, e3).f1803s;
            String message = e3.getMessage();
            if (message == null) {
                message = e3.getClass().getName();
            }
            arrayList.add(message);
            return null;
        }
    }

    public static Boolean u(com.google.gson.p pVar, boolean z11) {
        boolean z12;
        boolean z13 = pVar instanceof com.google.gson.s;
        if (z13 && (pVar.k().f34796a instanceof Boolean)) {
            return Boolean.valueOf(pVar.d() == z11);
        }
        if (z13 && (pVar.k().f34796a instanceof Number)) {
            return Boolean.valueOf(z11 == ((pVar.k().n().longValue() > 0L ? 1 : (pVar.k().n().longValue() == 0L ? 0 : -1)) > 0));
        }
        String strO = (z13 && (pVar.k().f34796a instanceof String)) ? pVar.o() : pVar.toString();
        Intrinsics.d(strO);
        String lowerCase = strO.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        if (ul.b.Q("1", "t", InneractiveMediationDefs.SHOW_HOUSE_AD_YES).contains(lowerCase)) {
            z12 = true;
        } else {
            if (!ul.b.Q("0", InneractiveMediationDefs.GENDER_FEMALE, "false").contains(lowerCase)) {
                return null;
            }
            z12 = false;
        }
        return Boolean.valueOf(z11 == z12);
    }

    public static Object v(String str, Function1 function1) {
        if (r70.k.U0(str)) {
            return null;
        }
        return function1.invoke(str);
    }

    public static String w(double d5, a41 a41Var) {
        Object objValueOf;
        String str;
        double dY = d5 * (a41Var.H() ? a41Var.y() : 1.0d);
        if (a41Var.I()) {
            iA = a41Var.A() >= 0 ? a41Var.A() : 5;
            objValueOf = Double.valueOf(((long) (dY * r2)) / Math.pow(10.0d, a41Var.A()));
        } else {
            objValueOf = a41Var.D() ? Long.valueOf(((long) (dY / a41Var.p())) * a41Var.p()) : dY == Math.floor(dY) ? Long.valueOf(MathKt.c(dY)) : Double.valueOf(dY);
        }
        if ((objValueOf instanceof Double) || (objValueOf instanceof Float)) {
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            str = String.format(Locale.US, c0.i(iA, "%.", InneractiveMediationDefs.GENDER_FEMALE), Arrays.copyOf(new Object[]{objValueOf}, 1));
        } else {
            StringCompanionObject stringCompanionObject2 = StringCompanionObject.f71868a;
            str = String.format(Locale.US, "%d", Arrays.copyOf(new Object[]{objValueOf}, 1));
        }
        return r70.k.K0(str, ".", false) ? u4.i("\\.$", u4.i("0*$", str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b) : str;
    }

    public static String x(int i5) {
        if (i5 == 1) {
            return "SHA-256";
        }
        if (i5 == 2) {
            return "SHA-512";
        }
        throw new IllegalArgumentException(ed.i("Unknown content digest algorthm: ", i5));
    }

    public static String y(pu0 error) {
        Intrinsics.g(error, "error");
        if (error.a() != wd1.f11213a && !(error instanceof av0)) {
            if (error instanceof zu0) {
                zu0 zu0Var = (zu0) error;
                return "WebView HTTP error " + zu0Var.d() + ": " + zu0Var.c() + " on url: " + zu0Var.e();
            }
            if (error instanceof bv0) {
                return sl0.f9599e.a();
            }
            if (error instanceof tu0) {
                return ((tu0) error).c();
            }
            if (error instanceof qu0) {
                qu0 qu0Var = (qu0) error;
                String str = qu0Var.f8813e;
                return str == null ? qu0Var.f8811c.toString() : str;
            }
            if (error instanceof su0) {
                return ((su0) error).c().toString();
            }
            if (error instanceof ru0) {
                return error.toString();
            }
            if (error instanceof wu0) {
                return ((wu0) error).c();
            }
            if (error instanceof uu0) {
                return ((uu0) error).c();
            }
            if (error instanceof yu0) {
                return ((yu0) error).c();
            }
            if (error instanceof vu0) {
                return ((vu0) error).c();
            }
            throw new NoWhenBranchMatchedException();
        }
        return sl0.f9598b.a();
    }

    public static String z(View view) {
        if (!view.isAttachedToWindow()) {
            return "notAttached";
        }
        int visibility = view.getVisibility();
        if (visibility == 8) {
            return "viewGone";
        }
        if (visibility == 4) {
            return "viewInvisible";
        }
        if (visibility != 0) {
            return "viewNotVisible";
        }
        if (view.getAlpha() == 0.0f) {
            return "viewAlphaZero";
        }
        return null;
    }

    public abstract void a(byte[] bArr, int i5, int i11);

    public static int a(String str, int i5) {
        return c0.e(i5, 31, str);
    }

    public static int a(int i5, int i11) {
        int iB = b(i5);
        int iB2 = b(i11);
        if (iB == 1) {
            if (iB2 == 1) {
                return 0;
            }
            if (iB2 == 2) {
                return -1;
            }
            throw new IllegalArgumentException(ed.i("Unknown digestAlgorithm2: ", iB2));
        }
        if (iB != 2) {
            throw new IllegalArgumentException(ed.i("Unknown digestAlgorithm1: ", iB));
        }
        if (iB2 == 1) {
            return 1;
        }
        if (iB2 == 2) {
            return 0;
        }
        throw new IllegalArgumentException(ed.i("Unknown digestAlgorithm2: ", iB2));
    }

    public static int b(int i5) {
        if (i5 == 513) {
            return 1;
        }
        if (i5 == 514) {
            return 2;
        }
        if (i5 == 769) {
            return 1;
        }
        switch (i5) {
            case 257:
            case 259:
                return 1;
            case 258:
            case 260:
                return 2;
            default:
                throw new IllegalArgumentException("Unknown signature algorithm: 0x" + Long.toHexString(i5));
        }
    }

    public static void a(int i5, byte[] bArr) {
        bArr[1] = (byte) (i5 & 255);
        bArr[2] = (byte) ((i5 >>> 8) & 255);
        bArr[3] = (byte) ((i5 >>> 16) & 255);
        bArr[4] = (byte) ((i5 >>> 24) & 255);
    }
}
