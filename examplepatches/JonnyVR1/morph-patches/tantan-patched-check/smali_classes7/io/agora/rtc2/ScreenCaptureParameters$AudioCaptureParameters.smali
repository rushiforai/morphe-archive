.class public Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/rtc2/ScreenCaptureParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AudioCaptureParameters"
.end annotation


# instance fields
.field public allowCaptureCurrentApp:Z

.field public captureSignalVolume:I

.field public channels:I

.field public sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3e80

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->sampleRate:I

    const/4 v0, 0x2

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->channels:I

    const/16 v0, 0x64

    iput v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->captureSignalVolume:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->allowCaptureCurrentApp:Z

    return-void
.end method


# virtual methods
.method public getCaptureSignalVolume()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AudioCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->captureSignalVolume:I

    return p0
.end method

.method public getChannels()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AudioCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->channels:I

    return p0
.end method

.method public getSampleRate()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AudioCaptureParameters"
    .end annotation

    iget p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->sampleRate:I

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AudioCaptureParameters{sampleRate="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", channels="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->channels:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", captureSignalVolume="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->captureSignalVolume:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", allowCaptureCurrentApp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;->allowCaptureCurrentApp:Z

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
