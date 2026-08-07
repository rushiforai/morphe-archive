.class public Ll/zas;
.super Ll/p4;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;


# direct methods
.method public constructor <init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ll/oo2;",
            ">(",
            "Ll/las;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p4;-><init>(Ll/las;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/zas;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zas;->i()V

    return-void
.end method

.method public static synthetic e(Ll/zas;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zas;->h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    return-void
.end method

.method private g()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 7
    .line 8
    iget-object v2, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    new-array v3, v3, [Landroid/view/View;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    aput-object v2, v3, v4

    .line 30
    .line 31
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/immomo/velib/player/VideoEffectView;->setRenderMode(I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 40
    .line 41
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    invoke-static {}, Ll/bnl0;->y0()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    mul-int/lit16 v0, v0, 0xc8

    .line 57
    .line 58
    div-int/lit16 v0, v0, 0x177

    .line 59
    .line 60
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 61
    .line 62
    sget v3, Ll/bnl0;->e:I

    .line 63
    .line 64
    invoke-direct {v2, v3, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 65
    .line 66
    .line 67
    neg-int v0, v0

    .line 68
    div-int/2addr v0, v1

    .line 69
    const/high16 v1, 0x41f00000    # 30.0f

    .line 70
    .line 71
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 77
    .line 78
    iget-object v0, p0, Ll/p4;->c:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 79
    .line 80
    iget-object p0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 81
    .line 82
    invoke-virtual {v0, p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/velib/player/VideoEffectView;->isPlaying()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/p4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/zas;->g()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/zas;->j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/p4;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/immomo/velib/player/VideoEffectView;->isPlaying()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Ll/ynp0;->E(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-static {p0, v0}, Ll/ynp0;->v(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final f(Ljava/util/List;Ljava/util/List;)V
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

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ll/udl0;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/udl0;->b()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {p2}, Ll/udl0;->b()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p0, p1, p2}, Ll/zas;->f(Ljava/util/List;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4;->a:Ll/las;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/las;->R3()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    new-instance v0, Ll/hre;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getMixResId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/xas;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/xas;-><init>(Ll/zas;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/hre;->n(Ll/z20;)Ll/hre;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    new-instance v0, Ll/yas;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/yas;-><init>(Ll/zas;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ll/hre;->i(Ll/x20;)Ll/hre;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p0, Ll/zas;->d:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 29
    .line 30
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
