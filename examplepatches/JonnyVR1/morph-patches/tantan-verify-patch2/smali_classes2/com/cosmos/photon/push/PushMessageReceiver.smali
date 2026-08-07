.class public abstract Lcom/cosmos/photon/push/PushMessageReceiver;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private imageLoader:Lcom/cosmos/photon/push/image/ImageLoader;


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

.method public static synthetic access$000(Lcom/cosmos/photon/push/PushMessageReceiver;)Lcom/cosmos/photon/push/image/ImageLoader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushMessageReceiver;->imageLoader:Lcom/cosmos/photon/push/image/ImageLoader;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public getLargeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/PushMessageReceiver;->imageLoader:Lcom/cosmos/photon/push/image/ImageLoader;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "mmpush_disk_cache"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance v1, Lcom/cosmos/photon/push/image/ImageLoader$Builder;

    .line 30
    .line 31
    invoke-direct {v1}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v0}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->diskCacheDirectory(Ljava/io/File;)Lcom/cosmos/photon/push/image/ImageLoader$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-wide/32 v1, 0x8000000

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxDiskSize(J)Lcom/cosmos/photon/push/image/ImageLoader$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-wide/32 v1, 0x1c2000

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1, v2}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->maxMemSize(J)Lcom/cosmos/photon/push/image/ImageLoader$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lcom/cosmos/photon/push/image/ImageLoader$Builder;->build()Lcom/cosmos/photon/push/image/ImageLoader;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iput-object v0, p0, Lcom/cosmos/photon/push/PushMessageReceiver;->imageLoader:Lcom/cosmos/photon/push/image/ImageLoader;

    .line 57
    .line 58
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Lcom/cosmos/photon/push/PushMessageReceiver$1;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PushMessageReceiver$1;-><init>(Lcom/cosmos/photon/push/PushMessageReceiver;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    iget-object p0, p0, Lcom/cosmos/photon/push/PushMessageReceiver;->imageLoader:Lcom/cosmos/photon/push/image/ImageLoader;

    .line 71
    .line 72
    const/16 v0, 0x60

    .line 73
    .line 74
    invoke-virtual {p0, p1, v0, v0}, Lcom/cosmos/photon/push/image/ImageLoader;->syncLoadBitmap(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method

.method public getSmallIcon(Ljava/lang/String;)I
    .locals 0

    const p0, 0x1080077

    return p0
.end method

.method public abstract isFcmOpen()Z
.end method

.method public abstract isHonorPushOpen()Z
.end method

.method public abstract isHuaweiPushOpen()Z
.end method

.method public abstract isMeizuPushOpen()Z
.end method

.method public abstract isMiPushOpen()Z
.end method

.method public abstract isOppoPushOpen()Z
.end method

.method public abstract isVivoPushOpen()Z
.end method

.method public abstract onCommand(IILjava/lang/String;)V
.end method

.method public onGetTokenResult(ZLjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onNotificationMessageClicked(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onNotificationShow(Lcom/cosmos/photon/push/notification/MoNotify;)Z
    .locals 0

    .line 1
    iget p0, p1, Lcom/cosmos/photon/push/notification/MoNotify;->backgroundShow:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager;->getInstance()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public onReceivePassThroughMessage(Lcom/cosmos/photon/push/msg/MoMessage;)V
    .locals 0

    return-void
.end method

.method public onThirdPushRegisterResult(IILjava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public abstract onToken(ILjava/lang/String;Ljava/lang/String;)V
.end method
