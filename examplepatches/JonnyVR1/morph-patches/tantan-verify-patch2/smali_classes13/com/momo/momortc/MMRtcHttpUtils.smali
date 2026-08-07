.class public Lcom/momo/momortc/MMRtcHttpUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;
    }
.end annotation


# static fields
.field private static final JSON:Ll/e7y;

.field private static client:Ll/rg50;

.field private static final ourInstance:Lcom/momo/momortc/MMRtcHttpUtils;


# instance fields
.field private configParamsMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field mmrtcSerConfig:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/momortc/MMRtcHttpUtils;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momo/momortc/MMRtcHttpUtils;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/momo/momortc/MMRtcHttpUtils;->ourInstance:Lcom/momo/momortc/MMRtcHttpUtils;

    .line 7
    .line 8
    const-string v0, "application/json; charset=utf-8"

    .line 9
    .line 10
    invoke-static {v0}, Ll/e7y;->d(Ljava/lang/String;)Ll/e7y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/momo/momortc/MMRtcHttpUtils;->JSON:Ll/e7y;

    .line 15
    .line 16
    new-instance v0, Ll/rg50;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/rg50;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/momo/momortc/MMRtcHttpUtils;->client:Ll/rg50;

    .line 22
    .line 23
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->configParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    new-instance v0, Landroid/os/HandlerThread;

    .line 26
    .line 27
    const-string v1, "rtc_HttpPost"

    .line 28
    .line 29
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 33
    .line 34
    .line 35
    new-instance v1, Landroid/os/Handler;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-direct {v1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mHandler:Landroid/os/Handler;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic a(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 7
    .line 8
    .line 9
    :try_start_0
    const-string v1, "dynamicKey"

    .line 10
    .line 11
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    const-string p1, "channelID"

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    const-string p1, "appID"

    .line 20
    .line 21
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    if-eqz p4, :cond_0

    .line 30
    .line 31
    const/16 p1, -0x64

    .line 32
    .line 33
    const-string p2, "json create"

    .line 34
    .line 35
    invoke-interface {p4, p1, p2}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    :goto_0
    :try_start_1
    const-string p1, "https://live-api.immomo.com/open/httpdns/signalDispatch"

    .line 39
    .line 40
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p0, p1, p2}, Lcom/momo/momortc/MMRtcHttpUtils;->post(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0;

    .line 45
    .line 46
    .line 47
    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 48
    goto :goto_1

    .line 49
    :catch_1
    move-exception p0

    .line 50
    if-eqz p4, :cond_1

    .line 51
    .line 52
    const/16 p1, -0xc8

    .line 53
    .line 54
    const-string p2, "http post"

    .line 55
    .line 56
    invoke-interface {p4, p1, p2}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 60
    .line 61
    .line 62
    const/4 p0, 0x0

    .line 63
    :goto_1
    if-eqz p4, :cond_4

    .line 64
    .line 65
    if-eqz p0, :cond_4

    .line 66
    .line 67
    const-string p1, ""

    .line 68
    .line 69
    :try_start_2
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    if-eqz p2, :cond_2

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2}, Ll/k5d0;->string()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 83
    goto :goto_2

    .line 84
    :catch_2
    move-exception p2

    .line 85
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    const-string v0, "response string"

    .line 90
    .line 91
    invoke-interface {p4, p3, v0}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_2
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    const/16 p3, 0xc8

    .line 102
    .line 103
    if-ne p2, p3, :cond_3

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-interface {p4, p0, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onSuccess(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_3
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-interface {p4, p0, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    :goto_3
    return-void
.end method

.method public static synthetic b(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "https://liverc-cluster-moniter.immomo.com/work/service/httpdns?channelID="

    .line 5
    .line 6
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcHttpUtils;->get(Ljava/lang/String;)Ll/i5d0;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    goto :goto_0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    const/16 p1, -0xc8

    .line 27
    .line 28
    const-string v0, "http post"

    .line 29
    .line 30
    invoke-interface {p2, p1, v0}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    :goto_0
    if-eqz p2, :cond_3

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const-string p1, ""

    .line 42
    .line 43
    :try_start_1
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 57
    goto :goto_1

    .line 58
    :catch_1
    move-exception v0

    .line 59
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const-string v2, "response string"

    .line 64
    .line 65
    invoke-interface {p2, v1, v2}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 69
    .line 70
    .line 71
    :cond_1
    :goto_1
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    const/16 v1, 0xc8

    .line 76
    .line 77
    if-ne v0, v1, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-interface {p2, p0, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onSuccess(ILjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_2
    invoke-virtual {p0}, Ll/i5d0;->q()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    invoke-interface {p2, p0, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_2
    return-void
.end method

.method public static getInstance()Lcom/momo/momortc/MMRtcHttpUtils;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/momortc/MMRtcHttpUtils;->ourInstance:Lcom/momo/momortc/MMRtcHttpUtils;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ll/i5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object p1, Lcom/momo/momortc/MMRtcHttpUtils;->client:Ll/rg50;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getDemoSignalServer(Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/pnw;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Ll/pnw;-><init>(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public post(Ljava/lang/String;Ljava/lang/String;)Ll/i5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object p0, Lcom/momo/momortc/MMRtcHttpUtils;->JSON:Ll/e7y;

    .line 2
    .line 3
    invoke-static {p0, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p2, Ll/x1d0$a;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/x1d0$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget-object p1, Lcom/momo/momortc/MMRtcHttpUtils;->client:Ll/rg50;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public post(Ljava/lang/String;Ll/l1j;)Ll/i5d0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    new-instance p0, Ll/x1d0$a;

    invoke-direct {p0}, Ll/x1d0$a;-><init>()V

    .line 36
    invoke-virtual {p0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    move-result-object p0

    .line 37
    invoke-virtual {p0, p2}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    move-result-object p0

    .line 39
    sget-object p1, Lcom/momo/momortc/MMRtcHttpUtils;->client:Ll/rg50;

    invoke-virtual {p1, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    move-result-object p0

    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    move-result-object p0

    return-object p0
.end method

.method public postSignalDispatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/onw;

    .line 4
    .line 5
    move-object v2, p0

    .line 6
    move-object v5, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    move-object v6, p4

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/onw;-><init>(Lcom/momo/momortc/MMRtcHttpUtils;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public postSignalDispatchEx(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;Z)V
    .locals 11

    .line 1
    move-object/from16 v0, p5

    .line 2
    .line 3
    move-object/from16 v1, p6

    .line 4
    .line 5
    const-string v2, "time"

    .line 6
    .line 7
    const-string v3, "random"

    .line 8
    .line 9
    const-string v4, "appid"

    .line 10
    .line 11
    const-string v5, "secret"

    .line 12
    .line 13
    const/16 v6, -0x64

    .line 14
    .line 15
    const-string v7, "appID"

    .line 16
    .line 17
    const-string v8, "channelID"

    .line 18
    .line 19
    const-string v9, "dynamicKey"

    .line 20
    .line 21
    if-nez p7, :cond_1

    .line 22
    .line 23
    :try_start_0
    iget-object v2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    invoke-virtual {v2, v9, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 34
    .line 35
    invoke-virtual {p2, v8, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    iget-object p2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 39
    .line 40
    invoke-virtual {p2, v7, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catch_0
    move-exception v0

    .line 45
    move-object p1, v0

    .line 46
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 47
    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    const-string p1, "json create 70"

    .line 52
    .line 53
    invoke-interface {v1, v6, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    :goto_0
    const-string p1, "https://live-api.immomo.com/open/httpdns/signalDispatch"

    .line 57
    .line 58
    goto/16 :goto_4

    .line 59
    .line 60
    :cond_1
    :try_start_1
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v10}, Ljava/util/List;->clear()V

    .line 63
    .line 64
    .line 65
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v10, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v10, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v10, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {v10, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 101
    .line 102
    invoke-static {v10}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 103
    .line 104
    .line 105
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 106
    .line 107
    invoke-virtual {v10}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 108
    .line 109
    .line 110
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 111
    .line 112
    invoke-virtual {v10}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 113
    .line 114
    .line 115
    iget-object v10, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 116
    .line 117
    invoke-virtual {v10, v9, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    iget-object p2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 121
    .line 122
    invoke-virtual {p2, v8, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    iget-object p2, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 126
    .line 127
    invoke-virtual {p2, v7, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 131
    .line 132
    invoke-static {}, Ll/fvx;->s()J

    .line 133
    .line 134
    .line 135
    move-result-wide v7

    .line 136
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-virtual {p1, v3, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 144
    .line 145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 146
    .line 147
    .line 148
    move-result-wide v7

    .line 149
    const-wide/16 v9, 0x3e8

    .line 150
    .line 151
    div-long/2addr v7, v9

    .line 152
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {p1, v2, p2}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 160
    .line 161
    invoke-virtual {p1, v4, p3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    iget-object p1, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 165
    .line 166
    invoke-virtual {p1, v5, p4}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    new-instance p1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    .line 173
    .line 174
    new-instance p2, Ll/l1j$a;

    .line 175
    .line 176
    invoke-direct {p2}, Ll/l1j$a;-><init>()V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerConfig:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-eqz v2, :cond_3

    .line 190
    .line 191
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    check-cast v2, Ljava/lang/String;

    .line 196
    .line 197
    iget-object v3, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 198
    .line 199
    invoke-virtual {v3, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v4

    .line 212
    if-nez v4, :cond_2

    .line 213
    .line 214
    invoke-virtual {p2, v2, v3}, Ll/l1j$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/l1j$a;

    .line 215
    .line 216
    .line 217
    goto :goto_1

    .line 218
    :catch_1
    move-exception v0

    .line 219
    move-object p1, v0

    .line 220
    goto :goto_2

    .line 221
    :cond_3
    iget-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 222
    .line 223
    const-string v2, "sign"

    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-static {p1}, Ll/fvx;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-virtual {v0, v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p2}, Ll/l1j$a;->b()Ll/l1j;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :goto_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 245
    .line 246
    .line 247
    if-eqz v1, :cond_4

    .line 248
    .line 249
    const-string p1, "json create 114"

    .line 250
    .line 251
    invoke-interface {v1, v6, p1}, Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;->onError(ILjava/lang/String;)V

    .line 252
    .line 253
    .line 254
    :cond_4
    :goto_3
    const-string p1, "https://schedule-media.immomo.com/api/media/signalDispatch"

    .line 255
    .line 256
    :goto_4
    new-instance p2, Ll/pof0;

    .line 257
    .line 258
    iget-object v0, p0, Lcom/momo/momortc/MMRtcHttpUtils;->mmrtcSerParamsMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 259
    .line 260
    const/4 v2, 0x0

    .line 261
    invoke-direct {p2, p1, v0, v2}, Ll/pof0;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    .line 262
    .line 263
    .line 264
    new-instance p1, Lcom/momo/momortc/MMRtcHttpUtils$1;

    .line 265
    .line 266
    invoke-direct {p1, p0, v1}, Lcom/momo/momortc/MMRtcHttpUtils$1;-><init>(Lcom/momo/momortc/MMRtcHttpUtils;Lcom/momo/momortc/MMRtcHttpUtils$MMRtcHttpCallback;)V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p2, p1}, Ll/ir2;->g(Ll/b2d0;)V

    .line 270
    .line 271
    .line 272
    return-void
.end method
