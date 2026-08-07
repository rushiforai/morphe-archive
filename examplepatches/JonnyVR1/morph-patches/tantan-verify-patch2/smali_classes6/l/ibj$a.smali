.class public Ll/ibj$a;
.super Ll/jv00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ibj;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ibj;


# direct methods
.method public constructor <init>(Ll/ibj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jv00;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 18
    .line 19
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/qn00;->h(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qn00;->f(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 18
    .line 19
    iget-object v1, v1, Ll/n570;->b:Ll/qn00;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {v1, p1}, Ll/qn00;->i(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object p1, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 33
    .line 34
    iget-object p1, p1, Ll/ibj;->f:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    invoke-static {}, Ll/cmg;->t()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 49
    .line 50
    iget-object v0, p1, Ll/n570;->b:Ll/qn00;

    .line 51
    .line 52
    iget-object p1, p1, Ll/ibj;->f:Ljava/util/List;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ll/qn00;->h(Ljava/util/List;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput-object p1, p0, Ll/ibj;->f:Ljava/util/List;

    .line 61
    .line 62
    :cond_1
    return-void
.end method

.method public d(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibj$a;->a:Ll/ibj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/n570;->b:Ll/qn00;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qn00;->g(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
