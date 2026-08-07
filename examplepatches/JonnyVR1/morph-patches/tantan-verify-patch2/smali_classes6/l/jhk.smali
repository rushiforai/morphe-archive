.class public Ll/jhk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/Group;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 1

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
    iput-object v0, p0, Ll/jhk;->b:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()Lcom/p1/mobile/putong/feed/data/Group;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public g()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopicsModels:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->relatedTopics:Ljava/util/List;

    .line 4
    .line 5
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jhk;->k()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jhk;->k()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-static {v1}, Ll/ksg;->r(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 4
    .line 5
    return p0
.end method

.method public l()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jhk;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jhk;->b:Ljava/util/List;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ljava/lang/String;

    .line 31
    .line 32
    iget-object v2, p0, Ll/jhk;->b:Ljava/util/List;

    .line 33
    .line 34
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 35
    .line 36
    invoke-virtual {v3, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object p0, p0, Ll/jhk;->b:Ljava/util/List;

    .line 45
    .line 46
    return-object p0
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jhk;->a:Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 4
    .line 5
    return p0
.end method
