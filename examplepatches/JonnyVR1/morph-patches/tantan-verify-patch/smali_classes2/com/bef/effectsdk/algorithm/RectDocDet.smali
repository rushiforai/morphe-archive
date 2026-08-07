.class public Lcom/bef/effectsdk/algorithm/RectDocDet;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation


# static fields
.field public static final RectDocDetAngleThr:I = 0x3

.field public static final RectDocDetIsVideoMode:I = 0x2

.field public static final RectDocDetIsVideoTypeNo:I = 0x2

.field public static final RectDocDetIsVideoTypeYes:I = 0x1

.field public static final RectDocDetPreProcessMode:I = 0x1

.field public static final RectDocDetPreprocessTypeCenterCut:I = 0x2

.field public static final RectDocDetPreprocessTypeNN:I = 0x1


# instance fields
.field private mFinder:Lcom/bef/effectsdk/ResourceFinder;

.field private mFinderHandle:J

.field private mNativeHandle:J


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

.method private isFinderHandleValid()Z
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinderHandle:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private isNativeHandleValid()Z
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iget-wide v2, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method private native nativeCreate()J
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private native nativeDestroy(J)I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private native nativeInit(JJI)I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private native nativeInitWithPath(JLjava/lang/String;I)I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private native nativeProcess(JLandroid/graphics/Bitmap;I)Lcom/bef/effectsdk/algorithm/RectDocDetResult;
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method

.method private native nativeSetParamF(JIF)I
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation
.end method


# virtual methods
.method public create()Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeCreate()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public destroy()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-wide v3, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 10
    .line 11
    invoke-direct {p0, v3, v4}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeDestroy(J)I

    .line 12
    .line 13
    .line 14
    iput-wide v1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinder:Lcom/bef/effectsdk/ResourceFinder;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isFinderHandleValid()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinder:Lcom/bef/effectsdk/ResourceFinder;

    .line 27
    .line 28
    iget-wide v3, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinderHandle:J

    .line 29
    .line 30
    invoke-interface {v0, v3, v4}, Lcom/bef/effectsdk/ResourceFinder;->release(J)V

    .line 31
    .line 32
    .line 33
    iput-wide v1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinderHandle:J

    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public init(Lcom/bef/effectsdk/ResourceFinder;I)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iput-object p1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinder:Lcom/bef/effectsdk/ResourceFinder;

    .line 12
    .line 13
    iget-wide v1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 14
    .line 15
    invoke-interface {p1, v1, v2}, Lcom/bef/effectsdk/ResourceFinder;->createNativeResourceFinder(J)J

    .line 16
    .line 17
    .line 18
    move-result-wide v1

    .line 19
    iput-wide v1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinderHandle:J

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isFinderHandleValid()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->destroy()V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :cond_1
    iget-wide v2, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 32
    .line 33
    iget-wide v4, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mFinderHandle:J

    .line 34
    .line 35
    move-object v1, p0

    .line 36
    move v6, p2

    .line 37
    invoke-direct/range {v1 .. v6}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeInit(JJI)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_2

    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0

    .line 45
    :cond_2
    :goto_0
    return v0
.end method

.method public initWithPath(Ljava/lang/String;I)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-wide v1, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 18
    .line 19
    invoke-direct {p0, v1, v2, p1, p2}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeInitWithPath(JLjava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    return v0
.end method

.method public process(Landroid/graphics/Bitmap;I)Lcom/bef/effectsdk/algorithm/RectDocDetResult;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 11
    .line 12
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeProcess(JLandroid/graphics/Bitmap;I)Lcom/bef/effectsdk/algorithm/RectDocDetResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    new-instance p0, Lcom/bef/effectsdk/algorithm/RectDocDetResult;

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDetResult;-><init>()V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method public setParamF(IF)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/bef/effectsdk/algorithm/RectDocDet;->isNativeHandleValid()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-wide v2, p0, Lcom/bef/effectsdk/algorithm/RectDocDet;->mNativeHandle:J

    .line 10
    .line 11
    invoke-direct {p0, v2, v3, p1, p2}, Lcom/bef/effectsdk/algorithm/RectDocDet;->nativeSetParamF(JIF)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v1
.end method
