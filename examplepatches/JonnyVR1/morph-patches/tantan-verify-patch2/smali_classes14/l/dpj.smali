.class public Ll/dpj;
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

.method public static synthetic a(Ll/etj;Ll/jjs;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/etj;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic b(Ll/jjs;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->needToPlayAnim:Z

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ll/hzj;)Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hzj;->a:Ljava/util/List;

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
    iget-object p0, p0, Ll/hzj;->a:Ljava/util/List;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->followStarResourceId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->chargeStarResourceId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p3, p0, v0, p1}, Ll/dpj;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/jjs;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e(ZLl/hzj;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Ll/hzj;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic f(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    iget v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/hiv;->l(I)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p3, v0}, Ll/dpj;->z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    new-instance p3, Ll/jjs;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->followStarResourceId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->chargeStarResourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-direct {p3, v0, p1, v1, p2}, Ll/jjs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public static synthetic g(Ljava/util/Date;Ll/jjs;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isNotPacketGift()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isValidPacketGift(Ljava/util/Date;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic h(ILl/hzj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/hzj;->b:I

    .line 2
    .line 3
    if-ne p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic i(Ll/etj;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/etj;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/zoj;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zoj;-><init>(Ll/etj;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/jjs;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static j(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;)Ll/xxj;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Ll/dpj;->k(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {p0, p1, v1}, Ll/dpj;->k(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v1, Ll/xxj;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/uxj;->d()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-direct {v1, v0, p0, p1}, Ll/xxj;-><init>(Ll/zxj;Ll/zxj;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v1
.end method

.method public static k(Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ll/uxj;Z)Ll/zxj;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v8, p2

    .line 4
    .line 5
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->getGiftTabs(Z)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v9

    .line 9
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;->getDefaultTabId(Z)I

    .line 10
    .line 11
    .line 12
    move-result v10

    .line 13
    invoke-interface {v9}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v11

    .line 17
    new-instance v12, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v13, 0x0

    .line 23
    move v5, v13

    .line 24
    move v14, v5

    .line 25
    :goto_0
    if-ge v14, v11, :cond_0

    .line 26
    .line 27
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;

    .line 32
    .line 33
    new-instance v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->entrances:Ljava/util/List;

    .line 39
    .line 40
    new-instance v4, Ll/loj;

    .line 41
    .line 42
    invoke-direct {v4, v1, v0, v2}, Ll/loj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;Ljava/util/List;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabGiftItems:Ljava/util/List;

    .line 49
    .line 50
    new-instance v4, Ll/noj;

    .line 51
    .line 52
    invoke-direct {v4, v2, v1, v0}, Ll/noj;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;Lcom/p1/mobile/putong/live/base/data/BLiveRoomTabGifts;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    new-instance v3, Ll/hzj;

    .line 59
    .line 60
    move-object v4, v3

    .line 61
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabId:I

    .line 62
    .line 63
    move-object v6, v4

    .line 64
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabName:Ljava/lang/String;

    .line 65
    .line 66
    move-object v7, v6

    .line 67
    invoke-virtual/range {p1 .. p1}, Ll/uxj;->b()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveTabGiftItem;->tabEntrance:Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 72
    .line 73
    move-object v15, v7

    .line 74
    move-object v7, v1

    .line 75
    move-object v1, v15

    .line 76
    invoke-direct/range {v1 .. v8}, Ll/hzj;-><init>(Ljava/util/List;ILjava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;Z)V

    .line 77
    .line 78
    .line 79
    invoke-interface {v12, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    add-int/lit8 v5, v5, 0x1

    .line 83
    .line 84
    add-int/lit8 v14, v14, 0x1

    .line 85
    .line 86
    move/from16 v8, p2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    new-instance v0, Ll/zxj;

    .line 90
    .line 91
    invoke-virtual/range {p1 .. p1}, Ll/uxj;->d()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-direct {v0, v12, v1, v10, v13}, Ll/zxj;-><init>(Ljava/util/List;Ljava/lang/String;IZ)V

    .line 96
    .line 97
    .line 98
    return-object v0
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ll/jjs;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x4

    .line 6
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->icon:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->url:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->name:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Ll/dpj;->s(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->title:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->subTitle:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v1}, Ll/dpj;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localSubtitle:Lcom/p1/mobile/putong/data/LangModel;

    .line 27
    .line 28
    invoke-static {p0}, Ll/dpj;->u(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 33
    .line 34
    new-instance p0, Ll/jjs;

    .line 35
    .line 36
    invoke-direct {p0, v0, p1, p2, p3}, Ll/jjs;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public static m()Ljava/util/Date;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public static n(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/etj;",
            ">;)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/voj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/voj;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v0, -0x1

    .line 11
    if-ne p0, v0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return p0
.end method

.method public static o(Ljava/util/List;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;I)I"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/goj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/goj;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 p1, -0x1

    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return p0
.end method

.method public static p(Ll/zxj;)I
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/zxj;->g()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zxj;->d()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_4

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_3

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    check-cast v4, Ll/hzj;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    iget v6, v4, Ll/hzj;->b:I

    .line 58
    .line 59
    if-ne v5, v6, :cond_2

    .line 60
    .line 61
    move-object v1, v4

    .line 62
    :cond_3
    if-eqz v1, :cond_1

    .line 63
    .line 64
    :cond_4
    if-nez v1, :cond_5

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/zxj;->d()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    return p0

    .line 71
    :cond_5
    iget p0, v1, Ll/hzj;->b:I

    .line 72
    .line 73
    return p0
.end method

.method public static q(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Ll/xoj;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/xoj;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/jyb;->w(Ljava/util/List;Ll/qcj;)Ljava/util/ArrayList;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static r(Ll/hzj;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hzj;",
            ")",
            "Ljava/util/List<",
            "Ll/etj;",
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
    if-eqz p0, :cond_2

    .line 7
    .line 8
    iget-object v1, p0, Ll/hzj;->a:Ljava/util/List;

    .line 9
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
    goto :goto_2

    .line 17
    :cond_0
    iget-object v1, p0, Ll/hzj;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v1}, Ll/dpj;->w(Ljava/util/List;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    mul-float/2addr v2, v3

    .line 31
    const/high16 v3, 0x41000000    # 8.0f

    .line 32
    .line 33
    div-float/2addr v2, v3

    .line 34
    float-to-double v2, v2

    .line 35
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    double-to-int v2, v2

    .line 40
    const/4 v3, 0x0

    .line 41
    :goto_0
    if-ge v3, v2, :cond_2

    .line 42
    .line 43
    mul-int/lit8 v4, v3, 0x8

    .line 44
    .line 45
    add-int/lit8 v5, v4, 0x8

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    new-instance v6, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-interface {v1, v4, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-direct {v6, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    check-cast v5, Ll/jjs;

    .line 79
    .line 80
    invoke-virtual {v5, v3}, Ll/jjs;->z(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    new-instance v4, Ll/etj;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/hzj;->c()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-direct {v4, v6, v5}, Ll/etj;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    add-int/lit8 v3, v3, 0x1

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    :goto_2
    return-object v0
.end method

.method public static s(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Ll/dpj;->x(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "zh"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    const-string v1, "zh-Hant"

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/LangModel;->zh_tw:Ljava/lang/String;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    const-string p0, ""

    .line 36
    .line 37
    return-object p0
.end method

.method public static t(Ljava/util/List;Z)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;Z)",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/toj;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/toj;-><init>(Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public static u(Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "JumpToScheme"

    .line 10
    .line 11
    iput-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->action:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftTabEntrance;->jumpUrl:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->scheme:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->click:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 18
    .line 19
    return-object v0
.end method

.method public static v(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, -0x1

    .line 12
    invoke-static {p0, p1, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/jjs;->i()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1}, Ll/jjs;->k()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTabBarTraceServerData(Ljava/lang/String;II)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static w(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;)",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/dpj;->m()Ljava/util/Date;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/poj;

    .line 6
    .line 7
    invoke-direct {v1, v0}, Ll/poj;-><init>(Ljava/util/Date;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static x(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static y(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/dpj;->q(Ljava/util/List;)Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/roj;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/roj;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;
    .locals 5
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_9

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 5
    .line 6
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->remain:I

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 9
    .line 10
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 13
    .line 14
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTime:J

    .line 15
    .line 16
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 17
    .line 18
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->fastGiftNum:I

    .line 19
    .line 20
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 21
    .line 22
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nextValidTime:J

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 25
    .line 26
    iput-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showOutside:Z

    .line 27
    .line 28
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 29
    .line 30
    iput-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->createdTime:J

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactStatus:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 37
    .line 38
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->expiredTimeText:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 45
    .line 46
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->labels:Ljava/util/List;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 49
    .line 50
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 53
    .line 54
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 57
    .line 58
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->discounts:Ljava/util/List;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 61
    .line 62
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 65
    .line 66
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 69
    .line 70
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_0

    .line 79
    .line 80
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/p1/mobile/putong/data/LangModel;

    .line 89
    .line 90
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localTag:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    :catch_0
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_1

    .line 99
    .line 100
    :try_start_1
    sget-object v1, Lcom/p1/mobile/putong/data/LangModel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Lcom/p1/mobile/putong/data/LangModel;

    .line 109
    .line 110
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 111
    .line 112
    :catch_1
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_2

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 121
    .line 122
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startTagColor:Ljava/lang/String;

    .line 123
    .line 124
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_3

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endTagColor:Ljava/lang/String;

    .line 135
    .line 136
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-nez v1, :cond_4

    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 145
    .line 146
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->rightTag:Ljava/lang/String;

    .line 147
    .line 148
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_5

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 157
    .line 158
    iput-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->startRightTagColor:Ljava/lang/String;

    .line 159
    .line 160
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    if-nez v1, :cond_6

    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 169
    .line 170
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->endRightTagColor:Ljava/lang/String;

    .line 171
    .line 172
    :cond_6
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 173
    .line 174
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    check-cast p0, Ll/jfv;

    .line 179
    .line 180
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 181
    .line 182
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    invoke-virtual {p0, v1}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    if-nez p0, :cond_7

    .line 191
    .line 192
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 193
    .line 194
    invoke-virtual {p0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isValidGiftType()Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    if-eqz v1, :cond_8

    .line 203
    .line 204
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 205
    .line 206
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 207
    .line 208
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->minWealthHierarchy:I

    .line 209
    .line 210
    int-to-long v3, p0

    .line 211
    cmp-long p0, v1, v3

    .line 212
    .line 213
    if-ltz p0, :cond_8

    .line 214
    .line 215
    move-object v0, p1

    .line 216
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 217
    .line 218
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    if-nez p0, :cond_9

    .line 223
    .line 224
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p0, v1}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    if-nez p0, :cond_9

    .line 235
    .line 236
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {p0, p1}, Ll/ere;->w(Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    :cond_9
    return-object v0
.end method
