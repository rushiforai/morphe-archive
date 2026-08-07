.class public Ll/nn4;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nn4;->k()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_6

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x1

    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move v0, v1

    .line 32
    goto :goto_1

    .line 33
    :cond_2
    :goto_0
    move v0, v2

    .line 34
    :goto_1
    iget-object v3, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    iget-object v4, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 37
    .line 38
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->getRecommendMessage()Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-static {v3, v4}, Ll/k1l;->a(Lcom/p1/mobile/putong/data/User;Ljava/util/List;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    return v1

    .line 53
    :cond_3
    if-eqz v0, :cond_4

    .line 54
    .line 55
    return v1

    .line 56
    :cond_4
    iget-object p0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUserLikeMe()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_5

    .line 63
    .line 64
    return v1

    .line 65
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->M8()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_6

    .line 74
    .line 75
    return v2

    .line 76
    :cond_6
    :goto_2
    return v1
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "user_state"

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4;->b:Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userState:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 6
    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/rql;->M()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
