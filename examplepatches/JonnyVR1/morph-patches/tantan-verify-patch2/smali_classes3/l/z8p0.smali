.class public Ll/z8p0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;Ll/uwl;)V
    .locals 1

    .line 1
    :try_start_0
    instance-of v0, p1, Ll/atm0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/atm0;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/atm0;->k4(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/awr;->d(Ljava/lang/Exception;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static b(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TE;>;",
            "Ljava/util/List<",
            "TE;>;)",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    :cond_1
    return-object v0
.end method

.method public static c(Ljava/util/Collection;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ll/uwl;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/y8p0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/y8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardBean;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d(Ll/i6t;Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 6
    .line 7
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    :goto_0
    if-eqz p1, :cond_4

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_1
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    const-string v0, "liveProfilecard"

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    const-string v0, "live_watcher_profilecard"

    .line 42
    .line 43
    :goto_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getFrom()I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    const/16 v1, 0x258

    .line 48
    .line 49
    if-ne p2, v1, :cond_3

    .line 50
    .line 51
    const-string v0, "liveProfilecard_pkanchor"

    .line 52
    .line 53
    :cond_3
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {p2, p0, v1}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1, v0}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ll/tfs$a;->a()Ll/tfs;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p3, p0}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    :goto_2
    return-void
.end method
