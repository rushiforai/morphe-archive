.class public Ll/hrh;
.super Ll/erh;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/erh;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hrh;->h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/frh$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hrh;->i(Ll/frh$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h(Ll/frh$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 7

    .line 1
    iget-object v3, p1, Ll/frh$a;->c:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v0, p1, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    :goto_0
    move v2, v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_0

    .line 14
    :goto_1
    new-instance v4, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v0, "sourcepage"

    .line 20
    .line 21
    sget-object v1, Ll/tel;->J:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p1, Ll/frh$a;->e:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Ll/tel;->K:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_1
    sget-object v0, Ll/tel;->L:Ljava/lang/String;

    .line 34
    .line 35
    :goto_2
    const-string v1, "actiontype"

    .line 36
    .line 37
    invoke-interface {v4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Ll/frh$a;->g:Ll/ttl;

    .line 41
    .line 42
    iget-object v1, p1, Ll/frh$a;->b:Landroid/view/View;

    .line 43
    .line 44
    iget-object v5, p1, Ll/frh$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 45
    .line 46
    invoke-interface {v0, v1, v5}, Ll/ttl;->M2(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/erh;->g(Ll/frh$a;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-boolean v5, p1, Ll/frh$a;->e:Z

    .line 54
    .line 55
    move-object v0, p0

    .line 56
    move-object v6, p1

    .line 57
    invoke-virtual/range {v0 .. v6}, Ll/erh;->f(ZZLcom/p1/mobile/putong/data/User;Ljava/util/Map;ZLl/frh$a;)V

    .line 58
    .line 59
    .line 60
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 61
    .line 62
    return-object p0
.end method

.method public i(Ll/frh$a;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
