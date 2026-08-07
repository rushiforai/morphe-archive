.class public Lcom/tantanapp/media/ttagc/TTAgcProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final ERROR:I = -0x1

.field private static sLoadSuccessful:Z


# instance fields
.field private mAgcInstance:J

.field private mAgcMode:I

.field private mCompressionGaindB:S

.field private mFs:I

.field mLimiterEnable:Z

.field private mMaxLevel:I

.field private mMinLevel:I

.field private mNumBand:I

.field private mTargetLevelDbfs:S

.field private mVirtualMicOutLevel:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "ttagc"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    sput-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    sput-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mVirtualMicOutLevel:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMinLevel:I

    .line 8
    .line 9
    const/16 v0, 0xff

    .line 10
    .line 11
    iput v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMaxLevel:I

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    iput v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcMode:I

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mLimiterEnable:Z

    .line 18
    .line 19
    iput-short v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mTargetLevelDbfs:S

    .line 20
    .line 21
    const/16 v0, 0xf

    .line 22
    .line 23
    iput-short v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mCompressionGaindB:S

    .line 24
    .line 25
    iput v1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mNumBand:I

    .line 26
    .line 27
    sget-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-direct {p0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeAgcCreate()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 37
    .line 38
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mFs:I

    .line 39
    .line 40
    return-void
.end method

.method private native nativeAgcCreate()J
.end method

.method private native nativeAgcFree(J)V
.end method

.method private native nativeAgcInit(JIIII)I
.end method

.method private native nativeAgcProcess(J[SII[SIIIZ)I
.end method

.method private native nativeAgcSetConfig(JSSZ)I
.end method

.method private native nativeVirtualMic(J[SIIII)I
.end method

.method public static newInstance(I)Lcom/tantanapp/media/ttagc/TTAgcProcessor;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;-><init>(I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private setVirtualMicOutLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mVirtualMicOutLevel:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public free()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 7
    .line 8
    invoke-direct {p0, v0, v1}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeAgcFree(J)V

    .line 9
    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 14
    .line 15
    return-void
.end method

.method public getVirtualMicOutLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mVirtualMicOutLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public init()I
    .locals 13

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-wide v1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 8
    .line 9
    iget v3, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMinLevel:I

    .line 10
    .line 11
    iget v4, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMaxLevel:I

    .line 12
    .line 13
    iget v5, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcMode:I

    .line 14
    .line 15
    iget v6, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mFs:I

    .line 16
    .line 17
    move-object v0, p0

    .line 18
    invoke-direct/range {v0 .. v6}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeAgcInit(JIIII)I

    .line 19
    .line 20
    .line 21
    iget-wide v8, v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 22
    .line 23
    iget-short v10, v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mTargetLevelDbfs:S

    .line 24
    .line 25
    iget-short v11, v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mCompressionGaindB:S

    .line 26
    .line 27
    iget-boolean v12, v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mLimiterEnable:Z

    .line 28
    .line 29
    move-object v7, v0

    .line 30
    invoke-direct/range {v7 .. v12}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeAgcSetConfig(JSSZ)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method

.method public process([SI[SI)I
    .locals 11

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-wide v1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 8
    .line 9
    iget v4, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mNumBand:I

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->getVirtualMicOutLevel()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    const/4 v8, 0x0

    .line 16
    const/4 v10, 0x0

    .line 17
    move-object v0, p0

    .line 18
    move-object v3, p1

    .line 19
    move v5, p2

    .line 20
    move-object v6, p3

    .line 21
    move v9, p4

    .line 22
    invoke-direct/range {v0 .. v10}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeAgcProcess(J[SII[SIIIZ)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public setAgcMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcMode:I

    .line 2
    .line 3
    return-void
.end method

.method public setCompressionGaindB(S)V
    .locals 0

    .line 1
    iput-short p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mCompressionGaindB:S

    .line 2
    .line 3
    return-void
.end method

.method public setLimiterEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mLimiterEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMaxLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setMinLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mMinLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public setNumBands(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mNumBand:I

    .line 2
    .line 3
    return-void
.end method

.method public setTargetLevelDbfs(S)V
    .locals 0

    .line 1
    iput-short p1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mTargetLevelDbfs:S

    .line 2
    .line 3
    return-void
.end method

.method public virtualMic([SI)I
    .locals 8

    .line 1
    sget-boolean v0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->sLoadSuccessful:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    iget-wide v1, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mAgcInstance:J

    .line 8
    .line 9
    iget v4, p0, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->mNumBand:I

    .line 10
    .line 11
    const/4 v6, 0x0

    .line 12
    const/4 v7, 0x0

    .line 13
    move-object v0, p0

    .line 14
    move-object v3, p1

    .line 15
    move v5, p2

    .line 16
    invoke-direct/range {v0 .. v7}, Lcom/tantanapp/media/ttagc/TTAgcProcessor;->nativeVirtualMic(J[SIIII)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0
.end method
