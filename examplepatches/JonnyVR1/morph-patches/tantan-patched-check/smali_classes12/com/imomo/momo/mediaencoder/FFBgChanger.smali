.class public Lcom/imomo/momo/mediaencoder/FFBgChanger;
.super Lcom/imomo/momo/mediaencoder/FFMediaUtils;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;
    }
.end annotation


# instance fields
.field private final CALL_BACK_ERROR_TAG:I

.field private final CALL_BACK_PROGRESS_TAG:I

.field private mHandler:J

.field private mListener:Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/imomo/momo/mediaencoder/FFMediaUtils;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->CALL_BACK_PROGRESS_TAG:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    iput v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->CALL_BACK_ERROR_TAG:I

    .line 9
    .line 10
    return-void
.end method

.method private native nativeBgChangerInitAudioSource(JLjava/lang/String;JJ)I
.end method

.method private native nativeBgChangerInitVideoSource(JLjava/lang/String;)I
.end method

.method private native nativeBgChangerRelease(J)V
.end method

.method private native nativeBgChangerSetMixModeAndRatio(JII)V
.end method

.method private native nativeBgChangerSetOutputFileName(JLjava/lang/String;)I
.end method

.method private native nativeBgChangerStartProcess(J)V
.end method

.method private native nativeInitBgChanger(Ljava/lang/Object;)J
.end method

.method private static postEventFromNative(Lcom/imomo/momo/mediaencoder/FFBgChanger;III)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p3

    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->onObtainMessage(IILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public initAudioSource(Ljava/lang/String;JJ)Z
    .locals 8

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move-wide v4, p2

    .line 6
    move-wide v6, p4

    .line 7
    invoke-direct/range {v0 .. v7}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerInitAudioSource(JLjava/lang/String;JJ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-ltz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public initBgChanger()Z
    .locals 4

    .line 1
    invoke-direct {p0, p0}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeInitBgChanger(Ljava/lang/Object;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, v2

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    return p0
.end method

.method public initVideoSource(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerInitVideoSource(JLjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ltz p0, :cond_0

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

.method public onObtainMessage(IILjava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p3, 0x1

    .line 2
    if-ne p1, p3, :cond_0

    .line 3
    .line 4
    iget-object p3, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mListener:Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-interface {p3, p2}, Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;->onProgress(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 p3, -0x1

    .line 12
    if-ne p1, p3, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mListener:Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0, p2}, Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;->onError(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerRelease(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 9
    .line 10
    return-void
.end method

.method public setBgChangerListener(Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mListener:Lcom/imomo/momo/mediaencoder/FFBgChanger$OnBgChangerListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMixModeAndRatio(Ljava/lang/Boolean;F)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/high16 v0, 0x437f0000    # 255.0f

    .line 6
    .line 7
    mul-float/2addr p2, v0

    .line 8
    float-to-int p2, p2

    .line 9
    const/16 v0, 0xff

    .line 10
    .line 11
    if-le p2, v0, :cond_0

    .line 12
    .line 13
    move p2, v0

    .line 14
    :cond_0
    if-gez p2, :cond_1

    .line 15
    .line 16
    const/4 p2, 0x0

    .line 17
    :cond_1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 18
    .line 19
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerSetMixModeAndRatio(JII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setOutputFileName(Ljava/lang/String;)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerSetOutputFileName(JLjava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-ltz p0, :cond_0

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

.method public startProcess()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFBgChanger;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/FFBgChanger;->nativeBgChangerStartProcess(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
