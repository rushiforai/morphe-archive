.class public final Le/e/a/NetworkSecurity220;
.super Ljava/lang/Object;
.source "NetworkSecurity220.java"


# static fields
.field private static final BLOCKED:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .line 16
    const-string v6, "ebed6475c2c2d80fcb199f3fe8dd6e6b3ce60b77eb15d4e42c3dec0c6f5b5105"

    const-string v7, "ec4ffa1ad0ac88081314b7aaffef6a91f97cd57291bb5ba686c5415f5eb4f6b6"

    const-string v0, "43bffa19d6ef651451f6841e019931e96f6f2eaeff28ab4b6f1ce4576de2717b"

    const-string v1, "49dd353dc2b919a3770645117d0e60c16115e7d1bc259eefe734b00ea434fe5f"

    const-string v2, "5c0660a2b164910d8ff589c18e14552e9e0ec237dcefe2cb736d41a4811f81a0"

    const-string v3, "63ecefee431d49523bc1136c4e72d0206a477086caf606cd5cf025686c109cf8"

    const-string v4, "92c063d67e8f14db71d288e11266ffdaf69cbf115f7bab14f3bc2f68d25e0e30"

    const-string v5, "e0254c7fcdc265e2f0f8a428dabb75ab4ae039b4872d62f5ee57f0877d5a8a41"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/NetworkSecurity220;->BLOCKED:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkPeerCertificates(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/security/cert/Certificate;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLPeerUnverifiedException;
        }
    .end annotation

    .line 43
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 44
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/cert/Certificate;

    .line 45
    invoke-virtual {v1}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v1

    invoke-interface {v1}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    invoke-static {v1}, Le/e/a/NetworkSecurity220;->isBlockedDigest([B)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    new-instance p0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    const-string v0, "Certificate blocklisted by OkHttp"

    invoke-direct {p0, v0}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-void

    :catch_0
    move-exception p0

    .line 50
    new-instance v0, Ljavax/net/ssl/SSLPeerUnverifiedException;

    const-string v1, "SHA-256 unavailable"

    invoke-direct {v0, v1}, Ljavax/net/ssl/SSLPeerUnverifiedException;-><init>(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0, p0}, Ljavax/net/ssl/SSLPeerUnverifiedException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 52
    throw v0
.end method

.method static isBlockedDigest([B)Z
    .registers 9

    .line 30
    array-length v0, p0

    const/16 v1, 0x20

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    :cond_0
    const/16 v0, 0x40

    .line 31
    new-array v0, v0, [C

    move v1, v2

    .line 32
    :goto_0
    array-length v3, p0

    const/4 v4, 0x1

    if-ge v1, v3, :cond_1

    .line 33
    aget-byte v3, p0, v1

    and-int/lit16 v5, v3, 0xff

    shl-int/lit8 v6, v1, 0x1

    ushr-int/lit8 v5, v5, 0x4

    const/16 v7, 0x10

    .line 34
    invoke-static {v5, v7}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    aput-char v5, v0, v6

    add-int/2addr v6, v4

    and-int/lit8 v3, v3, 0xf

    .line 35
    invoke-static {v3, v7}, Ljava/lang/Character;->forDigit(II)C

    move-result v3

    aput-char v3, v0, v6

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 37
    :cond_1
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    .line 38
    sget-object v0, Le/e/a/NetworkSecurity220;->BLOCKED:[Ljava/lang/String;

    array-length v1, v0

    move v3, v2

    :goto_1
    if-ge v3, v1, :cond_3

    aget-object v5, v0, v3

    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    return v4

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    return v2
.end method

.method public static normalizePinHost(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 27
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method
