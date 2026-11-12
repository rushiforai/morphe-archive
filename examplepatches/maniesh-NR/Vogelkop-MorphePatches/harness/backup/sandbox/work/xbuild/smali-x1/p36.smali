.class public abstract Lp36;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lii;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lp36;->a:Lii;

    return-void
.end method

.method public static a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;
    .registers 6

    const-string v0, "AES/GCM/NoPadding"

    if-eqz p3, :cond_17

    :try_start_4
    sget-object p3, Lp36;->a:Lii;

    invoke-virtual {p3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/security/Provider;

    invoke-static {v0, p3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object p3
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_10} :catch_11

    goto :goto_1b

    :catch_11
    const/4 p3, 0x0

    :try_start_12
    invoke-static {p0, p1, p2, p3}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object p0

    return-object p0

    :cond_17
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p3

    :goto_1b
    new-instance v0, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v1, 0x80

    invoke-direct {v0, v1, p2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    invoke-virtual {p3, p0, p1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_25
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_12 .. :try_end_25} :catch_26
    .catch Ljava/security/InvalidKeyException; {:try_start_12 .. :try_end_25} :catch_26
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_12 .. :try_end_25} :catch_26
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_12 .. :try_end_25} :catch_26

    return-object p3

    :catch_26
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(I[BLjava/security/Key;)[B
    .registers 8

    new-instance v0, Ljavax/crypto/spec/OAEPParameterSpec;

    sget-object v1, Ljava/security/spec/MGF1ParameterSpec;->SHA1:Ljava/security/spec/MGF1ParameterSpec;

    sget-object v2, Ljavax/crypto/spec/PSource$PSpecified;->DEFAULT:Ljavax/crypto/spec/PSource$PSpecified;

    const-string v3, "SHA-1"

    const-string v4, "MGF1"

    invoke-direct {v0, v3, v4, v1, v2}, Ljavax/crypto/spec/OAEPParameterSpec;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/security/spec/AlgorithmParameterSpec;Ljavax/crypto/spec/PSource;)V

    :try_start_d
    const-string v1, "RSA/ECB/OAEPWithSHA-1AndMGF1Padding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    invoke-virtual {v1, p0, p2, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {v1, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0
    :try_end_1a
    .catch Ljavax/crypto/BadPaddingException; {:try_start_d .. :try_end_1a} :catch_1b
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_d .. :try_end_1a} :catch_1b
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_d .. :try_end_1a} :catch_1b
    .catch Ljava/security/InvalidKeyException; {:try_start_d .. :try_end_1a} :catch_1b
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_d .. :try_end_1a} :catch_1b
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_d .. :try_end_1a} :catch_1b

    return-object p0

    :catch_1b
    const/4 p0, 0x0

    return-object p0
.end method

.method public static c([B)Ljava/security/PublicKey;
    .registers 3

    :try_start_0
    const-string v0, "RSA"

    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    new-instance v1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v1, p0}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    invoke-virtual {v0, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object p0
    :try_end_f
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_f} :catch_10
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_f} :catch_10

    return-object p0

    :catch_10
    const/4 p0, 0x0

    return-object p0
.end method

.method public static d(Ljava/security/PrivateKey;Ljava/lang/String;[B)[B
    .registers 4

    :try_start_0
    invoke-static {p1}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/Signature;->initSign(Ljava/security/PrivateKey;)V

    invoke-virtual {v0, p2}, Ljava/security/Signature;->update([B)V

    invoke-virtual {v0}, Ljava/security/Signature;->sign()[B

    move-result-object p0
    :try_end_e
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_e} :catch_f

    return-object p0

    :catch_f
    const-string v0, "SHA512withRSA/PSS"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_29

    :try_start_17
    new-instance p1, Lmvf;

    invoke-direct {p1}, Lmvf;-><init>()V

    invoke-virtual {p1, p0}, Lmvf;->engineInitSign(Ljava/security/PrivateKey;)V

    array-length p0, p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, p0}, Lmvf;->engineUpdate([BII)V

    invoke-virtual {p1}, Lmvf;->engineSign()[B

    move-result-object p0
    :try_end_28
    .catch Ljava/security/InvalidKeyException; {:try_start_17 .. :try_end_28} :catch_29
    .catch Ljava/security/SignatureException; {:try_start_17 .. :try_end_28} :catch_29

    return-object p0

    :catch_29
    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public static e(Ljava/security/PublicKey;)Ljava/lang/String;
    .registers 7

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "-----BEGIN PUBLIC KEY-----\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/security/Key;->getEncoded()[B

    move-result-object p0

    const/4 v1, 0x2

    invoke-static {p0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x3f

    div-int/lit8 v1, v1, 0x40

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_1c
    add-int/lit8 v5, v1, -0x1

    if-ge v3, v5, :cond_2c

    add-int/lit8 v5, v4, 0x40

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    move v4, v5

    goto :goto_1c

    :cond_2c
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v2, v5

    const-string p0, "\n"

    invoke-static {p0, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "\n-----END PUBLIC KEY-----"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static f([B[BLjava/security/PublicKey;Ljava/lang/String;)Z
    .registers 5

    :try_start_0
    invoke-static {p3}, Ljava/security/Signature;->getInstance(Ljava/lang/String;)Ljava/security/Signature;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/security/Signature;->initVerify(Ljava/security/PublicKey;)V

    invoke-virtual {v0, p0}, Ljava/security/Signature;->update([B)V

    invoke-virtual {v0, p1}, Ljava/security/Signature;->verify([B)Z

    move-result p0
    :try_end_e
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_e} :catch_f
    .catch Ljava/security/SignatureException; {:try_start_0 .. :try_end_e} :catch_f

    return p0

    :catch_f
    const-string v0, "SHA512withRSA/PSS"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_29

    :try_start_18
    new-instance p3, Lmvf;

    invoke-direct {p3}, Lmvf;-><init>()V

    invoke-virtual {p3, p2}, Lmvf;->engineInitVerify(Ljava/security/PublicKey;)V

    array-length p2, p0

    invoke-virtual {p3, p0, v0, p2}, Lmvf;->engineUpdate([BII)V

    invoke-virtual {p3, p1}, Lmvf;->engineVerify([B)Z

    move-result p0
    :try_end_28
    .catch Ljava/security/InvalidKeyException; {:try_start_18 .. :try_end_28} :catch_29
    .catch Ljava/security/SignatureException; {:try_start_18 .. :try_end_28} :catch_29

    return p0

    :catch_29
    :cond_29
    return v0
.end method
