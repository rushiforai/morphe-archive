.class public Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils$Gsai;,
        Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils$HonorKit;,
        Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils$HuaweiKit;
    }
.end annotation


# static fields
.field public static final HARDWARE_EARMONITOR_STATE_INITIALIZING:I = 0x1

.field public static final HARDWARE_EARMONITOR_STATE_KIT_NOT_INSTALL:I = 0x2

.field public static final HARDWARE_EARMONITOR_STATE_NOT_INITIALIZED:I = 0x0

.field public static final HARDWARE_EARMONITOR_STATE_READY:I = 0x3

.field public static final MANUFACTURER_HONOR:Ljava/lang/String; = "honor"

.field public static final MANUFACTURER_HUAWEI:Ljava/lang/String; = "huawei"

.field public static final MANUFACTURER_OPPO:Ljava/lang/String; = "oppo"

.field public static final MANUFACTURER_VIVO:Ljava/lang/String; = "vivo"

.field public static final MANUFACTURER_XIAOMI:Ljava/lang/String; = "xiaomi"

.field public static final METHOD_NAME_HAS_EAR_MONITOR_CLASS:Ljava/lang/String; = "hasEarMonitorClass"

.field private static State2DescriptionMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;->State2DescriptionMap:Ljava/util/Map;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "HwAudioKit is not initialized, check it later plz"

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;->State2DescriptionMap:Ljava/util/Map;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "HwAudioKit is initializing, check it later plz"

    .line 26
    .line 27
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;->State2DescriptionMap:Ljava/util/Map;

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "HwAudioKit is not installed"

    .line 38
    .line 39
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;->State2DescriptionMap:Ljava/util/Map;

    .line 43
    .line 44
    const/4 v1, 0x3

    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-string v2, "HwAudioKit is ready"

    .line 50
    .line 51
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getDescriptionByState(I)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorUtils;->State2DescriptionMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/String;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "invalid hw earmoitor state"

    .line 17
    .line 18
    return-object p0
.end method
