.class public Lio/agora/rtc2/audio/UserAudioSpectrumInfo;
.super Ljava/lang/Object;


# instance fields
.field private audioSpectrumInfo:Lio/agora/rtc2/audio/AudioSpectrumInfo;

.field private uid:I


# direct methods
.method public constructor <init>(ILio/agora/rtc2/audio/AudioSpectrumInfo;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/audio/UserAudioSpectrumInfo;->uid:I

    iput-object p2, p0, Lio/agora/rtc2/audio/UserAudioSpectrumInfo;->audioSpectrumInfo:Lio/agora/rtc2/audio/AudioSpectrumInfo;

    return-void
.end method


# virtual methods
.method public getAudioSpectrumInfo()Lio/agora/rtc2/audio/AudioSpectrumInfo;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/audio/UserAudioSpectrumInfo;->audioSpectrumInfo:Lio/agora/rtc2/audio/AudioSpectrumInfo;

    return-object p0
.end method

.method public getUid()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/audio/UserAudioSpectrumInfo;->uid:I

    return p0
.end method
