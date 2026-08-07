.class public Lcom/tenpay/utils/SMUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static isLoadSuccess:Z

.field public static mInstance:Lcom/tenpay/utils/SMUtils;


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

.method public static getInstance()Lcom/tenpay/utils/SMUtils;
    .locals 2

    .line 1
    sget-object v0, Lcom/tenpay/utils/SMUtils;->mInstance:Lcom/tenpay/utils/SMUtils;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tenpay/utils/SMUtils;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tenpay/utils/SMUtils;->mInstance:Lcom/tenpay/utils/SMUtils;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tenpay/utils/SMUtils;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/tenpay/utils/SMUtils;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tenpay/utils/SMUtils;->mInstance:Lcom/tenpay/utils/SMUtils;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/tenpay/utils/SMUtils;->mInstance:Lcom/tenpay/utils/SMUtils;

    .line 27
    .line 28
    return-object v0
.end method

.method public static isLoadOK()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tenpay/utils/SMUtils;->isLoadSuccess:Z

    .line 2
    .line 3
    return v0
.end method


# virtual methods
.method public native SM2Decrypt(J[BLjava/lang/String;)[B
.end method

.method public native SM2Encrypt(J[BLjava/lang/String;)[B
.end method

.method public native SM2FreeCtx(J)V
.end method

.method public native SM2GenKeyPair(J)[Ljava/lang/Object;
.end method

.method public native SM2InitCtx()J
.end method

.method public native SM2InitCtxWithPubKey(Ljava/lang/String;)J
.end method

.method public native SM2ReSeed(J[B)I
.end method

.method public native SM2Sign(J[B[BLjava/lang/String;Ljava/lang/String;)[B
.end method

.method public native SM2Verify(J[B[BLjava/lang/String;[B)I
.end method

.method public native SM3([B)[B
.end method

.method public native SM3Final(J)[B
.end method

.method public native SM3Free(J)V
.end method

.method public native SM3Init()J
.end method

.method public native SM3Update(J[B)V
.end method

.method public native SM4CBCDecrypt([B[B[B)[B
.end method

.method public native SM4CBCDecryptNoPadding([B[B[B)[B
.end method

.method public native SM4CBCEncrypt([B[B[B)[B
.end method

.method public native SM4CBCEncryptNoPadding([B[B[B)[B
.end method

.method public native SM4ECBDecrypt([B[B)[B
.end method

.method public native SM4ECBDecryptNoPadding([B[B)[B
.end method

.method public native SM4ECBEncrypt([B[B)[B
.end method

.method public native SM4ECBEncryptNoPadding([B[B)[B
.end method

.method public native SM4GenKey()[B
.end method

.method public native sm4GCMDecryptNoPadding([B[B[B[B[B)[B
.end method

.method public native sm4GCMEncryptNoPadding([BI[B[B[B)[B
.end method

.method public native version()Ljava/lang/String;
.end method
