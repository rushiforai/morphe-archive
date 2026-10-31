package com.moloco.sdk.internal.services.encryption;

import a2.k;
import android.util.Base64;
import com.moloco.sdk.BuildConfig;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;

/* loaded from: classes.dex */
public final class b implements a {

    /* renamed from: h, reason: collision with root package name */
    public static final int f37950h = 8;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f37951b = LazyKt.a(new k(10));

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f37952c = LazyKt.a(new k(11));

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy f37953d = LazyKt.a(new k(12));

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Lazy f37954e = LazyKt.a(new k(13));

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final SecretKeySpec f37955f = h();

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Lazy f37956g = LazyKt.a(new k(14));

    public static final String c() {
        byte[] bArrDecode = Base64.decode(new byte[]{81, 85, 86, 84, 76, 48, 100, 68, 84, 83, 57, 79, 98, 49, 66, 104, 90, 71, 82, 112, 98, 109, 99, 61}, 0);
        Intrinsics.f(bArrDecode, "decode(...)");
        return j.x0(bArrDecode);
    }

    public static final String d() {
        return j.x0(new byte[]{65, 69, 83});
    }

    public static final String e() {
        return j.x0(new byte[]{82, 83, 65, 47, 69, 67, 66, 47, 79, 65, 69, 80, 87, 105, 116, 104, 83, 72, 65, 45, 50, 53, 54, 65, 110, 100, 77, 71, 70, 49, 80, 97, 100, 100, 105, 110, 103});
    }

    public static final String f() {
        byte[] bArrDecode = Base64.decode(new byte[]{85, 108, 78, 66}, 0);
        Intrinsics.f(bArrDecode, "decode(...)");
        return j.x0(bArrDecode);
    }

    public static final IvParameterSpec g() {
        return new IvParameterSpec(Base64.decode(BuildConfig.MOLOCO_SDK_BIDTOKEN_SALT, 0));
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public IvParameterSpec a() {
        return (IvParameterSpec) this.f37956g.getValue();
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public SecretKeySpec b() {
        return this.f37955f;
    }

    public final SecretKeySpec h() throws NoSuchAlgorithmException {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(i());
        keyGenerator.init(256);
        return new SecretKeySpec(keyGenerator.generateKey().getEncoded(), i());
    }

    public final String i() {
        return (String) this.f37953d.getValue();
    }

    public final String j() {
        return (String) this.f37954e.getValue();
    }

    public final String k() {
        return (String) this.f37951b.getValue();
    }

    public final String l() {
        return (String) this.f37952c.getValue();
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public byte[] a(@NotNull byte[] data) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Intrinsics.g(data, "data");
        Cipher cipher = Cipher.getInstance(j());
        cipher.init(1, b(), a());
        byte[] bArrDoFinal = cipher.doFinal(data);
        Intrinsics.f(bArrDoFinal, "doFinal(...)");
        return bArrDoFinal;
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public String b(@NotNull byte[] data) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Intrinsics.g(data, "data");
        Cipher cipher = Cipher.getInstance(j());
        cipher.init(2, b(), a());
        byte[] bArrDoFinal = cipher.doFinal(data);
        Intrinsics.f(bArrDoFinal, "doFinal(...)");
        return j.x0(bArrDoFinal);
    }

    public final PublicKey c(String str) throws InvalidKeySpecException {
        PublicKey publicKeyGeneratePublic = KeyFactory.getInstance(k()).generatePublic(new X509EncodedKeySpec(Base64.decode(str, 0)));
        Intrinsics.f(publicKeyGeneratePublic, "generatePublic(...)");
        return publicKeyGeneratePublic;
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public String a(@NotNull byte[] data, @NotNull byte[] secret) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException, InvalidAlgorithmParameterException {
        Intrinsics.g(data, "data");
        Intrinsics.g(secret, "secret");
        Cipher cipher = Cipher.getInstance(j());
        cipher.init(2, new SecretKeySpec(secret, i()), a());
        byte[] bArrDoFinal = cipher.doFinal(data);
        Intrinsics.f(bArrDoFinal, "doFinal(...)");
        return j.x0(bArrDoFinal);
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public byte[] b(@NotNull byte[] input, @NotNull String publicKey) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException {
        Intrinsics.g(input, "input");
        Intrinsics.g(publicKey, "publicKey");
        Cipher cipher = Cipher.getInstance(l());
        cipher.init(1, c(publicKey));
        byte[] bArrDoFinal = cipher.doFinal(b().getEncoded());
        Intrinsics.f(bArrDoFinal, "doFinal(...)");
        return bArrDoFinal;
    }

    public final PrivateKey b(String str) throws InvalidKeySpecException {
        PrivateKey privateKeyGeneratePrivate = KeyFactory.getInstance(k()).generatePrivate(new PKCS8EncodedKeySpec(Base64.decode(str, 0)));
        Intrinsics.f(privateKeyGeneratePrivate, "generatePrivate(...)");
        return privateKeyGeneratePrivate;
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public byte[] a(@NotNull String rsaPublicKey) {
        Intrinsics.g(rsaPublicKey, "rsaPublicKey");
        byte[] encoded = b().getEncoded();
        Intrinsics.f(encoded, "getEncoded(...)");
        return b(encoded, rsaPublicKey);
    }

    @Override // com.moloco.sdk.internal.services.encryption.a
    @NotNull
    public byte[] a(@NotNull byte[] input, @NotNull String privateKey) throws BadPaddingException, NoSuchPaddingException, IllegalBlockSizeException, NoSuchAlgorithmException, InvalidKeyException {
        Intrinsics.g(input, "input");
        Intrinsics.g(privateKey, "privateKey");
        Cipher cipher = Cipher.getInstance(l());
        cipher.init(2, b(privateKey));
        byte[] bArrDoFinal = cipher.doFinal(input);
        Intrinsics.f(bArrDoFinal, "doFinal(...)");
        return bArrDoFinal;
    }
}
