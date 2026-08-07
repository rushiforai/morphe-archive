.class public Lio/agora/rtc2/internal/AudioRecordingConfiguration;
.super Ljava/lang/Object;


# instance fields
.field public codec:Z

.field public filePath:Ljava/lang/String;

.field public fileRecordOption:I

.field public quality:I

.field public recordingChannel:I

.field public sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x7d00

    iput v0, p0, Lio/agora/rtc2/internal/AudioRecordingConfiguration;->sampleRate:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/internal/AudioRecordingConfiguration;->codec:Z

    const/4 v1, 0x3

    iput v1, p0, Lio/agora/rtc2/internal/AudioRecordingConfiguration;->fileRecordOption:I

    iput v0, p0, Lio/agora/rtc2/internal/AudioRecordingConfiguration;->quality:I

    iput v0, p0, Lio/agora/rtc2/internal/AudioRecordingConfiguration;->recordingChannel:I

    return-void
.end method
