.class public Lio/agora/rtc2/internal/RtcEngineMessage$PInjectStreamConfig;
.super Lio/agora/rtc2/internal/Marshallable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/internal/RtcEngineMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PInjectStreamConfig"
.end annotation


# static fields
.field private static final SERVER_TYPE:S = 0x0s

.field private static final URI:S = 0x19s


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/agora/rtc2/internal/Marshallable;-><init>()V

    return-void
.end method

.method private marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveInjectStreamConfig;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    const/16 p0, 0x19

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushShort(S)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->width:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->height:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoGop:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoFramerate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->videoBitrate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget-object p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioSampleRate:Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;

    invoke-static {p0}, Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;->getValue(Lio/agora/rtc2/live/LiveInjectStreamConfig$AudioSampleRateType;)I

    move-result p0

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioBitrate:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    iget p0, p2, Lio/agora/rtc2/live/LiveInjectStreamConfig;->audioChannels:I

    invoke-virtual {p1, p0}, Lio/agora/rtc2/internal/Marshallable;->pushInt(I)V

    return-void
.end method


# virtual methods
.method public marshall(Lio/agora/rtc2/live/LiveInjectStreamConfig;)[B
    .locals 0

    .line 2
    invoke-direct {p0, p0, p1}, Lio/agora/rtc2/internal/RtcEngineMessage$PInjectStreamConfig;->marshall(Lio/agora/rtc2/internal/Marshallable;Lio/agora/rtc2/live/LiveInjectStreamConfig;)V

    invoke-super {p0}, Lio/agora/rtc2/internal/Marshallable;->marshall()[B

    move-result-object p0

    return-object p0
.end method
