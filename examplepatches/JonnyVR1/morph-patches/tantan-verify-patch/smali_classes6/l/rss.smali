.class public Ll/rss;
.super Ll/yel0;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/yel0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Ll/rss;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rss;->g(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method private synthetic g(Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;
    .locals 1

    .line 1
    invoke-static {p1}, Ll/yel0;->c(Lcom/p1/mobile/putong/data/Envelope;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Ll/yel0;->e(Z)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ll/yel0;->e(Z)V

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-static {p1}, Ll/yel0;->a(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method


# virtual methods
.method public d()Lrx/c;
    .locals 2
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

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Envelope;->new_()Lcom/p1/mobile/putong/data/Envelope;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/qss;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/qss;-><init>(Ll/rss;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method
