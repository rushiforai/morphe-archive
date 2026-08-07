.class public Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;
.super Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;
.source "SourceFile"


# static fields
.field private static final ALGORITHM:Ljava/lang/String; = "HmacSHA256"

.field private static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF-8"

.field private static final LOCK:Ljava/lang/Object;

.field private static final VERSION:Ljava/lang/String; = "1"

.field private static macInstance:Ljavax/crypto/Mac;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->LOCK:Ljava/lang/Object;

    .line 7
    .line 8
    :try_start_0
    const-string v0, "HmacSHA256"

    .line 9
    .line 10
    invoke-static {v0}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->macInstance:Ljavax/crypto/Mac;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    :catchall_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public computeHash([B[B)[B
    .locals 6

    .line 1
    sget-object v3, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->macInstance:Ljavax/crypto/Mac;

    .line 2
    .line 3
    sget-object v4, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->LOCK:Ljava/lang/Object;

    .line 4
    .line 5
    const-string v5, "HmacSHA256"

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v2, p2

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;->sign([B[BLjavax/crypto/Mac;Ljava/lang/Object;Ljava/lang/String;)[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public computeSignature(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "UTF-8"

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    sget-object v4, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->macInstance:Ljavax/crypto/Mac;

    .line 12
    .line 13
    sget-object v5, Lcom/alibaba/sdk/android/oss/signer/HmacSHA256Signature;->LOCK:Ljava/lang/Object;

    .line 14
    .line 15
    const-string v6, "HmacSHA256"

    .line 16
    .line 17
    move-object v1, p0

    .line 18
    invoke-virtual/range {v1 .. v6}, Lcom/alibaba/sdk/android/oss/signer/ServiceSignature;->sign([B[BLjavax/crypto/Mac;Ljava/lang/Object;Ljava/lang/String;)[B

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lcom/alibaba/sdk/android/oss/common/utils/BinaryUtil;->toBase64String([B)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    return-object p0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    move-object p0, v0

    .line 29
    const-string p1, "Unsupported algorithm: UTF-8"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public getAlgorithm()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "HmacSHA256"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "1"

    .line 2
    .line 3
    return-object p0
.end method
