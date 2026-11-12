.class public abstract Lo36;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I

.field public static final b:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0xc0

    const/16 v1, 0x80

    const/16 v2, 0x100

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lo36;->a:[I

    new-instance v0, Lii;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    sput-object v0, Lo36;->b:Lii;

    return-void
.end method

.method public static a(Ljava/io/FileInputStream;Ljavax/crypto/spec/SecretKeySpec;)Ljavax/crypto/CipherInputStream;
    .registers 4

    const/16 v0, 0xc

    :try_start_2
    new-array v0, v0, [B

    invoke-static {p0, v0}, Lna2;->L(Ljava/io/InputStream;[B)V

    const/4 v1, 0x2

    invoke-static {v1, p1, v0}, Lo36;->c(ILjavax/crypto/spec/SecretKeySpec;[B)Ljavax/crypto/Cipher;

    move-result-object p1

    new-instance v0, Ljavax/crypto/CipherInputStream;

    invoke-direct {v0, p0, p1}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V
    :try_end_11
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_11} :catch_12
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_11} :catch_12
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_11} :catch_12
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_2 .. :try_end_11} :catch_12

    return-object v0

    :catch_12
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Ljava/io/FileOutputStream;Ljavax/crypto/spec/SecretKeySpec;)Ljavax/crypto/CipherOutputStream;
    .registers 4

    const/16 v0, 0xc

    :try_start_2
    new-array v0, v0, [B

    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    const/4 v1, 0x1

    invoke-static {v1, p1, v0}, Lo36;->c(ILjavax/crypto/spec/SecretKeySpec;[B)Ljavax/crypto/Cipher;

    move-result-object p1

    new-instance v0, Ljavax/crypto/CipherOutputStream;

    invoke-direct {v0, p0, p1}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V
    :try_end_19
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_19} :catch_1a
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_19} :catch_1a
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_19} :catch_1a
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_2 .. :try_end_19} :catch_1a

    return-object v0

    :catch_1a
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static c(ILjavax/crypto/spec/SecretKeySpec;[B)Ljavax/crypto/Cipher;
    .registers 6

    const-string v0, "AES/GCM/NoPadding"

    :try_start_2
    sget-object v1, Lo36;->b:Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/Provider;

    invoke-static {v0, v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;Ljava/security/Provider;)Ljavax/crypto/Cipher;

    move-result-object v0
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_e} :catch_f

    goto :goto_13

    :catch_f
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    :goto_13
    new-instance v1, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v2, 0x80

    invoke-direct {v1, v2, p2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    invoke-virtual {v0, p0, p1, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    return-object v0
.end method
