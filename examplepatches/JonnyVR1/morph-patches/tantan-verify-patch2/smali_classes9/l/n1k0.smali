.class public Ll/n1k0;
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/b2k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)Ll/a2k0;
    .locals 1

    .line 1
    new-instance v0, Ll/a2k0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/i1k0;->a:Ll/o1k0;

    .line 6
    .line 7
    invoke-direct {v0, p2, p0, p1}, Ll/a2k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;Ljava/lang/String;Ll/o1k0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->giftLevels:Ljava/util/List;

    .line 2
    .line 3
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;->giftLevels:Ljava/util/List;

    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Ljava/util/List;Ll/o1k0;Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftActInfo;)V
    .locals 1

    .line 1
    new-instance v0, Ll/a3k0;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/a3k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftActInfo;Ll/o1k0;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static d(Ll/b2k0;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b2k0;",
            ")",
            "Ljava/util/List<",
            "Ll/a2k0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/b2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->slotGiftInfos:Ljava/util/List;

    .line 6
    .line 7
    new-instance v2, Ll/m1k0;

    .line 8
    .line 9
    invoke-direct {v2, v0, p0}, Ll/m1k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/b2k0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1, v2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/o1k0;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;",
            "Ll/o1k0;",
            ")",
            "Ljava/util/List<",
            "Ll/i1k0;",
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
    new-instance v1, Ll/b2k0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/b2k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;Ll/o1k0;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->activityInfos:Ljava/util/List;

    .line 15
    .line 16
    new-instance v2, Ll/j1k0;

    .line 17
    .line 18
    invoke-direct {v2, v0, p1}, Ll/j1k0;-><init>(Ljava/util/List;Ll/o1k0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->slotGiftInfos:Ljava/util/List;

    .line 25
    .line 26
    new-instance v1, Ll/k1k0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/k1k0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public static f(Ll/b2k0;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->slotGiftInfos:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/l1k0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/l1k0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, -0x1

    .line 17
    if-ne p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    :cond_0
    return p0
.end method

.method public static g(Ll/b2k0;)Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/b2k0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfo;->slotGiftInfos:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Ll/l1k0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/l1k0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUpgradeGiftInfoItem;

    .line 17
    .line 18
    return-object p0
.end method

.method public static h(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p0, p1}, Ll/n1k0;->i(Ljava/lang/String;I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 9
    .line 10
    .line 11
    :try_start_1
    const-string p1, "templateUrl"

    .line 12
    .line 13
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-object p1, v0

    .line 18
    :catch_1
    move-object v0, p1

    .line 19
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static i(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "svga"

    .line 2
    .line 3
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, p0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, p0}, Ll/ere;->w(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/muj;->m(Ljava/lang/String;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-object v0
.end method
