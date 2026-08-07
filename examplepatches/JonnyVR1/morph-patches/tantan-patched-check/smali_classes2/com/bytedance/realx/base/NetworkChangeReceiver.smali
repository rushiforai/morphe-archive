.class public Lcom/bytedance/realx/base/NetworkChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;
    }
.end annotation


# static fields
.field private static final NETWORK_TYPE_DISCONNECTED:I = 0x0

.field private static final NETWORK_TYPE_LAN:I = 0x1

.field private static final NETWORK_TYPE_MOBILE_2G:I = 0x3

.field private static final NETWORK_TYPE_MOBILE_3G:I = 0x4

.field private static final NETWORK_TYPE_MOBILE_4G:I = 0x5

.field private static final NETWORK_TYPE_MOBILE_5G:I = 0x6

.field private static final NETWORK_TYPE_UNKNOWN:I = -0x1

.field private static final NETWORK_TYPE_WIFI:I = 0x2

.field private static final TAG:Ljava/lang/String; = "NetworkChangeReceiver"

.field public static threadLock:Ljava/lang/Object;


# instance fields
.field private firstChanged:Z

.field private mContext:Landroid/content/Context;

.field private final nativeNetworkReceiver:J

.field private networkChangeIntent:Landroid/content/Intent;

.field private networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private sNetworkType:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkChangeIntent:Landroid/content/Intent;

    .line 6
    .line 7
    sget-object v0, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->NONE:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->sNetworkType:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->firstChanged:Z

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "init, nativeNetworkReceiver: "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "NetworkChangeReceiver"

    .line 29
    .line 30
    invoke-static {v1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/bytedance/realx/base/ContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->mContext:Landroid/content/Context;

    .line 38
    .line 39
    iput-wide p1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->nativeNetworkReceiver:J

    .line 40
    .line 41
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static synthetic access$000(Lcom/bytedance/realx/base/NetworkChangeReceiver;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->firstChanged:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/bytedance/realx/base/NetworkChangeReceiver;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->getNetworkTypeInternal()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getConstantNetworkType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;->isAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-direct {p0, p1}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->getType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private getNetworkTypeInternal()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkChangeIntent:Landroid/content/Intent;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getNetworkType(Landroid/content/Context;Landroid/content/Intent;)Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkChangeIntent:Landroid/content/Intent;

    .line 11
    .line 12
    new-instance v1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "GetNetworkType, networkType\uff1a "

    .line 15
    .line 16
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "NetworkChangeReceiver"

    .line 27
    .line 28
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->firstChanged:Z

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->sNetworkType:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 36
    .line 37
    if-eq v1, v0, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void

    .line 41
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 42
    iput-boolean v1, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->firstChanged:Z

    .line 43
    .line 44
    invoke-direct {p0, v0}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->getConstantNetworkType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {}, Lcom/bytedance/realx/base/NetworkTypeUtils;->getDebugInfo()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-wide v3, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->nativeNetworkReceiver:J

    .line 53
    .line 54
    invoke-direct {p0, v1, v2, v3, v4}, Lcom/bytedance/realx/base/NetworkChangeReceiver;->nativeSetNetworkType(ILjava/lang/String;J)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->sNetworkType:Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;

    .line 58
    .line 59
    return-void
.end method

.method private getType(Lcom/bytedance/realx/base/NetworkTypeUtils$NetworkType;)I
    .locals 0

    .line 1
    sget-object p0, Lcom/bytedance/realx/base/NetworkChangeReceiver$1;->$SwitchMap$com$bytedance$realx$base$NetworkTypeUtils$NetworkType:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const/4 p0, -0x1

    .line 13
    return p0

    .line 14
    :pswitch_0
    const/4 p0, 0x6

    .line 15
    return p0

    .line 16
    :pswitch_1
    const/4 p0, 0x5

    .line 17
    return p0

    .line 18
    :pswitch_2
    const/4 p0, 0x4

    .line 19
    return p0

    .line 20
    :pswitch_3
    const/4 p0, 0x3

    .line 21
    return p0

    .line 22
    :pswitch_4
    const/4 p0, 0x2

    .line 23
    return p0

    .line 24
    :pswitch_5
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    nop

    .line 27
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private native nativeSetNetworkType(ILjava/lang/String;J)V
.end method


# virtual methods
.method public StartDetect()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 6
    .line 7
    const-string v1, "NetworkTypeThread"

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;-><init>(Lcom/bytedance/realx/base/NetworkChangeReceiver;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public StopDetect()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;->stopThread()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkTypeThread:Lcom/bytedance/realx/base/NetworkChangeReceiver$NetworkTypeThread;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->mContext:Landroid/content/Context;

    .line 17
    .line 18
    invoke-static {v0, p0}, Lcom/bytedance/realx/base/NetworkTypeUtils;->unregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    const-string p1, "NetworkChangeReceiver"

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "onReceive, action: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

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
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "android.net.conn.CONNECTIVITY_CHANGE"

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const-string p1, "android.net.wifi.WIFI_STATE_CHANGED"

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    const-string p1, "android.net.wifi.STATE_CHANGE"

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    return-void

    .line 62
    :cond_1
    :goto_0
    sget-object p1, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 63
    .line 64
    monitor-enter p1

    .line 65
    :try_start_0
    iput-object p2, p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->networkChangeIntent:Landroid/content/Intent;

    .line 66
    .line 67
    sget-object p0, Lcom/bytedance/realx/base/NetworkChangeReceiver;->threadLock:Ljava/lang/Object;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 70
    .line 71
    .line 72
    monitor-exit p1

    .line 73
    return-void

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    throw p0
.end method
