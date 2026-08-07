.class public Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;,
        Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$CommonStatusCodes;
    }
.end annotation


# static fields
.field private static final OPEN_DELAY_TIME:I = 0xc8

.field private static final TAG:Ljava/lang/String; = "OVMAuthManager"

.field private static final authUri:Landroid/net/Uri;

.field private static volatile sInstance:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;


# instance fields
.field private listenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mAuthMessenger:Landroid/os/Messenger;

.field private mAuthResultCode:I

.field private notifyResultRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "content://com.oplus.ocs.out.OpenCapabilityThirdProvider/oplus"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->authUri:Landroid/net/Uri;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, -0x2

    .line 9
    iput v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 10
    .line 11
    new-instance v0, Landroid/os/Messenger;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthMessenger:Landroid/os/Messenger;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->listenerList:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/q850;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/q850;-><init>(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResultRunnable:Ljava/lang/Runnable;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->listenerList:Ljava/util/List;

    .line 5
    .line 6
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;

    .line 25
    .line 26
    iget v2, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 27
    .line 28
    invoke-interface {v1, v2}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;->onResult(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    throw v0
.end method

.method public static getInstance()Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->sInstance:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->sInstance:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->sInstance:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->sInstance:Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;

    .line 27
    .line 28
    return-object v0
.end method

.method private notifyResult()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResultRunnable:Ljava/lang/Runnable;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResultRunnable:Ljava/lang/Runnable;

    .line 12
    .line 13
    const-wide/16 v1, 0xc8

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized addCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->listenerList:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->listenerList:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResult()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-string p1, "OVMAuthManager"

    .line 12
    .line 13
    const-string v0, "handleMessage get bundle is null"

    .line 14
    .line 15
    invoke-static {p1, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string v0, "result_code"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResult()V

    .line 31
    .line 32
    .line 33
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p1
.end method

.method public declared-synchronized removeCallback(Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager$AuthCallback;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->listenerList:Ljava/util/List;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public startAuth(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker;->getManufacturerType()Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;->OP:Lcom/ss/bytertc/audio/device/base/ManufacturerChecker$Type;

    .line 6
    .line 7
    const-string v2, "OVMAuthManager"

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthMessenger:Landroid/os/Messenger;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v3, "callback"

    .line 23
    .line 24
    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 25
    .line 26
    .line 27
    const/4 v1, -0x2

    .line 28
    iput v1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 29
    .line 30
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object v1, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->authUri:Landroid/net/Uri;

    .line 35
    .line 36
    const-string v3, "auth"

    .line 37
    .line 38
    invoke-virtual {p1, v1, v3, p2, v0}, Landroid/content/ContentResolver;->call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception p1

    .line 43
    new-instance p2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v0, "auth error "

    .line 46
    .line 47
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 p1, -0x1

    .line 65
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 66
    .line 67
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResult()V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catch_1
    const-string p1, "url is not exist, do not need auth "

    .line 72
    .line 73
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const/4 p1, -0x3

    .line 77
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 78
    .line 79
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResult()V

    .line 80
    .line 81
    .line 82
    :goto_0
    return-void

    .line 83
    :cond_0
    const-string p1, "no need to auth"

    .line 84
    .line 85
    invoke-static {v2, p1}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const/16 p1, 0x3e9

    .line 89
    .line 90
    iput p1, p0, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->mAuthResultCode:I

    .line 91
    .line 92
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/hwearback/ovm/OVMAuthManager;->notifyResult()V

    .line 93
    .line 94
    .line 95
    return-void
.end method
