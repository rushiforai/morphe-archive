.class public Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/AgoraMediaRecorder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaRecorderConfiguration"
.end annotation


# instance fields
.field public channel_num:I

.field public containerFormat:I

.field public fps:I

.field public height:I

.field public maxDurationMs:I

.field public recorderInfoUpdateInterval:I

.field public sample_rate:I

.field public storagePath:Ljava/lang/String;

.field public streamType:I

.field public videoSourceType:I

.field public width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->storagePath:Ljava/lang/String;

    iput p2, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->containerFormat:I

    iput p3, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->streamType:I

    iput p4, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->maxDurationMs:I

    iput p5, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->recorderInfoUpdateInterval:I

    const/16 p1, 0x500

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->width:I

    const/16 p1, 0x2d0

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->height:I

    const/16 p1, 0x1e

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->fps:I

    const p1, 0xbb80

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->sample_rate:I

    const/4 p1, 0x1

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->channel_num:I

    const/4 p1, 0x0

    iput p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->videoSourceType:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIIIIIIII)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->storagePath:Ljava/lang/String;

    iput p2, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->containerFormat:I

    iput p3, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->streamType:I

    iput p4, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->maxDurationMs:I

    iput p5, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->recorderInfoUpdateInterval:I

    iput p6, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->width:I

    iput p7, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->height:I

    iput p8, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->fps:I

    iput p9, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->sample_rate:I

    iput p10, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->channel_num:I

    iput p11, p0, Lio/agora/rtc2/AgoraMediaRecorder$MediaRecorderConfiguration;->videoSourceType:I

    return-void
.end method
