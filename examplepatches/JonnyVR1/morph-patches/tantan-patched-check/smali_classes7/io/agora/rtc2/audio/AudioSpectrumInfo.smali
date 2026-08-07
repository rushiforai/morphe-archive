.class public Lio/agora/rtc2/audio/AudioSpectrumInfo;
.super Ljava/lang/Object;


# instance fields
.field private audioSpectrumData:[F

.field private dataLength:I


# direct methods
.method public constructor <init>([FI)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/agora/rtc2/audio/AudioSpectrumInfo;->audioSpectrumData:[F

    iput p2, p0, Lio/agora/rtc2/audio/AudioSpectrumInfo;->dataLength:I

    return-void
.end method


# virtual methods
.method public getAudioSpectrumData()[F
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/audio/AudioSpectrumInfo;->audioSpectrumData:[F

    return-object p0
.end method

.method public getDataLength()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/audio/AudioSpectrumInfo;->dataLength:I

    return p0
.end method
