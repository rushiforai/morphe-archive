.class public Ll/v9d0;
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

.method public static synthetic a(Ll/e9d0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/e9d0;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ljava/util/List;Ll/d3q;)V
    .locals 2

    .line 1
    instance-of v0, p1, Ll/jad0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    check-cast p1, Ll/jad0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jad0;->H()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p1, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->userRightId:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->userRightId:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "equip"

    .line 24
    .line 25
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->action:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    :goto_0
    invoke-virtual {p1}, Ll/jad0;->I()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p1, p1, Ll/jad0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;->userRightId:Ljava/lang/String;

    .line 42
    .line 43
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->userRightId:Ljava/lang/String;

    .line 44
    .line 45
    const-string p1, "unequip"

    .line 46
    .line 47
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultItem;->action:Ljava/lang/String;

    .line 48
    .line 49
    :cond_1
    if-eqz v0, :cond_2

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public static synthetic c(ZLl/e9d0;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Ll/e9d0;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic d(Ljava/util/List;Ll/e9d0;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/d9d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/d9d0;

    .line 6
    .line 7
    iget-object v0, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;->isEquipped()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/d9d0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 16
    .line 17
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;)V
    .locals 1

    .line 1
    new-instance v0, Ll/jad0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/jad0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic f(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Ll/thk0;
    .locals 1

    .line 1
    new-instance v0, Ll/thk0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static g(Landroid/content/Context;Ll/a9d0;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/a9d0;",
            "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    invoke-virtual {p1}, Ll/a9d0;->b()Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/a9d0;->d()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    new-instance v1, Ll/tad0;

    .line 24
    .line 25
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->getEquipNotice(Landroid/content/Context;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-direct {v1, p0}, Ll/tad0;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-virtual {p1}, Ll/a9d0;->b()Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p2, Ll/t9d0;

    .line 40
    .line 41
    invoke-direct {p2, v0}, Ll/t9d0;-><init>(Ljava/util/List;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ll/a9d0;->c()Lcom/p1/mobile/putong/data/Pagination;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Pagination;->lastPage:Z

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    new-instance p0, Ll/sad0;

    .line 56
    .line 57
    invoke-direct {p0}, Ll/sad0;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;",
            "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
            "Ll/j9d0;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/k9d0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    const/4 p3, 0x1

    .line 10
    invoke-static {p0, p1, p2, p3}, Ll/v9d0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;Z)Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const/4 p3, 0x0

    .line 16
    invoke-static {p0, p1, p2, p3}, Ll/v9d0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;Z)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static i(Ljava/util/List;)Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;)",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultList;"
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
    new-instance v1, Ll/r9d0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/r9d0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultList;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultList;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRightAnchorResultList;->userRightActions:Ljava/util/List;

    .line 19
    .line 20
    return-object p0
.end method

.method public static j(Landroid/os/Bundle;Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
            ">;)",
            "Ljava/util/List<",
            "Ll/thk0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "live_mode"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/thk0;

    .line 14
    .line 15
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/thk0;

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 23
    .line 24
    invoke-direct {v2, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 25
    .line 26
    .line 27
    new-instance v3, Ll/thk0;

    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 30
    .line 31
    invoke-direct {v3, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 32
    .line 33
    .line 34
    new-instance v4, Ll/thk0;

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CHAT_UNDER_SHADE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 37
    .line 38
    invoke-direct {v4, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 39
    .line 40
    .line 41
    new-instance v5, Ll/thk0;

    .line 42
    .line 43
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->PROFILE_CARD_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 44
    .line 45
    invoke-direct {v5, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 46
    .line 47
    .line 48
    new-instance v6, Ll/thk0;

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 51
    .line 52
    invoke-direct {v6, p0, p1}, Ll/thk0;-><init>(Landroid/os/Bundle;Lcom/p1/mobile/putong/live/base/bean/UserRightType;)V

    .line 53
    .line 54
    .line 55
    filled-new-array/range {v1 .. v6}, [Ll/thk0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_0
    new-instance v0, Ll/p9d0;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/p9d0;-><init>(Landroid/os/Bundle;)V

    .line 67
    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;Z)Ljava/util/List;
    .locals 16
    .param p0    # Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;",
            "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
            "Ll/j9d0;",
            "Z)",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    new-instance v8, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/v9d0;->l(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    new-instance v3, Ll/ycd0;

    .line 19
    .line 20
    invoke-direct {v3, v1, v2}, Ll/ycd0;-><init>(Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ll/j9d0;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {}, Ll/v9d0;->p()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-static {}, Ll/v9d0;->p()Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v9

    .line 34
    const/4 v10, 0x1

    .line 35
    const/4 v11, 0x0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    new-instance v0, Ll/scd0;

    .line 39
    .line 40
    invoke-direct {v0, v3, v2, v11, v10}, Ll/scd0;-><init>(Ljava/util/List;Ll/j9d0;ZZ)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-interface {v3, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/e9d0;

    .line 51
    .line 52
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    new-instance v0, Ll/scd0;

    .line 56
    .line 57
    invoke-direct {v0, v9, v2, v10, v10}, Ll/scd0;-><init>(Ljava/util/List;Ll/j9d0;ZZ)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    invoke-interface {v9, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ll/e9d0;

    .line 68
    .line 69
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    return-object v8

    .line 73
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getDisplayParam()Ll/dbd0;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    invoke-virtual {v4}, Ll/dbd0;->a()Z

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    if-eqz v5, :cond_2

    .line 84
    .line 85
    move v12, v10

    .line 86
    goto :goto_0

    .line 87
    :cond_2
    move v12, v11

    .line 88
    :goto_0
    if-eqz v4, :cond_3

    .line 89
    .line 90
    invoke-virtual {v4}, Ll/dbd0;->b()Z

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    if-eqz v4, :cond_3

    .line 95
    .line 96
    move v13, v10

    .line 97
    goto :goto_1

    .line 98
    :cond_3
    move v13, v11

    .line 99
    :goto_1
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->multiple:Ljava/util/List;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getRoomId()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v5

    .line 105
    invoke-static {v4, v1, v5, v11, v2}, Ll/v9d0;->t(Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;ZLl/j9d0;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->single:Ljava/util/List;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getRoomId()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-static {v5, v1, v6, v10, v2}, Ll/v9d0;->t(Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;ZLl/j9d0;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v14

    .line 119
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-eqz v5, :cond_4

    .line 124
    .line 125
    invoke-static {v14}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    if-eqz v5, :cond_4

    .line 130
    .line 131
    move v15, v10

    .line 132
    goto :goto_2

    .line 133
    :cond_4
    move v15, v11

    .line 134
    :goto_2
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    if-eqz v5, :cond_5

    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_5
    move-object v3, v4

    .line 142
    :goto_3
    invoke-static {v1}, Ll/v9d0;->m(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-eqz v5, :cond_6

    .line 147
    .line 148
    invoke-static {v4, v11}, Ll/v9d0;->n(Ljava/util/List;Z)Ll/zbd0;

    .line 149
    .line 150
    .line 151
    move-result-object v4

    .line 152
    invoke-interface {v3, v11, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_6
    new-instance v2, Ll/scd0;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getAnchorName()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    if-nez v15, :cond_8

    .line 162
    .line 163
    if-eqz v12, :cond_7

    .line 164
    .line 165
    goto :goto_4

    .line 166
    :cond_7
    move v7, v11

    .line 167
    goto :goto_5

    .line 168
    :cond_8
    :goto_4
    move v7, v10

    .line 169
    :goto_5
    const/4 v6, 0x0

    .line 170
    move-object/from16 v4, p2

    .line 171
    .line 172
    invoke-direct/range {v2 .. v7}, Ll/scd0;-><init>(Ljava/util/List;Ll/j9d0;Ljava/lang/String;ZZ)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    if-eqz v12, :cond_9

    .line 179
    .line 180
    invoke-interface {v8, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 181
    .line 182
    .line 183
    :cond_9
    if-eqz v15, :cond_a

    .line 184
    .line 185
    invoke-interface {v8, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 186
    .line 187
    .line 188
    :cond_a
    invoke-static {v14}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    if-eqz v2, :cond_b

    .line 193
    .line 194
    goto :goto_6

    .line 195
    :cond_b
    move-object v9, v14

    .line 196
    :goto_6
    invoke-static {v1}, Ll/v9d0;->m(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Z

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    if-eqz v1, :cond_c

    .line 201
    .line 202
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getRoomId()Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_c

    .line 211
    .line 212
    invoke-static {v14, v10}, Ll/v9d0;->n(Ljava/util/List;Z)Ll/zbd0;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-interface {v9, v11, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 217
    .line 218
    .line 219
    :cond_c
    new-instance v0, Ll/scd0;

    .line 220
    .line 221
    invoke-virtual/range {p0 .. p0}, Lcom/p1/mobile/putong/live/base/data/BLiveRightInfo;->getAnchorName()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    if-nez v15, :cond_e

    .line 226
    .line 227
    if-eqz v13, :cond_d

    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_d
    move v5, v11

    .line 231
    goto :goto_8

    .line 232
    :cond_e
    :goto_7
    move v5, v10

    .line 233
    :goto_8
    const/4 v4, 0x1

    .line 234
    move-object/from16 v2, p2

    .line 235
    .line 236
    move-object v1, v9

    .line 237
    invoke-direct/range {v0 .. v5}, Ll/scd0;-><init>(Ljava/util/List;Ll/j9d0;Ljava/lang/String;ZZ)V

    .line 238
    .line 239
    .line 240
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    if-eqz v13, :cond_f

    .line 244
    .line 245
    invoke-interface {v8, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 246
    .line 247
    .line 248
    :cond_f
    if-eqz v15, :cond_10

    .line 249
    .line 250
    invoke-interface {v8, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 251
    .line 252
    .line 253
    :cond_10
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;

    .line 254
    .line 255
    sget-object v1, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->LIST_BOTTOM_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 256
    .line 257
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;-><init>(Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;)V

    .line 258
    .line 259
    .line 260
    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    new-instance v0, Ll/q9d0;

    .line 264
    .line 265
    move/from16 v1, p3

    .line 266
    .line 267
    invoke-direct {v0, v1}, Ll/q9d0;-><init>(Z)V

    .line 268
    .line 269
    .line 270
    invoke-static {v8, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 271
    .line 272
    .line 273
    return-object v8
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Z
    .locals 1

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->u7()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 10
    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/bean/UserRightType;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static n(Ljava/util/List;Z)Ll/zbd0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;Z)",
            "Ll/zbd0;"
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
    new-instance v1, Ll/s9d0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/s9d0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/zbd0;

    .line 15
    .line 16
    invoke-direct {p0, v0, p1}, Ll/zbd0;-><init>(Ljava/util/List;Z)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public static o(Ljava/util/List;Z)Ll/dbd0;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;Z)",
            "Ll/dbd0;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/util/Pair;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-direct {v0, v1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance p0, Ll/dbd0;

    .line 15
    .line 16
    iget-object p1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-direct {p0, p1, v0}, Ll/dbd0;-><init>(ZZ)V

    .line 33
    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    :goto_0
    if-ge p1, v1, :cond_4

    .line 44
    .line 45
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ll/d3q;

    .line 50
    .line 51
    instance-of v3, v2, Ll/scd0;

    .line 52
    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    check-cast v2, Ll/scd0;

    .line 56
    .line 57
    new-instance v0, Landroid/util/Pair;

    .line 58
    .line 59
    iget-boolean p0, v2, Ll/scd0;->i:Z

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :cond_1
    add-int/lit8 p1, p1, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    add-int/lit8 v1, v1, -0x1

    .line 75
    .line 76
    :goto_1
    if-lez v1, :cond_4

    .line 77
    .line 78
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Ll/d3q;

    .line 83
    .line 84
    instance-of v2, p1, Ll/scd0;

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    check-cast p1, Ll/scd0;

    .line 89
    .line 90
    new-instance v0, Landroid/util/Pair;

    .line 91
    .line 92
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 93
    .line 94
    iget-boolean p1, p1, Ll/scd0;->i:Z

    .line 95
    .line 96
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-direct {v0, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    add-int/lit8 v1, v1, -0x1

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    :goto_2
    new-instance p0, Ll/dbd0;

    .line 108
    .line 109
    iget-object p1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 110
    .line 111
    check-cast p1, Ljava/lang/Boolean;

    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast v0, Ljava/lang/Boolean;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-direct {p0, p1, v0}, Ll/dbd0;-><init>(ZZ)V

    .line 126
    .line 127
    .line 128
    return-object p0
.end method

.method public static p()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;"
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
    new-instance v1, Ll/dad0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/dad0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static q(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;ZLl/j9d0;)Ll/e9d0;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CHAT_UNDER_SHADE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    move-object v1, p0

    .line 6
    new-instance p0, Ll/h9d0;

    .line 7
    .line 8
    move p2, p1

    .line 9
    move-object p1, v1

    .line 10
    invoke-direct/range {p0 .. p5}, Ll/h9d0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    move-object v1, p0

    .line 15
    move v2, p1

    .line 16
    move-object v3, p3

    .line 17
    move v4, p4

    .line 18
    move-object v5, p5

    .line 19
    sget-object p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 20
    .line 21
    if-ne p2, p0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/ead0;

    .line 24
    .line 25
    invoke-direct/range {v0 .. v5}, Ll/ead0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 26
    .line 27
    .line 28
    return-object v0

    .line 29
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 30
    .line 31
    if-eq p2, p0, :cond_5

    .line 32
    .line 33
    sget-object p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 34
    .line 35
    if-ne p2, p0, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->PROFILE_CARD_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 39
    .line 40
    if-ne p2, p0, :cond_3

    .line 41
    .line 42
    new-instance v0, Ll/vcd0;

    .line 43
    .line 44
    invoke-direct/range {v0 .. v5}, Ll/vcd0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 49
    .line 50
    if-ne p2, p0, :cond_4

    .line 51
    .line 52
    new-instance v0, Ll/xbd0;

    .line 53
    .line 54
    invoke-direct/range {v0 .. v5}, Ll/xbd0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 55
    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_4
    const-string p0, "\u672a\u66fe\u5b9a\u4e49\u7684 UserRightType\uff0c\u8bf7\u68c0\u67e5"

    .line 59
    .line 60
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x0

    .line 64
    return-object p0

    .line 65
    :cond_5
    :goto_0
    new-instance v0, Ll/b9d0;

    .line 66
    .line 67
    invoke-direct/range {v0 .. v5}, Ll/b9d0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILjava/lang/String;ZLl/j9d0;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public static r(Lcom/p1/mobile/putong/live/base/bean/UserRightType;I)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->ENTER_ROOM_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->AVATAR_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->USER_MEDAL_MANAGE:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/base/bean/UserRightType;->CALL_EFFECT:Lcom/p1/mobile/putong/live/base/bean/UserRightType;

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    :cond_0
    rem-int/lit8 p1, p1, 0x2

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    if-ne p1, p0, :cond_1

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static s(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    new-instance v1, Ll/xad0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/xad0;-><init>(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public static t(Ljava/util/List;Lcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;ZLl/j9d0;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/bean/UserRightType;",
            "Ljava/lang/String;",
            "Z",
            "Ll/j9d0;",
            ")",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    move v4, v2

    .line 12
    :goto_0
    if-ge v4, v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    move-object v3, v2

    .line 19
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;

    .line 20
    .line 21
    move-object v5, p1

    .line 22
    move-object v6, p2

    .line 23
    move v7, p3

    .line 24
    move-object v8, p4

    .line 25
    invoke-static/range {v3 .. v8}, Ll/v9d0;->q(Lcom/p1/mobile/putong/live/base/data/BLiveRightItem;ILcom/p1/mobile/putong/live/base/bean/UserRightType;Ljava/lang/String;ZLl/j9d0;)Ll/e9d0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    move-object p1, v5

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move-object v5, p1

    .line 37
    invoke-static {v5, v0}, Ll/v9d0;->r(Lcom/p1/mobile/putong/live/base/bean/UserRightType;I)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    new-instance p0, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;->ENTER_ROOM_EFFECT_HOLDER:Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel;-><init>(Lcom/p1/mobile/putong/live/external/page/rights/list/model/RightHolderModel$HolderType;)V

    .line 48
    .line 49
    .line 50
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :cond_1
    return-object v1
.end method

.method public static u(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/e9d0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/u9d0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/u9d0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
