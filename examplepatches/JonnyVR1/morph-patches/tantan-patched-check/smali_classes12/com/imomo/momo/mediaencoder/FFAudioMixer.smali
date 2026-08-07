.class public Lcom/imomo/momo/mediaencoder/FFAudioMixer;
.super Lcom/imomo/momo/mediaencoder/FFMediaUtils;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;
    }
.end annotation


# instance fields
.field private final CALL_BACK_ERROR_TAG:I

.field private final CALL_BACK_PROGRESS_TAG:I

.field private mHandler:J

.field private mListener:Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/imomo/momo/mediaencoder/FFMediaUtils;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->CALL_BACK_PROGRESS_TAG:I

    .line 6
    .line 7
    const/4 v0, -0x2

    .line 8
    iput v0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->CALL_BACK_ERROR_TAG:I

    .line 9
    .line 10
    return-void
.end method

.method private native nativeAddMainSource(JLjava/lang/String;I)I
.end method

.method private native nativeAddMusicSource(JLjava/lang/String;II)I
.end method

.method private native nativeAddSource(JLjava/lang/String;II)I
.end method

.method private native nativeCreateAudioMixer(Ljava/lang/Object;)J
.end method

.method private native nativeInit(JIIILjava/lang/String;)V
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeStart(J)I
.end method

.method private static postEventFromNative(Lcom/imomo/momo/mediaencoder/FFAudioMixer;III)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "FFAudioMixer"

    .line 4
    .line 5
    const-string p1, "audioMixer_ref is null"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->onObtainMessage(IILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public addMainSource(Ljava/lang/String;I)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1, p2}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeAddMainSource(JLjava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public addMusicSource(Ljava/lang/String;II)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move v5, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeAddMusicSource(JLjava/lang/String;II)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public addSource(Ljava/lang/String;II)V
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move v4, p2

    .line 6
    move v5, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeAddSource(JLjava/lang/String;II)I

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public initAudioMixer(IIILjava/lang/String;)Z
    .locals 7

    .line 1
    invoke-direct {p0, p0}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeCreateAudioMixer(Ljava/lang/Object;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v1

    .line 5
    iput-wide v1, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 6
    .line 7
    const-wide/16 v3, 0x0

    .line 8
    .line 9
    cmp-long v0, v1, v3

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    move-object v0, p0

    .line 16
    move v3, p1

    .line 17
    move v4, p2

    .line 18
    move v5, p3

    .line 19
    move-object v6, p4

    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeInit(JIIILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public onObtainMessage(IILjava/lang/Object;)V
    .locals 0

    .line 1
    const/4 p3, -0x1

    .line 2
    if-ne p1, p3, :cond_0

    .line 3
    .line 4
    iget-object p3, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mListener:Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-interface {p3, p2}, Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;->onProgress(I)V

    .line 9
    .line 10
    .line 11
    :cond_0
    const/4 p3, -0x2

    .line 12
    if-ne p1, p3, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mListener:Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-interface {p0, p2}, Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;->onError(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnAudioMixerListener(Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mListener:Lcom/imomo/momo/mediaencoder/FFAudioMixer$OnAudioMixerListener;

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/FFAudioMixer;->nativeStart(J)I

    .line 4
    .line 5
    .line 6
    return-void
.end method
