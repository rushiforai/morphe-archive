.class public Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;,
        Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;,
        Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;,
        Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;,
        Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;
    }
.end annotation


# instance fields
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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCreate(Ljava/lang/String;ZLcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;)I
.end method

.method private native nativeProcess(ILcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;)I
.end method

.method private native nativeRelease()V
.end method


# virtual methods
.method public create(Ljava/lang/String;ZLcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->nativeCreate(Ljava/lang/String;ZLcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 9
    .line 10
    return p1

    .line 11
    :cond_0
    const/4 p2, 0x1

    .line 12
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 13
    .line 14
    return p1
.end method

.method public process(ILcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    new-instance v0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->nativeProcess(ILcom/effectsar/labcv/effectsdk/OnekeyEnhance$AlgParamStream;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-gez p0, :cond_1

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    iget p0, v0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$Result;->textureId:I

    .line 20
    .line 21
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->nativeRelease()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;->mInited:Z

    .line 10
    .line 11
    return-void
.end method
