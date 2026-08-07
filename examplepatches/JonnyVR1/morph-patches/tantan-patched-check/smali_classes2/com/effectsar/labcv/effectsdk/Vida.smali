.class public Lcom/effectsar/labcv/effectsdk/Vida;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/Vida$VidaInitConfig;
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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/Vida;->mInited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreate(Lcom/effectsar/labcv/effectsdk/Vida$VidaInitConfig;)I
.end method

.method private native nativeProcess(Ljava/nio/ByteBuffer;II)F
.end method

.method private native nativeRelease()I
.end method


# virtual methods
.method public destroy()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/Vida;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/Vida;->nativeRelease()I

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/Vida;->mInited:Z

    .line 12
    .line 13
    return v0
.end method

.method public init(Landroid/content/Context;Lcom/effectsar/labcv/effectsdk/Vida$VidaInitConfig;Ljava/lang/String;Z)I
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Lcom/effectsar/labcv/effectsdk/Vida;->nativeCreate(Lcom/effectsar/labcv/effectsdk/Vida$VidaInitConfig;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return p2

    .line 8
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lcom/effectsar/labcv/effectsdk/Vida;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

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
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/Vida;->mInited:Z

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public process(Ljava/nio/ByteBuffer;II)F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/Vida;->mInited:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/high16 p0, -0x40800000    # -1.0f

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/effectsar/labcv/effectsdk/Vida;->nativeProcess(Ljava/nio/ByteBuffer;II)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
