.class public Lio/agora/rtc2/live/LiveInjectStreamConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;
    }
.end annotation


# instance fields
.field public audioBitrate:I

.field public audioChannels:I

.field public audioSampleRate:Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;

.field public height:I

.field public videoBitrate:I

.field public videoFramerate:I

.field public videoGop:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->width:I

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->height:I

    const/16 v0, 0x1e

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoGop:I

    const/16 v0, 0xf

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoFramerate:I

    const/16 v0, 0x190

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoBitrate:I

    sget-object v0, Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;->TYPE_44100:Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;

    iput-object v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioSampleRate:Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;

    const/16 v0, 0x30

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioBitrate:I

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioChannels:I

    return-void
.end method
