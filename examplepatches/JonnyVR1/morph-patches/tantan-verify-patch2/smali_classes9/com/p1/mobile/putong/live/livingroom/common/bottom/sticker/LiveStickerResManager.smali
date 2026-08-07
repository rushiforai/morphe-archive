.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager$ParseState;
    }
.end annotation


# static fields
.field public static e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;


# instance fields
.field public a:Ljava/util/concurrent/ExecutorService;

.field public b:Ll/byd0;

.field public c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;"
        }
    .end annotation
.end field

.field public volatile d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager$ParseState;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "live-sticker"

    .line 5
    .line 6
    invoke-static {v0}, Ll/idu;->b(Ljava/lang/String;)Ljava/util/concurrent/ExecutorService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->a:Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    new-instance v0, Ll/byd0;

    .line 13
    .line 14
    const-wide/16 v1, -0x1

    .line 15
    .line 16
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "latest_sticker_template_version_code"

    .line 21
    .line 22
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b:Ll/byd0;

    .line 26
    .line 27
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->c:Ljava/util/Map;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager$ParseState;->ORIGIN:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager$ParseState;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->d:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager$ParseState;

    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;JLjava/util/List;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->D(JLjava/util/List;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ll/x1d0;
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->C(Ljava/lang/String;Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Boolean;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->F(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/Boolean;)Landroid/util/Pair;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic i(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic j(Lrx/Notification;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/Notification;->j()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/String;Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ljava/lang/String;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->B(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->E(Ll/gcg0;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/Boolean;)Landroid/util/Pair;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/Boolean;)Landroid/util/Pair;
    .locals 1

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic p(Lcom/alibaba/fastjson/JSONArray;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic q(Lrx/Notification;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->G()V

    return-void
.end method

.method public static w()Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

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
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->e:Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->y(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-nez v2, :cond_2

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->y(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move p0, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :goto_0
    move p0, v3

    .line 32
    :goto_1
    if-eqz v1, :cond_3

    .line 33
    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    return v3

    .line 37
    :cond_3
    return v0
.end method

.method public final synthetic B(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 13
    .line 14
    invoke-interface {p3, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 26
    .line 27
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 28
    .line 29
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    new-instance v2, Ll/jau;

    .line 45
    .line 46
    invoke-direct {v2, p1, p3}, Ll/jau;-><init>(Ljava/lang/String;Ll/gcg0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/kau;

    .line 54
    .line 55
    invoke-direct {v2, p0, p2, p3, p1}, Ll/kau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ll/gcg0;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic C(Ljava/lang/String;Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    new-instance p3, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {p3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->s(Ljava/io/File;)Z

    .line 7
    .line 8
    .line 9
    invoke-interface {p2, p5}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic D(JLjava/util/List;)Ll/uxj0;
    .locals 3

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/tau;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/tau;-><init>(Lcom/alibaba/fastjson/JSONArray;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p3, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    new-instance p3, Ljava/io/File;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {p3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->s(Ljava/io/File;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    .line 38
    .line 39
    invoke-direct {v2, p3}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 40
    .line 41
    .line 42
    :try_start_1
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {v2, p3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catch_0
    move-exception p3

    .line 57
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_0
    move-exception p0

    .line 62
    move-object v1, v2

    .line 63
    goto :goto_2

    .line 64
    :catch_1
    move-exception p3

    .line 65
    move-object v1, v2

    .line 66
    goto :goto_0

    .line 67
    :catchall_1
    move-exception p0

    .line 68
    goto :goto_2

    .line 69
    :catch_2
    move-exception p3

    .line 70
    :goto_0
    :try_start_3
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 71
    .line 72
    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    :try_start_4
    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 76
    .line 77
    .line 78
    :cond_1
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b:Ll/byd0;

    .line 79
    .line 80
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 88
    .line 89
    return-object p0

    .line 90
    :goto_2
    if-eqz v1, :cond_2

    .line 91
    .line 92
    :try_start_5
    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 93
    .line 94
    .line 95
    goto :goto_3

    .line 96
    :catch_3
    move-exception p1

    .line 97
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_3
    throw p0
.end method

.method public final synthetic E(Ll/gcg0;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    invoke-static {v0}, Ll/oki;->A(Ljava/io/File;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/JsonAdapter;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, ""

    .line 38
    .line 39
    invoke-virtual {v0, p0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    :goto_0
    return-void

    .line 54
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->t(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/dau;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/dau;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 46
    .line 47
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->t(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v1, Ll/mau;

    .line 65
    .line 66
    invoke-direct {v1}, Ll/mau;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    :goto_1
    new-instance v1, Ll/nau;

    .line 74
    .line 75
    invoke-direct {v1}, Ll/nau;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, p0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    new-instance v0, Ll/oau;

    .line 83
    .line 84
    invoke-direct {v0, p1}, Ll/oau;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public final synthetic G()V
    .locals 4

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/alibaba/fastjson/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->c:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Ljava/lang/String;

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->c:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->toJson()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v2}, Lcom/alibaba/fastjson/JSON;->parseObject(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, v2}, Lcom/alibaba/fastjson/JSONArray;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 49
    .line 50
    const-string v2, "room_json"

    .line 51
    .line 52
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->s(Ljava/io/File;)Z

    .line 66
    .line 67
    .line 68
    :cond_1
    const/4 p0, 0x0

    .line 69
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    .line 70
    .line 71
    invoke-direct {v2, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 72
    .line 73
    .line 74
    :try_start_1
    invoke-virtual {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v2, p0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/io/Writer;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .line 83
    .line 84
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :catch_0
    move-exception p0

    .line 89
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catchall_0
    move-exception p0

    .line 94
    goto :goto_3

    .line 95
    :catch_1
    move-exception p0

    .line 96
    goto :goto_1

    .line 97
    :catchall_1
    move-exception v0

    .line 98
    move-object v2, p0

    .line 99
    move-object p0, v0

    .line 100
    goto :goto_3

    .line 101
    :catch_2
    move-exception v0

    .line 102
    move-object v2, p0

    .line 103
    move-object p0, v0

    .line 104
    :goto_1
    :try_start_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 105
    .line 106
    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    :try_start_4
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 110
    .line 111
    .line 112
    :cond_2
    :goto_2
    return-void

    .line 113
    :goto_3
    if-eqz v2, :cond_3

    .line 114
    .line 115
    :try_start_5
    invoke-virtual {v2}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 116
    .line 117
    .line 118
    goto :goto_4

    .line 119
    :catch_3
    move-exception v0

    .line 120
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    :goto_4
    throw p0
.end method

.method public H(J)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    cmp-long p1, p1, v0

    .line 14
    .line 15
    if-gtz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->b:Ll/byd0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->y(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 37
    return p0
.end method

.method public I()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/rau;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/rau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public J(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->t(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/uau;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/uau;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->t(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lrx/c;->materialize()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v1, Ll/eau;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/eau;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    const/4 p0, 0x0

    .line 68
    :goto_1
    if-eqz p0, :cond_2

    .line 69
    .line 70
    new-instance v1, Ll/fau;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/fau;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    new-instance v0, Ll/gau;

    .line 80
    .line 81
    invoke-direct {v0, p1}, Ll/gau;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0

    .line 97
    :cond_2
    new-instance p0, Ll/hau;

    .line 98
    .line 99
    invoke-direct {p0, p1}, Ll/hau;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ")",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 5
    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->L(Ljava/util/List;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final L(Ljava/util/List;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            ">;)",
            "Lrx/c<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/lau;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/lau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public M(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/sau;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/sau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final s(Ljava/io/File;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 6
    .line 7
    .line 8
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return p0

    .line 10
    :catch_0
    move-exception p1

    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    return p0
.end method

.method public final t(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/iau;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/iau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public u(Ljava/lang/String;J)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pau;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/pau;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/data/JsonAdapter;->ARRAY_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {v0, p1}, Ll/qi20;->f(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Ll/qau;

    .line 17
    .line 18
    invoke-direct {v0, p0, p2, p3}, Ll/qau;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;J)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public v(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "sticker_path"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public x(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->c:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public final y(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public z(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->y(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x1

    .line 18
    if-nez v2, :cond_2

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/sticker/LiveStickerResManager;->y(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move p0, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_2
    :goto_0
    move p0, v3

    .line 32
    :goto_1
    if-eqz v1, :cond_3

    .line 33
    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    return v3

    .line 37
    :cond_3
    return v0
.end method
