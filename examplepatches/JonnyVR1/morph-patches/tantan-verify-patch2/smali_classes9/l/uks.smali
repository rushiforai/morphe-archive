.class public Ll/uks;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;


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

.method public static synthetic a(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/uks;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/muj;->P(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/uks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZILjava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uks;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZILjava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/uks;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V

    return-void
.end method


# virtual methods
.method public final e(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;",
            "Ljava/util/List<",
            "Lcom/immomo/velib/anim/model/Element;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_4

    .line 6
    .line 7
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    :cond_2
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_4

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/immomo/velib/anim/model/Element;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/immomo/velib/anim/model/Element;->getId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsImageUrl()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/immomo/velib/anim/model/Element;->setUrl(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->typeIsText()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->value:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Lcom/immomo/velib/anim/model/Element;->setText(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    :goto_2
    return-void
.end method

.method public final f(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/uks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 2
    .line 3
    iget-object p2, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-virtual {p2, v0}, Lcom/immomo/velib/player/VideoEffectView;->setRenderMode(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p2, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    iget-object p2, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 31
    .line 32
    sget v0, Ll/bnl0;->e:I

    .line 33
    .line 34
    invoke-virtual {p1, p2, v0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Ll/muj;->N(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/uks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    invoke-static {p2, p0, p3}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZILjava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p3, p4, p1}, Ll/muj;->O(ILjava/lang/String;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    const/4 p4, 0x0

    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    return p4

    .line 10
    :cond_0
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 11
    .line 12
    .line 13
    iget-object p3, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 14
    .line 15
    invoke-static {p3, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/uks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->a()V

    .line 21
    .line 22
    .line 23
    invoke-static {p1, p4, p2}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 24
    .line 25
    .line 26
    return p4
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZLl/udl0;)V
    .locals 2

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_0

    .line 8
    .line 9
    :cond_0
    iget-boolean v0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->K:Z

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 24
    .line 25
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->M:Ljava/util/List;

    .line 32
    .line 33
    invoke-virtual {p4}, Ll/udl0;->b()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0, v0, v1}, Ll/uks;->e(Ljava/util/List;Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/muj;->c(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/sdl0$a;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/sdl0$a;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, p4}, Ll/sdl0$a;->c(Ll/udl0;)Ll/sdl0$a;

    .line 55
    .line 56
    .line 57
    move-result-object p4

    .line 58
    sget v0, Ll/sdl0;->j:I

    .line 59
    .line 60
    invoke-virtual {p4, v0}, Ll/sdl0$a;->d(I)Ll/sdl0$a;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    const/4 v0, 0x0

    .line 65
    invoke-virtual {p4, v0}, Ll/sdl0$a;->b(Ljava/util/List;)Ll/sdl0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    new-instance v0, Ll/gmw;

    .line 70
    .line 71
    invoke-direct {v0}, Ll/gmw;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p4, v0}, Ll/sdl0$a;->e(Ll/txl;)Ll/sdl0$a;

    .line 75
    .line 76
    .line 77
    move-result-object p4

    .line 78
    invoke-virtual {p4}, Ll/sdl0$a;->a()Ll/sdl0;

    .line 79
    .line 80
    .line 81
    move-result-object p4

    .line 82
    iget-object v0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 83
    .line 84
    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setVideoEffectConfig(Ll/sdl0;)V

    .line 85
    .line 86
    .line 87
    iget-object p4, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 88
    .line 89
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->prepare()V

    .line 90
    .line 91
    .line 92
    iget-object p4, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 93
    .line 94
    invoke-virtual {p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->start()V

    .line 95
    .line 96
    .line 97
    invoke-static {p1, p2}, Ll/muj;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 98
    .line 99
    .line 100
    iget-object p4, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 101
    .line 102
    new-instance v0, Ll/rks;

    .line 103
    .line 104
    invoke-direct {v0, p1, p2}, Ll/rks;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnPrepareListener(Lcom/immomo/velib/player/d$d;)V

    .line 108
    .line 109
    .line 110
    iget-object p4, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 111
    .line 112
    new-instance v0, Ll/sks;

    .line 113
    .line 114
    invoke-direct {v0, p0, p1, p2, p3}, Ll/sks;-><init>(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setCompletionListener(Ll/y9m;)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 121
    .line 122
    new-instance p4, Ll/tks;

    .line 123
    .line 124
    invoke-direct {p4, p0, p2, p3}, Ll/tks;-><init>(Ll/uks;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnErrorListener(Ll/z9m;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 132
    .line 133
    invoke-static {p1, p4, p0, p2}, Ll/muj;->E(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Ll/udl0;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 134
    .line 135
    .line 136
    const/4 p0, 0x0

    .line 137
    invoke-static {p2, p0, p3}, Ll/rre;->u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public k(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uks;->f(Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3, p4, p5}, Ll/uks;->l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 7

    .line 1
    invoke-static {p1, p2}, Ll/muj;->R(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/uks;->a:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 7
    .line 8
    .line 9
    const-string v0, "video"

    .line 10
    .line 11
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move-object v1, v0

    .line 16
    check-cast v1, Ll/jfl0;

    .line 17
    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v6, Ll/qks;

    .line 27
    .line 28
    invoke-direct {v6, p0, p1, p2, p3}, Ll/qks;-><init>(Ll/uks;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual/range {v1 .. v6}, Ll/jfl0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/jfl0$a;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/uks;->b:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;

    .line 35
    .line 36
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftExtLayer;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
