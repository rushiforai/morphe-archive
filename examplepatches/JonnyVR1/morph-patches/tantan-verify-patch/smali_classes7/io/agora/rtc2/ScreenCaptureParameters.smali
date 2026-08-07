.class public Lio/agora/rtc2/ScreenCaptureParameters;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;,
        Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;
    }
.end annotation


# instance fields
.field public audioCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;

.field public captureAudio:Z

.field public captureVideo:Z

.field public videoCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureAudio:Z

    new-instance v0, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;

    invoke-direct {v0}, Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->videoCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureVideo:Z

    new-instance v0, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;

    invoke-direct {v0}, Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;-><init>()V

    iput-object v0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->audioCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;

    return-void
.end method


# virtual methods
.method public getAudioCaptureParameters()Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->audioCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;

    return-object p0
.end method

.method public getVideoCaptureParameters()Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->videoCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;

    return-object p0
.end method

.method public isCaptureAudio()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureAudio:Z

    return p0
.end method

.method public isCaptureVideo()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureVideo:Z

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ScreenCaptureParameters{captureAudio="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureAudio:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", videoCaptureParameters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/rtc2/ScreenCaptureParameters;->videoCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$VideoCaptureParameters;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", captureVideo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lio/agora/rtc2/ScreenCaptureParameters;->captureVideo:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", audioCaptureParameters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/rtc2/ScreenCaptureParameters;->audioCaptureParameters:Lio/agora/rtc2/ScreenCaptureParameters$AudioCaptureParameters;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
