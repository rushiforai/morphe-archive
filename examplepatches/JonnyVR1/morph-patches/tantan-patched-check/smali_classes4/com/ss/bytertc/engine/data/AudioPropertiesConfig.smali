.class public Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

.field public enableSpectrum:Z

.field public enableVad:Z

.field public enableVoicePitch:Z

.field public interval:I

.field public localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

.field public smooth:F


# direct methods
.method public constructor <init>(I)V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 57
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 58
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioReportMode;->AUDIO_REPORT_MODE_NORMAL:Lcom/ss/bytertc/engine/data/AudioReportMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 59
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->AUDIO_PROPERTIES_MODE_MICROPHONE:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    const/high16 v1, 0x3f800000    # 1.0f

    .line 60
    iput v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    .line 61
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 62
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 3

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 34
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 35
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioReportMode;->AUDIO_REPORT_MODE_NORMAL:Lcom/ss/bytertc/engine/data/AudioReportMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 36
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->AUDIO_PROPERTIES_MODE_MICROPHONE:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    const/high16 v2, 0x3f800000    # 1.0f

    .line 37
    iput v2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    .line 38
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 39
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 40
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 41
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 42
    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    return-void
.end method

.method public constructor <init>(IZZLcom/ss/bytertc/engine/data/AudioReportMode;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 8
    .line 9
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioReportMode;->AUDIO_REPORT_MODE_NORMAL:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 10
    .line 11
    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 12
    .line 13
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->AUDIO_PROPERTIES_MODE_MICROPHONE:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 16
    .line 17
    const/high16 v1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    iput v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 22
    .line 23
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 24
    .line 25
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 26
    .line 27
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 28
    .line 29
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(IZZLcom/ss/bytertc/engine/data/AudioReportMode;F)V
    .locals 2

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 64
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 65
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 66
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioReportMode;->AUDIO_REPORT_MODE_NORMAL:Lcom/ss/bytertc/engine/data/AudioReportMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 67
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->AUDIO_PROPERTIES_MODE_MICROPHONE:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 68
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 69
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 70
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 71
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 72
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 73
    iput p5, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    return-void
.end method

.method public constructor <init>(IZZLcom/ss/bytertc/engine/data/AudioReportMode;FLcom/ss/bytertc/engine/data/AudioPropertiesMode;)V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 44
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 45
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 46
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioReportMode;->AUDIO_REPORT_MODE_NORMAL:Lcom/ss/bytertc/engine/data/AudioReportMode;

    iput-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 47
    sget-object v1, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->AUDIO_PROPERTIES_MODE_MICROPHONE:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 48
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 49
    iput p1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 50
    iput-boolean p2, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 51
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 52
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 53
    iput p5, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->smooth:F

    .line 54
    iput-object p6, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioPropertiesConfig{interval=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->interval:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\'enable_spectrum=\'"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableSpectrum:Z

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "\'enable_vad=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVad:Z

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\'local_main_report_mode=\'"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->localMainReportMode:Lcom/ss/bytertc/engine/data/AudioReportMode;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\'audio_report_mode=\'"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->audioReportMode:Lcom/ss/bytertc/engine/data/AudioPropertiesMode;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/ss/bytertc/engine/data/AudioPropertiesMode;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string v1, "\'enable_voice_pitch=\'"

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/data/AudioPropertiesConfig;->enableVoicePitch:Z

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string p0, "\'}"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method
