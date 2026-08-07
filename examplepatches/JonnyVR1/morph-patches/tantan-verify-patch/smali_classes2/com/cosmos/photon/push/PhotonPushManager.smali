.class public final Lcom/cosmos/photon/push/PhotonPushManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;,
        Lcom/cosmos/photon/push/PhotonPushManager$SingletonHolder;,
        Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;
    }
.end annotation


# static fields
.field public static APP_ID:Ljava/lang/String; = null

.field public static CHANNEL_MODE:Z = true

.field private static final KEY_PUSH_TYPE:Ljava/lang/String; = "pushType"

.field static final TYPE_ALIAS:I = 0x1

.field static final TYPE_LOGOUT:I = 0x3

.field static final TYPE_REGVENDOR:I = 0x4

.field static final TYPE_TAGS:I = 0x5

.field static final TYPE_UNALIAS:I = 0x2

.field static final TYPE_UNTAGS:I = 0x6

.field private static volatile isInited:Z = false

.field protected static messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver; = null

.field public static uniqueChannel:Z = true


# instance fields
.field private final assistCacheMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;",
            ">;"
        }
    .end annotation
.end field

.field private isFirstForeGround:Z

.field protected isForeGround:Z

.field private lastPushThirdType:I

.field private lastSelfToken:Ljava/lang/String;

.field private lastThirdToken:Ljava/lang/String;

.field private volatile mAlias:Ljava/lang/String;

.field private mCount:I

.field private volatile selfToken:Ljava/lang/String;

.field private volatile thirdToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/service/DefaultMessageReceiver;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/service/DefaultMessageReceiver;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isFirstForeGround:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->assistCacheMap:Ljava/util/Map;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastPushThirdType:I

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/PhotonPushManager$1;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;-><init>()V

    return-void
.end method

.method public static synthetic access$1000(Lcom/cosmos/photon/push/PhotonPushManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isFirstForeGround:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1002(Lcom/cosmos/photon/push/PhotonPushManager;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isFirstForeGround:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$300(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$400(Lcom/cosmos/photon/push/PhotonPushManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->setThirdTokenToServer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$500(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->assistCacheMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$602(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$700(Lcom/cosmos/photon/push/PhotonPushManager;ILcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/PhotonPushManager;->setAssistThirdTokenToServer(ILcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/cosmos/photon/push/PhotonPushManager;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$802(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$900(Lcom/cosmos/photon/push/PhotonPushManager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$908(Lcom/cosmos/photon/push/PhotonPushManager;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$910(Lcom/cosmos/photon/push/PhotonPushManager;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, -0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mCount:I

    .line 6
    .line 7
    return v0
.end method

.method private assistPushType(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/16 p0, 0x69

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const-string p0, "Unknow"

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, "Google"

    .line 9
    .line 10
    return-object p0
.end method

.method private checkInitialization()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-string p0, "MoPush-Init"

    .line 8
    .line 9
    const-string v0, "not init,please init before!!"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method private checkPermission()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "android.permission.READ_PHONE_STATE"

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static getInstance()Lcom/cosmos/photon/push/PhotonPushManager;
    .locals 1

    .line 1
    invoke-static {}, Lcom/cosmos/photon/push/PhotonPushManager$SingletonHolder;->access$100()Lcom/cosmos/photon/push/PhotonPushManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private invalidSelfToken()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "MoPush-ThirdNotify"

    .line 10
    .line 11
    const-string v0, "\u8bf7\u6ce8\u518c\u81ea\u901a\u9053token"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static isInit()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/cosmos/photon/push/PhotonPushManager;->isInited:Z

    .line 2
    .line 3
    return v0
.end method

.method private pushType()Ljava/lang/String;
    .locals 1

    .line 43
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getPushSdk()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->pushType(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private pushType(I)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eq p1, p0, :cond_5

    .line 3
    .line 4
    const/16 p0, 0xa

    .line 5
    .line 6
    if-eq p1, p0, :cond_4

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-eq p1, p0, :cond_3

    .line 10
    .line 11
    const/4 p0, 0x4

    .line 12
    if-eq p1, p0, :cond_2

    .line 13
    .line 14
    const/4 p0, 0x5

    .line 15
    if-eq p1, p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x6

    .line 18
    if-eq p1, p0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x7

    .line 21
    if-eq p1, p0, :cond_5

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_0
    const-string p0, "MEIZU"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const-string p0, "Vivo"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    const-string p0, "Oppo"

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_3
    const-string p0, "Huawei"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_4
    const-string p0, "HONOR"

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_5
    const-string p0, "Xiaomi"

    .line 41
    .line 42
    return-object p0
.end method

.method private setAlias(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iput-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 17
    .line 18
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->alias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    return-void
.end method

.method private declared-synchronized setAssistThirdTokenToServer(ILcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->selfToken:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string p2, "MoPush-ThirdNotify"

    .line 11
    .line 12
    const-string v0, "[%d]\u81ea\u901a\u9053token\u8fd8\u672a\u6ce8\u518c\u6210\u529f"

    .line 13
    .line 14
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p2, v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    const-string p2, "MoPush-ThirdNotify"

    .line 38
    .line 39
    const-string v0, "[%d]\u4e09\u65b9\u8f85\u52a9Push\u8fd8\u672a\u6ce8\u518c\u6210\u529f\uff0c\u6216\u4e0d\u652f\u6301"

    .line 40
    .line 41
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p2, v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return-void

    .line 54
    :cond_1
    :try_start_2
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->lastSelfToken:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v1, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->selfToken:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->lastAssistThirdToken:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    const-string p2, "MoPush-ThirdNotify"

    .line 75
    .line 76
    const-string v0, "[%d]\u4e09\u65b9\u8f85\u52a9Push\u5df2\u6ce8\u518c\u8fc7\uff0c\u5ffd\u7565"

    .line 77
    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-static {p2, v0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
    .line 88
    .line 89
    monitor-exit p0

    .line 90
    return-void

    .line 91
    :cond_2
    :try_start_3
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/PhotonPushManager;->assistPushType(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_3

    .line 100
    .line 101
    const-string p1, "MoPush-ThirdNotify"

    .line 102
    .line 103
    const-string p2, "[%d]assistThirdType invalid"

    .line 104
    .line 105
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    .line 107
    .line 108
    monitor-exit p0

    .line 109
    return-void

    .line 110
    :cond_3
    :try_start_4
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->selfToken:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->lastSelfToken:Ljava/lang/String;

    .line 113
    .line 114
    iget-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v0, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->lastAssistThirdToken:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 119
    .line 120
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 121
    .line 122
    iget-object p2, p2, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v0, v1, p1, p2}, Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 125
    .line 126
    .line 127
    monitor-exit p0

    .line 128
    return-void

    .line 129
    :goto_0
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 130
    throw p1
.end method

.method private declared-synchronized setThirdTokenToServer()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "MoPush-ThirdNotify"

    .line 11
    .line 12
    const-string v1, "\u81ea\u901a\u9053token\u8fd8\u672a\u6ce8\u518c\u6210\u529f"

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "MoPush-ThirdNotify"

    .line 30
    .line 31
    const-string v1, "\u4e09\u65b9Push\u8fd8\u672a\u6ce8\u518c\u6210\u529f\uff0c\u6216\u4e0d\u652f\u6301"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return-void

    .line 38
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastSelfToken:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastThirdToken:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    monitor-exit p0

    .line 59
    return-void

    .line 60
    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastSelfToken:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastThirdToken:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 69
    .line 70
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 71
    .line 72
    iget v2, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastPushThirdType:I

    .line 73
    .line 74
    const/4 v3, -0x1

    .line 75
    if-eq v2, v3, :cond_3

    .line 76
    .line 77
    invoke-direct {p0, v2}, Lcom/cosmos/photon/push/PhotonPushManager;->pushType(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->pushType()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    :goto_0
    iget-object v3, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0, v1, v2, v3}, Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    .line 90
    .line 91
    monitor-exit p0

    .line 92
    return-void

    .line 93
    :goto_1
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 94
    throw v0
.end method

.method private showToast(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v0, Landroid/os/Handler;

    .line 25
    .line 26
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Lcom/cosmos/photon/push/PhotonPushManager$5;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Lcom/cosmos/photon/push/PhotonPushManager$5;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private unAlias(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->removeAlias()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->unAlias(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public init(Landroid/app/Application;Ljava/lang/String;Lcom/cosmos/photon/push/PushMessageReceiver;)V
    .locals 11

    .line 1
    new-instance v0, Lcom/cosmos/photon/push/dns/PushDNSConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/cosmos/photon/push/dns/PushDNSConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/w1c;->c(Landroid/content/Context;Ll/zrl;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/cosmos/photon/push/util/AppContext;->init(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Lcom/cosmos/photon/push/util/AppContext;->setAppId(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lcom/cosmos/photon/push/util/NetUtil;->init(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->init(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->initConfig()V

    .line 30
    .line 31
    .line 32
    sput-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 33
    .line 34
    sput-object p3, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 35
    .line 36
    invoke-static {p3}, Lcom/cosmos/photon/push/util/AppContext;->setMessageReceiver(Lcom/cosmos/photon/push/PushMessageReceiver;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    sput-boolean v0, Lcom/cosmos/photon/push/PhotonPushManager;->isInited:Z

    .line 41
    .line 42
    invoke-virtual {p3}, Lcom/cosmos/photon/push/PushMessageReceiver;->isFcmOpen()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sput-boolean v0, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->mEnableFcmPush:Z

    .line 47
    .line 48
    invoke-static {}, Lcom/cosmos/photon/push/util/AppContext;->isRunningInMainProcess()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    invoke-static {}, Lcom/cosmos/photon/push/LastRegistKeeper;->getInstance()Lcom/cosmos/photon/push/LastRegistKeeper;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/cosmos/photon/push/LastRegistKeeper;->init()V

    .line 59
    .line 60
    .line 61
    new-instance v0, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-direct {v0, p0, v1}, Lcom/cosmos/photon/push/PhotonPushManager$ActivityLife;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;Lcom/cosmos/photon/push/PhotonPushManager$1;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/cosmos/photon/push/PushPreferenceUtils;->getPrefs()Landroid/content/SharedPreferences;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    const-string v1, "p_alias"

    .line 77
    .line 78
    const-string v2, ""

    .line 79
    .line 80
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 85
    .line 86
    const-string v1, "p_token"

    .line 87
    .line 88
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 93
    .line 94
    const-string v1, "t_token"

    .line 95
    .line 96
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 101
    .line 102
    :cond_0
    new-instance v0, Lcom/cosmos/photon/push/PhotonPushManager$1;

    .line 103
    .line 104
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/PhotonPushManager$1;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v0}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->setReporter(Lcom/cosmos/photon/push/thirdparty/IStatisticReporter;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p2}, Lcom/cosmos/photon/push/thirdparty/ThirdPartyEventReporter;->setAppId(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getInstance()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    new-instance v3, Lcom/cosmos/photon/push/PhotonPushManager$2;

    .line 118
    .line 119
    invoke-direct {v3, p0, p3}, Lcom/cosmos/photon/push/PhotonPushManager$2;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;Lcom/cosmos/photon/push/PushMessageReceiver;)V

    .line 120
    .line 121
    .line 122
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isMiPushOpen()Z

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 129
    .line 130
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isHuaweiPushOpen()Z

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 135
    .line 136
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isOppoPushOpen()Z

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 141
    .line 142
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isVivoPushOpen()Z

    .line 143
    .line 144
    .line 145
    move-result v7

    .line 146
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 147
    .line 148
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isMeizuPushOpen()Z

    .line 149
    .line 150
    .line 151
    move-result v8

    .line 152
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 153
    .line 154
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isFcmOpen()Z

    .line 155
    .line 156
    .line 157
    move-result v9

    .line 158
    sget-object p2, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 159
    .line 160
    invoke-virtual {p2}, Lcom/cosmos/photon/push/PushMessageReceiver;->isHonorPushOpen()Z

    .line 161
    .line 162
    .line 163
    move-result v10

    .line 164
    move-object v2, p1

    .line 165
    invoke-virtual/range {v1 .. v10}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->init(Landroid/app/Application;Lcom/cosmos/photon/push/thirdparty/PushBridge;ZZZZZZZ)V

    .line 166
    .line 167
    .line 168
    new-instance p1, Lcom/cosmos/photon/push/PhotonPushManager$3;

    .line 169
    .line 170
    invoke-direct {p1, p0}, Lcom/cosmos/photon/push/PhotonPushManager$3;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    .line 171
    .line 172
    .line 173
    invoke-static {p1}, Lcom/cosmos/photon/push/util/NetUtil;->registerNetChangeReceiver(Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;)V

    .line 174
    .line 175
    .line 176
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkPermission()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-eqz p1, :cond_1

    .line 181
    .line 182
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-nez p1, :cond_1

    .line 189
    .line 190
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 191
    .line 192
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 193
    .line 194
    invoke-static {p1, p0}, Lcom/cosmos/photon/push/ChannelBridge;->start(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    :cond_1
    return-void
.end method

.method public isForeGround()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 2
    .line 3
    return p0
.end method

.method public join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_3

    .line 23
    .line 24
    if-eqz p0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_2
    return-object v0

    .line 32
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const/16 v1, 0x100

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 37
    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_4
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_6

    .line 49
    .line 50
    if-eqz p2, :cond_5

    .line 51
    .line 52
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    :cond_5
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_6
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public logPushClick(Landroid/content/Intent;)V
    .locals 6

    .line 1
    const-string v0, "pushType"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    const/4 v1, -0x1

    .line 12
    :try_start_0
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v2

    .line 18
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 19
    .line 20
    .line 21
    move v2, v1

    .line 22
    :goto_0
    if-ne v2, v1, :cond_1

    .line 23
    .line 24
    :try_start_1
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 38
    :catch_1
    :cond_1
    if-gez v2, :cond_2

    .line 39
    .line 40
    goto/16 :goto_2

    .line 41
    .line 42
    :cond_2
    const/4 v0, 0x1

    .line 43
    if-eq v2, v0, :cond_3

    .line 44
    .line 45
    const/4 v0, 0x2

    .line 46
    if-eq v2, v0, :cond_3

    .line 47
    .line 48
    const/4 v0, 0x3

    .line 49
    if-eq v2, v0, :cond_3

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    if-eq v2, v0, :cond_3

    .line 53
    .line 54
    const/4 v0, 0x6

    .line 55
    if-eq v2, v0, :cond_3

    .line 56
    .line 57
    const/16 v0, 0xa

    .line 58
    .line 59
    if-ne v2, v0, :cond_4

    .line 60
    .line 61
    :cond_3
    const-string v0, ""

    .line 62
    .line 63
    :try_start_2
    const-string v1, "_ext"

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance p1, Lorg/json/JSONObject;

    .line 70
    .line 71
    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const-string v1, "ins_log"

    .line 75
    .line 76
    const-string v3, "0"

    .line 77
    .line 78
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 86
    goto :goto_1

    .line 87
    :catch_2
    move-exception p1

    .line 88
    const-string v1, "MoPush-STATISTIC"

    .line 89
    .line 90
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 91
    .line 92
    .line 93
    const/4 p1, 0x0

    .line 94
    :goto_1
    invoke-static {v2}, Lcom/cosmos/photon/push/DataProcessor;->getPushSource(I)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    new-instance v4, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 103
    .line 104
    invoke-direct {v4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    sget v5, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_CLICKED:I

    .line 112
    .line 113
    invoke-virtual {v4, v5}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    invoke-virtual {v4, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    invoke-virtual {v4, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 122
    .line 123
    .line 124
    move-result-object v4

    .line 125
    invoke-virtual {v4, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v4}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 130
    .line 131
    .line 132
    move-result-object v4

    .line 133
    invoke-static {v4}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 134
    .line 135
    .line 136
    iget-boolean p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->isForeGround:Z

    .line 137
    .line 138
    if-nez p0, :cond_4

    .line 139
    .line 140
    new-instance p0, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->pushSource(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    sget v1, Lcom/cosmos/photon/push/statistic/EventLogBody;->TYPE_FORGROUND_NOT_SHOWN:I

    .line 150
    .line 151
    invoke-virtual {p0, v1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->type(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->uploadType(I)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0, v2, v3}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->time(J)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0, v0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->data(Ljava/lang/String;)Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p0}, Lcom/cosmos/photon/push/statistic/EventLogBody$Builder;->build()Lcom/cosmos/photon/push/statistic/EventLogBody;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-static {p0}, Lcom/cosmos/photon/push/statistic/PushEventStatistic;->logPushEventInfo(Lcom/cosmos/photon/push/statistic/EventLogBody;)V

    .line 172
    .line 173
    .line 174
    :cond_4
    :goto_2
    return-void
.end method

.method public onCommand(IILjava/lang/String;)V
    .locals 1

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveAlias(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x4

    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveThirdToken(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    :goto_0
    sget-object p0, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2, p3}, Lcom/cosmos/photon/push/PushMessageReceiver;->onCommand(IILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onPushClick(Lcom/cosmos/photon/push/notification/MoNotify;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1}, Lcom/cosmos/photon/push/DataProcessor;->onPushClickFromBusiness(Lcom/cosmos/photon/push/notification/MoNotify;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onPushShow(Lcom/cosmos/photon/push/notification/MoNotify;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {p1, p2}, Lcom/cosmos/photon/push/DataProcessor;->onPushShowFromBusiness(Lcom/cosmos/photon/push/notification/MoNotify;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public declared-synchronized onSelfTokenRegistered(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p2, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-static {p2}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveToken(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-static {p4}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveAlias(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    sget-object p4, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 22
    .line 23
    invoke-virtual {p4, p1, p2, p3}, Lcom/cosmos/photon/push/PushMessageReceiver;->onToken(ILjava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p2, p0, Lcom/cosmos/photon/push/PhotonPushManager;->mAlias:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1, p2}, Lcom/cosmos/photon/push/ChannelBridge;->start(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->setThirdTokenToServer()V

    .line 34
    .line 35
    .line 36
    sget-object p1, Lcom/cosmos/photon/push/PhotonPushManager;->messageReceiver:Lcom/cosmos/photon/push/PushMessageReceiver;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/cosmos/photon/push/PushMessageReceiver;->isFcmOpen()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->assistCacheMap:Ljava/util/Map;

    .line 45
    .line 46
    const/16 p2, 0x69

    .line 47
    .line 48
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-object p2, p1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 61
    .line 62
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    iget-object p1, p1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/PhotonPushManager;->setFcmTokenToServer(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .line 72
    .line 73
    :cond_1
    monitor-exit p0

    .line 74
    return-void

    .line 75
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    throw p1
.end method

.method public register()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->registerWithAlias(Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public registerWithAlias(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/cosmos/photon/push/ChannelBridge;->getDeviceId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/cosmos/photon/push/PushPreferenceUtils;->saveDeviceId(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {p0, v0, p1, v1}, Lcom/cosmos/photon/push/PushApi;->register(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->getInstance()Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Lcom/cosmos/photon/push/thirdparty/ThirdPushManager;->register()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public removeTag(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p0, v0, v1, p1}, Lcom/cosmos/photon/push/PushApi;->unTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public removeTagToAlias(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->unTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public removeTags(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, ","

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {p0, v0, v1, p1}, Lcom/cosmos/photon/push/PushApi;->unTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public removeTagsToAlias(Ljava/lang/String;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v0, ","

    .line 27
    .line 28
    invoke-virtual {p0, p2, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->unTags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public setAlias(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->setAlias(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized setFcmTokenToServer(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/16 v0, 0x69

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->assistCacheMap:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/cosmos/photon/push/PhotonPushManager;->assistCacheMap:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    iput-object p1, v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->assistThirdToken:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p1, v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->lastAssistThirdToken:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    const-string p1, "MoPush-ThirdNotify"

    .line 44
    .line 45
    const-string v0, "\u81ea\u901a\u9053token\u8fd8\u672a\u6ce8\u518c\u6210\u529f"

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    monitor-exit p0

    .line 51
    return-void

    .line 52
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v0, v1, Lcom/cosmos/photon/push/PhotonPushManager$AssistPushCache;->selfToken:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 57
    .line 58
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 59
    .line 60
    const-string v2, "Google"

    .line 61
    .line 62
    invoke-static {v0, v1, v2, p1}, Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    monitor-exit p0

    .line 66
    return-void

    .line 67
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 68
    throw p1
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-static {p0, v0, v1, p1}, Lcom/cosmos/photon/push/PushApi;->tags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public setTagToAlias(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->tags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public setTags(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v0, ","

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {p0, v0, v1, p1}, Lcom/cosmos/photon/push/PushApi;->tags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public setTagsToAlias(Ljava/lang/String;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    const-string v0, ","

    .line 27
    .line 28
    invoke-virtual {p0, p2, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p0, v0, p1, p2}, Lcom/cosmos/photon/push/PushApi;->tags(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized setThirdTokenToServer(ILjava/lang/String;)V
    .locals 2

    const-string v0, "QiangGe_666_888_999"

    monitor-enter p0

    const/4 v1, 0x7

    if-ne p1, v1, :cond_0

    .line 95
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 96
    :cond_0
    :goto_0
    iput-object p2, p0, Lcom/cosmos/photon/push/PhotonPushManager;->thirdToken:Ljava/lang/String;

    .line 97
    iput p1, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastPushThirdType:I

    .line 98
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    const-string p1, "MoPush-ThirdNotify"

    const-string p2, "\u81ea\u901a\u9053token\u8fd8\u672a\u6ce8\u518c\u6210\u529f"

    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    .line 101
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    iput-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->lastSelfToken:Ljava/lang/String;

    .line 102
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/PhotonPushManager;->pushType(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1, p2}, Lcom/cosmos/photon/push/PushApi;->regVendor(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public unAlias(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-direct {p0, p1, v0}, Lcom/cosmos/photon/push/PhotonPushManager;->unAlias(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public unRegister()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->invalidSelfToken()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/cosmos/photon/push/PhotonPushManager;->checkInitialization()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/cosmos/photon/push/PhotonPushManager;->selfToken:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v1, Lcom/cosmos/photon/push/PhotonPushManager;->APP_ID:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/cosmos/photon/push/PushApi;->logout(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Lcom/cosmos/photon/push/PhotonPushManager$4;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/PhotonPushManager$4;-><init>(Lcom/cosmos/photon/push/PhotonPushManager;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method
