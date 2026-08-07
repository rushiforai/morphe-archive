.class public Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;
.super Ljava/lang/Object;


# instance fields
.field public beatsPerMeasure:I

.field public beatsPerMinute:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    iput v0, p0, Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;->beatsPerMeasure:I

    const/16 v0, 0x3c

    iput v0, p0, Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;->beatsPerMinute:I

    return-void
.end method


# virtual methods
.method public getBeatsPerMeasure()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;->beatsPerMeasure:I

    return p0
.end method

.method public getBeatsPerMinute()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/audio/AgoraRhythmPlayerConfig;->beatsPerMinute:I

    return p0
.end method
