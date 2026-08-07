.class public Lio/agora/base/internal/voiceengine/earmonitor/VivoHardwareEarMonitor;
.super Lio/agora/base/internal/voiceengine/earmonitor/GsaiHardwareEarMonitor;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "VivoHardwareEarMonitor"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;)V
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/VivoHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lio/agora/base/internal/voiceengine/earmonitor/GsaiHardwareEarMonitor;-><init>(Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getMixerSoundType()I
    .locals 0

    const/16 p0, 0xa

    return p0
.end method
