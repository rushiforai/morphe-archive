.class public Lcom/effectsar/labcv/effectsdk/VideoStab;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;,
        Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;,
        Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabMatrix;,
        Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;
    }
.end annotation


# instance fields
.field private mFirstFrame:Z

.field private mInited:Z

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "effect"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mFirstFrame:Z

    .line 9
    .line 10
    return-void
.end method

.method private native nativeCheckLicense(Ljava/lang/String;Z)I
.end method

.method private native nativeCreate(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;)I
.end method

.method private native nativeDestory()I
.end method

.method private native nativeProcessBuffer(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;Ljava/nio/ByteBuffer;)I
.end method

.method private native nativeSetSmoothParam(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;)I
.end method


# virtual methods
.method public cameraTracking(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

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
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mFirstFrame:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;->VIDEO_STAB_FRAME_START:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;->VIDEO_STAB_FRAME_EST:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

    .line 15
    .line 16
    :goto_0
    iput-object v0, p2, Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;->frameType:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeProcessBuffer(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;Ljava/nio/ByteBuffer;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 p2, 0x0

    .line 24
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mFirstFrame:Z

    .line 25
    .line 26
    return p1
.end method

.method public create(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeCreate(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return p1

    .line 8
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeCheckLicense(Ljava/lang/String;Z)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    return p1

    .line 15
    :cond_1
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public destroy()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeDestory()I

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

    .line 12
    .line 13
    return v0
.end method

.method public setSmoothParam(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

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
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeSetSmoothParam(Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabInitConfig;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public videoStabDeforming(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;Ljava/nio/ByteBuffer;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoStab;->mInited:Z

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
    sget-object v0, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;->VIDEO_STAB_FRAME_WARP:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

    .line 8
    .line 9
    iput-object v0, p2, Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;->frameType:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$VideoStabFrameType;

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/VideoStab;->nativeProcessBuffer(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabProcessParam;Lcom/effectsar/labcv/effectsdk/VideoStab$VideoStabOutput;Ljava/nio/ByteBuffer;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
