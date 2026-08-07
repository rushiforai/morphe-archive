.class public abstract Ll/yel0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z


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

.method public static a(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Envelope;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, p0, v1}, Ll/jka;->Q6(Lcom/p1/mobile/putong/data/Envelope;Z)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    if-eqz v4, :cond_0

    .line 49
    .line 50
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lcom/p1/mobile/putong/data/Music;

    .line 55
    .line 56
    iget-object v5, v4, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v6, v2, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    if-eqz v5, :cond_1

    .line 65
    .line 66
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-lez v5, :cond_1

    .line 73
    .line 74
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 75
    .line 76
    const/4 v6, 0x0

    .line 77
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    instance-of v5, v5, Lcom/p1/mobile/putong/data/Video;

    .line 82
    .line 83
    if-eqz v5, :cond_1

    .line 84
    .line 85
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v5

    .line 91
    check-cast v5, Lcom/p1/mobile/putong/data/Video;

    .line 92
    .line 93
    iput-object v4, v5, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    return-object v0
.end method

.method public static c(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 8
    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/yel0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public abstract d()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Live;",
            ">;>;>;"
        }
    .end annotation
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/yel0;->a:Z

    .line 2
    .line 3
    return-void
.end method
