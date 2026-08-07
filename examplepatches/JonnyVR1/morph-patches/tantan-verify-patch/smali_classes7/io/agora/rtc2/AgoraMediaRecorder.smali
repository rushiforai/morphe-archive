.class public Lio/agora/rtc2/AgoraMediaRecorder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;
    }
.end annotation


# static fields
.field public static final CONTAINER_MP4:I = 0x1

.field public static final RECORDER_REASON_CONFIG_CHANGED:I = 0x4

.field public static final RECORDER_REASON_NONE:I = 0x0

.field public static final RECORDER_REASON_NO_STREAM:I = 0x2

.field public static final RECORDER_REASON_OVER_MAX_DURATION:I = 0x3

.field public static final RECORDER_REASON_WRITE_FAILED:I = 0x1

.field public static final RECORDER_STATE_ERROR:I = -0x1

.field public static final RECORDER_STATE_START:I = 0x2

.field public static final RECORDER_STATE_STOP:I = 0x3

.field public static final STREAM_TYPE_AUDIO:I = 0x1

.field public static final STREAM_TYPE_BOTH:I = 0x3

.field public static final STREAM_TYPE_VIDEO:I = 0x2


# instance fields
.field mChannelId:Ljava/lang/String;

.field mEngineReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lio/agora/rtc2/internal/RtcEngineImpl;",
            ">;"
        }
    .end annotation
.end field

.field mIsLocal:Z

.field mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/RtcEngineImpl;Lio/agora/rtc2/RecorderStreamInfo;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mIsLocal:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    iget-object p0, p2, Lio/agora/rtc2/RecorderStreamInfo;->channelId:Ljava/lang/String;

    if-nez p0, :cond_0

    const-string p0, ""

    iput-object p0, p2, Lio/agora/rtc2/RecorderStreamInfo;->channelId:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public static getChannelId(Lio/agora/rtc2/RecorderStreamInfo;)Ljava/lang/String;
    .locals 0

    if-eqz p0, :cond_0

    iget-object p0, p0, Lio/agora/rtc2/RecorderStreamInfo;->channelId:Ljava/lang/String;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getStreamType(Lio/agora/rtc2/RecorderStreamInfo;)I
    .locals 0

    if-eqz p0, :cond_0

    iget p0, p0, Lio/agora/rtc2/RecorderStreamInfo;->recorderStreamType:I

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getUserId(Lio/agora/rtc2/RecorderStreamInfo;)I
    .locals 0

    if-eqz p0, :cond_0

    iget p0, p0, Lio/agora/rtc2/RecorderStreamInfo;->uid:I

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public release()V
    .locals 4

    iget-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/internal/RtcEngineImpl;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v1}, Lio/agora/rtc2/AgoraMediaRecorder;->getChannelId(Lio/agora/rtc2/RecorderStreamInfo;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v2}, Lio/agora/rtc2/AgoraMediaRecorder;->getUserId(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lio/agora/rtc2/internal/RtcEngineImpl;->releaseRecorder(Ljava/lang/String;IZ)I

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public setMediaRecorderObserver(Lio/agora/rtc2/IMediaRecorderCallback;)I
    .locals 7

    iget-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v0}, Lio/agora/rtc2/AgoraMediaRecorder;->getUserId(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v3

    iget-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v0}, Lio/agora/rtc2/AgoraMediaRecorder;->getChannelId(Lio/agora/rtc2/RecorderStreamInfo;)Ljava/lang/String;

    move-result-object v4

    iget-object p0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {p0}, Lio/agora/rtc2/AgoraMediaRecorder;->getStreamType(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v6

    const/4 v5, 0x1

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Lio/agora/rtc2/internal/RtcEngineImpl;->setMediaRecorderObserver(Lio/agora/rtc2/IMediaRecorderCallback;ILjava/lang/String;ZI)I

    move-result p0

    return p0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    iput-object p1, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    const/4 p0, -0x7

    return p0
.end method

.method public startRecording(Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;)I
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    iget-object v4, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->storagePath:Ljava/lang/String;

    iget v5, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->containerFormat:I

    iget v6, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->streamType:I

    iget v7, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->maxDurationMs:I

    iget v8, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->recorderInfoUpdateInterval:I

    iget-object v2, v0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v2}, Lio/agora/rtc2/AgoraMediaRecorder;->getUserId(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v9

    iget-object v2, v0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v2}, Lio/agora/rtc2/AgoraMediaRecorder;->getChannelId(Lio/agora/rtc2/RecorderStreamInfo;)Ljava/lang/String;

    move-result-object v10

    iget-object v0, v0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v0}, Lio/agora/rtc2/AgoraMediaRecorder;->getStreamType(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v12

    iget v13, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->width:I

    iget v14, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->height:I

    iget v15, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->fps:I

    iget v0, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->sample_rate:I

    iget v2, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->channel_num:I

    iget v1, v1, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->videoSourceType:I

    const/4 v11, 0x1

    move/from16 v16, v0

    move/from16 v18, v1

    move/from16 v17, v2

    invoke-virtual/range {v3 .. v18}, Lio/agora/rtc2/internal/RtcEngineImpl;->startRecording(Ljava/lang/String;IIIIILjava/lang/String;ZIIIIIII)I

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v1, 0x0

    iput-object v1, v0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    const/4 v0, -0x7

    return v0
.end method

.method public stopRecording()I
    .locals 4

    iget-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v1}, Lio/agora/rtc2/AgoraMediaRecorder;->getChannelId(Lio/agora/rtc2/RecorderStreamInfo;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {v2}, Lio/agora/rtc2/AgoraMediaRecorder;->getUserId(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result v2

    iget-object p0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mStreamInfo:Lio/agora/rtc2/RecorderStreamInfo;

    invoke-static {p0}, Lio/agora/rtc2/AgoraMediaRecorder;->getStreamType(Lio/agora/rtc2/RecorderStreamInfo;)I

    move-result p0

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3, p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->stopRecording(Ljava/lang/String;IZI)I

    move-result p0

    return p0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/AgoraMediaRecorder;->mEngineReference:Ljava/lang/ref/WeakReference;

    const/4 p0, -0x7

    return p0
.end method
