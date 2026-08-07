.class public Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$UniqueIdManagerHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "UniqueIdManager"


# instance fields
.field private cachedIds:Lorg/json/JSONObject;

.field private isDebug:Z

.field private pushIdCached:Ljava/lang/String;

.field private uniqueCache:Lcom/cosmos/photon/push/uniqueid/UniqueCache;

.field private uniqueIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/cosmos/photon/push/uniqueid/IUniqueId;",
            ">;"
        }
    .end annotation
.end field

.field private uniqueObject:Lorg/json/JSONObject;


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Lcom/cosmos/photon/push/uniqueid/UniqueMacAddress;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueMacAddress;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 20
    .line 21
    new-instance v1, Lcom/cosmos/photon/push/uniqueid/UniqueDeviceId;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueDeviceId;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 30
    .line 31
    new-instance v1, Lcom/cosmos/photon/push/uniqueid/UniqueIMEI;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueIMEI;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 40
    .line 41
    new-instance v1, Lcom/cosmos/photon/push/uniqueid/UniqueSerialNumber;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/cosmos/photon/push/uniqueid/UniqueSerialNumber;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 50
    .line 51
    new-instance v0, Lcom/cosmos/photon/push/uniqueid/UniqueAndroidId;

    .line 52
    .line 53
    invoke-direct {v0}, Lcom/cosmos/photon/push/uniqueid/UniqueAndroidId;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;-><init>()V

    return-void
.end method

.method public static synthetic access$100(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;)Lcom/cosmos/photon/push/uniqueid/UniqueCache;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueCache:Lcom/cosmos/photon/push/uniqueid/UniqueCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public static getInstance()Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;
    .locals 1

    .line 1
    sget-object v0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$UniqueIdManagerHolder;->uniqueIdManager:Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;

    .line 2
    .line 3
    return-object v0
.end method

.method private seekUniqueId(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueIds:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_3

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/cosmos/photon/push/uniqueid/IUniqueId;

    .line 23
    .line 24
    :try_start_0
    iget-object v3, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 25
    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    new-instance v3, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v3, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catch_0
    move-exception v2

    .line 37
    goto :goto_2

    .line 38
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 39
    .line 40
    invoke-interface {v2}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getTag()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    invoke-interface {v2}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getTag()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-interface {v2, p1}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getUniqueId(Landroid/content/Context;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    invoke-interface {v2, p1}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getUniqueId(Landroid/content/Context;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-nez v4, :cond_0

    .line 75
    .line 76
    invoke-interface {v2}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getTag()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    iget-object v4, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 84
    .line 85
    invoke-interface {v2}, Lcom/cosmos/photon/push/uniqueid/IUniqueId;->getTag()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v4, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :goto_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    new-instance v1, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;

    .line 98
    .line 99
    invoke-direct {v1, p0, p1}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager$1;-><init>(Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;Landroid/content/Context;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Lcom/cosmos/photon/push/util/ThreadUtils;->execute(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    return-object v0
.end method


# virtual methods
.method public getPushID()Ljava/lang/String;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->isDebug:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "uniq_did"

    .line 6
    .line 7
    iget-object v1, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->pushIdCached:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->pushIdCached:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public getUniqueId()Lorg/json/JSONObject;
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->isDebug:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueObject:Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "aIds"

    .line 12
    .line 13
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueObject:Lorg/json/JSONObject;

    .line 17
    .line 18
    return-object p0
.end method

.method public init(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueObject:Lorg/json/JSONObject;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 10
    .line 11
    and-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    iput-boolean v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->isDebug:Z

    .line 19
    .line 20
    new-instance v0, Lcom/cosmos/photon/push/uniqueid/UniqueCache;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/cosmos/photon/push/uniqueid/UniqueCache;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueCache:Lcom/cosmos/photon/push/uniqueid/UniqueCache;

    .line 26
    .line 27
    new-instance v0, Lcom/cosmos/photon/push/uniqueid/UniquePushId;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/cosmos/photon/push/uniqueid/UniquePushId;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1, p2}, Lcom/cosmos/photon/push/uniqueid/UniquePushId;->getPushId(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iput-object p2, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->pushIdCached:Ljava/lang/String;

    .line 37
    .line 38
    iget-object p2, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueCache:Lcom/cosmos/photon/push/uniqueid/UniqueCache;

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/cosmos/photon/push/uniqueid/UniqueCache;->getCacheUniqueId(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iput-object p2, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->cachedIds:Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->seekUniqueId(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/cosmos/photon/push/uniqueid/UniqueIdManager;->uniqueObject:Lorg/json/JSONObject;

    .line 51
    .line 52
    :cond_1
    return-void
.end method
