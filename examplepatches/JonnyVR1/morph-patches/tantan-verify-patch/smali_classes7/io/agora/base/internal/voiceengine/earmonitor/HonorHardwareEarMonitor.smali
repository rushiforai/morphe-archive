.class public Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/internal/voiceengine/earmonitor/IHardwareEarMonitor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HonorHardwareEarMonitor"


# instance fields
.field private mAudioServiceCallbackImpl:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;

.field private volatile mBindServiceSuccess:Z

.field private mContext:Landroid/content/Context;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private volatile mEarMonitorEnabled:Z

.field private mHnAudioClient:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mHnAudioClientClass:Ljava/lang/Class;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private mHnEarReturnClient:Ljava/lang/Object;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mHnEarReturnClientClass:Ljava/lang/Class;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private volatile mInitialized:Z

.field private volatile mIsDestroyed:Z

.field private mListener:Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private mParamNameClass:Ljava/lang/Class;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private mServiceTypeClass:Ljava/lang/Class;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, p0, v1}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;-><init>(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$1;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mAudioServiceCallbackImpl:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;

    .line 11
    .line 12
    iput-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 13
    .line 14
    iput-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClient:Ljava/lang/Object;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mInitialized:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mIsDestroyed:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mEarMonitorEnabled:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mBindServiceSuccess:Z

    .line 24
    .line 25
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, ">>ctor"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mListener:Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 33
    .line 34
    invoke-static {}, Lio/agora/base/internal/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mContext:Landroid/content/Context;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mIsDestroyed:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->destroyImpl()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->bindService()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;)Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mListener:Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private bindService()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    new-array v3, v2, [Ljava/lang/Class;

    .line 7
    .line 8
    new-array v2, v2, [Ljava/lang/Object;

    .line 9
    .line 10
    const-string v4, "getSupportedServices"

    .line 11
    .line 12
    invoke-static {v0, v1, v4, v3, v2}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/util/List;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Integer;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, 0x1

    .line 41
    if-ne v1, v2, :cond_0

    .line 42
    .line 43
    invoke-direct {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->initHnEarReturnClient()V

    .line 44
    .line 45
    .line 46
    iput-boolean v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mBindServiceSuccess:Z

    .line 47
    .line 48
    sget-object p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, "bind service success"

    .line 51
    .line 52
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private destroyImpl()V
    .locals 6

    .line 1
    const-string v0, "destroy"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClientClass:Ljava/lang/Class;

    .line 4
    .line 5
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClient:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    new-array v4, v3, [Ljava/lang/Class;

    .line 9
    .line 10
    new-array v5, v3, [Ljava/lang/Object;

    .line 11
    .line 12
    invoke-static {v1, v2, v0, v4, v5}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 16
    .line 17
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 18
    .line 19
    new-array v2, v3, [Ljava/lang/Class;

    .line 20
    .line 21
    new-array v3, v3, [Ljava/lang/Object;

    .line 22
    .line 23
    invoke-static {v1, p0, v0, v2, v3}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    sget-object p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "karaoke kit destroy call."

    .line 29
    .line 30
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catchall_0
    move-exception p0

    .line 35
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "destroy failed "

    .line 38
    .line 39
    invoke-static {v0, v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static hasEarMonitorClass()Z
    .locals 3

    .line 1
    const-string v0, "com.hihonor.android.magicx.media.audio.interfaces.HnAudioClient"

    .line 2
    .line 3
    invoke-static {v0}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "com.hihonor.android.magicx.media.audio.interfaces.HnEarReturnClient"

    .line 8
    .line 9
    invoke-static {v1}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "com.hihonor.android.magicx.media.audio.interfaces.IAudioServiceCallback"

    .line 14
    .line 15
    invoke-static {v2}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v0, 0x1

    .line 27
    return v0

    .line 28
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 29
    return v0
.end method

.method private initHnEarReturnClient()V
    .locals 5

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "initHnEarReturnClient"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 9
    .line 10
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 11
    .line 12
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mServiceTypeClass:Ljava/lang/Class;

    .line 13
    .line 14
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v2}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const/4 v4, 0x0

    .line 23
    aget-object v2, v2, v4

    .line 24
    .line 25
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v4, "createService"

    .line 30
    .line 31
    invoke-static {v0, v1, v4, v3, v2}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClient:Ljava/lang/Object;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "karaoke kit destroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mListener:Lio/agora/base/internal/voiceengine/earmonitor/HardwareEarMonitorListener;

    .line 10
    .line 11
    iget-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mInitialized:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mInitialized:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mEarMonitorEnabled:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mBindServiceSuccess:Z

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mIsDestroyed:Z

    .line 25
    .line 26
    invoke-direct {p0}, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->destroyImpl()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public enableHardwareEarMonitor(Z)I
    .locals 8

    .line 1
    const-string v0, "enableKaraokeFeature failed ret "

    .line 2
    .line 3
    sget-object v1, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, ">>enableHardwareEarMonitor "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v2, -0x1

    .line 23
    :try_start_0
    iget-object v3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClientClass:Ljava/lang/Class;

    .line 24
    .line 25
    iget-object v4, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClient:Ljava/lang/Object;

    .line 26
    .line 27
    const-string v5, "enableEarReturn"

    .line 28
    .line 29
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    .line 30
    .line 31
    filled-new-array {v6}, [Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    move-result-object v6

    .line 35
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    filled-new-array {v7}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    invoke-static {v3, v4, v5, v6, v7}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    new-instance p0, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return v2

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    iput-boolean p1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mEarMonitorEnabled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return p0

    .line 77
    :goto_0
    sget-object p1, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 78
    .line 79
    const-string v0, "enableHardwareEarMonitor failed "

    .line 80
    .line 81
    invoke-static {p1, v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    return v2
.end method

.method public initialize()V
    .locals 6

    .line 1
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "HnAudioClient initialize"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mContext:Landroid/content/Context;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string p0, "mContext is null!"

    .line 13
    .line 14
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-boolean v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mInitialized:Z

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const-string p0, "already initialized, ignore"

    .line 23
    .line 24
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :try_start_0
    const-string v1, "com.hihonor.android.magicx.media.audio.interfaces.HnAudioClient"

    .line 29
    .line 30
    invoke-static {v1}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 35
    .line 36
    const-string v1, "com.hihonor.android.magicx.media.audio.interfaces.HnEarReturnClient"

    .line 37
    .line 38
    invoke-static {v1}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClientClass:Ljava/lang/Class;

    .line 43
    .line 44
    const-string v1, "com.hihonor.android.magicx.media.audio.interfaces.IAudioServiceCallback"

    .line 45
    .line 46
    invoke-static {v1}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const-string v2, "com.hihonor.android.magicx.media.audio.interfaces.HnAudioClient$ServiceType"

    .line 51
    .line 52
    invoke-static {v2}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mServiceTypeClass:Ljava/lang/Class;

    .line 57
    .line 58
    const-string v2, "com.hihonor.android.magicx.media.audio.interfaces.HnEarReturnClient$ParameName"

    .line 59
    .line 60
    invoke-static {v2}, Lio/agora/base/internal/ReflectUtils;->safeFindClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mParamNameClass:Ljava/lang/Class;

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-object v4, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mAudioServiceCallbackImpl:Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor$AudioServiceCallbackImpl;

    .line 75
    .line 76
    invoke-static {v2, v3, v4}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-class v3, Landroid/content/Context;

    .line 81
    .line 82
    filled-new-array {v3, v1}, [Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    iget-object v3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 87
    .line 88
    invoke-virtual {v3, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mContext:Landroid/content/Context;

    .line 93
    .line 94
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 103
    .line 104
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 105
    .line 106
    const-string v3, "initialize"

    .line 107
    .line 108
    const/4 v4, 0x0

    .line 109
    new-array v5, v4, [Ljava/lang/Class;

    .line 110
    .line 111
    new-array v4, v4, [Ljava/lang/Object;

    .line 112
    .line 113
    invoke-static {v2, v1, v3, v5, v4}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    const/4 v1, 0x1

    .line 117
    iput-boolean v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mInitialized:Z

    .line 118
    .line 119
    const-string p0, "HnAudioClient initialize success"

    .line 120
    .line 121
    invoke-static {v0, p0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :catchall_0
    sget-object p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 126
    .line 127
    const-string v0, "HnAudioClient initialize failed"

    .line 128
    .line 129
    invoke-static {p0, v0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public isHardwareEarMonitorSupported()Z
    .locals 7

    .line 1
    const-string v0, "earMonitor is"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClientClass:Ljava/lang/Class;

    .line 5
    .line 6
    iget-object v3, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnAudioClient:Ljava/lang/Object;

    .line 7
    .line 8
    const-string v4, "isDeviceSupported"

    .line 9
    .line 10
    const-class v5, Landroid/content/Context;

    .line 11
    .line 12
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    iget-object v6, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mContext:Landroid/content/Context;

    .line 17
    .line 18
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    invoke-static {v2, v3, v4, v5, v6}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    sget-object v3, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v4, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    const-string v0, " "

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    const-string v0, "not "

    .line 47
    .line 48
    :goto_0
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "supported and bind service "

    .line 52
    .line 53
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-boolean v0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mBindServiceSuccess:Z

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    const-string v0, "success"

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string v0, "failed"

    .line 64
    .line 65
    :goto_1
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v3, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    iget-boolean p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mBindServiceSuccess:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_2
    return v1

    .line 84
    :goto_2
    sget-object v0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 85
    .line 86
    const-string v2, "isHardwareEarMonitorSupported false "

    .line 87
    .line 88
    invoke-static {v0, v2, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    return v1
.end method

.method public setHardwareEarMonitorVolume(I)I
    .locals 9

    .line 1
    const-string v0, "setHardwareEarMonitorVolume failed ret "

    .line 2
    .line 3
    iget-boolean v1, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mEarMonitorEnabled:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x7

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v1, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, ">>setHardwareEarMonitorVolume "

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1, v2}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/16 v2, 0x64

    .line 29
    .line 30
    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/4 v3, -0x1

    .line 40
    :try_start_0
    iget-object v4, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClientClass:Ljava/lang/Class;

    .line 41
    .line 42
    iget-object v5, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mHnEarReturnClient:Ljava/lang/Object;

    .line 43
    .line 44
    const-string v6, "setParameter"

    .line 45
    .line 46
    iget-object p0, p0, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->mParamNameClass:Ljava/lang/Class;

    .line 47
    .line 48
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 49
    .line 50
    filled-new-array {p0, v7}, [Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-virtual {p0}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/4 v8, 0x1

    .line 59
    aget-object p0, p0, v8

    .line 60
    .line 61
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v4, v5, v6, v7, p0}, Lio/agora/base/internal/ReflectUtils;->safeCallMethod(Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_1

    .line 80
    .line 81
    new-instance p1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {v1, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .line 95
    .line 96
    return v3

    .line 97
    :catchall_0
    move-exception p0

    .line 98
    goto :goto_0

    .line 99
    :cond_1
    return v2

    .line 100
    :goto_0
    sget-object p1, Lio/agora/base/internal/voiceengine/earmonitor/HonorHardwareEarMonitor;->TAG:Ljava/lang/String;

    .line 101
    .line 102
    const-string v0, "setHardwareEarMonitorVolume failed "

    .line 103
    .line 104
    invoke-static {p1, v0, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return v3
.end method
