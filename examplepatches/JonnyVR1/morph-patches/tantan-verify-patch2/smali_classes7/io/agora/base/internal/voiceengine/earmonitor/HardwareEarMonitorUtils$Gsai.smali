.class Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils$Gsai;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Gsai"
.end annotation


# static fields
.field static final CLASS_NAME_MEDIA_CLIENT:Ljava/lang/String; = "com.itgsa.opensdk.media.MediaClient"

.field static final METHOD_NAME_CLOSE_KTV_DEVICE:Ljava/lang/String; = "closeKTVDevice"

.field static final METHOD_NAME_INITIALIZE:Ljava/lang/String; = "initialize"

.field static final METHOD_NAME_IS_SUPPORTED:Ljava/lang/String; = "isSupported"

.field static final METHOD_NAME_OPEN_KTV_DEVICE:Ljava/lang/String; = "openKTVDevice"

.field static final METHOD_NAME_SET_MIC_VOL_PARAM:Ljava/lang/String; = "setMicVolParam"

.field static final METHOD_NAME_SET_MIXER_SOUND_TYPE:Ljava/lang/String; = "setMixerSoundType"

.field static final METHOD_NAME_SET_PLAY_FEEDBACK_PARAM:Ljava/lang/String; = "setPlayFeedbackParam"

.field static final MIXER_SOUND_TYPE_KTV_VIVO:I = 0xa

.field static final MIXER_SOUND_TYPE_KTV_XIAOMI:I = 0x3

.field static final PLAY_FEEDBACK_PARAM_OFF:I = 0x0

.field static final PLAY_FEEDBACK_PARAM_ON:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
