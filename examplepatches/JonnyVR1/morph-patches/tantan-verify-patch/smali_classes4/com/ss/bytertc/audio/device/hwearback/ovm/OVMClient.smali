.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;
    }
.end annotation


# static fields
.field private static final OPEN_DELAY_TIME:I = 0xc8

.field private static final TAG:Ljava/lang/String; = "OVMClient"

.field private static final WAIT_SERVICE_DELAY_TIME:I = 0x9c4

.field private static volatile sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;


# instance fields
.field private headsetPlugReceiver:Landroid/content/BroadcastReceiver;

.field private mAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

.field private mAuthResultCode:I

.field private mContext:Landroid/content/Context;

.field private mInitCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

.field private mIsHeadsetConnected:Z

.field private mIsSupport:Z

.field private mMediaHelper:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

.field private mNeedDestroyWhenRelease:Z

.field private mRestartAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

.field private mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

.field private postHandler:Landroid/os/Handler;

.field private restartRunnable:Ljava/lang/Runnable;

.field private restoreParamsRunnable:Ljava/lang/Runnable;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 6
    .line 7
    const/4 v1, -0x2

    .line 8
    iput v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthResultCode:I

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mNeedDestroyWhenRelease:Z

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-direct {v1, v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 19
    .line 20
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$1;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mInitCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsHeadsetConnected:Z

    .line 28
    .line 29
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$2;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mRestartAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 35
    .line 36
    new-instance v1, Landroid/os/Handler;

    .line 37
    .line 38
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 46
    .line 47
    new-instance v1, Ll/r850;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/r850;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 50
    .line 51
    .line 52
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restartRunnable:Ljava/lang/Runnable;

    .line 53
    .line 54
    new-instance v1, Ll/s850;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/s850;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParamsRunnable:Ljava/lang/Runnable;

    .line 60
    .line 61
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$3;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->headsetPlugReceiver:Landroid/content/BroadcastReceiver;

    .line 67
    .line 68
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    sget-object v2, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 73
    .line 74
    if-ne v1, v2, :cond_0

    .line 75
    .line 76
    const/4 v0, 0x1

    .line 77
    :cond_0
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mNeedDestroyWhenRelease:Z

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 84
    .line 85
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->initClient(Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "restart media helper"

    .line 5
    .line 6
    const-string v1, "OVMClient"

    .line 7
    .line 8
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->isSupported()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 18
    .line 19
    iget-boolean v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 20
    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$4;->$SwitchMap$com$ss$bytertc$audio$device$base$ManufacturerChecker$Type:[I

    .line 25
    .line 26
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    aget v0, v0, v2

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-eq v0, v2, :cond_3

    .line 38
    .line 39
    const/4 v2, 0x2

    .line 40
    if-eq v0, v2, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 48
    .line 49
    iget-boolean v2, v2, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 50
    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const-string v2, "closeKTVDevice duration restart."

    .line 56
    .line 57
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->openKTVDevice()V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParams(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void

    .line 67
    :cond_3
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mRestartAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 68
    .line 69
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->initMediaHelper(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_4
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v2, "restart with error, return: "

    .line 76
    .line 77
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->isSupported()Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v2, ", "

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 93
    .line 94
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 95
    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic access$100(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthResultCode:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthResultCode:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParamsRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$700(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsHeadsetConnected:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsHeadsetConnected:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restartKTVDevice(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$900(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->clearRestartRunner()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 8
    .line 9
    iget-boolean v1, v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v1, "OVMClient"

    .line 14
    .line 15
    const-string v2, "openKTVDevice duration restore params."

    .line 16
    .line 17
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParams(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private clearRestartRunner()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restartRunnable:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParamsRunnable:Ljava/lang/Runnable;

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private initClient(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "OVMClient"

    .line 2
    .line 3
    const-string v1, "initClient"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 12
    .line 13
    iput-boolean v0, v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->reset()V

    .line 16
    .line 17
    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v2, 0x1f

    .line 21
    .line 22
    if-ge v1, v2, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mInitCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 26
    .line 27
    invoke-direct {p0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->initMediaHelper(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mMediaHelper:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    move v1, v2

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v1, v0

    .line 38
    :goto_0
    iput-boolean v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 39
    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->isDeviceSupportKaraoke()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->isAppSupportKaraoke(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->getVersion()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    const/16 v1, 0x2710

    .line 63
    .line 64
    if-lt p1, v1, :cond_2

    .line 65
    .line 66
    move v0, v2

    .line 67
    :cond_2
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 68
    .line 69
    :cond_3
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->registerHeadsetPlugEvent()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method private initMediaHelper(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->create(Landroid/content/Context;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mMediaHelper:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->addCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 23
    .line 24
    const-string v0, "MEDIA_CLIENT"

    .line 25
    .line 26
    invoke-virtual {p1, p0, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->startAuth(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 32
    .line 33
    .line 34
    const-string p1, "OVMClient"

    .line 35
    .line 36
    const-string v0, "init media helper error"

    .line 37
    .line 38
    invoke-static {p1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static initialize(Landroid/content/Context;)Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    sput-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_2
    sget-object p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 31
    .line 32
    return-object p0
.end method

.method private lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mMediaHelper:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method private needRegisterHeadsetPlug()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->VO:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private registerHeadsetPlugEvent()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->needRegisterHeadsetPlug()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const-string v0, "registerHeadsetPlug"

    .line 17
    .line 18
    const-string v1, "OVMClient"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :try_start_0
    new-instance v0, Landroid/content/IntentFilter;

    .line 24
    .line 25
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v2, "android.intent.action.HEADSET_PLUG"

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->headsetPlugReceiver:Landroid/content/BroadcastReceiver;

    .line 36
    .line 37
    invoke-static {v2, v3, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v2, "state"

    .line 42
    .line 43
    const/16 v3, -0x63

    .line 44
    .line 45
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v2, 0x1

    .line 50
    if-ne v0, v2, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v2, 0x0

    .line 54
    :goto_0
    iput-boolean v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsHeadsetConnected:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    const-string v0, "registerReceiver error"

    .line 59
    .line 60
    invoke-static {v1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_1
    return-void
.end method

.method private restartKTVDevice(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->clearRestartRunner()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restartRunnable:Ljava/lang/Runnable;

    .line 7
    .line 8
    int-to-long v1, p1

    .line 9
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private restoreParams(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "restore params: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "OVMClient"

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 27
    .line 28
    iget v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->playFeedbackParam:I

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setPlayFeedbackParam(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 34
    .line 35
    iget v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->listenRecordSameParam:I

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setListenRecordSame(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 41
    .line 42
    iget v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->micVolumeParam:I

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setMicVolParam(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 48
    .line 49
    iget v0, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->equalizerTypeParam:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setEqualizerType(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 55
    .line 56
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->mixSoundTypeParam:I

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setMixerSoundType(I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private unRegisterHeadsetPlugEvent()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->needRegisterHeadsetPlug()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "unregisterHeadsetPlug"

    .line 13
    .line 14
    const-string v1, "OVMClient"

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mContext:Landroid/content/Context;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->headsetPlugReceiver:Landroid/content/BroadcastReceiver;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    const-string v0, "unregisterReceiver error"

    .line 29
    .line 30
    invoke-static {v1, v0, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public declared-synchronized closeKTVDevice()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "OVMClient"

    .line 3
    .line 4
    const-string v1, "closeKTVDevice"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->clearRestartRunner()V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->closeKTVDevice()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v0
.end method

.method public getKaraokeSupportParameters()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->getKaraokeSupportParameters()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, ""

    .line 13
    .line 14
    return-object p0
.end method

.method public getListenRecordSame()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->getListenRecordSame()I

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getMicVolParam()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->getMicVolParam()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public getPlayFeedbackParam()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->getPlayFeedbackParam()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->getVersion()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method public isAppSupportKaraoke(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->isAppSupportKaraoke(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public isDeviceSupportKaraoke()Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->isDeviceSupportKaraoke()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public isSupported()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSupportedAndAuth()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mIsSupport:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthResultCode:I

    .line 6
    .line 7
    const/16 v0, 0x3e9

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public declared-synchronized openKTVDevice()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "OVMClient"

    .line 3
    .line 4
    const-string v1, "openKTVDevice"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->isKTVDeviceOpen:Z

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->openKTVDevice()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw v0
.end method

.method public release()V
    .locals 3

    .line 1
    const-string v0, "OVMClient"

    .line 2
    .line 3
    const-string v1, "release()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mInitCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->removeCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mRestartAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->removeCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->unRegisterHeadsetPlugEvent()V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->clearRestartRunner()V

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mNeedDestroyWhenRelease:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    const-class v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 37
    .line 38
    monitor-enter v0

    .line 39
    :try_start_0
    const-string v1, "OVMClient"

    .line 40
    .line 41
    const-string v2, "clear sClient"

    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 47
    .line 48
    if-ne v1, p0, :cond_0

    .line 49
    .line 50
    const/4 p0, 0x0

    .line 51
    sput-object p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->sClient:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    :goto_0
    monitor-exit v0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0

    .line 60
    :cond_1
    return-void
.end method

.method public declared-synchronized resetKTVParamsAndUpdate()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "OVMClient"

    .line 3
    .line 4
    const-string v1, "resetKTVParamsAndUpdate"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->reset()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->postHandler:Landroid/os/Handler;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->restoreParamsRunnable:Ljava/lang/Runnable;

    .line 17
    .line 18
    const-wide/16 v2, 0xc8

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method

.method public declared-synchronized setAuthCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthCallback:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 3
    .line 4
    iget v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mAuthResultCode:I

    .line 5
    .line 6
    const/4 v1, -0x2

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, v0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;->onResult(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw p1
.end method

.method public setEqualizerType(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setEqualizerType: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->equalizerTypeParam:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setEqualizerType(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public setListenRecordSame(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setListenRecordSame: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->listenRecordSameParam:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setListenRecordSame(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public setMicVolParam(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMicVolParam: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->micVolumeParam:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setMicVolParam(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public setMixerSoundType(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMixerSoundType: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->mixSoundTypeParam:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setMixerSoundType(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public setPlayFeedbackParam(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setPlayFeedbackParam: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "OVMClient"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->mStorage:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;

    .line 21
    .line 22
    iput p1, v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient$OperateStorage;->playFeedbackParam:I

    .line 23
    .line 24
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMClient;->lockMediaHelper()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMKaraokeMediaHelper;->setPlayFeedbackParam(I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method
