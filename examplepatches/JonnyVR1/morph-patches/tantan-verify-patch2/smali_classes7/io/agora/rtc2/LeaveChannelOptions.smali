.class public Lio/agora/rtc2/LeaveChannelOptions;
.super Ljava/lang/Object;


# instance fields
.field public stopAllEffect:Z

.field public stopAudioMixing:Z

.field public stopMicrophoneRecording:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAudioMixing:Z

    iput-boolean v0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAllEffect:Z

    iput-boolean v0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopMicrophoneRecording:Z

    return-void
.end method


# virtual methods
.method public isStopAllEffect()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAllEffect:Z

    return p0
.end method

.method public isStopAudioMixing()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAudioMixing:Z

    return p0
.end method

.method public isStopMicrophoneRecording()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopMicrophoneRecording:Z

    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "stopAudioMixing="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAudioMixing:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "stopAllEffect="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopAllEffect:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "stopMicrophoneRecording="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean p0, p0, Lio/agora/rtc2/LeaveChannelOptions;->stopMicrophoneRecording:Z

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
