.class public Lcom/p1/mobile/putong/feed/api/FeedCommonServiceImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/feed/FeedCommonService;


# annotations
.annotation build Lcom/tantanapp/android/injecter/facade/annotation/Route;
    name = "putong-common \u4f7f\u7528\u7684 feed \u670d\u52a1"
    path = "/feed_common_service/service"
.end annotation


# instance fields
.field public a:Ll/m2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dmg;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/dmg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/api/FeedCommonServiceImpl;->a:Ll/m2;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B5(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Video;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/asx;->a()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    iget v0, p2, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 12
    .line 13
    mul-int/lit16 p0, p0, 0x3e8

    .line 14
    .line 15
    int-to-float p0, p0

    .line 16
    cmpg-float p0, v0, p0

    .line 17
    .line 18
    if-gez p0, :cond_0

    .line 19
    .line 20
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-static {p1, p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditAct;->a2(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumVideoEditAct;->L2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Media;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public H0()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance p0, Ll/wzh0;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->DB_ADAPTER:Ll/vzf0;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    const-string v3, "moments"

    .line 8
    .line 9
    invoke-direct {p0, v3, v0, v1, v2}, Ll/wzh0;-><init>(Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->DB_ADAPTER:Ll/vzf0;

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ll/vzf0;->CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public O0(Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/Integer;)Ljava/util/HashSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            "Ljava/lang/Integer;",
            ")",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p1, Lcom/p1/mobile/putong/data/Envelope;->localOptions:I

    .line 11
    .line 12
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    sget v1, Ll/xi5;->MOMENT_IN_FEED:I

    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    and-int/2addr v1, v2

    .line 45
    const/4 v2, 0x1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    move v1, v2

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    const/4 v1, 0x0

    .line 51
    :goto_1
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 52
    .line 53
    iput-boolean v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 54
    .line 55
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-object p0
.end method

.method public R0()Ll/s0y;
    .locals 0

    .line 1
    new-instance p0, Ll/peh;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/peh;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method public nh()Ll/s0y;
    .locals 0

    .line 1
    new-instance p0, Ll/pjh;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/pjh;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
