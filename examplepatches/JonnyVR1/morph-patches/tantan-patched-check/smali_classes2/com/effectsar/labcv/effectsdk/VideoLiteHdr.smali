.class public Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;,
        Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;,
        Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;
    }
.end annotation


# instance fields
.field private mFrameInfo:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;

.field private mInited:Z

.field private mNativePtr:J

.field private mParam:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;


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
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private native nativeCreate(Ljava/lang/String;ZLcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;)I
.end method

.method private native nativeProcess(Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;Lcom/effectsar/labcv/effectsdk/BefVideoSRInfo;)I
.end method

.method private native nativeRelease()I
.end method


# virtual methods
.method public init(Ljava/lang/String;Ljava/lang/String;IILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityPowerLevel;Ljava/lang/String;Z)I
    .locals 2

    .line 1
    new-instance v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mParam:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;

    .line 12
    .line 13
    new-instance v1, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mFrameInfo:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;

    .line 19
    .line 20
    iput-object p2, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->binPath:Ljava/lang/String;

    .line 21
    .line 22
    iput p3, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->maxHeight:I

    .line 23
    .line 24
    iput p4, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->maxWidth:I

    .line 25
    .line 26
    invoke-virtual {p5}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityPowerLevel;->getLevel()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->powerLevel:I

    .line 31
    .line 32
    iput-object p6, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->imgLutPath:Ljava/lang/String;

    .line 33
    .line 34
    const/4 p2, 0x0

    .line 35
    iput-object p2, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->skinLutPath:Ljava/lang/String;

    .line 36
    .line 37
    const/4 p2, 0x6

    .line 38
    iput p2, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->perNum:I

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    iput-boolean p2, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->isCover:Z

    .line 42
    .line 43
    sget-object p3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityPowerLevel;->POWER_LEVEL_AUTO:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityPowerLevel;

    .line 44
    .line 45
    invoke-virtual {p3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityPowerLevel;->getLevel()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    iput p3, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->powerLevel:I

    .line 50
    .line 51
    sget-object p3, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityVideoLiteHdrType;->HDR_TYPE_LITE_V8:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityVideoLiteHdrType;

    .line 52
    .line 53
    invoke-virtual {p3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$ImageQulityVideoLiteHdrType;->getLevel()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    iput p3, v0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;->algType:I

    .line 58
    .line 59
    invoke-direct {p0, p1, p7, v0}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->nativeCreate(Ljava/lang/String;ZLcom/effectsar/labcv/effectsdk/VideoLiteHdr$HdrConfig;)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_0

    .line 64
    .line 65
    const/4 p2, 0x1

    .line 66
    :cond_0
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mInited:Z

    .line 67
    .line 68
    return p1
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mInited:Z

    .line 2
    .line 3
    return p0
.end method

.method public process(IIIZF)Lcom/effectsar/labcv/effectsdk/BefVideoSRInfo;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mInited:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Lcom/effectsar/labcv/effectsdk/BefVideoSRInfo;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/BefVideoSRInfo;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mFrameInfo:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;

    .line 12
    .line 13
    iput-boolean p4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->isFirstFrame:Z

    .line 14
    .line 15
    const/4 p4, 0x1

    .line 16
    iput-boolean p4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->isDay:Z

    .line 17
    .line 18
    iput-boolean p4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->isProtectFace:Z

    .line 19
    .line 20
    iput-boolean p4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->isAFS:Z

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    iput-boolean v3, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->isProtectFace:Z

    .line 24
    .line 25
    const/4 v3, -0x1

    .line 26
    iput v3, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->faceLuminanceTarget:I

    .line 27
    .line 28
    const/high16 v4, -0x40800000    # -1.0f

    .line 29
    .line 30
    iput v4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->faceLuminanceFactor:F

    .line 31
    .line 32
    iput v3, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->luminanceTarget:I

    .line 33
    .line 34
    iput v4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->luminanceFactor:F

    .line 35
    .line 36
    iput v4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->contrast:F

    .line 37
    .line 38
    iput v4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->saturation:F

    .line 39
    .line 40
    iput v4, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->sharpenStrength:F

    .line 41
    .line 42
    iput p5, v2, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;->enhanceStrength:F

    .line 43
    .line 44
    iget-object p5, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mParam:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;

    .line 45
    .line 46
    iput p3, p5, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;->height:I

    .line 47
    .line 48
    iput p2, p5, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;->width:I

    .line 49
    .line 50
    iput-boolean p4, p5, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;->open:Z

    .line 51
    .line 52
    iput p1, p5, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;->textureId:I

    .line 53
    .line 54
    iput-object v2, p5, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;->info:Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$FrameInfo;

    .line 55
    .line 56
    invoke-direct {p0, p5, v0}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->nativeProcess(Lcom/effectsar/labcv/effectsdk/VideoLiteHdr$Param;Lcom/effectsar/labcv/effectsdk/BefVideoSRInfo;)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p2, "nativevideo lite hdr Process "

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "bef_effect_ai"

    .line 77
    .line 78
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_0
    return-object v0

    .line 83
    :cond_1
    return-object v1
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->nativeRelease()I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/VideoLiteHdr;->mInited:Z

    .line 10
    .line 11
    return-void
.end method
