.class public Lcom/effectsar/labcv/effectsdk/PortraitMatting;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
    }
.end annotation


# instance fields
.field private inited:Z

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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreateHandle()I
.end method

.method private native nativeInit(Ljava/lang/String;I)I
.end method

.method private native nativeMatting(Ljava/nio/ByteBuffer;IIIIIZLcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;)I
.end method

.method private native nativeRelease()I
.end method

.method private native nativeSetParam(II)I
.end method


# virtual methods
.method public detectMatting(Ljava/nio/ByteBuffer;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;IIILcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;Z)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;
    .locals 9

    .line 1
    new-instance v8, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 2
    .line 3
    invoke-direct {v8, p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;-><init>(Lcom/effectsar/labcv/effectsdk/PortraitMatting;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PixlFormat;->getValue()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget v6, p6, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$Rotation;->id:I

    .line 11
    .line 12
    move-object v0, p0

    .line 13
    move-object v1, p1

    .line 14
    move v3, p3

    .line 15
    move v4, p4

    .line 16
    move v5, p5

    .line 17
    move/from16 v7, p7

    .line 18
    .line 19
    invoke-direct/range {v0 .. v8}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeMatting(Ljava/nio/ByteBuffer;IIIIIZLcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string p2, "nativeMatting return "

    .line 28
    .line 29
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "bef_effect_ai"

    .line 40
    .line 41
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0

    .line 46
    :cond_0
    return-object v8
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;Ljava/lang/String;)I
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 40
    invoke-virtual/range {v0 .. v5}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->init(Landroid/content/Context;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;Ljava/lang/String;Z)I

    move-result p0

    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeCreateHandle()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p4, p5}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    :cond_0
    const/4 p1, 0x1

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p3}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PortraitMatting;->getValue()I

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    invoke-direct {p0, p2, p3}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeInit(Ljava/lang/String;I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    sget-object p2, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->BEF_MP_EdgeMode:Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;

    .line 27
    .line 28
    invoke-virtual {p0, p2, p1}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;I)I

    .line 29
    .line 30
    .line 31
    :cond_1
    if-nez v0, :cond_2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    const/4 p1, 0x0

    .line 35
    :goto_0
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 36
    .line 37
    return v0

    .line 38
    :cond_3
    const/4 p0, -0x1

    .line 39
    return p0
.end method

.method public isInited()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeRelease()I

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->inited:Z

    .line 10
    .line 11
    return-void
.end method

.method public setParam(Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;I)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/EffectsSDKEffectConstants$PorraitMattingParamType;->getValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/effectsar/labcv/effectsdk/PortraitMatting;->nativeSetParam(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
