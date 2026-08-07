.class public Lcom/effectsar/labcv/effectsdk/ObjectTracking;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;,
        Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;
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
    iput-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->mInited:Z

    .line 6
    .line 7
    return-void
.end method

.method private native nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I
.end method

.method private native nativeCreate()I
.end method

.method private native nativeDestroy()I
.end method

.method private native nativeGetDefaultParam(Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;)V
.end method

.method private native nativeInit(Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;)I
.end method

.method private native nativeSetInitBox(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I
.end method

.method private native nativeTrackFrame(Ljava/nio/ByteBuffer;IIIIIFLcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I
.end method


# virtual methods
.method public destroy()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->mInited:Z

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
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeDestroy()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeCreate()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    invoke-direct {p0, p1, p3, p4}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeCheckLicense(Landroid/content/Context;Ljava/lang/String;Z)I

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
    new-instance p1, Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeGetDefaultParam(Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;)V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0, p2, p1}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeInit(Ljava/lang/String;Lcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingInitParam;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    const/4 p2, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_2
    const/4 p2, 0x0

    .line 32
    :goto_0
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->mInited:Z

    .line 33
    .line 34
    return p1
.end method

.method public setInitBox(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p7, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct/range {p0 .. p7}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeSetInitBox(Ljava/nio/ByteBuffer;IIIIILcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I

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

.method public trackFrame(Ljava/nio/ByteBuffer;IIIIIDLcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->mInited:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p9, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    double-to-float p7, p7

    .line 9
    move-object p8, p9

    .line 10
    invoke-direct/range {p0 .. p8}, Lcom/effectsar/labcv/effectsdk/ObjectTracking;->nativeTrackFrame(Ljava/nio/ByteBuffer;IIIIIFLcom/effectsar/labcv/effectsdk/ObjectTracking$ObjectTrackingBoundBox;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method
