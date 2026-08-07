.class public abstract Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static create()Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;
    .locals 1

    .line 36
    new-instance v0, Lcom/alibaba/sdk/android/oss/signer/HmacSHA1Signature;

    invoke-direct {v0}, Lcom/alibaba/sdk/android/oss/signer/HmacSHA1Signature;-><init>()V

    return-object v0
.end method

.method public static create(Ljava/lang/String;)Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;
    .locals 1

    .line 1
    const-string v0, "HmacSHA256"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;-><init>()V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string v0, "HmacSHA1"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance p0, Lcom/alibaba/sdk/android/oss/signer/HmacSHA1Signature;

    .line 24
    .line 25
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/signer/HmacSHA1Signature;-><init>()V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const-string v0, "Unsupported algorithm: "

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/mce;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method


# virtual methods
.method public abstract computeHash([B[B)[B
.end method

.method public abstract computeSignature(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getAlgorithm()Ljava/lang/String;
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method

.method public sign([B[BLjavax/crypto/Mac;Ljava/lang/Object;Ljava/lang/String;)[B
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p3, :cond_1

    .line 3
    .line 4
    :try_start_0
    monitor-enter p4
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    if-nez p3, :cond_0

    .line 6
    .line 7
    :try_start_1
    invoke-static {p5}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception p2

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p4

    .line 15
    goto :goto_2

    .line 16
    :goto_1
    monitor-exit p4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    :try_start_2
    throw p2
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_2} :catch_0

    .line 18
    :catch_0
    move-exception p2

    .line 19
    goto :goto_4

    .line 20
    :catch_1
    move-exception p1

    .line 21
    goto :goto_5

    .line 22
    :cond_1
    :goto_2
    :try_start_3
    invoke-virtual {p3}, Ljavax/crypto/Mac;->clone()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    check-cast p3, Ljavax/crypto/Mac;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_3 .. :try_end_3} :catch_0

    .line 27
    .line 28
    goto :goto_3

    .line 29
    :catch_2
    :try_start_4
    invoke-static {p5}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    :goto_3
    new-instance p4, Ljavax/crypto/spec/SecretKeySpec;

    .line 34
    .line 35
    invoke-direct {p4, p1, p5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p3, p4}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, p2}, Ljavax/crypto/Mac;->doFinal([B)[B

    .line 42
    .line 43
    .line 44
    move-result-object p0
    :try_end_4
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/security/InvalidKeyException; {:try_start_4 .. :try_end_4} :catch_0

    .line 45
    return-object p0

    .line 46
    :goto_4
    const-string p3, "Invalid key: "

    .line 47
    .line 48
    invoke-static {p3, p1, p2}, Ll/u1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    return-object p0

    .line 52
    :goto_5
    const-string p2, "Unsupported algorithm: "

    .line 53
    .line 54
    invoke-static {p2, p5, p1}, Ll/u1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-object p0
.end method
