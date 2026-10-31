package xo;

import b.c0;
import bn.s0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.instabridge.ai.auth.AndroidKeystoreSecretCipher;
import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.KeyLengthException;
import com.nimbusds.jose.util.IntegerOverflowException;
import h6.c1;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.AlgorithmParameters;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.SecureRandom;
import java.security.spec.InvalidParameterSpecException;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.zip.Deflater;
import java.util.zip.DeflaterOutputStream;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import kl.w0;
import mk.v;
import p3.i;
import sd.r;
import sl.t;
import uo.k;

/* loaded from: classes4.dex */
public abstract class b {

    /* renamed from: a, reason: collision with root package name */
    public static final Set f96206a;

    /* renamed from: b, reason: collision with root package name */
    public static final Map f96207b;

    static {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        uo.f fVar = uo.f.f91426d;
        linkedHashSet.add(fVar);
        uo.f fVar2 = uo.f.f91427e;
        linkedHashSet.add(fVar2);
        uo.f fVar3 = uo.f.f91428f;
        linkedHashSet.add(fVar3);
        uo.f fVar4 = uo.f.f91431i;
        linkedHashSet.add(fVar4);
        uo.f fVar5 = uo.f.f91432j;
        linkedHashSet.add(fVar5);
        uo.f fVar6 = uo.f.f91433k;
        linkedHashSet.add(fVar6);
        uo.f fVar7 = uo.f.f91429g;
        linkedHashSet.add(fVar7);
        uo.f fVar8 = uo.f.f91430h;
        linkedHashSet.add(fVar8);
        uo.f fVar9 = uo.f.f91434l;
        linkedHashSet.add(fVar9);
        f96206a = Collections.unmodifiableSet(linkedHashSet);
        HashMap map = new HashMap();
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        HashSet hashSet4 = new HashSet();
        HashSet hashSet5 = new HashSet();
        hashSet.add(fVar4);
        hashSet2.add(fVar5);
        hashSet3.add(fVar6);
        hashSet3.add(fVar);
        hashSet3.add(fVar7);
        hashSet3.add(fVar9);
        hashSet4.add(fVar2);
        hashSet5.add(fVar3);
        hashSet5.add(fVar8);
        map.put(128, Collections.unmodifiableSet(hashSet));
        map.put(192, Collections.unmodifiableSet(hashSet2));
        map.put(256, Collections.unmodifiableSet(hashSet3));
        map.put(384, Collections.unmodifiableSet(hashSet4));
        map.put(Integer.valueOf(EventBridgeChannel.QUEUE_CAPACITY), Collections.unmodifiableSet(hashSet5));
        f96207b = Collections.unmodifiableMap(map);
    }

    public static void a(SecretKey secretKey, uo.f fVar) throws IntegerOverflowException, KeyLengthException {
        int i5;
        try {
            if (secretKey.getEncoded() == null) {
                i5 = 0;
            } else {
                long length = r4.length * 8;
                i5 = (int) length;
                if (i5 != length) {
                    throw new IntegerOverflowException();
                }
            }
            if (i5 == 0 || fVar.f91435c == i5) {
                return;
            }
            StringBuilder sb2 = new StringBuilder("The Content Encryption Key (CEK) length for ");
            sb2.append(fVar);
            sb2.append(" must be ");
            throw new KeyLengthException(c0.o(sb2, fVar.f91435c, " bits"));
        } catch (IntegerOverflowException e3) {
            throw new KeyLengthException("The Content Encryption Key (CEK) is too long: " + e3.getMessage());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:107:0x02b9  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0225  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static byte[] b(k kVar, byte[] bArr, lp.b bVar, lp.b bVar2, lp.b bVar3, SecretKey secretKey, ap.a aVar) throws GeneralSecurityException, JOSEException, IOException {
        SecretKeySpec secretKeySpec;
        SecretKeySpec secretKeySpec2;
        int i5;
        SecretKeySpec secretKeySpec3;
        long length;
        long j11;
        byte[] bArrDoFinal;
        if (bArr == null) {
            return b(kVar, kVar.a().f75082a.getBytes(StandardCharsets.US_ASCII), bVar, bVar2, bVar3, secretKey, aVar);
        }
        uo.f fVar = kVar.o;
        a(secretKey, fVar);
        if (fVar.equals(uo.f.f91426d) || fVar.equals(uo.f.f91427e) || fVar.equals(uo.f.f91428f)) {
            byte[] bArrA = bVar.a();
            byte[] bArrA2 = bVar2.a();
            byte[] bArrA3 = bVar3.a();
            Provider provider = (Provider) aVar.f267b;
            byte[] encoded = secretKey.getEncoded();
            int i11 = 32;
            if (encoded.length == 32) {
                i5 = 16;
                secretKeySpec = new SecretKeySpec(encoded, 0, 16, "HMACSHA256");
                secretKeySpec3 = new SecretKeySpec(encoded, 16, 16, "AES");
            } else if (encoded.length == 48) {
                i5 = 24;
                secretKeySpec = new SecretKeySpec(encoded, 0, 24, "HMACSHA384");
                secretKeySpec3 = new SecretKeySpec(encoded, 24, 24, "AES");
            } else {
                if (encoded.length != 64) {
                    throw new KeyLengthException("Unsupported AES/CBC/PKCS5Padding/HMAC-SHA2 key length, must be 256, 384 or 512 bits");
                }
                secretKeySpec = new SecretKeySpec(encoded, 0, 32, "HMACSHA512");
                secretKeySpec2 = new SecretKeySpec(encoded, 32, 32, "AES");
                length = bArr.length * 8;
                j11 = (int) length;
                if (j11 == length) {
                    throw new IntegerOverflowException();
                }
                byte[] bArrArray = ByteBuffer.allocate(8).putLong(j11).array();
                if (!i.m(Arrays.copyOf(e.a(secretKeySpec.getAlgorithm(), secretKeySpec, ByteBuffer.allocate(bArr.length + bArrA.length + bArrA2.length + bArrArray.length).put(bArr).put(bArrA).put(bArrA2).put(bArrArray).array(), provider), i11), bArrA3)) {
                    throw new JOSEException("MAC check failed");
                }
                try {
                    bArrDoFinal = e.b(secretKeySpec2, false, bArrA, provider).doFinal(bArrA2);
                } catch (Exception e3) {
                    throw new JOSEException(e3.getMessage(), e3);
                }
            }
            int i12 = i5;
            secretKeySpec2 = secretKeySpec3;
            i11 = i12;
            length = bArr.length * 8;
            j11 = (int) length;
            if (j11 == length) {
            }
        } else if (fVar.equals(uo.f.f91431i) || fVar.equals(uo.f.f91432j) || fVar.equals(uo.f.f91433k)) {
            byte[] bArrA4 = bVar.a();
            byte[] bArrA5 = bVar2.a();
            byte[] bArrA6 = bVar3.a();
            Provider provider2 = (Provider) aVar.f267b;
            SecretKey eVar = secretKey.getAlgorithm().equals("AES") ? secretKey : new lp.e(secretKey);
            try {
                Cipher cipher = provider2 != null ? Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION, provider2) : Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
                cipher.init(2, eVar, new GCMParameterSpec(128, bArrA4));
                cipher.updateAAD(bArr);
                try {
                    bArrDoFinal = cipher.doFinal(jk.b.u(bArrA5, bArrA6));
                } catch (BadPaddingException | IllegalBlockSizeException e11) {
                    throw new JOSEException("AES/GCM/NoPadding decryption failed: " + e11.getMessage(), e11);
                }
            } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException e12) {
                throw new JOSEException("Couldn't create AES/GCM/NoPadding cipher: " + e12.getMessage(), e12);
            }
        } else {
            if (fVar.equals(uo.f.f91429g) || fVar.equals(uo.f.f91430h)) {
                Map map = kVar.f91414e;
                e.f(secretKey, fVar, map.get("epu") instanceof String ? new lp.b((String) map.get("epu")).a() : null, map.get("epv") instanceof String ? new lp.b((String) map.get("epv")).a() : null);
                StringBuilder sb2 = new StringBuilder();
                sb2.append(kVar.a().f75082a);
                sb2.append(".");
                throw null;
            }
            if (!fVar.equals(uo.f.f91434l)) {
                throw new JOSEException(e.k(fVar, f96206a));
            }
            byte[] bArrA7 = bVar.a();
            byte[] bArrA8 = bVar2.a();
            byte[] bArrA9 = bVar3.a();
            try {
                t tVar = new t(secretKey.getEncoded());
                byte[] bArrU = jk.b.u(bArrA7, bArrA8, bArrA9);
                try {
                    byte[] bArr2 = tVar.f87540b;
                    if (bArr2.length == 0) {
                        bArrDoFinal = tVar.c(bArrU, bArr);
                    } else {
                        if (!w0.b(bArr2, bArrU)) {
                            throw new GeneralSecurityException("Decryption failed (OutputPrefix mismatch).");
                        }
                        bArrDoFinal = tVar.c(Arrays.copyOfRange(bArrU, bArr2.length, bArrU.length), bArr);
                    }
                } catch (GeneralSecurityException e13) {
                    throw new JOSEException("XChaCha20Poly1305 decryption failed: " + e13.getMessage(), e13);
                }
            } catch (GeneralSecurityException e14) {
                throw new JOSEException("Invalid XChaCha20Poly1305 key: " + e14.getMessage(), e14);
            }
        }
        uo.d dVar = kVar.f91460q;
        if (dVar == null) {
            return bArrDoFinal;
        }
        if (dVar.equals(uo.d.f91423b)) {
            try {
                return v.D(bArrDoFinal);
            } catch (Exception e15) {
                throw new JOSEException(c1.s(e15, new StringBuilder("Couldn't decompress plain text: ")), e15);
            }
        }
        throw new JOSEException("Unsupported compression algorithm: " + dVar);
    }

    public static s0 c(k kVar, byte[] bArr, byte[] bArr2, SecretKey secretKey, lp.b bVar, ap.a aVar) throws Throwable {
        Deflater deflater;
        byte[] byteArray;
        lp.b bVar2;
        SecretKeySpec secretKeySpec;
        SecretKeySpec secretKeySpec2;
        r rVar;
        byte[] bArrU;
        int i5;
        long j11;
        if (bArr2 == null) {
            return c(kVar, bArr, kVar.a().f75082a.getBytes(StandardCharsets.US_ASCII), secretKey, bVar, aVar);
        }
        SecretKey eVar = secretKey;
        uo.f fVar = kVar.o;
        a(eVar, fVar);
        uo.d dVar = kVar.f91460q;
        DeflaterOutputStream deflaterOutputStream = null;
        deflaterOutputStream = null;
        if (dVar == null) {
            byteArray = bArr;
        } else {
            if (!dVar.equals(uo.d.f91423b)) {
                throw new JOSEException("Unsupported compression algorithm: " + dVar);
            }
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    deflater = new Deflater(8, true);
                    try {
                        DeflaterOutputStream deflaterOutputStream2 = new DeflaterOutputStream(byteArrayOutputStream, deflater);
                        try {
                            deflaterOutputStream2.write(bArr);
                            deflaterOutputStream2.close();
                            deflater.end();
                            byteArray = byteArrayOutputStream.toByteArray();
                        } catch (Throwable th2) {
                            th = th2;
                            deflaterOutputStream = deflaterOutputStream2;
                            if (deflaterOutputStream != null) {
                                deflaterOutputStream.close();
                            }
                            if (deflater != null) {
                                deflater.end();
                            }
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    deflater = null;
                }
            } catch (Exception e3) {
                throw new JOSEException(c1.s(e3, new StringBuilder("Couldn't compress plain text: ")), e3);
            }
        }
        int i11 = 24;
        int i12 = 0;
        if (fVar.equals(uo.f.f91426d) || fVar.equals(uo.f.f91427e) || fVar.equals(uo.f.f91428f)) {
            bVar2 = bVar;
            byte[] bArr3 = new byte[16];
            new SecureRandom().nextBytes(bArr3);
            Provider provider = (Provider) aVar.f267b;
            byte[] encoded = eVar.getEncoded();
            if (encoded.length == 32) {
                secretKeySpec = new SecretKeySpec(encoded, 0, 16, "HMACSHA256");
                secretKeySpec2 = new SecretKeySpec(encoded, 16, 16, "AES");
                i11 = 16;
            } else if (encoded.length == 48) {
                secretKeySpec = new SecretKeySpec(encoded, 0, 24, "HMACSHA384");
                secretKeySpec2 = new SecretKeySpec(encoded, 24, 24, "AES");
            } else {
                if (encoded.length != 64) {
                    throw new KeyLengthException("Unsupported AES/CBC/PKCS5Padding/HMAC-SHA2 key length, must be 256, 384 or 512 bits");
                }
                secretKeySpec = new SecretKeySpec(encoded, 0, 32, "HMACSHA512");
                i11 = 32;
                secretKeySpec2 = new SecretKeySpec(encoded, 32, 32, "AES");
            }
            try {
                byte[] bArrDoFinal = e.b(secretKeySpec2, true, bArr3, provider).doFinal(byteArray);
                long length = bArr2.length * 8;
                long j12 = (int) length;
                if (j12 != length) {
                    throw new IntegerOverflowException();
                }
                byte[] bArrArray = ByteBuffer.allocate(8).putLong(j12).array();
                rVar = new r(bArrDoFinal, Arrays.copyOf(e.a(secretKeySpec.getAlgorithm(), secretKeySpec, ByteBuffer.allocate(bArr2.length + 16 + bArrDoFinal.length + bArrArray.length).put(bArr2).put(bArr3).put(bArrDoFinal).put(bArrArray).array(), provider), i11));
                bArrU = bArr3;
            } catch (Exception e11) {
                throw new JOSEException(e11.getMessage(), e11);
            }
        } else if (fVar.equals(uo.f.f91431i) || fVar.equals(uo.f.f91432j) || fVar.equals(uo.f.f91433k)) {
            bVar2 = bVar;
            byte[] bArr4 = new byte[12];
            new SecureRandom().nextBytes(bArr4);
            Provider provider2 = (Provider) aVar.f267b;
            if (!eVar.getAlgorithm().equals("AES")) {
                eVar = new lp.e(eVar);
            }
            try {
                Cipher cipher = provider2 != null ? Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION, provider2) : Cipher.getInstance(AndroidKeystoreSecretCipher.TRANSFORMATION);
                cipher.init(1, eVar, new GCMParameterSpec(128, bArr4));
                cipher.updateAAD(bArr2);
                try {
                    byte[] bArrDoFinal2 = cipher.doFinal(byteArray);
                    int length2 = bArrDoFinal2.length - 16;
                    byte[] bArrU2 = jk.b.U(0, length2, bArrDoFinal2);
                    byte[] bArrU3 = jk.b.U(length2, 16, bArrDoFinal2);
                    AlgorithmParameters parameters = cipher.getParameters();
                    if (parameters == null) {
                        throw new JOSEException("AES GCM ciphers are expected to make use of algorithm parameters");
                    }
                    try {
                        GCMParameterSpec gCMParameterSpec = (GCMParameterSpec) parameters.getParameterSpec(GCMParameterSpec.class);
                        byte[] iv2 = gCMParameterSpec.getIV();
                        int tLen = gCMParameterSpec.getTLen();
                        if (iv2 == null) {
                            j11 = 8;
                            i5 = 0;
                        } else {
                            long length3 = iv2.length * 8;
                            i5 = (int) length3;
                            j11 = 8;
                            if (i5 != length3) {
                                throw new IntegerOverflowException();
                            }
                        }
                        if (i5 != 96) {
                            if (iv2 != null) {
                                long length4 = iv2.length * j11;
                                i12 = (int) length4;
                                if (i12 != length4) {
                                    throw new IntegerOverflowException();
                                }
                            }
                            throw new JOSEException(String.format("IV length of %d bits is required, got %d", 96, Integer.valueOf(i12)));
                        }
                        if (tLen != 128) {
                            throw new JOSEException(String.format("Authentication tag length of %d bits is required, got %d", 128, Integer.valueOf(tLen)));
                        }
                        r rVar2 = new r(bArrU2, bArrU3);
                        bArrU = iv2;
                        rVar = rVar2;
                    } catch (InvalidParameterSpecException e12) {
                        throw new JOSEException(e12.getMessage(), e12);
                    }
                } catch (BadPaddingException | IllegalBlockSizeException e13) {
                    throw new JOSEException("Couldn't encrypt with AES/GCM/NoPadding: " + e13.getMessage(), e13);
                }
            } catch (InvalidAlgorithmParameterException | InvalidKeyException | NoSuchAlgorithmException | NoSuchPaddingException e14) {
                throw new JOSEException("Couldn't create AES/GCM/NoPadding cipher: " + e14.getMessage(), e14);
            }
        } else if (fVar.equals(uo.f.f91429g) || fVar.equals(uo.f.f91430h)) {
            byte[] bArr5 = new byte[16];
            new SecureRandom().nextBytes(bArr5);
            Provider provider3 = (Provider) aVar.f267b;
            Map map = kVar.f91414e;
            byte[] bArrA = map.get("epu") instanceof String ? new lp.b((String) map.get("epu")).a() : null;
            byte[] bArrA2 = map.get("epv") instanceof String ? new lp.b((String) map.get("epv")).a() : null;
            ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
            try {
                byteArrayOutputStream2.write(e.f96210a);
                byte[] encoded2 = eVar.getEncoded();
                byteArrayOutputStream2.write(encoded2);
                int length5 = encoded2.length * 8;
                byteArrayOutputStream2.write(p10.c0.e0(length5 / 2));
                byteArrayOutputStream2.write(fVar.f91409a.getBytes(lp.f.f75086a));
                byte[] bArr6 = e.f96211b;
                if (bArrA != null) {
                    byteArrayOutputStream2.write(p10.c0.e0(bArrA.length));
                    byteArrayOutputStream2.write(bArrA);
                } else {
                    byteArrayOutputStream2.write(bArr6);
                }
                if (bArrA2 != null) {
                    byteArrayOutputStream2.write(p10.c0.e0(bArrA2.length));
                    byteArrayOutputStream2.write(bArrA2);
                } else {
                    byteArrayOutputStream2.write(bArr6);
                }
                byteArrayOutputStream2.write(e.f96212c);
                try {
                    byte[] bArrDigest = MessageDigest.getInstance("SHA-" + length5).digest(byteArrayOutputStream2.toByteArray());
                    int length6 = bArrDigest.length / 2;
                    byte[] bArr7 = new byte[length6];
                    System.arraycopy(bArrDigest, 0, bArr7, 0, length6);
                    try {
                        byte[] bArrDoFinal3 = e.b(new SecretKeySpec(bArr7, "AES"), true, bArr5, provider3).doFinal(byteArray);
                        SecretKeySpec secretKeySpecF = e.f(eVar, fVar, bArrA, bArrA2);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(kVar.a());
                        sb2.append(".");
                        bVar2 = bVar;
                        sb2.append(bVar2);
                        sb2.append(".");
                        sb2.append(lp.b.c(bArr5));
                        sb2.append(".");
                        sb2.append(lp.b.c(bArrDoFinal3));
                        rVar = new r(bArrDoFinal3, e.a(secretKeySpecF.getAlgorithm(), secretKeySpecF, sb2.toString().getBytes(lp.f.f75086a), provider3));
                        bArrU = bArr5;
                    } catch (Exception e15) {
                        throw new JOSEException(e15.getMessage(), e15);
                    }
                } catch (NoSuchAlgorithmException e16) {
                    throw new JOSEException(e16.getMessage(), e16);
                }
            } catch (IOException e17) {
                throw new JOSEException(e17.getMessage(), e17);
            }
        } else {
            if (!fVar.equals(uo.f.f91434l)) {
                throw new JOSEException(e.k(fVar, f96206a));
            }
            try {
                try {
                    byte[] bArrB = new t(eVar.getEncoded()).b(byteArray, bArr2);
                    int length7 = bArrB.length;
                    bArrU = jk.b.U(0, 24, bArrB);
                    rVar = new r(jk.b.U(24, length7 - 40, bArrB), jk.b.U(length7 - 16, 16, bArrB));
                    bVar2 = bVar;
                } catch (GeneralSecurityException e18) {
                    throw new JOSEException("Couldn't encrypt with XChaCha20Poly1305: " + e18.getMessage(), e18);
                }
            } catch (GeneralSecurityException e19) {
                throw new JOSEException("Invalid XChaCha20Poly1305 key: " + e19.getMessage(), e19);
            }
        }
        return new s0(kVar, bVar2, lp.b.c(bArrU), lp.b.c(rVar.f87210a), lp.b.c(rVar.f87211b), 12);
    }
}
