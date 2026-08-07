.class public Lcom/cosmos/codedlib/Coded;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ENC_OUTPUT_TYPE_AES_DEC:I = 0x2

.field public static final ENC_OUTPUT_TYPE_AES_ENC:I = 0x1

.field public static final ENC_OUTPUT_TYPE_ECDH_SHARED_SECRET:I = 0x3

.field public static final ENC_OUTPUT_TYPE_GROUP_CURVE192:I = 0x5

.field public static final ENC_OUTPUT_TYPE_KEY_CURVE192:I = 0x7

.field public static final ENC_OUTPUT_TYPE_PUBLIC_KEY_CURVE192:I = 0x6

.field public static final ENC_OUTPUT_TYPE_SHA1_OUTPUT:I = 0x4

.field private static final SHA_DIGEST_LENGTH:I = 0x14

.field private static instance:Lcom/cosmos/codedlib/Coded;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "coded"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native g234cpu43xc([BI[BII)I
.end method

.method public static getInstance()Lcom/cosmos/codedlib/Coded;
    .locals 2

    .line 1
    const-class v0, Lcom/cosmos/codedlib/Coded;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Lcom/cosmos/codedlib/Coded;->instance:Lcom/cosmos/codedlib/Coded;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Lcom/cosmos/codedlib/Coded;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/cosmos/codedlib/Coded;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lcom/cosmos/codedlib/Coded;->instance:Lcom/cosmos/codedlib/Coded;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Lcom/cosmos/codedlib/Coded;->instance:Lcom/cosmos/codedlib/Coded;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v1
.end method

.method private getServerSK(II)[B
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/codedlib/Coded;->ggug8Shj3S0(II)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private serverSecretGen([B[BII)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/cosmos/codedlib/Coded;->s729dS782nGoo([B[BII)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public native a49kdEba83h([BI[BI[B)I
.end method

.method public native a9ehcDdu3j8([BI[BI[B)I
.end method

.method public aesDecode([BI[BI[B)I
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p3, :cond_1

    .line 4
    .line 5
    if-nez p5, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual/range {p0 .. p5}, Lcom/cosmos/codedlib/Coded;->a9ehcDdu3j8([BI[BI[B)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 14
    return p0
.end method

.method public aesEncode([BI[BI[B)I
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/cosmos/codedlib/Coded;->a49kdEba83h([BI[BI[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public base64Decode([B[B)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/codedlib/Coded;->bsuh37Dhjaw([B[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public native bsuh37Dhjaw([B[B)I
.end method

.method public native c789Sju7G87([B[BI[B)I
.end method

.method public clientSecretGen([B[BI[B)I
    .locals 1

    .line 1
    const-class v0, Lcom/cosmos/codedlib/Coded;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/cosmos/codedlib/Coded;->c789Sju7G87([B[BI[B)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    monitor-exit v0

    .line 9
    return p0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw p0
.end method

.method public computeOutputLength(II)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/codedlib/Coded;->csjh7OhLe86(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public native csjh7OhLe86(II)I
.end method

.method public native g7673Shg3P9(II)[B
.end method

.method public getServerPK(II)[B
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/cosmos/codedlib/Coded;->g7673Shg3P9(II)[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public native ggug8Shj3S0(II)[B
.end method

.method public native s729dS782nGoo([B[BII)I
.end method

.method public native sdbyecbu37x([B[B[BI)I
.end method

.method public sign([B[B)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/16 v0, 0x14

    .line 7
    .line 8
    new-array v0, v0, [B

    .line 9
    .line 10
    array-length v1, p1

    .line 11
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/cosmos/codedlib/Coded;->sdbyecbu37x([B[B[BI)I

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-static {v0}, Ll/se2;->b([B)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    return-object p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const-string p0, ""

    .line 26
    .line 27
    return-object p0
.end method

.method public verifySignToken(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Ll/se2;->a([B)[B

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    array-length v0, p1

    .line 15
    array-length v1, p2

    .line 16
    invoke-static {p1, v0, p2, v1, p3}, Lcom/cosmos/codedlib/Coded;->g234cpu43xc([BI[BII)I

    .line 17
    .line 18
    .line 19
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 23
    .line 24
    .line 25
    move p1, p0

    .line 26
    :goto_0
    if-lez p1, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    :cond_0
    return p0
.end method
